Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED7C3389A8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 02:25:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbhETA1A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 20:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbhETA0u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 20:26:50 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C560C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 17:25:29 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id t11so8211622pjm.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 17:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eanr2DcYZIggHUgMEn0KdbDrKxqsY930ITBHaw/uXpk=;
        b=Q5FtFQCoTCltK47bui3B34LpdAVjlO4saBuydOIo3kbnm3B7ZcjPWzsqDCLwFO7afi
         HAFVCHFe60Di9AfpZJkhjS5i1gfFQhgeAAEANcA8pXi3t1hl6+7i+8A5VwrzOZxltmnW
         5dM1LMd1niY0MQfZeq6Jqo17/s9AyOv4ivEeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eanr2DcYZIggHUgMEn0KdbDrKxqsY930ITBHaw/uXpk=;
        b=Sm9LKhrCJ2M/fzJX+zU/1U7zcqxxgVTIvNvp+TsRjXtuBa6XUEvard4Uq3ZGUPFuF8
         qo6pTcBIie2oaHOgJ2AtswakDmPpKHrha+xoz3TK3+FOImSLh9F8R3iMCFD5t8qGwXX9
         vT61DvxBidrLbjjH2lVXO0LcUTXcAeknEaGE/5j/iQTHcnmMY6b5vHj6R9nNHdbjSqNG
         TcmLoHtfoBm0AXtgavrwJk7CjJriOtr2aV8iC5h1KvYi+T5yOx+gr9Uoh0RFkuVDHppD
         qnrzNLG+i9ENWxZEwbTcEOoaiD9MEK765gOVtuKRweYng/+Q8vQkk1YQp4Zebc6ORuNt
         CYZQ==
X-Gm-Message-State: AOAM532Dt6ktfnMlqa+1c26mK3BwuuiCCgTKsa5Q7xO6kGUAavuQsNaA
        ycPEKWQ516050CrUEyNkbVHxug==
X-Google-Smtp-Source: ABdhPJyJZN06nQDaeKHyI1p58xhuuwtll+FDAZ6NIPB+f3/t70I52BAC9zJ6UsMmMgvoYIqVsxlhQA==
X-Received: by 2002:a17:902:70c1:b029:ef:652c:cbb5 with SMTP id l1-20020a17090270c1b02900ef652ccbb5mr2602418plt.14.1621470328871;
        Wed, 19 May 2021 17:25:28 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:200b:db75:4e6c:8b96])
        by smtp.gmail.com with ESMTPSA id i14sm398904pfk.130.2021.05.19.17.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 17:25:28 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH 7/7] drm/msm: Migrate to aggregate driver
Date:   Wed, 19 May 2021 17:25:19 -0700
Message-Id: <20210520002519.3538432-8-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210520002519.3538432-1-swboyd@chromium.org>
References: <20210520002519.3538432-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The device lists are poorly ordered when the component device code is
used. This is because component_master_add_with_match() returns 0
regardless of component devices calling component_add() first. It can
really only fail if an allocation fails, in which case everything is
going bad and we're out of memory. The driver that registers the
aggregate driver, can succeed at probe and put the attached device on
the DPM lists before any of the component devices are probed and put on
the lists.

Within the component device framework this usually isn't that bad
because the real driver work is done at bind time via
component{,master}_ops::bind(). It becomes a problem when the driver
core, or host driver, wants to operate on the component device outside
of the bind/unbind functions, e.g. via 'remove' or 'shutdown'. The
driver core doesn't understand the relationship between the host device
and the component devices and could possibly try to operate on component
devices when they're already removed from the system or shut down.

Normally, device links or probe defer would reorder the lists and put
devices that depend on other devices in the lists at the correct
location, but with component devices this doesn't happen because this
information isn't expressed anywhere. Drivers simply succeed at
registering their component or the aggregate driver with the component
framework and wait for their bind() callback to be called once the other
components are ready. In summary, the drivers that make up the aggregate
driver can probe in any order.

