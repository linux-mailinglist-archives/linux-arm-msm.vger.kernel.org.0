Return-Path: <linux-arm-msm+bounces-44809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D09A0A534
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 19:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D4D3D18899FA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jan 2025 18:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF6FE1B4C35;
	Sat, 11 Jan 2025 18:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lA92R65A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86CD1B4257
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jan 2025 18:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736619031; cv=none; b=b+G7ELHZ7Hfd6AdGvXIGU0JyRzaZNfnUsIE6D14T6PtIyBlX/nplhsKHBqdGtVB6QLnZZ9o1utLlwWSc6vKLNNCOEq+eybG0cCZRiw4jLddVMiRrXGFS86IvJR/2V5DfzVPAXUeZRE4FcbMZCoxcEm2FW3aBKaN99f7ILtdplTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736619031; c=relaxed/simple;
	bh=m7yTdWYxaaDvGmo92qigZ9J4St+PVZ7zZ/lecwBWj4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kLYWE5zfE7IRe0bCqgaUiL/hXFsMIIYkYCedWWYgsapDzIKSY1OUUYVMMsy9VpqDoYSIRwigI2Q1OfJamZuQaP5ptVkJpMTtcMVIlP13JclPPnzajC2ShlW+xXyM1BaaMjjq7vzEUbjMfubpuYYXwTB7PyxknEUcrGJScSAju6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lA92R65A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A631DC4CED2;
	Sat, 11 Jan 2025 18:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736619031;
	bh=m7yTdWYxaaDvGmo92qigZ9J4St+PVZ7zZ/lecwBWj4c=;
	h=From:To:Cc:Subject:Date:From;
	b=lA92R65AHq1akoctlWVn2Vj/MgP5hClPSsKLsQYNaVxj19vLpDyfqkPFTCjKFlpCO
	 7GRzk9QD+E/P3+7bsG1cJ2k8V16UMemcZo9RZR/Srqm/HxaV7m2PJwKXb+znNGX9t5
	 MAhmdvls33Rk45vlswW6/NyonUT/MoOQZpgk1GrnMCKxFFMORoZb6HpWrzj57fCmt2
	 Xaxm1j2dXx6HSam8TZTdWcz3aLMSB7ZpmJ4Nilc6wkzXsPnb6evyefuhA8BVa2ZbCI
	 DsfOy0a3TQANyZ5o1y7PKwQ6elH8C+D3aR3M0KsXnnUbFh2S60xQjHdcUQ+ToEUELI
	 0+9Fs318DXvsg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Prashanth K <quic_prashk@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Lijuan Gao <quic_lijuang@quicinc.com>,
	Jingyi Wang <quic_jingyw@quicinc.com>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Melody Olvera <quic_molvera@quicinc.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Krishna Kurapati <quic_kriskura@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Jianhua Lu <lujianhua000@gmail.com>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Maud Spierings <maud_spierings@hotmail.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Tingguo Cheng <quic_tingguoc@quicinc.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Yuvaraj Ranganathan <quic_yrangana@quicinc.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Konrad Dybcio <quic_kdybcio@quicinc.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Qingqing Zhou <quic_qqzhou@quicinc.com>,
	Sayali Lokhande <quic_sayalil@quicinc.com>,
	Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Yijie Yang <quic_yijiyang@quicinc.com>,
	Yuanjie Yang <quic_yuanjiey@quicinc.com>,
	devi priya <quic_devipriy@quicinc.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Anthony Ruhier <aruhier@mailbox.org>,
	Dang Huynh <danct12@riseup.net>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Joel Stanley <joel@jms.id.au>,
	Kyle Deng <quic_chunkaid@quicinc.com>,
	Ling Xu <quic_lxu5@quicinc.com>,
	Mahadevan <quic_mahap@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Marek Vasut <marex@denx.de>,
	Maulik Shah <quic_mkshah@quicinc.com>,
	=?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
	Petr Vorel <petr.vorel@gmail.com>,
	Qiang Yu <quic_qianyu@quicinc.com>,
	Rakesh Kota <quic_kotarake@quicinc.com>,
	Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Song Xue <quic_songxue@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Xin Liu <quic_liuxin@quicinc.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.14
