Return-Path: <linux-arm-msm+bounces-88178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1755AD071FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 05:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F07D93041CD6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 04:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CCEE2E0407;
	Fri,  9 Jan 2026 04:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJ3f927r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47FB1DF751
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 04:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767933260; cv=none; b=emGQw3RK9FrMFwVLtUsNXOOvibiHSXQp2PmLtcakLveFgf6ghODp4zQ1fDgH1dWbtY9m907bzBGL+IUyKI6H8c6I8YrXJ6DLAUvryUxsUr2YLPf1v3AsV7sOtKzqJE1kx1jgAOO6C6ZNOp3lhiiPCpfBafEAsqwZgfSTboleEu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767933260; c=relaxed/simple;
	bh=33yXA5X84j5X2Inou2mkRLIGkYkMufZN/4mCs7fNPZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eYrMNVg1wxJbJjkfZzVLNcYWWu123p8TpswSfkGy2WXkzECeiebj6kCXmScAsRg4Rt6+uxQrEEujO5nXOmrzh9apwnfrbYJ7Dq2Us07l/yNyjiyPj6VG8VSTj3A7IWYXzpfHH1toavuEaaiTnig/9zQjdQeMBeEjgSnePRUA95E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJ3f927r; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-459993ff4fcso1578022b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 20:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767933257; x=1768538057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACJISfP21Ie/BirwtcA8KH1aWZAyhx+gs7w+TQSqs7A=;
        b=LJ3f927rUHfDTHZXGgips25MsTXisMaRCWjM87ViSA8CKGhwW3fDfPKvecehunT69G
         rS9f2BAvaBuEqpvJsZErCT4tnIRml21HTo5RxsM5GyYWvUdJN6iILHdRgrT2a7GbdMSR
         6EDvJ17kQxvahTVndzH/VQ+ZGXJag7c+jwnKbb2yHvYRWpz6+Ycqw2xcqXlWBzdfWYIi
         Z4zbIqo2P1qNXPCiOVzmMcd4L7r1Dl6TDyKB7imbtqDmLu6n1KwR5lbYv3hOGw6yakpV
         TVgAUF1Xvg8jccPdhN9UADF6P/mwhSjeKArfyEHkI2ECxDNvcLFOo7O693D0dK9Axbti
         N30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767933257; x=1768538057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ACJISfP21Ie/BirwtcA8KH1aWZAyhx+gs7w+TQSqs7A=;
        b=i42OFu/1uQSveLIkot1Ga4pW+zvN3V2tE6fc9vWvDheY03IS3PODTVMdLiKHyPyt+Q
         QShO7jEpTQevQ2f9DeTpRDSZWyljTsncs2pn+vZNl3yemy2aSmXT1oQf6YmB+HY2jtKB
         mEowexGGpeYi9K/mK5ftg2yxWi5BgXmwWvYWvZ2Fi8f3yTbXLk/F2moGJ7qm4/V+0+U/
         wq3Xf4IJn4XR6JtlaXHW7hUTNVoPmEV+yghSUKR9gkTi9nTu7vHIvqtA42U0k7dVfLVX
         iMHoQcVU437nhD7fdaOIlqG8yNuOAx1yKVfRCn/YEuJSmedPB6yLtKEyVzGPV2/Bgk+O
         QPhw==
X-Forwarded-Encrypted: i=1; AJvYcCWX6EIOiI90a17+uDDBBZFEU+UQGzB9xAk1+cMB2ojv0XIdUGIWYUUdEwQXGrMkC2VCG9pHRvVVfq1M3wo4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0RB6BEb8s7TN2RTxuUoAEyr0rjOj0Eb7mgdDhkC/im+8yYPCv
	76Yxq0lcrtDXDbXbeJYZp5cdlEbdGOo1yXlduab28OKSZd1ocVGkilel
X-Gm-Gg: AY/fxX4HHxxwfnaPvXZNxKVWpwZpF+ksw+55hbv5N04lb2UX96UTlOhmmVGH/JqIo2D
	dmYbl3WDeRQx4BPiHjTqpnFsp3TBjQ7mZuWdIE2xVsT8w/dTKQc49dbhxSq2kAw3EhqUTvtt8FA
	Dv0RaGZq8CG9AV+Pl7g3igr2mtxlzUgwBAE9BuCGFBVp8ugmru7x6Wn8pUU1HghFYeDd6eBuZHr
	7tl1FhvRZIizm0aetDBUnXK+rydDhjiL124k9UeI0QccqlbOU9nQ/f3R6MwMWH8v5xv7cKOrxoB
	n7Ypzwglpyu+fjpRUG2Ok6LsVS9cV2gFuliDSZ/Hcld42iXo7EpRA2BUsToJ8/YY5G94K1AGIkd
	8g1eLMFH5jcIt/Qx8ceaavcHUWjp8LAYeaZ/BopcgoGpj6b0igub9zN0mgidSw0G5YIFfBhi893
	jfXpWjiuLzTxsIv+nWpn773YluI6WW8aqHttVkwpUoL9+PO4xEitqFf/Ihybg/oaZTgZtqKCJU8
	OxRm3XOjJaeMZYPxpZjzggen5yD
X-Google-Smtp-Source: AGHT+IFakqTn0habHQ1az5nQ3iemziN1LC+QmeJFnnM1u9UYtigokv/161u0WDt+GH4sb3tQjnF0cA==
X-Received: by 2002:a05:6808:1311:b0:450:d693:4d2d with SMTP id 5614622812f47-45a6bebb60emr4317159b6e.33.1767933256577;
        Thu, 08 Jan 2026 20:34:16 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa515f4dasm6274421fac.21.2026.01.08.20.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 20:34:15 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	krzk+dt@kernel.org,
	mturquette@baylibre.com,
	linux-remoteproc@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>
Cc: mathieu.poirier@linaro.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	p.zabel@pengutronix.de,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: [PATCH v2 6/9] clk: qcom: gcc-ipq9574: add wcss remoteproc clocks
Date: Thu,  8 Jan 2026 22:33:41 -0600
Message-ID: <20260109043352.3072933-7-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
References: <20260109043352.3072933-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit fa1d525404b6 ("clk: qcom: ipq9574: remove q6 bring up clocks")
removed these clocks on the idea that Q6 firmware is responsible for
clock bringup. That statement seems incorrect, as these clocks need to
be enabled before the Q6 is booted. Otherwise, the host CPU core that
starts the Q6 hangs.

Perhaps the statement meant that the TrustZone firmware will start the
clocks. This only happens in PAS mode. Under native OS loading, the
host needs to enable these clocks, so add them back.

Besides the clocks that were erroneously removed, also add defines for
GCC_WCSS_AHB_S_CLK, GCC_WCSS_AXI_M_CLK, and GCC_Q6_AXIM2_CLK. These
clocks are required in order to operate the remoteproc.

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 drivers/clk/qcom/gcc-ipq9574.c | 378 +++++++++++++++++++++++++++++++++
 1 file changed, 378 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq9574.c b/drivers/clk/qcom/gcc-ipq9574.c
index 6dc86e686de4..aef5ed5cd9f5 100644
--- a/drivers/clk/qcom/gcc-ipq9574.c
+++ b/drivers/clk/qcom/gcc-ipq9574.c
@@ -2659,6 +2659,24 @@ static struct clk_rcg2 system_noc_bfdcd_clk_src = {
 	},
 };
 
+static struct clk_branch gcc_q6ss_boot_clk = {
+	.halt_reg = 0x25080,
+	.halt_check = BRANCH_HALT_SKIP,
+	.clkr = {
+		.enable_reg = 0x25080,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_q6ss_boot_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&system_noc_bfdcd_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_nssnoc_snoc_clk = {
 	.halt_reg = 0x17028,
 	.clkr = {
@@ -2729,6 +2747,108 @@ static struct clk_rcg2 wcss_ahb_clk_src = {
 	},
 };
 
+static struct clk_branch gcc_q6_ahb_clk = {
+	.halt_reg = 0x25014,
+	.clkr = {
+		.enable_reg = 0x25014,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_q6_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&wcss_ahb_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_q6_ahb_s_clk = {
+	.halt_reg = 0x25018,
+	.clkr = {
+		.enable_reg = 0x25018,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_q6_ahb_s_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&wcss_ahb_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_ecahb_clk = {
+	.halt_reg = 0x25058,
+	.clkr = {
+		.enable_reg = 0x25058,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_wcss_ecahb_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&wcss_ahb_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_acmt_clk = {
+	.halt_reg = 0x2505c,
+	.clkr = {
+		.enable_reg = 0x2505c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_wcss_acmt_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&wcss_ahb_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+
+static struct clk_branch gcc_wcss_ahb_s_clk = {
+	.halt_reg = 0x25060,
+	.clkr = {
+		.enable_reg = 0x25060,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_wcss_ahb_s_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+					&wcss_ahb_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_sys_noc_wcss_ahb_clk = {
+	.halt_reg = 0x2e030,
+	.clkr = {
+		.enable_reg = 0x2e030,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_sys_noc_wcss_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&wcss_ahb_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static const struct freq_tbl ftbl_wcss_axi_m_clk_src[] = {
 	F(24000000, P_XO, 1, 0, 0),
 	F(133333333, P_GPLL0, 6, 0, 0),
@@ -2749,6 +2869,39 @@ static struct clk_rcg2 wcss_axi_m_clk_src = {
 	},
 };
 
+static struct clk_branch gcc_wcss_axi_m_clk = {
+	.halt_reg = 0x25064,
+	.clkr = {
+		.enable_reg = 0x25064,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_wcss_axi_m_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+					&wcss_axi_m_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_anoc_wcss_axi_m_clk = {
+	.halt_reg = 0x2e0a8,
+	.clkr = {
+		.enable_reg = 0x2e0a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_anoc_wcss_axi_m_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&wcss_axi_m_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static const struct freq_tbl ftbl_qdss_at_clk_src[] = {
 	F(240000000, P_GPLL4, 5, 0, 0),
 	{ }
@@ -2767,6 +2920,40 @@ static struct clk_rcg2 qdss_at_clk_src = {
 	},
 };
 
+static struct clk_branch gcc_q6ss_atbm_clk = {
+	.halt_reg = 0x2501c,
+	.clkr = {
+		.enable_reg = 0x2501c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_q6ss_atbm_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&qdss_at_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_dbg_ifc_atb_clk = {
+	.halt_reg = 0x2503c,
+	.clkr = {
+		.enable_reg = 0x2503c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_wcss_dbg_ifc_atb_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&qdss_at_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_nssnoc_atb_clk = {
 	.halt_reg = 0x17014,
 	.clkr = {
@@ -3003,6 +3190,40 @@ static struct clk_fixed_factor qdss_tsctr_div2_clk_src = {
 	},
 };
 
+static struct clk_branch gcc_q6_tsctr_1to2_clk = {
+	.halt_reg = 0x25020,
+	.clkr = {
+		.enable_reg = 0x25020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_q6_tsctr_1to2_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&qdss_tsctr_div2_clk_src.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_dbg_ifc_nts_clk = {
+	.halt_reg = 0x25040,
+	.clkr = {
+		.enable_reg = 0x25040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_wcss_dbg_ifc_nts_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&qdss_tsctr_div2_clk_src.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_qdss_tsctr_div2_clk = {
 	.halt_reg = 0x2d044,
 	.clkr = {
@@ -3177,6 +3398,74 @@ static struct clk_branch gcc_qdss_tsctr_div16_clk = {
 	},
 };
 
+static struct clk_branch gcc_q6ss_pclkdbg_clk = {
+	.halt_reg = 0x25024,
+	.clkr = {
+		.enable_reg = 0x25024,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_q6ss_pclkdbg_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&qdss_dap_sync_clk_src.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_q6ss_trig_clk = {
+	.halt_reg = 0x25068,
+	.clkr = {
+		.enable_reg = 0x25068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_q6ss_trig_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&qdss_dap_sync_clk_src.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_dbg_ifc_apb_clk = {
+	.halt_reg = 0x25038,
+	.clkr = {
+		.enable_reg = 0x25038,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_wcss_dbg_ifc_apb_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&qdss_dap_sync_clk_src.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_dbg_ifc_dapbus_clk = {
+	.halt_reg = 0x25044,
+	.clkr = {
+		.enable_reg = 0x25044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_wcss_dbg_ifc_dapbus_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&qdss_dap_sync_clk_src.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_qdss_dap_clk = {
 	.halt_reg = 0x2d058,
 	.clkr = {
@@ -3298,6 +3587,58 @@ static struct clk_rcg2 q6_axi_clk_src = {
 	},
 };
 
+static struct clk_branch gcc_q6_axim_clk = {
+	.halt_reg = 0x2500c,
+	.clkr = {
+		.enable_reg = 0x2500c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_q6_axim_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&q6_axi_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_wcss_q6_tbu_clk = {
+	.halt_reg = 0x12050,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0xb00c,
+		.enable_mask = BIT(6),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_wcss_q6_tbu_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&q6_axi_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mem_noc_q6_axi_clk = {
+	.halt_reg = 0x19010,
+	.clkr = {
+		.enable_reg = 0x19010,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_mem_noc_q6_axi_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&q6_axi_clk_src.clkr.hw
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static const struct freq_tbl ftbl_q6_axim2_clk_src[] = {
 	F(342857143, P_GPLL4, 3.5, 0, 0),
 	{ }
@@ -3323,6 +3664,22 @@ static struct clk_rcg2 q6_axim2_clk_src = {
 	},
 };
 
+static struct clk_branch gcc_q6_axim2_clk = {
+	.halt_reg = 0x25010,
+	.clkr = {
+		.enable_reg = 0x25010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_q6_axim2_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+					&q6_axim2_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static const struct freq_tbl ftbl_nssnoc_memnoc_bfdcd_clk_src[] = {
 	F(533333333, P_GPLL0, 1.5, 0, 0),
 	{ }
@@ -3847,8 +4204,18 @@ static struct clk_regmap *gcc_ipq9574_clks[] = {
 	[GCC_NSSNOC_SNOC_1_CLK] = &gcc_nssnoc_snoc_1_clk.clkr,
 	[GCC_QDSS_ETR_USB_CLK] = &gcc_qdss_etr_usb_clk.clkr,
 	[WCSS_AHB_CLK_SRC] = &wcss_ahb_clk_src.clkr,
+	[GCC_Q6_AHB_CLK] = &gcc_q6_ahb_clk.clkr,
+	[GCC_Q6_AHB_S_CLK] = &gcc_q6_ahb_s_clk.clkr,
+	[GCC_WCSS_ECAHB_CLK] = &gcc_wcss_ecahb_clk.clkr,
+	[GCC_WCSS_ACMT_CLK] = &gcc_wcss_acmt_clk.clkr,
+	[GCC_WCSS_AHB_S_CLK] = &gcc_wcss_ahb_s_clk.clkr,
+	[GCC_SYS_NOC_WCSS_AHB_CLK] = &gcc_sys_noc_wcss_ahb_clk.clkr,
 	[WCSS_AXI_M_CLK_SRC] = &wcss_axi_m_clk_src.clkr,
+	[GCC_WCSS_AXI_M_CLK] = &gcc_wcss_axi_m_clk.clkr,
+	[GCC_ANOC_WCSS_AXI_M_CLK] = &gcc_anoc_wcss_axi_m_clk.clkr,
 	[QDSS_AT_CLK_SRC] = &qdss_at_clk_src.clkr,
+	[GCC_Q6SS_ATBM_CLK] = &gcc_q6ss_atbm_clk.clkr,
+	[GCC_WCSS_DBG_IFC_ATB_CLK] = &gcc_wcss_dbg_ifc_atb_clk.clkr,
 	[GCC_NSSNOC_ATB_CLK] = &gcc_nssnoc_atb_clk.clkr,
 	[GCC_QDSS_AT_CLK] = &gcc_qdss_at_clk.clkr,
 	[GCC_SYS_NOC_AT_CLK] = &gcc_sys_noc_at_clk.clkr,
@@ -3861,19 +4228,29 @@ static struct clk_regmap *gcc_ipq9574_clks[] = {
 	[QDSS_TRACECLKIN_CLK_SRC] = &qdss_traceclkin_clk_src.clkr,
 	[GCC_QDSS_TRACECLKIN_CLK] = &gcc_qdss_traceclkin_clk.clkr,
 	[QDSS_TSCTR_CLK_SRC] = &qdss_tsctr_clk_src.clkr,
+	[GCC_Q6_TSCTR_1TO2_CLK] = &gcc_q6_tsctr_1to2_clk.clkr,
+	[GCC_WCSS_DBG_IFC_NTS_CLK] = &gcc_wcss_dbg_ifc_nts_clk.clkr,
 	[GCC_QDSS_TSCTR_DIV2_CLK] = &gcc_qdss_tsctr_div2_clk.clkr,
 	[GCC_QDSS_TS_CLK] = &gcc_qdss_ts_clk.clkr,
 	[GCC_QDSS_TSCTR_DIV4_CLK] = &gcc_qdss_tsctr_div4_clk.clkr,
 	[GCC_NSS_TS_CLK] = &gcc_nss_ts_clk.clkr,
 	[GCC_QDSS_TSCTR_DIV8_CLK] = &gcc_qdss_tsctr_div8_clk.clkr,
 	[GCC_QDSS_TSCTR_DIV16_CLK] = &gcc_qdss_tsctr_div16_clk.clkr,
+	[GCC_Q6SS_PCLKDBG_CLK] = &gcc_q6ss_pclkdbg_clk.clkr,
+	[GCC_Q6SS_TRIG_CLK] = &gcc_q6ss_trig_clk.clkr,
+	[GCC_WCSS_DBG_IFC_APB_CLK] = &gcc_wcss_dbg_ifc_apb_clk.clkr,
+	[GCC_WCSS_DBG_IFC_DAPBUS_CLK] = &gcc_wcss_dbg_ifc_dapbus_clk.clkr,
 	[GCC_QDSS_DAP_CLK] = &gcc_qdss_dap_clk.clkr,
 	[GCC_QDSS_APB2JTAG_CLK] = &gcc_qdss_apb2jtag_clk.clkr,
 	[GCC_QDSS_TSCTR_DIV3_CLK] = &gcc_qdss_tsctr_div3_clk.clkr,
 	[QPIC_IO_MACRO_CLK_SRC] = &qpic_io_macro_clk_src.clkr,
 	[GCC_QPIC_IO_MACRO_CLK] = &gcc_qpic_io_macro_clk.clkr,
 	[Q6_AXI_CLK_SRC] = &q6_axi_clk_src.clkr,
+	[GCC_Q6_AXIM_CLK] = &gcc_q6_axim_clk.clkr,
+	[GCC_WCSS_Q6_TBU_CLK] = &gcc_wcss_q6_tbu_clk.clkr,
+	[GCC_MEM_NOC_Q6_AXI_CLK] = &gcc_mem_noc_q6_axi_clk.clkr,
 	[Q6_AXIM2_CLK_SRC] = &q6_axim2_clk_src.clkr,
+	[GCC_Q6_AXIM2_CLK] = &gcc_q6_axim2_clk.clkr,
 	[NSSNOC_MEMNOC_BFDCD_CLK_SRC] = &nssnoc_memnoc_bfdcd_clk_src.clkr,
 	[GCC_NSSNOC_MEMNOC_CLK] = &gcc_nssnoc_memnoc_clk.clkr,
 	[GCC_NSSNOC_MEM_NOC_1_CLK] = &gcc_nssnoc_mem_noc_1_clk.clkr,
@@ -3896,6 +4273,7 @@ static struct clk_regmap *gcc_ipq9574_clks[] = {
 	[GCC_UNIPHY1_SYS_CLK] = &gcc_uniphy1_sys_clk.clkr,
 	[GCC_UNIPHY2_SYS_CLK] = &gcc_uniphy2_sys_clk.clkr,
 	[GCC_CMN_12GPLL_SYS_CLK] = &gcc_cmn_12gpll_sys_clk.clkr,
+	[GCC_Q6SS_BOOT_CLK] = &gcc_q6ss_boot_clk.clkr,
 	[UNIPHY_SYS_CLK_SRC] = &uniphy_sys_clk_src.clkr,
 	[NSS_TS_CLK_SRC] = &nss_ts_clk_src.clkr,
 	[GCC_ANOC_PCIE0_1LANE_M_CLK] = &gcc_anoc_pcie0_1lane_m_clk.clkr,
-- 
2.45.1


