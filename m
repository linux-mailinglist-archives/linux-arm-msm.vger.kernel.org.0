Return-Path: <linux-arm-msm+bounces-112195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /1XSIR0iKGon+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:24:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1570A660FBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:24:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=qPTaSsoA;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112195-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112195-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA89C30C8D32
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52AB5348C77;
	Tue,  9 Jun 2026 14:15:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA47344D95
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:15:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014525; cv=none; b=c5YkOVHSJna/fpdFDNjVg+XBktLM5WC53PBYxdsEwPRR8OGgV7sD+kiA0liokiZkxo6zONwh/DMXeJMazOB2OOdvIFrzqqqOfa11iaCtFOKbRt3/5NnFHf2nSpoaz9Dlp0riYlK0hjkKh05uYPpWTA4VUN++iwYXXE+dC//FMyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014525; c=relaxed/simple;
	bh=gr/snqPCXMRgD4Vqhu0RLziDOGv5ZYzLjvee3cXndFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ow3fby3+akXZvJCox44EkBiknP/dVJSUFtmfVcDd8Jy3BIRUZMEJVGRVXMmMU0+3LEeBgmX8iHc3TuKiIlYEamdbfzeHm8CvDqfZJLKJoXy6Dc1AlPWydDgqluNr1ZHwLiEIj2Vq+/2RQWcM3l3g/ZsEj2oLjbVz0emcI1oiLFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qPTaSsoA; arc=none smtp.client-ip=209.85.221.52
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef616daf6so5129061f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014520; x=1781619320; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OkefV3MvzoG01azX7X+knm26SKd9cR3V43+TFVkWxo=;
        b=qPTaSsoA9SN9LCWGIz/XTlN/hDs+AjkqsCzDAkF0glu2Fnm1xr33zo0fqdag4F81yb
         MEZQ9FSOm1H0+XizvizqUvVKjGwMdEqIZqDD2ZZKwtWzQp2kQiflDdtBNMk+6vBJmyhI
         WPT4XuQJyRLK4ANGdBadJ6zSyu41Kh2PJeWnbgI/GEQVtzm+hEwVlhm0lEAhKTQs8kVH
         Z972Owj3f3vhl7WlFtZ8j+7uVjfEu5+z8brbFuW/LhnPOvILf5gpN14AhR32sG7g/AMU
         0pyK7P9MXOZTEKNA80SJ8p+h9eVYWAtiTOk+6Nn8tups9u8zyUcaBvH9+hEx32hOcu8Z
         Ihfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014520; x=1781619320;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5OkefV3MvzoG01azX7X+knm26SKd9cR3V43+TFVkWxo=;
        b=ZE/Z4+B1ZZbvFR5qsZOEiompiSneNSBBPc9pXVFudhdpMGFYvjdfSdNYHDlkVff1du
         jr/X6cjyBi8NfduRf7vIAHMuJa98FIjXaCG++IaZLonnYjT8u7AvAvBKrO67cHUgHNwi
         kP7rRlkMpAmGVaWfZsO6M7HMKzNgkxwiD5XIDSBWM1rW7916tgoGY0oktU5wTnmfDD0/
         rLPwn9nOoSNh8f+5YzewBpYHMaFsIL1073qt3+IPDnFayaq3fPKnV6LjoBbIpJ7fWPTm
         YDo/TnqGE2Jt9ATsV7lBEn+XK0+t8G9pnuf/VWtFCEwFlLdYf/MvMf1WhWpZ3xN/5oD8
         uB6A==
X-Forwarded-Encrypted: i=1; AFNElJ+xasYYFNZAphZiv835/sSxVAlMK3aKDZts6V2ClZbGAqYfQVBp9/s15vWuUMJ9skwyP9OWqoVhCH9RNy7+@vger.kernel.org
X-Gm-Message-State: AOJu0YyeD5zOMkglOcK5oDNYHaxYgK/j98CisEbtWwHqyeygYf07+6+w
	asoLnkjvTRr+GTvTLDDCoxyMlYT9/scSWnvT46z8EFKy3BY72UTbnt38su7M/wpKpNk=
X-Gm-Gg: Acq92OFHHMzVUdE2X8wXIh6Imsxll+hQzd4THb83GONBfQMBeEptnk7gEgaNbmwcvLw
	5HyRZccmNs/utQWzLevVrN27SgIok5QGDmzdblIEsfU2ji2HoSBvWLwpMwK+BITtVchy0bAzt4G
	2uuL2/JrtX/+J7A+LbuSE0nYRnrQT6lfKoaakC59KQcftJVk+YMhy52OQK9oiBGEjLabN/mRe8t
	FVJbVwhVdIgU5dzYUxobqR+qOSCpXYNnqUCj6T6wGB4IVHGAX5JO27pip60z8AEt05uwEIYUBHv
	ip6o01tHZCkIfLtbezM7Ih4fWlq5vsJUSe1jBKMyfzSLcgHvclq5I6eyTbOhdOQEhrNrxIgf//8
	Nd0JjiKwznDo1F9+vmIM5plr35sryx8sqXNUbhE8CIml0x2TfRCY9C+DPOK5nMJpw+L3AF1ncCL
	Zm2w/S76iJpc+EX46foeGOI/OyCRdoow+yw2MLT5ym+ie0oBM=
X-Received: by 2002:a05:600c:8183:b0:490:5cd8:d213 with SMTP id 5b1f17b1804b1-490c25c4898mr298626375e9.15.1781014519919;
        Tue, 09 Jun 2026 07:15:19 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:19 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:40 +0200
Subject: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
In-Reply-To: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112195-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,gerhold.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1570A660FBA

From: Stephan Gerhold <stephan@gerhold.net>

The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
match nowadays is gcc-msm8909. Looking at the differences between
gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
definitions for the BIMC PLL.

It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
used for GPLL2.

Replace the definitions of the BIMC PLL in gcc-mdm9607 with the ones from
gcc-msm8909 to make sure we read the PLL status correctly and don't make
accidental incorrect changes to the PLL configuration. With this change,
the rate of the BIMC PLL (600.6 MHz) is displayed correctly in debugfs.

The clock naming typically used for Alpha PLLs differs from the older vote
PLLs. There is no device tree upstream for MDM9607 yet, so we can still
safely change the dt-bindings. Nevertheless, by keeping the old ID values
and swapping the two entries we can preserve ABI compatibility for compiled
DTBs. Previously, BIMC_PLL_VOTE (71) was the final PLL clock to reference
when needed, this is now just BIMC_PLL. The previous parent BIMC_PLL (70)
is now the parent BIMC_PLL_EARLY clock.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
dt-bindings changes should be usually separate changes, but there does not
seem to be a good way to make this fix bisect-safe without also changing
the dt-bindings at the same time.
---
 drivers/clk/qcom/gcc-mdm9607.c               | 51 +++++++++++++++-------------
 include/dt-bindings/clock/qcom,gcc-mdm9607.h |  4 +--
 2 files changed, 29 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 499e0fbbfab9..d0b08b112fed 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -121,7 +121,7 @@ static struct clk_alpha_pll gpll2_early = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr = {
 		.enable_reg = 0x45000,
-		.enable_mask = BIT(3), /* Yeah, apparently it's not 2 */
+		.enable_mask = BIT(3), /* BIT(2) is used for BIMC PLL */
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gpll2_early",
@@ -192,32 +192,35 @@ static struct clk_rcg2 apss_ahb_clk_src = {
 	},
 };
 
-static struct clk_pll bimc_pll = {
-	.l_reg = 0x23004,
-	.m_reg = 0x23008,
-	.n_reg = 0x2300c,
-	.config_reg = 0x23010,
-	.mode_reg = 0x23000,
-	.status_reg = 0x2301c,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "bimc_pll",
-		.parent_data = &(const struct clk_parent_data){
-			.fw_name = "xo",
+static struct clk_alpha_pll bimc_pll_early = {
+	.offset = 0x23000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x45000,
+		.enable_mask = BIT(2),
+		.hw.init = &(struct clk_init_data) {
+			.name = "bimc_pll_early",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+			},
+			.num_parents = 1,
+			/* Avoid rate changes for shared clock */
+			.ops = &clk_alpha_pll_fixed_ops,
 		},
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
 	},
 };
 
-static struct clk_regmap bimc_pll_vote = {
-	.enable_reg = 0x45000,
-	.enable_mask = BIT(3),
-	.hw.init = &(struct clk_init_data){
-		.name = "bimc_pll_vote",
-		.parent_hws = (const struct clk_hw *[]){ &bimc_pll.clkr.hw },
+static struct clk_alpha_pll_postdiv bimc_pll = {
+	.offset = 0x23000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "bimc_pll",
+		.parent_hws = (const struct clk_hw*[]) {
+			&bimc_pll_early.clkr.hw,
+		},
 		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
+		/* Avoid rate changes for shared clock */
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
 	},
 };
 
@@ -230,7 +233,7 @@ static const struct parent_map gcc_xo_gpll0_bimc_map[] = {
 static const struct clk_parent_data gcc_xo_gpll0_bimc[] = {
 	{ .fw_name = "xo" },
 	{ .hw = &gpll0.clkr.hw },
-	{ .hw = &bimc_pll_vote.hw },
+	{ .hw = &bimc_pll.clkr.hw },
 };
 
 static const struct freq_tbl ftbl_pcnoc_bfdcd_clk_src[] = {
@@ -1482,7 +1485,7 @@ static struct clk_regmap *gcc_mdm9607_clocks[] = {
 	[GPLL2] = &gpll2.clkr,
 	[GPLL2_EARLY] = &gpll2_early.clkr,
 	[BIMC_PLL] = &bimc_pll.clkr,
-	[BIMC_PLL_VOTE] = &bimc_pll_vote,
+	[BIMC_PLL_EARLY] = &bimc_pll_early.clkr,
 	[BIMC_DDR_CLK_SRC] = &bimc_ddr_clk_src.clkr,
 	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
 	[SYSTEM_NOC_BFDCD_CLK_SRC] = &system_noc_bfdcd_clk_src.clkr,
diff --git a/include/dt-bindings/clock/qcom,gcc-mdm9607.h b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
index 357a680a40da..fe4c15be3781 100644
--- a/include/dt-bindings/clock/qcom,gcc-mdm9607.h
+++ b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
@@ -76,8 +76,8 @@
 #define GCC_USB_HS_SYSTEM_CLK			67
 #define GCC_APSS_TCU_CLK				68
 #define GCC_MSS_Q6_BIMC_AXI_CLK			69
-#define BIMC_PLL						70
-#define BIMC_PLL_VOTE					71
+#define BIMC_PLL_EARLY						70
+#define BIMC_PLL					71
 #define BIMC_DDR_CLK_SRC				72
 #define BLSP1_UART3_APPS_CLK_SRC		73
 #define BLSP1_UART4_APPS_CLK_SRC		74

-- 
2.54.0