Date: Sat, 11 Jan 2025 12:10:24 -0600
Message-ID: <20250111181025.394631-1-andersson@kernel.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.14

for you to fetch changes up to 983833061d9599a534e44fd6d335080d1a0ba985:

  arm64: dts: qcom: x1e80100-romulus: Update firmware nodes (2025-01-09 17:13:58 -0600)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree updates for v6.14

This adds support for the new Snapdragon 8 Elite platform with MTP and
QRD boards, QCS615 platform with the Ride board, QCS8300 platform with
its Ride board, IPQ5424 platform with the RDP466 board, MSM8917 platform
with Xiaomi Redmi 5A, and the SAR2130P platform with the Snapdragon AR2
Gen1 Smart Viewer Development Kit.

On X Elite the HP Omnibook X laptop and the Snapdragon Devkit are added.
The 8cx Gen3-based Huawaei Matebook E Go and Microsoft Windows Dev Kit
2023 are introduced.

IPQ9574 gains PCIe and TRNG descriptions, together with a few other
smaller improvements. TRNG is also enabled on the IPQ5332 platform.

On MSM8994, Huawei Nexus 6P gains power and volume keys support. USB
interrupts are corrected.

On QCM6490 the FairPhone 5 gains camera EEPROM and Rb3Gen2 development
kit gains description of the onboard LEDs.

On QRB4210 RB2 support for HDMI audio playback is added.

SA8775P gains missing clock controllers, CPUs are tied to PSCI power
domains, DisplayPort is introduced and enabled on the Ride board.

On SDM670 the GPU components are described and enabled for Google Pixel
3a, together with camera clock controller and flash LED.

Xiaomi Mi Pad 5 Pro, on SM8250, gets WiFi and Bluetooth enabled.

"global" IRQ for PCIe RC controllers are described on SM8550 and SM8650,
to allow for hotplug events.

Coresight support is added for SM8450, SM8650, X 1 Elite, QCS615,
and QCS8300.

The X Elite platform gains QUP power domains and OPPs, another PCIe
controller, another UART, and its SDHCI controllers. The ASUS Vivobook S
15 gets GPU and lid switch enabled. Microsoft Surface Laptop 7 gains
audio configuration, SD card reader support, and USB retimers. The
Lenovo Yoga Slim 7x gets its LID switch described. Dell XPS 13 gains
retimers described. The Lenovo Thinkpad T14s has additional USB ports
enabled, as well as sound and fingerprint sensor.

USB U1/U2 entry is disabled across a variety of platforms, to improve
USB stability.

sleep clock frequencies are reviewed and corrected for a variety of
platforms, so is also various remoteproc mmio address ranges.

----------------------------------------------------------------
Abel Vesa (7):
      arm64: dts: qcom: x1e80100: Describe the SDHC controllers
      arm64: dts: qcom: x1e80100-qcp: Enable SD card support
      arm64: dts: qcom: x1e78100-t14s: Enable support for both Type-A USB ports
      arm64: dts: qcom: x1e78100-qcp: Enable Type-A USB ports labeled 3 and 4/6
      arm64: dts: qcom: x1e80100: Fix interconnect tags for SDHC nodes
      arm64: dts: qcom: x1e78100-t14s: Enable fingerprint reader
      arm64: dts: qcom: x1e80100: Fix usb_2 controller interrupts

Aleksandrs Vinarskis (1):
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Introduce retimer support

Alexey Klimov (4):
      arm64: dts: qcom: sm6115: add apr and its services
      arm64: dts: qcom: sm6115: add LPASS LPI pin controller
      arm64: dts: qcom: sm4250: add LPASS LPI pin controller
      arm64: dts: qcom: qrb4210-rb2: add HDMI audio playback support

Anthony Ruhier (1):
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add lid switch

Barnabás Czémán (2):
      dt-bindings: arm: qcom: Add Xiaomi Redmi 5A
      arm64: dts: qcom: Add Xiaomi Redmi 5A

