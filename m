Return-Path: <linux-arm-msm+bounces-5414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 70284818A6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 15:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAC8E1F2DDEB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Dec 2023 14:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB09D1C69A;
	Tue, 19 Dec 2023 14:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNRBTv4j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A005D1C694
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Dec 2023 14:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D8EC433C8;
	Tue, 19 Dec 2023 14:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702997385;
	bh=RdOIc6N4XOY5+ehFSC5h3OhBHWEltFSCZVGV0weNHfY=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=QNRBTv4jstuJyXW8p2PbpbnaCpBHUaOQD5dBFXnQuxJTxTzhW0CU2YfQDvQmyWtND
	 alhMcVKpQB9fWA4AwbYLehzdw2z1PWBjdowBTEdH7U9JHZcY+h+/OU2PugHLT7+sHN
	 mJlNzRZEm7ytY8cmbtwqMtahtH95tKUGRCweltD+kSDP1grXZznuy03pfvvQsSl/C/
	 iP3mycuxQG2/U//7MmklsLwL2s39lpN1JRHwT9FTT4L1i03U52THTxjxLrP56OOR8E
	 mJ2YpIl6CY0Zd3YLsWTwy7decqRRbKtV53ERuvZ77oBpbmqwCcSxdcmF2d6CKVQR2p
	 AaEoJb4xDxU5A==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Douglas Anderson <dianders@chromium.org>,
	Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
	Luca Weiss <luca@z3ntu.xyz>, Nikita Travkin <nikita@trvn.ru>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Robert Marko <robimarko@gmail.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Nia Espera <nespera@igalia.com>,
	Tengfei Fan <quic_tengfan@quicinc.com>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	Komal Bajaj <quic_kbajaj@quicinc.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mao Jinlong <quic_jinlmao@quicinc.com>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	Om Prakash Singh <quic_omprsing@quicinc.com>,
	Rohit Agarwal <quic_rohiagar@quicinc.com>,
	Abel Vesa <abel.vesa@linaro.org>, Alex Elder <elder@linaro.org>,
	Anusha Rao <quic_anusha@quicinc.com>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Fenglin Wu <quic_fenglinw@quicinc.com>,
	Jianhua Lu <lujianhua000@gmail.com>, Lin@web.codeaurora.org,
	Meng-Bo <linmengbo0689@protonmail.com>,
	Luka Panio <lukapanio@gmail.com>,
	Lukas Walter <lukas.walter@aceart.de>,
	Nitheesh Sekar <quic_nsekar@quicinc.com>,
	Nitin Rawat <quic_nitirawa@quicinc.com>,
	Richard Acayan <mailingradian@gmail.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Gianluca Boiano <morf3089@gmail.com>,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	Imran Shaik <quic_imrashai@quicinc.com>,
	"J . R . Divya Antony" <d.antony.jr@gmail.com>,
	Jasper Korten <jja2000@gmail.com>,
	Joel Selvaraj <joelselvaraj.oss@gmail.com>,
	Jonathan Albrieux <jonathan.albrieux@gmail.com>,
	Priyansh Jain <quic_priyjain@quicinc.com>,
	Raghavendra Kakarla <quic_rkakarla@quicinc.com>,
	Raymond Hackley <raymondhackley@protonmail.com>,
	Rayyan Ansari <rayyan@ansari.sh>,
	Shazad Hussain <quic_shazhuss@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Sridharan S N <quic_sridsn@quicinc.com>,
	Steev Klimaszewski <steev@kali.org>,
	Stephen Boyd <swboyd@chromium.org>
Subject: [GIT PULL] Qualcomm ARM64 updates for v6.8
Date: Tue, 19 Dec 2023 06:53:59 -0800
Message-ID: <20231219145402.874161-1-andersson@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.8

for you to fetch changes up to b7b9a6aa7aea2bcba2d35d65e4ce2913115485a3:

  arm64: dts: qcom: sc8180x-primus: Allow UFS regulators load/mode setting (2023-12-17 14:28:17 -0600)

----------------------------------------------------------------
Qualcomm ARM64 updates for v6.8

Support is added for the new Snapdragon 8 Gen 3 mobile platform, with
support for the MTP and QRD development devices, the new Snapdragon X
Elite compute platform with QCP and CRD development/references devices,
the QCS6590/QCM6490 platform with support for the IDP development device
and the Robotics RB3gen2 board, the Huawei Honor 5X/GR5 handset
built on MSM8939, and Xiaomi Pad 6 on SM8250.

On IPQ5018 and IPQ6018 platform support for CPUfreq, USB, and one
additional QUP SPI controller is added.

CPU OPP tables are selectively enabled based on fuses, for both IPQ5332
and IPQ6018. IPQ6018 gains description of a few more SPI and UART nodes.

Common elements of the IPQ9574 RDP boards are refactored into a common
include file. IPQ9574 also gains description of its LEDs and WPS
busttons.

