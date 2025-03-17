Return-Path: <linux-arm-msm+bounces-51657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D34EA66119
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 22:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A48A7A4083
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 21:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC091FC0E3;
	Mon, 17 Mar 2025 21:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JaiyG62+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2999417A2EF
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Mar 2025 21:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742248765; cv=none; b=PQ0j4pgwbUaLC4YWLm5OJkq/2VZFJJEHkUkyYrdqRWouvT0bNXXZBFXBgYtwCxSPg++qF/+0yElnpjvKUd0LhW3Qn6Zws6nBaY6+mlT7Vc3Q4SrugXmQBEy3tgfSaXF5dFNYlS3hEsMfj8RWNzzU+TeL+1Px0P0voR4nFWqaWIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742248765; c=relaxed/simple;
	bh=c/AKuM0g4h7AIbc81RQ6yZ2kg3wq5WX1tqvynYn4DCA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eSl4LV12/ujGMrwDoL1b/StLCf3Q557/jDllGVKHEv3JQu7+AaS5sdZq3V93GuhQbkfoaZU7pkTQql9cVNxomairWzMQrGsm+PG8H2cQd1hzRxG5eO2q55UPKY4M8FI8SfvYyjuebnUM3GLVdjZknXY551hzcbc7M62lujNz4xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JaiyG62+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AE88C4CEE3;
	Mon, 17 Mar 2025 21:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742248764;
	bh=c/AKuM0g4h7AIbc81RQ6yZ2kg3wq5WX1tqvynYn4DCA=;
	h=From:To:Cc:Subject:Date:From;
	b=JaiyG62+AIo0zWeEy68cXgj5YuDaVbrMfPf0oxEu3cqi2P/1AeaQxx+8qNk8Y70oY
	 JcYvUIKw2W3ML8nrYiJ6lt1sOZnfM+uX25sSbZoN3HeytYGNkT5dFfg3+TQQRSFCvi
	 zo9w5eGBNdudNujMUftv6c0jXRbWgIeDoJUZ3cyfADlvE2UhW8MghdfAEURQ9H/EHd
	 kNI8PQujSZtTTOXVdAWVZJWo73BTnTa7CNTd8hUPT6RZltlYNCLXOb7NOIV+dwa22F
	 Nb23JFNhQfR9HSft8jKaZU2Vb9QxGRknjasGNspRsDMmD5xCLSYD5C+JWz+lkXjp4k
	 KOKbcr3eP4jdQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Danila Tikhonov <danila@jiaxyga.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
	Nikita Travkin <nikita@trvn.ru>,
	Praveenkumar I <quic_ipkumar@quicinc.com>,
	Tingguo Cheng <quic_tingguoc@quicinc.com>,
	Cheng Jiang <quic_chejiang@quicinc.com>,
	Janaki Ramaiah Thota <quic_janathot@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Lijuan Gao <quic_lijuang@quicinc.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mark Kettenis <kettenis@openbsd.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Rakesh Kota <quic_kotarake@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Wojciech Slenska <wojciech.slenska@gmail.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.15
Date: Mon, 17 Mar 2025 16:59:19 -0500
Message-ID: <20250317215921.2031880-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.15

for you to fetch changes up to d09ab685a8f51ba412d37305ea62628a01cbea57:

  arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq (2025-03-03 22:54:17 -0600)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree updates for v6.15

The Snapdragon X Plus platform and the reference device is introduced.

Tsens and thermal zones are added for IPQ5332 and IPQ5424. IPQ6018 gains
1.2GHz and 1.5GHz CPU frequencies.

Display and GPU are enabled in the QCM6490-based Fairphone FP5. On QCS6490
Rb3Gen2 ADC channels for thermal profiling are added and Bluetooth is
enabled.

QCS615 platform gains command DB definition.

The QCS8300 platform gains description of more QUP instances and the
SPMI controller.

On SDM630 missing resets are added for SDCC. Then on Fairphone FP3 modem
is enabled, and firmware-path are defined on ADSP and WCNSS.

