Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52F2C486C31
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 22:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244482AbiAFVqP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 16:46:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244440AbiAFVqI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 16:46:08 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20D7C06118C
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 13:46:07 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id ie13so3571977pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 13:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MLFo5uJ88/q78BTGkhEJmKSkKMysd8HwfQglPXTN2wU=;
        b=nglDE8QY9t5hdSAJx4+V4q37ClBOabpxxFLIHDIl6b0J46Y4aM7i5LRT8JyqwRd/GR
         /dlRGYshMif/788W7Cbe1ePX91QrDYEuSqLmhtUQ/Rn7UEuXvBeE28dA6qmUpch4oWe1
         /663ZKSP2KxNRXEUAPmX2A93rjrDVp/KOHSKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MLFo5uJ88/q78BTGkhEJmKSkKMysd8HwfQglPXTN2wU=;
        b=pxltPkJObkGpARyd2GtHwGSpGn+kDbLdWoLJEvJKj3dqx97r9oaUo/yj5u9bMd82Rc
         2ZqG5eZ/inV41tCPRZGmErTEr5YqlgPIA1/x1o7XriJhPL1rs5zSo7WvCBmKISQqM81b
         lSHkFXcvAxj1BZ3JqCaZiPomwGk9qkXDOA+/2kyXSvGwntz3G0RuXa9WlrsTS7m79fz7
         QvN8yhiK8gsN+EwNSNTBzQzkMGekOZcr2beW1twqnhnxh1zEHd3kE0yCcFsJzGHJBKpQ
         r+jt+sQJJKaFJ5xiKx0cJjrj+bJg+7vAVm/00NJ5TIxsRT96eviAHizx8i3D1IJx7KrV
         thiA==
X-Gm-Message-State: AOAM530zVd7CM40sX5SHqKVyw1vmNHYocOmhQSQJ15uv+88HsSc/ydEn
        t2WZ21sRmzJJMlhBMvvN3EQF3A==
X-Google-Smtp-Source: ABdhPJxKPNiQbLhCjMWfO6s24aaY/aGv9aYyqnVU0SdXtFDVXaiu2l9rIuGYklh4MYLASJomWl2L2Q==
X-Received: by 2002:a17:90b:3ece:: with SMTP id rm14mr12322633pjb.6.1641505567437;
        Thu, 06 Jan 2022 13:46:07 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
        by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 13:46:07 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v5 06/32] drm/msm: Migrate to aggregate driver
Date:   Thu,  6 Jan 2022 13:45:29 -0800
Message-Id: <20220106214556.2461363-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20220106214556.2461363-1-swboyd@chromium.org>
References: <20220106214556.2461363-1-swboyd@chromium.org>
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
 drivers/gpu/drm/msm/msm_drv.c | 46 +++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7936e8d498dd..f6e9b0d318f5 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1360,19 +1360,35 @@ static int add_gpu_components(struct device *dev,
 	return 0;
 }
 
-static int msm_drm_bind(struct device *dev)
+static int msm_drm_bind(struct aggregate_device *adev)
 {
-	return msm_drm_init(dev, &msm_driver);
+	return msm_drm_init(adev->parent, &msm_driver);
 }
 
-static void msm_drm_unbind(struct device *dev)
+static void msm_drm_unbind(struct aggregate_device *adev)
 {
-	msm_drm_uninit(dev);
+	msm_drm_uninit(adev->parent);
+}
+
+static void msm_drm_shutdown(struct aggregate_device *adev)
+{
+	struct drm_device *drm = platform_get_drvdata(to_platform_device(adev->parent));
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
@@ -1401,7 +1417,7 @@ static int msm_pdev_probe(struct platform_device *pdev)
 	if (ret)
 		goto fail;
 
-	ret = component_master_add_with_match(&pdev->dev, &msm_drm_ops, match);
+	ret = component_aggregate_register(&pdev->dev, &msm_drm_aggregate_driver, match);
 	if (ret)
 		goto fail;
 
@@ -1414,23 +1430,12 @@ static int msm_pdev_probe(struct platform_device *pdev)
 
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
@@ -1446,7 +1451,6 @@ MODULE_DEVICE_TABLE(of, dt_match);
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
 	.remove     = msm_pdev_remove,
-	.shutdown   = msm_pdev_shutdown,
 	.driver     = {
 		.name   = "msm",
 		.of_match_table = dt_match,
-- 
https://chromeos.dev