Bjorn Andersson (8):
      Merge branch '20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org' into arm64-for-6.13
      Merge branch 'icc-sar2130p' of https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc into HEAD
      Merge branch '20241028060506.246606-3-quic_srichara@quicinc.com' into arm64-for-6.13
      Merge branch 'arm64-for-6.13' into arm64-for-6.14
      Merge branch '20241022-qcs615-clock-driver-v4-0-3d716ad0d987@quicinc.com' into HEAD
      Merge branches '20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com' and '20250106-sm8750-dispcc-v2-1-6f42beda6317@linaro.org' into arm64-for-6.14
      Merge branch 'icc-sm8750' of https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc into arm64-for-6.14
      Merge branch '20250103-qcom_ipq_cmnpll-v8-1-c89fb4d4849d@quicinc.com' into arm64-for-6.14

Dang Huynh (1):
      arm64: dts: qcom: Add PM8937 PMIC

Dmitry Baryshkov (27):
      dt-bindings: arm: qcom: add QAR2130P board
      arm64: dts: qcom: sar2130p: add support for SAR2130P
      arm64: dts: qcom: sar2130p: add QAR2130P board file
      arm64: dts: qcom: sm8350-hdk: enable IPA
      arm64: dts: qcom: sm8550: correct MDSS interconnects
      arm64: dts: qcom: sm8650: correct MDSS interconnects
      arm64: dts: qcom: msm8916: correct sleep clock frequency
      arm64: dts: qcom: msm8939: correct sleep clock frequency
      arm64: dts: qcom: msm8994: correct sleep clock frequency
      arm64: dts: qcom: qcs404: correct sleep clock frequency
      arm64: dts: qcom: q[dr]u1000: correct sleep clock frequency
      arm64: dts: qcom: qrb4210-rb2: correct sleep clock frequency
      arm64: dts: qcom: sar2130p: correct sleep clock frequency
      arm64: dts: qcom: sc7280: correct sleep clock frequency
      arm64: dts: qcom: sdx75: correct sleep clock frequency
      arm64: dts: qcom: sm4450: correct sleep clock frequency
      arm64: dts: qcom: sm6125: correct sleep clock frequency
      arm64: dts: qcom: sm6375: correct sleep clock frequency
      arm64: dts: qcom: sm8250: correct sleep clock frequency
      arm64: dts: qcom: sm8350: correct sleep clock frequency
      arm64: dts: qcom: sm8450: correct sleep clock frequency
      arm64: dts: qcom: sm8550: correct sleep clock frequency
      arm64: dts: qcom: sm8650: correct sleep clock frequency
      arm64: dts: qcom: x1e80100: correct sleep clock frequency
      arm64: dts: qcom: sc8180x: drop extra XO clock frequencies
      arm64: dts: qcom: sdm670: move board clocks to sdm670.dtsi file
      arm64: dts: qcom: q[dr]u1000: move board clocks to qdu1000.dtsi file

Gabor Juhos (1):
      dt-bindings: arm: qcom: add missing elements to the SoC list

Imran Shaik (1):
      arm64: dts: qcom: qcs8300: Add support for clock controllers

Jens Glathe (4):
      dt-bindings: arm: qcom: Add HP Omnibook X 14
      arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14
      dt-bindings: arm: qcom: Add Microsoft Windows Dev Kit 2023
      arm64: dts: qcom: sc8280xp-blackrock: dt definition for WDK2023

Jianhua Lu (3):
      arm64: dts: qcom: sm8250-xiaomi-elish: Add qca6390-pmu node
      arm64: dts: qcom: sm8250-xiaomi-elish: Add wifi node
      arm64: dts: qcom: sm8250-xiaomi-elish: Add bluetooth node

Jie Gan (3):
      arm64: dts: qcom: qcs615: Add coresight nodes
      arm64: dts: qcom: qcs8300: Add coresight nodes
      arm64: dts: qcom: x1e80100: Add coresight nodes

