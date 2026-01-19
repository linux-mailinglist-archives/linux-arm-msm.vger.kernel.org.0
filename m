Return-Path: <linux-arm-msm+bounces-89719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FCFD3B334
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 18:06:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 281BA300C6C8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 17:01:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBAC12EB85E;
	Mon, 19 Jan 2026 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="He5caPOI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988CD17AE11
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 17:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768842093; cv=none; b=Uxyu9qpxuEoqD677ZItMLUwLP36shAROHfLGg4kPIlcUz0WYOSdw0pk+ljZVcEabxiwEqEDRVeq2c5K8BY8Ep+Rh4xABo554XxduFUgjBfgPBIwPcPE4GevXrbHAMV12d5f8kvEOtAoygSehNWBUZU7jvIRt4SMUxlH7BweivKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768842093; c=relaxed/simple;
	bh=bJZm4klfTUOJGl7NeEkQXqlEHOsZ2CSa1uWWXOM0+go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YC/VSI3FANsbGXWGrAfvmEGC8j/Of6J147rnMHemlDO47f5larxXg8IBHVjQOONyQc+TcSBiP5BNIIcDp+dxoXKqSgEGEL+mSIhJ4Ln3jjWpS9oxqGUnUZHJwLdX9k96gr0vjuSSSlGCS/2kygnIf4d1Ym6Z+TA6PoZktaecgT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=He5caPOI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39915C116C6;
	Mon, 19 Jan 2026 17:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768842093;
	bh=bJZm4klfTUOJGl7NeEkQXqlEHOsZ2CSa1uWWXOM0+go=;
	h=From:To:Cc:Subject:Date:From;
	b=He5caPOINIF4dPciQoGGQ4u4kBPWGAWJttMHNP5pOTR4H9NlevJCcxDcelfNelWoC
	 DBDfty6B+Jmp+NLKG0cFIDpEoZTrJi/XPVBojFh3stN2EGyj+tGJji/RlIcx5MTkO4
	 ipOxfaHmVaGPXXj23Q3dI8ckXvmJPpi9z3UmYsGcvI/4px01OccTAyxlIQENDwrq8W
	 t26aW0ED4Rm4HHAPvVkG7N5/S+l3AQsdkWz+moOtJj+Tajsp7+/LnUvrrTQso6mSBe
	 nJIUwIi2tziOBF/2Kz27YTJKZKaF3tYNi0M1Z4Z25X1Ic/oPvAtSKpZy5x886PUFN4
	 WNbCRy++viTAA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
	Georg Gottleuber <ggo@tuxedocomputers.com>,
	Riccardo Mereu <r.mereu@arduino.cc>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	Dylan Van Assche <me@dylanvanassche.be>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Gaurav Kohli <quic_gkohli@quicinc.com>,
	Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Maud Spierings <maud_spierings@hotmail.com>,
	Nickolay Goppen <setotau@mainlining.org>,
	Robert Eckelmann <longnoserob@gmail.com>,
	Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
	Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Erikas Bitovtas <xerikasxx@gmail.com>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Jingzhou Zhu <newwheatzjz@zohomail.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
	Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Dale Whinham <daleyo@gmail.com>,
	George Moussalem <george.moussalem@outlook.com>,
	Jianping Li <jianping.li@oss.qualcomm.com>,
	Jonathan Marek <jonathan@marek.ca>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
	Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Sam Day <me@samcday.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Sushrut Shree Trivedi <quic_sushruts@quicinc.com>,
	Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
	Vikram Sharma <quic_vikramsa@quicinc.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Yingying Tang <yingying.tang@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree for v6.20
Date: Mon, 19 Jan 2026 11:01:27 -0600
Message-ID: <20260119170127.847446-1-andersson@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.20

for you to fetch changes up to fc12767c19d49663b13ba2def6e4674df041c8a2:

  dt-bindings: mailbox: qcom: Add IPCC support for Kaanapali and Glymur Platforms (2026-01-17 15:35:17 -0600)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree for v6.20

Introduce the Kaanapali SoC, with the MTP and QRD devices. Introduce
support for the Milos SoC (SM7635) and initial support for the Fairphone
(Gen 6) device on this platform.

