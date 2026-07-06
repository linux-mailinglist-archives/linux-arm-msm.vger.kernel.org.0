Return-Path: <linux-arm-msm+bounces-116919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mpssEYbIS2q8aAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:23:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F4F712871
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 17:23:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=RsNY3A8L;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116919-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116919-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 00E51323E336
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 15:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623F93845A4;
	Mon,  6 Jul 2026 15:02:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFB637FF49
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 15:02:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350179; cv=none; b=lzOh61GtERBX7OVQEe87zQymsyLp2JlEdI0uTLYsv5Nb5O/muKQP1WHeyKpYZJExL13/USu6Ni0H5oHwXwUJT4ymg66wiVPBBFUcYzsqmuC9+/ZjlqPnRJZrN7wucEvT92sGq7LpwL4x1zYvW/Iq/3vL/UL9Umjh9t9e3rctLYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350179; c=relaxed/simple;
	bh=R9Fw+Pg1uH+OC0GfijpP9rUnUjMHiXLCQuQgFbL/+9U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDEPPU3E9LSEEAFe1Zs7MJTR0O5Bd+zLl29qW4hF/U1/S8jB5M14UzOd2I39j5DQila4hVGZZTkEUoIKyQIw+xKoBo1CKq9RAzDy69tIkZk8DoyKdW5+rky74SCGrC7S5nmyA/bnEb0Bx2s5h+sMyhFI6cWm/jYimCCae66Sz6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RsNY3A8L; arc=none smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so14651755e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 08:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350176; x=1783954976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KRgZZe43859RqTvZMgy+FZ1y/OLRK86PE9Ay0ctHm1o=;
        b=RsNY3A8LdONCaZrGx+NUqcnyRGhDdoT/aWm7SXzKyGlKHNiLoem9cy2Gh7nbloKwuY
         HROaAhDQPdgw8X/fkfG5PZDoueoNv31EBk0QnQ4BsaJ2PmrWtc2jGpv93t2gK25P4ip4
         Sf8pf3rX+Z7mMDpeiyXfA00BzCvKtzlQ3HDgctB5fhkatdTbeqofHJIet9FkJnfIxj9H
         JS8GrYZ+6EGrz/SKDJ5o/uiKqWrlUr2LMu/sWdH+KN/fvF2LCpECqa2O7duUls/9fCUd
         PpX6WYXGJcKzZDZRhUAsxrgu26luXo5GqfHxkI7aWxU0uCaWFMIqc7bmA/ucXR8zCwVV
         LvSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350176; x=1783954976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRgZZe43859RqTvZMgy+FZ1y/OLRK86PE9Ay0ctHm1o=;
        b=ABChLM64fHQWM8n9/GdsJjVwiY5mtMUxujPHT7O7OQZm0ODU6YvJ3m75y/SRcoPAkm
         HWfEEmFbd4UGe57g9BSEkgzQC94yVlYSUtIy3jLSCqf9Ooq5P2qPYfA7DbUJq/tqIsha
         5zrbOeXD9rXlDKHOHFDY/m0eDX488vvcu0Tx17tAeDxbav0mEeqxDYbDrnKpqF+cKILT
         Q4zmca3bGmb+UNqW8GQp+ivCMwM7r7wb0iwbEUW4uboNQ03vRnUwzh2cp+xKvpi98yja
         dxMi7drirzfM9aGbWd3q+bJiGrsSx0g4lR604hBKzBDc0tvun1fh5zAa+HlG1fjZ/d1S
         bL/A==
X-Forwarded-Encrypted: i=1; AHgh+RqWfEwgIbkpKe8idYO4R0mDd4nW4b/UFBmyXsKyvQVjAXm6zkYFbsVGMsVpLR8VQTtVKrrbO7afe5jmECPt@vger.kernel.org
X-Gm-Message-State: AOJu0YxZMd98oUC4uZF+gIJPpnu/HbbBHltzYksxE/WWNfBbSmJpwGvC
	Nbbxqzsj2gkzcSnpY4s6uuS/tAEdmZionC2XmMubDtMaYY/ipSUwN2dTvbb7iBO9fNg=
X-Gm-Gg: AfdE7cmdW2VTc+hIi0MAZtXbd/XciDH87w+NCdC1jEhuSmz88ZPjuC2HT8p2PbNqSXf
	Dix2b6wjtPv4RlDx2vAjDnSka7qdHjp2Q+pz2E7uxS+ChTbTKqYyVI7QrChPkc0Ss9uV9qQz6DB
	5m2in4ViVM4Y/GDxnPd3DcMUQPTPkXSXZnrP4z1SpP7rzgmZgOrZlZPE79PAiJxfCBvbql0CDEQ
	pyLGA3dV7JpdU/5QyEoYJMGJOt3v7OiKCJDu05gvIZQufuxjG+3VOdZ6NI44nTPPXZ7RO5yJta1
	Kb/w1sIiF25qu+vzzcHgjatpP7/iIp6e4g1HZkm1LSIfDQ+tPxXVgqRy0NJaYkZaD28p4qno0Od
	CdeBREwUqCuUxnon0avFQWP+bSU5l/an79aSC2uEdBwb8NIo0goUVEkqh+bqX1oFxmaPEsEsNGo
	RW1CX3snWyLhuZpnxq7SvSyhGeYw==
X-Received: by 2002:a05:600c:8010:b0:493:bef8:ba8 with SMTP id 5b1f17b1804b1-493df0a6fbfmr8883475e9.39.1783350175603;
        Mon, 06 Jul 2026 08:02:55 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:55 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:11 +0200
Subject: [PATCH v2 04/12] clk: qcom: gcc-mdm9607: Fix halt_reg for
 gcc_apss_axi_clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-4-745565101869@linaro.org>
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
	TAGGED_FROM(0.00)[bounces-116919-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: E0F4F712871

gcc_apss_axi_clk specifies a halt_reg of 0x4601c, but this is already used
by gcc_apss_ahb_clk. The correct value according to the downstream driver
is 0x46020.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9607.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index 499e0fbbfab9..feb91e1fca1f 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -1460,7 +1460,7 @@ static struct clk_branch gcc_apss_ahb_clk = {
 };
 
 static struct clk_branch gcc_apss_axi_clk = {
-	.halt_reg = 0x4601c,
+	.halt_reg = 0x46020,
 	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x45004,

-- 
2.54.0


