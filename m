Return-Path: <linux-arm-msm+bounces-12467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB1E862920
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 06:01:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 483311F2189B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 05:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 420F27484;
	Sun, 25 Feb 2024 05:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L6GTqxrP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E24233E1
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 05:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708837314; cv=none; b=XICH4G105bSXQJDkBdhBVP43yCEUQkgbcxdgQcvseLJ9pZSgwGbMJzCdsYToABMUQ8ikAFaRf4S9FAVOz9tfxgK7db5ZZXB5SQjo1uvXrEsI6PriRtVj9NXrfFxsQcAro2tZr4ACrfA6ZS8u0TZbE2JxWaRQtO2yT4HjONDTnUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708837314; c=relaxed/simple;
	bh=RyGwbGR1prWocNNmzXRasxVytprTaXXc53uWnuu/L7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kZGam5KsKtDIVPYp3Rz1FfqnIxdCKZxR0sgK71fa3S2f4fTFRc/yV+i80F2peouBzrwz/8Ep6AHQ7snysN3IQxfOQ6PKqUr9Ae8JKq1vVtosBsyvfwymvMJ01a6tnFT99f+v1ZDm6ReQPKuLDo6B+ZSwRz4oHJJ7hlGk0G+aXqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L6GTqxrP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01FFEC433F1;
	Sun, 25 Feb 2024 05:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708837313;
	bh=RyGwbGR1prWocNNmzXRasxVytprTaXXc53uWnuu/L7I=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=L6GTqxrPmzi4Z3g/SL1QS096C2iPcEEnwTaUZEiQBsdVT0WQyDlIGsXBkLhMHhGnL
	 MFWXDM6C9+zxxDK60pLVBan6cqqNkudsd7jiEGNyx+7GtxH1Y2Qe1ltq7UlY+ohufN
	 avCSwHn6FPD3EBujHQrZ1HleK2s1J4fbxk2nW8sVJujmYZFZSO5QsIuWmJ/1q0Haf0
	 lZTrQ7Mkkt1zQ3hNFAwJ2wswbXf0kD+dDN7gwdM6e6k3N7anXAmJtO2SDq1xehSUeb
	 yAolEqLFJ9v9bZPFKRFYdO5tqqIQxTmlgog5lvXiFk39ejCVuppv4Z+LXYGci4n9Ko
	 kuvIOH7sxFm9A==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	David Wronek <davidwronek@gmail.com>,
	Mark Hasemeyer <markhas@chromium.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Fenglin Wu <quic_fenglinw@quicinc.com>,
	Joe Mason <buddyjojo06@outlook.com>,
	Komal Bajaj <quic_kbajaj@quicinc.com>,
	Ling Xu <quic_lxu5@quicinc.com>,
	Mantas Pucka <mantas@8devices.com>,
	Ankit Sharma <quic_anshar@quicinc.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Hui Liu <quic_huliu@quicinc.com>,
	Isaev Ruslan <legale.legale@gmail.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Lucas Karpinski <lkarpins@redhat.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	Ninad Naik <quic_ninanaik@quicinc.com>,
	Raymond Hackley <raymondhackley@protonmail.com>,
	Stefan Hansson <newbyte@postmarketos.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Suraj Jaiswal <quic_jsuraj@quicinc.com>,
	Umang Chheda <quic_uchheda@quicinc.com>,
	Vignesh Viswanathan <quic_viswanat@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Walter Broemeling <wallebroem@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [GIT PULL] Qualcomm ARM64 DeviceTree updates for v6.9
Date: Sat, 24 Feb 2024 23:01:45 -0600
Message-ID: <20240225050146.484422-1-andersson@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.9

for you to fetch changes up to f176168bcb95bd1fdd32f5a794e68b7a36ac8740:

  arm64: dts: qcom: sm6115: fix USB PHY configuration (2024-02-20 11:54:53 -0600)

----------------------------------------------------------------
Qualcomm ARM64 DeviceTree updates for v6.9

Four variants of Samsung Galaxy Core Prime and Grand Prime, built on
MSM8916, and the Hardware Development Kit (HDK) for SM8550, are
introduced.

On X Elite audio and compute remoteprocs, IPCC, PCIe, AOSS QMP, SMP2P,
TCSR, USB, display, audio, and soundwire support is introduced, and
enabled across the CRD and QCP devices.