Jingyi Wang (6):
      dt-bindings: arm: qcom: document QCS8300 SoC and reference board
      arm64: dts: qcom: add QCS8300 platform
      arm64: dts: qcom: qcs8300: add base QCS8300 RIDE board
      arm64: dts: qcom: qcs8300: Add PMU support for QCS8300
      arm64: dts: qcom: qcs8300: Add LLCC support for QCS8300
      arm64: dts: qcom: qcs8300: Add capacity and DPC properties

Joel Stanley (1):
      arm64: dts: qcom: x1e80100-romulus: Update firmware nodes

Konrad Dybcio (12):
      arm64: dts: qcom: x1e80100-romulus: Configure audio
      arm64: dts: qcom: x1e80100-romulus: Set up PCIe3 / SDCard reader
      arm64: dts: qcom: x1e80100-romulus: Set up PS8830s
      dt-bindings: arm: qcom-soc: Extend X1E prefix match for X1P
      dt-bindings: arm: qcom: Add X1P42100 SoC & CRD
      arm64: dts: qcom: pmk8350: Add more SDAM slices
      arm64: dts: qcom: qcs6490-rb3gen2: Configure onboard LEDs
      arm64: dts: qcom: sa8775p: Use a SoC-specific compatible for GPI DMA
      arm64: dts: qcom: sa8775p: Use valid node names for GPI DMAs
      arm64: dts: qcom: msm8996: Fix up USB3 interrupts
      arm64: dts: qcom: msm8994: Describe USB interrupts
      arm64: dts: qcom: sc8280xp: Fix up remoteproc register space sizes

Krishna Kurapati (14):
      arm64: dts: qcom: qcs615: Add primary USB interface
      arm64: dts: qcom: qcs615-ride: Enable primary USB interface
      arm64: dts: qcom: qcs615: Add support for secondary USB node on QCS615
      arm64: dts: qcom: qcs615-ride: Enable secondary USB controller on QCS615 Ride
      arm64: dts: qcom: sm8350: Disable USB U1/U2 entry
      arm64: dts: qcom: sm8450: Disable USB U1/U2 entry
      arm64: dts: qcom: sm8150: Disable USB U1/U2 entry
      arm64: dts: qcom: sm6125: Disable USB U1/U2 entry
      arm64: dts: qcom: sm8250: Disable USB U1/U2 entry
      arm64: dts: qcom: sm6350: Disable USB U1/U2 entry
      arm64: dts: qcom: sc7280: Disable USB U1/U2 entry
      arm64: dts: qcom: sa8775p: Disable USB U1/U2 entry
      arm64: dts: qcom: qcs8300: Add support for usb nodes
      arm64: dts: qcom: qcs8300-ride: Enable USB controllers

Krzysztof Kozlowski (25):
      arm64: dts: qcom: sm8650: Fix CDSP context banks unit addresses
      dt-bindings: clock: qcom,sm8550-dispcc: Add SM8750 DISPCC
      arm64: dts: qcom: sm8350: Fix ADSP memory base and length
      arm64: dts: qcom: sm8350: Fix CDSP memory base and length
      arm64: dts: qcom: sm8350: Fix MPSS memory length
      arm64: dts: qcom: sm8450: Fix ADSP memory base and length
      arm64: dts: qcom: sm8450: Fix CDSP memory length
      arm64: dts: qcom: sm8450: Fix MPSS memory length
      arm64: dts: qcom: sm8550: Fix ADSP memory base and length
      arm64: dts: qcom: sm8550: Fix CDSP memory length
      arm64: dts: qcom: sm8550: Fix MPSS memory length
      arm64: dts: qcom: sm8650: Fix ADSP memory base and length
      arm64: dts: qcom: sm8650: Fix CDSP memory length
      arm64: dts: qcom: sm8650: Fix MPSS memory length
      arm64: dts: qcom: x1e80100: Fix ADSP memory base and length
      arm64: dts: qcom: x1e80100: Fix CDSP memory length
      arm64: dts: qcom: sm6350: Fix ADSP memory length
      arm64: dts: qcom: sm6350: Fix MPSS memory length
      arm64: dts: qcom: sm6375: Fix ADSP memory length
      arm64: dts: qcom: sm6375: Fix CDSP memory base and length
      arm64: dts: qcom: sm6375: Fix MPSS memory base and length
      arm64: dts: qcom: sdx75: Fix MPSS memory length
      arm64: dts: qcom: sm6115: Fix MPSS memory length
      arm64: dts: qcom: sm6115: Fix CDSP memory length
      arm64: dts: qcom: sm6115: Fix ADSP memory base and length

