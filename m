Return-Path: <linux-arm-msm+bounces-94308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IE8rH6xaoGlPigQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:37:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6BD1A7B23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10C193155396
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CDBB3DA7D9;
	Thu, 26 Feb 2026 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nycydzJz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC683D5249
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772116137; cv=none; b=lSMehpwjfzVQygoBUsybh3i2q1Kq0n0AW4yO9WOLq+EVre7Co7Fs+7Ab0kI9agwUNMo+DJGuO8m0iaWOeALOI7GaIXOFSRjOmV/ZyTUv97B4voO8BjyjKtGBB/u1irUHyYP9OhBNiz9t7MzioLLbAdxlYUFso5GcyrncilLydE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772116137; c=relaxed/simple;
	bh=T56zPiTpvN0GBLBYQMGo9vQwbDNYOKXq8zVh3tggF/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gTqbIVCFG3DjxZQT4KQBm3YhNTsLk4sM8ZkH0UgH44uzJUxE+JxCQp2cWTDRxiSWAFQGkRW1TYRUyyX8FQoHfOT3oyBXjcnO4Y7O2AYjZQeyh8Lkv+LhIYWTuMpI0V0JP08buCnu8/+B0OnKRhI6pSNsOSoiOLWrbXJIBTLkzbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nycydzJz; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4807068eacbso7903115e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772116130; x=1772720930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJflEsJoWFuWsTkTz3+7munVvf3KCvZoSO705SUTMdI=;
        b=nycydzJzirTOBMNdtHm+Bi60nEds+2kfRU8ArAs6GdGYGqbdkve4XmfElmiD598pQO
         yav2DYsIIk7J/dmlg01ygdMCYUWhy4Zl3qv076J3b68mJV1YCI5rJNX/oCBmHu3dTINF
         v+gLKxqaH8C4ueZFewBOsm2NzTgPdtja6D6muSa+U7EdiSVxgqReXDmxyzNiMtID3B9R
         KceOe+8IeC546gGjyTKQeCbeV5Di3MvOAd+K3eOgyX7bPN831O+QwzDqVmt7yoqdHQmj
         tCCLM/3X0z1kTlhhSEwxeR4aoOkE+YPqWdxZrW/OPevAOdtjAl5UUOkZNRls03eWjPQJ
         Abfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772116130; x=1772720930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lJflEsJoWFuWsTkTz3+7munVvf3KCvZoSO705SUTMdI=;
        b=TMfciiJQzE+KddZKaD38eMhobYa1aBFflwXzP0pnugbt5TDNvtHvON/9sPZPhyh785
         Io60qeV+XanzMK/Vn8+l5BSp4YT963M+Al9zewaLGUBpMOyfug4iM2chmN8W+qatyIJr
         z/gQSKIVvuw2CUvBhEQgCaQkMX6CBv29ayyrB7lKk91GYJbuNFLGk4FZNgBC/35Dkqhk
         vEdtcLqv4fKlWnR81fxBKbIgZ1+Kr29Re5m8t5BqGnTLvqrTLYGdx9RIxSUFT7JLFW0O
         y29nOqusG4EUd6YQiKoVhcJfo6zKZVGOcj8Oo3d7RU7t7VTbk091xnjZ6PE4diErkZ50
         Hs/g==
X-Gm-Message-State: AOJu0YxBwjMc3uGapjuX2SqKMTWrpSz9iDLG3L9Mi6TmHh9remkaLFvp
	yqu2LozX2kDFPkgdzKMq5qmmK/xSK5IAQucpFd4hAlY1wSC8RYzjXCZex346DnEV9pk=