MSM8916 finally gets the DSP-based audio described, and this is enabled
for a variety of boards. Acer Iconia Talk S and Loncheer L8910 gains
notification LED, battery and charger support is added to Loncheer
L8150, and GPU is enabled for Samsung Galaxy Tab A.

Similariy DSP-based audio is added on MSM8939, the BAM-DMUX support is
enabled as well. The Longcheer L9100 gains RGB notification LED support,
and the wireless subsystem is enabled.

Missing SPI controllers are described on MSM8953. On MSM8996 the MPM is
enabled, to allow using wakeup interrupts. Interconnect providers, MPM
and display are added to QCM2290.

UFS, remoteprocs and WiFi is enabled for Fairphone FP5.
On Fairphone FP3 audio, WiFi and Bluetooth are enabled.

On the Robotics RB1, HDMI and the CAN bus controller are added. On
Robotics RB2 Bluetooth, the modem remoteproc and WiFi are enabled.
Bluetooth is enabled on the Robotics RB5.

On SA8775P tsens and thermal is added, as well as the random number
generator.

Sound and RTC support is added for the Acer Aspire 1.

On SC7280 DeviceTree is refactored, in order to allow non-Chrome devices
to inherit the base dtsi. Support for UFS, crypto, TrustZone based
remoteprocs, the Camera Control Interface (CCI) and random number
generator support are added. Additionally a variety of smaller fixes are
introduced.

A variety of fixes are introduced for SC8180X, in particular missing
power-domains and interconnects.

On SC8280XP the camera clock controller is added, and a number of
smaller fixes are introduced.

The display subsystem in SDM670 is described.

On SDX75 interconnect providers are added, as is USB3 and the related
PHY, which is then enabled on the IDP device.

On SM6115 interconnect providers are added and existing clients are
wired up. A UART controller is added as well.

The MPM is added, to provide wakeup interrutps, on SM6375. The modem
subsystem, and WiFi are enabled on Sony Xperia 10 IV, a few regulator
supplies are corrected.

On SM8150 the DisplayPort controller is added, for USB Type-C output,
which together with the addition of HDMI is described on the HDK board.

GPU and random number generator support are added to SM8450, and enabled
on the HDK board.

On SM8550 GPU, IPA, random number generator, missing SoundWire ports are
added, and enabled on both MTP and QRD devices.

Additionally a large number of smaller functional and DeviceTree binding
validation issues are corrected across a variety of platforms.

----------------------------------------------------------------
Abel Vesa (2):
      arm64: dts: qcom: x1e80100: Add Compute Reference Device
      arm64: dts: qcom: x1e80100-crd: Fix supplies for some LDOs in PM8550

Ajit Pandey (1):
      arm64: dts: qcom: sm4450: Add apps_rsc and cmd_db node

Alex Elder (2):
      arm64: dts: qcom: sm8550: add IPA information
      arm64: dts: qcom: sm8550-qrd: enable IPA

André Apitzsch (4):
      arm64: dts: qcom: msm8916-longcheer-l8910: Enable RGB LED
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable RGB LED
      arm64: dts: qcom: msm8939-longcheer-l9100: Add proximity-near-level
      dt-bindings: arm: qcom: Add Motorola Moto G 4G (2013)

Anusha Rao (2):
      arm64: dts: qcom: ipq9574: Add common RDP dtsi file
      arm64: dts: qcom: ipq9574: Enable WPS buttons

Bartosz Golaszewski (1):
      arm64: dts: qcom: qrb5165-rb5: add the Bluetooth node

Bjorn Andersson (8):
      Merge tag 'qcom-arm64-for-6.7-2' into arm64-for-6.8
      arm64: dts: qcom: sc8180x-primus: Fix HALL_INT polarity
      Merge branch '20231026105345.3376-3-bryan.odonoghue@linaro.org' into arm64-for-6.8
      Merge branch '20231106-topic-sm8650-upstream-clocks-v3-5-761a6fadb4c0@linaro.org' into arm64-for-6.8
      Merge branch 'icc-sm8650' of https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc into arm64-for-6.8
      Merge branch '20231205061002.30759-4-quic_sibis@quicinc.com' into arm64-for-6.8
      Merge branch 'icc-x1e80100' of https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc into arm64-for-6.8
      Merge branch 'icc-sm6115' of https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc into HEAD

Bryan O'Donoghue (4):
      dt-bindings: clock: Use gcc.yaml for common clock properties
      dt-bindings: clock: Add SC8280XP CAMCC
      arm64: dts: qcom: sc8280xp: Add in CAMCC for sc8280xp
      arm64: dts: qcom: sm8250: Add wakeup-source to usb_1 and usb_2

Caleb Connolly (3):
      arm64: dts: qcom: qrb4210-rb2: don't force usb peripheral mode
      arm64: dts: qcom: sdm845-oneplus: enable flash LED
      arm64: dts: qcom: qrb2210-rb1: use USB host mode

Chukun Pan (2):
      arm64: dts: qcom: ipq6018: Add remaining QUP UART node
      arm64: dts: qcom: ipq6018: Add QUP5 SPI node

Dmitry Baryshkov (26):
      arm64: dts: qcom: sm8150: extend the size of the PDC resource
      arm64: dts: qcom: ipq6018: switch USB QMP PHY to new style of bindings
      arm64: dts: qcom: ipq8074: switch USB QMP PHY to new style of bindings
      arm64: dts: qcom: msm8996: switch USB QMP PHY to new style of bindings
      arm64: dts: qcom: msm8998: switch USB QMP PHY to new style of bindings
      arm64: dts: qcom: sdm845: switch USB QMP PHY to new style of bindings
      arm64: dts: qcom: sm8150: switch USB QMP PHY to new style of bindings
      arm64: dts: qcom: sm8250: switch USB QMP PHY to new style of bindings
      arm64: dts: qcom: sm8350: switch USB QMP PHY to new style of bindings
      arm64: dts: qcom: qrb2210-rb1: add wifi variant property
      arm64: dts: qcom: msm8996: switch UFS QMP PHY to new style of bindings
      arm64: dts: qcom: msm8998: switch UFS QMP PHY to new style of bindings
      arm64: dts: qcom: sdm845: switch UFS QMP PHY to new style of bindings
      arm64: dts: qcom: sm6115: switch UFS QMP PHY to new style of bindings
      arm64: dts: qcom: sm6350: switch UFS QMP PHY to new style of bindings
      arm64: dts: qcom: sm8150: switch UFS QMP PHY to new style of bindings
      arm64: dts: qcom: sm8250: switch UFS QMP PHY to new style of bindings
      arm64: dts: qcom: sm8350: switch UFS QMP PHY to new style of bindings
      arm64: dts: qcom: sm8450: switch UFS QMP PHY to new style of bindings
      arm64: dts: qcom: sm8150: make dispcc cast minimal vote on MMCX
      arm64: dts: qcom: sm8150-hdk: enable HDMI output
      arm64: dts: qcom: sm8150-hdk: fix SS USB regulators
      arm64: dts: qcom: sm8150: add DisplayPort controller
      arm64: dts: qcom: sm8150: add USB-C ports to the USB+DP QMP PHY
      arm64: dts: qcom: sm8150: add USB-C ports to the OTG USB host
      arm64: dts: qcom: sm8150-hdk: enable DisplayPort and USB-C altmode

Douglas Anderson (9):
      arm64: dts: qcom: sc7180: Make watchdog bark interrupt edge triggered
      arm64: dts: qcom: sc7280: Make watchdog bark interrupt edge triggered
      arm64: dts: qcom: sdm845: Make watchdog bark interrupt edge triggered
      arm64: dts: qcom: sm8150: Make watchdog bark interrupt edge triggered
      arm64: dts: qcom: sm8250: Make watchdog bark interrupt edge triggered
      arm64: dts: qcom: sa8775p: Make watchdog bark interrupt edge triggered
      arm64: dts: qcom: sc8280xp: Make watchdog bark interrupt edge triggered
      arm64: dts: qcom: sm6350: Make watchdog bark interrupt edge triggered
      arm64: dts: qcom: sc7180: Switch pompom to the generic edp-panel

Fenglin Wu (2):
      arm64: dts: qcom: sm8550-mtp: Add pm8010 regulators
      arm64: dts: qcom: sm8550-qrd: add PM8010 regulators

Gianluca Boiano (1):
      arm64: dts: qcom: msm8953: add SPI interfaces

Gokul Sriram Palanisamy (1):
      arm64: dts: qcom: ipq5018: enable the CPUFreq support

Imran Shaik (1):
      arm64: dts: qcom: qdu1000: Add ECPRI clock controller

J.R. Divya Antony (1):
      arm64: dts: qcom: msm8916-asus-z00l: Add sound and modem

Jasper Korten (1):
      arm64: dts: qcom: msm8916-samsung-gt5: Add sound and modem

Jianhua Lu (2):
      arm64: dts: qcom: sm8250-xiaomi-elish: Fix typos
      arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8150b type-c node and enable usb otg

Joel Selvaraj (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: enable flash led

Johan Hovold (17):
      arm64: dts: qcom: sc8280xp-x13s: add missing camera LED pin config
      arm64: dts: qcom: sc8280xp-crd: fix eDP phy compatible
      arm64: dts: qcom: sa8775p: fix USB wakeup interrupt types
      arm64: dts: qcom: sc7180: fix USB wakeup interrupt types
      arm64: dts: qcom: sc7280: fix usb_1 wakeup interrupt types
      arm64: dts: qcom: sc7280: fix usb_2 wakeup interrupt types
      arm64: dts: qcom: sc8180x: fix USB wakeup interrupt types
      arm64: dts: qcom: sdm670: fix USB wakeup interrupt types
      arm64: dts: qcom: sdm845: fix USB wakeup interrupt types
      arm64: dts: qcom: sm6375: fix USB wakeup interrupt types
      arm64: dts: qcom: sm8150: fix USB wakeup interrupt types
      arm64: dts: qcom: sm8550: fix USB wakeup interrupt types
      arm64: dts: qcom: sc8180x: fix USB DP/DM HS PHY interrupts
      arm64: dts: qcom: sdm845: fix USB DP/DM HS PHY interrupts
      arm64: dts: qcom: sdm845: fix USB SS wakeup
      arm64: dts: qcom: sm8150: fix USB DP/DM HS PHY interrupts
      arm64: dts: qcom: sm8150: fix USB SS wakeup

Jonathan Albrieux (1):
      arm64: dts: qcom: msm8916-longcheer-l8910: Add sound and modem

Kathiravan Thirumoorthy (7):
      arm64: dts: qcom: ipq8074: include the GPLL0 as clock provider for mailbox
      arm64: dts: qcom: ipq6018: include the GPLL0 as clock provider for mailbox
      arm64: dts: qcom: ipq9574: include the GPLL0 as clock provider for mailbox
      arm64: dts: qcom: ipq5332: include the GPLL0 as clock provider for mailbox
      arm64: dts: qcom: ipq9574: enable GPIO based LED
      arm64: dts: qcom: ipq5332: add missing properties to the GPIO LED node
      arm64: dts: qcom: ipq5018: add few more reserved memory regions

Komal Bajaj (3):
      dt-bindings: arm: qcom: Add QCM6490 IDP and QCS6490 RB3Gen2 board
      arm64: dts: qcom: Add base qcm6490 idp board dts
      arm64: dts: qcom: Add base qcs6490-rb3gen2 board dts

Konrad Dybcio (34):
      arm64: dts: qcom: sm6375: Add UART1
      arm64: dts: qcom: sm6375-pdx225: Enable MSS
      arm64: dts: qcom: sm6375-pdx225: Enable ATH10K WiFi
      arm64: dts: qcom: sm6375-pdx225: Add USBPHY regulators
      arm64: dts: qcom: sc8280xp-x13s: Use the correct DP PHY compatible
      arm64: dts: qcom: sm6115: Add UART3
      arm64: dts: qcom: qrb4210-rb2: Enable bluetooth
      arm64: dts: qcom: sc8280xp: Add QMP handle to RPMh stats
      arm64: dts: qcom: sc7180: Add the missing MDSS icc path
      arm64: dts: qcom: sc7280: Add the missing MDSS icc path
      arm64: dts: qcom: qcm2290: Add display nodes
      arm64: dts: qcom: qcm2290: Hook up interconnects
      arm64: dts: qcom: qrb2210-rb1: Set up HDMI
      arm64: dts: qcom: qrb2210-rb1: Enable CAN bus controller
      dt-bindings: interconnect: Add Qualcomm SM6115 NoC
      arm64: dts: qcom: sc7280: Add ZAP shader support
      arm64: dts: qcom: sc7280: Fix up GPU SIDs
      arm64: dts: qcom: sc7280: Mark Adreno SMMU as DMA coherent
      arm64: dts: qcom: sc7280: Add 0xac Adreno speed bin
      arm64: dts: qcom: qrb4210-rb2: Enable MPSS and Wi-Fi
      arm64: dts: qcom: sm8450: Add GPU nodes
      arm64: dts: qcom: sm8550: Add GPU nodes
      arm64: dts: qcom: sm8550-qrd: Enable the A740 GPU
      arm64: dts: qcom: sm8550-mtp: Enable the A740 GPU
      arm64: dts: qcom: sm8450-hdk: Enable the A730 GPU
      arm64: dts: qcom: sm6115: Hook up interconnects
      arm64: dts: qcom: sm6375: Hook up MPM
      arm64: dts: qcom: msm8996: Hook up MPM
      arm64: dts: qcom: qcm2290: Hook up MPM
      arm64: dts: qcom: sc8180x: Add UFS GDSC
      arm64: dts: qcom: sc8180x: Add missing MDP clocks
      arm64: dts: qcom: sc8180x: Add interconnects to UFS
      arm64: dts: qcom: sc8180x: Describe the GIC redistributor
      arm64: dts: qcom: sc8180x-primus: Allow UFS regulators load/mode setting

Krzysztof Kozlowski (36):
      arm64: dts: qcom: sdm845: Add OPP table support to UFSHC
      arm64: dts: qcom: sm8450: correct TX Soundwire clock
      arm64: dts: qcom: sm8550: correct TX Soundwire clock
      arm64: dts: qcom: sc8180x: drop duplicated PCI iommus property
      arm64: dts: qcom: qdu1000: correct LLCC reg entries
      arm64: dts: qcom: qdu1000-idp: drop unused LLCC multi-ch-bit-off
      arm64: dts: qcom: sc8280xp: correct Soundwire node name
      arm64: dts: qcom: sm8250: correct Soundwire node name
      arm64: dts: qcom: sc8180x-primus: drop sound-dai-cells from eDisplayPort
      arm64: dts: qcom: sc8280xp-x13s: drop sound-dai-cells from eDisplayPort
      arm64: dts: qcom: sm8350: move DPU opp-table to its node
      arm64: dts: qcom: qrb5165-rb5: correct LED panic indicator
      arm64: dts: qcom: sdm845-db845c: correct LED panic indicator
      arm64: dts: qcom: sdm845: correct Soundwire node name
      arm64: dts: qcom: sc8180x-flex-5g: use 'gpios' suffix for PCI GPIOs
      arm64: dts: qcom: sc8180x-primus: use 'gpios' suffix for PCI GPIOs
      arm64: dts: qcom: sm8150: use 'gpios' suffix for PCI GPIOs
      arm64: dts: qcom: sm6115: align mem timer size cells with bindings
      arm64: dts: qcom: sm6125: add interrupts to DWC3 USB controller
      arm64: dts: qcom: sm6375-pdx225: add fixed touchscreen AVDD regulator
      arm64: dts: qcom: sc8180x: align APSS with bindings
      dt-bindings: arm: qcom-soc: extend pattern for matching existing SoCs
      arm64: dts: qcom: minor whitespace cleanup around '='
      arm64: dts: qcom: sm8650: add ADSP GPR
      arm64: dts: qcom: sm8650: add LPASS LPI pin controller
      arm64: dts: qcom: sm8650: add ADSP audio codec macros
      arm64: dts: qcom: sm8650: add Soundwire controllers
      arm64: dts: qcom: sm8650-mtp: add WSA8845 speakers
      arm64: dts: qcom: pm8550: drop PWM address/size cells
      arm64: dts: qcom: ipq8074: add dedicated SDHCI compatible
      arm64: dts: qcom: sm8650: drop unneeded assigned-clocks from WSA macro
      arm64: dts: qcom: sm8550: add missing two RX Soundwire ports in configuration
      arm64: dts: qcom: sm8450: move Soundwire pinctrl to its nodes
      arm64: dts: qcom: sm8450: drop unneeded assigned-clocks from codec macros
      arm64: dts: qcom: sm8550: move Soundwire pinctrl to its nodes
      arm64: dts: qcom: sm8550: drop unneeded assigned-clocks from codec macros

Lin, Meng-Bo (2):
      arm64: dts: qcom: msm8916-samsung-j5: Add sound and modem
      arm64: dts: qcom: msm8939-samsung-a7: Add sound and modem

Luca Weiss (23):
      arm64: dts: qcom: sc7280: Add ports subnodes in usb/dp qmpphy node
      arm64: dts: qcom: sc7280: Add Camera Control Interface busses
      arm64: dts: qcom: pm7250b: Use correct node name for gpios
      iio: adc: Add PM7325 PMIC7 ADC bindings
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PM7250B thermals
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PMK7325 thermals
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add PM7325 thermals
      arm64: dts: qcom: sdm632-fairphone-fp3: Enable WiFi/Bluetooth
      arm64: dts: qcom: msm8953: Use non-deprecated qcom,domain in LPASS
      arm64: dts: qcom: sdm632-fairphone-fp3: Enable LPASS
      dt-bindings: vendor-prefixes: document HTC Corporation
      dt-bindings: arm: qcom: Add HTC One Mini 2
      arm64: dts: qcom: msm8953: Set initial address for memory
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable UFS
      arm64: dts: qcom: sc7280: Use WPSS PAS instead of PIL
      arm64: dts: qcom: sc7280: Add ADSP node
      arm64: dts: qcom: sc7280: Add CDSP node
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable various remoteprocs
      arm64: dts: qcom: qcm6490-fairphone-fp5: Enable WiFi
      dt-bindings: arm: qcom: Fix up htc-memul compatible
      arm64: dts: qcom: sc7280: Remove unused second MPSS reg
      arm64: dts: qcom: sc7280: Rename reserved-memory nodes
      arm64: dts: qcom: sc7280*: move MPSS and WPSS memory to dtsi

Luka Panio (2):
      dt-bindings: arm: qcom: Add Xiaomi Pad 6 (xiaomi-pipa)
      arm64: dts: qcom: sm8250-xiaomi-pipa: Add initial device tree

Lukas Walter (2):
      dt-bindings: arm: qcom: Add Huawei Honor 5X / GR5 (2016)
      arm64: dts: qcom: msm8939-huawei-kiwi: Add initial device tree

Manivannan Sadhasivam (3):
      arm64: dts: qcom: sm8250: Add OPP table support to UFSHC
      arm64: dts: qcom: Use "pcie" as the node name instead of "pci"
      arm64: dts: qcom: sa8775p: Add missing space between node name and braces

Mao Jinlong (3):
      arm64: dts: qcom: msm8996: Fix 'in-ports' is a required property
      arm64: dts: qcom: msm8998: Fix 'out-ports' is a required property
      arm64: dts: qcom: Fix coresight warnings in in-ports and out-ports

Mukesh Ojha (3):
      arm64: dts: qcom: sm8250: Add TCSR halt register space
      arm64: dts: qcom: sm8350: Add TCSR halt register space
      arm64: dts: qcom: sm8550: Enable download mode register write

Neil Armstrong (22):
      arm64: dts: qcom: sm8550: add TRNG node
      arm64: dts: qcom: sm8450: add TRNG node
      dt-bindings: interconnect: document the RPMh Network-On-Chip Interconnect in Qualcomm SM8650 SoC
      dt-bindings: clock: qcom: document the SM8650 TCSR Clock Controller
      dt-bindings: clock: qcom: document the SM8650 General Clock Controller
      dt-bindings: clock: qcom: document the SM8650 Display Clock Controller
      dt-bindings: clock: qcom: document the SM8650 GPU Clock Controller
      dt-bindings: clock: qcom: Document the SM8650 RPMH Clock Controller
      arm64: dts: qcom: sm8550: fix soundwire controllers node name
      arm64: dts: qcom: sm8450: fix soundwire controllers node name
      dt-bindings: arm: qcom: document SM8650 and the reference boards
      arm64: dts: qcom: add initial SM8650 dtsi
      arm64: dts: qcom: pm8550ve: make PMK8550VE SID configurable
      arm64: dts: qcom: sm8650: add initial SM8650 MTP dts
      arm64: dts: qcom: sm8650: add initial SM8650 QRD dts
      arm64: dts: qcom: sm8650: add interconnect dependent device nodes
      arm64: dts: qcom: sm8650-mtp: add interconnect dependent device nodes
      arm64: dts: qcom: sm8650-qrd: add interconnect dependent device nodes
      arm64: dts: qcom: sm8650: add IPA information
      arm64: dts: qcom: sm8650-qrd: enable IPA
      arm64: dts: qcom: sm8650: Add DisplayPort device nodes
      arm64: dts: qcom: sm8650: add fastrpc-compute-cb nodes

Nia Espera (4):
      dt-bindings: iio: adc: qcom: Add Qualcomm smb139x
      arm64: dts: qcom: sm8350: Fix DMA0 address
      arm64: dts: qcom: pm8350k: Remove hanging whitespace
      arm64: dts: qcom: sm8350: Fix remoteproc interrupt type

Nikita Travkin (6):
      arm64: dts: qcom: msm8916-longcheer-l8150: Add sound and modem
      arm64: dts: qcom: pm8916: Add BMS and charger
      arm64: dts: qcom: msm8916-longcheer-l8150: Add battery and charger
      arm64: dts: qcom: acer-aspire1: Enable RTC
      arm64: dts: qcom: acer-aspire1: Correct audio codec definition
      arm64: dts: qcom: acer-aspire1: Add sound

Nitheesh Sekar (2):
      arm64: dts: qcom: ipq5018: Add USB related nodes
      arm64: dts: qcom: ipq5018: Enable USB

Nitin Rawat (2):
      arm64: dts: qcom: sc7280: Add UFS nodes for sc7280 soc
      arm64: dts: qcom: sc7280: Add UFS nodes for sc7280 IDP board

Om Prakash Singh (3):
      arm64: dts: qcom: sa8775p: add TRNG node
      arm64: dts: qcom: sc7280: add TRNG node
      arm64: dts: qcom: sc7280: add QCrypto nodes

Priyansh Jain (1):
      arm64: dts: qcom: Enable tsens and thermal for sa8775p SoC

Raghavendra Kakarla (1):
      arm64: dts: qcom: sa8775p: Add RPMh sleep stats

Rajendra Nayak (6):
      dt-bindings: interconnect: Add Qualcomm X1E80100 SoC
      dt-bindings: clock: qcom: Add X1E80100 GCC clocks
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for X1E80100
      dt-bindings: arm: cpus: Add qcom,oryon compatible
      dt-bindings: arm: qcom: Document X1E80100 SoC and boards
      arm64: dts: qcom: Add base X1E80100 dtsi and the QCP dts

Raymond Hackley (1):
      arm64: dts: qcom: msm8916-acer-a1-724: Add notification LED

Rayyan Ansari (1):
      dt-bindings: arm: qcom: Document MSM8x26-based Lumia phones

Richard Acayan (2):
      arm64: dts: qcom: sdm670: add specific cpufreq compatible
      arm64: dts: qcom: sdm670: add display subsystem

Robert Marko (5):
      arm64: dts: qcom: ipq5018: add QUP1 SPI controller
      dt-bindings: clocks: qcom,gcc-ipq8074: allow QMP PCI PHY PIPE clocks
      arm64: dts: qcom: ipq8074: pass QMP PCI PHY PIPE clocks to GCC
      arm64: dts: qcom: ipq6018: use CPUFreq NVMEM
      arm64: dts: qcom: ipq8074: Add QUP4 SPI node

Rohit Agarwal (3):
      arm64: dts: qcom: Add interconnect nodes for SDX75
      arm64: dts: qcom: Add USB3 and PHY support on SDX75
      arm64: dts: qcom: sdx75-idp: Enable USB3 and PHY support

Shazad Hussain (1):
      arm64: dts: qcom: sa8775p-ride: enable pmm8654au_0_pon_resin

Sibi Sankar (1):
      dt-bindings: arm: qcom-soc: extend pattern matching for X1E80100 SoC

Sridharan S N (1):
      dt-bindings: arm: qcom: drop the IPQ board types

Steev Klimaszewski (1):
      arm64: dts: qcom: sdm850-lenovo-yoga: Add wakeup-sources

Stephan Gerhold (13):
      arm64: dts: qcom: msm8916-samsung-gt5: Enable GPU
      arm64: dts: qcom: msm8939-longcheer-l9100: Enable wcnss_mem
      arm64: dts: qcom: msm8916-*: Fix alphabetic node order
      arm64: dts: qcom: msm8916: Add QDSP6
      arm64: dts: qcom: msm8939: Add QDSP6
      arm64: dts: qcom: msm8916: Add common msm8916-modem-qdsp6.dtsi
      arm64: dts: qcom: msm8916-samsung-a2015: Add sound and modem
      arm64: dts: qcom: msm8916-samsung-serranove: Add sound and modem
      arm64: dts: qcom: msm8916-wingtech-wt88047: Add sound and modem
      arm64: dts: qcom: Add missing vio-supply for AW2013
      arm64: dts: qcom: msm8939: Add clock-frequency for broadcast timer
      arm64: dts: qcom: msm8916: Make blsp_dma controlled-remotely
      arm64: dts: qcom: msm8939: Make blsp_dma controlled-remotely

Stephen Boyd (1):
      dt-bindings: arm: qcom: Fix html link

Tengfei Fan (4):
      arm64: dts: qcom: sm4450: Add RPMH and Global clock
      arm64: dts: qcom: sm4450: add uart console support
      arm64: dts: qcom: sm4450-qrd: add QRD4450 uart support
      arm64: dts: qcom: sm4450-qrd: mark QRD4450 reserved gpios

Varadarajan Narayanan (2):
      arm64: dts: qcom: ipq5332: populate the opp table based on the eFuse
      arm64: dts: qcom: ipq9574: populate the opp table based on the eFuse

Vincent Knecht (2):
      arm64: dts: qcom: msm8939: Add BAM-DMUX WWAN
      arm64: dts: qcom: msm8916-alcatel-idol347: Add sound and modem

 Documentation/devicetree/bindings/arm/cpus.yaml    |    1 +
 .../devicetree/bindings/arm/qcom-soc.yaml          |   16 +-
 Documentation/devicetree/bindings/arm/qcom.yaml    |   47 +-
 .../bindings/clock/qcom,camcc-sm8250.yaml          |   18 +-
 .../bindings/clock/qcom,gcc-ipq8074.yaml           |    4 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    2 +
 .../bindings/clock/qcom,sc7180-camcc.yaml          |   18 +-
 .../bindings/clock/qcom,sc7280-camcc.yaml          |   18 +-
 .../bindings/clock/qcom,sdm845-camcc.yaml          |   18 +-
 .../bindings/clock/qcom,sm8450-camcc.yaml          |   20 +-
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |    2 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    8 +-
 .../bindings/clock/qcom,sm8650-dispcc.yaml         |  106 +
 .../devicetree/bindings/clock/qcom,sm8650-gcc.yaml |   65 +
 .../bindings/clock/qcom,x1e80100-gcc.yaml          |   72 +
 .../bindings/interconnect/qcom,sm6115.yaml         |  152 +
 .../bindings/interconnect/qcom,sm8650-rpmh.yaml    |  136 +
 .../bindings/interconnect/qcom,x1e80100-rpmh.yaml  |   83 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/qcom/Makefile                  |    8 +
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts     |   12 +
 arch/arm64/boot/dts/qcom/ipq5018.dtsi              |  142 +
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi   |    3 +
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dts        |    2 +-
 arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts        |    2 +-
 arch/arm64/boot/dts/qcom/ipq5332-rdp474.dts        |    2 +-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |   23 +-
 arch/arm64/boot/dts/qcom/ipq6018.dtsi              |  119 +-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  110 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |  169 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp418.dts        |   63 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts        |   91 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp449.dts        |   65 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp453.dts        |   65 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts        |   66 +-
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   25 +-
 arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dts   |   24 +
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts      |  173 +-
 arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dts     |   21 +
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts      |   75 +-
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts      |  103 +
 arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi  |  148 +
 .../dts/qcom/msm8916-samsung-a2015-common.dtsi     |   71 +
 .../boot/dts/qcom/msm8916-samsung-a3u-eur.dts      |   10 +-
 .../dts/qcom/msm8916-samsung-e2015-common.dtsi     |    4 +
 .../boot/dts/qcom/msm8916-samsung-grandmax.dts     |    4 +
 .../boot/dts/qcom/msm8916-samsung-gt5-common.dtsi  |   92 +-
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts |   26 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts  |   46 +
 .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   |   14 +
 arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    |    4 +
 .../boot/dts/qcom/msm8916-samsung-serranove.dts    |   13 +
 arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dts    |    8 +-
 arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dts  |    8 +-
 .../boot/dts/qcom/msm8916-wingtech-wt88047.dts     |   75 +
 .../arm64/boot/dts/qcom/msm8916-yiming-uz801v3.dts |    8 +-
 arch/arm64/boot/dts/qcom/msm8916.dtsi              |   50 +
 arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts   |  242 +
 .../boot/dts/qcom/msm8939-longcheer-l9100.dts      |   56 +
 arch/arm64/boot/dts/qcom/msm8939-samsung-a7.dts    |   70 +
 arch/arm64/boot/dts/qcom/msm8939.dtsi              |   82 +
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-mido.dts   |    1 +
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts |    1 +
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts  |    1 +
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  110 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  125 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |   87 +-
 arch/arm64/boot/dts/qcom/pm7250b.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/pm8550.dtsi               |    3 -
 arch/arm64/boot/dts/qcom/pm8550ve.dtsi             |    6 +-
 arch/arm64/boot/dts/qcom/pm8916.dtsi               |   48 +
 arch/arm64/boot/dts/qcom/pmk8350.dtsi              |    2 +-
 arch/arm64/boot/dts/qcom/qcm2290.dtsi              |  504 +-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  288 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  468 ++
 arch/arm64/boot/dts/qcom/qcs404.dtsi               |    2 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |  455 ++
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |   23 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  113 +
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  112 +-
 .../boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dts |    2 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   31 +-
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts          |    5 +
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 1124 +++-
 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts   |  174 +-
 .../arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi |    2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   14 +-
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   37 +-
 .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi    |    7 +-
 .../boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi   |    1 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi           |   19 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  579 +-
 .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts |    4 +-
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts        |   12 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   51 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |    2 +
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   12 +
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   24 +-
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts  |   19 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |  298 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |    4 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   23 +
 arch/arm64/boot/dts/qcom/sdm845-wcd9340.dtsi       |    2 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |   22 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  127 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |    8 +-
 arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts   |    2 +-
 arch/arm64/boot/dts/qcom/sdx75-idp.dts             |   29 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |  170 +
 arch/arm64/boot/dts/qcom/sm4450-qrd.dts            |   18 +-
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |  107 +
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |  342 +-
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |    4 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   20 +-
 .../dts/qcom/sm6375-sony-xperia-murray-pdx225.dts  |   43 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |   84 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |  264 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  223 +-
 .../boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi  |   47 +-
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts    |  623 ++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  143 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  147 +-
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |    8 +
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  285 +-
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |  129 +
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |  136 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  285 +-
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |  727 +++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |  811 +++
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 6013 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100-crd.dts          |  424 ++
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |  401 ++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 3527 ++++++++++++
 include/dt-bindings/clock/qcom,sc8280xp-camcc.h    |  179 +
 include/dt-bindings/clock/qcom,sm8650-dispcc.h     |  102 +
 include/dt-bindings/clock/qcom,sm8650-gcc.h        |  254 +
 include/dt-bindings/clock/qcom,sm8650-gpucc.h      |   43 +
 include/dt-bindings/clock/qcom,sm8650-tcsr.h       |   18 +
 include/dt-bindings/clock/qcom,x1e80100-gcc.h      |  485 ++
 include/dt-bindings/iio/qcom,spmi-adc7-pm7325.h    |   69 +
 include/dt-bindings/iio/qcom,spmi-adc7-smb139x.h   |   19 +
 include/dt-bindings/iio/qcom,spmi-vadc.h           |    3 +
 include/dt-bindings/interconnect/qcom,sm6115.h     |  111 +
 .../dt-bindings/interconnect/qcom,sm8650-rpmh.h    |  154 +
 .../dt-bindings/interconnect/qcom,x1e80100-rpmh.h  |  207 +
 include/dt-bindings/reset/qcom,sm8650-gpucc.h      |   20 +
 146 files changed, 23560 insertions(+), 1252 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8650-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,x1e80100-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sm6115.yaml
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,sm8650-rpmh.yaml
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,x1e80100-rpmh.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-modem-qdsp6.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8939-huawei-kiwi.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcm6490-idp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-qrd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100.dtsi
 create mode 100644 include/dt-bindings/clock/qcom,sc8280xp-camcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8650-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8650-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8650-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8650-tcsr.h
 create mode 100644 include/dt-bindings/clock/qcom,x1e80100-gcc.h
 create mode 100644 include/dt-bindings/iio/qcom,spmi-adc7-pm7325.h
 create mode 100644 include/dt-bindings/iio/qcom,spmi-adc7-smb139x.h
 create mode 100644 include/dt-bindings/interconnect/qcom,sm6115.h
 create mode 100644 include/dt-bindings/interconnect/qcom,sm8650-rpmh.h
 create mode 100644 include/dt-bindings/interconnect/qcom,x1e80100-rpmh.h
 create mode 100644 include/dt-bindings/reset/qcom,sm8650-gpucc.h