Kyle Deng (1):
      arm64: dts: qcom: qcs615: add AOSS_QMP node

Lijuan Gao (7):
      dt-bindings: arm: qcom: document QCS615 and the reference board
      arm64: dts: qcom: add QCS615 platform
      arm64: dts: qcom: qcs615: add base RIDE board
      arm64: dts: qcom: qcs615: Add CPU and LLCC BWMON support
      arm64: dts: qcom: correct gpio-ranges for QCS615
      arm64: dts: qcom: correct gpio-ranges for QCS8300
      arm64: dts: qcom: qcs615: Add CPU capacity and DPC properties

Ling Xu (1):
      arm64: dts: qcom: qcs8300: Add ADSP and CDSP0 fastrpc nodes

Luca Weiss (4):
      arm64: dts: qcom: sm6350: Fix uart1 interconnect path
      arm64: dts: qcom: sm7225-fairphone-fp4: Drop extra qcom,msm-id value
      arm64: dts: qcom: qcm6490-fairphone-fp5: Prefix regulator-fixed label
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable camera EEPROMs

Luo Jie (3):
      dt-bindings: clock: qcom: Add CMN PLL clock controller for IPQ SoC
      arm64: dts: qcom: ipq9574: Add CMN PLL node
      arm64: dts: qcom: ipq9574: Update xo_board_clk to use fixed factor clock

Mahadevan (1):
      arm64: dts: qcom: sa8775p: add display dt nodes for MDSS0 and DPU

Manikanta Mylavarapu (6):
      arm64: dts: qcom: ipq5424: Add smem and tcsr_mutex nodes
      arm64: dts: qcom: ipq5424: Add watchdog node
      arm64: dts: qcom: ipq5424: add spi nodes
      arm64: dts: qcom: ipq5424: configure spi0 node for rdp466
      arm64: dts: qcom: ipq5424: add scm node
      arm64: dts: qcom: ipq5424: enable the download mode support

Manivannan Sadhasivam (1):
      arm64: dts: qcom: sa8775p: Fix the size of 'addr_space' regions

Mao Jinlong (1):
      arm64: dts: qcom: sm8450: Add coresight nodes

Marek Vasut (1):
      arm64: dts: qcom: msm8996-xiaomi-gemini: Fix LP5562 LED1 reg property

Maud Spierings (3):
      arm64: dts: qcom: x1e80100-vivobook-s15: Enable the gpu
      arm64: dts: qcom: x1e80100-vivobook-s15: Use the samsung,atna33xc20 panel driver
      arm64: dts: qcom: x1e80100-vivobook-s15: Add lid switch

Maulik Shah (1):
      arm64: dts: qcom: sa8775p: Add CPUs to psci power domain

Md Sadre Alam (3):
      arm64: dts: qcom: ipq5424: add TRNG node
      arm64: dts: qcom: ipq9574: update TRNG compatible
      arm64: dts: qcom: ipq5332: update TRNG compatible

Melody Olvera (6):
      dt-bindings: arm: qcom: Document SM8750 SoC and boards
      arm64: dts: qcom: Add PMD8028 PMIC
      arm64: dts: qcom: Add PMIH0108 PMIC
      arm64: dts: qcom: Add base SM8750 dtsi
      arm64: dts: qcom: sm8750: Add pmic dtsi
      arm64: dts: qcom: sm8750: Add MTP and QRD boards