Add the QCS6490-based RubikPI3 board, the QRB2210-based Arduino UnoQ,
the X Elite-based Medion SPRCHRGD 14 S1 and Surface Pro 11 laptops, and
the SDM845-based Pixel 3 and Pixel 3 XL devices.

On the Kodiak-based (QCS6490) RB3Gen2 the TC9563 PCIe switch controller
is described.

On Lemans (SA8775P/QCS9075) the GPU and crypto blocks are added.
IO-regions and clocks are added to interconnect nodes to allow QoS
configuration. GPU, TPM and USB support are enabled on the evaluation
kit (EVK).

On Monaco (QCS8300) the two PCIe controllers, the camera subsystem,
tsens, display subsystem, crypto, CPUfreq, and coresight are added. On
the evaluation kit (EVK) the PCIe busses are enabled, together with an
AMC6821-based fan controller and the ST33 TPM chip.

On MSM8939 the camera subsystem is described. The Asus ZenFone 2
Laser/Selfie gains battery and hall sensor support.

On the Agatti-based RB1 board PM8008 is described and an overlay for the
Vision mezzanine is introduced.

On SDM630 the compute DSP remoteproc, FastRPC and related entites are
described. The LPASS LPI pinctrl node is described.

On SDM845-based OnePlus device the bootloader framebuffer and its
resources are described, to improve the transition. On the SDM845-based
devices from OnePlus, SHIFT, and Xiaomi ath10k calibration variants are
specified. The sensor remoteproc is enabled on Xiaomi Pocophone F1.

On SM7225-based Fairphone FP4 regulators for the cameras are described,
and the camera EEPROM is added.

On SM8650 the camera subsystem is described. On the QRD the Samsung
S5KJN1 camera sensor is added, and for the HDK an overlay for the "Rear
Camera Card" is added.

On SM8750 CPUfreq, SDCHCI and Iris (video encode/decode) support are
added, and missing - required - properties for the BAM DMA is added.
These are then enabled on the MTP.

On Talos (SM6150/QCS615) PMU, DisplayPort, and USB/DP combo PHY are added.
DisplayPort is enabled on the Talos Ride board.

On Hamoa (X Elite) add crypto engine, missing TCSR reference clocks, and
random number generator block. The soc bus address width is corrected to
match the hardware. On the Lenovo Thinkpad T14s HDMI and audio playback
over DisplayPort is introduced. HDMI, Iris (video encode/decode) and
PS8830 retimers are described for the ASUS Vivobook S 15. On the Hamoa
evaluation kit (EVK) PCIe busses, WiFi, backlight, TPM and RG
(red/green) LEDs are described.

Enable QSEECOM, and thereby UEFI variable access, on the Medion SPRCHRGD
14 S1 (commit should have been on drivers branch).

----------------------------------------------------------------
Abel Vesa (2):
      arm64: dts: qcom: x1e80100: Fix USB combo PHYs SS1 and SS2 ref clocks
      arm64: dts: qcom: x1e80100: Add missing TCSR ref clock to the DP PHYs

Abhinaba Rakshit (2):
      arm64: dts: qcom: lemans: add QCrypto node
      arm64: dts: qcom: monaco: add QCrypto node

Akhil P Oommen (2):
      arm64: dts: qcom: lemans-evk: Enable Adreno 663 GPU
      arm64: dts: qcom: lemans-ride: Enable Adreno 663 GPU

Alexey Minnekhanov (1):
      arm64: dts: qcom: sdm630: Add missing MDSS reset

Barnabás Czémán (3):
      dt-bindings: clock: gcc-msm8917: Add missing MDSS reset
      arm64: dts: qcom: msm8917: add reset for display subsystem
      arm64: dts: qcom: msm8937: add reset for display subsystem

Bjorn Andersson (2):
      Merge branch '20260103-ufs_symbol_clk-v2-1-51828cc76236@oss.qualcomm.com' into arm64-for-6.20
      Merge branch '20251117-mdss-resets-msm8917-msm8937-v2-1-a7e9bbdaac96@mainlining.org' into HEAD

Casey Connolly (3):
      arm64: dts: qcom: sdm845-oneplus: Don't mark ts supply boot-on
      arm64: dts: qcom: sdm845-oneplus: Don't keep panel regulator always on
      arm64: dts: qcom: sdm845-oneplus: Mark l14a regulator as boot-on