For SM8650 PCIe controllers are moved to GIC-ITS and msi-map-mask is
defined. Missing qlink-logging reserved-memory region is added for the
modem remoteproc. FastRPC compute contexts are marked dma-coherent.
Audio, USB Type-C and PM8010 support is introduced across MTP and QRD
devices.

GPU cooling devices are hooked up across MSM8916, MSM8939, SC8180X,
SDM630, SDM845, SM6115, SM8150, SM8250, SM8350, and SM8550.

UFS PHY clocks are corrected across MSM8996, MSM8998, SC8180X, SC8280XP,
SDM845, SM6115, SM6125, SM8150, SM8250, SM8350, SM8550, and SM8650.

PCI MSI interrupts are wired up across SM8150, SM8250, SM8350, SM8450,
SM8550, SM8650, SC7280, and SC8180X

On IPQ6018 QUP5 I2C, tsens sand thermal zones are defined. The Inline
Crypto Engine (ICE) is enabled for IPQ9574.

On MSM8953 the GPU and its IOMMU is introduced, the reset for the
display subsystem is also wired up.

VLS CLAMP registers are specified for USB3 PHYs on MSM8998, QCM2290, and
SM6115.

USB Type-C port management is enabled on QRB4210 RB2.

On the SA8295P ADP the MAX20411 regulator powering the GPU rails is
introduced and the GPU is enabled. The first PCI instance on SA8540P
Ride is disabled for now, as a fix for the interrupt storm produced here
has not been presented.

On SA8775P the firmware memory map has changed and is updated. Safety
IRQ is added to the Ethernet controller.

On SC7180 UFS support is introduced and the cros-ec-spi is marked as
wakeup source.

For SC7280 capacity and DPC properties are added, cryptobam definition
is improved to work in more firmware environments, more Chrome-specific
properties are moved out from main dtsi, and cros-ec-spi is maked as a
wakeup source. Slimbus definition is added to the platform.

A missing reserved-memory range is added to Fairphone FP5, PMIC GLINK
and Venus are enabled. LEDs are introduced and voltage settings
corrected on the QCM6490 IDP, and RB3gen2 sees the same voltage changes
and GCC protected clocks are introduced to make the board boot properly.

RPMh sleep stats and a variety of cleanups and fixes are introduced for
SC8180X.

On SC8280XP the additional tsens instances are introduced. Camera
Subsystem and Camera Control Interface (CCI) are added. PMIC die-temp
vadc channels are introduced on the CRD, to allow ADC channels to be
tied to the shared PMIC temp-alarms, to actually report temperature.

On SDM630 USB QMP PHY support is introduced and enabled on the Inforce
IFC6560 board. On the various Sony Xperia XA2 variants WLED is enabled
and configured.

On SM6350 display subsystem interconnects and tsens-based thermal zones
are added. On SM7125 UFS support is added.

On Fairphone FP4, on SM7225, display and GPU are enabled, and firmware
paths are corrected.

SM8150 PCIe controller definitions are corrected.

As with SM8650, the SM8550 the fastrpc compute contexts are marked
dm-coherent, and PCIe controllers are moved to use GIC-ITS. The UFS
controller frequency definition is moved to the generic opp-table.
Touchscreen is enabled on the QRD device.

As usual, a variety of smaller cleanups and corrections to match
DeviceTree bindings and style guidelines are introduced across the
various files.

----------------------------------------------------------------
Abel Vesa (9):
      dt-bindings: clock: Drop the SM8650 DISPCC dedicated schema
      dt-bindings: clock: qcom: Document the X1E80100 TCSR Clock Controller
      arm64: dts: qcom: x1e80100: Add TCSR node
      arm64: dts: qcom: x1e80100: Add USB nodes
      arm64: dts: qcom: x1e80100: Add PCIe nodes
      arm64: dts: qcom: x1e80100: Add display nodes
      arm64: dts: qcom: x1e80100-crd: Enable more support
      arm64: dts: qcom: x1e80100-qcp: Enable more support
      arm64: dts: qcom: x1e80100-qcp: Fix supplies for LDOs 3E and 2J

Ankit Sharma (1):
      arm64: dts: qcom: sc7280: Add capacity and DPC properties

