Return-Path: <linux-arm-msm+bounces-102751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFZnNvV72WlyqAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 00:38:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 502543DD458
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 00:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15C4B30387C5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 22:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83B8A3E0C53;
	Fri, 10 Apr 2026 22:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGKCfpin"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601533E024F;
	Fri, 10 Apr 2026 22:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860723; cv=none; b=KbS/sWADyLkgpLhRY4AxiSgrZskwJGlMUAJt8lNS74p+myLJOtf4F7fDmE60tJ0YIkv4sRTE7uw9aGZm7GpdvA/TZCE9KLRxyfJmixh3HsDOfEDY6Q8ZrbQ/BDpQ679j+Sd0QlNER5iDHn+4Prn6akGSRrGnM4ahf4f2hnBUQRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860723; c=relaxed/simple;
	bh=ldDYXPhVycWmCizNHMp/2airdFaZU0BtZeC3nGJ3CH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=reSv31yCeW03zL2qD8A1vUMb2VggrLPxjxI+6zgLJLwIWtp8VB15tYwz7fGPKpnnFfVwdkgjNud1HrB36O32a5LXD7m8iNS2JKJXqzdduBpulixySIxGioPi9xOLaYzadz28we4N3iDsYinEJFkQLwFcLSqNrPuTeugRORLahcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGKCfpin; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C8CC19421;
	Fri, 10 Apr 2026 22:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775860723;
	bh=ldDYXPhVycWmCizNHMp/2airdFaZU0BtZeC3nGJ3CH0=;
	h=From:To:Cc:Subject:Date:From;
	b=kGKCfpinHin4UD3iGs4G21P8Lblhc9iHWhUGVGJFChtVpFYDsDZFs8BqAU33kTvcf
	 KKo+9C6SuAH6OGMZlli+ZN4qysdENIBIznDmv1z+buqwws4wWlYlfFCfZrsuUL7XQy
	 wrnieaEzxRvHLbxyH34xDgMLK7wzsoY+Iwp9LuqLszCS//99JOzKLEdvguvuACfySU
	 ab4POtr7DLIGROjXO+XqzO01ZprDdXR0Big+yqj3Dd1TS5eKypiANV8sWy0vBXXrKt
	 ehNXcq+F0cmpz3a/fI3Ay6XKK2a5dsvRZtXsYT5pD41zUFAO/BL1Uhsz9IVuBv0i7z
	 dUymPIUi3A90Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Val Packett <val@packett.cool>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	John Crispin <john@phrozen.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Pengyu Luo <mitltlatltl@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Prasanna Tolety <quic_ptolety@quicinc.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	White Lewis <liu224806@gmail.com>
Subject: [GIT PULL] Qualcomm clock updates for v7.1
Date: Fri, 10 Apr 2026 17:38:40 -0500
Message-ID: <20260410223840.3976134-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,oss.qualcomm.com,packett.cool,phrozen.org,gmail.com,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102751-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 502543DD458
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-7.1

for you to fetch changes up to a4f780cd5c7aa8c0d2d044ffd153f7a3a13ca81e:

  clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC (2026-04-08 21:00:09 -0500)

----------------------------------------------------------------
Qualcomm clock updates for v7.1

Add global TCSR, RPMh, and display clock controller support for the
Eliza platform.

Add TCSR, the multiple global, and the RPMh clock controller support
for the Nord platform.

Add GPU clock controller support for SM8750.

Introduce video and GPU clock controller support for Glymur.

Add global clock controller for IPQ5210.

Introduce various smaller display-related fixes across Kaanapali, Milos,
SC8280XP, SM4450, SM8250, and SA8775P.

Add missing GDSCs and fix retention flags for PCIe and USB power domains
on SC8180X. Also enable runtime PM support to ensure performance votes
are propagated to CX.

Mark the USB QTB clock as always-on on Hamoa, in order to ensure the
SMMU can work even when USB controller device is sleeping.

Add IPQ6018 and IPQ8074 support to the IPQ CMN PLL driver.

Add MDSS resets for SC7180, SM6115, and SM6125, to allow display
subsystem driver to reset the hardware from the state left by the
bootloader.

Introduce various cleanups across drivers.

----------------------------------------------------------------
Abel Vesa (3):
      clk: qcom: Add TCSR clock driver for Eliza
      clk: qcom: gcc-eliza: Enable FORCE_MEM_CORE_ON for UFS AXI PHY clock
      dt-bindings: clock: qcom: Add missing power-domains property

