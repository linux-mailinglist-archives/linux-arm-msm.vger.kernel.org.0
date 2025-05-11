Return-Path: <linux-arm-msm+bounces-57564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A134AB2C77
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 01:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2ED91893BF7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 May 2025 23:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE0C166F0C;
	Sun, 11 May 2025 23:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IU5uiqTn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A4F7E105
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 May 2025 23:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747007577; cv=none; b=XXKS5OkOCK7122xGKTo4QQBK/CGo8nisNPVPEUQwB7I1GqjO3erRTBbkNuBOMuSSD4gXbQHF23C7Vhf0VNT7mw132t1eQ1EobhAWY4xI2XshUdaP8shOqUtCFUxqsghtX5M7Whqps7XhfN+mZ0OYdy/KHRovQhjf3iq9MpPzCmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747007577; c=relaxed/simple;
	bh=zO9oByYLaXJnrlCk8NfTd42htGJhTpIeRev/PT4hYLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GGKzrGo2VglwVxUILrJl9kIoVwgjGKawjntReofKZvXOHVF+N5Z8wVItk5ZauqL6Iy/Q30OoeTbimartDzL6a92VSDVan+N1FhRjFkyOms5cSHamXvLiuC6HQm1hqU7yRkpEVN/dbr8ckKtvETSm3zyNamHgxzHRHQNdH8u9vqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IU5uiqTn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 443C3C4CEE4;
	Sun, 11 May 2025 23:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747007577;
	bh=zO9oByYLaXJnrlCk8NfTd42htGJhTpIeRev/PT4hYLY=;
	h=From:To:Cc:Subject:Date:From;
	b=IU5uiqTn8vmyG5I/9nwyUKlhOtPUqeRwz0GJyBGjizb0NJO69bHtMIsnYxivyZI6l
	 LlQMMS1yvNcTj4J/nS+aQpAphf4Vb1SyNhvAYYqX+PcrIHPNPFHFZ5ejqSwIAWFzEQ
	 mTNQo9xD8mUbAc7IXZwnYsh30JPmmxcWRdUb4KFVt0qlBSIuxeBz5vIkL+WJatB/jf
	 BIbecttZEUO+IgtXxleLzgT6mLpMiN9CPeQZknTa/gpBXrj0piq2s0EVDpnJGlsFgC
	 RwqFLqYJqOMWATads3jvefJXNtRBqq0OXP3ClDGKKojoBwcNZtajflLCa+JQjhpxJb
	 vocyUUcB20k+Q==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Johan Hovold <johan+linaro@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@linaro.org>,
	Dzmitry Sankouski <dsankouski@gmail.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Nikita Travkin <nikita@trvn.ru>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Gaurav Kashyap <quic_gaurkash@quicinc.com>,
	Joel Selvaraj <foss@joelselvaraj.com>,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Prashanth K <prashanth.k@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	Tingguo Cheng <quic_tingguoc@quicinc.com>,
	Gabriel Gonzales <semfault@disroot.org>,
	Maud Spierings <maud_spierings@hotmail.com>,
	Pratham Pratap <quic_ppratap@quicinc.com>,
	Pratyush Brahma <quic_pbrahma@quicinc.com>,
	Praveenkumar I <quic_ipkumar@quicinc.com>,
	Rudraksha Gupta <guptarud@gmail.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Vikram Sharma <quic_vikramsa@quicinc.com>,
	Abhinaba Rakshit <quic_arakshit@quicinc.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Cheng Jiang <quic_chejiang@quicinc.com>,
	Daniil Titov <daniilt971@gmail.com>,
	Devi Priya <quic_devipriy@quicinc.com>,
	Eugene Lepshy <fekz115@gmail.com>,
	Felix Kaechele <felix@kaechele.ca>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	Ivan Belokobylskiy <belokobylskij@gmail.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Janaki Ramaiah Thota <quic_janathot@quicinc.com>,
	Jie Gan <quic_jiegan@quicinc.com>,
	Juerg Haefliger <juerg.haefliger@canonical.com>,
	Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>,
	Karthik Sanagavarapu <quic_kartsana@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Lad Prabhakar <prabhakar.csengg@gmail.com>,
	Lijuan Gao <quic_lijuang@quicinc.com>,
	Ling Xu <quic_lxu5@quicinc.com>,
	Manish Nagar <quic_mnagar@quicinc.com>,
	Mark Kettenis <kettenis@openbsd.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Rakesh Kota <quic_kotarake@quicinc.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Sanjay Chitroda <quic_ckantibh@quicinc.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Wojciech Slenska <wojciech.slenska@gmail.com>,
	Xilin Wu <wuxilin123@gmail.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.16
Date: Sun, 11 May 2025 18:52:39 -0500
Message-ID: <20250511235241.15192-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.16

