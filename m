Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47197486C66
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 22:46:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244834AbiAFVqq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 16:46:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244516AbiAFVqY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 16:46:24 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94450C06118C
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 13:46:24 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id s15so3594276pfk.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 13:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6IAciPlNRPfkJgo3LSljGMR1t9yoWVxJAu5cqfoLKs8=;
        b=Ui8wQJEmkOFa0mFXYEgsE6oEWR64bOCZFpPJNPhPReKZqlNYesA2A+Uh5/rpMcQa0g
         GZqntZqMXJjU6tk3qMd7yAsZ4uJw2LAT9Atbjj4E2NVaZRSW1crPxLfyrCrUCAYjpM7K
         A9PajHMZd8Q4KNCfPqvbXO1U2yICRGXb1wWfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6IAciPlNRPfkJgo3LSljGMR1t9yoWVxJAu5cqfoLKs8=;
        b=ty0LgB+Q0JVXM+x4aqmC6wyHXruung2zzJuny7NX0GRUrHbw6cxItDE3FGAW2PxeXK
         H4AXRSQS0imUV0QlmV4ekKJOkjRK6ZyorBpghQaquQN9yKfIjZzzQT/csGmAwbq7kLha
         a89uFAe6Mr8EyyRZKHPPCRE/4PSMns0ZqV9eeap29Qmg4wVlkZvk4tB3grdP+GqVWVlx
         oDgiDPJMQHI2zkuOAPC5jlXRdw2JQTLMmqNYZqf9QNEA73j/mL84Yt0pr42JOZkv2P8S
         LT3miQtkB/ky/esRricUuUYY1XdZB9n/9qYNlL6xJEibVgOfrO90RkWy3uuLpe1KGI5m
         LrXg==
X-Gm-Message-State: AOAM533JUF1HYI0B5eS3Xq9wuvQMN5wcqmCEVY74XIJRYi9HqnaPf7H1
        Q/t1g+cddbBUaFBjBVvfA63p5A==
X-Google-Smtp-Source: ABdhPJzWq9RI710y90K8zf1uJwBYNts69ZS6HDcA6iBGlm/u3mYDFqh9Vm6XQfwp3ev4pTauXgTU0g==
X-Received: by 2002:a63:d314:: with SMTP id b20mr54174333pgg.207.1641505584138;
        Thu, 06 Jan 2022 13:46:24 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
        by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 13:46:23 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Tomi Valkeinen <tomba@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v5 19/32] drm/omap: Migrate to aggregate driver
Date:   Thu,  6 Jan 2022 13:45:42 -0800
Message-Id: <20220106214556.2461363-20-swboyd@chromium.org>
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

Cc: Tomi Valkeinen <tomba@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/omapdrm/dss/dss.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index d6a5862b4dbf..9328d97f19ab 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1304,8 +1304,9 @@ static const struct soc_device_attribute dss_soc_devices[] = {
 	{ /* sentinel */ }
 };
 
-static int dss_bind(struct device *dev)
+static int dss_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct dss_device *dss = dev_get_drvdata(dev);
 	struct platform_device *drm_pdev;
 	struct dss_pdata pdata;
@@ -1330,8 +1331,9 @@ static int dss_bind(struct device *dev)
 	return 0;
 }
 
-static void dss_unbind(struct device *dev)
+static void dss_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct dss_device *dss = dev_get_drvdata(dev);
 
 	platform_device_unregister(dss->drm_pdev);
@@ -1339,9 +1341,13 @@ static void dss_unbind(struct device *dev)
 	component_unbind_all(dev, NULL);
 }
 
-static const struct component_master_ops dss_component_ops = {
-	.bind = dss_bind,
-	.unbind = dss_unbind,
+static struct aggregate_driver dss_aggregate_driver = {
+	.probe = dss_bind,
+	.remove = dss_unbind,
+	.driver = {
+		.name = "dss_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int dss_component_compare(struct device *dev, void *data)
@@ -1504,7 +1510,7 @@ static int dss_probe(struct platform_device *pdev)
 	cmatch.match = &match;
 	device_for_each_child(&pdev->dev, &cmatch, dss_add_child_component);
 
-	r = component_master_add_with_match(&pdev->dev, &dss_component_ops, match);
+	r = component_aggregate_register(&pdev->dev, &dss_aggregate_driver, match);
 	if (r)
 		goto err_of_depopulate;
 
@@ -1543,7 +1549,7 @@ static int dss_remove(struct platform_device *pdev)
 
 	of_platform_depopulate(&pdev->dev);
 
-	component_master_del(&pdev->dev, &dss_component_ops);
+	component_aggregate_unregister(&pdev->dev, &dss_aggregate_driver);
 
 	dss_debugfs_remove_file(dss->debugfs.clk);
 	dss_debugfs_remove_file(dss->debugfs.dss);
-- 
https://chromeos.dev

