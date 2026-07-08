Return-Path: <linux-arm-msm+bounces-117441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q9CFMNCUTWrx2QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:07:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 083567208AA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:07:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=QwW4Ib41;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117441-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117441-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D3DF1300980F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 00:07:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8807A1F1932;
	Wed,  8 Jul 2026 00:07:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3983835959
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 00:07:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469236; cv=none; b=arV14F2uIOSfMJAnLv8dskpL1aiR16MZAaoYIj5PWN42Ue3fjppx8pn8hOHpz6C51aXVA6upXUB6ryEEGRYzHuo7xSIQ8EvcsyLvv+XyxQjK3Uf7Y6QzHjJjE7Zghstjk/g4fswNzOnehJ5BmMUBeZFoEPyeEgsmqPsWS9aG7eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469236; c=relaxed/simple;
	bh=s55OzTTyx4JFc6OFNhbSkeBARl7vZOZjP7szqFRTAIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dOd7+SLGK/3IUrTfPEDQPx1VXocgFuIVsw1QNMisTWWyxMMJmXL3Oi8DGBGkJ2GTzflsdgbogQCZZtWIipJ3LwiGDoxE7M2zywMF3+GuZOncm1daAjiz1qW71nHP4VcSFGGrLTdV4fcJX9KXWxVybozL5WCz+sV4ctgQjuyXfo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QwW4Ib41; arc=none smtp.client-ip=209.85.221.45
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4798bea72f9so59217f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783469232; x=1784074032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QPdOZb6jlCs+PFV9PlSG/tALKVa///KuSVuOG45C9AA=;
        b=QwW4Ib417LSixXhNE5pceTl4MaO+pH/UtEUFFQAJzjp/2EwqS13UgF0sJ4Gh1WtIxB
         N48V+U6xCiKGETzPslfVZgWjbEVx4IcpNbFfkvfs+ynGO9KH83INsCXUHUDyj9MWR85l
         x9pewlwUt352ppWrJ4S2eIF01z33PjXW3EKg2veQ5582i7PFleDsqUpFOeqZJY1I39CZ
         gWu/cvpcC80RBWK2GawOxKuz5Znx61zKuFmeCVGu/l0+epACLSQalR2TdFmdr4Yl7I7v
         1Ov7SllP4gWZQ4D08DHIko1lEhH9E4R7pXmWfsYZiPtDamozPYvS7OjiRn3BxbkTkllq
         crEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469232; x=1784074032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QPdOZb6jlCs+PFV9PlSG/tALKVa///KuSVuOG45C9AA=;
        b=OH9NXqKqpopxmqztQFQ08sj35UukYKEJrsZN7bcbR/KhG0iXxucMMhAin9k2Riy8m8
         lzPJIEizN0RhBHMbAe8HnghTN20P3KW6dVQY30M524JxuWOF8RYuOz3KhyTkLlrbfcOs
         mNnf18Z3gQDu2thwHPC8/uus86ssIPoUCIMIwlceeQokf5MWAg4ts7y+dZBzIzvKEfN2
         D1PMEnoQB/Ji+JDVOL4Wt+YaYGbTrRGF1QKW2UF3euGuW2i86Wlj6F/zewtRhkPoe9Jn
         ifDBANd/sNDFqWf2kuj3apjMomJCkopr5+TtagQAJ8vCAudE0htVjYZbIU/zuZv4sGzR
         8kqA==
X-Gm-Message-State: AOJu0YxrtYapF8Pa5oO8PVvYhcPmsAUlpK//JKNDTnlDXoyoFxvEAlgB
	1hNs8xWfqrSiqVYcL4LsyaflRcjssXmGLTZUKxNAddAPUMEfwTFAE/27czPrHN2hd/o=
