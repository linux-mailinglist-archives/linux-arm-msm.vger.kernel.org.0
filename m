Return-Path: <linux-arm-msm+bounces-8357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D97F83D02C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06CCCB290A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8295D125BD;
	Thu, 25 Jan 2024 23:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rBpShkS+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD40125BA
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706223761; cv=none; b=Leenq3/mTVPxx4VhCWFST5zEV8iDbr27n+imPGaBJ6xvT5zzbLH7Nd5fy+63FxwAjC/CPnrfyxXFyGoaspFv5BRj2a+vlgN1SRIvAX0nyMfb5eBeNzR9c1KO4rCCXM97J3pf5HmUAXZnANv/ZoMTLYFklTV5nFrI9dx8YxcMGHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706223761; c=relaxed/simple;
	bh=nbI6O2jVJmJKDcIwmvwKvAtsadxXm7JZt5ZEib+SKuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dAbdZ6kQd8YPWdo74LbStACXWOx6GozH7sMSPTKEH3VjoW6T9v1iyQpFA/pYNOzKBEAzZPiMIsZiIsJnu7fAnRZAQ62NV4qNqgmFTiEbXGaNsLACXOknX5RqubOzRrB+iOSoohggWWetUrKKQWRam2nQTTougBjTfUY90IYFBW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rBpShkS+; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cdeb954640so91383391fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706223757; x=1706828557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WsClFXjXZL1/cgwwi1vtRBjWGBqeVxIEF70yOJflqhU=;
        b=rBpShkS+a3y0nUwGFXE9ZNSuvaZKWdDt1lBloeeSPI++YVpJUBpdGHIZ322TSzPoAJ
         jK5ThcNJN6wv+lykN5Xx2unAJ9pqoMaTLrNt4jASn72Hq49K4m7JP4Tl9mIaYHkessRI
         iYN19DO/EFzxwMuMEpQE1S7bBVU5aVHrpv6QwQjtXT6pjo/9+FPxajdx2ghM8LR1Y9Dl
         AqjCbdrSVVlWIf+uHrqMiPQ4NfkFlPL02LKZdKqFwbB3FSzmu97SAd3UDCpXBAiuwMNZ
         gJoyllIsJvr3h73NFlgKKFCkLXglfFT3p1fvcFEuWKQuYXpDCtvLXVgVe2MyF/6hAJ8t
         duVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706223757; x=1706828557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WsClFXjXZL1/cgwwi1vtRBjWGBqeVxIEF70yOJflqhU=;
        b=DX9oCABl+39ajkLnihpR7zSi4RiSUeVCmX6LfRz8EmYTtHnVuYxkN8ZeZyG0nf7OaZ
         XfNyfpPeO6jFlwHwL7TUeg6TwSmIfneaA8bn4s2seNku7Sym/AkKvstPphxkT8LJQ/nN
         ZuWxbdbBWJika7D5wsntvXb0DWqW86kSF0911Qc37VRMofhye5TJXaGh0mAcFw7djD13
         eQB/ktQKMAVh1P0kmqd8UlXkFrUV2x3NB/GjJ8S6JMF11apBm+Bj933GgcmFc7LOuqM5
         4qpY70I5eSlHM0kO4Yl5gKFFufFPhPpizF+22ihKTIJk1hzxwywNASxERFYrty4bOmfi
         D71w==
X-Gm-Message-State: AOJu0Yy51piuQ3U70mxKGfqRw2V9s0kaWKiQ65u5hEFlz2g1OWLxxEc/
	HU2x+2yPn9XVA119TNW9lyIaRZ+yLMxUFylXF6APm0pXYHEF1nrThSAR32kwBP4=
X-Google-Smtp-Source: AGHT+IHB48WYKzpRE4GTJJw+YbQXU/Co7BwmCHlTYFyQp4kpKN+GU3IuCHZ6JckmSDb0mwm9dGjpHQ==
X-Received: by 2002:a05:651c:1cd:b0:2cf:4761:7332 with SMTP id d13-20020a05651c01cd00b002cf47617332mr16004ljn.15.1706223757678;
        Thu, 25 Jan 2024 15:02:37 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:02:36 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:02:32 +0200
Subject: [PATCH v3 03/15] drm/msm/dp: parse DT from dp_parser_get
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-3-e2e46f4d390c@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiH+3PoMEjAYxoRs1/Tvf4I20khu8T8B2f2R
 fTg+MllguWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLohwAKCRCLPIo+Aiko
 1ZAPB/9nH3gUFknoSXApt9roO7iae+oXdO7krlDNRwN4GOaCd+IMU/s2xj8ZtckI6qglOXp7Foe
 THzlqGTbQ+m/7xi2hVDWCdvtvNzdMWHR6uPxyu+dzHBaiXTL1C6oziycHxpIa/lvEIhqjW7f0lf
 ZOLMPb6xLiSAJjdBMwkSgD2agsgPxdIzUNE7glVrpaVMnW8eZbxt9KTTMLcEjtC5AmrjHA5Ie8E
 ciBFgzxAAyxXH4U+xqauRDf9Cfsn7LVAkvdTbz2nUT3oKs/T7uJZUcwWK+PTXr+fEi1DtUZPwqW
 WUyDQhHLN2CB4s4J8Meu3xln+UZuGgdC7WvV3ga8dBFbnBoZ
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


