Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76ACF4246EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 21:39:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239626AbhJFTky (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 15:40:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239495AbhJFTkl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 15:40:41 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11525C061783
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 12:38:43 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id n2so2315252plk.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 12:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=147voWq3MMP+9e/FHlW9BwNDYVhXK+csyUVXCf2NteA=;
        b=lXMvuiMq8hDBS+eQ9IBiLv4iJuQR01YqW14KeFdv2SXgBytisZYGSvdJDOtKmAOvN6
         zHGcrOtWZJy2OF3sYPzw+EE113RKOnEEyhsFPAbJblehfwZ7X9lzddUqnE2biPWpGR3Y
         JaN+hKpdBTRkKMHUEyzFFh8LnkjEnkRDrdvSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=147voWq3MMP+9e/FHlW9BwNDYVhXK+csyUVXCf2NteA=;
        b=sh+kNAj1EfOtD2zGPPGy5usZ4PljcJMTmmshEfYrKv8N+e34bC1zGo9ozYRc1wlJFR
         xyV+ejYF2QVF2+3++YAuN7fSHvmEsKU6CBTvBz7CGLx2WZsD5AytA0qRf4fip28ti8oH
         WtGmzWul0xxKrYfjGd90PiEEJ0X/Yf+9kHe6pu+i1bcjei1q5ivblUiBwE0kmYTjp41f
         T622Fc83jhr7KqZzKEmpUc8A/+1y1O6bbPBfxGAMQnVGJboxeGcRZf4EGj01nJcDU31j
         qv4FttrVfDdmD/FQRvWEpVKVC5NAjwWONf2koRkx6UJly2ZorEPiC6/h2+yxR/3/TV2O
         A6Zg==
X-Gm-Message-State: AOAM530re1XGvKEgPoT3qpiGrS3qLYpEwEJ9Jy+heu82gZnN9k8coY/z
        CA7NfJ7CHGK7n0d6SBZKQGzB1MYVbuq3Sg==
X-Google-Smtp-Source: ABdhPJxU4hwt50HoqlK3Qoo92SCidVgpLN3jBErzx1B92cxFcVEuvHUakr3eWkXCfblXgZvg0cGXVA==
X-Received: by 2002:a17:902:9a06:b0:13c:86d8:ce0b with SMTP id v6-20020a1709029a0600b0013c86d8ce0bmr12674304plp.51.1633549120413;
        Wed, 06 Oct 2021 12:38:40 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
        by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:38:40 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Paul Cercueil <paul@crapouillou.net>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 15/34] drm/ingenic: Migrate to aggregate driver
Date:   Wed,  6 Oct 2021 12:38:00 -0700
Message-Id: <20211006193819.2654854-16-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

TODO: Move the helpers to PM in aggregate driver hooks.

Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 24 +++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index a5df1c8d34cd..058b7bfe5610 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1150,8 +1150,10 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	return ret;
 }
 
-static int ingenic_drm_bind_with_components(struct device *dev)
+static int ingenic_drm_bind_with_components(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
+
 	return ingenic_drm_bind(dev, true);
 }
 
@@ -1174,9 +1176,19 @@ static void ingenic_drm_unbind(struct device *dev)
 	drm_atomic_helper_shutdown(&priv->drm);
 }
 
-static const struct component_master_ops ingenic_master_ops = {
-	.bind = ingenic_drm_bind_with_components,
-	.unbind = ingenic_drm_unbind,
+static void ingenic_aggregate_remove(struct aggregate_device *adev)
+{
+	struct device *dev = adev->parent;
+	ingenic_drm_unbind(dev);
+}
+
+static struct aggregate_driver ingenic_aggregate_driver = {
+	.probe = ingenic_drm_bind_with_components,
+	.remove = ingenic_aggregate_remove,
+	.driver = {
+		.name = "ingenic_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int ingenic_drm_probe(struct platform_device *pdev)
@@ -1196,7 +1208,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	drm_of_component_match_add(dev, &match, compare_of, np);
 	of_node_put(np);
 
-	return component_master_add_with_match(dev, &ingenic_master_ops, match);
+	return component_aggregate_register(dev, &ingenic_aggregate_driver, match);
 }
 
 static int ingenic_drm_remove(struct platform_device *pdev)
@@ -1206,7 +1218,7 @@ static int ingenic_drm_remove(struct platform_device *pdev)
 	if (!IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
 		ingenic_drm_unbind(dev);
 	else
-		component_master_del(dev, &ingenic_master_ops);
+		component_aggregate_unregister(dev, &ingenic_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