Dale Whinham (1):
      arm64: dts: qcom: Add support for X1-based Surface Pro 11

David Heidelberg (7):
      arm64: dts: qcom: sdm845-oneplus: Update firmware paths
      arm64: dts: qcom: sdm845-axolotl: Update firmware paths
      arm64: dts: qcom: sdm845-samsung-starqltechn: Update firmware paths
      arm64: dts: qcom: sdm845-xiaomi-polaris: Update firmware paths
      dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
      arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL
      arm64: dts: qcom: sdm845-oneplus-enchilada: Sort nodes alphabetically

Dmitry Baryshkov (8):
      arm64: dts: qcom: sdm630: fix gpu_speed_bin size
      arm64: dts: qcom: sm8150-hdk,mtp: specify ZAP firmware name
      arm64: dts: qcom: sm8250-hdk: specify ZAP firmware name
      arm64: dts: qcom: x1e80100-medion-sprchrgd-14-s1: correct firmware paths
      arm64: dts: qcom: qrb4210-rb2: Fix UART3 wakeup IRQ storm
      arm64: dts: qcom: sdm845-db845c: drop CS from SPIO0
      arm64: dts: qcom: sdm845-db845c: specify power for WiFi CH1
      arm64: dts: qcom: sm8150: add uart13

Dylan Van Assche (3):
      arm64: dts: qcom: sdm845-oneplus: add ath10k calibration variant
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Add ath10k calibration variant
      arm64: dts: qcom: sdm845-shift-axolotl: Add ath10k calibration variant

Erikas Bitovtas (2):
      arm64: dts: qcom: msm8939-asus-z00t: add battery
      arm64: dts: qcom: msm8939-asus-z00t: add hall sensor

Gaurav Kohli (6):
      arm64: dts: qcom: qcs8300: Enable TSENS support for QCS8300 SoC
      arm64: dts: qcom: lemans: Add GPU cooling
      arm64: dts: qcom: monaco: Enable cpufreq cooling devices
      arm64: dts: qcom: lemans: Enable cpufreq cooling devices
      arm64: dts: qcom: monaco-evk: Enable AMC6821 fan controller
      arm64: dts: qcom: qcs8300: Add GPU cooling

Georg Gottleuber (6):
      dt-bindings: vendor-prefixes: Add prefix for TUXEDO Computers GmbH
      dt-bindings: arm: qcom: Add TUXEDO Computers device
      dt-bindings: vendor-prefixes: Add Medion AG
      dt-bindings: arm: qcom: Add Medion SPRCHRGD device
      arm64: dts: qcom: Add dts for Medion SPRCHRGD 14 S1
      firmware: qcom: scm: QSEECOM on Medion SPRCHRGD 14 S1

George Moussalem (1):
      arm64: dts: qcom: ipq5018: Remove tsens v1 fallback compatible

Harshal Dev (2):
      arm64: dts: qcom: x1e80100: Add crypto engine
      arm64: dts: qcom: x1e80100: add TRNG node

Hongyang Zhao (2):
      dt-bindings: arm: qcom: Add Thundercomm RUBIK Pi 3
      arm64: dts: qcom: Add qcs6490-rubikpi3 board dts

Jagadeesh Kona (2):
      dt-bindings: mailbox: qcom: Document SM8750 CPUCP mailbox controller
      arm64: dts: qcom: SM8750: Enable CPUFreq support

Jens Glathe (2):
      arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: force usb2-only mode on usb_1_ss2_dwc3
      arm64: dts: qcom: x1p42100-lenovo-thinkbook-16: add hdmi bridge with enable pin

Jianping Li (1):
      arm64: dts: qcom: kodiak: Add memory region for audiopd

Jie Gan (2):
      arm64: dts: qcom: monaco: Add CTCU and ETR nodes
      arm64: dts: qcom: lemans: enable static TPDM