Bjorn Andersson (5):
      Merge branch '20260311-eliza-clocks-v6-1-453c4cf657a2@oss.qualcomm.com' into clk-for-7.1
      Merge branch '20260303034847.13870-2-val@packett.cool' into clk-for-7.1
      Merge branch '20260318-ipq5210_boot_to_shell-v2-1-a87e27c37070@oss.qualcomm.com' into clk-for-7.1
      Merge branch '20260319-clk-qcom-dispcc-eliza-v3-1-d1f2b19a6e6b@oss.qualcomm.com' into clk-for-7.1
      Merge branch '20260120-topic-7180_dispcc_bcr-v1-1-0b1b442156c3@oss.qualcomm.com' into clk-for-7.1

Dmitry Baryshkov (1):
      clk: qcom: dispcc-glymur: use RCG2 ops for DPTX1 AUX clock source

Jagadeesh Kona (1):
      clk: qcom: gcc-x1e80100: Keep GCC USB QTB clock always ON

John Crispin (5):
      clk: qcom: gcc-ipq6018: mark gcc_xo_clk_src as critical
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ6018
      clk: qcom: ipq-cmn-pll: Add IPQ6018 SoC support
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ8074
      clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support

Kathiravan Thirumoorthy (2):
      dt-bindings: clock: add Qualcomm IPQ5210 GCC
      clk: qcom: add Global Clock controller (GCC) driver for IPQ5210 SoC

Konrad Dybcio (9):
      clk: qcom: dispcc-glymur: Fix DSI byte clock rate setting
      clk: qcom: dispcc-kaanapali: Fix DSI byte clock rate setting
      clk: qcom: dispcc-milos: Fix DSI byte clock rate setting
      clk: qcom: dispcc-sm4450: Fix DSI byte clock rate setting
      clk: qcom: dispcc[01]-sa8775p: Fix DSI byte clock rate setting
      dt-bindings: clock: qcom,dispcc-sc7180: Define MDSS resets
      clk: qcom: dispcc-sc7180: Add missing MDSS resets
      dt-bindings: clock: qcom: Add SM8750 GPU clocks
      clk: qcom: Add a driver for SM8750 GPU clocks

Krzysztof Kozlowski (12):
      dt-bindings: clock: qcom,glymur-dispcc: De-acronymize SoC name
      clk: qcom: De-acronymize Glymur SoC name
      clk: qcom: kaanapali: Cleanup redundant header includes
      clk: qcom: glymur: Cleanup redundant header includes
      clk: qcom: sm8750: Cleanup redundant header includes
      clk: qcom: milos: Cleanup redundant header includes
      clk: qcom: eliza: Cleanup redundant header includes
      dt-bindings: clock: qcom,eliza-dispcc: Add Eliza SoC display CC
      clk: qcom: dispcc-eliza: Add Eliza display clock controller support
      clk: qcom: videocc-glymur: Constify qcom_cc_desc
      clk: qcom: Constify qcom_cc_driver_data
      clk: qcom: Constify list of critical CBCR registers

Pengyu Luo (2):
      clk: qcom: videocc-sm8350: use depend on instead of select
      clk: qcom: rcg2: expand frac table for mdss_pixel_clk_src

Prasanna Tolety (1):
      clk: qcom: rpmh: Add support for Nord rpmh clocks

Taniya Das (16):
      dt-bindings: clock: qcom: document the Glymur GPU Clock Controller
      clk: qcom: Add support for GPUCC and GXCLK for Glymur
      dt-bindings: clock: qcom: Add GCC video axi reset clock for Glymur
      dt-bindings: clock: qcom: Add video clock controller on Glymur SoC
      clk: qcom: gcc-glymur: Add video axi clock resets for glymur
      clk: qcom: videocc-glymur: Add video clock controller driver for Glymur
      dt-bindings: clock: qcom: document the Eliza Global Clock Controller
      dt-bindings: clock: qcom: Document the Eliza TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for Eliza
      clk: qcom: rpmh: Add support for Eliza rpmh clocks
      clk: qcom: Add support for Global clock controller on Eliza
      dt-bindings: clock: qcom: Document the Nord SoC TCSR Clock Controller
      dt-bindings: clock: qcom-rpmhcc: Add support for Nord SoCs
      dt-bindings: clock: qcom: Add Nord Global Clock Controller
      clk: qcom: Add TCSR clock driver for Nord SoC
      clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC

Val Packett (13):
      dt-bindings: clock: qcom,sm6115-dispcc: Define MDSS resets
      dt-bindings: clock: qcom,dispcc-sm6125: Define MDSS resets
      clk: qcom: dispcc-sm6115: Add missing MDSS resets
      clk: qcom: dispcc-sm6125: Add missing MDSS resets
      dt-bindings: clock: qcom,gcc-sc8180x: Add missing GDSCs
      clk: qcom: gcc-sc8180x: Add missing GDSCs
      clk: qcom: gcc-sc8180x: Use retention for USB power domains
      clk: qcom: gcc-sc8180x: Use retention for PCIe power domains
      clk: qcom: gcc-sc8180x: Enable runtime PM support
      clk: qcom: gcc-sc8180x: Refactor to use qcom_cc_driver_data
      clk: qcom: dispcc-sm8250: Use shared ops on the mdss vsync clk
      clk: qcom: dispcc-sm8250: Enable parents for pixel clocks
      clk: qcom: camcc-sc8180x: Refactor to use qcom_cc_driver_data

