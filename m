Return-Path: <linux-arm-msm+bounces-8465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDA783E143
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 19:26:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9CFABB24293
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 18:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A29220DC7;
	Fri, 26 Jan 2024 18:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fQeQMg9+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D99E20B34
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 18:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293594; cv=none; b=qCzinDbFYGHpGL/3JSJ80MRb7dPJ/Af6998By4JTatwh994jR+p3k8ozmD4LzhwSaMlIDC2/jfeTeDE1riczok+Ot5y/DNTaZAH8RL/h0tCCMWD5dkn2vEqzFqidmjMtUfnu6RhhBo/kpu4/hTFL+SKEHTgyJHyG2FLhoqGGnxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293594; c=relaxed/simple;
	bh=nbI6O2jVJmJKDcIwmvwKvAtsadxXm7JZt5ZEib+SKuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XKK2trC8mZditnK6GVQ2J+ugpP+trPx15YE2w3BDRBcPP2q32W45fwLJL8/rrksbxc9uRHmnw5PjS5U7hyTW5bzNNM3uP1SIK6b2OSNN87Rr5S84kLfcdKFUN+YN34jGDIwGxAOXZuy0xwVjiyl5Uetkw7aEpBvU6uYedSOs+Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fQeQMg9+; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2cf1b770833so13122761fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706293588; x=1706898388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsClFXjXZL1/cgwwi1vtRBjWGBqeVxIEF70yOJflqhU=;
        b=fQeQMg9+xJURLQhUfbQRmbyrb6mRQPPoWgwqK9tVSbQ6nW9O6v8aRRinkLt8Ef3bZJ
         Huw+w20TNUDCzz47plVgmVb8OjkeFPeRjNbTyb1VB/iBb6zwzHrId++m8279LiOb3Qra
         h0kXhuO+vzL/qa/5gc88zAQBUqKJ+O49AvFjHhxzsP8aBPdn3D+e2/bvLe83s0Vt8IdA
         jn22O88ebq8bIhtJtuNau/lpz7ogFl8M7XUkByfSblJ5lWfWGJbtWl327PE4ukBC/htt
         yRncZI6pPx0Er5I6AZvL57l5Pp0OxViKwSXeFUf67bHn/h1Rx0zIvByGXXmcT+gzmEE3
         Y3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293588; x=1706898388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WsClFXjXZL1/cgwwi1vtRBjWGBqeVxIEF70yOJflqhU=;
        b=asyw5pLuQDjProsR0mw+xpImG4tLwtMyHdWYMObHZyBUIa9ntSbvZ+9uav2tJ+Hdbt
         ZyL763As5jNB9XNfkIvSJcnvCY0flN4rzle0258ny2emAYJ8kaBld+OeDXe+TvcVkDdI
         f/yIiakZX1Zjs4H/2LwN+vmKAeg3lDi8YVSiKSm/4M8DGU5C+cGo5uPSgS+XpNq4qK5p
         nbDHxlgJ36XAK+D+s/sdyfZ8GY/w9t5kKRssjjVpWFVGW+LM0afZXQtGj8vq3E/DVACD
         yVxcemL/Z759BwEAly89nyDYOZSvZqSuHXcOCqodcUJfpwudKpdfAh699PNsopSaUbdA
         aiJQ==
X-Gm-Message-State: AOJu0Yxxw13M/jYFxPzuQ6LRAmQH61Hdui3QL/S19IU8bJDouguEpNYm
	yG6JqYrsngNkSl5pPdG2ygbnUqKnoX7RKJRnQsWBoTPJUe+zMaJn+dP3eQwP0os=
X-Google-Smtp-Source: AGHT+IH6v7IJZWpMt5uHQPOcrEe2FO/dTFAzytBW5kDe0i1xJOiATlSJIdisAZmyxcLrz24mpwvMxg==
X-Received: by 2002:a2e:b81a:0:b0:2cc:89f4:15a3 with SMTP id u26-20020a2eb81a000000b002cc89f415a3mr150252ljo.49.1706293588648;
        Fri, 26 Jan 2024 10:26:28 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 10:26:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:22 +0200
Subject: [PATCH RESEND v3 03/15] drm/msm/dp: parse DT from dp_parser_get
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-3-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2495;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=nbI6O2jVJmJKDcIwmvwKvAtsadxXm7JZt5ZEib+SKuc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lPIQiz99mijPv7APhc0aOtQpr7FSxP7uUf6
 fQtUhmCq5eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5TwAKCRCLPIo+Aiko
 1UoxB/0Xr3DzXz0QRZ6P4cU4vQAkaAzak1HsYyIMPeIWORcxjTRJZdejUp4k5LjJlXskB/FTwrN
 3RELHh+696DgAwUIDJyYZp+iFlySlD3Dxm0oKX9jT1uLu2jve8drSLZTc6FPMIELkZqBEDwY8ZP
 fIjvHKGl71esRnwe/dL+8e9Vpj+8A8FyxNtVKo1Mz8S3n5kRG+V18ihrwQvDIbxqTx6ptAblDRx
 dxbifiE4iii1N3vJTq6KOGSnk2lagyfkNQUL6ieh6BqO6UZKxX1bIlnQjfzR9xDd1ilJTQYoBAg
 gVK/BMQ1Mtp6U2FlZa0uIQdAsHzATmc6UZoYgTi+KfjM5ywn
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

It makes little sense to split the submodule get and actual DT parsing.
Call dp_parser_parse() directly from dp_parser_get(), so that the parser
data is fully initialised once it is returned to the caller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
 drivers/gpu/drm/msm/dp/dp_parser.c  | 8 +++++++-
 drivers/gpu/drm/msm/dp/dp_parser.h  | 3 ---
 3 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d37d599aec27..67b48f0a6c83 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1266,12 +1266,6 @@ static int dp_display_probe(struct platform_device *pdev)
 		return -EPROBE_DEFER;
 	}
 
-	rc = dp->parser->parse(dp->parser);
-	if (rc) {
-		DRM_ERROR("device tree parsing failed\n");
-		goto err;
-	}
-
 	rc = dp_power_client_init(dp->power);
 	if (rc) {
 		DRM_ERROR("Power client create failed\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index 7032dcc8842b..2d9d126c119b 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -315,13 +315,19 @@ static int dp_parser_parse(struct dp_parser *parser)
 struct dp_parser *dp_parser_get(struct platform_device *pdev)
 {
 	struct dp_parser *parser;
+	int ret;
 
 	parser = devm_kzalloc(&pdev->dev, sizeof(*parser), GFP_KERNEL);
 	if (!parser)
 		return ERR_PTR(-ENOMEM);
 
-	parser->parse = dp_parser_parse;
 	parser->pdev = pdev;
 
+	ret = dp_parser_parse(parser);
+	if (ret) {
+		dev_err(&pdev->dev, "device tree parsing failed\n");
+		return ERR_PTR(ret);
+	}
+
 	return parser;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 90a2cdbbe344..4ccc432b4142 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -67,7 +67,6 @@ struct dss_module_power {
  *
  * @pdev: platform data of the client
  * @mp: gpio, regulator and clock related data
- * @parse: function to be called by client to parse device tree.
  */
 struct dp_parser {
 	struct platform_device *pdev;
@@ -76,8 +75,6 @@ struct dp_parser {
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;
 	struct drm_bridge *next_bridge;
-
-	int (*parse)(struct dp_parser *parser);
 };
 
 /**

-- 
2.39.2


