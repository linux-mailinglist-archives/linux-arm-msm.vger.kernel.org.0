Return-Path: <linux-arm-msm+bounces-85772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 11685CCE735
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 05:35:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F336D30332A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 04:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CBC5257AD1;
	Fri, 19 Dec 2025 04:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQk8dbdP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B241929E0F7
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 04:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118882; cv=none; b=jiV1kI1/TFqyGjkj34kCZhzP5JJhritAYywH2ABQaQRRArDSiSIbxfCKAxXdAnsG16m9aPYjeUUR76/ScklPxOiRokqlj1SROcq7GoRfc7X6NRGBfhySfUVOEmAWWG/eiR0Jk2LATJcP2PAdB5agjwWz2cz5LdG21kK6uGgcVV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118882; c=relaxed/simple;
	bh=jCLw58pwV1aYqX9nwbEOCXnzCa22LDTXfkOwal2AGJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFYDVb4QbJ5liYbABRWvuLDHGHbBLl88lILMvIwd5s5Q7x0eZLS/Qa8rF7dgBGqQKuLCa/zIXUQaK6FudzAflYu8DbYtB3lMZcha3Xl0LuD0VnWRYFAlEWN12x+lkDA8AYqPHY8W6xooOGP3WJKGI4q66Zm/QL0gg7cjzyxNYVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQk8dbdP; arc=none smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-6446fcddf2fso1242172d50.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 20:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766118879; x=1766723679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2c7/pm2Gcuf+0EldHZ6eszuf2UQD7smEBPd4ML7SzLo=;
        b=KQk8dbdPfCe5SkupGjdCW5iCNmI+7npK63NZ7L4nhhqhSohRzLLnRzWHe0b5x33HdD
         N8xotBryyMoDTxNX4l0MX9omD7dCIcGk+0n/CaR3yPRkFEYb7TOqr8x85gCrneUBvVoH
         4YfPdOHO/Nua2tLN9QbXc3tV5wUdTlnUmpUEyVt6Qr/vp+MbPICorIc2g9TPbgV9kpD8
         93uAaKNQ0QJvSLW3B7XZUU/nc7fuHJfO6m2fzbsFD8tF4pchVXcbT5OfPZeaGnCqlKZU
         5+ZIsYUMdeXmQPI2MMdwNg30Nh51c07v/BfytH/cTfQC3+KutEdk16RjT52d4xymlVRj
         /AKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766118879; x=1766723679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2c7/pm2Gcuf+0EldHZ6eszuf2UQD7smEBPd4ML7SzLo=;
        b=ngxwlUQTlVdZKNSQ1m/7dptAfwBBpGdsZZlWDNMHnYIJb45Wwgt1lQHXrHQRCjZGAo
         3AECCJMr689PVoHsiMtqDzkuzfP4sngNkc31Vbx2/LfpfRY0gMEKPKI8Re8zpkBKfb5/
         m7azfI3kW6c0E8I/Tu7vf85caIs8vpVECuEHRMTAsoeKjNfsNlJayWLb77/JcI7E4Eky
         aM0g/+d5j26KQog/BnVUP9lqF1P6GI0G1wC3cWksCCfqs5/h2Pz3T3NYxzs9P7FlGNoW
         fDniN+qosJll8r/+uO6FJmQ/slIlmn/fdBbKJQegIEyQc7+zCxTmyjCsiWy+pCFQwKk1
         tR6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3KK23eXBtwvjzbtd+xyJYTJ7wo6dUpSD22Ct5+ZCEQRCTbkgInteNjTp3R9kZmC0Qut6sN3p3ke0/vB7A@vger.kernel.org
X-Gm-Message-State: AOJu0YxMDFKVJapzzhvIuN4FOnuPL2IAq98sXySHEAyhnqCD8Bv0M2Hx
	tNs9CJR/F1+580ww++d+wbJlExLu7zVwzR7V5flqhQw2tjtoUDFtiCrG
X-Gm-Gg: AY/fxX7LE3mFyN4AHiqWvWSNVfMiooBr7i3YFVeMpm7x9MW2PVPM102SlVbb+zSvCyF
	/k203+mWm3Heo+tN2MoLcY33EWdXhgtAjTJqv/GM2R9kGZBUcnLZd1irspP6UwybAegr7O+GXFm
	CoWvpucDNC/EMXgN57rq3CFXGC9p/bmTSy/iZ4nnPv7dHjFjxb/dqPt2J7wCzpt8LsEXH/rWTUx
	r+GF0I8T2yUmhhJU7PQSBLmLSeR3ST0dbNTjmPVFDgFCtMOTTnEQ/RIKEBWFauEEpH0V2yZnR9t
	lvLb8l6F5Ew/M9AyAVREAmJo2d76h3wNeePmtjfBl0f8b+r1VS5LU0Ev1gOc0K1+rPkUlJJFtg4
	LbxMoxQ1KtGvhtRbX2cDpsn1J3PyPahDcOK936ICvb7hOpf4rWBjU4F1U6Ff8V5TTwDWyrlx0BX
	34b7pLR/y0CD4ouqWQQ5EODN8DIK388sOa+r3PyDOkX5l+Mgok8ODf6b9OCZ0C4U8fEugKY7OIB
	gaAgaCwYwYa4RoFoxMTDPMNEtYR
X-Google-Smtp-Source: AGHT+IG1dmB8P1uhl7AeHj0WUex4IdAFDfAWuLdbLTaGW1TUQbKomQWaGeX66Yw5W+ZW/t2rSTm1fQ==
X-Received: by 2002:a53:c74f:0:b0:63f:beb2:950f with SMTP id 956f58d0204a3-6466a84b000mr1122301d50.34.1766118878508;
        Thu, 18 Dec 2025 20:34:38 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb452c441sm5610227b3.46.2025.12.18.20.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 20:34:37 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	krzk+dt@kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] clk: qcom: gcc-ipq9574: add wcss remoteproc clocks
Date: Thu, 18 Dec 2025 22:34:13 -0600
Message-ID: <20251219043425.888585-5-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251219043425.888585-1-mr.nuke.me@gmail.com>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
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
index 6dc86e686de46..aef5ed5cd9f50 100644
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