Vladimir Zapolskiy (1):
      clk: qcom: gdsc: Fix error path on registration of multiple pm subdomains

White Lewis (1):
      clk: qcom: dispcc-sc8280xp: remove CLK_SET_RATE_PARENT from byte_div_clk_src dividers

 .../bindings/clock/qcom,eliza-dispcc.yaml          |   96 +
 .../bindings/clock/qcom,glymur-dispcc.yaml         |    4 +-
 .../bindings/clock/qcom,ipq5210-gcc.yaml           |   62 +
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |    2 +
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |    2 +
 .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |   16 +-
 .../devicetree/bindings/clock/qcom,nord-gcc.yaml   |   58 +
 .../devicetree/bindings/clock/qcom,nord-negcc.yaml |   60 +
 .../devicetree/bindings/clock/qcom,nord-nwgcc.yaml |   55 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    2 +
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |   27 +-
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    4 +
 drivers/clk/qcom/Kconfig                           |   94 +-
 drivers/clk/qcom/Makefile                          |    9 +
 drivers/clk/qcom/apss-ipq5424.c                    |    2 +-
 drivers/clk/qcom/cambistmclkcc-kaanapali.c         |    6 +-
 drivers/clk/qcom/cambistmclkcc-sm8750.c            |    4 +-
 drivers/clk/qcom/camcc-kaanapali.c                 |    6 +-
 drivers/clk/qcom/camcc-milos.c                     |    4 +-
 drivers/clk/qcom/camcc-qcs615.c                    |    2 +-
 drivers/clk/qcom/camcc-sc8180x.c                   |   67 +-
 drivers/clk/qcom/camcc-sm8450.c                    |    4 +-
 drivers/clk/qcom/camcc-sm8550.c                    |    4 +-
 drivers/clk/qcom/camcc-sm8650.c                    |    4 +-
 drivers/clk/qcom/camcc-sm8750.c                    |    4 +-
 drivers/clk/qcom/camcc-x1e80100.c                  |    4 +-
 drivers/clk/qcom/clk-rcg2.c                        |    2 +
 drivers/clk/qcom/clk-rpmh.c                        |   46 +
 drivers/clk/qcom/common.h                          |    4 +-
 drivers/clk/qcom/dispcc-eliza.c                    | 2121 +++++++++++++
 drivers/clk/qcom/dispcc-glymur.c                   |   12 +-
 drivers/clk/qcom/dispcc-kaanapali.c                |    8 +-
 drivers/clk/qcom/dispcc-milos.c                    |    9 +-
 drivers/clk/qcom/dispcc-qcs615.c                   |    4 +-
 drivers/clk/qcom/dispcc-sc7180.c                   |    8 +
 drivers/clk/qcom/dispcc-sc8280xp.c                 |    4 -
 drivers/clk/qcom/dispcc-sm4450.c                   |    1 -
 drivers/clk/qcom/dispcc-sm6115.c                   |    7 +
 drivers/clk/qcom/dispcc-sm6125.c                   |    7 +
 drivers/clk/qcom/dispcc-sm8250.c                   |    6 +-
 drivers/clk/qcom/dispcc0-sa8775p.c                 |    2 -
 drivers/clk/qcom/dispcc1-sa8775p.c                 |    2 -
 drivers/clk/qcom/gcc-eliza.c                       | 3105 ++++++++++++++++++++
 drivers/clk/qcom/gcc-glymur.c                      |    8 +-
 drivers/clk/qcom/gcc-ipq5210.c                     | 2661 +++++++++++++++++
 drivers/clk/qcom/gcc-ipq6018.c                     |    2 +-
 drivers/clk/qcom/gcc-kaanapali.c                   |    5 +-
 drivers/clk/qcom/gcc-milos.c                       |    4 +-
 drivers/clk/qcom/gcc-nord.c                        | 1902 ++++++++++++
 drivers/clk/qcom/gcc-sc8180x.c                     |  126 +-
 drivers/clk/qcom/gcc-x1e80100.c                    |    1 +
 drivers/clk/qcom/gdsc.c                            |   12 +-
 drivers/clk/qcom/gpucc-glymur.c                    |  618 ++++
 drivers/clk/qcom/gpucc-kaanapali.c                 |    5 +-
 drivers/clk/qcom/gpucc-milos.c                     |    4 +-
 drivers/clk/qcom/gpucc-qcs615.c                    |    4 +-
 drivers/clk/qcom/gpucc-sm8750.c                    |  473 +++
 drivers/clk/qcom/gxclkctl-kaanapali.c              |    3 +-
 drivers/clk/qcom/ipq-cmn-pll.c                     |   16 +
 drivers/clk/qcom/negcc-nord.c                      | 1987 +++++++++++++
 drivers/clk/qcom/nwgcc-nord.c                      |  688 +++++
 drivers/clk/qcom/segcc-nord.c                      | 1609 ++++++++++
 drivers/clk/qcom/tcsrcc-eliza.c                    |  179 ++
 drivers/clk/qcom/tcsrcc-glymur.c                   |    3 +-
 drivers/clk/qcom/tcsrcc-kaanapali.c                |    1 -
 drivers/clk/qcom/tcsrcc-nord.c                     |  337 +++
 drivers/clk/qcom/tcsrcc-sm8750.c                   |    2 +-
 drivers/clk/qcom/videocc-glymur.c                  |  532 ++++
 drivers/clk/qcom/videocc-kaanapali.c               |    4 +-
 drivers/clk/qcom/videocc-milos.c                   |    4 +-
 drivers/clk/qcom/videocc-qcs615.c                  |    4 +-
 drivers/clk/qcom/videocc-sm8450.c                  |    4 +-
 drivers/clk/qcom/videocc-sm8550.c                  |    4 +-
 drivers/clk/qcom/videocc-sm8750.c                  |    5 +-
 include/dt-bindings/clock/qcom,dispcc-sc7180.h     |    7 +-
 include/dt-bindings/clock/qcom,dispcc-sm6125.h     |    6 +-
 include/dt-bindings/clock/qcom,eliza-dispcc.h      |  118 +
 include/dt-bindings/clock/qcom,eliza-gcc.h         |  210 ++
 include/dt-bindings/clock/qcom,eliza-tcsr.h        |   17 +
 include/dt-bindings/clock/qcom,gcc-sc8180x.h       |    5 +
 include/dt-bindings/clock/qcom,glymur-gcc.h        |    1 +
 include/dt-bindings/clock/qcom,glymur-gpucc.h      |   51 +
 include/dt-bindings/clock/qcom,glymur-videocc.h    |   45 +
 include/dt-bindings/clock/qcom,ipq5210-gcc.h       |  126 +
 include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h   |   15 +
 include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h   |   15 +
 include/dt-bindings/clock/qcom,nord-gcc.h          |  147 +
 include/dt-bindings/clock/qcom,nord-negcc.h        |  124 +
 include/dt-bindings/clock/qcom,nord-nwgcc.h        |   69 +
 include/dt-bindings/clock/qcom,nord-segcc.h        |   98 +
 include/dt-bindings/clock/qcom,nord-tcsrcc.h       |   26 +
 include/dt-bindings/clock/qcom,sm6115-dispcc.h     |    7 +-
 include/dt-bindings/clock/qcom,sm8750-gpucc.h      |   50 +
 include/dt-bindings/reset/qcom,ipq5210-gcc.h       |  127 +
 95 files changed, 18239 insertions(+), 185 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,eliza-dispcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq5210-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,nord-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,nord-negcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,nord-nwgcc.yaml
 create mode 100644 drivers/clk/qcom/dispcc-eliza.c
 create mode 100644 drivers/clk/qcom/gcc-eliza.c
 create mode 100644 drivers/clk/qcom/gcc-ipq5210.c
 create mode 100644 drivers/clk/qcom/gcc-nord.c
 create mode 100644 drivers/clk/qcom/gpucc-glymur.c
 create mode 100644 drivers/clk/qcom/gpucc-sm8750.c
 create mode 100644 drivers/clk/qcom/negcc-nord.c
 create mode 100644 drivers/clk/qcom/nwgcc-nord.c
 create mode 100644 drivers/clk/qcom/segcc-nord.c
 create mode 100644 drivers/clk/qcom/tcsrcc-eliza.c
 create mode 100644 drivers/clk/qcom/tcsrcc-nord.c
 create mode 100644 drivers/clk/qcom/videocc-glymur.c
 create mode 100644 include/dt-bindings/clock/qcom,eliza-dispcc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,eliza-tcsr.h
 create mode 100644 include/dt-bindings/clock/qcom,glymur-gpucc.h
 create mode 100644 include/dt-bindings/clock/qcom,glymur-videocc.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq5210-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq6018-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq8074-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-negcc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-nwgcc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-segcc.h
 create mode 100644 include/dt-bindings/clock/qcom,nord-tcsrcc.h
 create mode 100644 include/dt-bindings/clock/qcom,sm8750-gpucc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq5210-gcc.h

