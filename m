Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93AAD424746
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 21:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239547AbhJFTmP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 15:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239657AbhJFTlf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 15:41:35 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786DBC0617B9
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 12:38:57 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id r2so3382783pgl.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 12:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Yh3mBEg2nfQJzEtBIxus+8u5VcBe7iEDAWACHn4tN4=;
        b=U9t/V66lvld0RzEXb++En51W/wZYZPUEPKiGpmWOjHVpfyAWf5GXzah9KRevUB6X2x
         E1Xwqfi4gZTVJQ0Kwfykyh7ztY48om+yOO9b+3F93MmzmQGgbNYyoiKOeiyGdWV3CvMQ
         P2GHLdvkmSFVCcMis+tjSKEbm30mCqQoC233g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Yh3mBEg2nfQJzEtBIxus+8u5VcBe7iEDAWACHn4tN4=;
        b=51XRag7znj5ZSk2iox1ukHzWjP1QffREBsWGXyfK0BGbgKPGu8WNUs9Dihe7ZNQaRp
         ECBxyTBWTno3F7h9UoWZn2nouaddGKdC8BC1oC+bOsRl7bEv/9Lo/1qtfV4hsRf3qybd
         Ma8yaOI6teOrKG/SzEHbnCcJ7wRjwlj5pooKxKADkyu7yUKDfOKKBZY2f2ff8jRchc2v
         dZwr2Zh3wPpEwTTmL529F4JQzt8TjOOICFfOQTtHBk+0zWGSTpr8e69JIpiz3u75YiYM
         cbxXzABYLsqfD6lyqdzWp7gF+MP2He3enSTa9Au5dELTfPpWZQDMpiMjI506nv97WhzF
         8bdA==
X-Gm-Message-State: AOAM531C8jUjvIA7YslI9niaAdem72Zg+aZa/KzxiP+Vz8dZNgFUT3n/
        EZpFhnMrLiAHBuJK3hWspVCTXw==
X-Google-Smtp-Source: ABdhPJz92vTWQMcjgF1fSdUOTLALP+adXUegWOTvRs47ng/FwRSYAB2qO/9HC5eL0SMUOg+GS75xEQ==
X-Received: by 2002:a62:15c6:0:b0:44c:74b7:14f5 with SMTP id 189-20020a6215c6000000b0044c74b714f5mr13490385pfv.80.1633549137020;
        Wed, 06 Oct 2021 12:38:57 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
        by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:38:56 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 29/34] fbdev: omap2: Migrate to aggregate driver
Date:   Wed,  6 Oct 2021 12:38:14 -0700
Message-Id: <20211006193819.2654854-30-swboyd@chromium.org>
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

Cc: <linux-omap@vger.kernel.org>
Cc: <linux-fbdev@vger.kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/video/fbdev/omap2/omapfb/dss/dss.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
index a6b1c1598040..f12663c39ceb 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
@@ -1067,8 +1067,9 @@ static int dss_video_pll_probe(struct platform_device *pdev)
 }
 
 /* DSS HW IP initialisation */
-static int dss_bind(struct device *dev)
+static int dss_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct resource *dss_mem;
 	u32 rev;
@@ -1167,8 +1168,9 @@ static int dss_bind(struct device *dev)
 	return r;
 }
 
-static void dss_unbind(struct device *dev)
+static void dss_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct platform_device *pdev = to_platform_device(dev);
 
 	dss_initialized = false;
@@ -1188,9 +1190,13 @@ static void dss_unbind(struct device *dev)
 	dss_put_clocks();
 }
 
-static const struct component_master_ops dss_component_ops = {
-	.bind = dss_bind,
-	.unbind = dss_unbind,
+static struct aggregate_driver dss_aggregate_driver = {
+	.probe = dss_bind,
+	.remove = dss_unbind,
+	.driver = {
+		.name = "dss_fbdev",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int dss_component_compare(struct device *dev, void *data)
@@ -1225,7 +1231,7 @@ static int dss_probe(struct platform_device *pdev)
 	/* add all the child devices as components */
 	device_for_each_child(&pdev->dev, &match, dss_add_child_component);
 
-	r = component_master_add_with_match(&pdev->dev, &dss_component_ops, match);
+	r = component_aggregate_register(&pdev->dev, &dss_aggregate_driver, match);
 	if (r)
 		return r;
 
@@ -1234,7 +1240,7 @@ static int dss_probe(struct platform_device *pdev)
 
 static int dss_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &dss_component_ops);
+	component_aggregate_unregister(&pdev->dev, &dss_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

