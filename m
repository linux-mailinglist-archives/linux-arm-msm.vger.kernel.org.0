Return-Path: <linux-arm-msm+bounces-107490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E4NG3bsBGr7QQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:26:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCE853AF9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 23:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B668A300CEBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 21:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33AF13B95F6;
	Wed, 13 May 2026 21:26:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kElhJVkM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4293B635F
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 21:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707573; cv=none; b=GHJMHTapep+S8LofRSeZXvhXhgP7w9FK8dllrnF/yrDVREBa4vfFUnj90Rm/oCSazKL9wt2qPM3+4DbHVRhRqDanj5OLSerKCW15ztF/Uo7SapxJt7BtIdH6B7/8CjRF6Yk6uQdYAgevi4TMfzwtFtrDNHj22to5eoJZ98LE/RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707573; c=relaxed/simple;
	bh=Mhm1RAoItZvNB+ZiZLFkYTogX/daRG9UI9iX9MangPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hPBK9GD1Hj77+vj6nr9ecqHE3+9KXF0eQTGB1OpeYyRTWpNF+ycsBX2QsxloiBt4Dj+NmuWf+jyHKyruRYUEzXTmt7BNcnDKDqsD5XCwrfdUZYlYzAAIaIwcfBWMB6tiXMufn1hCmq21BS2pEeWSUKW/u+UR3iUoqn3zIwyvzEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kElhJVkM; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-65c09c1d000so6503109d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 14:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778707570; x=1779312370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z3zIlpRkXdoUaljOPQNDJKn8ro+VqSBQT0tgPG4kc/c=;
        b=kElhJVkMLRmYobh5B474uxE3wgOKXhmo5Grw3Pu2p54Fw40VjYDEj5DMsgmCRkimHJ
         jP76ssUJH1XWh9kO/SvNVgnapldb6TxArGb/NK1Pkh32SOh/8XHAuaZwRW2lbtBaDN4F
         YG0TI87UMq64sEzBsRQ8JO7lCrXJ5sls5gJicohxLay+qRqd9NLyHvXcSWGYlE5mqG8u
         cQBw+AftvOrP4fFwD1P9441E2uRYD8D0aSbLRJ/Iiknuwe6aovIg//QEifx/lkIIKK9E
         Eog3YuQa/MZ7Iud8TkBDtAkc0BC6tnEue5RDH5fIgLgY5K3iEAWgVKLhYFT4yHGW5U15
         kc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778707570; x=1779312370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z3zIlpRkXdoUaljOPQNDJKn8ro+VqSBQT0tgPG4kc/c=;
        b=Ce8/SwGygadtUQTvkUgykYtp1zF9O5wbs2jILZ6e6MZb4QAVhx7UPO9vMcIPIbCzgD
         r2VrSmGC4siISwG6yuKW3A/5yoCo1Qyptg0rGZYf0dd1Hv9bH7RKcq3iUFMFIcW2FVy0
         TPcTT/15ybOtbsUkJX+tBRqMOZJUxmxkImMtY9SyJWFlViFXnqmNcQv0jKEa3QJuoh6B
         YNkdDq18hDWVcsrAb+jDtXZ6K1ncJVuquh/dyW7qqPEIwkMH8lcd+GEQoT92sTz67jqG
         SqntXHf7EEUyA8WHaUzbBxXnt3n56ydYXBKace8M3+vIPPGPt0hh8M9awPay7SXIBsCG
         Ja6w==
X-Forwarded-Encrypted: i=1; AFNElJ/Rr5EoyqnUzsJw4dvm8A/UvZJ0BiqaUvf8hvVr+OE72h7xJlz2mkIPyfrJhpokB8KSgLbCIB/SDKNsqEwt@vger.kernel.org
X-Gm-Message-State: AOJu0YxV9evpO7N3qpGtD9qrRhtNTkwMauSNoDv6qy8EImvwE0NTWK+6
	LHy2yAIWXD1jUDPX9ZA+qGX/hrjHU8CkYN/NHPvx5KiG/tOjAnRd0viFBFoyqA==
X-Gm-Gg: Acq92OFrYPmoNj4yMVbUc2yTF0WBcz3eN0aHoEblWDVBACzQVGwWHhea6QA403CBtRa
	mGxDVcZn78lqhjmXBXb/01O/UbijPeVj82kNQsiP8l+iZVSt4U/z1hOHnRjgy768TjUDNIOM3rX
	StSawwSkUVRAG2v2j8y5F84Aos+sKRnu5j+pIwmnuwuPKkrgNIfpPoY3xyh23r/EDuGha6ZvNWh
	GuMM4W9VHI7n0JV5OyTFRAAn9VlXunU1D9ysNWpgam0QkMi5nczEN92g0b0EFbyVFVW29MYDV7J
	xwxlrlmCbRCe5qEEMHKIK04zWcK1gD2f3DsExZ1AsuTKVq2jGeZsAkAGfs60HNmzEj7sBRiz91G
	dGFyGnJ22+2DY3YZunu+8puoCDfojmdc5tPMGFgTSyo/DoNAres3yl0SqYs89e4AyyI6Ru6pyAE
	LFirHc4t+1u91ANYk/2gHKi1LEMQ==
X-Received: by 2002:a05:690c:c15:b0:7c6:e377:1dc6 with SMTP id 00721157ae682-7c7e3134169mr12889267b3.0.1778707569565;
        Wed, 13 May 2026 14:26:09 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f28b810csm3715107b3.14.2026.05.13.14.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 14:26:09 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 14 May 2026 00:24:34 +0300
Subject: [PATCH v7 5/8] clk: qcom: gcc-msm8939: mark Venus core GDSCs as
 hardware controlled
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-msm8939-venus-rfc-v7-5-33c6c6fb9285@gmail.com>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
In-Reply-To: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 4DCE853AF9C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107490-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Since in downstream kernel VENUS_CORE0_GDSC and VENUS_CORE1_GDSC have a
device tree property "qcom,supports-hw-trigger", add a HW_CTRL_TRIGGER
flag to these GDSCs to indicate that their control can be passed to
hardware.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 drivers/clk/qcom/gcc-msm8939.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 45193b3d714b..243d31a32e92 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -3664,6 +3664,7 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 	.halt_reg = 0x4c02c,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c02c,
 		.enable_mask = BIT(0),
@@ -3681,6 +3682,7 @@ static struct clk_branch gcc_venus0_core0_vcodec0_clk = {
 
 static struct clk_branch gcc_venus0_core1_vcodec0_clk = {
 	.halt_reg = 0x4c034,
+	.halt_check = BRANCH_HALT_SKIP,
 	.clkr = {
 		.enable_reg = 0x4c034,
 		.enable_mask = BIT(0),
@@ -3753,6 +3755,7 @@ static struct gdsc venus_core0_gdsc = {
 	.pd = {
 		.name = "venus_core0",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 
@@ -3761,6 +3764,7 @@ static struct gdsc venus_core1_gdsc = {
 	.pd = {
 		.name = "venus_core1",
 	},
+	.flags = HW_CTRL_TRIGGER,
 	.pwrsts = PWRSTS_OFF_ON,
 };
 

-- 
2.54.0


