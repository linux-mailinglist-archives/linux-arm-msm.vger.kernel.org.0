Return-Path: <linux-arm-msm+bounces-117442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nkwjHbGVTWom2gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117442-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:11:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE79720921
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:11:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=XYUUZlAW;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117442-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117442-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9992030BBEEE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 00:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072A639FD9;
	Wed,  8 Jul 2026 00:07:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42645883F
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 00:07:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469246; cv=none; b=qkuAnef2bUqHNpVqT50gZMLlDwnbIIcDkRw8dT4ZVV4OE0SMtXDbZYOqM6IaiaRK5y1DcLJx7nthzMgAaYzhysmCP0PKVx9RF0kbedSv3ik/UXo5Sik9+FMiDqoE4gJn/DOD8OX+HbIT04zehSNSFCA9J4L+ztx7CFJlNcnbCVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469246; c=relaxed/simple;
	bh=QELXP0efqklH5qE/tb7wsAFTLcdUr6MfWusslj29lkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ayfEMW16sGZFcPr2p4d+wmaihxPnzRK9om9Jigar1eDNcZ2yVecc4wsXHKnqJgD1qJWjRH2LOiT/TuxOQH3Nm7XhsSYPn2zxT9xcWPjoFSRlCX4wcY3hiG30+a4uTwcgdTEpq3PDAlUkd96/gpAY+4r+XDVKX0DebOoGRU34MfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XYUUZlAW; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-475417f010dso30852f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469236; x=1784074036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZBW9NYAVgSClvNZsX0lNZoWG6gpuHIPaag9PPsncp4=;
        b=XYUUZlAW+ShgNGm4VQaYzaKMov6kVD9WO0SuHyZ5BSqu1B9nV1Sb6CTvn99A9tASnZ
         rt2CBzOPBsFj+Cs5uQ9NC1xp4JkPguVrSR81HupKYyzIY/Nq+O7uAox5Tsq8V1gE2gvY
         mtDuutM38wgPNXzGfeB+EGUdLik+ImOTREkJatm4dnOw5BvwG/P/o8Tc9jE5pQqIjqTw
         xt7B1Ja46xaazXnYYZWcxPg4r3CMG07ZIPKhzOLpH0fxXy4SgoLDp3anTzVkGuYmidIf
         NsrfqPjUvlzB8ytSwL7Vhk3iILnMKodXxBNyMnEXGJRRx1kLFn6ApqY1ija9jcoofd1J
         eCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469236; x=1784074036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hZBW9NYAVgSClvNZsX0lNZoWG6gpuHIPaag9PPsncp4=;
        b=dS70tbalc+NJf1ZIudQt+VkM7zTZI/76NenumgPeB6uQi4aEZhmTQzmaWL8c7hU8o/
         A8MoSOOyMosmt6aLMyZPa+XLWh4Y+oGgX4JfGxgVh1mt4hFbFzyXzbo0wCl0Rb6pSudD
         +zxtpJbJVSbqxAJSMvpQtpivsDS3xgC6+5f8BJ4bFeV9d4PO6X+oGxQ6Bwu3cJwaibFD
         iAMbFqwP1xHfRUXPTHYmhVGSdqj73R8dIAFEJuZCeo1NLoYyEDAdF0WxgHZDZF7C6Ehe
         HOPEKqnBeJrJ1KIUEyU4lfB/gfxVtfvXJJmPQKOKqERewjDedMMKY6yOn+LinSBpSt6Y
         oj3w==
X-Gm-Message-State: AOJu0YzqXegUu3nKIlGXAlaPWxwuL97l1jbIzHUG3mSzy5m7/rWE0oCP
	i1tY7dl3E2bOkW1mcVlbvO5wzhArttszIjVubL8Q+wBoJQOKtSJTgP/zpGHml32wt0o=
X-Gm-Gg: AfdE7ckxTkDHf96y/YuAol3QCFp+7ct0Vp3fhJSVDUqlDrrSCDeavNTs2rsUld0NLBO
	Ne+j5+Gv/htbrMzLGw1XImxGAD/7jfP87V246rHGPibC74JZzcPBmSLbPcZTjKJbcn5im4nYD2u
	l6d5PcK1DFpg+2RXx8izi0NC2A6g1pv6JQr5EHR3G4WxgFL1JB+LbbZnLL0ExptzNFA+/K+VXMR
	UimWEthZKkPr1bAYCCGrN7/K2KPlG+2R5ZrA0VKZ7cYWzqfsGUTwaAFu5IgMEE7FzLZkTShVU1w
	lbdnC+4j42FBYR3376yEnL4o1hhts3nbEhmCOb+fydfJAZ0plIunEyNZKQD7jFky5Z/v6p07J8I
	4ZfStPcXXw36lRXLiJ9Fgh84b7b1zfGCiDLrEoPbsp6TAcl5E1S0ZsbG0z42M/CzxzOHb31ZD+e
	mXXgyjUQzwM683gMw1fBSLdHQ=
