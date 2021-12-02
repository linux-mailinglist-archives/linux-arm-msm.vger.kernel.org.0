Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 773C8466CA9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 23:29:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377505AbhLBWcf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 17:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377325AbhLBWbw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 17:31:52 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93CE5C0617A1
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 14:27:56 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id h24so855574pjq.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 14:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wlRODoqLGygqE0LYiWEnBFh9kz/XzAvDsSAOOxu5peY=;
        b=aYALRHsFn0lNW8BmuMj4+kHCOs9s7+R3OgAv3OJiR95IZOKFQZ+w9qea1ICG/SodJ/
         +igOzUmHyzEw8aAwsBgJXPFpnzUsIWHpzkXGRs6MiCl/xNqRK4S7e4JncJDKrp9lxp5C
         rfQZhyDKl2Hmvyfaujv6SVjj5DXjOOdZ9ekBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wlRODoqLGygqE0LYiWEnBFh9kz/XzAvDsSAOOxu5peY=;
        b=vWyHeHWPZyRKRgqdXaOsFvxOzA7S/fbXbRausKwpjA1XVB7dQL/5payJq/v5JTP8eN
         ZDU/pp+3VJ/vk4GxX96fhak+F5laCelNKZONESoKrBbKVzSYRxKp2dOo1XDX6gVvCUb0
         DWBExpp6+KMrWgXen/CzrjWYmakvXPhXV+DgvwnRkghgjuQ8EY3Ed6nBqt67bE1JnlBY
         i7bwzAUPxZTdm7Gl94NqjMULbtEEBgECsw0DckSSIOkk7kQbhPfUQgVazfF68TTHXCGx
         +fvlPXIImKns95tTb2ECCorX7KbyK8w3xo890RniSxUK03JguM+hd02gtU1DLEaEk6Fy
         vjmw==
X-Gm-Message-State: AOAM531fCYUAyQ3h0dfTvhec9QHyDXr83ZrXRCEQEvlRVph1OWKg4/DG
        o6hd038oa7ppRgNBpCMNwktMjQ==
X-Google-Smtp-Source: ABdhPJxUiQZ6cWHUZ7HxSKVla2/DNt2mW2yGwcM3YSXCD3G009K29EH1KFvgM4SvxeeeA68bDxoOhA==
X-Received: by 2002:a17:90b:4b03:: with SMTP id lx3mr9200581pjb.18.1638484076151;
        Thu, 02 Dec 2021 14:27:56 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
        by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:27:55 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomba@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v4 24/34] drm/tilcdc: Migrate to aggregate driver
Date:   Thu,  2 Dec 2021 14:27:22 -0800
Message-Id: <20211202222732.2453851-25-swboyd@chromium.org>
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

Tested-by: Jyri Sarha <jyri.sarha@iki.fi>
Cc: Tomi Valkeinen <tomba@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 3ddb7c710a3d..92ff516fb6de 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -529,13 +529,16 @@ static const struct dev_pm_ops tilcdc_pm_ops = {
 /*
  * Platform driver:
  */
-static int tilcdc_bind(struct device *dev)
+static int tilcdc_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
+
 	return tilcdc_init(&tilcdc_driver, dev);
 }
 
-static void tilcdc_unbind(struct device *dev)
+static void tilcdc_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *ddev = dev_get_drvdata(dev);
 
 	/* Check if a subcomponent has already triggered the unloading. */
@@ -545,9 +548,13 @@ static void tilcdc_unbind(struct device *dev)
 	tilcdc_fini(dev_get_drvdata(dev));
 }
 
-static const struct component_master_ops tilcdc_comp_ops = {
-	.bind = tilcdc_bind,
-	.unbind = tilcdc_unbind,
+static struct aggregate_driver tilcdc_aggregate_driver = {
+	.probe = tilcdc_bind,
+	.remove = tilcdc_unbind,
+	.driver = {
+		.name = "tilcdc_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int tilcdc_pdev_probe(struct platform_device *pdev)
@@ -564,12 +571,9 @@ static int tilcdc_pdev_probe(struct platform_device *pdev)
 	ret = tilcdc_get_external_components(&pdev->dev, &match);
 	if (ret < 0)
 		return ret;
-	else if (ret == 0)
+	if (ret == 0)
 		return tilcdc_init(&tilcdc_driver, &pdev->dev);
-	else
-		return component_master_add_with_match(&pdev->dev,
-						       &tilcdc_comp_ops,
-						       match);
+	return component_aggregate_register(&pdev->dev, &tilcdc_aggregate_driver, match);
 }
 
 static int tilcdc_pdev_remove(struct platform_device *pdev)
@@ -579,10 +583,10 @@ static int tilcdc_pdev_remove(struct platform_device *pdev)
 	ret = tilcdc_get_external_components(&pdev->dev, NULL);
 	if (ret < 0)
 		return ret;
-	else if (ret == 0)
+	if (ret == 0)
 		tilcdc_fini(platform_get_drvdata(pdev));
 	else
-		component_master_del(&pdev->dev, &tilcdc_comp_ops);
+		component_aggregate_unregister(&pdev->dev, &tilcdc_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

