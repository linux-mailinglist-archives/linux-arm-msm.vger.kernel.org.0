Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA93A49EB9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jan 2022 21:02:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343649AbiA0UCK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 15:02:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343694AbiA0UCJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 15:02:09 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7A0C061748
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:09 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id c3so3698498pls.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qNjVi/dtor3YPPis15U918Dv8DbZI7rkWw2W0PoTyLw=;
        b=MbLWsQKtzqMdB6TR92CWX09HwWAVICVRUPQdGnE8qtwEt55hq1VEqji+rp8vrVgl/d
         DRHLMSEBAVQb3vSzBApvM3+l3ud49iQqe1JUvkQnDPH1XQHU3KLL2iBCm7lPVoTrf/hM
         KFpAvbmSKcOKdTOm9dEmOVr1LcIQUUKQDKVHo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qNjVi/dtor3YPPis15U918Dv8DbZI7rkWw2W0PoTyLw=;
        b=fXLuNCvmUbw451W7GFlIWoKRbCfwISbyY2bePmUQxdt94RaWB++aLXLchW5lH7sjyF
         Q2lwLedegU1+1tE/118iEfKh+s6FBodkhdoObJXgOQtjImOvqYpMp4WjBhWMh+EJZQuk
         jZb3TYmtbgqJ/Kox+iBIXWjQszhUVNBhnlwOyW9R0U2vEFi5/fl1iRXu9p+BjvT1aWbd
         FBmB4VNTHCE0ncH02GQK1nXNKrwXOrX8BNZxhnqYi6WBLjqMwxCGpSIE8N/bDClu2Kbo
         4cITOQYPr9pRKHy+/Ca0byEMwrDi59RCLE53Z+Fmei5VB7O7KfPEPQyH8gG2xsZGXSnT
         A0VQ==
X-Gm-Message-State: AOAM532yNkoOPXLgKW2QdRNDeX9P711ckuFsAzy42K43TTW2Wlf5+zvN
        vPle69JqxTRg5/nuA+3cqT2QjQ==
X-Google-Smtp-Source: ABdhPJz+tPk8d+x+q2ZjVwxtYt5rjYPWT3YY5moMRA+Ipjppy+sGlcAobZY5/oFUFrZAy6t+oNlz4A==
X-Received: by 2002:a17:902:d509:: with SMTP id b9mr4718199plg.42.1643313728886;
        Thu, 27 Jan 2022 12:02:08 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
        by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 12:02:08 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v6 11/35] drm/etnaviv: Migrate to aggregate driver
Date:   Thu, 27 Jan 2022 12:01:17 -0800
Message-Id: <20220127200141.1295328-12-swboyd@chromium.org>
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

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 0b756ecb1bc2..5d1cc3953204 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -494,8 +494,9 @@ static const struct drm_driver etnaviv_drm_driver = {
 /*
  * Platform driver:
  */
-static int etnaviv_bind(struct device *dev)
+static int etnaviv_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct etnaviv_drm_private *priv;
 	struct drm_device *drm;
 	int ret;
@@ -552,8 +553,9 @@ static int etnaviv_bind(struct device *dev)
 	return ret;
 }
 
-static void etnaviv_unbind(struct device *dev)
+static void etnaviv_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct etnaviv_drm_private *priv = drm->dev_private;
 
@@ -569,9 +571,13 @@ static void etnaviv_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops etnaviv_master_ops = {
-	.bind = etnaviv_bind,
-	.unbind = etnaviv_unbind,
+static struct aggregate_driver etnaviv_aggregate_driver = {
+	.probe = etnaviv_bind,
+	.remove = etnaviv_unbind,
+	.driver = {
+		.name = "etnaviv_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int compare_of(struct device *dev, void *data)
@@ -639,12 +645,12 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 	if (first_node)
 		of_dma_configure(&pdev->dev, first_node, true);
 
-	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
+	return component_aggregate_register(dev, &etnaviv_aggregate_driver, match);
 }
 
 static int etnaviv_pdev_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &etnaviv_master_ops);
+	component_aggregate_unregister(&pdev->dev, &etnaviv_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

