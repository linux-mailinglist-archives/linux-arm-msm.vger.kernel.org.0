Return-Path: <linux-arm-msm+bounces-73191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE62B53F1A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 01:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2FF8170908
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 23:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E9931494CC;
	Thu, 11 Sep 2025 23:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RAaS0yHN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE6B2DC77F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 23:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757633766; cv=none; b=i8UOauN464hK2/DsDG04jF7efJVBD0PsgGf3+x3na5zNkw1VleDMW+EcVQ/A//pXtCWDrrfOEb8wI2HILteHcTEFbBDAFHZ73P5oBRcO77dsl4KMGyYGZx2HfnIWBBorvdFpOHeFT2+pe+9DyRU6YUW6qSrC4q4Q0mkwWUUsLHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757633766; c=relaxed/simple;
	bh=fK4oS4wnJ+EN6mwu4aJuPnOQfUFrRP+sbHW/LGAB2Gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cSxdZAQwSoEZz88lpLyuSr0e3ZBhKC7VlZppa4v7MSjpqJr7F8yWddXAUoAkdcp0kiLPW39Fcn2Y3I7MzvzpGmzg5ijM6eKtVm+XNlRpKXvVDwkXl6UxvLyGf25msejB99pbaYtZ6KMvb3l/8cLqumQA9WnyjHpHBg9QczQYkVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RAaS0yHN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2306AC4CEF0;
	Thu, 11 Sep 2025 23:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757633766;
	bh=fK4oS4wnJ+EN6mwu4aJuPnOQfUFrRP+sbHW/LGAB2Gg=;
	h=From:To:Cc:Subject:Date:From;
	b=RAaS0yHN40Lx7tOfBwziG+I3woRLcZQhUfVbv4tuDqHHUg4z8hi7CopGc62VPQT0q
	 PdJMlBTvvxEDWZ7Rtm3z/K+M8fnUsqzU6lCRsDDwuu+LOZufpZYcgyNMvYiN8R1zQX
	 YLyBi+5OpKxrF15t4x0XGyURqMqIIiQh34eS146hGLlZdptoeoFxLQatbdZMCfURbg
	 a2wQIayQAT99Ry0cQfXZn4nSQLRDAK8EoOOQfuONRN4z1ZPD1zgRCfWOZAb8DflPmN
	 sdYOEeqL2rf2R6SG2XgVw4aETs0fZu/9H7NABt7/IPfuWJM2o2ei1ZW5wAqjMyYSsW
	 6hPL4qPB6MjqA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	=?UTF-8?q?Eric=20Gon=C3=A7alves?= <ghatto404@gmail.com>,
	Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
	George Moussalem <george.moussalem@outlook.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Arseniy Velikanov <me@adomerle.pw>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Cristian Cozzolino <cristian_ci@protonmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Ling Xu <quic_lxu5@quicinc.com>,
	Luo Jie <quic_luoj@quicinc.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Renjiang Han <quic_renjiang@quicinc.com>,
	Sayali Lokhande <quic_sayalil@quicinc.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Umang Chheda <umang.chheda@oss.qualcomm.com>,
	Yu Zhang <yu.zhang@oss.qualcomm.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Casey Connolly <casey.connolly@linaro.org>,
	Christopher Obbard <christopher.obbard@linaro.org>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Luca Weiss <luca@lucaweiss.eu>,
	Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
	Pushpendra Singh <quic_pussin@quicinc.com>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Shashank Maurya <quic_ssmaurya@quicinc.com>,
	Shivnandan Kumar <quic_kshivnan@quicinc.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Val Packett <val@packett.cool>,
	Vignesh Viswanathan <quic_viswanat@quicinc.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.18
Date: Thu, 11 Sep 2025 18:35:56 -0500
Message-ID: <20250911233600.3033675-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.18