Bjorn Andersson (10):
      arm64: dts: qcom: sa8540p: Drop gfx.lvl as power-domain for gpucc
      arm64: dts: qcom: sa8295p-adp: add max20411
      arm64: dts: qcom: sa8295p-adp: Enable GPU
      Merge branch '20240202-x1e80100-clock-controllers-v4-5-7fb08c861c7c@linaro.org' into arm64-for-6.9
      Merge branch '20240125-msm8953-mdss-reset-v2-1-fd7824559426@z3ntu.xyz' into arm64-for-6.9
      Merge branch '20240131-ufs-phy-clock-v3-3-58a49d2f4605@linaro.org' into HEAD
      arm64: dts: qcom: sc8280xp: Introduce additional tsens instances
      arm64: dts: qcom: sc8280xp-crd: Add PMIC die-temp vadc channels
      arm64: dts: qcom: sc8280xp-pmics: Define adc for temp-alarms
      arm64: dts: qcom: qcs6490-rb3gen2: Declare GCC clocks protected

Bryan O'Donoghue (2):
      arm64: dts: qcom: sc8280xp: camss: Add CCI definitions
      arm64: dts: qcom: sc8280xp: camss: Add CAMSS block definition

Christian Marangi (1):
      arm64: dts: qcom: ipq8074: add clock-frequency to MDIO node

David Heidelberg (1):
      arm64: dts: qcom: sdm845-oneplus-common: improve DAI node naming

David Wronek (3):
      dt-bindings: arm: qcom: Add Xiaomi Redmi Note 9S
      arm64: dts: qcom: sc7180: Add UFS nodes
      arm64: dts: qcom: sm7125-xiaomi-common: Add UFS nodes

Dmitry Baryshkov (12):
      arm64: dts: qcom: rename PM2250 to PM4125
      arm64: dts: qcom: sdm630: add USB QMP PHY support
      arm64: dts: qcom: sda660-ifc6560: enable USB 3.0 PHY
      dt-bindings: arm: qcom: drop the superfluous device compatibility schema
      arm64: dts: qcom: msm8998: declare VLS CLAMP register for USB3 PHY
      arm64: dts: qcom: qcm2290: declare VLS CLAMP register for USB3 PHY
      arm64: dts: qcom: sm6115: declare VLS CLAMP register for USB3 PHY
      arm64: dts: qcom: qrb2210-rb1: disable cluster power domains
      arm64: dts: qcom: pmi632: define USB-C related blocks
      arm64: dts: qcom: qrb4210-rb2: enable USB-C port handling
      arm64: dts: qcom: pm4125: define USB-C related blocks
      arm64: dts: qcom: sm6115: fix USB PHY configuration

Fenglin Wu (2):
      arm64: dts: qcom: sm8650-mtp: add PM8010 regulators
      arm64: dts: qcom: sm8650-qrd: add PM8010 regulators

Hui Liu (1):
      arm64: dts: qcom: qcm6490-idp: Add definition for three LEDs

Isaev Ruslan (1):
      arm64: dts: qcom: ipq6018: add QUP5 I2C node

Joe Mason (2):
      arm64: dts: qcom: Add support for Xiaomi Redmi Note 9S
      arm64: dts: qcom: msm8916-samsung-fortuna/rossa: Add fuel gauge

Komal Bajaj (2):
      arm64: dts: qcom: qcm6490-idp: Correct the voltage setting for vph_pwr
      arm64: dts: qcom: qcs6490-rb3gen2: Correct the voltage setting for vph_pwr

Konrad Dybcio (27):
      dt-bindings: clock: gcc-sc8180x: Add the missing CX power domain
      arm64: dts: qcom: sc8180x: Hook up VDD_CX as GCC parent domain
      arm64: dts: qcom: sc8180x: Fix up big CPU idle state entry latency
      arm64: dts: qcom: sc8180x: Add missing CPU off state
      arm64: dts: qcom: sc8180x: Fix eDP PHY power-domains
      arm64: dts: qcom: sc8180x: Don't hold MDP core clock at FMAX
      arm64: dts: qcom: sc8180x: Require LOW_SVS vote for MMCX if DISPCC is on
      arm64: dts: qcom: sc8180x: Add missing CPU<->MDP_CFG path
      arm64: dts: qcom: sc8180x: Shrink aoss_qmp register space size
      arm64: dts: qcom: sc8180x: Add RPMh sleep stats
      arm64: dts: qcom: x1e80100: Add missing system-wide PSCI power domain
      arm64: dts: qcom: x1e80100: Flush RSC sleep & wake votes
      arm64: dts: qcom: msm8916: Hook up GPU cooling device
      arm64: dts: qcom: msm8939: Hook up GPU cooling device
      arm64: dts: qcom: sc8180x: Hook up GPU cooling device
      arm64: dts: qcom: sdm845: Hook up GPU cooling device
      arm64: dts: qcom: sm6115: Hook up GPU cooling device
      arm64: dts: qcom: sm6115: Mark GPU @ 125C critical
      arm64: dts: qcom: sm8150: Hook up GPU cooling device
      arm64: dts: qcom: sm8250: Hook up GPU cooling device
      arm64: dts: qcom: sm8350: Hook up GPU cooling device
      arm64: dts: qcom: sm8450: Hook up GPU cooling device
      arm64: dts: qcom: sm8550: Hook up GPU cooling device
      arm64: dts: qcom: sdm630: Hook up GPU cooling device
      arm64: dts: qcom: sm8450: Add missing interconnects to serial
      arm64: dts: qcom: sdm845: Use the Low Power Island CX/MX for SLPI
      arm64: dts: qcom: sm8550: Switch UFS from opp-table-hz to opp-v2

