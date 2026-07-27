# build-deb-pkgs

openrtm.orgで管理しているdebパッケージを生成するスクリプトを定義

## How to build

OpenRTP以外はスクリプト内で対象のソースをcloneしているので、スクリプトを実行するだけでdebパッケージを生成できる。
OpenRTPは[openrtm.org](https://openrtm.org/pub/openrtp/packages/)から最新バージョンの日本語用Linuxパッケージをスクリプトと同じディレクトリに予めダウンロードしておく必要がある。

- OpenRTPのダウンロード例
```shell
$ wget https://openrtm.org/pub/openrtp/packages/2.1.0.v20260508/eclipse416-openrtp210v20260508-ja-linux-gtk-x86_64.tar.gz
```

スクリプト実行で生成されるパッケージ詳細は以下の通り

### C++

```shell
$ sh build-cxx.sh 
$ ls cxx-deb-pkgs/
openrtm2_2.1.0-0_amd64.buildinfo  openrtm2-doc_2.1.0-0_all.deb        openrtm2-ros2-tp_2.1.0-0_amd64.deb
openrtm2_2.1.0-0_amd64.changes    openrtm2-example_2.1.0-0_amd64.deb  openrtm2-ssm-tp_2.1.0-0_amd64.deb
openrtm2_2.1.0-0_amd64.deb        openrtm2-idl_2.1.0-0_amd64.deb      openrtm2-ssm-tp-dbgsym_2.1.0-0_amd64.ddeb
openrtm2-dev_2.1.0-0_amd64.deb    openrtm2-naming_2.1.0-0_amd64.deb
```

### Python

```shell
$ sh build-python.sh
$ ls python-deb-pkgs/
openrtm2-python3_2.1.0-0_amd64.changes  openrtm2-python3_2.1.0-0_amd64.deb  openrtm2-python3-example_2.1.0-0_amd64.deb
```

### Java

```shell
$ sh build-java.sh
$ ls java-deb-pkgs/
openrtm2-java_2.1.0-0_amd64.buildinfo  openrtm2-java_2.1.0-0_amd64.deb    openrtm2-java-example_2.1.0-0_amd64.deb
openrtm2-java_2.1.0-0_amd64.changes    openrtm2-java-doc_2.1.0-0_all.deb
```

### OpenRTP

```shell
$ sh build-openrtp.sh
$ ls openrtp-deb-pkgs/
openrtp2_2.1.0-0_amd64.deb
```
- OpenRTPの場合、あらかじめビルド済みパッケージをダウンロードしておかないと以下のメッセージが出ます
```shell
$ sh build-openrtp.sh
Not found all-in-package.(eclipse*ja-linux-gtk-x86_64.tar.gz)
```

### choreonoid-corba

```shell
$ sh build-cnoid-corba.sh
$ ls cnoid-corba-deb-pkgs/
choreonoid-corba_2.4.0-1_amd64.buildinfo  choreonoid-corba_2.4.0-1_amd64.deb
choreonoid-corba_2.4.0-1_amd64.changes    choreonoid-corba-dbgsym_2.4.0-1_amd64.ddeb
```

### choreonoid-openrtm

```shell
$ sh build-cnoid-openrtm.sh
$ ls cnoid-openrtm-deb-pkgs/
choreonoid-openrtm_2.4.0-1_amd64.buildinfo  choreonoid-openrtm_2.4.0-1_amd64.deb
choreonoid-openrtm_2.4.0-1_amd64.changes    choreonoid-openrtm-dbgsym_2.4.0-1_amd64.ddeb
```

### choreonoid-openrtm-python

```shell
$ sh build-cnoid-openrtm-py.sh
$ ls cnoid-openrtm-py-deb-pkgs/
choreonoid-openrtm-python_2.4.0-1_amd64.buildinfo  choreonoid-openrtm-python_2.4.0-1_amd64.deb
choreonoid-openrtm-python_2.4.0-1_amd64.changes    choreonoid-openrtm-python-dbgsym_2.4.0-1_amd64.ddeb
```
