Return-Path: <linux-arm-msm+bounces-116917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aByZOKrIS2rCaAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:24:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 57625712884
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:24:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=XKnJy0lj;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116917-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116917-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F367321A9BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67044382F3A;
	Mon,  6 Jul 2026 15:02:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D0137D12E
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:02:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350177; cv=none; b=HrW+ccLwpm341Vvz5t9rZVU4Ejv08GCx77IHISbx7qzONeR8Q46zf88/TMOj0MUeNRnMH4FuXjjnPYm+SPYNA1W6ebFDy7rmpdHzevSJk6L/s+DWD0X30CW0DZ4G+29/fkxxPzRAI0/n9W9UKEItmsFS1whOBsCO/G88dBUSaSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350177; c=relaxed/simple;
	bh=AtEZcNEb3ClBSLeLofH89FOOEW3yyy4sU/gIpI1RXy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kKIXle5JkokOZgH14jOxy0EqwnL4pad1+WAyl1tLTxdob35zTVfocc6JAYWsH6nUXKuGSakNn2b3cT5qUbzYK1m8NQAhFeOuce9AkaHTkqnlWHM2fsfXHknnQbQlRjfib/u1oPpPRoJ9Mosui0bxV97/5h7aXXuVmEUY6LMTMUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XKnJy0lj; arc=none smtp.client-ip=209.85.128.51
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-493bc8fda98so34771285e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350173; x=1783954973; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tHOTidNjNLnwwKoun3jL+S03jKuXKaLpyrO3E7uk78g=;
        b=XKnJy0ljemOmuZXnjtfHgiKoF8mHh7e8RkevNqlAMCMRPBoc5wqgy1WeZlNENz3/WP
         CHbBqIXvm4Qo4JpdCfqlu5BR4HVZDACVrdRLwtJUWptBg8EEdo5ni1BHUcMyL5EV8uR3
         GJN8uKoFQwv74iHHzRlZlwQ1EFcpXW1VVHYCFXqoPKBol+NzUQ7s5aIT+mQwczUlJ0Hi
         gbR+u5papDw9WNy0qAFlKVm5Rlm4XTMK/ZLnY+bPGQW+Liq0J9A+qrzV6wrZ1DgVvPpM
         FdJGhnaYBQNxCiBF8y2Ajz6dK4AsK8KSIfTgmhzCnH8yG2DCoAvwtEzxrLemEAh0f7pV
         btoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350173; x=1783954973;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tHOTidNjNLnwwKoun3jL+S03jKuXKaLpyrO3E7uk78g=;
        b=oFkbzjsgteyBRJxw6S1I9xNSsF0nMBAifQTA+BdjhbO28P3REp1wkDdPjp0p0W5Irn
         QO2gbh21T9m1WHwk4a4K2il3vPaquBAX514E1kd67h6vTopnMq0eUy87/iGdzag3fFGJ
         vXPdu8DN7JpHSUDtnexbX3BAym4Ur1xerCm3GvQmFMqeYQEpYH8fZqNlz9d7zlgj6BgB
         DVJXWce/9Xja4uV7QGKjnHtbwA22mUfJs3BiG0lPEMZgwbWWGRbIbrksXr2PwTUThQi2
         S7huyMsfvosaVJn8N/ynJTSxZw4SrO27EEd72630FCfud3nrvQM8P1wwJ5G1GNRC8tKF
         G1BA==
X-Forwarded-Encrypted: i=1; AHgh+RpNQcCgw/+Ff6XMBPnrZ3o+p36cYKQ9dHRQjPotmtvArc+FwaPprd1BHqbcy8ZG98rqCg52N2BhceH5ovIU@vger.kernel.org
X-Gm-Message-State: AOJu0Yzka9nmOux5JEG7x8K/ray1kBCL2wxfNciiUKQNyqlJjrPtWe+I
	58CDYqX0lnQuqA7HvkPoMaZbe1k3cHv92ihdBZEVGj3kIaWtU8FYYroSV3xALD9lVuI=
X-Gm-Gg: AfdE7clFwhFWv/8e9kvrxcQ3aQJOD16wgWeO5SmeJlfO/RGqgNSgefjW+Xd10BbjC8N
	Dm8cteJvLpiMuttvwsrkaCKZWdO2UIs4RSsmPCAgE1rIXY7vGYnkw2jT+IErkrVQkbSHNRso3E7
	+/IyImhBhx1wUlWJ9vFhUVEcWiqfvMBgC8NzOtEteM9ayWiN5IZSgBf+wjGay9sqnNjEdCfCxO/
	V2NKdfWHnNtnwTBDETbVdczEnlN+gLgPN+PZPYqXVtAJijG9stlMTwEiMmFUHtgWajmGlH871Xx
	qnUTkmv1DRTbVBJKxui27EU3+2F3YJ6lVq8/4kaPZouWV31LoUPnZTU1Evdxgdrfy6fAOFRGdNw
	+6AqgnB93Cztjb9vzVp8GpsUL3ZUTgkgWhWpQtlLxIqRfnhwwtP5Z6j2DEvY7goP88y4Q24XXvf
	uGaE7KaQ1tQVa3hjqDuuB3H8Kusw==
X-Received: by 2002:a05:600c:4e93:b0:493:af0d:484c with SMTP id 5b1f17b1804b1-493df0797a2mr9939925e9.34.1783350173321;
        Mon, 06 Jul 2026 08:02:53 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:52 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:09 +0200
Subject: [PATCH v2 02/12] clk: qcom: gcc-msm8939: Fix enable_reg for
 gcc_blsp1_sleep_clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-2-745565101869@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116917-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:djakov@kernel.org,m:shengchao.guo@oss.qualcomm.com,m:bryan.odonoghue@linaro.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57625712884

MSM8939 is similar to MSM8916, where the GCC_BLSP1_SLEEP_CBCR register is
read-only and only has the CLK_OFF bit to check if the clock is running.
This is a shared vote clock, the correct way to enable it is to vote for
BLSP1_SLEEP_CLK_ENA (BIT(9)) in GCC_APCS_CLOCK_BRANCH_ENA_VOTE (0x45004).

Cc: stable@vger.kernel.org
Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..ffd7f14fcbaf 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -1929,9 +1929,10 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 
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
 			.ops = &clk_branch2_ops,

-- 
2.54.0