Krishna Kurapati (4):
      arm64: dts: qcom: Fix hs_phy_irq for QUSB2 targets
      arm64: dts: qcom: Fix hs_phy_irq for non-QUSB2 targets
      arm64: dts: qcom: Fix hs_phy_irq for SDM670/SDM845/SM6350
      arm64: dts: qcom: Add missing interrupts for qcs404/ipq5332

Krishna chaitanya chundru (1):
      arm64: dts: qcom: sc7280: Add additional MSI interrupts

Krzysztof Kozlowski (32):
      arm64: dts: qcom: x1e80100: drop qcom,drv-count
      arm64: dts: qcom: sm8150: add necessary ref clock to PCIe
      arm64: dts: qcom: sm8450-hdk: correct AMIC4 and AMIC5 microphones
      arm64: dts: qcom: sm8150: describe all PCI MSI interrupts
      arm64: dts: qcom: sm8250: describe all PCI MSI interrupts
      arm64: dts: qcom: sm8350: describe all PCI MSI interrupts
      arm64: dts: qcom: sm8450: describe all PCI MSI interrupts
      arm64: dts: qcom: sm8550: describe all PCI MSI interrupts
      arm64: dts: qcom: sm8650: describe all PCI MSI interrupts
      arm64: dts: qcom: split PCIe interrupt-names entries per lines
      arm64: dts: qcom: x1e80100: add ADSP GPR
      arm64: dts: qcom: x1e80100: add LPASS LPI pin controller
      arm64: dts: qcom: x1e80100: add ADSP audio codec macros
      arm64: dts: qcom: x1e80100: add Soundwire controllers
      arm64: dts: qcom: x1e80100-crd: add WCD9385 Audio Codec
      arm64: dts: qcom: x1e80100-crd: add WSA8845 speakers
      arm64: dts: qcom: sm8550-qrd: correct WCD9385 TX port mapping
      arm64: dts: qcom: sm8550-mtp: correct WCD9385 TX port mapping
      arm64: dts: qcom: sm8550-qrd: add correct analogue microphones
      arm64: dts: qcom: sm8550-mtp: add correct analogue microphones
      arm64: dts: sc8280xp: correct DMIC2 and DMIC3 pin config node names
      arm64: dts: sm8450: correct DMIC2 and DMIC3 pin config node names
      arm64: dts: sm8550: correct DMIC2 and DMIC3 pin config node names
      arm64: dts: sm8650: correct DMIC2 and DMIC3 pin config node names
      arm64: dts: x1e80100: correct DMIC2 and DMIC3 pin config node names
      arm64: dts: qcom: x1e80100-crd: add sound card
      arm64: dts: qcom: ssm7125-xiaomi: drop incorrect UFS phy max current
      arm64: dts: qcom: minor whitespace cleanup
      arm64: dts: qcom: sc8180x: describe all PCI MSI interrupts
      arm64: dts: qcom: sdm845-db845c: correct PCIe wake-gpios
      arm64: dts: qcom: sm8150: correct PCIe wake-gpios
      arm64: dts: qcom: replace underscores in node names

Ling Xu (2):
      arm64: dts: qcom: sm8550: Add dma-coherent property
      arm64: dts: qcom: sm8650: Add dma-coherent property

Luca Weiss (11):
      arm64: dts: qcom: sc7280: Move video-firmware to chrome-common
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable venus node
      arm64: dts: qcom: sc7280: Add static properties to cryptobam
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add missing reserved-memory
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PMIC GLINK
      arm64: dts: qcom: sm7225-fairphone-fp4: Switch firmware ext to .mbn
      arm64: dts: qcom: sm6350: Add tsens thermal zones
      arm64: dts: qcom: sm6350: Add interconnect for MDSS
      arm64: dts: qcom: sm6350: Remove "disabled" state of GMU
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable display and GPU
      arm64: dts: qcom: pmi632: Add PBS client and use in LPG node

