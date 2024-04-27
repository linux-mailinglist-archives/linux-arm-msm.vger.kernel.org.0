Return-Path: <linux-arm-msm+bounces-18735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ED58B4754
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 20:00:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1282DB21898
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 17:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386B44EB39;
	Sat, 27 Apr 2024 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDc8Yl+w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B61A938
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Apr 2024 17:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714240796; cv=none; b=ZKVgkv1o+OiPyQAlMjubdSeJwkHUNDPex/XBvpJYWmtwWdzJqMmuptEomQbHdBfBcWLLJAcFIevnF/Kzs1y1rj99lSNBwc1Fuk5h6x7Qb/B9X1qtZM2qZW/X/PiK91n2qrxHj2yk5nRWDe6hxgvSjrKw7GIEm1aUAs3Q/pAfegk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714240796; c=relaxed/simple;
	bh=f2SYNdDO7zUOmBJzgoemsXi5+RZWU+lIGS981HTTkQg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HyQov62Rvvjn+9cFbXRdb+gmW8n2vFgWoPRRG8JQeNPZvZ2hIpoxNMce6D+QsOevb2hPIh5968SxHOvccsa8VH+ef7bRYMG6GZ+0kY4M1BOkG8D3XDdpDwLjl0yYRXpav/J4VdNzBnTzK/Fpmwn3GlPZ20QEsimYTtMqflURaZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDc8Yl+w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F150C113CE;
	Sat, 27 Apr 2024 17:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714240795;
	bh=f2SYNdDO7zUOmBJzgoemsXi5+RZWU+lIGS981HTTkQg=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=JDc8Yl+wkOCos2Xy7dET8ZJN54nlb3MCky8rzodqe8bvSyIND1LEh6tTRRHBOnnsi
	 n/SfWrhZ9qqQu4AfcPcDie2Nf8kivmevnQD1FeQ8I5kc5b12dG60bNl57dLcELfjWk
	 NxVzPxuw8gQUs4r0OJaYQycZLeDSMUyQ2ek1NT0vG8dBFndhciAppQm3PXFDP7Cdb6
	 snYTA6ypF/sZWU9Gy5XDcOT1gowQp0Ksqo+re4dVHkD3xvPfx6wXdMlHNJpMWbhPuG
	 xIbr71nTb42FcYvJmBE1EM41s/3q2jL7gImUL7JDJPB5GJdBo0IsAUKEmOErXXNDR9
	 ZDy4z8knk08Jg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Anton Bambura <jenneron@postmarketos.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Jianhua Lu <lujianhua000@gmail.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Komal Bajaj <quic_kbajaj@quicinc.com>,
	=?UTF-8?q?Pawe=C5=82=20Owoc?= <frut3k7@gmail.com>,
	Sebastian Raase <linux@sraa.de>,
	Stephen Boyd <swboyd@chromium.org>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Hui Liu <quic_huliu@quicinc.com>,
	Joe Mason <buddyjojo06@outlook.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Ling Xu <quic_lxu5@quicinc.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>,
	Raymond Hackley <raymondhackley@protonmail.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Ritesh Kumar <quic_riteshk@quicinc.com>,
	Rong Zhang <i@rong.moe>,
	Siddharth Manthan <siddharth.manthan@gmail.com>,
	Udipto Goswami <quic_ugoswami@quicinc.com>,
	Umang Chheda <quic_uchheda@quicinc.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.10
Date: Sat, 27 Apr 2024 12:59:50 -0500
Message-ID: <20240427175951.1439887-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.10

