Return-Path: <linux-arm-msm+bounces-112977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k4p8Gb+MLGrsSQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112977-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 00:48:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CED67CE49
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 00:48:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="Wzq/qGDw";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112977-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112977-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 750A2301641C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2026 22:48:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB50356755;
	Fri, 12 Jun 2026 22:48:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B51E279DAF;
	Fri, 12 Jun 2026 22:48:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304509; cv=none; b=kXSBWO1EsI7waY94mzWFBYuQMapwJDkzpHCnlNZ3KzdMqoXw7GM6zKiq8JtpYA/gf3YgIGVYSixKvBUi5PdlXJ38+77/pnzxLWL26PZkD4jOgehka05NP9epboQ9la7KwtsallGAv8f2sTejkzXK4FlVGrWUfh3AOpMoJp5BIhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304509; c=relaxed/simple;
	bh=uUPK1oL43rZp+FmOduw8qffMAXDz3BLy4nu4METhBrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sKyuXApo/2JW4qNIz5YPfc+0RzLZZ9wAYU6QPEEqFvbRHe9j6+X8DLRhdSQKx0F8OY0K8z8/chBCXRQ+deAQAza0OMvnovnEDtCur+BGDiuVM1giqizU/BpUdgwje7mInEr2rmj7+VIxS5v2CjKAnmuM/bSkPPlyxbZOcbCymHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wzq/qGDw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07BC41F000E9;
	Fri, 12 Jun 2026 22:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781304508;
	bh=sZ8zv1h9vTqxIWN/kyWnqAytOew5Axzx7GoxuJXRb+s=;
	h=From:To:Cc:Subject:Date;
	b=Wzq/qGDwR/S27eZeXfUkKaYYM9YhvcxpaWjonZHZ1+5OQDSWgs1xXto6u+vMvAxf7
	 pFVrfjMLlN3l2nxNXrqL1opIh+HgqkzrSCyKW7s3sdxE3iS4nP/b0442fwkgNG2EiC
	 zqKug41i1HlGtnEaLk7HKqz0VdOHVEudtly81GfgCCADTgldRbf8xtmvbk2LUAv+ku
	 2AxUgW7gRvfSW4qSHiQJfv0FKDHSXpklXbWnvNnJfYKRfwjS3F0gxULF6mlpAoYsLQ
	 A7RavZtrbSNO85p7krTiyvFD1rMSkBiQpz807Of22d0npfxyNKZdF3qz0xn05JA62z
	 LqM44TQ1p9/Zw==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Luo Jie <jie.luo@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
	Alexander Koskovich <akoskovich@pm.me>,
	Biswapriyo Nath <nathbappai@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Phillip Varney <pbvarney@protonmail.com>
Subject: [GIT PULL] Qualcomm clock updates for v7.2
Date: Fri, 12 Jun 2026 17:48:25 -0500
Message-ID: <20260612224825.852551-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112977-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:sboyd@kernel.org,m:linux-clk@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:vivek.aknurwar@oss.qualcomm.com,m:luca.weiss@fairphone.com,m:jagadeesh.kona@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:jie.luo@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:akoskovich@pm.me,m:nathbappai@gmail.com,m:konrad.dybcio@oss.qualcomm.com,m:pbvarney@protonmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,oss.qualcomm.com,fairphone.com,pm.me,gmail.com,protonmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01CED67CE49


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-for-7.2

for you to fetch changes up to e108373c54fbc844b7f541c6fd7ecb31772afd3c:

  clk: qcom: regmap-phy-mux: Rework the implementation (2026-06-08 09:17:24 -0500)

----------------------------------------------------------------
Qualcomm clock updates for v7.2

Introduce global, TCSR, and RPMh clock controllers for the Hawi mobile
SoC.

Introduce GX clock for Milos, and ensure that camera clock controller
votes for interconnect bandwidth in order to ensure the TOP_GDSC can be
turned on.

Introduce camera and video clock controllers for Hamoa and Purwa. Reduce
the max_register of the display clock controller to avoid regmap
attemting to dump protected registers.

Introduce global clock controller for the IPQ9650 SoC and add IPQ5332
support to the cmnpll driver.

Add missing USB2 PHY reset to the Nord NegCC.

Rework the PHY mux clock implementation as necessary for upcoming USB4
support.

----------------------------------------------------------------
Alexander Koskovich (1):
      clk: qcom: clk-rpmh: Make all VRMs optional

Bartosz Golaszewski (2):
      dt-bindings: clock: qcom: add the definition for the USB2 PHY reset
      clk: qcom: nord: negcc: add support for the USB2 PHY reset

Biswapriyo Nath (1):
      dt-bindings: clock: qcom,sm6125-dispcc: reference qcom,gcc.yaml

Bjorn Andersson (2):
      Merge branch '20260507-ipq9650_boot_to_shell-v3-1-62742b49c991@oss.qualcomm.com' into clk-for-7.2
      Merge branch '20260106-qcom_ipq5332_cmnpll-v2-2-f9f7e4efbd79@oss.qualcomm.com' into clk-for-7.2

Jagadeesh Kona (5):
      dt-bindings: clock: qcom: Add X1P42100 video clock controller
      dt-bindings: clock: qcom: Add X1P42100 camera clock controller
      clk: qcom: videocc-x1p42100: Add support for video clock controller
      clk: qcom: camcc-x1e80100: Add support for camera QDSS debug clocks
      clk: qcom: camcc-x1p42100: Add support for camera clock controller

Kathiravan Thirumoorthy (2):
      dt-bindings: clock: add Qualcomm IPQ9650 GCC
      clk: qcom: add Global Clock controller (GCC) driver for IPQ9650 SoC

Konrad Dybcio (1):
      clk: qcom: regmap-phy-mux: Rework the implementation

