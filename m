Return-Path: <linux-arm-msm+bounces-109890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCnBIOjVFWrRcgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:18:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5135DA81C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 19:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B8CB302BBB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E29013FFAB9;
	Tue, 26 May 2026 16:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5LXTm/V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3273FE36E
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779814662; cv=none; b=XXMNjwl3woomM6ulxP5pf50KFLp5KnZ613nYuVAzXQ/uVb28eyJ3kHbAS5ai2Wjim4GVoH5UT8qaT7sxRHJN7UgM6RgXmPvc0vKa7d1iVwxDuo0ppCwp0Ir/Ufal92MgGHBSLcbg+d9dr4q75iEINMU/Y8AEEgfML2V4zwYAAuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779814662; c=relaxed/simple;
	bh=LrGTK5hEJBJKXpLRrQWnmcNlY+/HIB56ugJXInM0FCI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aVCjjPgRToKXXOAfrFZUqw2S4XOG13aGZ0g+Nft0BzGPZk6rw6VewBVLC3F2rSrMPPfLTTqif59lvengS5P4Yyi7Gp3WV/Vpe5Rhfsh/vURdpK3pF4rqkWMD8J9xiKo01B4MX+nwop6K6P1bmB2VBi/AKWAA0mJnMhpbhUaA8g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5LXTm/V; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED2FA1F000E9;
	Tue, 26 May 2026 16:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814660;
	bh=4GIS2BQH/0YWDLgStt9K/5Y5CzGpCmL3mhdfIxqrNUQ=;
	h=From:To:Cc:Subject:Date;
	b=Z5LXTm/VQSbhUZGks5vPlaIbz8FSxdz/syb/u9WPOAZgH3b0BasTNoagbx8F+xl/C
	 OR82NyRwsTyTV8P2LaOM22pMJXMIbhnKfGhbQACES4+PIr90FkJjBnxcVT2Th0/CtV
	 Ud0gY+TBwjH70CwV8sI5dAdQu4+Zot+7WYCsqxi39AE26WDkwwPyKGFqHPA7CSUrzm
	 xb+5rR6YvM7SBFmbsu19LwKIH2H4T6sagDa3LkodiyP62/Unwk/20WH7uRqlTRJcXB
	 A5O/+2570yDmPkU0puEWBPGRqoDWxWPxcA9kiT+uvul45liS9ElF5ZEaFvtpGw274b
	 Tn1K1RmR8Fldg==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Harshal Dev <harshal.dev@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	David Heidelberg <david@ixit.cz>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Alexander Koskovich <akoskovich@pm.me>,
	Richard Acayan <mailingradian@gmail.com>,
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Nickolay Goppen <setotau@mainlining.org>,
	Paul Sajna <sajattack@postmarketos.org>,
	Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Le Qi <le.qi@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Val Packett <val@packett.cool>,
	Aaron Kling <webgeek1234@gmail.com>,
	Aastha Pandey <aastha.pandey@oss.qualcomm.com>,
	Amit Pundir <amit.pundir@linaro.org>,
	Anup Kulkarni <anup.kulkarni@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
	Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
	Haritha S K <haritha.k@oss.qualcomm.com>,
	Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
	Jens Reidel <adrian@travitia.xyz>,
	Jie Gan <jie.gan@oss.qualcomm.com>,
	Joel Selvaraj <foss@joelselvaraj.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Petr Hodina <petr.hodina@protonmail.com>,
	Ritesh Kumar <quic_riteshk@quicinc.com>,
	Saurabh Anand <saurabh.anand@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Shuai Zhang <shuai.zhang@oss.qualcomm.com>,
	Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
	Wojciech Slenska <wojciech.slenska@gmail.com>,
	Xilin Wu <sophon@radxa.com>,
	Xin Liu <xin.liu@oss.qualcomm.com>,
	Yedaya Katsman <yedaya.ka@gmail.com>
Subject: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v7.2
Date: Tue, 26 May 2026 11:57:35 -0500
Message-ID: <20260526165735.17848-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arndb.de,oss.qualcomm.com,ixit.cz,pm.me,gmail.com,mainlining.org,postmarketos.org,fairphone.com,quicinc.com,packett.cool,linaro.org,travitia.xyz,joelselvaraj.com,protonmail.com,radxa.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109890-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_GT_50(0.00)[52];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: EC5135DA81C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-7.2

for you to fetch changes up to f3919fa784a3e6dd557dfe2c41072f55742e013f:

  arm64: dts: qcom: add support for pixel 3a xl with the tianma panel (2026-05-21 22:46:53 -0500)

