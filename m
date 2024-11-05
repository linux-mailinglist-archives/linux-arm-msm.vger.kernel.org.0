Return-Path: <linux-arm-msm+bounces-37070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F387D9BD2CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 17:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 222671C2210B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 16:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17621DC075;
	Tue,  5 Nov 2024 16:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZjOMwQR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2831DC04D
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Nov 2024 16:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730825345; cv=none; b=igqrhw71bxc6A8BSwq3PL00WDakOpSkeBTK/lj7OsLMog7NN6ZK6/HOb6GMEMyLYXQv/a5lzpNJuA1VeuKNOe5riHcJXWfPl8dqzMwaLFBpeplD6dkusJ6CLRXSTIJfl87zTpPmzDSlQYTJmRKVJtLe4pLVZyvKnRZV8ol54NAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730825345; c=relaxed/simple;
	bh=Vhm74JE/32/5am9D38BgIPqzhIeixvIp5eGDIh2BuU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V5iyWjM/6xeVQqVWip54yFMIJcBfPvXUrDzEjW7zMvlMKK9Xp2tsHVDIJrL9d4vSsmm2xN/wwTJcDSzT1MPt0NgvrOjvKqbeR6uWLnS6eqPgzFJK+pXPaiiyS7oBOXrlvgcINeroB0pP+LlpXkKp547b8sqe5XhtQ70YM8SeQ40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZjOMwQR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88223C4CECF;
	Tue,  5 Nov 2024 16:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730825345;
	bh=Vhm74JE/32/5am9D38BgIPqzhIeixvIp5eGDIh2BuU0=;
	h=From:To:Cc:Subject:Date:From;
	b=eZjOMwQRwFCbCP4R1YtvzVOQsG8awqUDpOZEgcTM8mO5uI9bMAbSWHC2ZqjYnSy4E
	 5k0FFxdMgMjnB0lbkJfrvS7Sn4yS+VefNbwrsXTeNealz6MCDlyh7vTu6FHXDfKgiY
	 uuKDMoITa0Rnx7t76dqXksQxahRAPZr6HTVLedIpRmAy2Vg8QVzhLVXjujEEfFrJE6
	 y5yf7WkoUUkN77Lj5HCgKThlThXHQEGm5NwSsxvM6gtEsGFP5td+C/T+5QJ2Sar48a
	 Xtx12C3ug/8hnuXRXj1djL/GEyeXFKWT9x6XQatKGABiJPR4HzG6vYZQz5AxnPtxvh
	 AnWNsSEMqZ0Sg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Eugene Lepshy <fekz115@gmail.com>,
	Jonathan Marek <jonathan@marek.ca>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Arnaud Vrac <avrac@freebox.fr>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Manish Pandey <quic_mapa@quicinc.com>,
	Marc Gonzalez <mgonzalez@freebox.fr>,
	Maya Matuszczyk <maccraft123mc@gmail.com>,
	Miaoqing Pan <quic_miaoqing@quicinc.com>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Sachin Gupta <quic_sachgupt@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Vedang Nagar <quic_vnagar@quicinc.com>,
	Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree changes for v6.13
Date: Tue,  5 Nov 2024 08:48:59 -0800
Message-ID: <20241105164901.7787-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.13

