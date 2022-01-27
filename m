Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4651649EBE1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jan 2022 21:03:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343855AbiA0UCe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 15:02:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343749AbiA0UCW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 15:02:22 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F5D5C061758
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:18 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id my12-20020a17090b4c8c00b001b528ba1cd7so4148023pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tKM5wKimMvZrAKvGy1t7H+N3RMdb/rkm3Tm4lDXJEMA=;
        b=XUA+m1YsSZShroTZxfw39Qf7S7B1mW7M+xw0s6IqXclDbYYmVnWy+Ltexawu32I40i
         SZdmr0pz3HmsdbVQcfZ/V4B7woFqglI8B4G8TpywXFwHGjG3A3tCniZTF+Fg5dgU0QFM
         SRmxEWIy2hA9dTzCtAUaHb/6famrkeiHYK5WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tKM5wKimMvZrAKvGy1t7H+N3RMdb/rkm3Tm4lDXJEMA=;
        b=AdXONSh1+r2slYU08hOk0zNvXU505OXVrSjb1mUOBv+8J5Ohio3bAvfFpfuuDOiHFN
         SBP9EiBWSNdR5hvTAUFYDAo7JQ9taooYb3o7RMFmAEoCC9gwSgf7trE1QGzLxKJsLndv
         58lJl6UJFhB2Z3iKWQ/ef7k22oPDYzAmhpeg3HieAMLfO7wzHAAry/knN1lUVw4aE18b
         LarfBRxcQrTFSpvWDK4kAmIOrIS0215gRvwHvwLM8h/tCMpyP+RXutSRf6y/UJVPoOIU
         CNobISiuuDDrqB3LVMjipDtpewcbuqXdNAlYRNycNwu/IXdIpXexjDZwzixTGZcSgvXc
         FIKA==
X-Gm-Message-State: AOAM533B4wIWJOlXFcA4eBWsZj8+HykTjB43glfxrrU35LpHUjtMk0ZO
        gTX3ssDTjLsM2qHsDH25XTNt/Q==
X-Google-Smtp-Source: ABdhPJzt+Sz+dY3sN15K0S3lh3rhsQZdiGkdCkL9I2zth8eNN++n1IHK4TSncBJrfWf1JT2jGXzfuA==
X-Received: by 2002:a17:902:ed82:: with SMTP id e2mr5198385plj.55.1643313738116;
        Thu, 27 Jan 2022 12:02:18 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
        by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 12:02:17 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v6 18/35] drm/meson: Migrate to aggregate driver
Date:   Thu, 27 Jan 2022 12:01:24 -0800
Message-Id: <20220127200141.1295328-19-swboyd@chromium.org>
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

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/meson/meson_drv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 80f1d439841a..2add29b347a8 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -361,13 +361,16 @@ static int meson_drv_bind_master(struct device *dev, bool has_components)
 	return ret;
 }
 
-static int meson_drv_bind(struct device *dev)
+static int meson_drv_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
+
 	return meson_drv_bind_master(dev, true);
 }
 
-static void meson_drv_unbind(struct device *dev)
+static void meson_drv_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct meson_drm *priv = dev_get_drvdata(dev);
 	struct drm_device *drm = priv->drm;
 
@@ -391,9 +394,13 @@ static void meson_drv_unbind(struct device *dev)
 	}
 }
 
-static const struct component_master_ops meson_drv_master_ops = {
-	.bind	= meson_drv_bind,
-	.unbind	= meson_drv_unbind,
+static struct aggregate_driver meson_aggregate_drv = {
+	.probe	= meson_drv_bind,
+	.remove	= meson_drv_unbind,
+	.driver = {
+		.name = "meson_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int __maybe_unused meson_drv_pm_suspend(struct device *dev)
@@ -487,9 +494,7 @@ static int meson_drv_probe(struct platform_device *pdev)
 	if (count) {
 		dev_info(&pdev->dev, "Queued %d outputs on vpu\n", count);
 
-		return component_master_add_with_match(&pdev->dev,
-						       &meson_drv_master_ops,
-						       match);
+		return component_aggregate_register(&pdev->dev, &meson_aggregate_drv, match);
 	}
 
 	/* If no output endpoints were available, simply bail out */
-- 
https://chromeos.dev