The SDM845 RB3/DragonBoard845c and the QRB5165 RB5 has the sensors DSP
enabled, and the vision mezzanine on both gets their CMA configuration
cleaned up.

On the SM7325 Nothing Phone (1) camera EEPROMs are described.

For SM8550 OPP tables are described for PCIe and QUP. SM8750 gains RPMh
sleep stats.

SM8650 gians OSM L3 scaling and variety of OPP tables and missing
interconnect definitions. The thermal trip points for CPU cores and GPU
are raised in reliance on hardware throttling.

A few more temp-alarm instances are added for the SC8280XP PMICs.

On the X Elite platform GPU cooling and watchdog is introduced, together
with a number of smaller fixes. Dell XPS13 gains support for USB Type-C
display, the QCP gains WiFi/BT power sequence, and a few devices learns
about HBR3.

----------------------------------------------------------------
Aleksandrs Vinarskis (4):
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Enable external DP support
      arm64: dts: qcom: x1e001de-devkit: Enable HBR3 on external DPs
      arm64: dts: qcom: x1e80100-hp-x14: Enable HBR3 on external DPs
      arm64: dts: qcom: x1e80100-qcp: Enable HBR3 on external DPs

Alexey Minnekhanov (2):
      dt-bindings: clock: gcc-sdm660: Add missing SDCC resets
      arm64: dts: qcom: sdm630: Add missing resets to mmc blocks

Bjorn Andersson (1):
      Merge branch '20250203063427.358327-2-alexeymin@postmarketos.org' into arm64-for-6.15

Cheng Jiang (1):
      arm64: dts: qcom: sa8775p-ride: Add firmware-name in BT node

Chukun Pan (5):
      arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
      arm64: dts: qcom: ipq6018: add 1.5GHz CPU Frequency
      arm64: dts: qcom: ipq6018: move mp5496 regulator out of soc dtsi
      arm64: dts: qcom: ipq6018: rename labels of mp5496 regulator
      arm64: dts: qcom: ipq6018: add LDOA2 regulator

Danila Tikhonov (2):
      arm64: dts: qcom: sm7325-nothing-spacewar: Add CAM fixed-regulators
      arm64: dts: qcom: sm7325-nothing-spacewar: Enable camera EEPROMs

Dmitry Baryshkov (2):
      arm64: dts: qcom: sdm845-db845c: enable sensors DSP
      arm64: dts: qcom: qrb5165-rb5: enable sensors DSP

Janaki Ramaiah Thota (1):
      arm64: dts: qcom: qcs6490-rb3gen2: add and enable BT node

Konrad Dybcio (5):
      arm64: dts: qcom: x1e80100: Set CPU interconnect paths as ACTIVE_ONLY
      arm64: dts: qcom: x1e80100: Wire up PCIe PHY NOCSR resets
      arm64: dts: qcom: Commonize X1 CRD DTSI
      arm64: dts: qcom: Add X1P42100 SoC and CRD
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable the GPU

Krzysztof Kozlowski (17):
      arm64: dts: qcom: sa8775p: Partially revert "arm64: dts: qcom: sa8775p: add QCrypto nodes"
      arm64: dts: qcom: qcs8300: Partially revert "arm64: dts: qcom: qcs8300: add QCrypto nodes"
      arm64: dts: qcom: x1e80100-slim7x: Drop incorrect qcom,ath12k-calibration-variant
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

Lijuan Gao (1):
      arm64: dts: qcom: qcs615: Add Command DB support

Luca Weiss (5):
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable display
      arm64: dts: qcom: sdm632-fairphone-fp3: Move status properties last
      arm64: dts: qcom: sdm632-fairphone-fp3: Add newlines between regulator nodes
      arm64: dts: qcom: sdm632-fairphone-fp3: Add firmware-name for adsp & wcnss
      arm64: dts: qcom: sdm632-fairphone-fp3: Enable modem

