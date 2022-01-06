Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37DAC486C3B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 22:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244519AbiAFVqS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 16:46:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244475AbiAFVqR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 16:46:17 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01CE1C061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 13:46:17 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id t123so3556091pfc.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 13:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FPtGNMfzlxXubKgayi75A1lRD5p2YHP9GYCHjNIhA04=;
        b=F/n1S4F8s3kPZEe2GW35Eidb0SesLDzR2YqgAQAZIHrdsevP1q9bknfHQTxF6SqGJm
         Nfl9MQ9rGKoXrK+IFOpOOh3SAwv6F1KaWuQD7pffTOrkiJO/cXpEdVGWkZZkJ3dX53Xr
         AdWLpJwFpppBOInDDUOP4omGqDFxmR1REDYFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FPtGNMfzlxXubKgayi75A1lRD5p2YHP9GYCHjNIhA04=;
        b=WpkUvOSMDOx9Ig68afN//VqMHVrFbGsUI/CQaHdmixNbkSVXXy8wRIIk7VgIUaQNIL
         CZotwyeRLdzrO6tQox8ZffSAE8wlh6ENIk9elxJocBftCLaWiccZOJXkapS9OqbA4//k
         J1jByqUsjHCIqz8n16BpzN1GcEw9Z8uOu0r+UWtE0AVsHbR0gJpPei3bgSt9KAWJuziU
         w0qtzHH7rowyheBcZ8oGHvdHDrRQJ1rkYB2BkG6tAqENCMIQfk4vPlG8hhgM0HBBIoxO
         h0Aet7TTmRe38mxP4JZMHE3cmhX77YOGza6UK9fluxQDZvOUHwx9UPp2HGJ2TXTSoNCu
         saAw==
X-Gm-Message-State: AOAM5314cjbWaWwkgtURsXgYddqaJBZlzGlMoPiCZRuyELl+9tC5PWH6
        vEO5ohbs3UmdAWOgSG2Zyi46yA==
X-Google-Smtp-Source: ABdhPJzDyXbJ5oiJeJM1+1uFcXWrB43YEPXT+ZHV9hULBBomq9G68oQkCiEkLjlw9Juc82HcneKgAw==
X-Received: by 2002:a62:1642:0:b0:4bb:b3b6:c037 with SMTP id 63-20020a621642000000b004bbb3b6c037mr56659975pfw.50.1641505576581;
        Thu, 06 Jan 2022 13:46:16 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
        by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 13:46:16 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v5 13/32] drm/exynos: Migrate to aggregate driver
Date:   Thu,  6 Jan 2022 13:45:36 -0800
Message-Id: <20220106214556.2461363-14-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20220106214556.2461363-1-swboyd@chromium.org>
References: <20220106214556.2461363-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index d8f1cf4d6b69..dcb52ec2bd35 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -253,8 +253,9 @@ static struct component_match *exynos_drm_match_add(struct device *dev)
 	return match ?: ERR_PTR(-ENODEV);
 }
 
-static int exynos_drm_bind(struct device *dev)
+static int exynos_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct exynos_drm_private *private;
 	struct drm_encoder *encoder;
 	struct drm_device *drm;
@@ -330,8 +331,9 @@ static int exynos_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void exynos_drm_unbind(struct device *dev)
+static void exynos_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -350,9 +352,13 @@ static void exynos_drm_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops exynos_drm_ops = {
-	.bind		= exynos_drm_bind,
-	.unbind		= exynos_drm_unbind,
+static struct aggregate_driver exynos_drm_aggregate_driver = {
+	.probe		= exynos_drm_bind,
+	.remove		= exynos_drm_unbind,
+	.driver		= {
+		.name	= "exynos_drm",
+		.owner	= THIS_MODULE,
+	},
 };
 
 static int exynos_drm_platform_probe(struct platform_device *pdev)
@@ -365,13 +371,12 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(match))
 		return PTR_ERR(match);
 
-	return component_master_add_with_match(&pdev->dev, &exynos_drm_ops,
-					       match);
+	return component_aggregate_register(&pdev->dev, &exynos_drm_aggregate_driver, match);
 }
 
 static int exynos_drm_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &exynos_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &exynos_drm_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

