Return-Path: <linux-arm-msm+bounces-8367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D79383D035
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:03:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C3591F22268
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F35125C4;
	Thu, 25 Jan 2024 23:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vMDc9d08"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF1B125CD
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706223774; cv=none; b=oNeECFVvhr1klN63S8hzE1pdtG6N79DHF0LEMLzmKjDm+b79oRLp3rxNHxhGI7b/V7QFAzaadL59dZN0P7fGP4wIMOMtKVL8yzdhL5ROiuBLpGoxbmlGmFtAeKlX607PhqgN/9TESv3mP+LzHX6t2/lA8BB9EVM2Vc5OMtQaujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706223774; c=relaxed/simple;
	bh=+QSUGzw12ZOJpwShyYqXjiKmNZgVat/nLLyxEBSUwK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=msczFMQ6BfUGVWesBtkIJQ/r7LQfixhipGHoho4WrMeKEnErAv62ycMYdfpLp/OuF16Cxtj8QsyGvgbYkhl1PX2qCKMiDcAqMGedKtjSEH8xfcb4wHkoAJ8ZbxoTxrOJ5isnDWttwgWyc5FQRrgTPGiEZv8rT2Qw1hOM4YUePS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vMDc9d08; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cf1fd1cc5bso31324701fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706223771; x=1706828571; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2yugd+v/ByLcDD9w+nePT0BWk3YvBKgR/XwHowmol4=;
        b=vMDc9d08Kr/mnNytl2rA/KCiweBVyRqb/sgMHBo4fAbGPh0FT5nWWuvsgBR/vxaxNy
         nOpZbFE7gSCFtPXvMmdXCPOyZdOhx0956e8JktZY+zLKLfRFZZ3pJlbhdiSgBDwku1cS
         kgQ1bXEeijshtiu94gSKpWxhNvGSSX1XmXLbmPdnjX1cK1zFxjtvk2UzzEfInRb8V5Av
         t0iWkGIxrlXQ9gnA14I/WoGPoWywGmSSRUU0jIcBLacil//JfRsh9d4vcoZfeEV6s8MP
         n2xNIC0LwcHXZPNvnPCNgV1gUmy/u2YC3WBFa764eMq7opyeZV2DQYsEtKsWcY1wxUuR
         o5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706223771; x=1706828571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2yugd+v/ByLcDD9w+nePT0BWk3YvBKgR/XwHowmol4=;
        b=cOB85H3BpZH+aMZ/UUcODh2sYAebN+K3TIrK89nrKjh9t0kZtep51/owiXF/ZyaIU+
         VZTTiQjQKHAOgm6So2ARtsB/cyBCBfJ3zcdm0TjRD+5NYsVQFgCjI5QLq0JIGf9Y3y0A
         uHqGvqrxF2Ecnu7yqZCeNvey8I4VbcI26InigFMzr5eZ8IJr3A3ahn2sye4vvkyj29Ga
         wbm19xZyG5Pf9pc7RXBjE3Gurx9Yg913a+zJYQL2WZQRMfmKKRUswT8lalhCQ7WjIcZS
         b6OGMrxJJG4eq7yBVgtmeE+A5HJcOcN7PJBivY1E+pLFXHpezCU6ghw282HbtqN9fgDT
         vuSA==
X-Gm-Message-State: AOJu0YzDVJn7ECDPbvNXf0nbb0Vng11jCZZlWDn6sXqnoXvzEsHs5FMl
	e2GrlBfFGoF9LTHLFRgeZOFU3Q41D1u2jQARaCN3N9IZ1IcBNPXGg3l4qRt2jCQ=
X-Google-Smtp-Source: AGHT+IGmKDAD6qyrs3VsY+PMKdgn762Ve45U47peU+ILGBqeOgk3OAiQe9OTP8o2IBeVJq1T7kLfow==
X-Received: by 2002:a2e:720a:0:b0:2cf:e95:57fd with SMTP id n10-20020a2e720a000000b002cf0e9557fdmr340214ljc.28.1706223771105;
        Thu, 25 Jan 2024 15:02:51 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:02:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:02:43 +0200
Subject: [PATCH v3 14/15] drm/msm/dp: move next_bridge handling to
 dp_display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-14-e2e46f4d390c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4251;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+QSUGzw12ZOJpwShyYqXjiKmNZgVat/nLLyxEBSUwK0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiIZbEIG6ePUeSHmo6HDNTzKgQyiEKUf3Es1
 wJXEGJQewyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLoiAAKCRCLPIo+Aiko
 1bzQCACxglS1CC9uFRPcEEUr7UJHoj3htMkE/XUO1B6U0tpdECepiP7U/8VkKgoQ/uVjURl9sjQ
 l/yTW4fygsWgHES/UmpQ8KuHaHtkXVetxr4kDZYaIn8NTFyvFNF5p9FyQO/BNPeGxjY8vx/zEcF
 Le7MgKt+FWiMzVfj62+8xK1Kh1WNMTO/QhwIa8MWqRXdT4/JzRwibEa5IhQSs9b7eDtE5Sf6dYa
 WiEn9Cv9e6admnfSZaVEg5emvaHL02F9Z/UfHGas8yLBbFQz7MvS9HoNMuwxaUpRob8DbR57fvL
 YtLERakxJf+jY0z2UWWjhCYWMvhZRWqkYsaCxnB1O+RIe2xz
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


