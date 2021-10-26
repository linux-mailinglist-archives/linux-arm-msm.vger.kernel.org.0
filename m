Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B6443A8CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 02:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235972AbhJZAEA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 20:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235749AbhJZADc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 20:03:32 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B72F6C061767
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:01:07 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id i5so9024392pla.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0NtNoitnZpRD+QXZE528qbbYjh9dmwDBO87rVNizGkg=;
        b=MkpS8mYXYZqk/7Nl8cm+FACjFCj9sRfBP+cI4HAQV78Fb5HJmEC3lEI2D45nLTFAlE
         siWcKQrdjpkbAZLWqUTH/wIYNd05pSjofkRJAB90KF/7zgFj/bDbDpe3LcYfoGqW73Fu
         MRNCGUEWcC/Uyedqxrf8IxVsXEbqt1KtgUXAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0NtNoitnZpRD+QXZE528qbbYjh9dmwDBO87rVNizGkg=;
        b=lP1zXTNqAmHIHvj8HGoPBJ3Z1TVMdqM5kaKMo4P9M3rlOAlwgJv8p218dvQnD8ZWsX
         GgeYCjyAIX92iZmmWdCeE8g0GJZ7lnSg1vA19vxHZG3oHkI6VaVetfxZGE1bdZN4wSog
         Mo2O2/Yf375OyO+kjcWnmcymj9coUS2UVSbSlAJ1q6OZUN4QT389iBFUUl6npukRlUaY
         NJkFVPvBocRwX8DhvKgjSwDKPtwSICGJsZ75popT6MvndzfmhxPtVwSR+UqW8hg6nENd
         VWmmxJtXTvjpbGLK7BGzxiieYPcBWkeGKyLpDZ6E5JJfzJ7jEWOENOfq5oe14jiupod4
         +k/A==
X-Gm-Message-State: AOAM533e4+AZFiJ4SCGNaujYTeV47h/saQG+mlXhJP2PmxWQYqQBBznr
        Y0+UbRz0EoNKQcyWCEMRmVMHVzUnVVQ=
X-Google-Smtp-Source: ABdhPJzS7rBd0UngMBRyJ0xskLKRSYsErpV4cnHHIRxNh02iXz47s2c97WpjkL2B1CQapTgu6tyRgQ==
X-Received: by 2002:a17:903:1252:b0:13d:f3f6:2e1c with SMTP id u18-20020a170903125200b0013df3f62e1cmr19295693plh.73.1635206467259;
        Mon, 25 Oct 2021 17:01:07 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
        by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 17:01:06 -0700 (PDT)
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
Subject: [PATCH v3 24/34] drm/tilcdc: Migrate to aggregate driver
Date:   Mon, 25 Oct 2021 17:00:34 -0700
Message-Id: <20211026000044.885195-25-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026000044.885195-1-swboyd@chromium.org>
References: <20211026000044.885195-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Jyri Sarha <jyri.sarha@iki.fi>
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
index 6b03f89a98d4..d5c6567eec8d 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -531,13 +531,16 @@ static const struct dev_pm_ops tilcdc_pm_ops = {
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
@@ -547,9 +550,13 @@ static void tilcdc_unbind(struct device *dev)
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
@@ -566,12 +573,9 @@ static int tilcdc_pdev_probe(struct platform_device *pdev)
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
@@ -581,10 +585,10 @@ static int tilcdc_pdev_remove(struct platform_device *pdev)
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

