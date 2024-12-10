load("@rules_mypy//mypy:mypy.bzl", "mypy")
load("@rules_pydeps//pydeps:pydeps.bzl", "deps_enforcer_aspect_factory")

deps_enforcer = deps_enforcer_aspect_factory(
    pip_deps_index = Label("@reqs//:pip_deps_index"),
    suppression_tags = ["no-deps", "no-lint"],
    output_groups = ["lint"],
    ignored_target_names = ["init"],
)

mypy_aspect = mypy(
    mypy_cli = Label("//:mypy_cli"),
    mypy_ini = Label("//:mypy.ini"),
    cache = False,
    suppression_tags = ["no-lint", "no-mypy"],
)