Neil Armstrong (12):
      arm64: dts: qcom: sm8550: add interconnect and opp-peak-kBps for GPU
      arm64: dts: qcom: sm8650: add interconnect and opp-peak-kBps for GPU
      arm64: dts: qcom: qcm6490-shift-otter: remove invalid orientation-switch
      arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: remove disabled ov7251 camera
      arm64: dts: qcom: sc7180-trogdor-quackingstick: add missing avee-supply
      arm64: dts: qcom: sc7180-trogdor-pompom: rename 5v-choke thermal zone
      arm64: dts: qcom: sc7180: fix psci power domain node names
      arm64: dts: qcom: sm8150-microsoft-surface-duo: fix typos in da7280 properties
      arm64: dts: qcom: pmi8950: add LAB-IBB nodes
      arm64: dts: qcom: sdm450-lenovo-tbx605f: add DSI panel nodes
      arm64: dts: qcom: sm8550: Add 'global' interrupt to the PCIe RC nodes
      arm64: dts: qcom: sm8650: Add 'global' interrupt to the PCIe RC nodes

Otto Pflüger (1):
      arm64: dts: qcom: Add initial support for MSM8917

Pengyu Luo (2):
      dt-bindings: arm: qcom: Document Huawei Matebook E Go (sc8280xp)
      arm64: dts: qcom: sc8280xp: Add Huawei Matebook E Go (sc8280xp)

Petr Vorel (1):
      arm64: dts: qcom: msm8994-angler: Enable power key, volume up/down

Prashanth K (9):
      arm64: dts: qcom: sdm630: Disable USB U1/U2 entry
      arm64: dts: qcom: sdm845: Disable USB U1/U2 entry
      arm64: dts: qcom: sdx75: Disable USB U1/U2 entry
      arm64: dts: qcom: qcs404: Disable USB U1/U2 entry
      arm64: dts: qcom: sc7180: Disable USB U1/U2 entry
      arm64: dts: qcom: x1e80100: Disable USB U1/U2 entry
      arm64: dts: qcom: qdu1000: Disable USB U1/U2 entry
      arm64: dts: qcom: sc8280xp: Disable USB U1/U2 entry
      arm64: dts: qcom: sc8180x: Disable USB U1/U2 entry

Qiang Yu (1):
      arm64: dts: qcom: x1e80100: Add support for PCIe3 on x1e80100

Qingqing Zhou (2):
      arm64: dts: qcom: qcs615: add the SCM node
      arm64: dts: qcom: qcs615: add the APPS SMMU node

Rakesh Kota (1):
      arm64: dts: qcom: qcm6490-idp: Allow UFS regulators load/mode setting

Raviteja Laggyshetty (1):
      dt-bindings: interconnect: add interconnect bindings for SM8750

Richard Acayan (5):
      arm64: dts: qcom: pm660l: add flash leds
      arm64: dts: qcom: sdm670-google-sargo: add flash leds
      arm64: dts: qcom: sdm670: add gpu
      arm64: dts: qcom: sdm670-google-sargo: enable gpu
      arm64: dts: qcom: sdm670: add camcc

Rob Herring (Arm) (1):
      arm64: dts: qcom: Remove unused and undocumented properties

Sayali Lokhande (2):
      arm64: dts: qcom: qcs615: add UFS node
      arm64: dts: qcom: qcs615-ride: Enable UFS node

Sibi Sankar (5):
      dt-bindings: arm: qcom: Add Snapdragon Devkit for Windows
      arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows
      arm64: dts: qcom: x1e001de-devkit: Add audio related nodes
      arm64: dts: qcom: x1e001de-devkit: Enable external DP support
      arm64: dts: qcom: x1e001de-devkit: Enable SD card support

Song Xue (1):
      arm64: dts: qcom: qcs615: Add LLCC support for QCS615

Soutrik Mukhopadhyay (2):
      arm64: dts: qcom: sa8775p: add DisplayPort device nodes
      arm64: dts: qcom: sa8775p-ride: Enable Display Port

Sricharan Ramabadhran (2):
      dt-bindings: qcom: Add ipq5424 boards
      arm64: dts: qcom: add IPQ5424 SoC and rdp466 board support

