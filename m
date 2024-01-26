Return-Path: <linux-arm-msm+bounces-8475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0039383E14C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 19:27:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E5C61F2592E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 18:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 539D6210EC;
	Fri, 26 Jan 2024 18:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R7RV4wO/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9366A20DD9
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 18:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293600; cv=none; b=FwrTGk4k3u5WF6OLMDzrDHHp4248Vhf8t2qS+c/LGwDVQ7pn/e//eVoNYhGR0s+qA+OZjNhkTz8Tf2/XargyQ5DBpoQlSboWlyIuCiQTfHjBZOf7iPKJv+rXg7AxilMJ88v3J0l9cNPqaqIwTjji9n1eUxi+qu4NDVjGL3BDs/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293600; c=relaxed/simple;
	bh=+QSUGzw12ZOJpwShyYqXjiKmNZgVat/nLLyxEBSUwK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bXrQbgWQVMz7xxzG0EcuIz2bI4/9eOYIWOrgP+X921c8p7I/fyIeNmkgQc+bW0/PDsf2xBEySBO4ybd2GXhOkuRLmi/U4sKX7gVdX5evieDqw76iIR/XT5cG/dYC40zy51cWmi8Nbs2CXElxU2v04OuSODBEegivDEBYMrLlP4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R7RV4wO/; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2cf3a04ea1cso9023371fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706293596; x=1706898396; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2yugd+v/ByLcDD9w+nePT0BWk3YvBKgR/XwHowmol4=;
        b=R7RV4wO/5/a+5viUFK3pXMCcbwjGhVmdhOVwgh9orNGf0Z+RHXVrdKE/w/G+aYjCpf
         0iP3WFnVf+cP62g1xnorcp/irYx1XxWG2MIH8ywkyZjqm4dQIYBXnKIcr6R4G6ofqDW3
         MiFTZxHzQFlWSkNXR8zMfNh98L4tR3iBtW+oOxtSJBg85zfJYaNSUqfEc3XB1gQkSDAl
         NUMvVJolOYYUHlD9KxlghXKIxuE/x2au2dTfx5ErwVpiaIa5qUoKEl/kZDo2L/enOBgD
         b+xnAKUdvOcuRApnsXmv2bbbOhhBQlBHWsrrT4puJov+r7E50X6HcAvAGU6VaCL2Tz6z
         OtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293596; x=1706898396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2yugd+v/ByLcDD9w+nePT0BWk3YvBKgR/XwHowmol4=;
        b=SBecQPZGHIYMp1qzZyYnzxXJpYJxvo6C55eSajppo6EaB4ivbEaCF9ZDu+P90sNJdv
         NFaCf+6CHRtpBoEp6BoKeJSAkCm1Z6TxpTGrwkC9SAEY46P6l6LI4u7cRiz3c/J/nj16
         o1wsRij3qu2ggixoOnZZyZhDamcyN8A5GzRQefhcRWwWRv2X88UlZoFph6DET7ZP9Rk6
         h/1N2jAsxtLX4Y04K6Tk84MJ1PsvcBXqj93iZP6HqgNSAKMqNaaPXmeHC+/3FyPmOGxT
         1XhnoqQYgHv59PPCuKzlXDl+cb2wfUqm3ysJ/HRizwFjQuuQid5sqagaPgIQjVS8LGaT
         RC3A==
X-Gm-Message-State: AOJu0YwkVNr4iKMEV8lGBAhw1Wbpb5t9LIh2fE7pP6Z3Mw7G259Fc50R
	k3Eaw6jvFMqgfJCVY/gJI1V/GCmWFVcY5p6CmjfRrfHp/qmiFe+KUnHvEAwHH+o=
X-Google-Smtp-Source: AGHT+IFF+Hle16o5QzHW7CU+gllINLx0kVwbIrsaVVQfWsqs8kBOAPqi/6szTgjP+pbDLmJp6xCG/w==
X-Received: by 2002:a05:651c:1507:b0:2cf:131e:41ec with SMTP id e7-20020a05651c150700b002cf131e41ecmr161481ljf.43.1706293596532;
        Fri, 26 Jan 2024 10:26:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 10:26:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:33 +0200