Lucas Karpinski (1):
      arm64: dts: qcom: sa8540p-ride: disable pcie2a node

Manivannan Sadhasivam (15):
      dt-bindings: clock: qcom: Add missing UFS QREF clocks
      arm64: dts: qcom: msm8996: Fix UFS PHY clocks
      arm64: dts: qcom: msm8998: Fix UFS PHY clocks
      arm64: dts: qcom: sdm845: Fix UFS PHY clocks
      arm64: dts: qcom: sm6115: Fix UFS PHY clocks
      arm64: dts: qcom: sm6125: Fix UFS PHY clocks
      arm64: dts: qcom: sm6350: Fix UFS PHY clocks
      arm64: dts: qcom: sm8150: Fix UFS PHY clocks
      arm64: dts: qcom: sm8250: Fix UFS PHY clocks
      arm64: dts: qcom: sc8180x: Fix UFS PHY clocks
      arm64: dts: qcom: sc8280xp: Fix UFS PHY clocks
      arm64: dts: qcom: sm8350: Fix UFS PHY clocks
      arm64: dts: qcom: sm8550: Fix UFS PHY clocks
      arm64: dts: qcom: sm8650: Fix UFS PHY clocks
      arm64: dts: sm8650: Add msi-map-mask for PCIe nodes

Mantas Pucka (2):
      arm64: dts: qcom: ipq6018: add tsens node
      arm64: dts: qcom: ipq6018: add thermal zones

Marijn Suijten (1):
      arm64: dts: qcom: sdm630-nile: Enable and configure PM660L WLED

Mark Hasemeyer (3):
      arm64: dts: qcom: sc7180: Enable cros-ec-spi as wake source
      arm64: dts: qcom: sc7280: Enable cros-ec-spi as wake source
      arm64: dts: qcom: sdm845: Enable cros-ec-spi as wake source

Maulik Shah (1):
      arm64: dts: qcom: sc7280: Update domain-idle-states for cluster sleep

Neil Armstrong (10):
      dt-bindings: arm: qcom: Document the HDK8550 board
      arm64: dts: qcom: sm8550: add support for the SM8550-HDK board
      arm64: dts: qcom: sm8550-qrd: enable Touchscreen
      arm64: dts: qcom: sm8650-qrd: add USB-C Altmode Support
      arm64: dts: qcom: sm8650: Use GIC-ITS for PCIe0 and PCIe1
      arm64: dts: qcom: sm8650: add missing qlink_logging reserved memory for mpss
      arm64: dts: qcom: sm8650-qrd: add Audio nodes
      arm64: dts: qcom: sm8650-mtp: add Audio sound card node
      arm64: dts: qcom: sm8550-hdk: correct WCD9385 route and port mapping
      arm64: dts: qcom: sm8550: Use GIC-ITS for PCIe0 and PCIe1

Ninad Naik (1):
      arm64: dts: qcom: sa8775p: Add new memory map updates to SA8775P

Rajendra Nayak (3):
      dt-bindings: clock: qcom: Document the X1E80100 Display Clock Controller
      dt-bindings: clock: qcom: Document the X1E80100 GPU Clock Controller
      dt-bindings: clock: qcom: Document the X1E80100 Camera Clock Controller

Raymond Hackley (1):
      dt-bindings: qcom: Document new msm8916-samsung devices

Sibi Sankar (4):
      arm64: dts: qcom: x1e80100: Add IPCC node
      arm64: dts: qcom: x1e80100: Add SMP2P nodes
      arm64: dts: qcom: x1e80100: Add QMP AOSS node
      arm64: dts: qcom: x1e80100: Add ADSP/CDSP remoteproc nodes

Stefan Hansson (1):
      dt-bindings: arm: qcom: Add Samsung Galaxy Tab 4 10.1 LTE

Stephan Gerhold (1):
      arm64: dts: qcom: apq8016-sbc-d3-camera: Use more generic node names

Suraj Jaiswal (1):
      arm64: dts: qcom: sa8775p: enable safety IRQ

Umang Chheda (1):
      arm64: dts: qcom: qcm6490-idp: Include PM7250B

Vignesh Viswanathan (1):
      arm64: dts: qcom: ipq9574: Enable Inline Crypto Engine for MMC

