Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD0A9466C33
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 23:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377222AbhLBWbI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 17:31:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356400AbhLBWbH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 17:31:07 -0500
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F58C06174A
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 14:27:44 -0800 (PST)
Received: by mail-pf1-x431.google.com with SMTP id o4so915884pfp.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 14:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=udX8aXVKtCgorZpoo7KBRMV9fl84l0zJ44mq5nPYnXQ=;
        b=TjqoJhhXaMP8hQlnS9mUSCYUDbyLXLVNi4ZHMPz7cMNMk89AJHT7ut7rIOAmSOtbPT
         CM/EMZKOMnPjVOh1Cs9zslDLklE243BdGdVj8ymfawIZQCJQ5dS5YUHc+Ibj8DTzlKxA
         IKypX8XmEuoMlr5UhMowgQybQ1aOPnRfDUqMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=udX8aXVKtCgorZpoo7KBRMV9fl84l0zJ44mq5nPYnXQ=;
        b=Vrhphst94oqio53BKmeHY0w3f/bb2GzyvnMMMt2uRflMyDlpZqIjd2Sy6Xu9ohdYQ3
         QwxD7bK6xt54XeZYWGkte26gWUwFATmJges3aWhoukfy2hUhrOgQ20xnoYI9f82j7Inc
         RrnvY+mGsL7CJa288psGkFM/V7Bp/6mXm6Zq6+18lcBMRbl3+IFUnSkNfoKT0gwjJVgJ
         ohItRel/Ik+1G0lDrUFnr+Sqxczk/70rp8koCME8uHGADC+dZeOrdcHir3qmcHkYEGtQ
         1Zq0lgLw2t4nR4YyVVXXUeN9i6JXT8NFEmeyC+cazPJ99wxJYMY271EoWE0XCtoTtA6K
         Lqbg==
X-Gm-Message-State: AOAM5312XLVGXL4C4RuhHaXPNmURIZtZHTlJlDSW3Q1fiUExxO0ZG0lk
        /0Fupkv6X4G/tFt416S3i+HI6w==
X-Google-Smtp-Source: ABdhPJymhpPWoRgTHhyDy+KR0Ms3HpYkh5COqphEYyWJv6Q+0OX4qWjOQ3OwkIsidViKOltM3lMIDw==
X-Received: by 2002:a63:4a42:: with SMTP id j2mr1552651pgl.113.1638484063815;
        Thu, 02 Dec 2021 14:27:43 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
        by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:27:43 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Liviu Dudau <liviu.dudau@arm.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v4 09/34] drm/arm/hdlcd: Migrate to aggregate driver
Date:   Thu,  2 Dec 2021 14:27:07 -0800
Message-Id: <20211202222732.2453851-10-swboyd@chromium.org>
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

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/arm/hdlcd_drv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 479c2422a2e0..5c03eb98d814 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -270,8 +270,9 @@ static const struct drm_driver hdlcd_driver = {
 	.minor = 0,
 };
 
-static int hdlcd_drm_bind(struct device *dev)
+static int hdlcd_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm;
 	struct hdlcd_drm_private *hdlcd;
 	int ret;
@@ -344,8 +345,9 @@ static int hdlcd_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void hdlcd_drm_unbind(struct device *dev)
+static void hdlcd_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct hdlcd_drm_private *hdlcd = drm->dev_private;
 
@@ -367,9 +369,13 @@ static void hdlcd_drm_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops hdlcd_master_ops = {
-	.bind		= hdlcd_drm_bind,
-	.unbind		= hdlcd_drm_unbind,
+static struct aggregate_driver hdlcd_aggregate_driver = {
+	.probe		= hdlcd_drm_bind,
+	.remove		= hdlcd_drm_unbind,
+	.driver		= {
+		.name	= "hdlcd_drm",
+		.owner	= THIS_MODULE,
+	},
 };
 
 static int compare_dev(struct device *dev, void *data)
@@ -390,13 +396,12 @@ static int hdlcd_probe(struct platform_device *pdev)
 	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
 	of_node_put(port);
 
-	return component_master_add_with_match(&pdev->dev, &hdlcd_master_ops,
-					       match);
+	return component_aggregate_register(&pdev->dev, &hdlcd_aggregate_driver, match);
 }
 
 static int hdlcd_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &hdlcd_master_ops);
+	component_aggregate_unregister(&pdev->dev, &hdlcd_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