Srinivas Kandagatla (1):
      arm64: dts: qcom: x1e78100-t14s: add sound support

Stephan Gerhold (14):
      arm64: dts: qcom: x1e80100-pmics: Enable all SMB2360 separately
      arm64: dts: qcom: x1e80100: Add QUP power domains and OPPs
      arm64: dts: qcom: x1e80100: Add uart14
      arm64: dts: qcom: x1e001de-devkit: Fix USB QMP PHY supplies
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix USB QMP PHY supplies
      arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix USB QMP PHY supplies
      arm64: dts: qcom: x1e80100-crd: Fix USB QMP PHY supplies
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Fix USB QMP PHY supplies
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix USB QMP PHY supplies
      arm64: dts: qcom: x1e80100-microsoft-romulus: Fix USB QMP PHY supplies
      arm64: dts: qcom: x1e80100-qcp: Fix USB QMP PHY supplies
      arm64: dts: qcom: x1e80100-qcp: Add FSUSB42 USB switches
      arm64: dts: qcom: x1e80100-qcp: Enable external DP support
      arm64: dts: qcom: msm8916-samsung-serranove: Add display panel

Taniya Das (5):
      dt-bindings: clock: qcom: Add QCS615 GCC clocks
      arm64: dts: qcom: sa8775p: Update sleep_clk frequency
      arm64: dts: qcom: sa8775p: Add support for clock controllers
      dt-bindings: clock: qcom: Add SM8750 GCC
      dt-bindings: clock: qcom: Document the SM8750 TCSR Clock Controller

Tingguo Cheng (3):
      arm64: dts: qcom: qcs615: Adds SPMI support
      arm64: dts: qcom: move pon reboot-modes from pm8150.dtsi to board files
      arm64: dts: qcom: qcs615-ride: Enable PMIC peripherals

Varadarajan Narayanan (2):
      arm64: dts: qcom: ipq5424: Add LLCC/system-cache-controller
      arm64: dts: qcom: ipq5424: Add USB controller and phy nodes

Viken Dadhaniya (1):
      arm64: dts: qcom: qcs615: Add QUPv3 configuration

Vladimir Zapolskiy (3):
      arm64: dts: qcom: sc8280xp: Fix interrupt type of camss interrupts
      arm64: dts: qcom: sdm845: Fix interrupt types of camss interrupts
      arm64: dts: qcom: sm8250: Fix interrupt types of camss interrupts

Xin Liu (1):
      arm64: dts: qcom: qcs8300: Add watchdog node

Yijie Yang (2):
      arm64: dts: qcom: qcs8300: add the first 2.5G ethernet
      arm64: dts: qcom: qcs8300-ride: enable ethernet0

Yuanfang Zhang (1):
      arm64: dts: qcom: sm8650: Add coresight nodes

Yuanjie Yang (2):
      arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
      arm64: dts: qcom: qcs615-ride: enable SDHC1 and SDHC2

Yuvaraj Ranganathan (3):
      arm64: dts: qcom: qcs8300: add QCrypto nodes
      arm64: dts: qcom: qcs8300: add TRNG node
      arm64: dts: qcom: qcs8300: enable the inline crypto engine