for you to fetch changes up to d40fd02c1faf8faad57a7579b573bc5be51faabe:

  arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add cma heap for libcamera softisp support (2024-11-01 08:59:18 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree changes for v6.13

Introduce descriptions of the 8cx Gen3-based Microsoft Surface Pro 9 5G,
X Elite based Dell XPS 13 9345, the QCS9100 platform and the "Ride"
development boards thereon, and the SM7325 platform and the Nothing
Phone 1.

MSM8998 gains support for HDMI. The Lenovo Miix 630 gains support for
volume keys, audio and sensor DSPs, touchscreen, and its specific WiFi
calibration variant.

On QCM6490, Fairphone FP5 gains a thermistor adjacent to UFS/RAM, while
the IDP gains UFS and WiFi support. For QCS6490 changes to Rb3Gen2
enables WiFi, Venus, PCIe, SD-card, and volume keys. Adreno speedbins
are adjusted and PMU nodes' compatibles for the two clusters are
corrected.

The DB845C/RB3 and QRB5165 RB5 vision mezzanines are converted to
DeviceTree overlays, and both gains CMA heap for libcamera to use.

SA8775P gains GPI DMA support, support for controlling download mode
(bootloader-assisted ramdump support), additional UARTs, and qcrypto
support. The "Ride" development board gains WiFi and Bluetooth support.

On SC8280XP (8cx Gen3) another UART is described, used in the
Microsoft Surface 9 5G. The WiFi/BT combo chip's power management unit
is described on the CRD and Lenovo ThinkPad X13s.

On SDM630/660 the GPU SMMU and clock controller is added, as is the
A2Noc and LPASS SMMU, and the DSP-based WiFi device. GPU, modem DSP and
WiFi is then enabled on the Inforce 6560 development board.

On SM8450 Hardware Development Kit, the WCN6855 is modelled to enable
WiFi and Bluetooth. A "global" interrupt is defined on SM8450 PCIe RC
controller, to enable hotplug.

On X Elite, USB Type-C controllers are marked as usb-role-switch
capable, the GICv3 ITS is enabled for PCIe. TCSR region is described and
wired up to allow setting and cleaning the download mode
(bootloader-assisted ramdump) flag, and residency numbers for C4/C5 are
updated.

USB role switch is enabled on Lenovo ThinkPad T14s and the ASUS Vivobook
S15. The T14s also gains support for a second source trackpad. The
Microsoft Surface Laptop gains LID switch and the USB Type-A connector
attached to the multiport controller is enabled. The CRD has its HID
device power supplies described.

Application SMMU is flagged as DMA coherent across QDU1000, SC7180,
SC8180X, SC8280XP, SDM670, SDM845, SM8150, SM8350, SM8450, and X1E80100.

In addition to this, the effort to improve style and binding compliance
continued.

----------------------------------------------------------------
Abel Vesa (2):
      arm64: dts: qcom: x1e80100-slim7x: Drop orientation-switch from USB SS[0-1] QMP PHYs
      arm64: dts: qcom: x1e80100-vivobook-s15: Drop orientation-switch from USB SS[0-1] QMP PHYs

Aleksandrs Vinarskis (4):
      dt-bindings: arm: qcom: Add Dell XPS 13 9345
      arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345
      arm64: dts: qcom: x1e80100-dell-xps13-9345: route edp-panel enable gpio
      arm64: dts: qcom: x1e80100-dell-xps13-9345: fix nvme regulator boot glitch

Arnaud Vrac (1):
      arm64: dts: qcom: msm8998: add HDMI nodes

Bartosz Golaszewski (7):
      arm64: dts: qcom: sm8650: extend the register range for UFS ICE
      arm64: dts: qcom: sm8550: extend the register range for UFS ICE
      arm64: dts: qcom: sa8775p: extend the register range for UFS ICE
      arm64: dts: qcom: sc8280xp-crd: model the PMU of the on-board wcn6855
      arm64: dts: qcom: sc8280xp-crd: enable bluetooth
      arm64: dts: qcom: sc8280xp-x13s: model the PMU of the on-board wcn6855
      arm64: dts: qcom: sm8450-hdk: model the PMU of the on-board wcn6855

Bjorn Andersson (2):
      arm64: dts: qcom: qcs6490-rb3gen2: Specify i2c1 clock frequency
      Merge branch '20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com' into arm64-for-6.13

Bryan O'Donoghue (6):
      arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Convert mezzanine riser to dtbo
      arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Convert mezzanine riser to dtso
      arm64: dts: qcom: sc8280xp-x13s: Drop redundant clock-lanes from camera@10
      arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Drop redundant clock-lanes from camera@1a
      arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Add cma heap for libcamera softisp support
      arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Add cma heap for libcamera softisp support

Danila Tikhonov (4):
      arm64: dts: qcom: sc7280: Fix PMU nodes for Cortex A55 and A78
      dt-bindings: arm: cpus: Add qcom kryo670 compatible
      dt-bindings: vendor-prefixes: Add Nothing Technology Limited
      dt-bindings: arm: qcom: Add SM7325 Nothing Phone 1

Dmitry Baryshkov (15):
      arm64: dts: qcom: qcs6390-rb3gen2: use modem.mbn for modem DSP
      arm64: dts: qcom: sc7280: don't enable GPU on unsupported devices
      arm64: dts: qcom: qcm6490-idp: enable WiFi
      arm64: dts: qcom: qcm6490-rb3gen2: enable WiFi
      arm64: dts: qcom: sdm630: enable GPU SMMU and GPUCC
      arm64: dts: qcom: sda660-ifc6560: enable GPU
      arm64: dts: qcom: sda660-ifc6560: fix l10a voltage ranges
      arm64: dts: qcom: sdm630: enable A2NOC and LPASS SMMU
      arm64: dts: qcom: sdm630: add WiFI device node
      arm64: dts: qcom: sda660-ifc6560: enable mDSP and WiFi devices
      arm64: dts: qcom: msm8998-lenovo-miix-630: enable touchscreen
      arm64: dts: qcom: msm8998-lenovo-miix-630: enable aDSP and SLPI
      arm64: dts: qcom: msm8998-lenovo-miix-630: enable VolumeUp button
      arm64: dts: qcom: msm8998-clamshell: enable resin/VolDown
      arm64: dts: qcom: msm8998-lenovo-miix-630: add WiFi calibration variant

Eugene Lepshy (3):
      arm64: dts: qcom: sc7280: Add 0x81 Adreno speed bin
      arm64: dts: qcom: Add SM7325 device tree
      arm64: dts: qcom: sm7325: Add device-tree for Nothing Phone 1

Johan Hovold (4):
      arm64: dts: qcom: x1e80100: describe tcsr download mode register
      arm64: dts: qcom: x1e80100: enable GICv3 ITS for PCIe
      arm64: dts: qcom: x1e80100: rename vph-pwr regulator nodes
      arm64: dts: qcom: x1e80100-crd: describe HID supplies

Jonathan Marek (3):
      arm64: dts: qcom: x1e80100: enable OTG on USB-C controllers
      arm64: dts: qcom: x1e80100-crd: enable otg on usb ports
      arm64: dts: qcom: x1e78100-t14s: enable otg on usb-c ports

Jérôme de Bretagne (3):
      dt-bindings: arm: qcom: Document Microsoft Surface Pro 9 5G
      arm64: dts: qcom: sc8280xp: Add uart18
      arm64: dts: qcom: sc8280xp: Add Microsoft Surface Pro 9 5G

Konrad Dybcio (15):
      arm64: dts: qcom: qdu1000: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sc7180: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sc8180x: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sc8280xp: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sdm670: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sdm845: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sm6350: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sm8150: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sm8350: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: sm8450: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: x1e80100: Affirm IDR0.CCTW on apps_smmu
      arm64: dts: qcom: x1e80100-romulus: Add lid switch
      arm64: dts: qcom: x1e80100-romulus: Set up USB Multiport controller
      arm64: dts: qcom: qcs6490-rb3gen2: Enable PWR/VOL keys
      arm64: dts: qcom: x1e80100: Update C4/C5 residency/exit numbers

Krishna chaitanya chundru (1):
      arm64: dts: qcom: qcs6490-rb3gen2: Add PCIe nodes

Krzysztof Kozlowski (19):
      arm64: dts: qcom: drop underscore in node names
      arm64: dts: qcom: minor whitespace cleanup
      arm64: dts: qcom: ipq: change labels to lower-case
      arm64: dts: qcom: msm: change labels to lower-case
      arm64: dts: qcom: msm8992-libra: drop unused regulators labels
      arm64: dts: qcom: sc7180: change labels to lower-case
      arm64: dts: qcom: sc8280xp: change labels to lower-case
      arm64: dts: qcom: sc: change labels to lower-case
      arm64: dts: qcom: sm6115: change labels to lower-case
      arm64: dts: qcom: sm6350: change labels to lower-case
      arm64: dts: qcom: sm8150: change labels to lower-case
      arm64: dts: qcom: sm8250: change labels to lower-case
      arm64: dts: qcom: sm8350: change labels to lower-case
      arm64: dts: qcom: sm8450: change labels to lower-case
      arm64: dts: qcom: sm8550: change labels to lower-case
      arm64: dts: qcom: sm8650: change labels to lower-case
      arm64: dts: qcom: sm: change labels to lower-case
      arm64: dts: qcom: sdm: change labels to lower-case
      arm64: dts: qcom: change labels to lower-case

Luca Weiss (2):
      arm64: dts: qcom: sm6350: Fix GPU frequencies missing on some speedbins
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add thermistor for UFS/RAM

Manish Pandey (1):
      arm64: dts: qcom: qcm6490-idp: Add UFS nodes

Manivannan Sadhasivam (3):
      arm64: dts: qcom: sa8775p: Add 'linux,pci-domain' to PCIe EP controller nodes
      arm64: dts: qcom: sm8450: Add 'global' interrupt to the PCIe RC node
      arm64: dts: qcom: Use 'ufshc' as the node name for UFS controller nodes

Marc Gonzalez (1):
      arm64: dts: qcom: msm8998: add HDMI GPIOs

Maya Matuszczyk (1):
      arm64: dts: qcom: x1e80100: Add debug uart to Lenovo Yoga Slim 7x

Miaoqing Pan (1):
      arm64: dts: qcom: sa8775p-ride: add WiFi/BT nodes

Mukesh Ojha (1):
      arm64: dts: qcom: sa8775p: Add TCSR halt register space

Rob Herring (Arm) (1):
      arm64: dts: qcom: Drop undocumented domain "idle-state-name"

Sachin Gupta (1):
      arm64: dts: qcom: qcs6490-rb3gen2: Add SD Card node

Sibi Sankar (1):
      arm64: dts: qcom: x1e80100: Resize GIC Redistributor register region

Srinivas Kandagatla (1):
      arm64: dts: qcom: x1e80100-t14s: add another trackpad support

Taniya Das (3):
      dt-bindings: clock: qcom: Add SA8775P video clock controller
      dt-bindings: clock: qcom: Add SA8775P camera clock controller
      dt-bindings: clock: qcom: Add SA8775P display clock controllers

Tengfei Fan (2):
      dt-bindings: arm: qcom: Document qcs9100-ride and qcs9100-ride Rev3
      arm64: dts: qcom: qcs9100: Add support for the QCS9100 Ride and Ride Rev3 boards

Vedang Nagar (1):
      arm64: dts: qcom: qcs6460-rb3gen2: enable venus node

Viken Dadhaniya (2):
      arm64: dts: qcom: sa8775p: Populate additional UART DT nodes
      arm64: dts: qcom: sa8775p: Add GPI configuration

Vladimir Zapolskiy (9):
      arm64: dts: qcom: sm8350-hdk: remove a blank overwrite of dispcc node status
      arm64: dts: qcom: sm8450-qrd: explicitly disable dispcc on the board
      arm64: dts: qcom: sm8450-sony-xperia-nagara: disable dispcc on derived boards
      arm64: dts: qcom: sm8450: don't disable dispcc by default
      arm64: dts: qcom: sm8450-hdk: remove status property from dispcc device tree node
      arm64: dts: qcom: sm8650: don't disable dispcc by default
      arm64: dts: qcom: sm8650-hdk: remove status property from dispcc device tree node
      arm64: dts: qcom: sm8650-mtp: remove status property from dispcc device tree node
      arm64: dts: qcom: sm8650-qrd: remove status property from dispcc device tree node

Yuvaraj Ranganathan (1):
      arm64: dts: qcom: sa8775p: add QCrypto nodes

 Documentation/devicetree/bindings/arm/cpus.yaml    |    1 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |   16 +
 .../bindings/clock/qcom,sa8775p-camcc.yaml         |   62 +
 .../bindings/clock/qcom,sa8775p-dispcc.yaml        |   79 ++
 .../bindings/clock/qcom,sa8775p-videocc.yaml       |   62 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi       |    2 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   11 +
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |   10 +-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |   18 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   26 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   18 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   52 +-
 .../boot/dts/qcom/msm8916-wingtech-wt86518.dts     |    2 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |  100 +-
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  110 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |   68 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |   34 +-
 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts       |   12 +-
 arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dts  |    4 +-
 arch/arm64/boot/dts/qcom/msm8992.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |   52 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   54 +-
 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |   38 +-
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      |   68 ++
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |  220 +++-
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |   68 +-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |   40 +
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |   30 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |   68 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  127 +-
 arch/arm64/boot/dts/qcom/qcs8550.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts       |   11 +
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts          |   11 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |   89 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   14 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |    4 +-
 ...anine.dts => qrb5165-rb5-vision-mezzanine.dtso} |   19 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |    4 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |  121 ++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  701 +++++++++--
 arch/arm64/boot/dts/qcom/sc7180-firmware-tfa.dtsi  |   84 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi |    8 +-
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |    8 +-
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |    8 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |  366 +++---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   10 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  397 +++---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  166 +--
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  169 +++
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  120 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    | 1032 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  211 ++--
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |   32 +-
 arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts |    2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |  190 +--
 arch/arm64/boot/dts/qcom/sdm632.dtsi               |   26 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |   16 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |  159 +--
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |   74 +-
 ...dts => sdm845-db845c-navigation-mezzanine.dtso} |   23 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |    4 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  179 +--
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |   90 +-
 arch/arm64/boot/dts/qcom/sm4250.dtsi               |   16 +-
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |  160 +--
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |  154 +--
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   54 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  207 ++--
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |  160 +--
 arch/arm64/boot/dts/qcom/sm7125.dtsi               |   16 +-
 arch/arm64/boot/dts/qcom/sm7225.dtsi               |   16 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts      | 1260 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm7325.dtsi               |   17 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  371 +++---
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  366 +++---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    4 -
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  353 +++---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |  161 ++-
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |    4 +
 .../boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi   |    4 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  176 +--
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |    2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  167 +--
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |    4 -
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |    4 -
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |    4 -
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  162 ++-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     |   25 +-
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |   26 +-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |   70 +-
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |  875 ++++++++++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |   39 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  104 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  229 ++--
 include/dt-bindings/clock/qcom,sa8775p-camcc.h     |  108 ++
 include/dt-bindings/clock/qcom,sa8775p-dispcc.h    |   87 ++
 include/dt-bindings/clock/qcom,sa8775p-videocc.h   |   47 +
 98 files changed, 8314 insertions(+), 2946 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9100-ride.dts
 rename arch/arm64/boot/dts/qcom/{qrb5165-rb5-vision-mezzanine.dts => qrb5165-rb5-vision-mezzanine.dtso} (78%)
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
 rename arch/arm64/boot/dts/qcom/{sdm845-db845c-navigation-mezzanine.dts => sdm845-db845c-navigation-mezzanine.dtso} (85%)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-videocc.h