for you to fetch changes up to be6f43c64ca0f7929904f31c2a034c81093eb5c0:

  arm64: dts: qcom: x1e80100: Update GPU OPP table (2025-09-09 11:52:39 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree updates for v6.18

Add support for Lenovo Thinkbook 16, Dell Inspiron 7441, Dell Latitude
7455, Samsung Galaxy S20, Billion Capture+, the Monaco EVK and the
Lemans EVK.

The SDM845 Cheza development boards are removed, as they are not longer
in use.

For IPQ5018 crypto, tsens, rng, SPI NAND support is dded, the two MDIO
buses are added and the internal GE PHY.

IPQ5424 gets CPU frequency scaling and a missing UART.

The SA8775P SoC is remaned Lemans, to reduce confusion about the chip
name. The IoT memory map introduced and made the default, GDSP FastRPC
and GPR nodes are added.

Touch keys are enabled on the BQ Aquaris X5 Plus.

On QCM2290 the video accelerator is enabled, so is HS timing modes for
eMMC.

The QCS615 platform is renamed SM6150. CPU frequency scaling and the WiFi
PCIe controller is introduced.

On Monaco (QCS8300) scaling of L3 and DDR bandwidth is introduced. So is
eMMC support and generic packer router (GPR).

On the Monaco Ride board, the eMMC controller is enabled.

On QRB220 RB1, the venus video accelerator is enabled.

For SC7280 the first PCIe controller and PHY is introduced. SoundWire,
LPASS, and USB offload support is added, the codecs and sound card is
then described on the QCM6490 IDP. The MDSS core reset is introduced, to
clear bootloader configuration on SC7280-based devices.
On Fairphone5, USB audio offload is added.

AudioReach support on SC7280 (QCS6490) is introduced and used to
enable sound on the RB3Gen2 board.

The video clock controller is added to SC8180X.

On SC8280XP the GPI DMA controllers are described and enabled.

Display and GPU is enabled for the Fairphone 3 and charging is enabled
on the Google Pixel 3a.

The routing for the second USB connector on the Lenovo Yoga C630 is
described.

On SM6150 ADSP and CDSP FastRPC is introduced, as is the video
encoder/decoder (venus).

On SM6350 RPMh statistics is enabled, the USB audio offload DAI is
introduced and on Fairphone4 the USB audio offload support is enabled.

On SM8450 QRD the PMIC GLINK is described, to add USB Type-C and battery
functionality.

On SM8650 ACD levels are added for the GPU.

Camera and video clock controllers power-domains are updated on SM8450,
SM8550, and SM8650, now that support for multiple power-domains is
accepted.

SM8750 gains bwmon support for dynamic bus scaling, and PCIe nodes.

The DWC3 glue and core nodes are flattened on a number of platforms.

USB Type-C DisplayPort support is extended to 4 lanes (from 2) on a
variety of platforms, now that the QMP PHY driver supports this.

Platform specific RPMh PD constants are replaced with generic constants
wherever possible.

On X Elite the PM8010 is disabled by default, removing boot splats
on a variety of boards without this PMIC, the video clock controller is
added.

For the X Elite and X Plus CRDs, and the Lenovo Thinkpad T14s, HBR3 is
marked as valid for the external DisplayPorts. The fingerprint reader
found on the CRDs are enabled. The PCIe x8 slot on the QCP is enabled.
The two Microsoft Surface Laptop 7 gains WiFi and Bluetooth support.

GPU support is added for the X Plus SoC.

----------------------------------------------------------------
Akhil P Oommen (2):
      arm64: dts: qcom: x1p42100: Add GPU support
      arm64: dts: qcom: x1e80100: Update GPU OPP table

Aleksandrs Vinarskis (3):
      arm64: dts: qcom: x1-crd: Enable HBR3 on external DPs
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Enable HBR3 on external DPs
      arm64: dts: qcom: x1e80100-pmics: Disable pm8010 by default

André Apitzsch (1):
      arm64: dts: qcom: msm8976-longcheer-l9360: Add touch keys

Arseniy Velikanov (3):
      arm64: dts: qcom: sm8250-xiaomi-pipa: Drop nonexistent pm8009 pmic
      arm64: dts: qcom: sm8250-xiaomi-pipa: Drop unused bq27z561
      arm64: dts: sm8250-xiaomi-pipa: Update battery info

Barnabás Czémán (3):
      arm64: dts: qcom: msm8953: fix SPI clocks
      arm64: dts: qcom: msm8953: correct SPI pinctrls
      arm64: dts: qcom: msm8953: add spi_7

Bartosz Golaszewski (3):
      arm64: dts: qcom: qrb2210-rb1: fix GPIO lookup flags for i2c SDA and SCL
      arm64: dts: qcom: qrb4210-rb2: fix GPIO lookup flags for i2c SDA and SCL
      arm64: dts: qcom: sdm845-samsung-starqltechn: fix GPIO lookup flags for i2c SDA and SCL

Bjorn Andersson (6):
      arm64: dts: qcom: sc7280: Describe the first PCIe controller and PHY
      dt-bindings: clock: dispcc-sc7280: Add display resets
      Merge branch '20250811-sc7280-mdss-reset-v1-1-83ceff1d48de@oss.qualcomm.com' into arm64-for-6.18
      arm64: dts: qcom: sc7280: Add MDSS_CORE reset to mdss
      Merge branch '20250811090954.2854440-2-quic_varada@quicinc.com' into HEAD
      Revert "arm64: dts: qcom: sm8450: add initial device tree for Samsung Galaxy S22"

Bryan O'Donoghue (2):
      dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
      arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455

Casey Connolly (1):
      arm64: dts: qcom: sdm845-oneplus-*: set constant-charge-current-max-microamp

Christopher Obbard (1):
      arm64: dts: qcom: x1e78100-t14s-oled: Add eDP panel

Cristian Cozzolino (3):
      dt-bindings: vendor-prefixes: Add Flipkart
      dt-bindings: arm: qcom: Add Billion Capture+
      arm64: dts: qcom: msm8953: Add device tree for Billion Capture+

David Heidelberg (2):
      arm64: dts: qcom: sdm845*: Use definition for msm-id
      arm64: dts: qcom: sdm845-oneplus: Deduplicate shared entries

Dmitry Baryshkov (20):
      arm64: dts: qcom: sa8775p: fix RPMh power domain indices
      arm64: dts: qcom: sm8150: use correct PD for DisplayPort controller
      arm64: dts: qcom: sm8250: stop using SoC-specific genpd indices
      arm64: dts: qcom: sm8550: stop using SoC-specific genpd indices
      arm64: dts: qcom: sdm845: rename DisplayPort labels
      arm64: dts: qcom: sar2130p: use TAG_ALWAYS for MDSS's mdp0-mem path
      arm64: dts: qcom: sar2130p: correct VBIF region size for MDSS
      arm64: dts: qcom: sar2130p: use defines for DSI PHY clocks
      arm64: dts: qcom: sdm850-lenovo-yoga-c630: add routing for second USB connector
      arm64: dts: qcom: sa8775p: rename bus clock to follow the bindings
      dt-bindings: arm: qcom: add qcom,sm6150 fallback compatible to QCS615
      arm64: dts: qcom: rename qcs615.dtsi to sm6150.dtsi
      arm64: dts: qcom: sc8180x: add empty mdss_edp_out endpoint
      arm64: dts: qcom: sc8280xp: add empty mdss*_dp*_out endpoints
      arm64: dts: qcom: x1e80100: add empty mdss_dp3_out endpoint
      arm64: dts: qcom: move data-lanes to the DP-out endpoint
      arm64: dts: qcom: sc7180-acer-aspire1: drop deprecated DP supplies
      arm64: dts: qcom: sc8180x: modernize MDSS device definition
      arm64: dts: qcom: use DT label for DSI outputs
      arm64: dts: qcom: sm6150: move standard clocks to SoC dtsi

Eric Gonçalves (8):
      dt-bindings: arm: qcom: document r0q board binding
      arm64: dts: qcom: sm8450: add initial device tree for Samsung Galaxy S22
      arm64: dts: qcom: starqltechn: remove extra empty line
      dt-bindings: arm: qcom: document r8q board binding
      arm64: dts: qcom: add initial support for Samsung Galaxy S20 FE
      arm64: dts: qcom: sm8250-samsung-r8q: Move common parts to dtsi
      dt-bindings: arm: qcom: document x1q board binding
      arm64: dts: qcom: add initial support for Samsung Galaxy S20

Gabor Juhos (2):
      arm64: dts: qcom: ipq9574: use 'pcie' as node name for 'pcie0'
      arm64: dts: qcom: ipq9574-rdp433: remove unused 'sdc-default-state'

George Moussalem (7):
      arm64: dts: qcom: ipq5018: Add MDIO buses
      arm64: dts: qcom: ipq5018: Add GE PHY to internal mdio bus
      arm64: dts: qcom: ipq5018: Add SPI nand support
      arm64: dts: qcom: ipq5018: add PRNG node
      arm64: dts: qcom: ipq5018: Add crypto nodes
      arm64: dts: ipq5018: Add CMN PLL node
      arm64: dts: qcom: Update IPQ5018 xo_board_clk to use fixed factor clock

Guido Günther (1):
      arm64: dts: qcom: sdm845-shift-axolotl: set chassis type

Jagadeesh Kona (5):
      arm64: dts: qcom: sm8450: Additionally manage MXC power domain in videocc
      arm64: dts: qcom: sm8550: Additionally manage MXC power domain in videocc
      arm64: dts: qcom: sm8650: Additionally manage MXC power domain in videocc
      arm64: dts: qcom: sm8450: Additionally manage MXC power domain in camcc
      arm64: dts: qcom: sm8650: Additionally manage MXC power domain in camcc

Jens Glathe (3):
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add Bluetooth support
      dt-bindings: arm: qcom: Add Lenovo TB16 support
      arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY device tree

Jorge Ramirez-Ortiz (2):
      arm64: dts: qcom: qcm2290: Add Venus video node
      arm64: dts: qcom: qrb2210-rb1: Enable Venus

Kamal Wadhwa (1):
      arm64: dts: qcom: sm8550: Correct the min/max voltages for vreg_l6n_3p3

Kathiravan Thirumoorthy (1):
      arm64: dts: qcom: ipq5424: Describe the 4-wire UART SE

Konrad Dybcio (10):
      arm64: dts: qcom: msm8916: Drop venus-enc/decoder node
      arm64: dts: qcom: sc7180: Drop venus-enc/decoder node
      arm64: dts: qcom: sdm845: Drop venus-enc/decoder node
      arm64: dts: qcom: sm8250: Drop venus-enc/decoder node
      arm64: dts: qcom: Remove sdm845-cheza boards
      dt-bindings: arm: qcom: Remove sdm845-cheza
      arm64: dts: qcom: sc7280-chrome-common: Remove duplicate node
      arm64: dts: qcom: qcm2290: Disable USB SS bus instances in park mode
      arm64: dts: qcom: sc7180: Describe on-SoC USB-adjacent data paths
      arm64: dts: qcom: x1e80100-romulus: Add WCN7850 Wi-Fi/BT

Krishna Chaitanya Chundru (2):
      arm64: dts: qcom: qcs6490-rb3gen2: Add missing clkreq pinctrl property
      arm64: dts: qcom: sm8750: Add PCIe PHY and controller node

Krishna Kurapati (4):
      arm64: dts: qcom: sm8450-qrd: add pmic glink node
      arm64: dts: qcom: sm8450: Flatten usb controller node
      arm64: dts: qcom: sc7280: Flatten usb controller nodes
      arm64: dts: qcom: sm8450: Fix address for usb controller node

Krishna chaitanya chundru (2):
      arm64: dts: qcom: qcs615: enable pcie
      arm64: dts: qcom: qcs615-ride: Enable PCIe interface

Krzysztof Kozlowski (16):
      arm64: dts: qcom: sm8650: Sort nodes by unit address
      dt-bindings: arm: qcom: Drop redundant free-form SoC list
      dt-bindings: arm: qcom-soc: Document new Milos and Glymur SoCs
      arm64: dts: qcom: sm8750-mtp: Add speaker Soundwire port mapping
      arm64: dts: qcom: Minor whitespace cleanup
      arm64: dts: qcom: ipq5424: Add default GIC address cells
      arm64: dts: qcom: lemans: Add default GIC address cells
      arm64: dts: qcom: msm8996: Add default GIC address cells
      arm64: dts: qcom: qcs404: Add default GIC address cells
      arm64: dts: qcom: sc8180x: Add default GIC address cells
      arm64: dts: qcom: sm6150: Add default GIC address cells
      arm64: dts: qcom: sm8150: Add default GIC address cells
      arm64: dts: qcom: sm8250: Add default GIC address cells
      arm64: dts: qcom: sm8350: Add default GIC address cells
      arm64: dts: qcom: Use GIC_SPI for interrupt-map for readability
      arm64: dts: qcom: sm8650: Drop redundant status from PMK8550 RTC

Laurent Pinchart (1):
      arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Replace clock-frequency in camera sensor node

Ling Xu (2):
      arm64: dts: qcom: sm6150: Add ADSP and CDSP fastrpc nodes
      arm64: dts: qcom: lemans: add GDSP fastrpc-compute-cb nodes

Loic Poulain (1):
      arm64: dts: qcom: qcm2290: Enable HS eMMC timing modes

Luca Weiss (7):
      arm64: dts: qcom: sm6350: Add q6usbdai node
      arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB audio offload support
      arm64: dts: qcom: pmk8550: Correct gpio node name
      arm64: dts: qcom: sc7280: Add q6usbdai node
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable USB audio offload support
      arm64: dts: qcom: sm6350: Add rpmh-stats node
      arm64: dts: qcom: sdm632-fairphone-fp3: Enable display and GPU

Luo Jie (2):
      arm64: dts: qcom: ipq5424: Add CMN PLL node
      arm64: dts: qcom: Update IPQ5424 xo_board to use fixed factor clock

Mohammad Rafi Shaik (11):
      arm64: dts: qcom: qcs6490-audioreach: Add AudioReach support for QCS6490
      arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
      arm64: dts: qcom: qcs6490-audioreach: Enable LPASS macros clock settings for audioreach
      arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
      arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
      arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370 headset codec
      arm64: dts: qcom: qcm6490-idp: Add sound card
      arm64: dts: qcom: qcs8300: Add gpr node
      arm64: dts: qcom: monaco-evk: Add sound card
      arm64: dts: qcom: lemans: Add gpr node
      arm64: dts: qcom: lemans-evk: Add sound card

Mrinmay Sarkar (1):
      arm64: dts: qcom: sa8775p: Remove max link speed property for PCIe EP

Neil Armstrong (15):
      arm64: dts: qcom: sm8550: Flatten the USB nodes
      arm64: dts: qcom: sm8650: Flatten the USB nodes
      arm64: dts: qcom: sm8650: Add ACD levels for GPU
      arm64: dts: qcom: sm8550: switch to interrupt-cells 4 to add PPI partitions
      arm64: dts: qcom: sm8550: add PPI interrupt partitions for the ARM PMUs
      arm64: dts: qcom: sm8550: allow mode-switch events to reach the QMP Combo PHY
      arm64: dts: qcom: sm8650: allow mode-switch events to reach the QMP Combo PHY
      arm64: dts: qcom: x1e80100: allow mode-switch events to reach the QMP Combo PHYs
      arm64: dts: qcom: sm8550: move dp0 data-lanes to SoC dtsi
      arm64: dts: qcom: sm8650: move dp0 data-lanes to SoC dtsi
      arm64: dts: qcom: x1e80100: move dp0/1/2 data-lanes to SoC dtsi
      arm64: dts: qcom: sm8550: Set up 4-lane DP
      arm64: dts: qcom: sm8650: Set up 4-lane DP
      arm64: dts: qcom: x1e80100: Set up 4-lane DP
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13: Set up 4-lane DP

Pengyu Luo (2):
      arm64: dts: qcom: sc8280xp: Describe GPI DMA controller nodes
      arm64: dts: qcom: sc8280xp: Enable GPI DMA

Pushpendra Singh (1):
      arm64: dts: qcom: sc7280: Add support for two additional DDR frequencies

Qiang Yu (2):
      arm64: dts: qcom: x1e80100: add bus topology for PCIe domain 3
      arm64: dts: qcom: x1e80100-qcp: enable pcie3 x8 slot for X1E80100-QCP

Raviteja Laggyshetty (1):
      arm64: dts: qcom: qcs8300: Add EPSS l3 interconnect provider node and CPUCP OPP tables to scale DDR/L3

Renjiang Han (2):
      arm64: dts: qcom: sm6150: add venus node to devicetree
      arm64: dts: qcom: qcs615-ride: enable venus node to initialize video codec

Richard Acayan (1):
      arm64: dts: qcom: sdm670-google-sargo: enable charger

Satya Priya Kakitapalli (1):
      arm64: dts: qcom: sc8180x: Add video clock controller node

Sayali Lokhande (2):
      arm64: dts: qcom: qcs8300: Add eMMC support
      arm64: dts: qcom: qcs8300-ride: Enable SDHC1 node

Shashank Maurya (1):
      arm64: dts: qcom: lemans-evk: Enable Display Port

Shivnandan Kumar (1):
      arm64: dts: qcom: sm8750: Add BWMONs

Sricharan Ramabadhran (3):
      dt-bindings: clock: ipq5424-apss-clk: Add ipq5424 apss clock controller
      arm64: dts: qcom: ipq5018: Add tsens node
      arm64: dts: qcom: ipq5424: Enable cpufreq

Stephan Gerhold (17):
      arm64: dts: qcom: x1e80100-crd: Add USB multiport fingerprint reader
      arm64: dts: qcom: x1e80100: Add videocc
      arm64: dts: qcom: sdm845: Fix slimbam num-channels/ees
      arm64: dts: qcom: x1e001de-devkit: Fix swapped USB MP repeaters
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Fix swapped USB MP repeaters
      arm64: dts: qcom: x1e80100-asus-vivobook-s15: Fix swapped USB MP repeaters
      arm64: dts: qcom: x1e80100-qcp: Fix swapped USB MP repeaters
      arm64: dts: qcom: x1e80100: Add pinctrl template for eDP0 HPD
      arm64: dts: qcom: x1-asus-zenbook-a14: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1-crd: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1e80100-asus-vivobook-s15: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1e80100-hp-omnibook-x14: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1e80100-microsoft-romulus: Add missing pinctrl for eDP HPD
      arm64: dts: qcom: x1e80100-qcp: Add missing pinctrl for eDP HPD

Sumit Garg (1):
      arm64: dts: qcom: qcm2290: Add TCSR download mode address

Taniya Das (2):
      arm64: dts: qcom: qcs615: Add clock nodes for multimedia clock
      arm64: dts: qcom: qcs615: Add CPU scaling clock node

Umang Chheda (2):
      dt-bindings: arm: qcom: Add Monaco EVK support
      arm64: dts: qcom: qcs8300: Add Monaco EVK board

Val Packett (1):
      dt-bindings: arm: qcom: Add Dell Latitude 7455

Vignesh Viswanathan (1):
      arm64: dts: qcom: ipq5424: Add reserved memory for TF-A

Viken Dadhaniya (1):
      arm64: dts: qcom: qcs615: add missing dt property in QUP SEs

Vladimir Zapolskiy (1):
      arm64: dts: qcom: sm8550: Additionally manage MXC power domain in camcc

Wasim Nazir (8):
      arm64: dts: qcom: Rename sa8775p SoC to "lemans"
      arm64: dts: qcom: lemans: Update memory-map for IoT platforms
      arm64: dts: qcom: lemans: Separate out ethernet card for ride & ride-r3
      arm64: dts: qcom: lemans: Refactor ride/ride-r3 boards based on daughter cards
      arm64: dts: qcom: lemans: Rename sa8775p-pmics.dtsi to lemans-pmics.dtsi
      arm64: dts: qcom: lemans: Fix dts inclusion for IoT boards and update memory map
      dt-bindings: arm: qcom: lemans: Add bindings for Lemans Evaluation Kit (EVK)
      arm64: dts: qcom: Add lemans evaluation kit (EVK) initial board support

Yu Zhang(Yuriy) (2):
      arm64: dts: qcom: qcs615: add a PCIe port for WLAN
      arm64: dts: qcom: qcs615-ride: Enable WiFi/BT nodes

Ziyue Zhang (3):
      arm64: dts: qcom: qcs615: Set LDO12A regulator to HPM to avoid boot hang
      arm64: dts: qcom: sa8775p: remove aux clock from pcie phy
      arm64: dts: qcom: sa8775p: add link_down reset for pcie

 .../devicetree/bindings/arm/qcom-soc.yaml          |    5 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |  107 +-
 .../bindings/clock/qcom,ipq5424-apss-clk.yaml      |   55 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 MAINTAINERS                                        |    1 -
 arch/arm64/boot/dts/qcom/Makefile                  |   14 +-
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |    3 +-
 .../dts/qcom/ipq5018-tplink-archer-ax55-v1.dts     |    3 +-
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  356 ++++-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |   16 +-
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        |   42 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |  144 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |    8 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |   16 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts        |   32 -
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   34 +-
 arch/arm64/boot/dts/qcom/lemans-auto.dtsi          |  104 ++
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |  413 +++++
 .../qcom/{sa8775p-pmics.dtsi => lemans-pmics.dtsi} |    0
 .../{sa8775p-ride.dtsi => lemans-ride-common.dtsi} |  168 --
 .../dts/qcom/lemans-ride-ethernet-88ea1512.dtsi    |  205 +++
 .../dts/qcom/lemans-ride-ethernet-aqr115c.dtsi     |  205 +++
 .../boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi}    |  271 +++-
 arch/arm64/boot/dts/qcom/monaco-evk.dts            |  501 ++++++
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |    8 -
 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts |  255 +++
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  162 +-
 .../boot/dts/qcom/msm8976-longcheer-l9360.dts      |    6 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |   25 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |    6 +-
 arch/arm64/boot/dts/qcom/pmk8550.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |   62 +
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |   22 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  214 ++-
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts   |    6 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |    1 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |  192 ++-
 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi   |  119 ++
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   88 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |   21 +
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              |  499 +++++-
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts       |    9 +-
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts          |    9 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |    9 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |    5 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   12 +-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |   96 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts       |   40 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts          |   40 +-
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |   39 +-
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts   |    6 +-
 arch/arm64/boot/dts/qcom/sc7180-idp.dts            |   12 +-
 .../dts/qcom/sc7180-trogdor-quackingstick.dtsi     |   12 +-
 .../boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi  |   12 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   56 +-
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |    5 -
 arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi     |    6 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |    6 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  375 ++++-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |   14 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |   14 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   69 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   23 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |   12 +
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   29 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |   12 +
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |   25 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  426 ++++-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |   62 +
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts   |   17 +
 arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts       |  238 ---
 arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts       |  238 ---
 arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts       |  174 --
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi         | 1330 ----------------
 .../qcom/sdm845-db845c-navigation-mezzanine.dtso   |    3 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   27 +-
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts            |   26 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |    4 +
 .../boot/dts/qcom/sdm845-oneplus-enchilada.dts     |   10 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts |   10 +-
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |    7 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |    4 +-
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |    3 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |    3 +-
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts |    3 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   36 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  116 +-
 .../boot/dts/qcom/{qcs615.dtsi => sm6150.dtsi}     |  410 +++++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   16 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |   36 +
 .../boot/dts/qcom/sm7325-nothing-spacewar.dts      |    6 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |   24 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |   19 +-
 .../arm64/boot/dts/qcom/sm8250-samsung-common.dtsi |  204 +++
 arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dts    |   26 +
 arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dts    |   26 +
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts    |   96 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   75 +-
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            |   12 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   17 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |    5 -
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts            |   51 +-
 .../boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi   |    5 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   87 +-
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            |    8 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |    8 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |    8 +-
 arch/arm64/boot/dts/qcom/sm8550-samsung-q5q.dts    |    4 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  692 ++++----
 .../boot/dts/qcom/sm8650-hdk-display-card.dtso     |   15 +-
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts            |   14 +-
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |    6 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   14 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  446 +++---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |   14 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |  256 ++-
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |   21 +-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |   88 +-
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        | 1666 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |    7 +-
 .../qcom/x1e78100-lenovo-thinkpad-t14s-oled.dts    |    8 +
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |   27 +-
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   |   23 +-
 .../qcom/x1e80100-dell-inspiron-14-plus-7441.dts   |   52 +
 .../boot/dts/qcom/x1e80100-dell-latitude-7455.dts  |   53 +
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |   21 +-
 .../boot/dts/qcom/x1e80100-hp-omnibook-x14.dts     |   21 +-
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  165 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |  164 +-
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  143 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  129 +-
 arch/arm64/boot/dts/qcom/x1p42100-crd.dts          |    4 +
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1625 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1p42100.dtsi             |  121 +-
 include/dt-bindings/clock/qcom,apss-ipq.h          |    6 +
 include/dt-bindings/clock/qcom,dispcc-sc7280.h     |    4 +
 include/dt-bindings/interconnect/qcom,ipq5424.h    |    3 +
 139 files changed, 11079 insertions(+), 3957 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq5424-apss-clk.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-auto.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk.dts
 rename arch/arm64/boot/dts/qcom/{sa8775p-pmics.dtsi => lemans-pmics.dtsi} (100%)
 rename arch/arm64/boot/dts/qcom/{sa8775p-ride.dtsi => lemans-ride-common.dtsi} (87%)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-ride-ethernet-88ea1512.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-ride-ethernet-aqr115c.dtsi
 rename arch/arm64/boot/dts/qcom/{sa8775p.dtsi => lemans.dtsi} (97%)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza-r1.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza-r2.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza-r3.dts
 delete mode 100644 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
 rename arch/arm64/boot/dts/qcom/{qcs615.dtsi => sm6150.dtsi} (89%)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-samsung-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-samsung-r8q.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-samsung-x1q.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-dell-latitude-7455.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts

