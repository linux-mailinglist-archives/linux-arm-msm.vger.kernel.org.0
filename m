Return-Path: <linux-arm-msm+bounces-101362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GE4KA6gtzWn7aQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 16:37:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 299CC37C3DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 16:37:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94B4A3051AB0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 14:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290172BDC28;
	Wed,  1 Apr 2026 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uZn7hYwA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051BA2F4A15
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775053371; cv=none; b=Sp5OcXWhpPUtR5UScrp7jM32/NLGehRDGFGO+k3UsxOXxjMFFDgbGpnKuFbUSqiVCh6tGQ8vVFD2BqOmRot9U4r7G1sZeCbSxvCQVvUl83SxUipKnS17HDCx44IEi+NlcIhUMpQaSDzoXGp1QrErCvcKdUrntIv5TUVJyXEKORI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775053371; c=relaxed/simple;
	bh=OjWL31a7Ws3PBigmmXJGL+MXeuzU3nBweEbV/8+GDKo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=st7OrShoJccSN3//UiJLSQyMTFWQgLG0OuHUQLjyM0R3uk2qrxD4XzZ5iU/jG+DeecuEV+mja9/BmmrwTtRedDDOHAfgQIey9NJXc4aAG4UUav2ABiMIMhAtGKG/x2IV9d/wFklFJjlVULRlVqIVrCiZySZXH68MjbkGC63Sn8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uZn7hYwA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D381C4CEF7;
	Wed,  1 Apr 2026 14:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775053370;
	bh=OjWL31a7Ws3PBigmmXJGL+MXeuzU3nBweEbV/8+GDKo=;
	h=From:To:Cc:Subject:Date:From;
	b=uZn7hYwANmzuzeUZhnuA+EcwCwsZ/+YmKtmlgbXaNDFVY5EqhHP4unw1LmrSHybjX
	 NkwBmwP4wg3yReJ42bVwkHCgvjdq0Xryj4aV4OCHbpd3bG1sJMhUIgYSJ08blkaatJ
	 FpYjxeVQj8K2MeV9/+1kcYl4jfvxRWA5XtB9FDqf7WCtYeIXuVnvtMWldHDUCoOA7j
	 Ewm2ed4++7S1iLQ8niiXLlsGDDhK8mXy5fLZMVF2b43Z0UdBoqxNgcvvvGbG5fANF5
	 YutmvMYKien7Ce1ixMwJCb48qx2Yec+6ku7Uw6sRjiS8xJTAQuYxcRtCW75jTSEFWZ
	 jywdt//lTcAsQ==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
	Val Packett <val@packett.cool>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Biswapriyo Nath <nathbappai@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	Md Sadre Alam <quic_mdalam@quicinc.com>,
	Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
	Yijie Yang <yijie.yang@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Paul Adam <adamp@posteo.de>,
	Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
	Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
	Roger Shimizu <rosh@debian.org>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Tobias Heider <tobias.heider@canonical.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Ayushi Makhija <quic_amakhija@quicinc.com>,
	Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>,
	Erikas Bitovtas <xerikasxx@gmail.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
	Petr Hodina <petr.hodina@protonmail.com>,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Raymond Hackley <raymondhackley@protonmail.com>,
	Sarthak Garg <sarthak.garg@oss.qualcomm.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
	Umang Chheda <umang.chheda@oss.qualcomm.com>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Xin Liu <xin.liu@oss.qualcomm.com>,
	Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
	Aaron Kling <webgeek1234@gmail.com>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	Alexander Koskovich <AKoskovich@pm.me>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Christopher Obbard <christopher.obbard@linaro.org>,
	Gabor Juhos <j4g8y7@gmail.com>,
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Gergo Koteles <soyer@irl.hu>,
	Gianluca Boiano <morf3089@gmail.com>,
	Hongyang Zhao <hongyang.zhao@thundersoft.com>,
	Janaki Ramaiah Thota <janaki.thota@oss.qualcomm.com>,
	Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
	KancyJoe <kancy2333@outlook.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Le Qi <le.qi@oss.qualcomm.com>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
	Manaf Meethalavalappu Pallikunhi <quic_manafm@quicinc.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Max McNamee <maxmcnamee@proton.me>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Riccardo Mereu <r.mereu@arduino.cc>,
	Richard Acayan <mailingradian@gmail.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
	Wei Deng <wei.deng@oss.qualcomm.com>,
	Wei Zhang <wei.zhang@oss.qualcomm.com>,
	Xueyao An <xueyao.an@oss.qualcomm.com>,
	Yedaya Katsman <yedaya.ka@gmail.com>,
	Zijun Hu <zijun.hu@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v7.1
Date: Wed,  1 Apr 2026 09:22:42 -0500
Message-ID: <20260401142242.1068620-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arndb.de,oss.qualcomm.com,mainlining.org,fairphone.com,packett.cool,linaro.org,gmail.com,ixit.cz,quicinc.com,oldschoolsolutions.biz,posteo.de,debian.org,canonical.com,kernel.org,protonmail.com,vinarskis.com,pm.me,glider.be,irl.hu,thundersoft.com,outlook.com,proton.me,arduino.cc];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101362-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[85];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 299CC37C3DE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.1

for you to fetch changes up to b683730e27ba4f91986c4c92f5cb7297f1e01a6d:

  arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP (2026-03-30 09:35:01 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree updates for v7.1

Introduce the Eliza, Glymur, Mahua, and IPQ5210 Qualcomm SoCs.

Introduce the Redmi 4A, Redmi Go, Arduino Monza (VENTUNO Q), Redmi Note
8T, Purwa EVK, ECS Liva QCS710, additional variants of the DB820c,
Ayaneo Pocket S2, Thundercomm AI Mini PC G1, Samsung Galaxy Core Prime
LTE Verizon Wireless, Wiko Pulp 4G, the Purwa-variant of ASUS Vivobook
S15, the Eliza MTP, and the Glymur and Mahua CRDs.

Introduce UFS support and flatten the DWC3 node on Hamoa. Enable UFS,
SDC, DisplayPort audio playback, and an EL2 overlay for the Hamoa IoT
EVK. Enable DisplayPort audio on the Hamoa CRD and add HDMI support on
the ASUS Zenbook A14. Reduce the duplication of thermal sensors across
Purwa and Hamoa.

Add the QPIC SPI NAND controller on IPQ5332 and IPQ9574. Describe and
enable the eMMC controller on IPQ9574.

Add display, audio/compute remoteprocs, QUP devices, thermal sensors,
display, and CoreSight on the Kaanapali platform. Enable audio, compute
display, PMIC, Bluetooth, and WiFi on the MTP. Describe PMIC, audio and
compute remoteprocs on QRD.

Add role-switching support for the tertiary USB controller on Lemans.
Enable the tertiary USB controller and the GPIO expander on the Lemans
EVK, and add an overlay for the IFP Mezzanine.

Add UFS, camera control interface, audio GPR, and FastRPC support on
Milos. Enable UFS, camera EEPROMs, and hall effect sensor on the
Fairphone FP6.

Add camera control interface and fix a variety of things on the Monaco
platform, add missing FastRPC compute banks. Add eMMC support, describe
the DisplayPort bridge and GPIO expander on the Monaco EVK. Add overlay
for EVK camera and the IFP mezzanine.

Add touchscreen to the Xiaomi Redmi 4A, 5A, and Go, and fix the board-id
on the 4A.

Add the ambient light and proximity sensor on the Asus ZenFone 2
Laser/Selfie.

On Kodiak-based boards, enable the ethernet and USB Type-A ports on the
Rb3Gen2, correct the LT9611 routing on the RubikPi3, add Bluetooth on
the IDP, and add front camera support on the Fairphone FP5.
Introduce an overlay for the Rb3Gen2 Industrial Mezzanine.

Describe DSI on the Monaco SoC and enable Bluetooth, WiFi and DSI/DP
bridge on the Ride board.

Describe the WiFi/BT combo chip properly on the QRB2210 RB1 and QRB4210.
The describe the DSI/DP bringde on the Arduino UnoQ.

01022af2d218 arm64: dts: qcom: sc7280-chrome-common: disable Venus

Introduce DSI display support on SC8280XP.

Add LLCC on SDM670 and another SPI controller on SDM630.

Properly describe the WiFi/BT chip on a variety of SDM845-based
devices. Introduce the "alert slider" on the OnePlus 6 and OnePlus 6T
devices.

Introduce the PRNG, describe the debug UART, and add the MDSS core reset
on SM6125. Enable the debug UART and fix various issues on the Xiaomi
Redmi Note 8. Describe the touchscreen on the Xiaomi Mi A3.

Properly describe the WiFi/BT combo chip in SM8150 HDK.

Improve the EAS properties on SM8550, in addition to various other
fixes. Introduce a new overlay for the HDK display card.

Introduce various smaller fixes across SM8450 and SM8650.

Add display support on SM8750 and enable DSI and DisplayPort on the MTP.
Also add tsens and thermal-zones.

Add ETR devices, flatten the USB controller node, and mark USB
controllers as wakeup-capable devices, on Talos.

Properly describe the IPA IMEM slice on a variety of platforms.

Drop redundant non-controllable regulator definitions from a variety of
boards.

Drop redundant VSYNC pin state definition from various platforms.

----------------------------------------------------------------
Aaron Kling (1):
      arm64: dts: qcom: sm8550: Add ACD levels for GPU

Abel Vesa (12):
      dt-bindings: interconnect: OSM L3: Add Eliza EPSS L3 compatible
      dt-bindings: arm: qcom: Document Eliza SoC and its MTP board
      arm64: dts: qcom: Introduce Eliza Soc base dtsi
      arm64: dts: qcom: eliza: Enable Eliza MTP board support
      arm64: dts: qcom: glymur: Describe display-related nodes
      arm64: dts: qcom: glymur-crd: Enable eDP display support
      arm64: dts: qcom: glymur-crd: Enable keyboard, trackpad and touchscreen
      arm64: dts: qcom: glymur-crd: Enable WLAN and Bluetooth
      arm64: dts: qcom: eliza: Coding style clean-ups
      arm64: dts: qcom: eliza: Add missing CX power domain to GCC
      arm64: dts: qcom: eliza: Add missing msi-parent for UFS
      arm64: dts: qcom: milos: Add missing CX power domain to GCC

Aleksandrs Vinarskis (1):
      arm64: dts: qcom: x1-asus-zenbook-a14: add HDMI port

Alexander Koskovich (1):
      arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP

Ayushi Makhija (2):
      arm64: dts: qcom: qcs8300: add Display Serial Interface device nodes
      arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to DP bridge node

Barnabás Czémán (16):
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove board-id
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct reserved memory ranges
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Set memory-region for framebuffer
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved gpio ranges
      dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8T
      arm64: dts: qcom: Add Redmi Note 8T
      arm64: dts: qcom: msm8953-xiaomi-vince: correct wled ovp value
      arm64: dts: qcom: msm8937-xiaomi-land: correct wled ovp value
      arm64: dts: qcom: msm8953-xiaomi-daisy: fix backlight
      arm64: dts: qcom: msm8917-xiaomi-riva: Fix board-id for all bootloader
      arm64: dts: qcom: Make a common base from Redmi 5A
      arm64: dts: qcom: msm8917-xiaomi-wingtech: Add goodix touch
      dt-bindings: arm: qcom: Add Redmi 4A and Go
      arm64: dts: qcom: Add Redmi 4A
      arm64: dts: qcom: Add Redmi Go

Bartosz Golaszewski (1):
      arm64: dts: qcom: remove msm8996-v3.0.dtsi

Biswapriyo Nath (5):
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix volume up button
      arm64: dts: qcom: sm6125: Add PRNG node
      arm64: dts: qcom: sm6125: Add debug UART node
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable debug UART
      arm64: dts: qcom: pm6125: Enable RTC by default

Bjorn Andersson (5):
      Merge branch '20260303034847.13870-2-val@packett.cool' into arm64-for-7.1
      Merge branch '20260311-eliza-clocks-v6-1-453c4cf657a2@oss.qualcomm.com' into HEAD
      Merge branch 'icc-eliza' of https://git.kernel.org/pub/scm/linux/kernel/git/djakov/icc into HEAD
      Merge branch '20260318-ipq5210_boot_to_shell-v2-1-a87e27c37070@oss.qualcomm.com' into HEAD
      arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201 and GL3590

Canfeng Zhuang (2):
      arm64: dts: qcom: lemans-evk: enable UART0 for robot expansion board
      arm64: dts: qcom: monaco-evk: enable UART6 for robot expansion board

Christopher Obbard (1):
      arm64: dts: qcom: msm8996: fix indentation in sdhc2 node

David Heidelberg (4):
      arm64: dts: qcom: sdm845: Introduce camera master clock pinctrl
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Mark l1a regulator as powered during boot
      arm64: dts: qcom: sdm845-google: Describe Wi-Fi/BT properly
      arm64: dts: qcom: sdm845-oneplus: Describe Wi-Fi/BT properly

Dmitry Baryshkov (18):
      dt-bindings: arm: qcom: add Dragonboard 820c using APQ8096SG SoC
      arm64: dts: qcom: add apq8096sg-db820c, AP8096SG variant of DB820c
      arm64: dts: qcom: correct RBR opp entry
      arm64: dts: qcom: qrb2210-arduino-imola: describe DSI / DP bridge
      arm64: dts: qcom: hamoa: correct Iris corners for the MXC rail
      arm64: dts: qcom: lemans: correct Iris corners for the MXC rail
      arm64: dts: qcom: monaco: correct Iris corners for the MXC rail
      arm64: dts: qcom: sm8550: correct Iris corners for the MXC rail
      arm64: dts: qcom: sm8650: correct Iris corners for the MXC rail
      arm64: dts: qcom: sm8750: correct Iris corners for the MXC rail
      arm64: dts: qcom: qrb2210-rb1: describe WiFi/BT properly
      arm64: dts: qcom: qrb4210-rb2: describe WiFi/BT properly
      arm64: dts: qcom: sda660-ifc6560: describe WiFi/BT properly
      arm64: dts: qcom: sdm845-db845c: describe WiFi/BT properly
      arm64: dts: qcom: sm8150-hdk: describe WiFi/BT properly
      arm64: dts: qcom: sc7280-chrome-common: disable Venus
      arm64: dts: qcom: purwa: deduplicate thermal sensors with Hamoa
      arm64: dts: qcom: patch mahua thermal zones by label

Erikas Bitovtas (2):
      arm64: dts: qcom: msm8939-asus-z00t: add ambient light and proximity sensor
      arm64: dts: qcom: msm8939-asus-z00t: add regulators for ambient light and proximity sensor

Gabor Juhos (1):
      arm64: dts: qcom: ipq9574: remove MP5496 regulator references from SoC dtsi

Gaurav Kohli (1):
      arm64: dts: qcom: hamoa-iot-evk: Update TSENS thermal zone configuration

Geert Uytterhoeven (1):
      arm64: dts: qcom: Drop CPU masks from GICv3 PPI interrupts

Gergo Koteles (1):
      arm64: dts: qcom: sdm845-oneplus: Add alert-slider

Gianluca Boiano (1):
      arm64: dts: qcom: sdm630: add SPI7 interface

Gopikrishna Garmidi (3):
      dt-bindings: arm: qcom: Document Mahua SoC and board
      arm64: dts: qcom: Commonize Glymur CRD DTSI
      arm64: dts: qcom: Add Mahua SoC and CRD

Hongyang Zhao (1):
      arm64: dts: qcom: qcs6490-rubikpi3: Use lt9611 DSI Port B

Janaki Ramaiah Thota (1):
      arm64: dts: qcom: qcm6490-idp: add and enable BT node

Jens Glathe (3):
      dt-bindings: arm: qcom: Add ASUS Vivobook X1P42100 variant
      arm64: dts: qcom: x1-vivobook-s15: create a common dtsi for Hamoa and Purwa variants
      arm64: dts: qcom: x1-vivobook-s15: add Purwa-compatible device tree

Jie Gan (2):
      arm64: dts: qcom: talos: add ETR device
      arm64: dts: qcom: kaanapali: add coresight nodes

Jingyi Wang (4):
      arm64: dts: qcom: kaanapali: Add ADSP and CDSP for Kaanapali SoC
      arm64: dts: qcom: kaanapali-mtp: Enable ADSP and CDSP
      arm64: dts: qcom: kaanapali-qrd: Enable ADSP and CDSP
      arm64: dts: qcom: kaanapali: Duplicate whitespace cleanup

Jishnu Prakash (3):
      arm64: dts: qcom: kaanapali: Add PMIC devices
      arm64: dts: qcom: kaanapali-mtp: Add PMIC support
      arm64: dts: qcom: kaanapali-qrd: Add PMIC support

Jyothi Kumar Seerapu (1):
      arm64: dts: qcom: kaanapali: Add QUPv3 configuration for serial engines

KancyJoe (1):
      arm64: dts: qcom: add basic devicetree for Ayaneo Pocket S2 gaming console

Kathiravan Thirumoorthy (3):
      dt-bindings: clock: add Qualcomm IPQ5210 GCC
      dt-bindings: qcom: add ipq5210 boards
      arm64: dts: qcom: add IPQ5210 SoC and rdp504 board support

Konrad Dybcio (14):
      arm64: dts: qcom: talos: Add missing clock-names to GCC
      arm64: dts: qcom: kaanapali: Fix GIC_ITS range length
      arm64: dts: qcom: milos: Fix GIC_ITS range length
      arm64: dts: qcom: sm8450: Fix GIC_ITS range length
      arm64: dts: qcom: sm8550: Fix GIC_ITS range length
      arm64: dts: qcom: sm8650: Fix GIC_ITS range length
      arm64: dts: qcom: sm8750: Fix GIC_ITS range length
      arm64: dts: qcom: sc7180: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sc7280: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sdm845: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm6350: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm8350: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm8550: Explicitly describe the IPA IMEM slice
      arm64: dts: qcom: sm8650: Explicitly describe the IPA IMEM slice

Krishna Chaitanya Chundru (1):
      arm64: dts: qcom: kodiak: Fix PCIe1 PHY ref clock voting

Krishna Kurapati (3):
      arm64: dts: qcom: talos: Flatten usb controller nodes
      arm64: dts: qcom: talos: Mark usb controllers are wakeup capable devices
      arm64: dts: qcom: hamoa/purwa: Flatten usb controller nodes

Krzysztof Kozlowski (16):
      arm64: dts: qcom: x1-crd: add USB DisplayPort audio
      arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC
      arm64: dts: qcom: sm8750-mtp: Enable display
      arm64: dts: qcom: sm8750-mtp: Enable USB headset and Type-C accessory mode
      arm64: dts: qcom: sm8750-mtp: Enable DisplayPort over USB
      arm64: dts: qcom: msm8996: Drop redundant VSYNC pin state
      arm64: dts: qcom: msm8998: Drop redundant VSYNC pin state
      arm64: dts: qcom: sdm845-axolotl: Drop redundant VSYNC pin state
      arm64: dts: qcom: sm8550: Drop redundant VSYNC pin state
      arm64: dts: qcom: sm8650: Drop redundant VSYNC pin state
      arm64: dts: qcom: lemans-ride: Drop redundant non-controllable supplies
      arm64: dts: qcom: qcs615-ride: Drop redundant non-controllable supplies
      arm64: dts: qcom: qrb2210-rb1: Drop redundant non-controllable supplies
      arm64: dts: qcom: qrb4210-rb2: Drop redundant non-controllable supplies
      arm64: dts: qcom: qrb5165-rb5: Drop redundant non-controllable supplies
      arm64: dts: qcom: eliza: Add thermal sensors

Le Qi (1):
      arm64: dts: qcom: hamoa-evk: Add DP0/DP1 audio playback support

Loic Poulain (6):
      arm64: dts: qcom: monaco: Complete SDHC definition
      arm64: dts: qcom: monaco-evk: Enable SDHC1 for eMMC
      arm64: dts: qcom: monaco: Add HS/SS endpoints for USB1 controller
      arm64: dts: qcom: Add Monaco Monza SoM
      dt-bindings: arm: qcom: add Arduino Monza, VENTUNO Q
      arm64: dts: qcom: Add Arduino Monza (VENTUNO Q) board support

Luca Weiss (13):
      arm64: dts: qcom: kodiak: Add I2S1 pinctrl definitions
      arm64: dts: qcom: milos: Sort pinctrl subnodes by pins
      arm64: dts: qcom: milos-fairphone-fp6: Add Hall Effect sensor
      arm64: dts: qcom: milos: Add fastrpc nodes
      arm64: dts: qcom: milos: add ADSP GPR
      arm64: dts: qcom: milos: Add LPASS LPI pinctrl node
      arm64: dts: qcom: sm7225-fairphone-fp4: Fix conflicting bias pinctrl
      arm64: dts: qcom: milos: Add UFS nodes
      arm64: dts: qcom: milos-fairphone-fp6: Enable UFS
      arm64: dts: qcom: milos: Add CCI busses
      arm64: dts: qcom: milos-fairphone-fp6: Add camera EEPROMs on CCI busses
      arm64: dts: qcom: qcm6490-fairphone-fp5: Sort pinctrl nodes by pins
      arm64: dts: qcom: qcm6490-fairphone-fp5: Add front camera support

Manaf Meethalavalappu Pallikunhi (2):
      arm64: dts: qcom: kaanapali: Add TSENS and thermal zones
      arm64: dts: qcom: sm8750: Enable TSENS and thermal zones

Manivannan Sadhasivam (1):
      arm64: dts: qcom: x1e80100: Add '#cooling-cells' for CPU nodes

Max McNamee (1):
      arm64: dts: qcom: msm8916-samsung-coreprimeltevzw: add device tree

Md Sadre Alam (4):
      arm64: dts: qcom: ipq5424: Add QPIC SPI NAND controller support
      arm64: dts: qcom: ipq5332: Add QPIC SPI NAND controller support
      arm64: dts: qcom: ipq5424-rdp466: Enable QPIC SPI NAND support
      arm64: dts: qcom: pq5332-rdp-common: Enable QPIC SPI NAND support

Mukesh Ojha (2):
      arm64: dts: qcom: lemans: disable zap-shader for EL2 configuration
      arm64: dts: qcom: monaco: Add EL2 overlay

Neil Armstrong (3):
      dt-binding: vendor-prefixes: document the Ayaneo brand
      dt-bindings: arm: qcom: document the Ayaneo Pocket S2
      arm64: dts: qcom: sm8650: Add sound DAI prefix for DP

Nihal Kumar Gupta (4):
      arm64: dts: qcom: monaco: Add CCI definitions
      arm64: dts: qcom: monaco: Add camera MCLK pinctrl
      arm64: dts: qcom: monaco-evk: Add camera AVDD regulators
      arm64: dts: qcom: monaco-evk-camera: Add DT overlay

Odelu Kukatla (2):
      dt-bindings: interconnect: document the RPMh Network-On-Chip interconnect in Eliza SoC
      arm64: dts: qcom: qcs8300: Add clocks for QoS configuration

Pankaj Patil (3):
      dt-bindings: arm: qcom: Document Glymur SoC and board
      arm64: dts: qcom: Introduce Glymur base dtsi
      arm64: dts: qcom: glymur: Enable Glymur CRD board support

Paul Adam (3):
      dt-bindings: vendor-prefixes: add WIKO SAS
      dt-bindings: arm: qcom: add wiko,chuppito compatible string
      arm64: dts: qcom: msm8916-wiko-chuppito: add initial devicetree

Pengyu Luo (1):
      arm64: dts: qcom: sc8280xp: Add dsi nodes on SC8280XP

Petr Hodina (2):
      arm64: dts: qcom: sdm845-sony-xperia-tama: Correct uart instances
      arm64: dts: qcom: sdm845-sony-xperia-tama: Add bluetooth

Pradeep P V K (3):
      arm64: dts: qcom: hamoa: Add UFS nodes for x1e80100 SoC
      arm64: dts: qcom: hamoa-iot-evk: Enable UFS
      arm64: dts: qcom: purwa-iot-evk: Enable UFS

Pragnesh Papaniya (3):
      arm64: dts: qcom: glymur: Add glymur BWMONs
      arm64: dts: qcom: glymur: Add missing opp entry
      arm64: dts: qcom: mahua: Fix mahua bwmon

Prasad Kumpatla (2):
      arm64: dts: qcom: kaanapali: Add support for audio
      arm64: dts: qcom: kaanapali-mtp: Add audio support (WSA8845, WCD9395, DMIC)

Raymond Hackley (2):
      arm64: dts: qcom: msm8916-samsung-fortuna: Move SM5504 from rossa and refactor MUIC
      dt-bindings: qcom: Document samsung,coreprimeltevzw

Riccardo Mereu (1):
      arm64: dts: qcom: arduino-imola: fix faulty spidev node

Richard Acayan (1):
      arm64: dts: qcom: sdm670: add llcc

Roger Shimizu (3):
      dt-bindings: arm: qcom: Add Thundercomm AI Mini PC G1 IoT
      arm64: dts: qcom: kodiak: Add missing usb-role-switch property
      arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT

Sarthak Garg (2):
      arm64: dts: qcom: hamoa-iot-evk: Add SDC2 node for hamoa iot evk board
      arm64: dts: qcom: purwa-iot-evk: Add SDC2 node for purwa iot evk board

Sibi Sankar (2):
      dt-bindings: arm: cpus: Extend Qualcomm Oryon compatibles
      arm64: dts: qcom: glymur: Fix deprecated cpu compatibles

Srinivas Kandagatla (3):
      arm64: dts: qcom: monaco: Add missing usb-role-switch property
      arm64: dts: qcom: monaco: add dt entry for lpass lpi pinctrl
      arm64: dts: monaco: extend fastrpc compute cb

Sushrut Shree Trivedi (2):
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
      arm64: dts: qcom: qcs6490-rb3gen2-industrial-mezzanine: Add second TC9563 PCIe switch node for PCIe1

Swati Agarwal (7):
      arm64: dts: qcom: monaco-evk: Enable GPIO expander interrupt for Monaco EVK
      arm64: dts: qcom: monaco: Add role-switch support and HS endpoint for secondary USB controller
      arm64: dts: qcom: monaco-evk: Enable the secondary USB controller
      arm64: dts: qcom: lemans-evk: Enable GPIO expander interrupt for Lemans EVK
      arm64: dts: qcom: lemans-evk: Rename vbus regulator for Primary USB controller
      arm64: dts: qcom: lemans: Add role-switch support and HS endpoint for tertiary USB controller
      arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller

Taniya Das (4):
      dt-bindings: clock: qcom: document the Eliza Global Clock Controller
      dt-bindings: clock: qcom: Document the Eliza TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Eliza
      arm64: dts: qcom: kaanapali: Add support for MM clock controllers for Kaanapali

Tobias Heider (3):
      arm64: dts: qcom: add missing denali-oled.dtb to Makefile
      arm64: dts: qcom: fix remaining gpu_zap_shader labels
      arm64: dts: qcom: drop redundant zap-shader memory-region

Umang Chheda (2):
      arm64: dts: qcom: monaco-evk: Add IFP Mezzanine
      arm64: dts: qcom: lemans-evk: Add IFP Mezzanine

Val Packett (7):
      dt-bindings: arm: qcom: Add ECS LIVA QC710
      arm64: dts: qcom: Add support for ECS LIVA QC710
      dt-bindings: clock: qcom,sm6115-dispcc: Define MDSS resets
      dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
      arm64: dts: qcom: sm6115: Add missing MDSS core reset
      arm64: dts: qcom: sm6125: Add missing MDSS core reset
      arm64: dts: qcom: kodiak: Add LPASS I2S2 pinctrl definitions

Varadarajan Narayanan (4):
      arm64: dts: qcom: ipq9574: Add details for eMMC
      arm64: dts: qcom: ipq9574-rdp433: Reorganize DTS to introduce eMMC support
      dt-bindings: arm: qcom: Add IPQ9574 AL02-c2 and AL02-c7 eMMC variant
      arm64: dts: qcom: ipq9574: Enable eMMC variant

Viken Dadhaniya (1):
      arm64: dts: qcom: lemans: Correct QUP interrupt numbers

Vishnu Saini (1):
      arm64: dts: qcom: monaco-evk: add lt8713sx bridge with displayport

Vladimir Zapolskiy (7):
      arm64: dts: qcom: sm8550: Fix xo clock supply of platform SD host controller
      arm64: dts: qcom: sm8650: Fix xo clock supply of SD host controller
      arm64: dts: qcom: hamoa: Fix xo clock supply of platform SD host controller
      arm64: dts: qcom: sm8450: Enable UHS-I SDR50 and SDR104 SD card modes
      arm64: dts: qcom: sm8550: Enable UHS-I SDR50 and SDR104 SD card modes
      arm64: dts: qcom: sm8650: Enable UHS-I SDR50 and SDR104 SD card modes
      arm64: dts: qcom: sm8550-hdk: add support for the Display Card overlay

Wei Deng (1):
      arm64: dts: qcom: qcs8300-ride: Enable Bluetooth support

Wei Zhang (1):
      arm64: dts: qcom: qcs8300-ride: enable WLAN on qcs8300-ride

Wesley Cheng (2):
      arm64: dts: qcom: glymur: Add USB related nodes
      arm64: dts: qcom: glymur-crd: Enable USB support

Xilin Wu (3):
      arm64: dts: qcom: sm8550: Update EAS properties
      arm64: dts: qcom: pmk8550: Add PWM controller
      arm64: dts: qcom: sm8550: Add UART15

Xin Liu (2):
      arm64: dts: qcom: hamoa: Add EL2 overlay for hamoa-evk
      arm64: dts: qcom: hamoa: Add remoteproc IOMMUS in EL2 device trees

Xueyao An (1):
      arm64: dts: qcom: hamoa-iot-som: Add firmware-name to QUPv3 nodes

Yedaya Katsman (1):
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Add Focaltech FT3518 touchscreen

Yijie Yang (4):
      arm64: dts: qcom: merge duplicate references to pmc8380_3_gpios
      dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
      arm64: dts: qcom: Add PURWA-IOT-SOM platform
      arm64: dts: qcom: Add base PURWA-IOT-EVK board

Yuanjie Yang (2):
      arm64: dts: qcom: kaanapali: add display hardware devices
      arm64: dts: qcom: kaanapali-mtp: Enable display DSI devices

Zijun Hu (1):
      arm64: dts: qcom: kaanapali-mtp: Enable bluetooth and Wifi

 Documentation/devicetree/bindings/arm/cpus.yaml    |    7 +
 Documentation/devicetree/bindings/arm/qcom.yaml    |   45 +
 .../bindings/clock/qcom,ipq5210-gcc.yaml           |   62 +
 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |    9 +-
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 .../bindings/interconnect/qcom,eliza-rpmh.yaml     |  142 +
 .../bindings/interconnect/qcom,osm-l3.yaml         |    1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 arch/arm64/boot/dts/qcom/Makefile                  |   49 +-
 arch/arm64/boot/dts/qcom/agatti.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts        | 1126 +--
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi       | 1133 ++++
 arch/arm64/boot/dts/qcom/apq8096sg-db820c.dts      |   15 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |  407 ++
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 1885 ++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  417 ++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  697 ++
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 7135 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  141 +-
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi        |   30 +-
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |  506 +-
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |   79 +
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |  311 +
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi   |   44 +
 arch/arm64/boot/dts/qcom/ipq5332-rdp442.dts        |   34 -
 arch/arm64/boot/dts/qcom/ipq5332.dtsi              |   33 +
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts        |   44 +-
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |   33 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi   |   66 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp418-emmc.dts   |   20 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp418.dts        |   44 +-
 .../arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi |  121 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts   |   20 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts        |  114 +-
 arch/arm64/boot/dts/qcom/ipq9574-rdp449.dts        |    4 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp453.dts        |    4 +
 arch/arm64/boot/dts/qcom/ipq9574-rdp454.dts        |    4 +
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              |   13 +-
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |  571 +-
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |  106 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            | 7116 ++++++++++++++++---
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |  128 +-
 arch/arm64/boot/dts/qcom/lemans-el2.dtso           |    4 +
 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso    |  263 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |  107 +-
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |   26 -
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   37 +-
 arch/arm64/boot/dts/qcom/mahua-crd.dts             |   21 +
 arch/arm64/boot/dts/qcom/mahua.dtsi                |  299 +
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |   89 +-
 arch/arm64/boot/dts/qcom/milos.dtsi                |  669 +-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |  466 ++
 arch/arm64/boot/dts/qcom/monaco-el2.dtso           |   29 +
 .../boot/dts/qcom/monaco-evk-camera-imx577.dtso    |   66 +
 .../boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso    |  149 +
 arch/arm64/boot/dts/qcom/monaco-evk.dts            |  312 +-
 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi     |  323 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  617 +-
 .../boot/dts/qcom/msm8216-samsung-fortuna3g.dts    |   18 +
 .../dts/qcom/msm8916-samsung-coreprimeltevzw.dts   |   44 +
 .../dts/qcom/msm8916-samsung-fortuna-common.dtsi   |   32 +-
 .../boot/dts/qcom/msm8916-samsung-gprimeltecan.dts |   15 +-
 .../dts/qcom/msm8916-samsung-grandprimelte.dts     |   18 +
 .../dts/qcom/msm8916-samsung-rossa-common.dtsi     |   19 -
 arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dts |   18 +
 arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts |  314 +
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   |  310 +-
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts  |   15 +
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts  |   20 +
 .../boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi     |  331 +
 arch/arm64/boot/dts/qcom/msm8937-xiaomi-land.dts   |    2 +-
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts     |   21 +
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-daisy.dts  |    2 +-
 arch/arm64/boot/dts/qcom/msm8953-xiaomi-vince.dts  |    2 +-
 .../boot/dts/qcom/msm8996-oneplus-common.dtsi      |    9 +-
 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi         |   63 -
 .../arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi |   11 +-
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dts |    2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |    2 +-
 .../boot/dts/qcom/msm8996pro-xiaomi-natrium.dts    |    2 +-
 arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dts  |    9 +-
 arch/arm64/boot/dts/qcom/pm6125.dtsi               |    1 -
 arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi     |   93 +
 arch/arm64/boot/dts/qcom/pmcx0102.dtsi             |  187 +
 arch/arm64/boot/dts/qcom/pmd8028-kaanapali.dtsi    |   62 +
 arch/arm64/boot/dts/qcom/pmh0101.dtsi              |   68 +
 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi       |  144 +
 arch/arm64/boot/dts/qcom/pmh0104-kaanapali.dtsi    |   63 +
 arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi       |  144 +
 arch/arm64/boot/dts/qcom/pmh0110-kaanapali.dtsi    |  213 +
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi   |   68 +
 arch/arm64/boot/dts/qcom/pmk8550.dtsi              |   10 +
 arch/arm64/boot/dts/qcom/pmk8850.dtsi              |   70 +
 arch/arm64/boot/dts/qcom/pmr735d-kaanapali.dtsi    |   63 +
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts         | 1590 +++++
 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi        |  677 ++
 arch/arm64/boot/dts/qcom/purwa.dtsi                |  590 +-
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  121 +-
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts           |  169 +
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   38 +-
 .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso |  269 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   95 +-
 .../dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts  | 1093 +++
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts |    8 +-
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  336 +
 arch/arm64/boot/dts/qcom/qdu1000.dtsi              |   10 +-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  126 +-
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts           |  105 +-
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts           |  105 +-
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts           |   39 +-
 arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts |  616 ++
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   10 +-
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |   11 -
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   12 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  444 +-
 .../arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts |   66 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   42 +-
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |   11 +
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts         |   69 +-
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |   42 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |  100 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |   13 +-
 .../boot/dts/qcom/sdm845-sony-xperia-tama.dtsi     |   17 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |    1 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   62 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi                |    8 +-
 arch/arm64/boot/dts/qcom/sm4450.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/sm6115.dtsi               |   10 +-
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  313 +
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  |  285 +-
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |   73 +
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts  |   15 +
 arch/arm64/boot/dts/qcom/sm6125.dtsi               |   36 +-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   28 +-
 arch/arm64/boot/dts/qcom/sm6375.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |    4 +
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts            |  141 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |    4 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |   21 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |   28 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   17 +-
 .../boot/dts/qcom/sm8550-hdk-display-card.dtso     |  132 +
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts            |   13 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts            |   13 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  101 +-
 .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1551 +++++
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts            |   13 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts            |   13 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |   78 +-
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts            |  122 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi               | 1345 +++-
 arch/arm64/boot/dts/qcom/smb2370.dtsi              |   45 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  139 +-
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi | 1356 ++++
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |   91 +-
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |   50 +-
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        |   18 +-
 arch/arm64/boot/dts/qcom/x1-el2.dtso               |    8 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |   18 +-
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |   19 +-
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts       |   18 +-
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    |   18 +-
 .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 1346 +---
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     |   12 +-
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |   18 +-
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    |   18 +-
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  |   13 +-
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          |   18 +-
 .../boot/dts/qcom/x1p42100-asus-vivobook-s15.dts   |   43 +
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts |   23 +-
 include/dt-bindings/clock/qcom,dispcc-sm6125.h     |    6 +-
 include/dt-bindings/clock/qcom,eliza-gcc.h         |  210 +
 include/dt-bindings/clock/qcom,eliza-tcsr.h        |   17 +
 include/dt-bindings/clock/qcom,ipq5210-gcc.h       |  126 +
 include/dt-bindings/clock/qcom,sm6115-dispcc.h     |    7 +-
 include/dt-bindings/interconnect/qcom,eliza-rpmh.h |  136 +
 include/dt-bindings/reset/qcom,ipq5210-gcc.h       |  127 +
 178 files changed, 38003 insertions(+), 5837 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,eliza-rpmh.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/apq8096sg-db820c.dts
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-mtp.dts
 create mode 100644 arch/arm64/boot/dts/qcom/eliza.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/glymur-crd.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/glymur.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5210.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp418-emmc.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-crd.dts
 create mode 100644 arch/arm64/boot/dts/qcom/mahua.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-el2.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-camera-imx577.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-monza-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-samsung-coreprimeltevzw.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-xiaomi-rolex.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-xiaomi-tiare.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8996-v3.0.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pm8010-kaanapali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmcx0102.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmd8028-kaanapali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmh0101.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmh0104-kaanapali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmh0110-glymur.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmh0110-kaanapali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmk8850.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/pmr735d-kaanapali.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-ecs-liva-qc710.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sm8550-hdk-display-card.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
 create mode 100644 arch/arm64/boot/dts/qcom/smb2370.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-vivobook-s15.dts
 create mode 100644 include/dt-bindings/clock/qcom,eliza-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-tcsr.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq5210-gcc.h
 create mode 100644 include/dt-bindings/interconnect/qcom,eliza-rpmh.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq5210-gcc.h