X-Gm-Gg: AfdE7ck6lqNhs+Qo5c9H9lPrtd4Lj97oEBndABxy9Nxj4DpX9S6hRBjBDDsaz3KvM7u
	ftK2E6eO6m28rAu6VXZt3PaqVoqlL7rb76T4lC/aTFnOmwAvl3zF6R8naV0CiuwlJ0v4xriJAvD
	YkVqclTJBgyocs9dhJWBrwYJ/tmPm6A/Y5FgFLWcv9SBjLTOIr7bQsk965p/bq/souKC4y09cuY
	pm1x5wXDp7oYdLWDMwOLqvTqI+HMxs2cP/DIBGMjZx1Fl/ban+iWpUqytOB7wcNKHiMEJxofhpi
	PengIOwuwwQX2aW/3UXj+dKfl42jL/uoxGm9Tsvl9gb3MHY/ZGAEB7nsitFEwkz1+IKsEls/bSQ
	gWotu/IQrDfV+UdHjy8jYsYvLZeP/2PVPkdW+f0SxfAtMSpGB2ue5cbOF+Nv7Qo5Or9Z2IqcrPp
	RZLDmphFz3muJPn811mwkjLtI=
X-Received: by 2002:a05:6000:70b:b0:475:f6b9:5898 with SMTP id ffacd0b85a97d-47de668eeadmr8029910f8f.1.1783469232315;
        Tue, 07 Jul 2026 17:07:12 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm43757092f8f.17.2026.07.07.17.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:07:11 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:06:58 +0100
Subject: [PATCH v12 4/6] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v12-4-f8588da41f16@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6263;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=s55OzTTyx4JFc6OFNhbSkeBARl7vZOZjP7szqFRTAIs=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZSnpOULJM4zeXtSsdG3VgnKgEyCSvqOMuTjs
 ippIBikeLWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2UpwAKCRAicTuzoY3I
 OhsWD/9Q5X9CCq7I3a1PM9CSjJ1aQxwK3triT/TIqdjHpccH+cq0oYHiaGqJGR70Mnr5kHPS/v1
 58WXvwGDjluui9OOIh36uhQR3r7syRGOERWl64nzjygIrKVfnepozibN5MG5vuYkaaaPh98B6g0
 5qkNivBLydojHVdhYNktk3pvaSGEvC+2BSQk5W5QQ9Ubv/aLf9oswdEcoqn1OoTPn1qFSCDYnxK
 V3MAbTHw76kxM4oxX0/fZ8oEkJEHpDEmXntvZ/91MI1Yz1Y/L6weat0DKllCdfMUqwTCb/c6+ns
 MKW5ODqVwdFEQ2HJL+vwt7AUmN+YMtglc5YCS9K8hlMKERfMK3taa9eKg1ows4mpcDm8NpliAZc
 HJfG7IMnc5BdLqTIktQYvPjvwrhf7zyHkU+xWVfGzJjPWR0XUxotCmwH6AsGRc98cxwhj6VjG1M
 3qrnh/DXQpiweuyLOVE679Qu1wBFpn8GtXPxqldnYBb/siijl4CMHBZfF8MswxGV7qMGW+qqUrF
 3JGIlh4SrHH5BcSkIXy/cbaC+/D7voQ4kdQKZNMT4aQJVp4foS+AF9LPYBYZQ4gDuP7SiFpdx6e
 EEdYzUjo73yGSJg+f+AH6/e72ASroHU3dKq70sDD5WPqm0z86nf17vT1OHGegBDzTlWV//h0P7u
 UaZQuFGWxSDGu9A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117441-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:konradybcio@kernel.org,m:vladimir.zapolskiy@linaro.org,m:bod@kernel.org,m:loic.poulain@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 083567208AA

Flag which SoCs have legacy - builtin PHY code. This will be useful in
subsequent patches to inform PHY bringup logic if legacy bindings are
available.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 95e655a8b6aa0..e814a96953b1b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5512,6 +5512,7 @@ static void camss_remove(struct platform_device *pdev)
 
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x16,
 	.csid_res = csid_res_8x16,
 	.ispif_res = &ispif_res_8x16,
