Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 160F1466C42
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 23:28:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377249AbhLBWba (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 17:31:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377214AbhLBWbO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 17:31:14 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E020BC06175C
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 14:27:45 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id j5-20020a17090a318500b001a6c749e697so3926731pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 14:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g366T6z/wDv+u0z2UhkHLqZZ67YI06zaB4um2FhnwRI=;
        b=TYTXsCnVyVTMggbeBEtilnBT75yzpjt35jbDKimuVcwhwcfmhkMUt0O/B8rQUSvzVj
         kwqQbp0iz9i7spvQquprrlXz+cCMKl886MW5eEdqmhfabJFDvTz0TDar0r/FXI9Ps3yH
         Shju2GWwcGqS3zvrpgS+tWBipo/I9FiU9cxPk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g366T6z/wDv+u0z2UhkHLqZZ67YI06zaB4um2FhnwRI=;
        b=jg7kpxnvrmB5QzuJT9MC9JNfLYbb1lhwK0PFIIx1nFEzAhIgpgKF2iVEx0xI6oEaIA
         Mv+XsczY2PonPYA9G3Y0muR7tHJTg45EhZBMqoXO/PHRNXdwHbQMaXRBYVGRzhHx3z6u
         WUCtGYRU5bPLfo4Zr3j1jSJeeLXTPq900dW+p41sVxtO8yu2hotU+SWCL59TDsEEmaBF
         73E4InvSKvBDDZXHimuxtOalaAOw35D84KWelpspYMtwXVb9jZmjhB/asVEK4LIW3Tjj
         b7591TZEEHrTSKa/HPEmplto/xGv+WXms/cx1+HvHWaqXAflX383fs0h5oKFECRLO5Cu
         4IWg==
X-Gm-Message-State: AOAM531D2gl0OJmZ0J9pry1gaagjlwS21Q+E01tkSZzS+mYvWYh1ZmUN
        8UuCMkRRniuMrZHCBJ162AXAMA==
X-Google-Smtp-Source: ABdhPJyNC53JvGfTRvEHLfMmhZGaR3cy2dCdn1n96q59Rc7U/59GKl5q24SheXagRu3oedysUHBoYQ==
X-Received: by 2002:a17:903:24d:b0:143:beb5:b6b1 with SMTP id j13-20020a170903024d00b00143beb5b6b1mr18420870plh.54.1638484065458;
        Thu, 02 Dec 2021 14:27:45 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
        by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:27:45 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Russell King <linux@armlinux.org.uk>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v4 11/34] drm/armada: Migrate to aggregate driver
Date:   Thu,  2 Dec 2021 14:27:09 -0800
Message-Id: <20211202222732.2453851-12-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Russell King <linux@armlinux.org.uk>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/armada/armada_drv.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 8e3e98f13db4..b3559363ea43 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -60,8 +60,9 @@ static const struct drm_mode_config_funcs armada_drm_mode_config_funcs = {
 	.atomic_commit		= drm_atomic_helper_commit,
 };
 
-static int armada_drm_bind(struct device *dev)
+static int armada_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct armada_private *priv;
 	struct resource *mem = NULL;
 	int ret, n;
@@ -159,8 +160,9 @@ static int armada_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void armada_drm_unbind(struct device *dev)
+static void armada_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct armada_private *priv = drm_to_armada_dev(drm);
 
@@ -202,9 +204,13 @@ static void armada_add_endpoints(struct device *dev,
 	}
 }
 
-static const struct component_master_ops armada_master_ops = {
-	.bind = armada_drm_bind,
-	.unbind = armada_drm_unbind,
+static struct aggregate_driver armada_aggregate_driver = {
+	.probe = armada_drm_bind,
+	.remove = armada_drm_unbind,
+	.driver = {
+		.name = "armada_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int armada_drm_probe(struct platform_device *pdev)
@@ -213,7 +219,7 @@ static int armada_drm_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int ret;
 
-	ret = drm_of_component_probe(dev, compare_dev_name, &armada_master_ops);
+	ret = drm_of_aggregate_probe(dev, compare_dev_name, &armada_aggregate_driver);
 	if (ret != -EINVAL)
 		return ret;
 
@@ -240,13 +246,12 @@ static int armada_drm_probe(struct platform_device *pdev)
 		}
 	}
 
-	return component_master_add_with_match(&pdev->dev, &armada_master_ops,
-					       match);
+	return component_aggregate_register(&pdev->dev, &armada_aggregate_driver, match);
 }
 
 static int armada_drm_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &armada_master_ops);
+	component_aggregate_unregister(&pdev->dev, &armada_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

