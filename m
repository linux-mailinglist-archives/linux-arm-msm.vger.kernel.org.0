Return-Path: <linux-arm-msm+bounces-5-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B207E3257
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 01:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F01251C2037E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 00:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE99C17C7;
	Tue,  7 Nov 2023 00:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FT598sG1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500CA17C2
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Nov 2023 00:44:29 +0000 (UTC)
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C676D75
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Nov 2023 16:44:27 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c6b30acacdso68180391fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Nov 2023 16:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699317866; x=1699922666; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4sQQn36L2+/zoCkGPO8pkAoerlaydAQhrz7oIT51ro=;
        b=FT598sG1IfYas/GqukigrwYhRsD8Eb7+6TmdIB0q2QyvuHk9BUCx0gAr6Hj4s4kffG
         sqZ/IODgs52KjPZXslZaDqK2OdyrHzfKLz+9L48s8VHUeb+FKzMs27V5O+nRIlybFp5A
         KRBB3PWxmTXhuJzUMcToIrQjuQGHuWQ0qTm4If+gHnq1/uRiwrWCnusrAPVarGcUpVRP
         dBQUS0Ny6wrBtR9HW7LuWD7wtOCg5csPmf+HvlTuBspA6FjPr921BwrFOeYEz+38p/ur
         Tb/Ud/O7mURUBOkOfAdStpTn10vWfuQS9GAUzt8z6MPit0UYd1SKiamqNbeHyvU2cXzo
         AlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699317866; x=1699922666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4sQQn36L2+/zoCkGPO8pkAoerlaydAQhrz7oIT51ro=;
        b=K/g98sz4C3QcFvmKlz97xVja91GaEJ6LH73RSShWS45LvT4W/gleXa90ESNYAKbEUV
         vfYac7JXOoDopbtZsl4xwXsbzF+QyQJNz5CcnsWk3cjW96PKSa1IREEIvuJAfWxyPkMI
         0/XaCAATYp2EguqjtZDHLe8CEkVsEENSo2tzh6vm8M/lPImnQGjOgz+6aqpyKFEmRJwV
         PDCboRRRUXcgPLyXxBManPVPOV/lBDCpp5NGtbxWm18a3cZ70T4qw1sl04shHFGMtGzN
         3qIGWy9xo7cvIJQ9Oth7G8BuVwDTQrHaKyHMu54e1NHMPig1ImDR/gVkHo6kwWW0FUe/
         un4w==
X-Gm-Message-State: AOJu0YxpD4aOLkwVfGmZ8dwhAGi4D7tNtinK9gvjaGntx1g7sDTh7KHr
	9jB+XE5e7o1beTIYwASs2YYllQ==
X-Google-Smtp-Source: AGHT+IGq/gbVJACFjo+UjFOrO/9DZFv8U31OsE7j5XrfgMAni1X9Tg3EXzFgOQQAbQtrdqyqkHPeyA==
X-Received: by 2002:ac2:57c4:0:b0:4fd:c715:5667 with SMTP id k4-20020ac257c4000000b004fdc7155667mr20544414lfo.20.1699317865656;
        Mon, 06 Nov 2023 16:44:25 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id m15-20020a05651202ef00b0050567a8b36esm142974lfq.251.2023.11.06.16.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 16:44:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dp: call dp_display_get_next_bridge() during probe
Date: Tue,  7 Nov 2023 02:43:33 +0200
Message-ID: <20231107004424.2112698-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The funcion dp_display_get_next_bridge() can return -EPROBE_DEFER if the
next bridge is not (yet) available. However returning -EPROBE_DEFER from
msm_dp_modeset_init() is not ideal. This leads to -EPROBE return from
component_bind, which can easily result in -EPROBE_DEFR loops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Dependencies: https://patchwork.freedesktop.org/series/120375/

---
 drivers/gpu/drm/msm/dp/dp_display.c | 36 +++++++++++++++++------------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d542db37763a..ddb3c84f39a2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1197,15 +1197,27 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
 	return NULL;
 }
 
-static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
+static int dp_display_get_next_bridge(struct msm_dp *dp);
+
+static int dp_display_probe_tail(struct device *dev)
 {
-	int rc;
+	struct msm_dp *dp = dev_get_drvdata(dev);
+	int ret;
 
-	rc = component_add(aux->dev, &dp_display_comp_ops);
-	if (rc)
-		DRM_ERROR("eDP component add failed, rc=%d\n", rc);
+	ret = dp_display_get_next_bridge(dp);
+	if (ret)
+		return ret;
 
-	return rc;
+	ret = component_add(dev, &dp_display_comp_ops);
+	if (ret)
+		DRM_ERROR("component add failed, rc=%d\n", ret);
+
+	return ret;
+}
+
+static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
+{
+	return dp_display_probe_tail(aux->dev);
 }
 
 static int dp_display_probe(struct platform_device *pdev)
@@ -1280,11 +1292,9 @@ static int dp_display_probe(struct platform_device *pdev)
 			goto err;
 		}
 	} else {
-		rc = component_add(&pdev->dev, &dp_display_comp_ops);
-		if (rc) {
-			DRM_ERROR("component add failed, rc=%d\n", rc);
+		rc = dp_display_probe_tail(&pdev->dev);
+		if (rc)
 			goto err;
-		}
 	}
 
 	return rc;
@@ -1415,7 +1425,7 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
 	 * For DisplayPort interfaces external bridges are optional, so
 	 * silently ignore an error if one is not present (-ENODEV).
 	 */
-	rc = devm_dp_parser_find_next_bridge(dp->drm_dev->dev, dp_priv->parser);
+	rc = devm_dp_parser_find_next_bridge(&dp->pdev->dev, dp_priv->parser);
 	if (!dp->is_edp && rc == -ENODEV)
 		return 0;
 
@@ -1435,10 +1445,6 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
 
-	ret = dp_display_get_next_bridge(dp_display);
-	if (ret)
-		return ret;
-
 	ret = dp_bridge_init(dp_display, dev, encoder);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
-- 
2.42.0