@@ -5523,6 +5524,7 @@ static const struct camss_resources msm8916_resources = {
 
 static const struct camss_resources msm8939_resources = {
 	.version = CAMSS_8x39,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x39,
 	.csid_res = csid_res_8x39,
 	.ispif_res = &ispif_res_8x39,
@@ -5534,6 +5536,7 @@ static const struct camss_resources msm8939_resources = {
 
 static const struct camss_resources msm8953_resources = {
 	.version = CAMSS_8x53,
+	.legacy_phy = true,
 	.icc_res = icc_res_8x53,
 	.icc_path_num = ARRAY_SIZE(icc_res_8x53),
 	.csiphy_res = csiphy_res_8x96,
@@ -5547,6 +5550,7 @@ static const struct camss_resources msm8953_resources = {
 
 static const struct camss_resources msm8996_resources = {
 	.version = CAMSS_8x96,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x96,
 	.csid_res = csid_res_8x96,
 	.ispif_res = &ispif_res_8x96,
@@ -5558,6 +5562,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,
@@ -5571,6 +5576,7 @@ static const struct camss_resources qcm2290_resources = {
 static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8300,
 	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
@@ -5587,6 +5593,7 @@ static const struct camss_resources qcs8300_resources = {
 static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8775p,
 	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
@@ -5602,6 +5609,7 @@ static const struct camss_resources sa8775p_resources = {
 
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_660,
 	.csid_res = csid_res_660,
 	.ispif_res = &ispif_res_660,
@@ -5613,6 +5621,7 @@ static const struct camss_resources sdm660_resources = {
 
 static const struct camss_resources sdm670_resources = {
 	.version = CAMSS_845,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_670,
 	.csid_res = csid_res_670,
 	.vfe_res = vfe_res_670,
@@ -5624,6 +5633,7 @@ static const struct camss_resources sdm670_resources = {
 static const struct camss_resources sdm845_resources = {
 	.version = CAMSS_845,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_845,
 	.csid_res = csid_res_845,
 	.vfe_res = vfe_res_845,
@@ -5635,6 +5645,7 @@ static const struct camss_resources sdm845_resources = {
 static const struct camss_resources sm6150_resources = {
 	.version = CAMSS_6150,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sm6150,
 	.csid_res = csid_res_sm6150,
 	.vfe_res = vfe_res_sm6150,
@@ -5661,6 +5672,7 @@ static const struct camss_resources sm6350_resources = {
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8250,
 	.csid_res = csid_res_8250,
 	.vfe_res = vfe_res_8250,
@@ -5674,6 +5686,7 @@ static const struct camss_resources sm8250_resources = {
 static const struct camss_resources sc8280xp_resources = {
 	.version = CAMSS_8280XP,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sc8280xp,
 	.csid_res = csid_res_sc8280xp,
 	.ispif_res = NULL,
@@ -5688,6 +5701,7 @@ static const struct camss_resources sc8280xp_resources = {
 static const struct camss_resources sc7280_resources = {
 	.version = CAMSS_7280,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_7280,
 	.csid_res = csid_res_7280,
 	.vfe_res = vfe_res_7280,
@@ -5701,6 +5715,7 @@ static const struct camss_resources sc7280_resources = {
 static const struct camss_resources sm8550_resources = {
 	.version = CAMSS_8550,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8550,
 	.csid_res = csid_res_8550,
 	.vfe_res = vfe_res_8550,
@@ -5715,6 +5730,7 @@ static const struct camss_resources sm8550_resources = {
 static const struct camss_resources sm8650_resources = {
 	.version = CAMSS_8650,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sm8650,
 	.csid_res = csid_res_sm8650,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5729,6 +5745,7 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_x1e80100,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63b..698694d3064ea 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -107,6 +107,7 @@ enum icc_count {
 struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
+	const bool legacy_phy;
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *tpg_res;
 	const struct camss_subdev_resources *csid_res;

-- 
2.54.0


