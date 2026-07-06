Return-Path: <linux-arm-msm+bounces-116921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vQTlGXPjS2qVcAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:18:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2858713C73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:18:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=UK82YOZG;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116921-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116921-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D286533E541C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:04:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0C1391505;
	Mon,  6 Jul 2026 15:03:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3003845A7
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:02:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350181; cv=none; b=EyGBgRNijnOmKfSotdmUXc0c+a4cY6StXvSYTKo0Y8S0qsopzh5iyrFAcJ3Zg+776pgDUyJ2FWzABNG1nAsKhN78JS05h69kbTJXHiqmQj/bZyz2sW5jhHiIulibTQPzWi4TK7segNj/YKWg0MkdVCUJsiR3j8BH7oEdlgZt+TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350181; c=relaxed/simple;
	bh=7EVf7sPgwz08uOEICfZTm2vyiIZLETiS/W6o+3w2BxU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ftTRo5BvfxPjZd8xmdLNSn80GQhYtz1ZFsOa0PgaQ0VaKPKTLGHqXk/J8ZJNbhV8AKuf+lfmyDxD2RON6/8qnBnMmAyo0M62oivn0mOiNetbHMV93XRXSDh9ZO9RMj6yv3yVKll8SiNUkOTSKgkYE25wxv/+kA7o3Vyk4c4ntQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UK82YOZG; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c733f15aso31905965e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350178; x=1783954978; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FH8HjuXrMw2eGpjgO3KSZfxBVdv9hq/LigpfLGCHtBo=;
        b=UK82YOZG/jr03MLFPNgmxCEFlq1zBVTWH44o56O490XMXI3Yuri6je5AERAkKMo4dD
         FrixllGsdrkNQ3SjOXNoeAnIMtegIZDsKlfw9oSk5tuCTAdkuNkMOTxqiHItBCFt0oY7
         zZkpMyqLx28kTCx8QuZnTYu8hcwNJH8FZ6ZUQZWaPzdwF73/XZch4m17I8gKirquQd00
         +f7t4rpePAqKvji2IpgrGxIrHdVrAoQVCFbToubvSuyF5HVGdLbDsFmgeWzqQvBkPwsA
         ZPcmbuDHof0Plpbw7Cb5p6hS0x73Cp/AhByUrujNPLz7PaOb2ao+/N5f5JCkkvNHCYhi
         mb9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350178; x=1783954978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FH8HjuXrMw2eGpjgO3KSZfxBVdv9hq/LigpfLGCHtBo=;
        b=FoJbO04XSTxPu9m7mqtdQOxAdPb5enFsynluOJnBeNiuGDX8WujBhyQa1J5Nh+ynwI
         jbBNFBpAuamb1v2twvof31YT5mSm0letA63kOo/5XOu3qj92U4Ies6ZR+aM7f5irdG83
         2gd/qjiKOye0Il0vaoa4hsJRK1XvOu2rFCxy5yh6i64g8cds5BcJWuRdFTKSXWYXwlUs
         vi+Z6cPyaD9rn/0AbMVIfPX4cVezBqp1tSAtfqVQ0AXwFq4NMKFkpVHfRyX+kVK5UM8g
         3cXIlCb9HIbrThnCx9apPC5ZT7HQTgLp0FmTfq1O1jGTqF1rFcMtikJ1dcCpGKhhrI3p
         d8BQ==
X-Forwarded-Encrypted: i=1; AHgh+RpivGVdkVIzIT8Yjdjv2yFeQbrsSZYcoCo/CYt4d9ZUDa3hcK+j1QwW3P0p0kF1uC+Sg1Y9x7imMNrjsPnW@vger.kernel.org
X-Gm-Message-State: AOJu0YzqEbkExLrMW0r6jq+lqXZ6Y0jurpsrDIRWM8VAzBpfDgi0ZCsd
	finxtbMOadbUa57MtiZpaWvawE9S7oG+LBEjDP4Sxqf+z4ibd+/du9pZnSm/U43CsnM=
X-Gm-Gg: AfdE7cmnofLamMdjx8j3aHRTvzCiHcW5Kqu9bgqGBTNPTY/W86nUP5yOeHmsYJuWFZ+
	Ayue8cdYd2hyhdn3gxkXp6jZ84fhvWmxJNcyZk6E6CQ91bb0HqRuc6GilvpZe/ZZdEKj7g8vwQ4
	dk1sYyPO/IyM3OIp+73/TvIHouz5GXx6bYKsKTkQYw2zo5AU2fVwIGlFmsYh2kdRxqBRKA9AbXE
	NuGd9qUL850cGhrKgRx2/x5GrbvEPvuPEtZXQY2dDR17lrWM1AxIPQyU5UdU1WOsQLUJPsGEoak
	40MSHv+jvGyRL2NjTqtvKL9s2YB087iiqehpJAL1wR1VW02DvRPPZjgVJBxLfCmuKspLMJNFGQU
	Ra3ly+DZUQpKSOB/ELJEtMRaHwEpz1oluiOALeJ0Yluwt2RT6A6wKaZ0JTkpNjqbMdTT0t1DWV3
	gb4TLvT/fX7LY+nBQGgyopSWfr7A==
X-Received: by 2002:a05:600c:5297:b0:493:a8ff:d7af with SMTP id 5b1f17b1804b1-493df062140mr10992855e9.4.1783350177732;
        Mon, 06 Jul 2026 08:02:57 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:57 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:13 +0200
Subject: [PATCH v2 06/12] clk: qcom: gcc-mdm9607: Drop incorrect
 apss_tcu_clk_src
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-6-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
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
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116921-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gerhold.net:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2858713C73

From: Stephan Gerhold <stephan@gerhold.net>

This clock does not exist on the specified address on MDM9607.
Reading/writing the registers always results in 0 or crashes. The math in
the frequency table is also broken. GPLL2 on MDM9607 runs at 480 MHz, so:

 - F(155000000, P_GPLL2, 6, 0, 0), // 480 MHz/6 = 80 MHz, not 155 MHz
 - F(310000000, P_GPLL2, 3, 0, 0), // 480 MHz/3 = 160 MHz, not 310 MHz

Presumably, this definition was mistakenly copied as-is from gcc-msm8916
(which uses 930 MHz for GPLL2). There are no branch consumers of this root
clock inside gcc-mdm9607 (notably, gcc_apss_tcu_clk has bimc_ddr_clk_src as
parent instead of this clock), so we can just drop it.

It seems like this clock does exist on this SoC on a different address, but
since there is no user and reference code for it, it is still better to
drop it.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 35 -----------------------------------
 1 file changed, 35 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 092076a5a0c9..f9ed655513ef 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -158,20 +158,6 @@ static const struct clk_parent_data gcc_xo_gpll0_gpll2[] = {
 	{ .hw = &gpll2.clkr.hw },
 };
 
-static const struct parent_map gcc_xo_gpll0_gpll1_gpll2_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL1, 2 },
-	{ P_GPLL2, 3 },
-};
-
-static const struct clk_parent_data gcc_xo_gpll0_gpll1_gpll2[] = {
-	{ .fw_name = "xo" },
-	{ .hw = &gpll0.clkr.hw },
-	{ .hw = &gpll1_vote.hw },
-	{ .hw = &gpll2.clkr.hw },
-};
-
 static const struct freq_tbl ftbl_apss_ahb_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0, 16, 0, 0),
@@ -674,26 +660,6 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	},
 };
 
-static const struct freq_tbl ftbl_gcc_apss_tcu_clk[] = {
-	F(155000000, P_GPLL2, 6, 0, 0),
-	F(310000000, P_GPLL2, 3, 0, 0),
-	F(400000000, P_GPLL0, 2, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 apss_tcu_clk_src = {
-	.cmd_rcgr = 0x1207c,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_gpll1_gpll2_map,
-	.freq_tbl = ftbl_gcc_apss_tcu_clk,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "apss_tcu_clk_src",
-		.parent_data = gcc_xo_gpll0_gpll1_gpll2,
-		.num_parents = 4,
-		.ops = &clk_rcg2_ops,
-	},
-};
-
 static const struct freq_tbl ftbl_gcc_usb_hs_system_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(57140000, P_GPLL0, 14, 0, 0),
@@ -1512,7 +1478,6 @@ static struct clk_regmap *gcc_mdm9607_clocks[] = {
 	[PDM2_CLK_SRC] = &pdm2_clk_src.clkr,
 	[SDCC1_APPS_CLK_SRC] = &sdcc1_apps_clk_src.clkr,
 	[SDCC2_APPS_CLK_SRC] = &sdcc2_apps_clk_src.clkr,
-	[APSS_TCU_CLK_SRC] = &apss_tcu_clk_src.clkr,
 	[USB_HS_SYSTEM_CLK_SRC] = &usb_hs_system_clk_src.clkr,
 	[GCC_BLSP1_AHB_CLK] = &gcc_blsp1_ahb_clk.clkr,
 	[GCC_BLSP1_SLEEP_CLK] = &gcc_blsp1_sleep_clk.clkr,

-- 
2.54.0


