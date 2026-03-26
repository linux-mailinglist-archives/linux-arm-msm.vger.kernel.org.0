Return-Path: <linux-arm-msm+bounces-99980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG/cFfiLxGn50AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:29:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D567832DDFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 02:29:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02735306D88D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 01:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6300037C10C;
	Thu, 26 Mar 2026 01:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltG5IQ1l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E04B37CD25
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774488501; cv=none; b=Io+P8mpT6ccw5UlWsobu5HpZz5t3egnubocul+P78CLZDpdqa5WL/9S0+Jp3bt5rNxxeyCDWZCaIjgzX7rc2deRgXBmT50K0fS8AMRJo1Xuuib7gLZfJ5zIxu2/+DH3DUGwNPi8WUK+AWR5tvKavCnn7AZyrNszrw90n9sA770s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774488501; c=relaxed/simple;
	bh=N6f8XbQrqLkocc2xm2zf/znOnvl2dvw/ToKTgJkKLbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tY0weG/22Zi9EaxBY74woEK4tjVH6JZZtc2d2LHh8qLzUtyJ5aJc91Kz6hRi6NKS6wVB/dijPD4cDg6W01Ev1EFisxuLIZGm0bic8IQgMkNrX9V2NAy+lmoAgMj6YV5dr6j1fbgoa6gASjI3MkSIHkSIXp1HFpqpvkzDde0D0JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ltG5IQ1l; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-439fe4985efso278534f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774488494; x=1775093294; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OgXkjUFi8RNX9zADMCF4Q/I66OJ8AZWY+meNn13gnkc=;
        b=ltG5IQ1lStIVtAwjl5niPwGo+gosbh4SgN5XX9ZAYRGm+6SNX3rEEFveufg1cf2SQe
         +wCEIOzM5tV7rZ3bpcM+wSo4jhtQAPpjlJxt+X3yCMSYLLkDVRZGqV3Q/JMva8SCGcdI
         VH5zpZfX6ctCJE3FF54PU4D1X7GZg4IUS8W2nUi1Xcdm8axA4ioVtEr1Vngmt6+zGk+N
         7z8NempHIZ2IOjIOCcpcT0THhi5ROYFgud9hO6PuRv08mVwBl5eFZEApVBLQZqAdbdTI
         /v6F3V4lwKJ+y+QVRhgaR5QBSUdpWLmzFOh13FOcUMD6thgbgjIn47sJN4oqCudUh0Eu
         2ECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774488494; x=1775093294;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OgXkjUFi8RNX9zADMCF4Q/I66OJ8AZWY+meNn13gnkc=;
        b=SUw/JM7U2ltBkIlras5xWIyF0ub96HQfH5npCsWP8gZKqW+BgbmtR1oKE67pVhb68D
         eC8KS06mWxw/JfEsG83I5HzjCTwFTsm5oEl0BC7u3vmzEXgpmJREF5GGR1qypz2XdQjx
         ljasuAtTJxsuz/mMRgtudu8I5/zX2Nw8A6A1kSFO5rPcSIYlnU0HrtpxURaCClvo8GkV
         e044+0kqTu1hwoMhum2H+ur7V3eQHnGkK/QGhak6n66a69OtjvziCkw7rZYPUrKSSoTF
         //66sfXmOS7eqFt9I86tapTZzEc7IsSBQy1c4k2h0M2aojb9IFTMAdfx3pKqIFZkU1NK
         yi2g==
X-Gm-Message-State: AOJu0YxQzFeTD5RziRQH/7bfPn/CBX7wJKgm+oy5GhkliXuO41xm7Yv7
	qWj9P7PHRyXZkdjMbZVo0zVVtEJl+1DfiF6ky54vziIaRRzYM+N9vOBfU7smH/kOKao=
