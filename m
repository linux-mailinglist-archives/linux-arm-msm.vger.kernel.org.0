Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08D74486C8B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 22:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244721AbiAFVrH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 16:47:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244736AbiAFVqk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 16:46:40 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7EC3C034009
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 13:46:25 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id x15so3424871plg.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 13:46:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=44Qv1WEc4fBQtGQZgnR/7aRXBM5nSt7tXrgm1eHf/P0=;
        b=niK0EojGGWtp3v8hwFYBHDDVJkwIXfLIQ83lTuBY59xb19zCWoyJURj4sTcDU35y7Y
         KVZQW/BzuJ4V+wA8RKDZtqP+W7U1KDmr5r3VJ6uBw4qwiJiVqI2yQg3vB5On4T3wXRU8
         OX+U4PjmZnhOgK4nAHA65avAkaz0oUHuqM3os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=44Qv1WEc4fBQtGQZgnR/7aRXBM5nSt7tXrgm1eHf/P0=;
        b=WTnzy+fHGnevLue2YJRNopvTiz/XBlnkAz01vBTLqSiD8zWdSS4CSL9muwB60+IEt+
         lmUDjFmx1mFTcfMTDI5RyeOs1lxc9XgO/k3GEPzVms2m6sXqNKQJVUKFAd3b3YFMFUru
         7KJKH4m/VKjI8vRztzBtvODNcuAc+wDgDdAtz01L/OnlNU8D/8Xw9tXwWLBtrLJhtlf3
         aYvjMAcQjMGLDvePcS0u1zrKZ+IgwGvkL5nyLpNMD+mfRKqqTXBIQEbtcGrebRZRWetK
         bMb0uC5w3uXYg6ROr8uI0EDKBf28PNc2mFQ+Rwo43unkEUO4hKRVpDYUXgHUz9rO3DqU
         DG+A==
X-Gm-Message-State: AOAM5308uYl2j+vImoNA4Zm+Zw998D+4nimCzKoEVeYf1hmSVG92rWxu
        PBIqx8jezSfWbpFe00VcQjO2hw==
X-Google-Smtp-Source: ABdhPJz2g3PjORGUq33Yccyh7naEWkhS7Y38LLqdLrUERFAXmoNOQLQqq3DhzN6ShCsGmaq/uSbn/Q==
X-Received: by 2002:a17:90b:3c0c:: with SMTP id pb12mr12254066pjb.105.1641505585393;
        Thu, 06 Jan 2022 13:46:25 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
        by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 13:46:25 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v5 20/32] drm/rockchip: Migrate to aggregate driver
Date:   Thu,  6 Jan 2022 13:45:43 -0800
Message-Id: <20220106214556.2461363-21-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20220106214556.2461363-1-swboyd@chromium.org>
References: <20220106214556.2461363-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index e4ebe60b3cc1..6c755361d376 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -109,8 +109,9 @@ static void rockchip_iommu_cleanup(struct drm_device *drm_dev)
 	iommu_domain_free(private->domain);
 }
 
-static int rockchip_drm_bind(struct device *dev)
+static int rockchip_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm_dev;
 	struct rockchip_drm_private *private;
 	int ret;
@@ -183,8 +184,9 @@ static int rockchip_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void rockchip_drm_unbind(struct device *dev)
+static void rockchip_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm_dev);
@@ -346,9 +348,13 @@ static struct component_match *rockchip_drm_match_add(struct device *dev)
 	return match ?: ERR_PTR(-ENODEV);
 }
 
-static const struct component_master_ops rockchip_drm_ops = {
-	.bind = rockchip_drm_bind,
-	.unbind = rockchip_drm_unbind,
+static struct aggregate_driver rockchip_aggregate_driver = {
+	.probe = rockchip_drm_bind,
+	.remove = rockchip_drm_unbind,
+	.driver = {
+		.name = "rockchip_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int rockchip_drm_platform_of_probe(struct device *dev)
@@ -419,7 +425,7 @@ static int rockchip_drm_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(match))
 		return PTR_ERR(match);
 
-	ret = component_master_add_with_match(dev, &rockchip_drm_ops, match);
+	ret = component_aggregate_register(dev, &rockchip_aggregate_driver, match);
 	if (ret < 0) {
 		rockchip_drm_match_remove(dev);
 		return ret;
@@ -430,7 +436,7 @@ static int rockchip_drm_platform_probe(struct platform_device *pdev)
 
 static int rockchip_drm_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &rockchip_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &rockchip_aggregate_driver);
 
 	rockchip_drm_match_remove(&pdev->dev);
 
-- 
https://chromeos.dev