X-Gm-Gg: ATEYQzxeGE65QE2Vb+Orlp8ypkcGGMxk+IduAfyXmlHnrFFuCthD9OJnGy97DS0XKBW
	K75YFxtfowYc9iol19zsrQDwJGACdCi1xDn3tpT9jaAOkxqeggR/qtiQzKXPunDD0xNhYyd0vcc
	xwj3K8DciRXc8EbDFP5BWxM6VPUxgJYOIVgadCgNEbupgFj5uo1lSXR6Ls2WbFXOLXsdlTShnfQ
	+y3OBNgpsvLByJB1KeoScUBlGT2xm9nOwjdR1aAWbsR87gCO+qwqNqG3hj8CBMyZkZmcu+6CgGH
	qeNPYMxNLkYB+bEbG+D6T7SSC/qpJIsL8mNhrLz5uUqyadlMwQznZ4Rwa72+Cjkqw07Wlal+KRl
	u+VvAo8wyZRzEhB9CGbvvgFDbKIz4omHvrmVaqiZXEfIvMaDKndJgUae+v8QhHu1hXTcktAJ3Tv
	Z4KAbxZEZnN8f0ex3fNO2VWDUfEoxkF3zeGHg/vdzwHUulk9SzifhTNjJ5LDLO1P0F
X-Received: by 2002:a05:600c:8b35:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-483c3db518dmr37366855e9.7.1772116130379;
        Thu, 26 Feb 2026 06:28:50 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm39219897f8f.29.2026.02.26.06.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:28:49 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:28:46 +0000
Subject: [PATCH v9 5/7] media: qcom: camss: Add legacy_phy flag to SoC
 definition structures
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-5-a59c3f037d0b@linaro.org>
References: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
In-Reply-To: <20260226-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v9-0-a59c3f037d0b@linaro.org>
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
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6305;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=T56zPiTpvN0GBLBYQMGo9vQwbDNYOKXq8zVh3tggF/U=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoFicPCtmAzYPmUyS5HacNdaTvKDcw1dpuJf5J
 ZbOvgYLr4uJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBYnAAKCRAicTuzoY3I
 OsC+EADC4ubfnfi7+snjoCswaKyRpJyw3t37B4+7oRdHbRjiNzinZdHXIt01BLu2UNJyvqfWnFw
 NWRkGu/stz/Ee/ex8hmG82C3xUF1Rutp2+tIDQdGHATho9v5s3a+jCo7YDFq5mIqWINvYEzeuJd
 ATpxRi6YWwb465abC3YYLLKyzCiVXZ1VhLF91LMa5XpDa3lOKsveDSqCw+js1YSSASpgDgVVxnj
 S/EMeA+dryeW/UaMMUo0t06r2m3hl27m1LOa5MC9QlndAbDm0wxcbNMguIvzC1fDHakm1f6/80t
 +R6p1m/LMnkJG0yQIof6Pn/+/Og1d+KjCuBV4oKuX2eDo3fjgRslcGhcvf5XvZx0XATsgli2Vif
 1fkGsAYU546dAzbQPbr4WDfTcWsUzc0WBVD+uPLoRkWapTSBOsnrUUZG/tkvnNMcLthT918GaJf
 8rWb8O1tcOzxLNxHITctQXxHuYVXgluSzKrwzf7E4/oS0uZy+41IuaWxatUSLAcxrdHuT2/GWCz
 WCykOtv1qa5OOi3ROWAwuaSztLBa23OjrbGREhmivYlswag7h2ZsTcGISM+aC86gCqe3qAKP1iH
 apCCALjWBoztPk2CoA++UIV8cUNXm4c3CQebKDeSPNuO/XSv+c8PALG9zHDHM+G0dbHXIxOO6PT
 HwPI9FIIgwxKufw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94308-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: EA6BD1A7B23
X-Rspamd-Action: no action

Flag which SoCs have legacy - builtin PHY code. This will be useful in
subsequent patches to inform PHY bringup logic if legacy bindings are
available.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 00b87fd9afbd8..5fb5ad87e1671 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5104,6 +5104,7 @@ static void camss_remove(struct platform_device *pdev)
 
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x16,
 	.csid_res = csid_res_8x16,
 	.ispif_res = &ispif_res_8x16,