Jingyi Wang (7):
      dt-bindings: arm: qcom: Document Kaanapali SoC and its reference boards
      arm64: dts: qcom: kaanapali: Add header file for IPCC physical client IDs
      arm64: dts: qcom: Introduce Kaanapali SoC
      arm64: dts: qcom: kaanapali: Add base MTP board
      arm64: dts: qcom: kaanapali: Add base QRD board
      dt-bindings: mailbox: qcom: Add CPUCP mailbox controller bindings for Kaanapali
      dt-bindings: mailbox: qcom: Add IPCC support for Kaanapali and Glymur Platforms

Jingzhou Zhu (2):
      arm64: dts: qcom: sdm850-huawei-matebook-e-2019: Remove duplicate reserved-memroy nodes
      arm64: dts: qcom: sdm850-huawei-matebook-e-2019: Correct ipa_fw_mem for the driver to load successfully

Jonathan Marek (1):
      arm64: dts: qcom: x1e: bus is 40-bits (fix 64GB models)

Jérôme de Bretagne (1):
      dt-bindings: arm: qcom: Document Microsoft Surface Pro 11

Khalid Faisal Ansari (3):
      arm64: dts: qcom: lemans-evk: Enable TPM (ST33)
      arm64: dts: qcom: monaco-evk: Enable TPM (ST33)
      arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33) on SPI11

Konrad Dybcio (1):
      arm64: dts: qcom: qcs615: Drop IPA interconnects

Krishna Chaitanya Chundru (1):
      arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch node

Krishna Kurapati (3):
      arm64: dts: qcom: hamoa-iot-evk: Add vbus regulator support for Type-A ports
      arm64: dts: qcom: lemans-evk: Add OTG support for primary USB controller
      arm64: dts: qcom: sm8750-mtp: Add eusb2 repeater tuning parameters

Krzysztof Kozlowski (12):
      arm64: dts: qcom: Minor whitespace cleanup
      arm64: dts: qcom: Use hyphen in node names
      arm64: dts: qcom: Use lowercase hex
      arm64: dts: qcom: hamoa: Add sound DAI prefixes for DP
      arm64: dts: qcom: x1e78100-t14s: Add audio playback over DisplayPort
      arm64: dts: qcom: sm8750: Fix BAM DMA probing
      arm64: dts: qcom: sm8750: Add Iris VPU v3.5
      arm64: dts: qcom: sm8750-mtp: Enable Iris codec
      arm64: dts: qcom: sm8750-qrd: Enable Iris codec
      arm64: dts: qcom: ipq5018: Correct USB DWC3 wrapper interrupts
      arm64: dts: qcom: ipq9574: Complete USB DWC3 wrapper interrupts
      arm64: dts: qcom: sm6125-ginkgo: Fix missing msm-id subtype

Loic Poulain (3):
      arm64: dts: qcom: qcm2290: Add pin configuration for mclks
      arm64: dts: qcom: qrb2210-rb1: Add PM8008 node
      arm64: dts: qcom: qrb2210-rb1: Add overlay for vision mezzanine

Luca Weiss (10):
      arm64: dts: qcom: sm7225-fairphone-fp4: Add camera EEPROMs
      arm64: dts: qcom: sm7225-fairphone-fp4: Add camera fixed regulators
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable CCI pull-up
      dt-bindings: arm: qcom: Add Milos and The Fairphone (Gen. 6)
      arm64: dts: qcom: pm8550vs: Disable different PMIC SIDs by default
      arm64: dts: qcom: Add PM7550 PMIC
      arm64: dts: qcom: Add PMIV0104 PMIC
      arm64: dts: qcom: Add initial Milos dtsi
      arm64: dts: qcom: Add The Fairphone (Gen. 6)
      arm64: dts: qcom: kodiak: Add missing clock votes for lpass_tlmm

Maud Spierings (3):
      arm64: dts: qcom: x1e80100-vivobook-s15: enable ps8830 retimers
      arm64: dts: qcom: x1e80100-vivobook-s15: add HDMI port
      arm64: dts: qcom: x1e80100-vivobook-s15: enable IRIS

Mukesh Ojha (1):
      arm64: dts: qcom: lemans; Add EL2 overlay

Neil Armstrong (1):
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: add HDMI nodes

Nickolay Goppen (3):
      arm64: dts: qcom: sdm630/660: Add CDSP-related nodes
      arm64: dts: qcom: sdm630: Add missing vote clock and GDSC to lpass_smmu
      arm64: dts: qcom: sdm630: Add FastRPC nodes to ADSP

