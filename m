Return-Path: <linux-arm-msm+bounces-116918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EDmCHVPjS2qLcAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:18:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E171713C54
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 19:18:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=fPKVQ55I;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116918-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116918-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 353F133B0AEF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:03:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF5538236F;
	Mon,  6 Jul 2026 15:02:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CA438238C
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:02:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350178; cv=none; b=owRMlzV7wu5oszBqf/YAlf8zhKc8/qIljQYDQafPm87Nty1FrP/08ztFvofpSKoBCUpMLshSbPzxIOghthCPet/gPUk42Isy2a/ZRXngH7QrbpnIvEN+8pL0TiPsLO8A7UyVfzlrTyv3o3Qw36mXt7nq409AO/Pk2w1ioEZhbcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350178; c=relaxed/simple;
	bh=KiBkxRgwe5uqVd9oP/NxWN1PgYVqhA9/vY7MLiBeofQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A0tjYqdb/OLzYYqyaZrPNWHMY7WxWRPiZ89LfASHrc3OqS5fcat9gdYiM/pvG9WEyELh8h4yJ4Y5qf8/2amgCFanj14EOKtTVyaTaeluw4i9zt2QuNe3U2A+MhamLkghrvS9pQAp42YzttqIoihx5o23KQuctBdKx6YVFXlej2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fPKVQ55I; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493b27c7451so37550915e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350174; x=1783954974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34ufVHQVHmP2A96Pdlkv6BGppMJmajk0L1f8lEgp9Z0=;
        b=fPKVQ55IaLlvkEvOftMPI3a9GkxbSLZtH2HgV+o9Mhen8BzXjHXmAw2oP5KDAPJARJ
         2I0H+/Si5XfqAqGMFNueOB18TBL4Lok0Ykz4Ey8HBC1KijcWxyzcNhX+suLh1oRlP7zb
         cI0Lq8opZY1sKFlyuOcNNUtsXgiu5X80wINCWsI3WRPdJFXRWAXL71qkRXnYJhdAI+LO
         GqBVGyCvCpkcdPgCH8u5I+7MFs4PK6cxuJCEYRbrJY+bXPpG5aZggFeP7PcmksB/JkCV
         PhphJ+Polm3mUwQvBZWlfKf0hBu9UGTaFkJAo1K24bprYHi6rOaLW0r6hy3AMm+Unaei
         1Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350174; x=1783954974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=34ufVHQVHmP2A96Pdlkv6BGppMJmajk0L1f8lEgp9Z0=;
        b=MveDHuisqAK+cW3BrWWPZcVoXVVi5kEw4Fv1dHs0SBVEk0jEr3itcJFTSQESxSIXwO
         eDteyGSJJTJAUA5E7BJmkvQhlu9dAzIvEvtShqn5XXCiVKz39vF4JawgzJF3m7hE6v/f
         tbErQ5d5USSrqr8Vl4DUjvgwz49keq8ksmFyq4DmrKDTzLxIlp5RPb7SkugMaLGt5lHB
         jGrER+BqjkzdWS0s9aA1ZNzigE9axwfO23MA/5PrEdHRhBGuqdTWzMBrjP/On40w8ysN
         L3X/GYJSFOyyEQkj5TEkLJzqKXKcMx+sLRJ/c/BASvNht8UZW36v+3x6rbXsGXm+IbPI
         MbYg==
X-Forwarded-Encrypted: i=1; AHgh+RrXW1ri4pKc5fLI/RR4XUkv1paYf0KT7+fxbVU9Jhhv/6IzyKolHVCFPOiC1yZu1X0zUuKw5fSUZSKyFWKp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjbuv5x9GnWEV79p6XsY0ZL7GjaTzcUrDawY5kcfF7BNuososy
	cWzmjGmMJrxRDMBUZi8lKdWUFbgmMQR8gitJcc1dbsLLdq9lWNQzv+ZLcRNJoVZ8SV4=
X-Gm-Gg: AfdE7ckiHs02lvEUs7mdG/7oEBJWRLpH/lg0BeAXSStIGl+QRwjyBRwEH16jVuUNcJ5
	VJ7cecE/OcaDtVBzqaJtbIdXpAgg5R+eE0QqD5DPUR2cym54UeqLAXCuAIQM7empGEZNeEgl6BC
	dwADnEPCuEipJrBZaNhj6boIMmX1FFE9EM3TEBadIIC5WI2pD9WuEHNwQ5vS538uXGohNQdMb2u
	RlKoLpj+ogWqItpX9EjL+Y6EIbsauh9r8XgW/QGNKmdHY5p3B29wrgRiy14LacJSeMXek14hPBD
	TBHYwNkw6QtqD7YDJS+nNqcfZ6E7LsEsBDohzKX5gra0Lqq5IHUWEXda4tBzKBvT56F2dKhCpzV
	NDo7i9WMSfANYgqZEiaPvhg6Zh51AvakbJ14Tv0Y5MePxsvT6kpaKkWXlbwuFBkybHvsI7LtNMn
	vvb4UI5XsEMRRRPXwpxp/Lt0TgUA==
X-Received: by 2002:a05:600c:4e56:b0:492:7025:13fd with SMTP id 5b1f17b1804b1-493deb5de6amr13426545e9.0.1783350174534;
        Mon, 06 Jul 2026 08:02:54 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:54 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:10 +0200
Subject: [PATCH v2 03/12] clk: qcom: gcc-mdm9607: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-3-745565101869@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-116918-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:dkim,linaro.org:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,gerhold.net:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8E171713C54

From: Stephan Gerhold <stephan@gerhold.net>

MDM9607 is similar to MSM8909, where the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 drivers/clk/qcom/gcc-mdm9607.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 07f1b78d737a..499e0fbbfab9 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -790,9 +790,10 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 
 static struct clk_branch gcc_blsp1_sleep_clk = {
 	.halt_reg = 0x1004,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
-		.enable_reg = 0x1004,
-		.enable_mask = BIT(0),
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_sleep_clk",
 			.parent_data = &(const struct clk_parent_data){

-- 
2.54.0


