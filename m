Return-Path: <linux-arm-msm+bounces-74314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC7DB8D389
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 04:23:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AD0B7A17E4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 02:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBB7C1E5219;
	Sun, 21 Sep 2025 02:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OCuws1yH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B331E3769
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 02:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758421430; cv=none; b=jk8vVqHR7puAKcSLyX37jL/myCJtyUyc+oAFh1f/rTw26em972+NxSVJ/oxGCEguLcUqdBWmWxf0jJ1zp8V1aIjjbYsC5fn5e3yuksKCNaGyIRoEWcaddqujQ6FDwHB+k9/b8sjjookcL3x8vQBrcJ+rSpSVz+ngb2MUCJmCWeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758421430; c=relaxed/simple;
	bh=87Nk+ZWmSb27bCOlkOC6Iw47jKbgP8YZZElcoNC6RKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tyrfae1EXUrsFu7bWPbp4nVg4TDINn8HnIMcytybGjdsOtxivCPt8c5db2YeEAe86axM4vWGZTxcMqCVXUFEcHWMpLxKtVycYpRhW9HEY5Zhw61kWnV2jk3+jKbPQrhE/HFauImDQ7+7mG2kbQwzpPzZPuHQlP3YP+GU+h7Eat4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OCuws1yH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE127C4CEEB;
	Sun, 21 Sep 2025 02:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758421430;
	bh=87Nk+ZWmSb27bCOlkOC6Iw47jKbgP8YZZElcoNC6RKI=;
	h=From:To:Cc:Subject:Date:From;
	b=OCuws1yHe8PI9J+ANjoyRNGWqWuUpprlz4Q6qeEJi5oETz6drV503IKdxIvHiPQ6a
	 CQtow1ILRudSJRi56WZBq4PdiEKF3KCVmzyYnp/8rLSH/ZkgpdDH/VnrjTtDU5hgTb
	 /kKTm6ndn1riW3ZKqdXdLctuMhyetRwNysJFnn/mt+wr6elQ+4Pa6wHPPCwIlBTIky
	 KQB+3TNnOxjafecI9/J1wI2m+0jsdcIRQMNsa1E2jZjG9cSdvsHkQRJuWzxHpuw2gR
	 UHrr9rP+feeJmOmWlUNvIl996ULlvYp+tbv3gytOTH1SZ85vR0oAliycEqv8rnkdRZ
	 oN0SMCPe/nqyw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Monish Chunara <quic_mchunara@quicinc.com>,
	Yijie Yang <yijie.yang@oss.qualcomm.com>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>,
	Jie Zhang <quic_jiezh@quicinc.com>,
	Wenmeng Liu <quic_wenmliu@qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Antonio Rische <nt8r@protonmail.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Gaurav Kohli <quic_gkohli@quicinc.com>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
	Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>,
	Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
	Vandhiadevan Karunamoorthy <vkarunam@codeaurora.org>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Vikram Sharma <quic_vikramsa@quicinc.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
	Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [GIT PULL] More Qualocmm Arm64 DeviceTree updates for v6.18