X-Gm-Gg: ATEYQzzW34hmey2lxOLgbiTMpf78SHscx1tJIPLwC/EJxrTJVq5iYwXBfkR1aJZZv/C
	+NtDg/r6lj4ydkBNiiKUlQYRj5/srxrpL98gUGgCs4SrVUOThgr0smhyAIdlqeNVeUSIyE8dRVN
	4pD4m0u7qJ4dEKy1aJCKO8r2CIZ2SAIHCqUtTNvew6YV2X1Fh+42vID7xpZqJfAwZlP8OXs2NNU
	Zc/dWK+mRb7qkPF0G6udYWVcIu/dMxAk1uzL3s1jhBX2Vu8+s3gPJKOwNGQLRh8t+kphZC6T46w
	WCLUbUXq2s/cLrlaywDeyojp9WGo41jjG1OeAk7xS4GRo64nDyX2x9bgZDLv/OwENWlc9Vqe6K6
	mdJNEeNKfKG9ZwmNLHoB3aDAmjpMkLTInTVnczjN8ZovLr9wKn4bm7sIyx71SwRojw2mMcwEA2h
	cc8UXKLo3Gh7fkekrJANgNcEe9z2mKmWGqaAg=
X-Received: by 2002:a5d:64e7:0:b0:43b:3c05:d7fb with SMTP id ffacd0b85a97d-43b88a39b7amr8254132f8f.54.1774488493490;
        Wed, 25 Mar 2026 18:28:13 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.163.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf1c4sm3918051f8f.23.2026.03.25.18.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 18:28:13 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 01:28:35 +0000
Subject: [PATCH v11 7/7] media: qcom: camss: Drop legacy PHY descriptions
 from x1e
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-7-5b93415be6dd@linaro.org>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3159;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=N6f8XbQrqLkocc2xm2zf/znOnvl2dvw/ToKTgJkKLbQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxIvAW/02o1imMUf4CeWHGfYnnSEV/h55Bnm95
 89E+DnlACmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacSLwAAKCRAicTuzoY3I
 OmeHEACz2r5rOYRYzaR2gfd8IFZe4AGMT/qP/a1S1ZqysbMJWb+lApAt50A/4VelvLBR76cDeo1
 9rYvr6oRXNFZWJZpk+JHQ3jx2Sm9IZove9pAV4pWYxVJsym9r+koD5zQwywQOeFvyvizvsGRsEq
 fnRYzHymI2Lo9QnJR+mUlK5Gr/FXJ7ElGVI11WlWQZLSbO125JtS0e3Ve1AcSU05RTiZ++J/LrV
 m91WApzYPYJUFGwdDxd4dWUZC51LL8LTSLDFAWYU6DuIP1AwS5k4+DdXgxeLu+canP8K53jC8QV
 Er90YGREEx43r3S2eXwS743Z5zYXiU2QNc1W0WPvsQ4+D+kOskrMDDakHugusK0IJCoYdx/t6Ti
 jTBssLHgS9fiyypxCwV4LKuJOO81S6g5YqxSm13BbcWN3OUn/U5l/yNprtsnS5pAHAyb55kC/RF
 9iinNXo8ZCN7rUuddhGsZtZgPWiqrI0WTlYJHFCH1uenDrdYnm893IsSTBcSeRiFYU3cUuQ4jfA
 bBxQupEW/n2Ut19upmltARvES2wfzAv0P5q8cdI2S8vtvZcf0MYPrXWIdGpwaF2i71JNMdYQVkI
 So6btYsJc6d5lhvoDAUJVkqDYu6K2T7WQumaHSquDzrmYNv6DMxk4ZNuyJ47Y/KYazIA0nu8vPX
 QfPKTV/SBF53dDA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99980-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: D567832DDFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

x1e is the first CAMSS SoC to use the new PHY interface. Drop the redundant
legacy CSIPHY descriptions.

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 37 -------------------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 224b5472d7771..3b092560b5df5 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3896,15 +3896,6 @@ static const struct resources_icc icc_res_sa8775p[] = {
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
@@ -3913,15 +3904,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -3930,15 +3912,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -3947,15 +3920,6 @@ static const struct camss_subdev_resources csiphy_res_x1e80100[] = {
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
@@ -5365,7 +5329,6 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
-	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.csid_res = csid_res_x1e80100,
 	.vfe_res = vfe_res_x1e80100,

-- 
2.52.0