Manikanta Mylavarapu (2):
      arm64: dts: qcom: ipq5424: Add tsens node
      arm64: dts: qcom: ipq5424: Add thermal zone nodes

Mark Kettenis (1):
      arm64: dts: qcom: x1e80100: Mark usb_2 as dma-coherent

Maulik Shah (1):
      arm64: dts: qcom: sm8750: Add RPMh sleep stats

Neil Armstrong (19):
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

Nikita Travkin (2):
      arm64: dts: qcom: qrb5165-rb5-vision-mezzanine: Drop CMA heap
      arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Drop CMA heap

Pengyu Luo (3):
      arm64: dts: qcom: sc8280xp-pmics: Fix slave ID in interrupts configuration
      arm64: dts: qcom: sc8280xp-pmics: Add more temp-alarm devices
      arm64: dts: qcom: sc8280xp: Fix clock for spi0 to spi7

Praveenkumar I (2):
      arm64: dts: qcom: ipq5332: Add tsens node
      arm64: dts: qcom: ipq5332: Add thermal zone nodes

Rajendra Nayak (1):
      arm64: dts: qcom: x1e80100: Add the watchdog device

Rakesh Kota (1):
      arm64: dts: qcom: qcs6490-rb3gen2: Add vadc and adc-tm channels

Stephan Gerhold (5):
      arm64: dts: qcom: x1e80100: Fix video thermal zone
      arm64: dts: qcom: x1e80100: Apply consistent critical thermal shutdown
      arm64: dts: qcom: x1e80100: Add GPU cooling
      arm64: dts: qcom: x1e80100: Drop unused passive thermal trip points for CPU
      arm64: dts: qcom: x1e80100-qcp: Add WiFi/BT pwrseq

Tingguo Cheng (2):
      arm64: dts: qcom: qcs8300: Adds SPMI support
      arm64: dts: qcom: qcs8300-ride: Enable PMIC peripherals

Viken Dadhaniya (1):
      arm64: dts: qcom: qcs8300: Add QUPv3 configuration

Wojciech Slenska (1):
      arm64: dts: qcom: qcm2290: Add uart3 node

 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |  135 ++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |  201 ++
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts       |    2 +-
 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi       |   44 +
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |   28 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   40 +-
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   |    2 +-
 arch/arm64/boot/dts/qcom/msm8917.dtsi              |    2 +-
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      |    2 +-
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |   24 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  104 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |    2 +-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   |    2 +-
 arch/arm64/boot/dts/qcom/qcs615.dtsi               |   22 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  281 ++-
 arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi        |   51 +
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |    1 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 2126 +++++++++++++++++--
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |    2 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |    2 +-
 .../dts/qcom/qrb5165-rb5-vision-mezzanine.dtso     |   11 -
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |    6 +
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |    3 +-
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |   11 -
 .../boot/dts/qcom/sc7180-trogdor-homestar.dtsi     |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-kingoftown.dts    |    2 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor.dtsi |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-pazquel360.dtsi   |    2 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |    2 +-
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |    2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |    2 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |    2 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |    2 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |    2 +-
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi       |   58 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   16 +-
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |    2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |    3 +
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |   46 +-
 .../qcom/sdm845-db845c-navigation-mezzanine.dtso   |   11 -
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |    8 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |    2 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |    2 +-
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts    |    2 +-
 arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dts  |    2 +-
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts      |  157 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |    2 +-
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |    2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  602 ++++--
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 2152 +++++++++++++++-----
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |   13 +-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 1275 ++++++++++++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |    3 +
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          | 1270 +-----------
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |   18 +
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     |    2 +
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |    2 -
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  147 ++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  968 +++------
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |   17 +
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             |   81 +
 include/dt-bindings/clock/qcom,gcc-sdm660.h        |    2 +
 64 files changed, 7152 insertions(+), 2840 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/ipq6018-mp5496.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs8300-pmics.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1-crd.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100.dtsi