Date: Sat, 20 Sep 2025 21:23:44 -0500
Message-ID: <20250921022346.598294-1-andersson@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit be6f43c64ca0f7929904f31c2a034c81093eb5c0:

  arm64: dts: qcom: x1e80100: Update GPU OPP table (2025-09-09 11:52:39 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.18-2

for you to fetch changes up to 2f695d3eac36601d383155e3bba189f06a0f750c:

  arm64: dts: qcom: Add MST pixel streams for displayport (2025-09-19 21:29:29 -0500)

----------------------------------------------------------------
More Qualocmm Arm64 DeviceTree updates for v6.18

Introduce the Hamoa IoT SOM and the Hamoa EVK board, the HP Omnibook
X14, the Particle Tachyon board, and the Samsung Galaxy S22.

On IPQ5018 another set of UART and I2C controllers are added.

On Lemans SDHCI and the camera subsystem is introduced, the USB
controllers are updated to the new flattened binding.
The Lemans EVK gains Ethernet definition, more QUP controllers and their
GPI DMA engines are defined. PCIe, SDHCI, remoteproc and iris video
accelerator are added as well.

On the Monaco platform GPU and GMU are introduced, the USB controller
nodes are updated to the new flattened binding. The GPU is enabled on
the EVK and the Ride boards.

SDCC and MDSS resets are defined on MSM8916, MSM8939 also gets the MDSS
reset.

On QCM2290 the camera clock interface is added.

On the QCS615 tsens and related thermal-zones are introduced.

On SDM845 the OnePlus 6 gains notifications LED, and the sensor core
(SLPI) is enabled on the Samsung Galaxy S9.

WiFi and Bluetooth is enabled on the SM8750 MTP.

The IRIS video accelerator is introduce for X Elite and enabled on a
variety of laptops.

DisplayPort controllers on a variety of boards are updated to describe
additional pixel clocks, used for MST.

----------------------------------------------------------------
Akhil P Oommen (1):
      arm64: dts: qcom: monaco-evk: Enable Adreno 623 GPU

Alok Tiwari (1):
      arm64: dts: qcom: sm8150: Fix reg base of frame@17c27000

Antonio Rische (1):
      arm64: dts: qcom: sdm845-enchilada: Add notification LED

Barnabás Czémán (1):
      arm64: dts: qcom: msm8953-xiaomi-daisy: fix cd-gpios

Bjorn Andersson (3):
      dt-bindings: vendor-prefixes: Add Particle Industries
      dt-bindings: arm: qcom: Add Particle Tachyon
      arm64: dts: qcom: qcm6490: Introduce the Particle Tachyon

Dmitry Baryshkov (1):
      arm64: dts: qcom: sm6350: correct DP compatibility strings

Dzmitry Sankouski (2):
      arm64: dts: qcom: sdm845-starqltechn: fix slpi reserved mem
      arm64: dts: qcom: sdm845-starqltechn: add slpi support

Eric Gonçalves (2):
      arm64: dts: qcom: add initial support for Samsung Galaxy S22
      dt-bindings: arm: qcom: sort sm8450 boards

Gaurav Kohli (1):
      arm64: dts: qcom: qcs615: Enable TSENS support for QCS615 SoC

Jens Glathe (3):
      dt-bindings: arm: qcom: Add HP Omnibook X14 AI X1P4200 variant
      arm64: dts: qcom: x1-hp-x14: Unify HP Omnibook X14 device tree structure
      arm64: dts: qcom: x1-hp-x14: Add support for X1P42100 HP Omnibook X14

Jessica Zhang (1):
      arm64: dts: qcom: Add MST pixel streams for displayport

Jie Zhang (2):
      arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
      arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU

Krishna Kurapati (3):
      arm64: dts: qcom: lemans-evk: Enable first USB controller in device mode
      arm64: dts: qcom: qcs8300: Flatten usb controller nodes
      arm64: dts: qcom: lemans: Flatten usb controller nodes

Krzysztof Kozlowski (3):
      arm64: dts: qcom: apq8016-sbc: Correct HDMI bridge #sound-dai-cells
      arm64: dts: qcom: apq8016-sbc: Drop redundant HDMI bridge status
      arm64: dts: qcom: sm8750-mtp: Add WiFi and Bluetooth

Loic Poulain (1):
      arm64: dts: qcom: qcm2290: Add CCI node

Manikanta Mylavarapu (1):
      arm64: dts: qcom: ipq5018: add QUP1 UART2 node

Mohd Ayaan Anwar (1):
      arm64: dts: qcom: lemans-evk: Enable 2.5G Ethernet interface

Monish Chunara (3):
      arm64: dts: qcom: lemans: Add SDHC controller and SDC pin configuration
      arm64: dts: qcom: lemans-evk: Add EEPROM and nvmem layout
      arm64: dts: qcom: lemans-evk: Enable SDHCI for SD Card

Nirmesh Kumar Singh (1):
      arm64: dts: qcom: lemans-evk: Add TCA9534 I/O expander

Stephan Gerhold (12):
      arm64: dts: qcom: msm8916: Add missing MDSS reset
      arm64: dts: qcom: msm8939: Add missing MDSS reset
      arm64: dts: qcom: msm8916: Add SDCC resets
      arm64: dts: qcom: sm8550/sm8650: Fix typo in IRIS comment
      arm64: dts: qcom: x1e80100: Add IRIS video codec
      arm64: dts: qcom: x1-el2: Disable IRIS for now
      arm64: dts: qcom: x1e80100-crd: Enable IRIS video codec
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Enable IRIS
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Enable IRIS
      arm64: dts: qcom: x1e80100-dell-inspiron-14-plus-7441: Enable IRIS
      arm64: dts: qcom: x1e80100-dell-latitude-7455: Enable IRIS
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable IRIS

Sushrut Shree Trivedi (1):
      arm64: dts: qcom: lemans-evk: Enable PCIe support

Vandhiadevan Karunamoorthy (1):
      arm64: dts: qcom: ipq5018: add QUP3 I2C node

Vikash Garodia (1):
      arm64: dts: qcom: lemans-evk: Enable Iris video codec support

Viken Dadhaniya (1):
      arm64: dts: qcom: lemans-evk: Enable GPI DMA and QUPv3 controllers

Vikram Sharma (1):
      arm64: dts: qcom: lemans: Add support for camss

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm8450: enable camera clock controller by default

Wasim Nazir (1):
      arm64: dts: qcom: lemans-evk: Enable remoteproc subsystems

Wenmeng Liu (2):
      arm64: dts: qcom: lemans: Add CCI definitions
      arm64: dts: qcom: lemans-evk: Add IMX577-based camera overlay

Yijie Yang (3):
      dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
      arm64: dts: qcom: Add HAMOA-IOT-SOM platform
      arm64: dts: qcom: Add base HAMOA-IOT-EVK board

Ziyue Zhang (1):
      arm64: dts: qcom: lemans: Add PCIe lane equalization preset properties

 Documentation/devicetree/bindings/arm/qcom.yaml    |   10 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    9 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |    6 +-
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         | 1222 ++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |  619 ++++++++
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |   25 +
 .../dts/qcom/lemans-evk-camera-csi1-imx577.dtso    |   97 ++
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |  363 +++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |   15 +-
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  693 ++++++++-
 arch/arm64/boot/dts/qcom/monaco-evk.dts            |   14 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |    4 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |    2 +
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts  |    2 +-
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |   50 +
 .../boot/dts/qcom/qcm6490-particle-tachyon.dts     |  864 +++++++++++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |   18 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              |  190 ++-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |   10 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |    3 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   23 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   72 +-
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |   28 +
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |   31 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   15 +-
 arch/arm64/boot/dts/qcom/sm6150.dtsi               |  206 ++-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   10 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   10 +-
 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts    |  145 ++
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   11 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  147 +-
 arch/arm64/boot/dts/qcom/x1-el2.dtso               |    5 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   | 1544 ++++++++++++++++++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |    5 +
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |    4 +
 .../qcom/x1e80100-dell-inspiron-14-plus-7441.dts   |    5 +
 .../boot/dts/qcom/x1e80100-dell-latitude-7455.dts  |    5 +
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |    5 +
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1544 +-------------------
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |    5 +
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  117 +-
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     |   33 +
 47 files changed, 6464 insertions(+), 1762 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts

