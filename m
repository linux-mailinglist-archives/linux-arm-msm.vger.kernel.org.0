Return-Path: <linux-arm-msm+bounces-116922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FcOVLbnfS2pjbwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:02:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14613713A43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:02:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=DhPwOJ0z;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116922-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116922-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 291AA3406E21
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B6939A04A;
	Mon,  6 Jul 2026 15:03:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FFC38AC8C
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:03:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350183; cv=none; b=kLO7KZFqPMbo4jZq7DcOwVg1G+5ajLsu4h+okZIS18BYynxjWX47mGfsAgt61K/p8P02RbHiS7kXKyZYsYX3BA3Oj81MTdsmhgnAGV+hAg+SI0X4yXzgv405OezzRrtaAnp5wxFyRLAFPvYIxGV2VYXaCzb+l7MWqkUM9EGoKSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350183; c=relaxed/simple;
	bh=l9Ym/I6LGIuY1NBqKLVkODWRGiyzG1V85fGPSTiYcco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iXNumyre+e6yXqGU5rxxemRwep2VfRTHg4xgpfycZAM3XuFK6smXTN32mRxCbWw0q+LQ1GJExa4Q1+AuIZie1lEpsixWfHct1Ua8f/9eMZqVTCpYV0OXw2M0QQFa6HWd2OgaHNZIA+hgbbfQVbe+TfITk9sdPU+B1NBJYz74+Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DhPwOJ0z; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so21816785e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350179; x=1783954979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NFVOx30uAac950vvuoee7ZCsxXunq7hMY93R+H02rTI=;
        b=DhPwOJ0z8MEJ7ATUM0bJbFelev4+u8f0pyPATLxjEGERmfkTuX25Ht1zo2xu0URLD0
         Xbnm/pII11pS8kdmkvCSudPsZpzneYgloSApkoZw8ywb386IU/7GsOIO9ZnnA4vSkGQz
         ga/CftZ9aVBrhpFxY0c+2GmUxPefCk15iyrf1q0PZeAqpQ/+4ZKVhwyyheX4cDEGx3tH
         7Urvl7BckX8ygHhzclpiOCbANvgjM8p588aYubCS8JC5BL5oxF6dBqzCp68s1pLYDNsY
         bGCbqFFc+l/AD81xTT1PwE6KSsgfKt4i1jg8X1pPxJkyMRPwWKh5gvCS0XZLHLx+X76r
         42Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350179; x=1783954979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFVOx30uAac950vvuoee7ZCsxXunq7hMY93R+H02rTI=;
        b=rtGXWtISINnRVdGUORAh9wAOyohcL7HJGJjt4s/yEs1U4DE38zMB1PsaaEQ1vF+T1I
         6fd7it4ybZW12bpZlsTEcO37Kq/Gp8qUY/LAxiIYLq3VM9YyuHDlQ2nwe4wUk8D18Ps6
         X69vtEhU8JSv3ORfqOAznHJqtEVSqGmB7FcvyYaG+9rPtmiOSVRHqNvncoS1RDf7hNIg
         U5IE9Unc0d0h9haAw1F+AIekKNEkirjv62rOd8D+8WFtmFxchBFPrJQeXPcp1yssf54m
         N8vt51d7zUMpG7x6trs7O3eUu0Z58uq1kFMZhN0cPuxFSeQzPat3RMAqrDeVmFNPTsr3
         BiVg==
X-Forwarded-Encrypted: i=1; AHgh+RqUk4c8tVQEojnodQPMhUTfcfzoeuy09/nZmw0prQQLs9mTlP7BqWX6rwkJl3vT+G6nCWWc/TRj2/M8UowW@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ3fedPnu+o9sv1grltvcRSCfarJ+WfjC8CJnCDa0fWQOoj0LU
	g2a9SNyEtf2QFBKlOAj/dTmkjb2A6ANdcN22vmGZJK9QDO4/+UkLgB6WCKUqZusz0U4=
X-Gm-Gg: AfdE7cnej+rsRvy9wEKq7GTAymCEyRPB0rUHjwDjELjT9cKanEA6n8gwXO9cwuy0hgL
	hG2huGlOhrpgVYKeERH/pEM7jH2bVxHl4BZBsfXCP8VMEn8R1GRSBEr/61wqQI9mYk9EXoaRUwp
	iJOYqsNdTSA84KSphTWUNgkJ8iDv4RxVKBOerH4WVbKvqMumx8N8x2/ZUTleuOOiFhBDRVhVJ6F
	Mgz3VVJ9J4tr3xICW+qSVEJ9beL1ZvxjCw0xwzWjOLP51AjTHC0EgyBMO9/KASL6MWg3U6YTwE0
	mTI6B0chwP+1sdZ10TgyYM7qyntw0JNRHgEzpv+7ZAzHMJWbHeHIC8pphpYRbZJteGK+pbwhE2p
	jNK5G7wXYEZYGWPYaPgo/mxUhpsD0JQJsn3ApcHGO3On9xvBEcWQbuFcf0AQfG/xHcJe4otxOCG
	ekCX7HgbOOAuXK3/KcenIzrwFxWQ==
X-Received: by 2002:a05:600c:3514:b0:493:b7cb:c5f with SMTP id 5b1f17b1804b1-493df05f8d4mr9781945e9.11.1783350178912;
        Mon, 06 Jul 2026 08:02:58 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:58 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:14 +0200
Subject: [PATCH v2 07/12] clk: qcom: gcc-mdm9607: Drop incorrect
 system_noc_bfdcd_clk_src
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-7-745565101869@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-116922-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,gerhold.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 14613713A43

From: Stephan Gerhold <stephan@gerhold.net>

This clock does not exist on MDM9607. Reading/writing the registers always
results in 0.

Presumably, this definition was mistakenly copied from gcc-msm8916. On
MSM8916, this root clock is used for multimedia subsystems (camera,
display, video). MDM9607 has none of that, so this clock was probably
omitted in the hardware.

There are no users inside gcc-mdm9607, so we can just drop it.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index f9ed655513ef..c6abe93ce2e8 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -240,18 +240,6 @@ static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
 	},
 };
 
-static struct clk_rcg2 system_noc_bfdcd_clk_src = {
-	.cmd_rcgr = 0x26004,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_bimc_map,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "system_noc_bfdcd_clk_src",
-		.parent_data = gcc_xo_gpll0_bimc,
-		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
-		.ops = &clk_rcg2_ops,
-	},
-};
-
 static const struct freq_tbl ftbl_gcc_blsp1_qup1_6_i2c_apps_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0, 16, 0, 0),
@@ -1451,7 +1439,6 @@ static struct clk_regmap *gcc_mdm9607_clocks[] = {
 	[BIMC_PLL_VOTE] = &bimc_pll_vote,
 	[BIMC_DDR_CLK_SRC] = &bimc_ddr_clk_src.clkr,
 	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
-	[SYSTEM_NOC_BFDCD_CLK_SRC] = &system_noc_bfdcd_clk_src.clkr,
 	[APSS_AHB_CLK_SRC] = &apss_ahb_clk_src.clkr,
 	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
 	[BLSP1_QUP1_SPI_APPS_CLK_SRC] = &blsp1_qup1_spi_apps_clk_src.clkr,

-- 
2.54.0