Subject: [PATCH RESEND v3 14/15] drm/msm/dp: move next_bridge handling to
 dp_display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-14-098d5f581dd3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4251;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+QSUGzw12ZOJpwShyYqXjiKmNZgVat/nLLyxEBSUwK0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lR1JlWhP5Os+8twqg9foVlfni3Z0FMxujy8
 xF+P7iglBaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5UQAKCRCLPIo+Aiko
 1W6JCACDV6kLdRkLqo+MxDqheXoMpgdAYwwDkXJ5Apb12fvSbVFu8ijEZNfc9vpr5qVfsOh3H5M
 iumjDr4jobpBFDkRPJ8skEe8thrgCwJY/e5cLJKwhjnYjYBVpc+a9KhVDj8VFFpyNFnWrdZsoXP
 hjGIsliWcBBPrgieEhc1dYeSC3Fb3sSI8BmVd329mY0yLgiS35vqM+Y8cRoQoWqy50DyoSicrVf
 znestzgb0euX7dbZQnzbsNg0OTW1lP0tf0veeTR43v10e72a1SUzpNQgGtmKlbojDpeX9GF6hMO
 fvunosd/ceC0W74n+14fHsNu02chCRrXKkmCDp8bUY5n7abj
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Remove two levels of indirection and fetch next bridge directly in
dp_display_probe_tail().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 43 ++++++++++++-------------------------
 drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ------------
 drivers/gpu/drm/msm/dp/dp_parser.h  | 14 ------------
 3 files changed, 14 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f19cb8c7e8cb..de1306a88748 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1195,16 +1195,25 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
 	return NULL;
 }
 
-static int dp_display_get_next_bridge(struct msm_dp *dp);
-
 static int dp_display_probe_tail(struct device *dev)
 {
 	struct msm_dp *dp = dev_get_drvdata(dev);
 	int ret;
 
-	ret = dp_display_get_next_bridge(dp);
-	if (ret)
-		return ret;
+	/*
+	 * External bridges are mandatory for eDP interfaces: one has to
+	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
+	 *
+	 * For DisplayPort interfaces external bridges are optional, so
+	 * silently ignore an error if one is not present (-ENODEV).
+	 */
+	dp->next_bridge = devm_drm_of_get_bridge(&dp->pdev->dev, dp->pdev->dev.of_node, 1, 0);
+	if (IS_ERR(dp->next_bridge)) {
+		ret = PTR_ERR(dp->next_bridge);
+		dp->next_bridge = NULL;
+		if (dp->is_edp || ret != -ENODEV)
+			return ret;
+	}
 
 	ret = component_add(dev, &dp_display_comp_ops);
 	if (ret)
@@ -1397,30 +1406,6 @@ void dp_display_debugfs_init(struct msm_dp *dp_display, struct dentry *root, boo
 	}
 }
 
-static int dp_display_get_next_bridge(struct msm_dp *dp)
-{
-	int rc;
-	struct dp_display_private *dp_priv;
-
-	dp_priv = container_of(dp, struct dp_display_private, dp_display);
-
-	/*
-	 * External bridges are mandatory for eDP interfaces: one has to
-	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
-	 *
-	 * For DisplayPort interfaces external bridges are optional, so
-	 * silently ignore an error if one is not present (-ENODEV).
-	 */
-	rc = devm_dp_parser_find_next_bridge(&dp->pdev->dev, dp_priv->parser);
-	if (!dp->is_edp && rc == -ENODEV)
-		return 0;
-
-	if (!rc)
-		dp->next_bridge = dp_priv->parser->next_bridge;
-
-	return rc;
-}
-
 int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 			struct drm_encoder *encoder)
 {
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
index aa135d5cedbd..f95ab3c5c72c 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.c
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -24,20 +24,6 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
 	return 0;
 }
 
-int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser)
-{
-	struct platform_device *pdev = parser->pdev;
-	struct drm_bridge *bridge;
-
-	bridge = devm_drm_of_get_bridge(dev, pdev->dev.of_node, 1, 0);
-	if (IS_ERR(bridge))
-		return PTR_ERR(bridge);
-
-	parser->next_bridge = bridge;
-
-	return 0;
-}
-
 static int dp_parser_parse(struct dp_parser *parser)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 21a66932e35e..38fd335d5950 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -21,7 +21,6 @@
 struct dp_parser {
 	struct platform_device *pdev;
 	struct phy *phy;
-	struct drm_bridge *next_bridge;
 };
 
 /**
@@ -37,17 +36,4 @@ struct dp_parser {
  */
 struct dp_parser *dp_parser_get(struct platform_device *pdev);
 
-/**
- * devm_dp_parser_find_next_bridge() - find an additional bridge to DP
- *
- * @dev: device to tie bridge lifetime to
- * @parser: dp_parser data from client
- *
- * This function is used to find any additional bridge attached to
- * the DP controller. The eDP interface requires a panel bridge.
- *
- * Return: 0 if able to get the bridge, otherwise negative errno for failure.
- */
-int devm_dp_parser_find_next_bridge(struct device *dev, struct dp_parser *parser);
-
 #endif

-- 
2.39.2