devi priya (2):
      arm64: dts: qcom: ipq9574: Add PCIe PHYs and controller nodes
      arm64: dts: qcom: ipq9574: Enable PCIe PHYs and controllers

 .../devicetree/bindings/arm/qcom-soc.yaml          |    9 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |   64 +
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |   77 +
 .../devicetree/bindings/clock/qcom,qcs615-gcc.yaml |   59 +
 .../bindings/clock/qcom,sm8550-dispcc.yaml         |    4 +-
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 .../devicetree/bindings/clock/qcom,sm8750-gcc.yaml |   62 +
 .../bindings/interconnect/qcom,sm8750-rpmh.yaml    |  136 +
 arch/arm64/boot/dts/qcom/Makefile                  |   12 +
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        |  169 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |  519 +++
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |   24 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts        |  113 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  449 ++-
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |   58 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   |  333 ++
 arch/arm64/boot/dts/qcom/msm8917.dtsi              | 1954 +++++++++++
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |    2 +-
 .../dts/qcom/msm8994-huawei-angler-rev-101.dts     |   21 +-
 .../boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi  |    5 -
 arch/arm64/boot/dts/qcom/msm8994.dtsi              |   11 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |    2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |    9 +-
 arch/arm64/boot/dts/qcom/pm660l.dtsi               |    6 +
 arch/arm64/boot/dts/qcom/pm8150.dtsi               |    2 -
 arch/arm64/boot/dts/qcom/pm8937.dtsi               |  150 +
 arch/arm64/boot/dts/qcom/pmd8028.dtsi              |   62 +
 arch/arm64/boot/dts/qcom/pmi8950.dtsi              |   17 +
 arch/arm64/boot/dts/qcom/pmih0108.dtsi             |   68 +
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              |   72 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  101 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |    8 +
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   |    2 -
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |    6 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  343 ++
 arch/arm64/boot/dts/qcom/qcs615.dtsi               | 3670 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   41 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  370 ++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 3548 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8550-aim300.dtsi       |    2 +-
 arch/arm64/boot/dts/qcom/qdu1000-idp.dts           |   19 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |   16 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |   61 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |    5 +
 arch/arm64/boot/dts/qcom/qru1000-idp.dts           |   19 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |   82 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  406 ++-
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts     |  558 +++
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             | 3123 +++++++++++++++++
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |    4 +-
 .../dts/qcom/sc7180-trogdor-quackingstick.dtsi     |    1 +
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   20 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |    6 +-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |    4 -
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |    4 -
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |    6 +
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      | 1318 +++++++
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 1325 +++++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   52 +-
 arch/arm64/boot/dts/qcom/sdm450-lenovo-tbx605f.dts |   97 +
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |    4 +
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts   |   37 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |  204 ++
 .../qcom/sdm845-db845c-navigation-mezzanine.dtso   |   42 -
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |    1 -
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   24 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |    6 +-
 arch/arm64/boot/dts/qcom/sm4250.dtsi               |   39 +
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   95 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |    2 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    5 +
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |    9 +-
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    5 +
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   |    5 +
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |    4 +
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts            |    5 +
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts            |    5 +
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |    5 +
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |  120 +
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts    |    5 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   34 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |    7 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  498 +--
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 1000 +++++-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |    2 +-
 .../dts/qcom/sm8550-sony-xperia-yodo-pdx234.dts    |    2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  296 +-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  504 ++-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  794 +++++
 arch/arm64/boot/dts/qcom/sm8750-pmics.dtsi         |  188 +
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |  792 +++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 2907 ++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       | 1371 ++++++++
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     |  320 +-
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |   60 +-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |   14 +-
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |  305 +-
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     | 1693 +++++++++
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |   52 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  527 ++-
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    4 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  298 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 2450 +++++++++++--
 include/dt-bindings/clock/qcom,ipq-cmn-pll.h       |   22 +
 include/dt-bindings/clock/qcom,qcs615-gcc.h        |  211 ++
 include/dt-bindings/clock/qcom,sm8750-dispcc.h     |  112 +
 include/dt-bindings/clock/qcom,sm8750-gcc.h        |  226 ++
 include/dt-bindings/clock/qcom,sm8750-tcsr.h       |   15 +
 .../dt-bindings/interconnect/qcom,sm8750-rpmh.h    |  143 +
 121 files changed, 34020 insertions(+), 1179 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,qcs615-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8750-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sm8750-rpmh.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5424.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8937.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmd8028.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmih0108.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs615-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs615.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8300-ride.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8300.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sar2130p.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-pmics.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750-qrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8750.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts
 create mode 100644 include/dt-bindings/clock/qcom,ipq-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,qcs615-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-tcsr.h
 create mode 100644 include/dt-bindings/interconnect/qcom,sm8750-rpmh.h