X-Received: by 2002:adf:e34d:0:b0:472:c426:2ce9 with SMTP id ffacd0b85a97d-47de666b0d0mr6964115f8f.12.1783469235651;
        Tue, 07 Jul 2026 17:07:15 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:14 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:07:00 +0100
Subject: [PATCH v12 6/6] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-6-f8588da41f16@linaro.org>
References: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
In-Reply-To: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-0-f8588da41f16@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3031;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=QELXP0efqklH5qE/tb7wsAFTLcdUr6MfWusslj29lkI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSoDVvrSeIR1GEcpvrGvnRh7TNJeP7pIsOLg
 98ZcrZUbCyJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UqAAKCRAicTuzoY3I
 Opw7EACl8D4iTNEOm3rvEsFvIS8xj6DIdntmnPUbPQjtqGfBP6eDN60AH668T4DmLW82RkhSrg6
 YCdbHf7h4xf1t+4DusZ7fk9x8bP3vXnitqmEKmT77+HYNZFMinclo3b62Zm/lIEucCKmbX12782
 XGjMGss3fPpJeMNRxawoXmEZBmVSQ4GnzjSjTuNze0DDKn1SyUE2TaoHJ2UENluK1Lqw6POiTJa
 +5jSUT8+dFSWOjaBCiSn6yi0kDOzJXNChp6nipQy67T+N6lxnZwUcaD2NaPusM+xZFuk8cZYuJo
 2A47lQEp7xVhcQj3NOxTgPjnqZi/9hNejuY1jlx07g0IjZVM9GYClUoN0F0UI9BEkoadqdeSOkR
 hl7Spf9gYWpiAOVof8dCE1HEaL277FV7LRaGC9Oqlz7cEAhBhUUVyFvNOWdx5bPiM9407qQ24bd
 5ujbW+13N8krxjuOxrOwveQPw33E1KIgtTb6CT/vmQFCWM+3OgkUcXrtFQtheK8d7jgUpBRMZji
 VyIk7/1JvDshePSg9oY21VyDEylKwolhmnmv9mPYWWdfH465qg+irrMUwdQ0AZgv6gJDRpmfq59
 7GwEpAL+Js4ZLp7MHlklypkjhYs6m8GuBC+4xK7mLADRfTINiZQq8+9xBXLBNnDFqXWA/IMImsN
 OzFdxJ/KvcGF+CA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117442-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BCE79720921

x1e is the first CAMSS SoC to use the new PHY interface. Drop the redundant
legacy CSIPHY descriptions.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 37 -------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 146fea438486f..f360b2c99bf89 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4191,15 +4191,6 @@ static const struct resources_icc icc_res_sa8775p[] = {
 static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	/* CSIPHY0 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy0", "csiphy0_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy0" },
-		.interrupt = { "csiphy0" },
 		.csiphy = {
 			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -4208,15 +4199,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY1 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy1", "csiphy1_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy1" },
-		.interrupt = { "csiphy1" },
 		.csiphy = {
 			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -4225,15 +4207,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY2 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy2", "csiphy2_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy2" },
-		.interrupt = { "csiphy2" },
 		.csiphy = {
 			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -4242,15 +4215,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
 	},
 	/* CSIPHY4 */
 	{
-		.regulators = {
-			{ .supply = "vdd-csiphy-0p8", .init_load_uA = 105000 },
-			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 58900 }
-		},
-		.clock = { "csiphy4", "csiphy4_timer" },
-		.clock_rate = { { 300000000, 400000000, 480000000 },
-				{ 266666667, 400000000 } },
-		.reg = { "csiphy4" },
-		.interrupt = { "csiphy4" },
 		.csiphy = {
 			.id = 4,
 			.hw_ops = &csiphy_ops_3ph_1_0,
@@ -5803,7 +5767,6 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
-	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_x1e80100,

-- 
2.54.0