----------------------------------------------------------------
Qualcomm Arm64 DeviceTree updates for v7.2

Introduce the Qualcomm IPQ9650 router/gateway platform and the RDP488
board. Add support for the Motorola Edge 30 and the Nothing Phone.

Describe the IPA block on the Agatti platform and missing OPP-levels for
the video encoder/decoder.

For Eliza, describe the QUP Serial Engines, GPI DMA, SDHCI, LLCC, IMEM,
QCE crypto, ADSP remoteproc and USB nodes. Enable DSI panel,
DisplayPort, USB, and ADSP support on the Eliza MTP.

On Glymur enable ADSP and CDSP remoteprocs, FastRPC, crypto hardware,
CPUfreq cooling devices, and coresight nodes. Enable the remoteprocs and
the LID sensor on the Glymur CRD.

Describe the CAN-FD controller found on the Hamoa EVK. Correct the
DisplayPort controller OPP tables.

Describe the watchdog on IPQ5210 and IPQ9650.

Describe USB controller and PHYs for the Kaanapali platform and enable
basic USB support on the MTP and QRD devices.

Enable the second display subsystem on Lemans and use this to enable
additional DisplayPort outputs on the Lemans Ride board, and IFP
mezzanine for the EVK. Also enable the GPIO expander on the Lemans EVK
to get the CAN signals out.

Add crypto hardware and qfprom nodes on Milos. Reduce the remotefs
shared memory size to avoid sanity checks in the modem firmware
rejecting the region.
Enable the vibrator on FairPhone FP6.

Add GPSDP FastRPC support on Monaco, and describe the Bluetooth
controller on the Arduino VENTUNO Q board.

Introduce an EL2 overlay for the Purwa IoT EVK.

Enable CAN bus controller on QCS6490 RB3gen2 and add a remotefs node.

Enable FastRPC on the SC8280XP ADSP.

Correct SDM630 and SDM660 ADSP FastRPC channel ids. Also add the ADSP
memory region on SDM630.

On SDM845 devices, enable NFC on Google Pixel 3, OnePlus 6, OnePlus 6T,
and SHIFT SHIFT6mq. Enable camera flash on LG devices. Rework the
framebuffer description on Samsung, SHIFT and Xiaomi devices. Enable
camera flash on LG devices. Fix Bluetooth and WiFi on LG and Xiaomi
devices.

Enable MDSS and the display panel on Xiaomi Mi A3.

Scale L3 and DDR clock votes based on CPUfreq selection.

Enable camera clock controller, cpufreq cooling devices, and correct the
DSI1 reference clock on SM8750.

On the Talos platform, describe the QSPI support, GPR and audio
services, and enable sound on the EVK target. Enable QSPI and describe
the SPINOR on this bus, on the QCS615 Ride.

Describe power-domain and iface clock for the Inline Crypto Engine (ICE)
across various platforms.

Fix the Bluetooth RFA supply name across a variety of devices.

----------------------------------------------------------------
Aaron Kling (1):
      arm64: dts: qcom: sm8550: add cpu OPP table with DDR, LLCC & L3 bandwidths

Aastha Pandey (1):
      arm64: dts: qcom: sm8750: Enable cpufreq cooling devices

Abel Vesa (9):
      arm64: dts: qcom: hamoa: Fix OPP tables for all DisplayPort controllers
      arm64: dts: qcom: glymur-crd: Enable LID sensor
      arm64: dts: qcom: glymur-crd: Drop forced host mode for USB SS0 and SS1
      arm64: dts: qcom: glymur: Mark USB SS1 and SS2 as role-switch capable
      arm64: dts: qcom: eliza: Describe the ADSP and USB related nodes
      arm64: dts: qcom: Add Eliza-specific PM7550BA dtsi
      arm64: dts: qcom: eliza-mtp: Enable USB and ADSP support
      arm64: dts: qcom: eliza-mtp: Fix the debug UART index
      arm64: dts: qcom: eliza: Add QUPv3, GPI DMA, SDHCI and LLCC nodes

Alexander Koskovich (8):
      arm64: dts: qcom: milos: Reduce rmtfs_mem size to 2.5MiB
      dt-bindings: arm: qcom: Add the Nothing Phone (3a)
      arm64: dts: qcom: Add the Nothing Phone (3a)
      arm64: dts: qcom: milos: Add QCrypto nodes
      arm64: dts: qcom: eliza: Sort nodes by unit address
      arm64: dts: qcom: eliza: Add IMEM node
      arm64: dts: qcom: eliza: Fix reserved memory addresses & sizes
      arm64: dts: qcom: milos: Add qfprom efuse node