Odelu Kukatla (1):
      arm64: dts: qcom: sa8775p: Add reg and clocks for QoS configuration

Puranam V G Tejaswi (1):
      arm64: dts: qcom: lemans: Add gpu and gmu nodes

Riccardo Mereu (4):
      dt-bindings: vendor-prefixes: Add Arduino name
      dt-bindings: arm: qcom: Add arduino imola, UnoQ codename
      arm64: dts: qcom: agatti: add uart2 node
      arm64: dts: qcom: qrb2210: add dts for Arduino unoq

Richard Acayan (1):
      arm64: dts: qcom: sdm630: Add LPASS LPI TLMM

Robert Eckelmann (3):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable SLPI
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Adjust firmware paths
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Add placeholders and sort

Sam Day (1):
      arm64: dts: qcom: sdm845-oneplus: Add framebuffer

Sarthak Garg (3):
      arm64: dts: qcom: sm8750: Add SDC2 nodes for sm8750 soc
      arm64: dts: qcom: sm8750-mtp: Add SDC2 node for sm8750 mtp board
      arm64: dts: qcom: sm8750-qrd: Add SDC2 node for sm8750 qrd board

Sibi Sankar (1):
      arm64: dts: qcom: glymur: Add header file for IPCC physical client IDs

Sushrut Shree Trivedi (1):
      arm64: dts: qcom: monaco-evk: Enable PCIe0 and PCIe1.

Taniya Das (2):
      dt-bindings: clock: qcom,x1e80100-gcc: Add missing UFS mux clocks
      arm64: dts: qcom: hamoa: Extend the gcc input clock list

Tingguo Cheng (1):
      arm64: dts: qcom: hamoa-iot-evk: enable PWM RG LEDs

Vikram Sharma (1):
      arm64: dts: qcom: qcs8300: Add support for camss

Vincent Knecht (1):
      arm64: dts: qcom: msm8939: Add camss and cci

Vladimir Zapolskiy (9):
      arm64: dts: qcom: sm8650: Add CAMSS device tree node
      arm64: dts: qcom: sm8650: Add description of MCLK pins
      arm64: dts: qcom: sm8650-qrd: Enable CAMSS and Samsung S5KJN1 camera sensor
      arm64: dts: qcom: sm8650-hdk: Add support for the Rear Camera Card overlay
      arm64: dts: qcom: sm8550-qrd: rename image sensor supply properties
      arm64: dts: qcom: sm8550-qrd: remove data-lanes property of image sensor
      arm64: dts: qcom: sm8550-hdk-rear-camera-card: rename supply properties
      arm64: dts: qcom: sm8550-hdk-rear-camera-card: remove optional property
      arm64: dts: qcom: msm8994-octagon: Fix Analog Devices vendor prefix of AD7147

Xiangxu Yin (2):
      arm64: dts: qcom: talos: Add DisplayPort and QMP USB3-DP PHY
      arm64: dts: qcom: qcs615-ride: Enable DisplayPort

Yingying Tang (1):
      arm64: dts: qcom: hamoa-iot-evk: Add WLAN node for Hamoa IoT EVK board

Yongxing Mou (3):
      arm64: dts: qcom: qcs8300: add display dt nodes for MDSS, DPU, DisplayPort and eDP PHY
      arm64: dts: qcom: qcs8300-ride: Enable Display Port
      arm64: dts: qcom: hamoa-iot-evk: Add backlight support for eDP panel

Yuanjie Yang (2):
      arm64: dts: qcom: talos: switch to interrupt-cells 4 to add PPI partitions
      arm64: dts: qcom: talos: Add PMU support

