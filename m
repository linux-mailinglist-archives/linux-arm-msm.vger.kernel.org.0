Return-Path: <linux-arm-msm+bounces-65121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B3509B06C09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 05:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0BF0188C620
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 03:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AACE272811;
	Wed, 16 Jul 2025 03:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpB1X5pa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067BD17A317
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 03:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752635463; cv=none; b=uusZ9nMjzoLKHRYjuRHDhXBk6NrCTd23fx9Ia6YgjA00GgQXcOdQ8qVTodSQ2+gGG9Gty3XBQ5tQ6O4+SEPqWAwVfpXnYK0vQVwna6EZYMlubCO7T+Xrt68/wWw/lSz38eRlQXHK6s2j46NTP27weksd3LV10b0oh8jViPAWPPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752635463; c=relaxed/simple;
	bh=nBjyQ5BHE+tuIIT/DAP5dnbdYgNuHRwX1DkTrChMN78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BRO0V3eeznVRpdH3ydiJCVu1ctqLeqwuVYRvAcExYcV32BqMGnLQ13HZ8gWI/Fh5lm+jxjUtCq3uJ5EZd7tLw6jnSBOmmdqkRzzb7f9pV2ZoL6lknfbSRPpt1iIse7qwtgN5pgMwdh15JZaLjEeVkCqw2O2o8TOgb3gXPTSM+LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpB1X5pa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 804C5C4CEE3;
	Wed, 16 Jul 2025 03:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752635462;
	bh=nBjyQ5BHE+tuIIT/DAP5dnbdYgNuHRwX1DkTrChMN78=;
	h=From:To:Cc:Subject:Date:From;
	b=WpB1X5pa1J3JbdHTgn1GJBt5blAM5v2CUyNGVKi060YI+nsdXp/mciQWgfLVPkc7+
	 6kqMIwnCVmiO09jRtCoLWsNAr1iWj89E1E/QoL74HW6AdxonjTuXxbsOy7tuctEtxT
	 Wuv46/bBMKH2ogbSFhz6fjoZkeMm0yk7h6PEPNtgPOoAPQCEl0HGC2KZsfvGopTszV
	 OnVgoHQpJAK1n+giwOEsr8TP+izDk1K4gccHX6Ej5hN6VFiWDXOHMrzLfc0cv8w0cV
	 cDb+LgAWejKUSfs+mnjJ9kr1r8euH0JxPsEARqT2q4I01ErT+7nhG/sTW7nYN3mBpq
	 eRFi1RxvY8ZwQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Lijuan Gao <quic_lijuang@quicinc.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Ayushi Makhija <quic_amakhija@quicinc.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Kyle Deng <quic_chunkaid@quicinc.com>,
	Lijuan Gao <lijuan.gao@oss.qualcomm.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Wenmeng Liu <quic_wenmliu@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.17
Date: Tue, 15 Jul 2025 22:10:57 -0500
Message-ID: <20250716031059.76348-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.17