@@ -5115,6 +5116,7 @@ static const struct camss_resources msm8916_resources = {
 
 static const struct camss_resources msm8939_resources = {
 	.version = CAMSS_8x39,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x39,
 	.csid_res = csid_res_8x39,
 	.ispif_res = &ispif_res_8x39,
@@ -5126,6 +5128,7 @@ static const struct camss_resources msm8939_resources = {
 
 static const struct camss_resources msm8953_resources = {
 	.version = CAMSS_8x53,
+	.legacy_phy = true,
 	.icc_res = icc_res_8x53,
 	.icc_path_num = ARRAY_SIZE(icc_res_8x53),
 	.csiphy_res = csiphy_res_8x96,
@@ -5139,6 +5142,7 @@ static const struct camss_resources msm8953_resources = {
 
 static const struct camss_resources msm8996_resources = {
 	.version = CAMSS_8x96,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8x96,
 	.csid_res = csid_res_8x96,
 	.ispif_res = &ispif_res_8x96,
@@ -5150,6 +5154,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,
@@ -5163,6 +5168,7 @@ static const struct camss_resources qcm2290_resources = {
 static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8300,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5177,6 +5183,7 @@ static const struct camss_resources qcs8300_resources = {
 static const struct camss_resources sa8775p_resources = {
 	.version = CAMSS_8775P,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5190,6 +5197,7 @@ static const struct camss_resources sa8775p_resources = {
 
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_660,
 	.csid_res = csid_res_660,
 	.ispif_res = &ispif_res_660,
@@ -5201,6 +5209,7 @@ static const struct camss_resources sdm660_resources = {
 
 static const struct camss_resources sdm670_resources = {
 	.version = CAMSS_845,
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_670,
 	.csid_res = csid_res_670,
 	.vfe_res = vfe_res_670,
@@ -5212,6 +5221,7 @@ static const struct camss_resources sdm670_resources = {
 static const struct camss_resources sdm845_resources = {
 	.version = CAMSS_845,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_845,
 	.csid_res = csid_res_845,
 	.vfe_res = vfe_res_845,
@@ -5223,6 +5233,7 @@ static const struct camss_resources sdm845_resources = {
 static const struct camss_resources sm6150_resources = {
 	.version = CAMSS_6150,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sm6150,
 	.csid_res = csid_res_sm6150,
 	.vfe_res = vfe_res_sm6150,
@@ -5236,6 +5247,7 @@ static const struct camss_resources sm6150_resources = {
 static const struct camss_resources sm8250_resources = {
 	.version = CAMSS_8250,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8250,
 	.csid_res = csid_res_8250,
 	.vfe_res = vfe_res_8250,
@@ -5249,6 +5261,7 @@ static const struct camss_resources sm8250_resources = {
 static const struct camss_resources sc8280xp_resources = {
 	.version = CAMSS_8280XP,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sc8280xp,
 	.csid_res = csid_res_sc8280xp,
 	.ispif_res = NULL,
@@ -5263,6 +5276,7 @@ static const struct camss_resources sc8280xp_resources = {
 static const struct camss_resources sc7280_resources = {
 	.version = CAMSS_7280,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_7280,
 	.csid_res = csid_res_7280,
 	.vfe_res = vfe_res_7280,
@@ -5276,6 +5290,7 @@ static const struct camss_resources sc7280_resources = {
 static const struct camss_resources sm8550_resources = {
 	.version = CAMSS_8550,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_8550,
 	.csid_res = csid_res_8550,
 	.vfe_res = vfe_res_8550,
@@ -5290,6 +5305,7 @@ static const struct camss_resources sm8550_resources = {
 static const struct camss_resources sm8650_resources = {
 	.version = CAMSS_8650,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_sm8650,
 	.csid_res = csid_res_sm8650,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
@@ -5304,6 +5320,7 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources x1e80100_resources = {
 	.version = CAMSS_X1E80100,
 	.pd_name = "top",
+	.legacy_phy = true,
 	.csiphy_res = csiphy_res_x1e80100,
 	.csid_res = csid_res_x1e80100,
 	.vfe_res = vfe_res_x1e80100,
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 6d048414c919e..24ec3ad7990e7 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -104,6 +104,7 @@ enum icc_count {
 struct camss_resources {
 	enum camss_version version;
 	const char *pd_name;
+	const bool legacy_phy;
 	const struct camss_subdev_resources *csiphy_res;
 	const struct camss_subdev_resources *csid_res;
 	const struct camss_subdev_resources *ispif_res;

-- 
2.52.0


