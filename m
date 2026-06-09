Return-Path: <linux-arm-msm+bounces-112192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mv/PCpEhKGry+QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:22:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A8087660F24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 16:22:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=fFYZyzRO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112192-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112192-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8437F301DE0A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 14:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CA3341062;
	Tue,  9 Jun 2026 14:15:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5014833F37A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 14:15:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014520; cv=none; b=jAZC6BfXHaeZoMqRf1FjNA1puxWXoTJGGFtkexXVNoBY9iSdvHaZklcxtdyjE0VP40B9Cs+LkOaTEt+roQBlZp6V9NZpYuX/a5jW6ANadVjr0hNA0hvmxiNjF9NnlUjhf5waQrETMMr7PF4IgwBAlM2w8dHTDoq9ZOv4QH3Kvgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014520; c=relaxed/simple;
	bh=mZo9IHY+dGSIyftD98TZHewljnUEbDQ2yVAJGk71Nyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hhwWq2Us+TNnj+nKPntugpwwejHV+fAVB1jSNzfXMyxsn3NxmlTTHdMi9qp2ncb+mINnW7ISaBC5EK47UZjfcrldhDttrQ/VKBcJFr5OaFJz8SFiW58Y1MSjEerlBTOYohGG/E98M2X7kQ/m2oNtWLEk6hFeyitvuZ72gGNM+tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fFYZyzRO; arc=none smtp.client-ip=209.85.128.47
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so60519665e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 07:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781014517; x=1781619317; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/HePIOrQIFyMx3sPM3MSE/sDre9oA/XqoIphXPjo+I=;
        b=fFYZyzROElgGdyEEVmJ8/fpO218dSz5DOZjbujV7FkSPWgHGQzfAhx914xyTm/9L2V
         PBseuK9JyhTAN8thC4kA/bZcZ9D0UBZzZT+IzOMYjnCggqpnGAhQWZ1BYukXlj1SL/ky
         tvb7Z1KU2MX0LkJ9qaGJJILAqeLjrTKF9vev4BZuebPsGpAlybfl/a+aGWSWRezqX/dO
         5Jsy/reFfuBGM/0C/5LB+PskwEP7nVwSKfUr3/zFlf7wyGaDmATCf/APaFMWaID43l18
         zc8foXTUi+ot4e6TnMRLjSZpnh6HGhTySIle8fBGlBZq7PCdBCOYvF2BBfesBV7/SLhX
         SB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014517; x=1781619317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M/HePIOrQIFyMx3sPM3MSE/sDre9oA/XqoIphXPjo+I=;
        b=O4vg9uWRJoFJH4CTnBis5qIRCLXmmHT8D5kSqssUMJOYoo99eM6KbOi8aMiKo5/Q8q
         Q3Dm3IZ1RTvx6B13d9o8dtu1ZupR2WeMRHXf/WYiw+0FfBDhKHAH7/SuOuCMMmI0nolq
         kQ2TzF5W7Ka6SGvYnAEYUw55rjl6kWob/giiJIrpWDdmFCxSH6kb092udigZ6Au9doGW
         Q70ayKucU7mIfZidWSRH4mZeNtywaCRkt5Q2V+Tify/G4vhb+mybk1SJY/55nZ7K4oKd
         j8Jcg+pszQvmm+a+WOfmivdJpkAOnBjGIZpanEG0vGgPusflIzS3sMIxF5LPkNXoqZJ+
         Vi9g==
X-Forwarded-Encrypted: i=1; AFNElJ+EbSeARLn+gQzPvlJL3DGsjiVrebi8YS0UE8Ckkcsym4m9hgk5GWgwbEfm2z6Nr0wBDKTinjGPN2G0lmlv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw++hZqnggdKgcHYylzwlbI/vbQUZZcWout9y1BAewJuzdbB5vU
	Z6F+UnlHnlIuJm9j89ZBh5n7IYgxG5AeTOFzdE/SA1sdeOq2KMad1koUii0me/zKxes=
X-Gm-Gg: Acq92OGoZ/ter2nOMJ8U0f0a2t/HYkU0G5caKNpKbfk/tIrEJsFIbKlOvB4xE+NNJnY
	5U4Z3CsGhUlMRtl+3D5m/tYb1Dlga75itpv898ne779KUi1qWSvywxJqyWHQ2aaOvhiZO1sru6e
	ZzeZcJGZG2hFxEUF1U/RR+N/jwQPWzvG0v27hRyv8Qv8bE/45UYEE2JAEITMZw6R1MAOqYQEeHv
	yZ34f45y0KBE1YNxjwd8PQLdzFD9EI3szSVMwRLdzKrYUGtGuWjdl8gLlpuFH3I62iKNVBS4LqO
	N1tjsOnv8XZ5iLv41MldX3TEshnTDqeyLrj1AkXeaieN0Zcg8qeMhe1iEVYTbY5eTvWxwYaqmrm
	+oRvNbdBcbDm4mQf8Vv9rEkfh02p1ElL8Lh7nubN8oRpUzN6DO8OWXazY81DPfIiqiuya1dzMfP
	z5X2P5cpAIz/46aEeiPpaDnD4FG9RDbZA455Yubup52u7vp1c=
X-Received: by 2002:a05:600c:c4a7:b0:490:b58a:dcc1 with SMTP id 5b1f17b1804b1-490c262183cmr318337035e9.29.1781014516562;
        Tue, 09 Jun 2026 07:15:16 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:59bf:7aa6:43c0:c58b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d5d2b4sm321450495e9.2.2026.06.09.07.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:15:15 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Tue, 09 Jun 2026 16:14:37 +0200
Subject: [PATCH 01/12] clk: qcom: gcc-msm8916: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-qcom-clk-mdm9607-fixes-v1-1-5e9717faf842@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-112192-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A8087660F24

According to the APQ8016E TRM, the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 3966fab8b6ab ("clk: qcom: Add MSM8916 Global Clock Controller support")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 9c7c6b23ce32..e91406e6f527 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -1589,9 +1589,10 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 
 static struct clk_branch gcc_blsp1_sleep_clk = {
 	.halt_reg = 0x01004,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
-		.enable_reg = 0x01004,
-		.enable_mask = BIT(0),
+		.enable_reg = 0x45004,
+		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_sleep_clk",
 			.parent_data = &(const struct clk_parent_data){

-- 
2.54.0


