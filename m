Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5299F486C8C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 22:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245136AbiAFVrJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 16:47:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244747AbiAFVqk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 16:46:40 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83BB5C033268
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 13:46:28 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id 200so3742609pgg.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 13:46:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qrvKBJr+DUbrISc8WyZICnsdtffozhNCQiB3CMiYO5U=;
        b=YIm4yDL/DEzHEQ/KoisiGKXELBefTLgB6abDYKWPS//x1Mhw76BhF0i5M5H2ximQJJ
         Vr+KqieRuR4wHbR/hT46JfKeUSLg/gnc/Zpvg3isTAL8jjkmUUJNj1n7hA50mrOxpJIp
         aSKva71JsYpieNtNkDr58YeU8LeXNems3/iHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qrvKBJr+DUbrISc8WyZICnsdtffozhNCQiB3CMiYO5U=;
        b=nlSo96nRi+w8clT7cx8VO+fXBMH1H3Duwrg/XILB6IYMQk38T3IjYz+YjgOeAMCOrg
         lrR9CVyLk/oj+9geZ+mPl4HHnKW3rcGwyj+szCZLDWWola8R/ZaeXe9zIVXW6iWKb5rg
         hWIQPyPkQSawidq5JitVY9QrqPgvKilJQCThftC/Eq4IsscyYj49XrGwBS2b22plcJt3
         x3wEaFm03RVF3YKJuOjeEsZlj0eWnsHh5J8ORy7yClu7H1D80onZ8yvxF8vEXAt5zi8R
         /I8DReO/6zPKg82jlYTplhof447TGPS0s8sYaun0RA3VZeVppTa3NmWwwqVYfJdoJ5Yk
         w97Q==
X-Gm-Message-State: AOAM5306ihQfV4wH6gc/R2UXOIZcd/s11Z4RcA3GDkSrzLB0SMGFXpct
        qi1AUn9xffvV9XYr3m9Zhfeyhg==
X-Google-Smtp-Source: ABdhPJzb1OQ9XAYSMCSxVIyMkn4sVO7K/RXDTcJbr0zEftWLLjfJcqfaTtD8//YXtBqZkQi6QNLBPw==
X-Received: by 2002:a63:b257:: with SMTP id t23mr292463pgo.335.1641505588077;
        Thu, 06 Jan 2022 13:46:28 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
        by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 13:46:27 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v5 22/32] drm/sun4i: Migrate to aggregate driver
Date:   Thu,  6 Jan 2022 13:45:45 -0800
Message-Id: <20220106214556.2461363-23-swboyd@chromium.org>
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

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 54dd562e294c..700f5e32eaf7 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -56,8 +56,9 @@ static const struct drm_driver sun4i_drv_driver = {
 	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(drm_sun4i_gem_dumb_create),
 };
 
-static int sun4i_drv_bind(struct device *dev)
+static int sun4i_drv_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm;
 	struct sun4i_drv *drv;
 	int ret;
@@ -125,8 +126,9 @@ static int sun4i_drv_bind(struct device *dev)
 	return ret;
 }
 
-static void sun4i_drv_unbind(struct device *dev)
+static void sun4i_drv_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -140,9 +142,13 @@ static void sun4i_drv_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops sun4i_drv_master_ops = {
-	.bind	= sun4i_drv_bind,
-	.unbind	= sun4i_drv_unbind,
+static struct aggregate_driver sun4i_aggregate_driver = {
+	.probe	= sun4i_drv_bind,
+	.remove	= sun4i_drv_unbind,
+	.driver = {
+		.name = "sun4i_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static bool sun4i_drv_node_is_connector(struct device_node *node)
@@ -398,16 +404,14 @@ static int sun4i_drv_probe(struct platform_device *pdev)
 	}
 
 	if (count)
-		return component_master_add_with_match(&pdev->dev,
-						       &sun4i_drv_master_ops,
-						       match);
-	else
-		return 0;
+		return component_aggregate_register(&pdev->dev, &sun4i_aggregate_driver, match);
+
+	return 0;
 }
 
 static int sun4i_drv_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &sun4i_drv_master_ops);
+	component_aggregate_unregister(&pdev->dev, &sun4i_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