for you to fetch changes up to 7de0d60f6345e701ca8b9a05fe2faa03ad868ccf:

  arm64: dts: qcom: sm8150: Drop unrelated clocks from PCIe hosts (2025-07-03 15:58:23 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree updates for v6.17

79b896e7da7e arm64: dts: qcom: msm8976-longcheer-l9360: Add initial device tree
6516961352a1 arm64: dts: qcom: Add support for X1-based Asus Zenbook A14

The DB410c D3 camera mezzanine is converted to an overlay.

On MSM8976 SDC2 pinctrl definitions are introduced and BLSP DMA
controller is marked to be managed by another entity.

Add camera subsystem on the QCM2290 platform.

Add and enable remoteproc and related devices on QCS615.

Add and enable Video encoder/decoder on QCS8300 and SA8775P.
Also on SA8775P add CPU OPP tables for scaling DDR/L3 bandwidth based on
CPU frequency, add L3 interconnect definitions, DSI and video
encoder/decoder support.

Enable the SLPI remoteproc on SDM850-based Lenovo Yoga C630.

On SM6350, add the video clock controller, APR and some audio related
services.

Describe the camera subsystem on SM8550 and add Iris video
encoder/decoder node for SM8650.

On SM8750 introduce UFS and Soundwire support, enable these and describe
the sound hardware on MTP and QRD.

Add camera clock controller on SC8180X.

On X Elite, for the Dell XPS13, add WiFi and Bluetooth pwrseq and enable
the fingerprint sensor. For HP Omnibook X14  USB1 SS1 SBU mux and do
some misc cleanup.

Replace the thermal zones inherited from X Elite with X Plus-specific
ones.

Add missing interrupts and clean up unrelated clocks for PCIe
controllers across a variety of platforms.

----------------------------------------------------------------
Aleksandrs Vinarskis (4):
      arm64: dts: qcom: x1e80100-dell-xps-9345: Add WiFi/BT pwrseq
      arm64: dts: qcom: Add support for X1-based Asus Zenbook A14
      arm64: dts: qcom: x1-asus-zenbook: fixup GPU nodes
      arm64: dts: qcom: x1-asus-zenbook: support sound

André Apitzsch (4):
      arm64: dts: qcom: msm8976: Make blsp_dma controlled-remotely
      dt-bindings: arm: qcom: Add MSM8976 BQ Aquaris X5 Plus
      arm64: dts: qcom: msm8976: Add sdc2 GPIOs
      arm64: dts: qcom: msm8976-longcheer-l9360: Add initial device tree

Ayushi Makhija (2):
      arm64: dts: qcom: sa8775p: add Display Serial Interface device nodes
      arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to DP bridge nodes

Bartosz Golaszewski (1):
      arm64: dts: qcom: sm6115: add debug UART pins

Bjorn Andersson (2):
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable fingerprint sensor
      Merge branch '20250512-sc8180x-camcc-support-v4-2-8fb1d3265f52@quicinc.com' into arm64-for-6.17

Dmitry Baryshkov (1):
      arm64: dts: qcom: sdm850-lenovo-yoga-c630: enable sensors DSP

Eugen Hristev (1):
      arm64: dts: qcom: sm8750: Trivial stray lines removal

Jagadeesh Kona (1):
      arm64: dts: qcom: sa8775p: Add CPU OPP tables to scale DDR/L3

Jens Glathe (3):
      arm64: dts: qcom: x1e80100-hp-x14: add usb-1-ss1-sbu-mux
      arm64: dts: qcom: x1e80100-hp-x14: remove unused i2c buses
      arm64: dts: qcom: x1e80100-hp-x14: amend order of nodes

Jie Gan (2):
      arm64: dts: qcom: qcs615: fix a crash issue caused by infinite loop for Coresight
      arm64: dts: qcom: qcs615: disable the CTI device of the camera block

Konrad Dybcio (5):
      arm64: dts: qcom: x1p42100: Fix thermal sensor configuration
      arm64: dts: qcom: sdm845: Expand IMEM region
      arm64: dts: qcom: sc7180: Expand IMEM region
      arm64: dts: qcom: sc8180x: Drop unrelated clocks from PCIe hosts
      arm64: dts: qcom: sm8150: Drop unrelated clocks from PCIe hosts

Krzysztof Kozlowski (3):
      arm64: dts: qcom: sm8750: Add Soundwire nodes
      arm64: dts: qcom: sm8750-mtp: Add sound (speakers, headset codec, dmics)
      arm64: dts: qcom: sm8750-qrd: Add sound (speakers, headset codec, dmics)

Kyle Deng (1):
      arm64: dts: qcom: qcs615: Add mproc node for SEMP2P

Lijuan Gao (4):
      arm64: dts: qcom: qcs615: Add IMEM and PIL info region
      arm64: dts: qcom: qcs615: add ADSP and CDSP nodes
      arm64: dts: qcom: qcs615-ride: enable remoteprocs
      arm64: dts: qcom: sa8775p: Correct the interrupt for remoteproc

Loic Poulain (1):
      arm64: dts: qcom: qcm2290: Add CAMSS node

Luca Weiss (2):
      arm64: dts: qcom: sm6350: Add video clock controller
      arm64: dts: qcom: sm6350: add APR and some audio-related services

Manivannan Sadhasivam (13):
      arm64: dts: qcom: sm8150: Add 'global' PCIe interrupt
      arm64: dts: qcom: sm8250: Add 'global' PCIe interrupt
      arm64: dts: qcom: sm8350: Add 'global' PCIe interrupt
      arm64: dts: qcom: sa8775p: Add 'global' PCIe interrupt
      arm64: dts: qcom: sc7280: Add 'global' PCIe interrupt
      arm64: dts: qcom: sdm845: Add missing MSI and 'global' IRQs
      arm64: dts: qcom: msm8996: Add missing MSI SPI interrupts
      arm64: dts: qcom: msm8998: Add missing MSI and 'global' IRQs
      arm64: dts: qcom: ipq8074: Add missing MSI and 'global' IRQs
      arm64: dts: qcom: ipq6018: Add missing MSI and 'global' IRQs
      arm64: dts: qcom: sc8180x: Add 'global' PCIe interrupt
      arm64: dts: qcom: sar2130p: Add 'global' PCIe interrupt
      arm64: dts: qcom: x1e80100: Add missing 'global' PCIe interrupt

Maulik Shah (1):
      arm64: dts: qcom: Add QMP handle for qcom_stats

Neil Armstrong (1):
      arm64: dts: qcom: sm8650: add iris DT node

Nitin Rawat (3):
      arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 SoC
      arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 MTP
      arm64: dts: qcom: sm8750: Add UFS nodes for SM8750 QRD board

Pengyu Luo (1):
      arm64: dts: qcom: sm8650: remove unused reg

Raviteja Laggyshetty (1):
      arm64: dts: qcom: sa8775p: add EPSS l3 interconnect provider

Satya Priya Kakitapalli (3):
      dt-bindings: clock: qcom: Add missing bindings on gcc-sc8180x
      dt-bindings: clock: Add Qualcomm SC8180X Camera clock controller
      arm64: dts: qcom: Add camera clock controller for sc8180x

Stephan Gerhold (1):
      arm64: dts: qcom: apq8016-sbc-d3-camera: Convert to DT overlay

Vikash Garodia (4):
      arm64: dts: qcom: qcs8300: add video node
      arm64: dts: qcom: qcs8300-ride: enable video
      arm64: dts: qcom: sa8775p: add support for video node
      arm64: dts: qcom: sa8775p-ride: enable video

Vladimir Zapolskiy (2):
      arm64: dts: qcom: sm8250: enable camcc clock controller by default
      arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: remove camcc status property

Wenmeng Liu (1):
      arm64: dts: qcom: sm8550: Add support for camss

 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../bindings/clock/qcom,sc8180x-camcc.yaml         |   67 +
 arch/arm64/boot/dts/qcom/Makefile                  |   10 +-
 ...ne.dts => apq8016-sbc-d3-camera-mezzanine.dtso} |   12 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   20 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   40 +-
 .../boot/dts/qcom/msm8976-longcheer-l9360.dts      |  490 +++++++
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |   38 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   54 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   20 +-
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |  103 ++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   12 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi               |  148 ++
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |    4 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              |   71 +
 .../dts/qcom/qrb5165-rb5-vision-mezzanine.dtso     |    4 -
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |  238 ++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  515 ++++++-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |   12 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   10 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   14 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   70 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   50 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |    6 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |    9 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   73 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   28 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   19 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |    1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  211 +++
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |    4 +
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |    4 +
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |    4 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   97 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  233 +++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  243 ++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  230 ++-
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  | 1496 ++++++++++++++++++++
 .../boot/dts/qcom/x1e80100-asus-zenbook-a14.dts    |   37 +
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |  203 ++-
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     |   98 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   20 +-
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dts    |  141 ++
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             |  556 ++++++++
 include/dt-bindings/clock/qcom,gcc-sc8180x.h       |   10 +
 include/dt-bindings/clock/qcom,sc8180x-camcc.h     |  181 +++
 47 files changed, 5758 insertions(+), 165 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc8180x-camcc.yaml
 rename arch/arm64/boot/dts/qcom/{apq8016-sbc-d3-camera-mezzanine.dts => apq8016-sbc-d3-camera-mezzanine.dtso} (89%)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
 create mode 100644 include/dt-bindings/clock/qcom,sc8180x-camcc.h