for you to fetch changes up to a18226be95c7ae7c9ec22fd31a6124bef5675c64:

  arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg: introduce touchscreen support (2025-05-11 17:34:23 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree updates for v6.16

The Snapdragon X Plus platform and related reference device is
introduced. Devicetree for the Xiaomi Redmi Note 8 is added.

Tsens and thermal zones are added for IPQ5332 and IPQ5424. IPQ6018 gains
1.2GHz and 1.5GHz CPU frequencies. The IPQ5424 gains MMC, LEDs and
buttons, while the IPQ9574 gains NSS clock controller and SPI NAND
support.

IPQ6018 SMEM is transitioned to be described directly in the
reserved-memory node.

Display and GPU are enabled in the QCM6490-based Fairphone FP5. On
QCS6490 Rb3Gen2 ADC channels for thermal profiling are added and
Bluetooth is enabled. The USB Type-C orientation GPIO is added on the
QCS6490 Rb3Gen2 and the vision mezzanine is described.
The Fairphone FP5 gains touchscreen and USB Type-C display support, and
the QCM6490 IDP board gains a required listed of protected clocks.

The camera subsystem in SC7280 is described and UFS is transitioned to
use operating points.

On MSM8916, MSM8919 and MSM8939, and devices on these platforms, the
UART pinctrl state is cleaned up.

The MSM8953 platform gains another UART and interconnects.

On SA8775P CTCU and ETR nodes are added, and the CPUfreq throttling
interrupts are added.

Samsung Galaxy S9 SM-G9600 gains a description of the MAX77705 used for
charging, fuel gauge, haptic, and LED, as well as the PMIC used for
display and touchscreen, which then is used to enable the touchscreen.

The LPG/PWM node is added to PM8937 and Xiaomi Redmi 5A gains display
backlight control.

Display and GPU are enabled for the Nothing Phone (1).

QCS615 platform gains command DB definition.

The QCS8300 platform gains description of more QUP instances, CPUfreq,
PCIe SMMU and the SPMI controller.

On SAR2130P PCIe EP device nodes are added.

On SDM630 missing resets are added for SDCC. Then on Fairphone FP3 modem
is enabled, and firmware-path are defined on ADSP and WCNSS.

The SDM845 RB3/DragonBoard845c and the QRB5165 RB5 has the sensors DSP
enabled, and the vision mezzanine on both gets their CMA configuration
cleaned up. Xiaomi Pocophone F1 gains touchscreen support.

On the SM7325 Nothing Phone (1), display, GPU, and camera EEPROMs are
described.

On SM8450 the PCIe endpoint controller is described.

For SM8550 OPP tables are described for PCIe and QUP. SM8750 gains RPMh
sleep stats.

SM8650 gians OSM L3 scaling and variety of OPP tables and missing
interconnect definitions. The thermal trip points for CPU cores and GPU
are raised in reliance on hardware throttling.
SM8650 is also transitioned to per-CPU interrupt partitions, in order to
properly describe the PMU interrupts. Missing Coresight ETE instances
are added.

On SM8750 the cluster idle states are corrected, then audio and compute
DSPs are introduced, together with the crypto and rng blocks. Modem
support is added and enabled on MTP and QRD devices.

On SC8280XP overlays are introduced for those running Linux at EL2 on
these devices. A few more temp-alarm instances are added for the PMICs.

On the X Elite platform GPU cooling and watchdog is introduced, together
with a number of smaller fixes. Dell XPS13 gains support for USB Type-C
display, the QCP gains WiFi/BT power sequence, and a few devices learns
about HBR3. The RTC support is enabled and regulators that are feeding
resources that should be always on is marked as such on a variety of
boards.
The Lenovo Thinkpad T14s DeviceTree is split in two, in order to
describe the LCD and OLED variants.

Missing properties for the crypto BAM is introduced on a variety of
platforms, taking care of a long standing error message in the kernel
log during boot.

DSI phy clock ids are transitioned to use identifiers from the PHY
header file and VBIF region size is corrected, across a large number of
platforms.

A couple of DWC3 quirks are added across a lot of platforms.

The arm32-for-6.15 pull request was accidentally merged into the
arm64-for-6.16 branch and this wasn't discovered until a significant
number of commits would have to be rebased. As such this is kept here as
well.

----------------------------------------------------------------
Abel Vesa (11):
      arm64: dts: qcom: x1e80100-crd: Describe the Parade PS8830 retimers
      arm64: dts: qcom: x1e80100-crd: Enable external DisplayPort support
      arm64: dts: qcom: x1e80100-t14s: Describe the Parade PS8830 retimers
      arm64: dts: qcom: x1e80100-t14s: Enable external DisplayPort support
      dt-bindings: arm: qcom: Document Lenovo ThinkPad T14s Gen 6 LCD and OLED
      arm64: dts: qcom: x1e78100-t14s: Add LCD variant with backlight support
      arm64: dts: qcom: x1e78100-t14s: Add OLED variant
      arm64: dts: qcom: x1e001de-devkit: Describe USB retimers resets pin configs
      arm64: dts: qcom: x1e001de-devkit: Fix pin config for USB0 retimer vregs
      arm64: dts: qcom: x1e80100: Fix PCIe 3rd controller DBI size
      arm64: dts: qcom: x1e80100-*: Drop useless DP3 compatible override

Abhinaba Rakshit (1):
      arm64: dts: qcom: qcs615: add TRNG node

Aleksandrs Vinarskis (6):
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable external DP support
      arm64: dts: qcom: x1e001de-devkit: Enable HBR3 on external DPs
      arm64: dts: qcom: x1e80100-hp-x14: Enable HBR3 on external DPs
      arm64: dts: qcom: x1e80100-qcp: Enable HBR3 on external DPs
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: enable MICs LDO
      dt-bindings: arm: qcom: Add Asus Zenbook A14

Alexey Klimov (1):
      arm64: dts: qcom: qrb5165-rb5: add compressed playback support

Alexey Minnekhanov (5):
      arm64: dts: qcom: sdm630: Add missing resets to mmc blocks
      arm64: dts: qcom: sdm660-xiaomi-lavender: Add missing SD card detect GPIO
      arm64: dts: qcom: sdm630: Add modem metadata mem
      arm64: dts: qcom: sdm660-lavender: Add missing USB phy supply
      arm64: dts: qcom: sda660-ifc6560: Fix dt-validate warning

Barnabás Czémán (1):
      arm64: dts: qcom: msm8917-xiaomi-riva: Add display backlight

Bjorn Andersson (4):
      Merge branch '20250203063427.358327-2-alexeymin@postmarketos.org' into arm64-for-6.15
      Merge branch '20250313110359.242491-1-quic_mmanikan@quicinc.com' into arm64-for-6.15
      Merge branch 'arm64-for-6.15' into arm64-for-6.16
      Merge branch 'arm32-for-6.15' into arm64-for-6.16

Cheng Jiang (1):
      arm64: dts: qcom: sa8775p-ride: Add firmware-name in BT node

Chukun Pan (5):
      arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
      arm64: dts: qcom: ipq6018: add 1.5GHz CPU Frequency
      arm64: dts: qcom: ipq6018: move mp5496 regulator out of soc dtsi
      arm64: dts: qcom: ipq6018: rename labels of mp5496 regulator
      arm64: dts: qcom: ipq6018: add LDOA2 regulator

Daniil Titov (1):
      arm64: dts: qcom: pm8937: Add LPG PWM driver

Danila Tikhonov (3):
      arm64: dts: qcom: sm7325-nothing-spacewar: Add CAM fixed-regulators
      arm64: dts: qcom: sm7325-nothing-spacewar: Enable camera EEPROMs
      dt-bindings: arm: qcom: Add SM7150 Google Pixel 4a

Devi Priya (1):
      arm64: dts: qcom: ipq9574: Add nsscc node

Dmitry Baryshkov (24):
      arm64: dts: qcom: sdm845-db845c: enable sensors DSP
      arm64: dts: qcom: qrb5165-rb5: enable sensors DSP
      arm64: dts: qcom: sar2130p: add PCIe EP device nodes
      arm64: dts: qcom: sm8450: add PCIe EP device nodes
      arm64: dts: qcom: sc7280: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sa8775p: mark MDP interconnects as ALWAYS on
      arm64: dts: qcom: msm8998: use correct size for VBIF regions
      arm64: dts: qcom: qcm2290: use correct size for VBIF regions
      arm64: dts: qcom: sa8775p: use correct size for VBIF regions
      arm64: dts: qcom: sc7180: use correct size for VBIF regions
      arm64: dts: qcom: sc7280: use correct size for VBIF regions
      arm64: dts: qcom: sc8180x: use correct size for VBIF regions
      arm64: dts: qcom: sc8280xp: use correct size for VBIF regions
      arm64: dts: qcom: sdm670: use correct size for VBIF regions
      arm64: dts: qcom: sdm845: use correct size for VBIF regions
      arm64: dts: qcom: sm6115: use correct size for VBIF regions
      arm64: dts: qcom: sm6125: use correct size for VBIF regions
      arm64: dts: qcom: sm6350: use correct size for VBIF regions
      arm64: dts: qcom: sm8150: use correct size for VBIF regions
      arm64: dts: qcom: sm8250: use correct size for VBIF regions
      arm64: dts: qcom: sm8350: use correct size for VBIF regions
      arm64: dts: qcom: sm8450: use correct size for VBIF regions
      arm64: dts: qcom: sm8550: use correct size for VBIF regions
      arm64: dts: qcom: sm8650: use correct size for VBIF regions

Dzmitry Sankouski (9):
      arm64: dts: qcom: sdm845: enable gmu
      arm64: dts: qcom: sdm845-starqltechn: remove wifi
      arm64: dts: qcom: sdm845-starqltechn: fix usb regulator mistake
      arm64: dts: qcom: sdm845-starqltechn: refactor node order
      arm64: dts: qcom: sdm845-starqltechn: remove excess reserved gpios
      arm64: dts: qcom: sdm845-starqltechn: add gpio keys
      arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC
      arm64: dts: qcom: sdm845-starqltechn: add display PMIC
      arm64: dts: qcom: sdm845-starqltechn: add touchscreen support

Eugene Lepshy (1):
      arm64: dts: qcom: sm7325-nothing-spacewar: Enable panel and GPU

Felix Kaechele (1):
      arm64: dts: qcom: msm8953: Add uart_5

Gabor Juhos (1):
      arm64: dts: ipq6018: drop standalone 'smem' node

Gabriel Gonzales (2):
      dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8
      arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo

Gaurav Kashyap (3):
      arm64: dts: qcom: sm8750: Add QCrypto nodes
      arm64: dts: qcom: sm8750: Add TRNG nodes
      arm64: dts: qcom: sm8750: Add ICE nodes

Imran Shaik (1):
      arm64: dts: qcom: qcs8300: Add cpufreq scaling node

Ivan Belokobylskiy (1):
      ARM: dts: qcom: Initial dts for LG Nexus 4

Jagadeesh Kona (1):
      arm64: dts: qcom: sa8775p: Add LMH interrupts for cpufreq_hw node

Janaki Ramaiah Thota (1):
      arm64: dts: qcom: qcs6490-rb3gen2: add and enable BT node

Jie Gan (1):
      arm64: dts: qcom: sa8775p: Add CTCU and ETR nodes

Joel Selvaraj (3):
      arm64: dts: qcom: sdm845-xiaomi-beryllium-common: add touchscreen related nodes
      arm64: dts: qcom: sdm845-xiaomi-beryllium-tianma: introduce touchscreen support
      arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg: introduce touchscreen support

Johan Hovold (14):
      arm64: dts: qcom: x1e80100-crd: add support for volume-up key
      arm64: dts: qcom: x1e80100-crd: add gpio-keys label for lid switch
      arm64: dts: qcom: sc8280xp-crd: add support for volume-up key
      arm64: dts: qcom: x1e80100-crd: mark l12b and l15b always-on
      arm64: dts: qcom: x1e78100-t14s: mark l12b and l15b always-on
      arm64: dts: qcom: x1e001de-devkit: mark l12b and l15b always-on
      arm64: dts: qcom: x1e80100-dell-xps13-9345: mark l12b and l15b always-on
      arm64: dts: qcom: x1e80100-hp-x14: mark l12b and l15b always-on
      arm64: dts: qcom: x1e80100-yoga-slim7x: mark l12b and l15b always-on
      arm64: dts: qcom: x1e80100-qcp: mark l12b and l15b always-on
      arm64: dts: qcom: x1e78100-t14s: fix missing HID supplies
      arm64: dts: qcom: sc8280xp-x13s: switch to uefi rtc offset
      arm64: dts: qcom: x1e80100: enable rtc
      arm64: dts: qcom: x1e001de-devkit: fix USB retimer reset polarity

Juerg Haefliger (1):
      arm64: dts: qcom: x1e80100-hp-omnibook-x14: Remove invalid bt-en-sleep node

Jyothi Kumar Seerapu (1):
      arm64: dts: qcom: sm8750: Correct clocks property for uart14 node

Karthik Sanagavarapu (1):
      arm64: dts: qcom: sa8775p: Remove cdsp compute-cb@10

Konrad Dybcio (13):
      arm64: dts: qcom: x1e80100: Set CPU interconnect paths as ACTIVE_ONLY
      arm64: dts: qcom: x1e80100: Wire up PCIe PHY NOCSR resets
      arm64: dts: qcom: Commonize X1 CRD DTSI
      arm64: dts: qcom: Add X1P42100 SoC and CRD
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable the GPU
      arm64: dts: qcom: x1e80100-romulus: Keep L12B and L15B always on
      arm64: dts: qcom: sdx75: Fix up the USB interrupt description
      arm64: dts: qcom: sdx75: Rename AOSS_QMP to power-management
      arm64: dts: qcom: qcs615: Rename AOSS_QMP to power-management
      arm64: dts: qcom: sc8180x: Rename AOSS_QMP to power-management
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Drop clock-names from PS8830
      arm64: dts: qcom: x1e80100-romulus: Drop clock-names from PS8830
      arm64: dts: qcom: x1e001de-devkit: Drop clock-names from PS8830

Krishna Kurapati (1):
      arm64: dts: qcom: qcs6490-rb3gen2: Add orientation gpio

Krzysztof Kozlowski (51):
      arm64: dts: qcom: sa8775p: Partially revert "arm64: dts: qcom: sa8775p: add QCrypto nodes"
      arm64: dts: qcom: qcs8300: Partially revert "arm64: dts: qcom: qcs8300: add QCrypto nodes"
      arm64: dts: qcom: x1e80100-slim7x: Drop incorrect qcom,ath12k-calibration-variant
      ARM: dts: qcom: ipq4018: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: msm8998: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: qrb2210-rb1: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: qrb4210-rb2: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sc7180: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sdm845: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sda660-ifc6560: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sm6115: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sm8150-hdk: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: qcm6490: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sa8775p-ride: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sc8280xp: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sm8250-elish: Switch to undeprecated qcom,calibration-variant
      arm64: dts: qcom: sm8750: Change labels to lower-case
      arm64: dts: qcom: Correct white-space style
      arm64: dts: qcom: Use recommended MBN firmware path
      arm64: dts: qcom: sm8750: Add IPCC, SMP2P, AOSS and ADSP
      arm64: dts: qcom: sm8750: Add LPASS macro codecs and pinctrl
      arm64: dts: qcom: sm8750-mtp: Enable ADSP
      arm64: dts: qcom: sm8750-qrd: Enable ADSP
      arm64: dts: qcom: sm8750: Add CDSP
      arm64: dts: qcom: sm8750-mtp: Enable CDSP
      arm64: dts: qcom: sm8750-qrd: Enable CDSP
      arm64: dts: qcom: msm8916: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8917: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8939: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8953: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8976: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8996: Use the header with DSI phy clock IDs
      arm64: dts: qcom: msm8998: Use the header with DSI phy clock IDs
      arm64: dts: qcom: qcm2290: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sc7180: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sc8180x: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sdm630: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sdm670: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sdm845: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm6115: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm6125: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm6350: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8150: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8250: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8350: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8450: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8550: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8650: Use the header with DSI phy clock IDs
      arm64: dts: qcom: sm8750: Add Modem / MPSS
      arm64: dts: qcom: sm8750-mtp: Enable modem
      arm64: dts: qcom: sm8750-qrd: Enable modem

Lad Prabhakar (1):
      arm64: dts: qcom: Drop `tx-sched-sp` property

Lijuan Gao (1):
      arm64: dts: qcom: qcs615: Add Command DB support

Ling Xu (1):
      arm64: dts: qcom: sa8775p: Remove extra entries from the iommus property

Luca Weiss (29):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable display
      arm64: dts: qcom: sdm632-fairphone-fp3: Move status properties last
      arm64: dts: qcom: sdm632-fairphone-fp3: Add newlines between regulator nodes
      arm64: dts: qcom: sdm632-fairphone-fp3: Add firmware-name for adsp & wcnss
      arm64: dts: qcom: sdm632-fairphone-fp3: Enable modem
      arm64: dts: qcom: sm8350: Reenable crypto & cryptobam
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add touchscreen node
      ARM: dts: qcom: msm8226: Add modem remoteproc node
      ARM: dts: qcom: msm8226: Add BAM DMUX Ethernet/IP device
      ARM: dts: qcom: Introduce dtsi for LTE-capable MSM8926
      ARM: dts: qcom: msm8926-htc-memul: Enable modem
      arm64: dts: qcom: sm8650: Fix domain-idle-state for CPU2
      arm64: dts: qcom: Remove unnecessary MM_[UD]L audio routes
      arm64: dts: qcom: sc7280: Stop setting dmic01 pinctrl for va-macro
      arm64: dts: qcom: sm6350: Align reg properties with latest style
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PTN36502 redriver
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add OCP96011 audio switch
      arm64: dts: qcom: qcm6490-fairphone-fp5: Hook up DisplayPort over USB-C
      arm64: dts: qcom: apq8096-db820c: Use q6asm defines for reg
      arm64: dts: qcom: msm8916-modem-qdsp6: Use q6asm defines for reg
      arm64: dts: qcom: msm8953: Use q6asm defines for reg
      arm64: dts: qcom: msm8996*: Use q6asm defines for reg
      arm64: dts: qcom: qrb5165-rb5: Use q6asm defines for reg
      arm64: dts: qcom: sc7180-acer-aspire1: Use q6asm defines for reg
      arm64: dts: qcom: sc7280: Use q6asm defines for reg
      arm64: dts: qcom: sdm845*: Use q6asm defines for reg
      arm64: dts: qcom: sdm850*: Use q6asm defines for reg
      arm64: dts: qcom: sm7325-nothing-spacewar: Use q6asm defines for reg
      arm64: dts: qcom: sm8350: Use q6asm defines for reg

Manikanta Mylavarapu (5):
      arm64: dts: qcom: ipq5424: Add tsens node
      arm64: dts: qcom: ipq5424: Add thermal zone nodes
      arm64: dts: qcom: ipq9574: fix the msi interrupt numbers of pcie3
      arm64: dts: qcom: ipq5424: add reserved memory region for bootloader
      arm64: dts: qcom: ipq5424: enable GPIO based LEDs and Buttons

Manish Nagar (1):
      arm64: dts: qcom: qcs8300-ride: Enable second USB controller on QCS8300 Ride

Mark Kettenis (1):
      arm64: dts: qcom: x1e80100: Mark usb_2 as dma-coherent

Matti Lehtimäki (3):
      ARM: dts: qcom: msm8226: Add node for TCSR halt regs
      ARM: dts: qcom: msm8226: Add smsm node
      ARM: dts: qcom: msm8226-samsung-matisse-common: Enable modem

Maud Spierings (2):
      arm64: dts: qcom: x1e80100-vivobook-s15: Enable USB-A ports
      arm64: dts: qcom: x1e80100-vivobook-s15: Enable micro-sd card reader

Maulik Shah (3):
      arm64: dts: qcom: sm8750: Add RPMh sleep stats
      arm64: dts: qcom: sm8750: Fix cluster hierarchy for idle states
      arm64: dts: qcom: qcs8300: Add RPMh sleep stats

Md Sadre Alam (3):
      arm64: dts: qcom: ipq9574: Add SPI nand support
      arm64: dts: qcom: ipq9574: Enable SPI NAND for ipq9574
      arm64: dts: qcom: ipq9574: Remove eMMC node

Neil Armstrong (23):
      arm64: dts: qcom: sm8650: add OSM L3 node
      arm64: dts: qcom: sm8650: add cpu interconnect nodes
      arm64: dts: qcom: sm8650: add cpu OPP table with DDR, LLCC & L3 bandwidths
      arm64: dts: qcom: sm8650: drop cpu thermal passive trip points
      arm64: dts: qcom: sm8650: setup gpu thermal with higher temperatures
      arm64: dts: qcom: sm8650: harmonize all unregulated thermal trip points
      arm64: dts: qcom: sm8650: drop remaining polling-delay-passive properties
      arm64: dts: qcom: sm8550: use ICC tag for all interconnect phandles
      arm64: dts: qcom: sm8550: set CPU interconnect paths as ACTIVE_ONLY
      arm64: dts: qcom: sm8550: add OPP table support to PCIe
      arm64: dts: qcom: sm8550: add QUP serial engines OPP tables
      arm64: dts: qcom: sm8650: use ICC tag for IPA interconnect phandles
      arm64: dts: qcom: sm8650: set CPU interconnect paths as ACTIVE_ONLY
      arm64: dts: qcom: sm8650: add USB interconnect paths
      arm64: dts: qcom: sm8650: add OPP table support to PCIe
      arm64: dts: qcom: sm8650: add QUP serial engines OPP tables
      arm64: dts: qcom: sm8650: add UFS OPP table instead of freq-table-hz property
      arm64: dts: qcom: sm8550: add missing cpu-cfg interconnect path in the mdss node
      arm64: dts: qcom: sm8650: add missing cpu-cfg interconnect path in the mdss node
      arm64: dts: qcom: sm8650: add all 8 coresight ETE nodes
      arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions
      arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs
      arm64: dts: qcom: sc7280: add UFS operating points

Nikita Travkin (7):
      arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Drop CMA heap
      arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Drop CMA heap
      arm64: dts: qcom: sc7180: Add EL2 overlay for WoA devices
      arm64: dts: qcom: sc8280xp: Add PCIe IOMMU
      arm64: dts: qcom: sc8280xp: Add EL2 overlay for WoA devices
      arm64: dts: qcom: x1e80100: Add PCIe IOMMU
      arm64: dts: qcom: x1e/x1p: Add EL2 overlay for WoA devices

Pengyu Luo (3):
      arm64: dts: qcom: sc8280xp-pmics: Fix slave ID in interrupts configuration
      arm64: dts: qcom: sc8280xp-pmics: Add more temp-alarm devices
      arm64: dts: qcom: sc8280xp: Fix clock for spi0 to spi7

Prashanth K (3):
      arm64: dts: qcom: sm8150: Add snps,dis_u3_susphy_quirk
      arm64: dts: qcom: sm8350: Add snps,dis_u3_susphy_quirk
      arm64: dts: qcom: sm8450: Add snps,dis_u3_susphy_quirk

Pratham Pratap (2):
      arm64: dts: qcom: qcs615: Add snps,dis_u3_susphy_quirk
      arm64: dts: qcom: qdu1000: Add snps,dis_u3_susphy_quirk

Pratyush Brahma (2):
      arm64: dts: qcom: qcs8300: Add device node for gfx_smmu
      arm64: dts: qcom: qcs8300: add the pcie smmu node

Praveenkumar I (2):
      arm64: dts: qcom: ipq5332: Add tsens node
      arm64: dts: qcom: ipq5332: Add thermal zone nodes

Rajendra Nayak (1):
      arm64: dts: qcom: x1e80100: Add the watchdog device

Rakesh Kota (1):
      arm64: dts: qcom: qcs6490-rb3gen2: Add vadc and adc-tm channels

Richard Acayan (1):
      arm64: dts: qcom: sdm670: add camss and cci

Rob Herring (Arm) (3):
      arm64: dts: qcom: qdu1000: Fix qcom,freq-domain
      arm64: dts: qcom: msm8939: Fix CPU node "enable-method" property dependencies
      arm64: dts: qcom: msm8992-lg-h815: Fix CPU node "enable-method" property dependencies

Rudraksha Gupta (2):
      ARM: dts: qcom: msm8960: Add BAM
      ARM: dts: qcom: msm8960: Add thermal sensor (tsens)

Russell King (Oracle) (1):
      arm64: dts: qcom: remove max-speed = 1G for RGMII for ethernet

Sanjay Chitroda (1):
      ARM: dts: qcom: Fix indentation errors

Stephan Gerhold (24):
      arm64: dts: qcom: x1e80100: Fix video thermal zone
      arm64: dts: qcom: x1e80100: Apply consistent critical thermal shutdown
      arm64: dts: qcom: x1e80100: Add GPU cooling
      arm64: dts: qcom: x1e80100: Drop unused passive thermal trip points for CPU
      arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq
      arm64: dts: qcom: sm8450: Add missing properties for cryptobam
      arm64: dts: qcom: sm8550: Add missing properties for cryptobam
      arm64: dts: qcom: sm8650: Add missing properties for cryptobam
      arm64: dts: qcom: sa8775p: Add missing properties for cryptobam
      arm64: dts: qcom: ipq9574: Add missing properties for cryptobam
      arm64: dts: qcom: sc8280xp-x13s: Drop duplicate DMIC supplies
      arm64: dts: qcom: x1e80100-crd: Drop duplicate DMIC supplies
      arm64: dts: qcom: x1-crd: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e001de-devkit: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e80100-hp-omnibook-x14: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: x1e80100-qcp: Fix vreg_l2j_1p2 voltage
      arm64: dts: qcom: msm8916/39: Move UART pinctrl to board files
      arm64: dts: qcom: msm8916/39: Introduce new UART console pinctrl
      arm64: dts: qcom: msm8919/39: Use UART2 console pinctrl where appropriate
      arm64: dts: qcom: msm8916-motorola: Use UART1 console pinctrl
      arm64: dts: qcom: msm8916: Drop generic UART pinctrl templates
      arm64: dts: qcom: msm8939: Drop generic UART pinctrl templates

Taniya Das (3):
      arm64: dts: qcom: qcm6490-idp: Update protected clocks list
      arm64: dts: qcom: qcm6490-idp: Update the LPASS audio node
      arm64: dts: qcom: qcs6490-rb3gen2: Update the LPASS audio node

Tingguo Cheng (3):
      arm64: dts: qcom: qcs8300: Adds SPMI support
      arm64: dts: qcom: qcs8300-ride: Enable PMIC peripherals
      arm64: dts: qcom: qcs615: remove disallowed property in spmi bus node

Varadarajan Narayanan (2):
      arm64: dts: qcom: ipq5424: Enable MMC
      arm64: dts: qcom: ipq9574: Fix USB vdd info

Vikash Garodia (1):
      arm64: dts: qcom: sc7280: drop video decoder and encoder nodes

Viken Dadhaniya (1):
      arm64: dts: qcom: qcs8300: Add QUPv3 configuration

Vikram Sharma (2):
      arm64: dts: qcom: sc7280: Add support for camss
      arm64: dts: qcom: qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine

Vladimir Lypak (1):
      arm64: dts: qcom: msm8953: Add interconnects

Wojciech Slenska (1):
      arm64: dts: qcom: qcm2290: Add uart3 node

Xilin Wu (1):
      arm64: dts: qcom: sm8250: Fix CPU7 opp table

 Documentation/devicetree/bindings/arm/qcom.yaml    |   13 +-
 arch/arm/boot/dts/qcom/Makefile                    |    1 +
 arch/arm/boot/dts/qcom/msm8926.dtsi                |   11 +
 .../dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts |    1 +
 .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |    2 +
 .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  |  341 ++
 .../arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts |    4 +-
 arch/arm/boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi |    2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4018-jalapeno.dts   |    4 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019-ap.dk07.1.dtsi |    2 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi           |    2 +-
 .../dts/qcom/qcom-msm8226-microsoft-common.dtsi    |    6 +-
 .../dts/qcom/qcom-msm8226-microsoft-dempsey.dts    |    1 +
 .../dts/qcom/qcom-msm8226-microsoft-makepeace.dts  |    1 +
 .../dts/qcom/qcom-msm8226-microsoft-moneypenny.dts |    1 +
 .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |   19 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           |  155 +
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |   14 +-
 .../qcom/qcom-msm8926-microsoft-superman-lte.dts   |    1 +
 .../boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts |    1 +
 .../dts/qcom/qcom-msm8926-motorola-peregrine.dts   |    2 +-
 .../dts/qcom/qcom-msm8926-samsung-matisselte.dts   |    5 +
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           |   99 +-
 arch/arm64/boot/dts/qcom/Makefile                  |   57 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts           |   21 +
 .../boot/dts/qcom/apq8016-schneider-hmibsc.dts     |   41 +-
 arch/arm64/boot/dts/qcom/apq8039-t2.dts            |   28 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        |   11 +-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |  135 +
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        |   50 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |  208 +
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |    2 +-
 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi       |   44 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   37 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |   55 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts        |   12 -
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |  114 +-
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts   |    3 +
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |    3 +
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     |    3 +
 arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dts |    3 +
 arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dts     |    3 +
 arch/arm64/boot/dts/qcom/msm8916-lg-c50.dts        |    3 +
 arch/arm64/boot/dts/qcom/msm8916-lg-m216.dts       |    3 +
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |    3 +
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |    3 +
 arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi  |    8 +-
 .../boot/dts/qcom/msm8916-motorola-common.dtsi     |   11 +-
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts           |    3 +
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |    3 +
 .../dts/qcom/msm8916-samsung-fortuna-common.dtsi   |    3 +
 .../boot/dts/qcom/msm8916-samsung-gt5-common.dtsi  |    3 +
 .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   |    3 +
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |    3 +
 arch/arm64/boot/dts/qcom/msm8916-ufi.dtsi          |    3 +
 .../boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi    |    3 +
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |    3 +
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   64 +-
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   |   27 +-
 arch/arm64/boot/dts/qcom/msm8917.dtsi              |   11 +-
 arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts   |    3 +
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |    3 +
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts    |    3 +
 .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    |    3 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |   75 +-
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  158 +-
 arch/arm64/boot/dts/qcom/msm8976.dtsi              |   17 +-
 arch/arm64/boot/dts/qcom/msm8992-lg-h815.dts       |    6 +
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |    6 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |   11 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   21 +-
 .../boot/dts/qcom/msm8996pro-xiaomi-natrium.dts    |    6 +-
 .../boot/dts/qcom/msm8996pro-xiaomi-scorpio.dts    |    6 +-
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      |    2 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   21 +-
 arch/arm64/boot/dts/qcom/pm8937.dtsi               |    8 +
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |   35 +-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  219 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |   28 +-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   |    2 +-
 arch/arm64/boot/dts/qcom/qcs615.dtsi               |   32 +-
 .../dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso |   89 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  287 +-
 arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi        |   51 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |   37 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 4919 ++++++++++++++------
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |    9 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |    2 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |    4 +-
 .../dts/qcom/qrb5165-rb5-vision-mezzanine.dtso     |   11 -
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   31 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           |    5 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |    4 -
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |    5 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  422 +-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |   61 +
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts   |    8 +-
 arch/arm64/boot/dts/qcom/sc7180-el2.dtso           |   22 +
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-kingoftown.dts    |    2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi   |    2 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |    2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   13 +-
 .../qcom/sc7280-herobrine-audio-rt5682-3mic.dtsi   |    1 +
 .../dts/qcom/sc7280-herobrine-audio-wcd9385.dtsi   |    3 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |    2 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  270 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   13 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   24 +-
 arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso         |   44 +
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   16 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |    2 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |    2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi       |   58 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   34 +-
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |    4 +-
 .../boot/dts/qcom/sdm630-sony-xperia-nile.dtsi     |    2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   20 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |   46 +-
 .../arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts |    3 +
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |   12 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |  215 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         |    4 -
 .../qcom/sdm845-db845c-navigation-mezzanine.dtso   |   11 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   29 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |    9 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   16 +-
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |  271 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |    4 -
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |    4 -
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |   43 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts |   23 +
 .../dts/qcom/sdm845-xiaomi-beryllium-tianma.dts    |   23 +
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |   10 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   25 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |   17 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |   11 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |   16 +-
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts    |    2 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   10 +-
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts  |    2 +-
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  |  295 ++
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   10 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |  212 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts      |  210 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    5 +-
 .../boot/dts/qcom/sm8150-microsoft-surface-duo.dts |    8 +-
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts            |    8 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   21 +-
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |    5 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   25 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   32 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   88 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |   12 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  623 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 2876 ++++++++----
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |   22 +
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts            |   21 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  710 ++-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 1749 +++++++
 arch/arm64/boot/dts/qcom/x1-el2.dtso               |   52 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |   62 +-
 .../qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts    |   12 +
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 1126 +----
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 1486 ++++++
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |  147 +-
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 1270 +----
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |   22 +-
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     |   17 +-
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |   16 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |    5 +-
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    5 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  154 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  990 ++--
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   17 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             |   81 +
 178 files changed, 15619 insertions(+), 6411 deletions(-)
 create mode 100644 arch/arm/boot/dts/qcom/msm8926.dtsi
 create mode 100644 arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-el2.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/sc8280xp-el2.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1-crd.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1-el2.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100.dtsi