This ordering problem becomes fairly obvious when shutting down the
device with a DSI controller connected to a DSI bridge that is
controlled via i2c. In this case, the msm display driver wants to tear
down the display pipeline on shutdown via msm_pdev_shutdown() by calling
drm_atomic_helper_shutdown(), and it can't do that unless the whole
display chain is still probed and active in the system. When a display
bridge is on i2c, the i2c device for the bridge will be created whenever
the i2c controller probes, which could be before or after the msm
display driver probes. If the i2c controller probes after the display
driver, then the i2c controller will be shutdown before the display
controller during system wide shutdown and thus i2c transactions will
stop working before the display pipeline is shut down. This means we'll
have the display bridge trying to access an i2c bus that's shut down
because drm_atomic_helper_shutdown() is trying to disable the bridge
after the bridge is off.

The solution is to make the aggregate driver into a real struct driver
that is bound to a device when the other component devices have all
probed. Now that the component driver code is a proper bus, we can
simply register an aggregate driver with that bus via
component_aggregate_register() and then attach the shutdown hook to that
driver to be sure that the shutdown for the display pipeline is called
before any of the component device driver shutdown hooks are called.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

As stated in the cover letter, this isn't perfect but it still works. I
get a warning from runtime PM that the parent device (e00000.mdss) is
not runtime PM enabled but the child device (the aggregate device) is
being enabled by the bus logic. I need to move around the place that the
parent device is runtime PM enabled and probably keep it powered up
during the entire time that the driver is probed until the aggregate
driver probes.

 drivers/gpu/drm/msm/msm_drv.c | 47 +++++++++++++++++++----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index e1104d2454e2..0c64e6a2ce25 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1265,19 +1265,35 @@ static int add_gpu_components(struct device *dev,
 	return 0;
 }
 
-static int msm_drm_bind(struct device *dev)
+static int msm_drm_bind(struct aggregate_device *adev)
 {
-	return msm_drm_init(dev, &msm_driver);
+	return msm_drm_init(adev->dev.parent, &msm_driver);
 }
 
-static void msm_drm_unbind(struct device *dev)
+static void msm_drm_unbind(struct aggregate_device *adev)
 {
-	msm_drm_uninit(dev);
+	msm_drm_uninit(adev->dev.parent);
+}
+
+static void msm_drm_shutdown(struct aggregate_device *adev)
+{
+	struct drm_device *drm = platform_get_drvdata(to_platform_device(adev->dev.parent));
+	struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
+
+	if (!priv || !priv->kms)
+		return;
+
+	drm_atomic_helper_shutdown(drm);
 }
 
-static const struct component_master_ops msm_drm_ops = {
-	.bind = msm_drm_bind,
-	.unbind = msm_drm_unbind,
+static struct aggregate_driver msm_drm_aggregate_driver = {
+	.probe = msm_drm_bind,
+	.remove = msm_drm_unbind,
+	.shutdown = msm_drm_shutdown,
+	.driver = {
+		.name	= "msm_drm",
+		.owner	= THIS_MODULE,
+	},
 };
 
 /*
@@ -1306,7 +1322,8 @@ static int msm_pdev_probe(struct platform_device *pdev)
 	if (ret)
 		goto fail;
 
-	ret = component_master_add_with_match(&pdev->dev, &msm_drm_ops, match);
+	msm_drm_aggregate_driver.match = match;
+	ret = component_aggregate_register(&pdev->dev, &msm_drm_aggregate_driver);
 	if (ret)
 		goto fail;
 
@@ -1319,23 +1336,12 @@ static int msm_pdev_probe(struct platform_device *pdev)
 
 static int msm_pdev_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &msm_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &msm_drm_aggregate_driver);
 	of_platform_depopulate(&pdev->dev);
 
 	return 0;
 }
 
-static void msm_pdev_shutdown(struct platform_device *pdev)
-{
-	struct drm_device *drm = platform_get_drvdata(pdev);
-	struct msm_drm_private *priv = drm ? drm->dev_private : NULL;
-
-	if (!priv || !priv->kms)
-		return;
-
-	drm_atomic_helper_shutdown(drm);
-}
-
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,mdp4", .data = (void *)KMS_MDP4 },
 	{ .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
@@ -1351,7 +1357,6 @@ MODULE_DEVICE_TABLE(of, dt_match);
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
 	.remove     = msm_pdev_remove,
-	.shutdown   = msm_pdev_shutdown,
 	.driver     = {
 		.name   = "msm",
 		.of_match_table = dt_match,
-- 
https://chromeos.dev

