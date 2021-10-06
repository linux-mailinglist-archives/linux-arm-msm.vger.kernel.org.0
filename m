Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 183224246EF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 21:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239505AbhJFTk6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 15:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239557AbhJFTkl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 15:40:41 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 696FDC061770
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 12:38:45 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id s16so3335239pfk.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 12:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+z8spq4cdcPKhNDSMMsr6lVILQ9GCMpzmsR3lgzTaCA=;
        b=iGHSnRwwchpi5Tkq7doMTNvFa9r3VADcN321p5gth6rsSAkCxChv1/TpcoexdUqwTf
         bjTWhC9Go7emQT2Jp1DsbdOh4ilw3joEHD55nLlHU0YDLAtXqWTaVbyk8yGr1ilxMqKg
         f+EqQleH2dzNCB2xM7okVOrBTmrtYa8J1rIyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+z8spq4cdcPKhNDSMMsr6lVILQ9GCMpzmsR3lgzTaCA=;
        b=zGsH5wW/6yspAyq3TuR/ryL8GeTqncVIilHWSJEms999iQlOGX7UN4KBihqMntyfsr
         H9Ez4LJ7GaUOVSPFJGu60Ydbn5c52dWGL8OvmnDnz0FCYskEVSfKYRFF7qvV4BSQ6mZG
         5Q3Nx/gaVAVwJkDEKcqqH92VKHmMP8l4URnW62wFu0SOas8yBbYxUOMD8w2x4lfCo3sf
         05fevzQFnfSDUTvbKY7QY/rIEFDXTYxQ8hh0uZsBBNjm6hEVtYNNdbv9K/ZnC5oRIKF2
         C5iC0czf097H43850qKaDpJEZNbcrNDBARQKPqxZw78adoiIKuxY+b9WC1Qb/3+kLLQf
         7wRw==
X-Gm-Message-State: AOAM532gXypG3HrH0d8fxQrC9m5JWMMFgkHSzNuq2TIHBYDQb885saRD
        /61PngUK4r0bWsP8ePTdYgVLjg==
X-Google-Smtp-Source: ABdhPJwH4Ga5pH+EsfLgxRiyAhkWjDCH0zIE3TZRHi6CR2+XxdoanVbnAks241ztngYgIj/notfKcQ==
X-Received: by 2002:aa7:8c12:0:b0:44c:5e3e:3733 with SMTP id c18-20020aa78c12000000b0044c5e3e3733mr19528656pfd.55.1633549124937;
        Wed, 06 Oct 2021 12:38:44 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
        by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:38:44 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Tomi Valkeinen <tomba@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 19/34] drm/omap: Migrate to aggregate driver
Date:   Wed,  6 Oct 2021 12:38:04 -0700
Message-Id: <20211006193819.2654854-20-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
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
 drivers/gpu/drm/omapdrm/dss/dss.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
index d6a5862b4dbf..6a6ae2786d7a 100644
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
@@ -1339,9 +1340,13 @@ static void dss_unbind(struct device *dev)
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
@@ -1504,7 +1509,7 @@ static int dss_probe(struct platform_device *pdev)
 	cmatch.match = &match;
 	device_for_each_child(&pdev->dev, &cmatch, dss_add_child_component);
 
-	r = component_master_add_with_match(&pdev->dev, &dss_component_ops, match);
+	r = component_aggregate_register(&pdev->dev, &dss_aggregate_driver, match);
 	if (r)
 		goto err_of_depopulate;
 
@@ -1543,7 +1548,7 @@ static int dss_remove(struct platform_device *pdev)
 
 	of_platform_depopulate(&pdev->dev);
 
-	component_master_del(&pdev->dev, &dss_component_ops);
+	component_aggregate_unregister(&pdev->dev, &dss_aggregate_driver);
 
 	dss_debugfs_remove_file(dss->debugfs.clk);
 	dss_debugfs_remove_file(dss->debugfs.dss);
-- 
https://chromeos.dev