Amit Pundir (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk

Anup Kulkarni (1):
      arm64: dts: qcom: lemans-evk: Enable CAN RX via I2C GPIO expander

Bjorn Andersson (3):
      Merge branch '20260225-topic-wcn6855_pmu_dtbdings-v3-1-576ec5c4e631@oss.qualcomm.com' into arm64-for-7.2
      Merge branch '20260507-ipq9650_boot_to_shell-v3-1-62742b49c991@oss.qualcomm.com' into arm64-for-7.2
      Merge branch '20260416-qcom_ice_power_and_clk_vote-v5-13-5ccf5d7e2846@oss.qualcomm.com' into arm64-for-7.2

David Heidelberg (10):
      arm64: dts: qcom: sdm845-oneplus: Drop address from framebuffer node
      arm64: dts: qcom: sdm845-shift-axolotl: Convert fb to use memory-region
      arm64: dts: qcom: sdm845-samsung-starqltechn: Convert fb to use memory-region
      arm64: dts: qcom: sdm845-oneplus: Enable NFC
      arm64: dts: qcom: sdm845-shift-axolotl: Correct touchscreen sleep state
      arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
      arm64: dts: qcom: sdm845-google-common: Enable NFC
      dt-bindings: arm: qcom: Document Xiaomi Poco F1 Tianma variant
      arm64: dts: qcom: sdm845-oneplus: Enable known blocks and add placeholders
      arm64: dts: qcom: sdm845-shift-axolotl: describe WiFi/BT properly

Dikshita Agarwal (1):
      arm64: dts: qcom: agatti: add higher OPP levels

Dmitry Baryshkov (1):
      arm64: dts: qcom: qcs6490-rb3gen2: add rmtfs node

Ekansh Gupta (1):
      arm64: dts: qcom: monaco: add GDSP fastrpc-compute-cb nodes

Gopikrishna Garmidi (1):
      arm64: dts: qcom: glymur: Fix wrong interrupt number for i2c19

Griffin Kroah-Hartman (1):
      arm64: dts: qcom: milos-fairphone-fp6: Add vibrator support

Haritha S K (1):
      arm64: dts: qcom: glymur: Enable cpufreq cooling devices

Harrison Vanderbyl (1):
      dt-bindings: arm: qcom: Add Microsoft Surface Pro 12in

Harshal Dev (12):
      arm64: dts: qcom: glymur: Add crypto engine and BAM
      arm64: dts: qcom: milos: Add power-domain and iface clk for ice node
      arm64: dts: qcom: eliza: Add power-domain and iface clk for ice node
      arm64: dts: qcom: kaanapali: Add power-domain and iface clk for ice node
      arm64: dts: qcom: lemans: Add power-domain and iface clk for ice node
      arm64: dts: qcom: monaco: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sc7180: Add power-domain and iface clk for ice node
      arm64: dts: qcom: kodiak: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8450: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8550: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8650: Add power-domain and iface clk for ice node
      arm64: dts: qcom: sm8750: Add power-domain and iface clk for ice node

Jens Reidel (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Append compatible strings

Jie Gan (1):
      arm64: dts: qcom: glymur: add coresight nodes

Joel Selvaraj (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Correct IPA FW path

Kamal Wadhwa (1):
      arm64: dts: qcom: fix temp-alarm probe failure for PMH0104 on Glymur

Kathiravan Thirumoorthy (5):
      dt-bindings: clock: add Qualcomm IPQ9650 GCC
      dt-bindings: qcom: add IPQ9650 boards
      arm64: dts: qcom: add IPQ9650 SoC and rdp488 board support
      arm64: dts: qcom: ipq9650: add watchdog node
      arm64: dts: qcom: ipq5210: add watchdog node

Konrad Dybcio (10):
      dt-bindings: net: bluetooth: qualcomm: Fix WCN6855 regulator names
      arm64: dts: qcom: qcs615-ride: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-crd: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-gaokun3: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-x13s: Fix BT RFA supply name
      arm64: dts: qcom: sc8280xp-blackrock: Fix BT RFA supply name
      arm64: dts: qcom: sm8450-hdk: Fix BT RFA supply name
      arm64: dts: qcom: x1-omnibook-x14: Fix BT RFA supply name
      arm64: dts: qcom: x1-zenbook-a14: Fix BT RFA supply name
      arm64: dts: qcom: lemans-ride-common: Fix up WCN power grid

Krzysztof Kozlowski (11):
      arm64: dts: qcom: glymur: Fix USB simple_bus_reg warning
      arm64: dts: qcom: glymur: Fix cache and SRAM simple_bus_reg warnings
      arm64: dts: qcom: ipq5424: Fix USB simple_bus_reg warnings
      arm64: dts: qcom: sc8180x: Fix phy simple_bus_reg warning
      arm64: dts: qcom: sdm845-mezzanine: Fix camss ports unit_address_vs_reg warning
      arm64: dts: qcom: eliza: Add QCE crypto
      arm64: dts: qcom: Use GIC_SPI macro for interrupt-map
      arm64: dts: qcom: sm8750: Fix DSI1 phy reference clock rate
      arm64: dts: qcom: eliza: Add display (MDSS) with Display CC
      arm64: dts: qcom: eliza-mtp: Enable DSI display panel
      arm64: dts: qcom: eliza-mtp: Enable DisplayPort on USB

Kuldeep Singh (2):
      arm64: dts: qcom: kodiak: Fix ICE reg size
      arm64: dts: qcom: sm8450: Fix ICE reg size

Le Qi (2):
      arm64: dts: qcom: talos: Add GPR node, audio services, and MI2S1 TLMM pins
      arm64: dts: qcom: talos-evk: Add sound card support with DA7212 codec

Luca Weiss (2):
      arm64: dts: qcom: sm6350: add LPASS LPI pin controller
      arm64: defconfig: Enable LPASS LPI pin controller for SM6350

Mani Chandana Ballary Kuntumalla (2):
      arm64: dts: qcom: lemans: add mdss1 display device nodes
      arm64: dts: qcom: lemans-ride: Enable mdss1 display Port

Mukesh Ojha (1):
      arm64: dts: qcom: Drop unused remoteproc_adsp_glink label

Nickolay Goppen (5):
      dt-bindings: firmware: qcom: scm: add CP_ADSP_SHARED VMID
      arm64: dts: qcom: sdm660: set cdsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: set adsp compute-cbs' regs properly
      arm64: dts: qcom: sdm630: describe adsp_mem region properly
      arm64: dts: qcom: sdm630: assign adsp_mem region to ADSP FastRPC node

Pankaj Patil (1):
      arm64: dts: qcom: glymur: Add qfprom efuse node

Paul Sajna (4):
      arm64: dts: qcom: sdm845-lg-common: Add camera flash
      arm64: dts: qcom: sdm845-lg-common: Change ipa gsi-loader to 'self', add memory-region
      arm64: dts: qcom: sdm845-lg-{judyln, judyp}: Reference memory region in fb
      arm64: dts: qcom: sdm845-lg: Enable qcom,snoc-host-cap-skip-quirk

Pengyu Luo (1):
      arm64: dts: qcom: sc8280xp: Add ADSP FastRPC node

Petr Hodina (1):
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Introduce framebuffer

Richard Acayan (6):
      arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
      arm64: dts: qcom: sdm670: add camera mclk pins
      arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera
      arm64: dts: qcom: sdm670: add lpi pinctrl
      arm64: dts: qcom: sdm670-google: add common device tree include
      arm64: dts: qcom: add support for pixel 3a xl with the tianma panel

Ritesh Kumar (1):
      arm64: dts: qcom: lemans: Add eDP ref clock for eDP PHYs

Ronak Raheja (3):
      arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC
      arm64: dts: qcom: kaanpaali: Add USB support for MTP platform
      arm64: dts: qcom: kaanpaali: Add USB support for QRD platform

Saurabh Anand (1):
      arm64: dts: qcom: sm8750: allow mode-switch events to reach the QMP Combo PHY

Shawn Guo (1):
      arm64: dts: qcom: lemans: Move PCIe devices into soc node

Shuai Zhang (1):
      arm64: dts: qcom: monaco-arduino-monza: Add Bluetooth UART node

Sibi Sankar (2):
      arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC
      arm64: dts: qcom: glymur-crd: Enable ADSP and CDSP

Taniya Das (2):
      arm64: dts: qcom: Add support for MM clock controllers for Glymur
      arm64: dts: qcom: sm8750: Add camera clock controller

Val Packett (2):
      dt-bindings: arm: qcom: Add SM7325 Motorola Edge 30 (dubai)
      arm64: dts: qcom: Add Motorola Edge 30 (dubai) DTS

Viken Dadhaniya (6):
      arm64: dts: qcom: qcs6490-rb3gen2: Enable CAN bus controller
      arm64: dts: qcom: talos: Add QSPI support
      arm64: dts: qcom: qcs615-ride: Enable QSPI and NOR flash
      arm64: dts: qcom: kodiak: Add QSPI memory interconnect path
      arm64: dts: qcom: sc7180: Add QSPI memory interconnect path
      arm64: dts: qcom: hamoa-iot-evk: add MCP2518FD CAN on spi18

Vishnu Saini (1):
      arm64: dts: qcom: lemans-evk-ifp-mezzanine: Enable mdss1 display Port

Wojciech Slenska (1):
      arm64: dts: qcom: agatti: Add IPA nodes

Xilin Wu (1):
      arm64: dts: qcom: sc8280xp: drop unused polling-delay-passive properties

Xin Liu (1):
      arm64: dts: qcom: purwa: Add EL2 overlay for purwa-iot-evk

Yedaya Katsman (1):
      arm64: dts: qcom: sm6125-xiaomi-laurel-sprout: Enable MDSS and add panel

 Documentation/devicetree/bindings/arm/qcom.yaml    |   21 +-
 .../bindings/clock/qcom,ipq9650-gcc.yaml           |   68 +
 .../bindings/net/bluetooth/qcom,wcn6855-bt.yaml    |    7 +-
 arch/arm64/boot/dts/qcom/Makefile                  |    8 +
 arch/arm64/boot/dts/qcom/agatti.dtsi               |   63 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |  156 +-
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 2707 ++++++++++++++++++--
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |    4 -
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |   33 +-
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 1856 ++++++++++++--
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |   21 +
 arch/arm64/boot/dts/qcom/hamoa.dtsi                |   77 +-
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              |    7 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts        |   79 +
 arch/arm64/boot/dts/qcom/ipq9650.dtsi              |  384 +++
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts         |   27 +
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts         |   27 +
 arch/arm64/boot/dts/qcom/kaanapali.dtsi            |  170 +-
 arch/arm64/boot/dts/qcom/kodiak.dtsi               |   17 +-
 .../boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso    |   74 +
 arch/arm64/boot/dts/qcom/lemans-evk.dts            |    7 +
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi   |  110 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               | 1001 +++++---
 arch/arm64/boot/dts/qcom/mahua.dtsi                |    1 +
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |   31 +-
 .../boot/dts/qcom/milos-nothing-asteroids.dts      |  964 +++++++
 arch/arm64/boot/dts/qcom/milos.dtsi                |   52 +-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |   11 +
 arch/arm64/boot/dts/qcom/monaco.dtsi               |   37 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi              |    8 +-
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi       |   70 +
 arch/arm64/boot/dts/qcom/pmh0104-glymur.dtsi       |    2 +-
 arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   14 +-
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts       |   31 +
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |    2 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   15 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |    4 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |    2 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |    2 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |    2 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |    2 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   49 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi               |   28 +-
 arch/arm64/boot/dts/qcom/sdm660.dtsi               |   36 +-
 .../boot/dts/qcom/sdm670-google-bonito-tianma.dts  |   32 +
 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi |  712 +++++
 arch/arm64/boot/dts/qcom/sdm670-google-sargo.dts   |  614 +----
 arch/arm64/boot/dts/qcom/sdm670.dtsi               |  119 +-
 .../qcom/sdm845-db845c-navigation-mezzanine.dtso   |    5 +
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi |   31 +
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi     |   22 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts      |    4 +-
 arch/arm64/boot/dts/qcom/sdm845-lg-judyp.dts       |    4 +-
 .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi |   79 +-
 .../boot/dts/qcom/sdm845-samsung-starqltechn.dts   |    7 +-
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts  |  127 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-common.dtsi   |   19 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium-ebbg.dts |    2 +-
 .../dts/qcom/sdm845-xiaomi-beryllium-tianma.dts    |    2 +-
 .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |   94 +
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   66 +
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts | 1456 +++++++++++
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts            |    2 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |   10 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  375 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |    8 +-
 arch/arm64/boot/dts/qcom/sm8750.dtsi               |   63 +-
 arch/arm64/boot/dts/qcom/talos-evk.dts             |   56 +
 arch/arm64/boot/dts/qcom/talos.dtsi                |  134 +
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   |    2 +-
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   |    2 +-
 arch/arm64/configs/defconfig                       |    1 +
 include/dt-bindings/clock/qcom,ipq9650-gcc.h       |  172 ++
 include/dt-bindings/firmware/qcom,scm.h            |    1 +
 include/dt-bindings/reset/qcom,ipq9650-gcc.h       |  215 ++
 76 files changed, 11129 insertions(+), 1598 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9650-gcc.yaml
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq9650.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts
 create mode 100644 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
 create mode 100644 include/dt-bindings/clock/qcom,ipq9650-gcc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq9650-gcc.h

