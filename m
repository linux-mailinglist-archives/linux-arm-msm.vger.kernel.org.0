Return-Path: <linux-arm-msm+bounces-112199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Qjq/AFQjKGqA+gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:29:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1E46610A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:29:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=EnWAF+gQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112199-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112199-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CA730309DD36
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD99352F95;
	Tue,  9 Jun 2026 14:15:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE5A34D93B
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:15:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014527; cv=none; b=fwlA8C+7DOjhZglnNFg/deF9dgr1oYWzSjXkUywPU5TGh7e2M01hopuT3WEkwsTWz2DhjzOr50OqDkdwjvvhtuKOF8Ia+HSOIR8VaMENfoaedWyXN+95r2MY9XQzutHz8ofeGkkpeS6n2P3QgpaeSH9bX3WbUQu8dohT9g899jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014527; c=relaxed/simple;
	bh=oGbqM6EN41lmsgErQceCRY68q2RnSqYHK/UP3bSocb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rk1RsoP5uSgaihwmNUbgqWGycsjzuiHcbPWH6jjUrpGOT1OaT6Ns27mZoVGUHI/BIFWzkK7ZTIUTqYUHeVwfpfgBycXBTPowVrqyiZQ9NefoA1A7oTkA8kvX+azZxJfkqZ2WujSEYeF9OOBmnB9KO6QSMjML5GpsHUhYMYY2MWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EnWAF+gQ; arc=none smtp.client-ip=209.85.128.46
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso63519395e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014525; x=1781619325; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m50m/nD8qYsKnQv0HG1rbIvdMWSxFg2dkj/6gccCEjc=;
        b=EnWAF+gQY/mYH2j1Rtz/aIevvqebw4wiKkkAthQlSXkEiT3TSKfOtwB8UpCYccIi9A
         BYJOkhYgzM7I5GADu04sWhMYrB9rR8qeIddlHkE+t6gZsVYV3HYrxMnJtRfWDJagjlKH
         ZhW+02cTi4ZmgsQcLCQCbTAJPMiWAaUFVRP4DEb6X+GBxxEit6+8ZstSTW33cPvIMVem
         CVxJ1ecqy6wVBe3qYd4EuWlaNIntwfBifHBJwbdgXYmu1lyK/U0fId1kL3qTPQieScZB
         sKyUAdCFl+zX2iYxh9qUApUaPUNLow1qjFmbXW++uIJgO8I6YnZ167yk/mI3aR0LQTyy
         Iq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014525; x=1781619325;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m50m/nD8qYsKnQv0HG1rbIvdMWSxFg2dkj/6gccCEjc=;
        b=aiS7MVczbSUU1QRBzUs7g3AcovyMvYVqnPWY9EKEVn6lExkQ2DELb8qWO4bVf4b9tc
         jZ4vIOG0MO3pR/s4rryrIgdUFauDEgvfiTFlNkRuV5tFqzK2SKg8Q0fchuVjJA9E/yAe
         T3y4E6N2RH7lfGbyjMvmpRkZs/iTTUrZS1RIHK+5S7erO/g4Rn15KGY0oxeJ4qql6bLM
         UpX6o9m4Ai7nTQ7emj4vJ5pWzf4qpKkNBctFiQEfbhz0OxqZF1X+xKR1FjvHFxtCubTy
         ZMe9z1t0dr/ke0CpL3Q93hhWAwCK+n429SxxNZ4Sm9kUwZrY2+Fj7/bQf94Bsv6ePYw4
         DMSw==
X-Forwarded-Encrypted: i=1; AFNElJ/BHBEYXkXkVCTahcS4cT3XN/pyOkFD7TqiWggBAppgJbLjF0IRHjMWo2cI/swKhYLVOgphz9j63x9KVlRn@vger.kernel.org
X-Gm-Message-State: AOJu0YxSqde/YeszHuKcFgyJtaPIU1ACCnA6wH9D1SKOPjnE2rB79cJd
	8Jin3wW568y5LR/3zuY5bjlNV/FLRHiazSRO3Pi8m984gfx5TtqxJEM8eqma0I2GXsw=
X-Gm-Gg: Acq92OG8qV30ovOKUfCw8Q5oPcmXk7hWfih/W+UxfGnKZM48paHfUzudgYyC2z2G7jy
	4c04jjT1M92dAaaOWhty/d/dc8b5r4fLfZVV8jDHb9zGgN4Rgo/RI/wyUNA0gxQTOdqKLoAGGXC
	TVJftEQPX4bkaVe9g2E4+g0TtbbC8Rr7p7mNlq0nmviAIZUs38F29UWaJr4p9LCZof7QxN17Xtg
	tziQx9Mf7nd2TIbdy1KvBo3KBner85k9YmyqOr1eOWczH85c784CqwlFKRpBb1xEyBuWAJk6kH8
	RZbhczHxSFz8AZfUC1z+hiC23XBaaiKe27xTnf47uIKDxTUpI/MsQ0jqGrUjoEC5wMUmBHA924S
	pFicu6pnAYlmBVD7luOLtFJ41j4fETpBtocPO6PDifftcT2L3uKEtUKcdQWdjZ5n551NpGAaHpI
	BMphVbBrvq/ZSDq9fkzeEMYW9DijXSylWijFN/z0w4gJzadVQ=
X-Received: by 2002:a05:600c:e548:10b0:490:d2a4:1b59 with SMTP id 5b1f17b1804b1-490d2a41c3bmr73028535e9.31.1781014524390;
        Tue, 09 Jun 2026 07:15:24 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:23 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:44 +0200
Subject: [PATCH 08/12] clk: qcom: gcc-mdm9607: Drop incorrect
 system_noc_bfdcd_clk_src
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-8-5e9717faf842@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112199-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linaro.org:dkim,linaro.org:mid,linaro.org:from_mime,vger.kernel.org:from_smtp,gerhold.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1E1E46610A8

From: Stephan Gerhold <stephan@gerhold.net>

This clock does not seem to exist on MDM9607. Reading/writing the registers
always results in 0.

Presumably, this definition was mistakenly copied from gcc-msm8916. On
MSM8916, this root clock is used for multimedia subsystems (camera,
display, video). MDM9607 has none of that, so this clock was probably
omitted in the hardware.

There are no users inside gcc-mdm9607, so we can just drop it.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 61809e221d69..0bd4c12483cd 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -257,18 +257,6 @@ static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
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
@@ -1468,7 +1456,6 @@ static struct clk_regmap *gcc_mdm9607_clocks[] = {
 	[BIMC_PLL_EARLY] = &bimc_pll_early.clkr,
 	[BIMC_DDR_CLK_SRC] = &bimc_ddr_clk_src.clkr,
 	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
-	[SYSTEM_NOC_BFDCD_CLK_SRC] = &system_noc_bfdcd_clk_src.clkr,
 	[APSS_AHB_CLK_SRC] = &apss_ahb_clk_src.clkr,
 	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
 	[BLSP1_QUP1_SPI_APPS_CLK_SRC] = &blsp1_qup1_spi_apps_clk_src.clkr,

-- 
2.54.0