Ziyue Zhang (7):
      arm64: dts: qcom: qcs8300: enable pcie0
      arm64: dts: qcom: qcs8300-ride: enable pcie0 interface
      arm64: dts: qcom: qcs8300: enable pcie1
      arm64: dts: qcom: qcs8300-ride: enable pcie1 interface
      arm64: dts: qcom: hamoa: Move PHY, PERST, and Wake GPIOs to PCIe port nodes and add port Nodes for all PCIe ports
      arm64: dts: qcom: Add PCIe3 and PCIe5 support for HAMOA-IOT-SOM platform
      arm64: dts: qcom: Add PCIe3 and PCIe5 regulators for HAMAO-IOT-EVK board

 Documentation/devicetree/bindings/arm/qcom.yaml    |   33 +
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |    8 +-
 .../bindings/mailbox/qcom,cpucp-mbox.yaml          |    2 +
 .../devicetree/bindings/mailbox/qcom-ipcc.yaml     |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    6 +
 arch/arm64/boot/dts/qcom/Makefile                  |   30 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   52 +
 arch/arm64/boot/dts/qcom/glymur-ipcc.h             |   68 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  273 +-
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |   80 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  106 +-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |   10 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   10 +-
 arch/arm64/boot/dts/qcom/kaanapali-ipcc.h          |   58 +
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  754 ++++++
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |  712 ++++++
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 1606 ++++++++++++
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   15 +-
 arch/arm64/boot/dts/qcom/lemans-el2.dtso           |   35 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |  127 +-
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |    8 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  486 +++-
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  790 ++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 2633 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts            |  106 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               | 1523 ++++++++++-
 arch/arm64/boot/dts/qcom/msm8917.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/msm8937.dtsi              |    1 +
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   79 +-
 arch/arm64/boot/dts/qcom/msm8939-pm8916.dtsi       |    4 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |  146 ++
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi  |    2 +-
 .../dts/qcom/msm8994-huawei-angler-rev-101.dts     |    2 +-
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |    2 +-
 arch/arm64/boot/dts/qcom/pm7550.dtsi               |   67 +
 arch/arm64/boot/dts/qcom/pm8550vs.dtsi             |    8 +
 arch/arm64/boot/dts/qcom/pmiv0104.dtsi             |   73 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   30 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  128 +
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts | 1410 +++++++++++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  126 +
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi       |   16 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  459 ++++
 .../dts/qcom/qrb2210-rb1-vision-mezzanine.dtso     |   66 +
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   75 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |    2 +-
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |    5 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |    4 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |  130 +-
 arch/arm64/boot/dts/qcom/sdm636.dtsi               |   23 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |  161 ++
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |    8 +-
 .../arm64/boot/dts/qcom/sdm845-google-blueline.dts |   89 +
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |  536 ++++
 .../boot/dts/qcom/sdm845-google-crosshatch.dts     |   36 +
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   45 +-
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |    8 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |    4 +
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |   15 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |   23 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |   49 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |   17 +-
 .../dts/qcom/sdm850-huawei-matebook-e-2019.dts     |   17 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  |    2 +-
 .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    |    2 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |   72 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    4 +
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    4 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   11 +-
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            |    4 +
 .../boot/dts/qcom/sm8550-hdk-rear-camera-card.dtso |    7 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |   16 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |   16 +
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   23 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |   16 +
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    |   16 +
 .../boot/dts/qcom/sm8650-hdk-rear-camera-card.dtso |   88 +
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |   16 +
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   16 +
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   59 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  299 +++
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |   33 +-
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |   27 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  252 +-
 arch/arm64/boot/dts/qcom/talos.dtsi                |  449 ++--
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  | 1322 ++++++++++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |   24 +-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |  153 +-
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |  410 ++-
 .../boot/dts/qcom/x1e80100-asus-zenbook-a14.dts    |    3 +
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |   14 +-
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |    8 +-
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    | 1515 +++++++++++
 .../dts/qcom/x1e80100-microsoft-denali-oled.dts    |   19 +
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |   19 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |   21 +-
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |   90 +
 .../boot/dts/qcom/x1p64100-microsoft-denali.dts    |   15 +
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 include/dt-bindings/clock/qcom,gcc-msm8917.h       |    1 +
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |    3 +
 104 files changed, 17981 insertions(+), 478 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/kaanapali-ipcc.h
 create mode 100644 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/kaanapali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-el2.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
 create mode 100644 arch/arm64/boot/dts/qcom/milos.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm7550.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmiv0104.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm845-google-crosshatch.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-hdk-rear-camera-card.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-microsoft-denali-oled.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p64100-microsoft-denali.dts