for you to fetch changes up to 873d845a357a4d89700cb1bb5b3da68890756f50:

  dt-bindings: arm: qcom: Add Samsung Galaxy S5 China (kltechn) (2024-04-23 08:00:06 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree updates for v6.10

Support for Sony Xperia 1V, on the SM8550 platform, is added.

On IPQ8074, UART6 is described and unused gpios from QPIC are removed.

Backlight and touchscreen are described on Samsung Grand Prime devices.

RGB LED is added to Sony Xperia "Yoshino" devices, on which the
volume-up key definition is corrected as well.

Light Pulse Generator node is added to PM6150L PMIC, and blocks related
to USB Type-C on PM6150 are added.

On QCS6490 Rb3Gen2 UFS storage, USB Type-C management, a couple of
remoteprocs and both USB Type-C and native DisplayPort are enabled.
For the related IDP display is enabled, and the PMIC volume and power
buttons are described.
The inline crypto engine is added for SC7280, and an additional turbo
frequency is added to the MDP.

USB Type-C port management is introduce for the QRB2210 RB1. WiFi
firmware-name qualifier is added to both RB1 and RB2 boards.
The LMH node is added for the QCM2290, to configure the thresholds as
well as provide thermal pressure input.

The regulator range is adjusted for SD-card IO on SA8155P ADP, to allow
UHS modes.

The unused DCC is disabled on SC7180, and unused PMIC gpio block is
disabled on Trogdor.

For Lenovo Flex 5G, on SC8180X, the GPU firmware path is aligned with
agreed upon firmware structure. The frequency of the I2C bus for
touchpad is brought up to mitigate missing events. A number of
additional cleanups are introduced.

For SC8280XP GICv3 ITS is wired up for PCIe. EAS properties ad
introduced. A PS_HOLD-based restart node is introduced and acts as a
fallback if other mechanisms are unavailable to restart the board.
QFPROM is described, missing LMH interrupts for thermal pressure are
added. The TCSR download mode register is added, to allow configuring
if download mode should be entered on a crash.

USB Type-C handling is introduce for Fairphone FP3 as well.

On SM6350 crypto engine and DisplayPort controllers are introduced.

WiFi is enabled on the SM8150 Hardware Development Kit (HDK)

USB PD properties are added on Xiaomi Mi Pad 5 Pro devices.

Interconnect paths are added for UFS on SM8350, to ensure the bus is
voted for when the controller is operating.

On SM8550 the DMA coherency properties are corrected for SMMU and a few
consumers. Missing DWC3 quirks are added and the SNPS PHY parameters are
adjusted. Fastrpc banks are marked non-secure as needed.

The GPU description is introduced on SM8650, and enabled on the QRD. A
missing reserved-memory node is added, as is a few missing fastrpc
compute banks, and the non-secure-domain flag for other banks.

On X1 Elite SPMI support is added, together with PMIC definitons. The
link properties for DP3 are corrected, and audio-related resets are
introduced. SoundWire properties are corrected.

Nodes describing the PCIe bridge under the host controller is added
for a bunch of platforms.

The GPIO carrying orientation information for USB Type-C is added across
Fairphone 5, Lenovo Flex 5G, Lenovo Thinkpad X13s, SM8350 and SM845
HDKs.

A few dtbTool-specific compatibles for msm8916 is dropped from the
bindings.

A number of DeviceTree binding validation issues are corrected.

----------------------------------------------------------------
Abel Vesa (7):
      arm64: dts: qcom: x1e80100: Add SPMI support
      arm64: dts: qcom: x1e80100: Add dedicated pmic dtsi
      arm64: dts: qcom: x1e80100-crd: Add repeater nodes
      arm64: dts: qcom: x1e80100-qcp: Add repeater nodes
      arm64: dts: qcom: x1e80100: Drop the link-frequencies from mdss_dp3_in
      arm64: dts: qcom: x1e80100-crd: Add data-lanes and link-frequencies to DP3
      arm64: dts: qcom: x1e80100-qcp: Add data-lanes and link-frequencies to DP3

Anton Bambura (5):
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: fix GPU firmware path
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: set names for i2c hid nodes
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: move pinctrl to appropriate nodes
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: set touchpad i2c frequency to 1 MHz
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: Allow UFS regulators load/mode setting

Bjorn Andersson (8):
      arm64: dts: qcom: qcs6490-rb3gen2: Name the regulators
      Merge branch 'arm64-for-6.10' onto 'v6.9-rc1'
      arm64: dts: qcom: sc7280: Enable MDP turbo mode
      arm64: dts: qcom: qcs6490-rb3gen2: Add DP output
      arm64: dts: qcom: qcs6490-rb3gen2: Enable adsp and cdsp
      arm64: dts: qcom: qcs6490-rb3gen2: Introduce USB redriver
      arm64: dts: qcom: qcs6490-rb3gen2: Enable USB Type-C display
      arm64: dts: qcom: qcs6490-rb3gen2: Enable UFS

Caleb Connolly (1):
      arm64: dts: qcom: sdm845-db845c: make pcie0_3p3v_dual always-on

Danila Tikhonov (3):
      arm64: dts: qcom: pm6150: define USB-C related blocks
      arm64: dts: qcom: sc7180: Fix UFS PHY clocks
      arm64: dts: qcom: pm6150l: add Light Pulse Generator device node

Dmitry Baryshkov (15):
      arm64: dts: qcom: qrb2210-rb1: enable USB-C port handling
      arm64: dts: qcom: sc8180x: drop legacy property #stream-id-cells
      arm64: dts: qcom: sc8180x: Drop flags for mdss irqs
      arm64: dts: qcom: sc8180x: add dp_p1 register blocks to DP nodes
      arm64: dts: qcom: sm8350: Add interconnects to UFS
      dt-bindings: arm: qcom: drop dtbTool-specific compatibles
      arm64: dts: qcom: msm8916: drop dtbTool-specific compatibles
      arm64: dts: qcom: sm8150-hdk: enable WiFI support
      dt-bindings: soc: qcom: pmic-glink: allow orientation-gpios
      arm64: dts: qcom: sm8350-hdk: add USB-C orientation GPIO
      arm64: dts: qcom: sm8450-hdk: add USB-C orientation GPIO
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: add USB-C orientation GPIOs
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: add USB-C orientation GPIOs
      arm64: dts: qcom: qrb2210-rb1: add firmware-name qualifier to WiFi node
      arm64: dts: qcom: qrb4210-rb1: add firmware-name qualifier to WiFi node

Elliot Berman (1):
      arm64: dts: qcom: sm8650: Add missing reserved memory for chipinfo

Hui Liu (1):
      arm64: dts: qcom: qcm6490-idp: enable PMIC Volume and Power buttons

Jianhua Lu (2):
      arm64: dts: qcom: sm8250-xiaomi-elish: add usb pd negotiation support
      arm64: dts: qcom: sm8250-xiaomi-elish: set pm8150b_vbus regulator-min-microamp and regulator-max-microamp

Joe Mason (1):
      arm64: dts: qcom: msm8916-samsung-fortuna: Add touchscreen

Johan Hovold (2):
      arm64: dts: qcom: sc8280xp: add missing PCIe minimum OPP
      arm64: dts: qcom: sc8280xp: enable GICv3 ITS for PCIe

Komal Bajaj (2):
      arm64: dts: qcom: qcm6490-idp: Enable various remoteprocs
      arm64: dts: qcom: qcs6490-rb3gen2: Enable various remoteprocs

Konrad Dybcio (12):
      arm64: dts: qcom: sc8280xp: Add missing LMH interrupts
      arm64: dts: qcom: sc8280xp: Add QFPROM node
      arm64: dts: qcom: sc8280xp: Add PS_HOLD restart
      arm64: dts: qcom: sc8280xp: Describe TCSR download mode register
      arm64: dts: qcom: msm8998-yoshino: Enable RGB led
      dt-bindings: arm: qcom: Add Xperia 1 V
      arm64: dts: qcom: sm8550: Mark QUPs and GPI dma-coherent
      arm64: dts: qcom: sm8550: Mark APPS SMMU as dma-coherent
      arm64: dts: qcom: sm8550: Add missing DWC3 quirks
      arm64: dts: qcom: sm8550: Mark DWC3 as dma-coherent
      arm64: dts: qcom: Add SM8550 Xperia 1 V
      arm64: dts: qcom: sc8280xp: Fill in EAS properties

Krishna Kurapati (1):
      arm64: dts: qcom: sc8280xp: Add missing hs_phy_irq in USB nodes

Krzysztof Kozlowski (5):
      arm64: dts: qcom: x1e80100: correct SWR1 pack mode
      arm64: dts: qcom: x1e80100-crd: switch WSA8845 speakers to shared reset-gpio
      arm64: dts: qcom: pm6150: correct Type-C compatible
      arm64: dts: qcom: apq8016-sbc: correct GPIO LEDs node names
      arm64: dts: qcom: sdx75: add unit address to soc node

Ling Xu (1):
      arm64: dts: qcom: sm8650: Add three missing fastrpc-compute-cb nodes

Loic Poulain (1):
      arm64: dts: qcom: qcm2290: Add LMH node

Luca Weiss (6):
      arm64: dts: qcom: sm6350: Add Crypto Engine
      arm64: dts: qcom: sdm632-fairphone-fp3: enable USB-C port handling
      arm64: dts: qcom: sc7280: Add inline crypto engine
      dt-bindings: arm: qcom: Add Sony Xperia Z3
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add USB-C orientation GPIO
      arm64: dts: qcom: sm6350: Add DisplayPort controller

Manivannan Sadhasivam (16):
      arm64: dts: qcom: sm8250: Add PCIe bridge node
      arm64: dts: qcom: sdm845: Add PCIe bridge node
      arm64: dts: qcom: sm8150: Add PCIe bridge node
      arm64: dts: qcom: sm8350: Add PCIe bridge node
      arm64: dts: qcom: sm8450: Add PCIe bridge node
      arm64: dts: qcom: sm8550: Add PCIe bridge node
      arm64: dts: qcom: sm8650: Add PCIe bridge node
      arm64: dts: qcom: sa8775p: Add PCIe bridge node
      arm64: dts: qcom: sc8280xp: Add PCIe bridge node
      arm64: dts: qcom: msm8998: Add PCIe bridge node
      arm64: dts: qcom: sc7280: Add PCIe bridge node
      arm64: dts: qcom: qcs404: Add PCIe bridge node
      arm64: dts: qcom: sc8180x: Add PCIe bridge node
      arm64: dts: qcom: msm8996: Add PCIe bridge node
      arm64: dts: qcom: ipq8074: Add PCIe bridge node
      arm64: dts: qcom: ipq6018: Add PCIe bridge node

Neil Armstrong (7):
      arm64: dts: qcom: sm8450: add missing qcom,non-secure-domain property
      arm64: dts: qcom: sm8550: add missing qcom,non-secure-domain property
      arm64: dts: qcom: sm8650: add missing qcom,non-secure-domain property
      arm64: dts: qcom: sm8650: fix usb interrupts properties
      arm64: dts: qcom: sm8650: remove useless enablement of mdss_mdp
      arm64: dts: qcom: sm8650: add GPU nodes
      arm64: dts: qcom: sm8650-qrd: enable GPU

Paweł Owoc (2):
      arm64: dts: qcom: ipq8074: Add QUP UART6 node
      arm64: dts: qcom: ipq8074: Remove unused gpio from QPIC pins

Raymond Hackley (1):
      arm64: dts: qcom: msm8916/39-samsung-a2015: Add connector for MUIC

Richard Acayan (1):
      arm64: dts: qcom: sdm670-google-sargo: add panel

Ritesh Kumar (1):
      arm64: dts: qcom: qcm6490-idp: add display and panel

Rong Zhang (1):
      dt-bindings: arm: qcom: Add Samsung Galaxy S5 China (kltechn)

Sebastian Raase (2):
      arm64: dts: qcom: sdm630-nile: add pinctrl for camera key
      arm64: dts: qcom: msm8998-yoshino: fix volume-up key

Siddharth Manthan (1):
      arm64: dts: qcom: msm8916-samsung-fortuna: Add PWM backlight

Stephen Boyd (2):
      arm64: dts: qcom: sc7180: Disable pmic pinctrl node on Trogdor
      arm64: dts: qcom: sc7180: Disable DCC node by default

Udipto Goswami (1):
      arm64: dts: qcom: sm8450: Update SNPS Phy parameters for QRD platform

Umang Chheda (1):
      arm64: dts: qcom: qcm6490-idp: Name the regulators

Volodymyr Babchuk (1):
      arm64: dts: qcom: sa8155p-adp: lower min volt for L13C regulator

 Documentation/devicetree/bindings/arm/qcom.yaml    |  17 +-
 .../bindings/soc/qcom/qcom,pmic-glink.yaml         |  14 -
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |  12 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  10 +
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  41 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |   2 +-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts           |   2 +-
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |   6 +
 .../dts/qcom/msm8916-samsung-e2015-common.dtsi     |   6 +
 .../dts/qcom/msm8916-samsung-fortuna-common.dtsi   |  83 +++
 .../dts/qcom/msm8916-samsung-rossa-common.dtsi     |  12 +
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts    |   6 +
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  14 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  30 +
 .../boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi |  67 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  10 +
 arch/arm64/boot/dts/qcom/pm6150.dtsi               |   4 +-
 arch/arm64/boot/dts/qcom/pm6150l.dtsi              |  10 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |  56 +-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |   2 +
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           | 189 +++++
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |  10 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       | 251 ++++++-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  61 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |   1 +
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |   2 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  20 +
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |   1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  24 +
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |  59 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  53 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  22 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 110 ++-
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |   9 +
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |  31 +-
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts   |  64 ++
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   6 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  20 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |   2 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 119 ++++
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |  16 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  20 +
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |  11 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  30 +
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  26 +
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |   1 +
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |   8 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  23 +
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    | 779 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  42 +-
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   4 -
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |  12 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 255 ++++++-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |  47 +-
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |  51 ++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  27 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  46 +-
 60 files changed, 2720 insertions(+), 148 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi

