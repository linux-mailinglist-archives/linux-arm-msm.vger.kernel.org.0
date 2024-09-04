Return-Path: <linux-arm-msm+bounces-30812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DF296C9EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 23:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3708A289B37
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Sep 2024 21:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE2C14B08E;
	Wed,  4 Sep 2024 21:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixoALdox"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3EA148FEC
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Sep 2024 21:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725487076; cv=none; b=pdHAV9z+HOVkDki0FEImvRy6k/EFP7gb73Z4nimFCSXNRqEVa8HhqHhfmxM8s4EiAL+LLgg1BwH/SZhuCfrzhp/UgT2cP06qVDimT6/VKK0eSewY8YKcpdW8X/ALI5Xsay1Nl/IM2LP9TCfY2mHhLilJ4/Xx3ursObNkEnLwug8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725487076; c=relaxed/simple;
	bh=8id33VV1JJiHuZrCPvmuBP7wZQxKkfb1Dt4VyTL/FNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FsfyLK8+1R4c6GEoQkyGi3DKgs97gaDLo8VPo86QHwjVOC7RKfTDQBibPlTb70qA/tbj1Uk5PdUNY9Ou0OEAYWbubCf3H33mV9MWdvoNu6gmq+pCmhSM8x5eEiImvA2tf8qb7/oMKRFq4qZurU1VclIyXg23T62d9cwsTDYraXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixoALdox; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B05C4CEC2;
	Wed,  4 Sep 2024 21:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725487076;
	bh=8id33VV1JJiHuZrCPvmuBP7wZQxKkfb1Dt4VyTL/FNo=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=ixoALdox+8+F1KkkLEIvj+c6HOuNU0qXFODHlmetSEsCMbZolpzpTbEjNSnF4iNRC
	 ono9Qt42lx8VpBa4d/7C1kZUeAHtLsQHVq3jEW5MbxeUkiy+YV4/jTW2QzvDwjOYhP
	 0w8Lc/xZQGFCrCt6j3tngEFmHvfZKW/h3RlCq3cXLhSFbGtTf0gLXL6w/jn9TdSNSI
	 F11KL4N2pth/GCHHF9YljzdCelpxPnrh52y4JpOMikNZvhEcucjW9xMmhQ6syRv8KE
	 5brQ0xnNRxb23jJLOU3puCuYh1T/cGHaV+Y0yX4+v2HmpJSOp5pLXGXWt17yZ6wKp8
	 kc68VjcXMfWHg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@baylibre.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Dang Huynh <danct12@riseup.net>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Lin@web.codeaurora.org, Meng-Bo <linmengbo06890@proton.me>,
	Naina Mehta <quic_nainmeht@quicinc.com>,
	Rayyan Ansari <rayyan.ansari@linaro.org>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Alexander Reimelt <alexander.reimelt@posteo.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nikita Travkin <nikita@trvn.ru>,
	Raymond Hackley <raymondhackley@protonmail.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	=?UTF-8?q?Adam=20S=C5=82abo=C5=84?= <asaillen@protonmail.com>,
	Amit Pundir <amit.pundir@linaro.org>,
	Ankit Sharma <quic_anshar@quicinc.com>,
	Anton Bambura <jenneron@postmarketos.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ling Xu <quic_lxu5@quicinc.com>, Patrick Wildt <patrick@blueri.se>,
	Qingqing Zhou <quic_qqzhou@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Rob Clark <robdclark@chromium.org>,
	Sachin Gupta <quic_sachgupt@quicinc.com>,
	Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.12
Date: Wed,  4 Sep 2024 16:57:49 -0500
Message-ID: <20240904215752.24465-1-andersson@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.12

for you to fetch changes up to ba728bda663b0e812cb20450d18af5d0edd803a2:

  arm64: dts: qcom: x1e80100: Fix PHY for DP2 (2024-08-30 21:40:28 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree updates for v6.12

This introduces support for the following devices:
- Lenovo Thinkpad T14s Gen 6
- Microsoft Surface Laptop 7 laptop
- Lenovo A6000
- Lenovo A6010
- Samsung Galaxy J3,
- Lenovo Vibe K5 (multiple variants)
- LG G4

IPQ5332 global clock controller is marked as an interconnect-provider,
and the USB interrupt triggers are corrected.

Touchscreen description is added to the Samsung Galaxy Core Prime and
Max, and touch keys are added to the Samsung Galaxy Grand Prime and
Galaxy Tab A.

Camera flash is added to BQ Aquaris M5 and X5.

The SD-card slot is described for the QCM6490 IDP.

For SA8775P CPU and LLCC bwmon is added, audio, compute and general
purpose DSP remoteprocs are added, with FastRPC on audio and compute
DSP. CPUidle states, capacity and DPC properties are added.

On SC8180X definitions for the multiport USB controller is introduced,
and enabled on the Lenovo Flex 5G to bring the camera to life. Power key
definitions are added as well.

The RGB camera sensor on the Lenovo ThinkPad X13s is described. PCIe
pinconf properties are cleaned up on this and the CRD. The four USB
Type-A ports found on the SA8295P ADP are enabled.

The modem subsystem remoteproc is introduced on the SDX75 and enabled on
the IDP device.

Camera, display and GPU clock controllers are added for the SM4450
platform.

On the F(x)tec Pro1X device, display, GPU, WiFi, RGB LED, SD-card,
remoteprocs, USB3 SuperSpeed, touchscreen, IO-expander, hall switch,
caps lock LED and camera button are introduced.

The camera clock controller is added to SM8150, and the GPU-only
"amd,imageon" compatible is dropped from the MTP device.

Refgen regulator for the DSI nodes of SM8350 is described, and the
display subsystem interconnect paths are corrected.

The camera control interface controllers are described on both SM8550
and SM8650. The bluetooth node on on SM8550 QRD, SM8650 QRD and SM8650
HDK are transitioned to the power sequence description. WiFi is added to
the SM8550 hardware development kit (HDK).

On the X1 Elite platform, one more UART, a DisplayPort PHY, the USB
multiport controller, a PCIe controller and PHY are added. Orientation
switching is wired up for the USB+DP PHYs. RPMh statistics node is
added. For the X1 Elite CRD the LID switch and the SDX65 modems are
introduced.

----------------------------------------------------------------
Abel Vesa (2):
      arm64: dts: qcom: x1e80100: Add orientation-switch to all USB+DP QMP PHYs
      arm64: dts: qcom: x1e80100: Fix PHY for DP2

Adam Słaboń (1):
      arm64: dts: qcom: msm8939-wingtech-wt82918: Add Lenovo Vibe K5 devices

Ajit Pandey (4):
      dt-bindings: clock: qcom: add DISPCC clocks on SM4450
      dt-bindings: clock: qcom: add CAMCC clocks on SM4450
      dt-bindings: clock: qcom: add GPUCC clocks on SM4450
      arm64: dts: qcom: sm4450: add camera, display and gpu clock controller

Alexander Reimelt (2):
      dt-bindings: arm: qcom: Add LG G4 (h815)
      arm64: dts: qcom: msm8992-lg-h815: Initial support for LG G4 (H815)

Amit Pundir (1):
      arm64: dts: qcom: sm8550-hdk: add the Wifi node

André Apitzsch (4):
      arm64: dts: qcom: msm8916-longcheer-l8910: Add rear flash
      arm64: dts: qcom: msm8939-longcheer-l9100: Add rear flash
      arm64: dts: qcom: msm8939-longcheer-l9100: Add rear flash
      Revert "arm64: dts: qcom: msm8939-longcheer-l9100: Add rear flash"

AngeloGioacchino Del Regno (2):
      dt-bindings: clock: gcc-msm8998: Add Q6 and LPASS clocks definitions
      arm64: dts: qcom: msm8998: Add disabled support for LPASS iommu for Q6

Ankit Sharma (1):
      arm64: dts: qcom: sa8775p: Add capacity and DPC properties

Anton Bambura (1):
      arm64: dts: qcom: msm8916-wingtech-wt865x8: Add Lenovo A6000/A6010

Barnabás Czémán (2):
      arm64: dts: qcom: pm8950: Add resin node
      arm64: dts: qcom: msm8976: Add restart node

Bartosz Golaszewski (4):
      arm64: dts: qcom: sm8650-qrd: use the PMU to power up bluetooth
      arm64: dts: qcom: sa8775p-ride: enable remoteprocs
      arm64: dts: qcom: sa8775p: add CPU idle states
      arm64: dts: qcom: sa8775p: fix the fastrpc label

Bjorn Andersson (14):
      Merge branch 'arm64-fixes-for-6.11' into HEAD
      dt-bindings: clock: qcom: Add missing USB MP resets
      Merge branch '20240730-sc8180x-usb-mp-v2-1-a7dc4265b553@quicinc.com' into arm64-for-6.12
      arm64: dts: qcom: sc8180x-pmics: Add second PMC8180 GPIO
      arm64: dts: qcom: sc8180x: Align USB nodes with binding
      arm64: dts: qcom: sc8180x: Add USB MP controller and phys
      arm64: dts: qcom: sc8180x-primus: Enable the two MP USB ports
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: Enable USB multiport controller
      Merge branch '20240731062916.2680823-7-quic_skakitap@quicinc.com' into arm64-for-6.12
      Merge branch '20240717-dispcc-sm8550-fixes-v2-7-5c4a3128c40b@linaro.org' into arm64-for-6.12
      arm64: dts: qcom: sc8180x: Enable the power key
      Merge branch '20240611133752.2192401-1-quic_ajipan@quicinc.com' into arm64-for-6.12
      Merge branch '20240814-lpass-v1-1-a5bb8f9dfa8b@freebox.fr' into arm64-for-6.12
      Merge branch '20240730054817.1915652-2-quic_varada@quicinc.com' into arm64-for-6.12

Bryan O'Donoghue (1):
      arm64: dts: qcom: sc8280xp-x13s: Enable RGB sensor

Dang Huynh (11):
      arm64: dts: qcom: sm6115-pro1x: Add Hall Switch and Camera Button
      arm64: dts: qcom: sm6115-pro1x: Add PCA9534 IO Expander
      arm64: dts: qcom: sm6115-pro1x: Add Goodix Touchscreen
      arm64: dts: qcom: sm6115-pro1x: Add Caps Lock LED
      arm64: dts: qcom: sm6115-pro1x: Enable SD card slot
      arm64: dts: qcom: sm6115-pro1x: Enable MDSS and GPU
      arm64: dts: qcom: sm6115-pro1x: Hook up USB3 SS
      arm64: dts: qcom: sm6115-pro1x: Add PMI632 Type-C property
      arm64: dts: qcom: sm6115-pro1x: Enable RGB LED
      arm64: dts: qcom: sm6115-pro1x: Enable remoteprocs
      arm64: dts: qcom: sm6115-pro1x: Enable ATH10K WLAN

Danila Tikhonov (1):
      arm64: dts: qcom: sm7125-xiaomi-common: Add reset-gpios for ufs_mem_hc

Dmitry Baryshkov (4):
      dt-bindings: clock: qcom,sm8650-dispcc: replace with symlink
      arm64: dts: qcom: add generic compat string to RPM glink channels
      arm64: dts: qcom: sm8350: add MDSS registers interconnect
      arm64: dts: qcom: sm8350: add refgen regulator

Johan Hovold (24):
      arm64: dts: qcom: sc8280xp-crd: disable PCIe perst pull downs
      arm64: dts: qcom: sc8280xp-crd: clean up PCIe2a pinctrl node
      arm64: dts: qcom: sc8280xp-x13s: disable PCIe perst pull downs
      arm64: dts: qcom: sc8280xp-x13s: clean up PCIe2a pinctrl node
      arm64: dts: qcom: x1e80100-crd: fix PCIe4 PHY supply
      arm64: dts: qcom: x1e80100: fix PCIe domain numbers
      arm64: dts: qcom: x1e80100: add missing PCIe minimum OPP
      arm64: dts: qcom: x1e80100-crd: fix up PCIe6a pinctrl node
      arm64: dts: qcom: x1e80100-crd: disable PCIe6a perst pull down
      arm64: dts: qcom: x1e80100-crd: fix missing PCIe4 gpios
      arm64: dts: qcom: x1e80100-qcp: fix PCIe4 PHY supply
      arm64: dts: qcom: x1e80100-qcp: fix up PCIe6a pinctrl node
      arm64: dts: qcom: x1e80100-qcp: disable PCIe6a perst pull down
      arm64: dts: qcom: x1e80100-qcp: fix missing PCIe4 gpios
      arm64: dts: qcom: x1e80100-vivobook-s15: fix PCIe4 PHY supply
      arm64: dts: qcom: x1e80100-vivobook-s15: fix up PCIe6a pinctrl node
      arm64: dts: qcom: x1e80100-vivobook-s15: disable PCIe6a perst pull down
      arm64: dts: qcom: x1e80100-vivobook-s15: fix missing PCIe4 gpios
      arm64: dts: qcom: x1e80100-yoga-slim7x: fix PCIe4 PHY supply
      arm64: dts: qcom: x1e80100-yoga-slim7x: fix up PCIe6a pinctrl node
      arm64: dts: qcom: x1e80100-yoga-slim7x: disable PCIe6a perst pull down
      arm64: dts: qcom: x1e80100-yoga-slim7x: fix missing PCIe4 gpios
      arm64: dts: qcom: x1e80100: add PCIe5 nodes
      arm64: dts: qcom: x1e80100-crd: enable SDX65 modem

Konrad Dybcio (9):
      arm64: dts: qcom: x1e80100: Fix up hex style
      arm64: dts: qcom: x1e80100: Disable SMB2360_2 by default
      arm64: dts: qcom: x1e80100: Add USB Multiport controller
      dt-bindings: arm: qcom: Add Surface Laptop 7 devices
      arm64: dts: qcom: x1e80100-pmics: Add PMC8380C PWM
      arm64: dts: qcom: x1e80100: Add UART2
      arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices
      dt-bindings: arm: qcom: Add Lenovo ThinkPad T14s Gen 6
      arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6

Krishna Kurapati (1):
      arm64: dts: qcom: sa8295p-adp: Enable the four USB Type-A ports

Krzysztof Kozlowski (1):
      arm64: dts: qcom: sm8150-mtp: drop incorrect amd,imageon

Lin, Meng-Bo (3):
      arm64: dts: qcom: msm8916-samsung-grandmax: Add touchscreen
      dt-bindings: qcom: Document samsung,j3ltetw
      arm64: dts: qcom: msm8916-samsung-j3ltetw: Add initial device tree

Ling Xu (1):
      arm64: qcom: sa8775p: Add ADSP and CDSP0 fastrpc nodes

Naina Mehta (3):
      arm64: dts: qcom: sdx75: update reserved memory regions for mpss
      arm64: dts: qcom: sdx75: Add remoteproc node
      arm64: dts: qcom: sdx75-idp: enable MPSS remoteproc node

Neil Armstrong (2):
      arm64: dts: qcom: sm8650-hdk: use the PMU to power up bluetooth
      arm64: dts: qcom: sm8550-qrd: use the PMU to power up bluetooth

Nikita Travkin (2):
      dt-bindings: arm: qcom: Add msm8916/39 based Lenovo devices
      arm64: dts: qcom: msm8916-samsung-gt58: Enable the touchkeys

Patrick Wildt (1):
      arm64: dts: qcom: x1e80100-yoga: add wifi calibration variant

Qingqing Zhou (1):
      arm64: dts: qcom: sa8775p: Mark APPS and PCIe SMMUs as DMA coherent

Rajendra Nayak (1):
      arm64: dts: qcom: x1e80100: add rpmh-stats node

Raymond Hackley (2):
      arm64: dts: qcom: msm8916-samsung-rossa: Add touchscreen
      arm64: dts: qcom: msm8916-samsung-fortuna: Add touch keys

Rayyan Ansari (3):
      arm64: dts: qcom: pmi8994: Add label to wled node
      arm64: dts: qcom: pmi8950: Remove address from lpg node
      arm64: dts: qcom: msm8939-samsung-a7: rename pwm node to conform to dtschema

Rob Clark (1):
      arm64: dts: qcom: x1e80100-yoga: Update panel bindings

Sachin Gupta (1):
      arm64: dts: qcom: qcm6490-idp: Add SD Card node

Sagar Cheluvegowda (1):
      arm64: dts: qcom: sa8775p: Add interconnects for ethernet

Satya Priya Kakitapalli (2):
      dt-bindings: clock: qcom: Add SM8150 camera clock controller
      arm64: dts: qcom: Add camera clock controller for sm8150

Srinivas Kandagatla (4):
      arm64: dts: qcom: x1e80100: add soundwire controller resets
      arm64: dts: x1e80100-crd: fix wsa soundwire port mapping
      arm64: dts: x1e80100-qcp: fix wsa soundwire port mapping
      arm64: dts: qcom: sm8250: move lpass codec macros to use clks directly

Stephan Gerhold (1):
      arm64: dts: qcom: x1e80100-crd: Add LID switch

Tengfei Fan (3):
      arm64: dts: qcom: sa8775p: Add CPU and LLCC BWMON
      dt-bindings: mailbox: qcom-ipcc: Add GPDSP0 and GPDSP1 clients
      arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes

Varadarajan Narayanan (3):
      arm64: dts: qcom: ipq5332: Fix interrupt trigger type for usb
      dt-bindings: interconnect: Add Qualcomm IPQ5332 support
      arm64: dts: qcom: ipq5332: Add icc provider ability to gcc

Vladimir Zapolskiy (2):
      arm64: dts: qcom: sm8550: add description of CCI controllers
      arm64: dts: qcom: sm8650: add description of CCI controllers

 Documentation/devicetree/bindings/arm/qcom.yaml    |   19 +
 .../bindings/clock/qcom,ipq5332-gcc.yaml           |    2 +
 .../bindings/clock/qcom,sm4450-camcc.yaml          |   63 ++
 .../bindings/clock/qcom,sm4450-dispcc.yaml         |   71 ++
 .../bindings/clock/qcom,sm8150-camcc.yaml          |   77 ++
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   10 +
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |   11 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |    2 +-
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |   27 +
 .../dts/qcom/msm8916-samsung-fortuna-common.dtsi   |    2 +
 .../boot/dts/qcom/msm8916-samsung-grandmax.dts     |   24 +-
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts  |    1 +
 .../boot/dts/qcom/msm8916-samsung-j3-common.dtsi   |   62 ++
 .../boot/dts/qcom/msm8916-samsung-j3ltetw.dts      |   31 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts |   20 +
 .../boot/dts/qcom/msm8916-wingtech-wt86518.dts     |   87 ++
 .../boot/dts/qcom/msm8916-wingtech-wt86528.dts     |  158 +++
 .../boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi    |  215 +++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/msm8929-pm8916.dtsi       |  162 ++++
 .../boot/dts/qcom/msm8929-wingtech-wt82918hd.dts   |   17 +
 arch/arm64/boot/dts/qcom/msm8929.dtsi              |    7 +
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   27 +
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts    |    2 +-
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dts     |   17 +
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    |  252 +++++
 .../boot/dts/qcom/msm8939-wingtech-wt82918hd.dts   |   17 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |    7 +-
 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts       |  231 +++++
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   29 +-
 arch/arm64/boot/dts/qcom/pm8950.dtsi               |   10 +-
 arch/arm64/boot/dts/qcom/pmi8950.dtsi              |    3 +-
 arch/arm64/boot/dts/qcom/pmi8994.dtsi              |    3 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |   33 +
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sa8155p.dtsi              |    4 +
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |   83 ++
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |   25 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 1006 ++++++++++++++++++++
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |   38 +
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi        |   18 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |   64 ++
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  181 +++-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   16 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   83 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sdx75-idp.dts             |    6 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |   65 +-
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |   38 +
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts    |  343 ++++++-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi |    2 +
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    5 -
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   13 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   31 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   16 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |  113 ++-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   26 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  252 +++++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |   26 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   28 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  291 ++++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     |  807 ++++++++++++++++
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |   46 +-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |  141 ++-
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |   75 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  835 ++++++++++++++++
 .../boot/dts/qcom/x1e80100-microsoft-romulus13.dts |   13 +
 .../boot/dts/qcom/x1e80100-microsoft-romulus15.dts |   13 +
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |   10 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |   59 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  500 +++++++++-
 include/dt-bindings/clock/qcom,gcc-msm8998.h       |    5 +
 include/dt-bindings/clock/qcom,gcc-sc8180x.h       |    4 +
 include/dt-bindings/clock/qcom,sm4450-camcc.h      |  106 +++
 include/dt-bindings/clock/qcom,sm4450-dispcc.h     |   51 +
 include/dt-bindings/clock/qcom,sm4450-gpucc.h      |   62 ++
 include/dt-bindings/clock/qcom,sm8150-camcc.h      |  135 +++
 include/dt-bindings/clock/qcom,sm8650-dispcc.h     |  103 +-
 include/dt-bindings/interconnect/qcom,ipq5332.h    |   46 +
 include/dt-bindings/mailbox/qcom-ipcc.h            |    2 +
 90 files changed, 7153 insertions(+), 358 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm4450-camcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm4450-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-j3-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8929-pm8916.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8929.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dts
 create mode 100644 include/dt-bindings/clock/qcom,sm4450-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm4450-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm4450-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8150-camcc.h
 mode change 100644 => 120000 include/dt-bindings/clock/qcom,sm8650-dispcc.h
 create mode 100644 include/dt-bindings/interconnect/qcom,ipq5332.h