Krzysztof Kozlowski (3):
      clk: qcom: dispcc-x1e80100: Fix (possibly) dumping regmap
      clk: qcom: Constify qcom_cc_driver_data and list of critical CBCR registers
      dt-bindings: clock: qcom,kaanapali-gxclkctl: Correctly use additionalProperties

Luca Weiss (6):
      dt-bindings: clock: qcom: document the Milos GX clock controller
      clk: qcom: Add support for GXCLK for Milos
      interconnect: Add devm_of_icc_get_by_index() as exported API for users
      dt-bindings: clock: qcom,milos-camcc: Document interconnect path
      clk: qcom: gdsc: Support enabling interconnect path for power domain
      clk: qcom: camcc-milos: Declare icc path dependency for CAMSS_TOP_GDSC

Luo Jie (3):
      dt-bindings: clock: qcom: Add CMN PLL support for IPQ5332 SoC
      clk: qcom: cmnpll: Account for reference clock divider
      clk: qcom: cmnpll: Add IPQ5332 SoC support

Phillip Varney (1):
      clk: qcom: a53: Corrected frequency multiplier for 1152MHz

Vivek Aknurwar (7):
      dt-bindings: clock: qcom-rpmhcc: Add RPMHCC bindings for Hawi
      dt-bindings: clock: qcom: Add Hawi TCSR clock controller
      dt-bindings: clock: qcom: Add Hawi global clock controller
      clk: qcom: rpmh: Add support for Hawi RPMH clocks
      clk: qcom: Add Hawi TCSR clock controller driver
      clk: qcom: clk-alpha-pll: Add support for Taycan EHA_T PLL
      clk: qcom: Add support for global clock controller on Hawi

 .../bindings/clock/qcom,dispcc-sm6125.yaml         |   17 +-
 .../devicetree/bindings/clock/qcom,hawi-gcc.yaml   |   63 +
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |    1 +
 .../bindings/clock/qcom,ipq9650-gcc.yaml           |   68 +
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    |    2 +-
 .../bindings/clock/qcom,milos-camcc.yaml           |    8 +
 .../bindings/clock/qcom,milos-gxclkctl.yaml        |   61 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8450-videocc.yaml        |    3 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    2 +
 .../bindings/clock/qcom,x1e80100-camcc.yaml        |    1 +
 drivers/clk/qcom/Kconfig                           |   48 +
 drivers/clk/qcom/Makefile                          |    7 +-
 drivers/clk/qcom/a53-pll.c                         |    2 +-
 drivers/clk/qcom/camcc-milos.c                     |    7 +
 drivers/clk/qcom/camcc-x1e80100.c                  |   64 +
 drivers/clk/qcom/camcc-x1p42100.c                  | 2223 ++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/clk-regmap-phy-mux.c              |   52 +-
 drivers/clk/qcom/clk-rpmh.c                        |   41 +-
 drivers/clk/qcom/dispcc-x1e80100.c                 |    2 +-
 drivers/clk/qcom/gcc-hawi.c                        | 3657 ++++++++++++++++++++
 drivers/clk/qcom/gcc-ipq9650.c                     | 3445 ++++++++++++++++++
 drivers/clk/qcom/gcc-nord.c                        |    2 +-
 drivers/clk/qcom/gdsc.c                            |   33 +
 drivers/clk/qcom/gdsc.h                            |    5 +
 drivers/clk/qcom/gpucc-sm8750.c                    |    4 +-
 drivers/clk/qcom/gxclkctl-kaanapali.c              |    1 +
 drivers/clk/qcom/ipq-cmn-pll.c                     |   30 +-
 drivers/clk/qcom/negcc-nord.c                      |    3 +-
 drivers/clk/qcom/nwgcc-nord.c                      |    4 +-
 drivers/clk/qcom/segcc-nord.c                      |    2 +-
 drivers/clk/qcom/tcsrcc-hawi.c                     |  158 +
 drivers/clk/qcom/videocc-x1p42100.c                |  585 ++++
 drivers/interconnect/core.c                        |   20 +
 include/dt-bindings/clock/qcom,hawi-gcc.h          |  253 ++
 include/dt-bindings/clock/qcom,hawi-tcsrcc.h       |   16 +
 include/dt-bindings/clock/qcom,ipq5332-cmn-pll.h   |   19 +
 include/dt-bindings/clock/qcom,ipq9650-gcc.h       |  172 +
 include/dt-bindings/clock/qcom,nord-negcc.h        |    1 +
 include/dt-bindings/clock/qcom,rpmh.h              |    2 +
 include/dt-bindings/clock/qcom,x1e80100-camcc.h    |    3 +
 include/dt-bindings/clock/qcom,x1p42100-videocc.h  |   48 +
 include/dt-bindings/reset/qcom,ipq9650-gcc.h       |  215 ++
 include/linux/interconnect.h                       |    6 +
 45 files changed, 11313 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,hawi-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,ipq9650-gcc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,milos-gxclkctl.yaml
 create mode 100644 drivers/clk/qcom/camcc-x1p42100.c
 create mode 100644 drivers/clk/qcom/gcc-hawi.c
 create mode 100644 drivers/clk/qcom/gcc-ipq9650.c
 create mode 100644 drivers/clk/qcom/tcsrcc-hawi.c
 create mode 100644 drivers/clk/qcom/videocc-x1p42100.c
 create mode 100644 include/dt-bindings/clock/qcom,hawi-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,hawi-tcsrcc.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq5332-cmn-pll.h
 create mode 100644 include/dt-bindings/clock/qcom,ipq9650-gcc.h
 create mode 100644 include/dt-bindings/clock/qcom,x1p42100-videocc.h
 create mode 100644 include/dt-bindings/reset/qcom,ipq9650-gcc.h