Viken Dadhaniya (1):
      arm64: dts: qcom: sc7280: add slimbus DT node

Vladimir Lypak (4):
      dt-bindings: clock: gcc-msm8953: add more resets
      arm64: dts: qcom: msm8953: add reset for display subsystem
      arm64: dts: qcom: msm8953: Add GPU IOMMU
      arm64: dts: qcom: msm8953: Add GPU

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm6115: drop pipe clock selection

Walter Broemeling (1):
      arm64: dts: qcom: msm8916-samsung-fortuna/rossa: Add initial device trees

Yassine Oudjana (1):
      arm64: dts: qcom: msm8996: Define UFS UniPro clock limits

 Documentation/devicetree/bindings/arm/qcom.yaml    |   58 +-
 .../bindings/clock/qcom,gcc-sc8180x.yaml           |    7 +
 .../bindings/clock/qcom,sm8450-camcc.yaml          |    2 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    7 +-
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    1 +
 .../bindings/clock/qcom,sm8650-dispcc.yaml         |  106 --
 arch/arm/boot/dts/qcom/qcom-sdx55.dtsi             |   14 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi             |   14 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    6 +
 .../dts/qcom/apq8016-sbc-d3-camera-mezzanine.dts   |    8 +-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |    8 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  159 ++
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   16 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   12 +-
 .../boot/dts/qcom/msm8216-samsung-fortuna3g.dts    |   11 +
 .../dts/qcom/msm8916-samsung-fortuna-common.dtsi   |  203 +++
 .../boot/dts/qcom/msm8916-samsung-gprimeltecan.dts |   27 +
 .../dts/qcom/msm8916-samsung-grandprimelte.dts     |   16 +
 .../dts/qcom/msm8916-samsung-rossa-common.dtsi     |   16 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts |   16 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |    9 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |   11 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  155 +-
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |    2 +-
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi     |    2 +-
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   18 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   26 +-
 .../boot/dts/qcom/{pm2250.dtsi => pm4125.dtsi}     |   38 +-
 arch/arm64/boot/dts/qcom/pmi632.dtsi               |   39 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |    7 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |   56 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |   39 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |   16 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   23 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |   96 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |   50 +-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |   68 +
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |    4 +-
 arch/arm64/boot/dts/qcom/sa8540p.dtsi              |    3 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  119 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi       |    1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   86 +-
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   28 +
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |    1 +
 arch/arm64/boot/dts/qcom/sc7280-idp-ec-h1.dtsi     |    1 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  125 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  141 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   39 +-
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi       |   39 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  601 ++++++-
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |    5 +
 arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dts   |    2 +-
 arch/arm64/boot/dts/qcom/sdm450.dtsi               |   14 +
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |   16 +
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   62 +-
 arch/arm64/boot/dts/qcom/sdm632.dtsi               |    8 +
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |    6 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |   14 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |    1 +
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |    2 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |    8 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |    2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   63 +-
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   95 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   17 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  597 ++++++-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sm7125-xiaomi-common.dtsi |   26 +
 arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dts |   16 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |   61 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  115 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  107 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   87 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   81 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            | 1306 ++++++++++++++
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |   11 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   53 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  187 +-
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |  155 ++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |  439 ++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   81 +-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |  450 +++++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  175 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 1777 +++++++++++++++++++-
 include/dt-bindings/clock/qcom,gcc-msm8953.h       |    4 +
 include/dt-bindings/clock/qcom,gcc-sc8180x.h       |    2 +
 include/dt-bindings/clock/qcom,x1e80100-camcc.h    |  135 ++
 include/dt-bindings/clock/qcom,x1e80100-dispcc.h   |   98 ++
 include/dt-bindings/clock/qcom,x1e80100-gpucc.h    |   41 +
 include/dt-bindings/clock/qcom,x1e80100-tcsr.h     |   23 +
 include/dt-bindings/reset/qcom,x1e80100-gpucc.h    |   19 +
 95 files changed, 8351 insertions(+), 586 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8650-dispcc.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts
 rename arch/arm64/boot/dts/qcom/{pm2250.dtsi => pm4125.dtsi} (56%)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm450.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-hdk.dts
 create mode 100644 include/dt-bindings/clock/qcom,x1e80100-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,x1e80100-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,x1e80100-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,x1e80100-tcsr.h
 create mode 100644 include/dt-bindings/reset/qcom,x1e80100-gpucc.h

