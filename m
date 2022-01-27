Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5053549EBA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jan 2022 21:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343686AbiA0UCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 15:02:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343648AbiA0UCH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 15:02:07 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B24C0C061759
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:06 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id s2-20020a17090ad48200b001b501977b23so8675066pju.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eLJCnI04jLKqZN/UJPBzqXUPWPAN0XVbPbOc1ZGY6qU=;
        b=DEFDTqec9EAgV78bsUSeeOgUOjpE2PZ60LrfxDPd0F5Ja1M7OoSVPixyF9mPpGTYtf
         jDiBonceMAplYpEW7lO1v2w1ka+CKtfuNKfnSqfu7r99b6ZRRYkUYkRbmv4w107O6IXe
         dtjVxyY/6RMgJRiJxYVUfSw9pUyxA8ZXMi1S4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eLJCnI04jLKqZN/UJPBzqXUPWPAN0XVbPbOc1ZGY6qU=;
        b=NzFjLqFOdGB1XjSrJZCMnQDAbPnKPdBi5mtNMg16lrD8sWn+pYwqYrhBDufHLf/lYt
         F+IVexF1bl8nYc9qSS+v4grd0enKqVHTh/A2bT72QsSufYlb8sqm5Zh06N/dhG0QZ1LW
         M2XRLvLK9N/OdxPhul6m48Pg0gum38pm9OCDL/YchzIK9SW0AyMnYVQZqn60bPfUX3CG
         KpwR54dEuDYqZUHr1+4rbbO6gjp2HZ/ibENCsCIJH/iX6fk6MPTRVrV8u6/Sxac28g6a
         G1UebkXpfvYobBlFyGpKt2AfwwCAeqRful31pWTJCoZ9fBXuk/UlBQwND1Ch2aWPG1xL
         c4PA==
X-Gm-Message-State: AOAM531KeMftBe+ZsglZjOYgou3vQx5LpvxU3lSd1cbDM/N4hRHrKF7r
        zrCaCANBPbUgjSpV++OFT3RKug==
X-Google-Smtp-Source: ABdhPJxUhucSYGodBqok8FGY5LN8HvAR2Eonn35ksEJ0ihq+SzWXGbQnXNaKnSR7JAD8OdQGRJ77xw==
X-Received: by 2002:a17:902:ab43:: with SMTP id ij3mr1259523plb.102.1643313726269;
        Thu, 27 Jan 2022 12:02:06 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
        by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 12:02:05 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v6 09/35] drm/malidp: Migrate to aggregate driver
Date:   Thu, 27 Jan 2022 12:01:15 -0800
Message-Id: <20220127200141.1295328-10-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220127200141.1295328-1-swboyd@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

TODO: This can be updated to move the drm helper logic into the
aggregate driver shutdown op.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/arm/malidp_drv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 78d15b04b105..7b946b962b22 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -702,8 +702,9 @@ static int malidp_runtime_pm_resume(struct device *dev)
 	return 0;
 }
 
-static int malidp_bind(struct device *dev)
+static int malidp_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct resource *res;
 	struct drm_device *drm;
 	struct malidp_drm *malidp;
@@ -894,8 +895,9 @@ static int malidp_bind(struct device *dev)
 	return ret;
 }
 
-static void malidp_unbind(struct device *dev)
+static void malidp_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct malidp_drm *malidp = drm->dev_private;
 	struct malidp_hw_device *hwdev = malidp->dev;
@@ -921,9 +923,13 @@ static void malidp_unbind(struct device *dev)
 	of_reserved_mem_device_release(dev);
 }
 
-static const struct component_master_ops malidp_master_ops = {
-	.bind = malidp_bind,
-	.unbind = malidp_unbind,
+static struct aggregate_driver malidp_aggregate_driver = {
+	.probe = malidp_bind,
+	.remove = malidp_unbind,
+	.driver = {
+		.name = "malidp_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int malidp_compare_dev(struct device *dev, void *data)
@@ -949,13 +955,12 @@ static int malidp_platform_probe(struct platform_device *pdev)
 	drm_of_component_match_add(&pdev->dev, &match, malidp_compare_dev,
 				   port);
 	of_node_put(port);
-	return component_master_add_with_match(&pdev->dev, &malidp_master_ops,
-					       match);
+	return component_aggregate_register(&pdev->dev, &malidp_aggregate_driver, match);
 }
 
 static int malidp_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &malidp_master_ops);
+	component_aggregate_unregister(&pdev->dev, &malidp_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

