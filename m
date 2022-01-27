Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D42D149EBBA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jan 2022 21:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240093AbiA0UCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 15:02:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343712AbiA0UCO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 15:02:14 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C94E4C06173B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:14 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id k17so3764188plk.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=14tXiFXD9g15QAgF752Bjks0tTvAFdkYAmJeNpUGDFE=;
        b=UJ3pWRNzqmBr5jjMWL3C1NCDOyzHTVGRBEEV5Qjr0RTHka8AG1QzIcMnCpxlWvVMRF
         l6qJLOapBxSEL5K/iiTXohEi3SbvC6S4Yl/qitYDN8qOWC1FARr7XcHB5d6bOo4QbiDy
         CO6UTVN3O9ByQaeACCXxYwSkKyp5A5fA4DqX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=14tXiFXD9g15QAgF752Bjks0tTvAFdkYAmJeNpUGDFE=;
        b=EwbbtMQ6pOxroxfDvZTDmA3XaK3Pvr8iwE1V7sVmR6EDvFn1vBthD0P2tVDk2Xj0ty
         TXONPaY/bYTL5EaDSY04lT8+MjZrqKcHtoBlodEwBVLVDGhNY3iDY4bD69+97VN1YQPh
         F7JVRNu7V9VVs8I4ct9Y4wqVFCwD1uJnx21iR/0aMWeAk+oFtg/1Wr2U8QFioQ+Gy/2p
         5M3fAlxTycWoKFmd5pSlm0B73triweSsMYBaNpTS4ftYCDleUchQUgnCNHuvUjcpyb9R
         +LU8qVK7r9L/g04QW8XQDzZAecxQEw3vD5XRqjbL9ZMmEqyfhQtRJ52CYslRoh0fr34d
         K/Pw==
X-Gm-Message-State: AOAM532wK/EoUETYQBZD4xx4vrW3Pvn7Uhz22bJTqnS6uq8Di/FBIUiN
        xb/ntp09o+qW/OlgMyUsPHLd5g==
X-Google-Smtp-Source: ABdhPJxj4NhIFULjjnOa82Bd+Ch/aLmNdqwZmV0dOkYUhrIX9rdCJEi2YGis8heu+ZpwIFq0oEXBhw==
X-Received: by 2002:a17:90b:3a90:: with SMTP id om16mr5800717pjb.123.1643313734317;
        Thu, 27 Jan 2022 12:02:14 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
        by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 12:02:13 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Paul Cercueil <paul@crapouillou.net>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v6 15/35] drm/ingenic: Migrate to aggregate driver
Date:   Thu, 27 Jan 2022 12:01:21 -0800
Message-Id: <20220127200141.1295328-16-swboyd@chromium.org>
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

TODO: Move the helpers to PM in aggregate driver hooks.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 25 +++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index b4943a56be09..c094f9917874 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1317,8 +1317,10 @@ static int ingenic_drm_bind(struct device *dev, bool has_components)
 	return ret;
 }
 
-static int ingenic_drm_bind_with_components(struct device *dev)
+static int ingenic_drm_bind_with_components(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
+
 	return ingenic_drm_bind(dev, true);
 }
 
@@ -1341,9 +1343,20 @@ static void ingenic_drm_unbind(struct device *dev)
 	drm_atomic_helper_shutdown(&priv->drm);
 }
 
-static const struct component_master_ops ingenic_master_ops = {
-	.bind = ingenic_drm_bind_with_components,
-	.unbind = ingenic_drm_unbind,
+static void ingenic_aggregate_remove(struct aggregate_device *adev)
+{
+	struct device *dev = aggregate_device_parent(adev);
+
+	ingenic_drm_unbind(dev);
+}
+
+static struct aggregate_driver ingenic_aggregate_driver = {
+	.probe = ingenic_drm_bind_with_components,
+	.remove = ingenic_aggregate_remove,
+	.driver = {
+		.name = "ingenic_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int ingenic_drm_probe(struct platform_device *pdev)
@@ -1363,7 +1376,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	drm_of_component_match_add(dev, &match, compare_of, np);
 	of_node_put(np);
 
-	return component_master_add_with_match(dev, &ingenic_master_ops, match);
+	return component_aggregate_register(dev, &ingenic_aggregate_driver, match);
 }
 
 static int ingenic_drm_remove(struct platform_device *pdev)
@@ -1373,7 +1386,7 @@ static int ingenic_drm_remove(struct platform_device *pdev)
 	if (!IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
 		ingenic_drm_unbind(dev);
 	else
-		component_master_del(dev, &ingenic_master_ops);
+		component_aggregate_unregister(dev, &ingenic_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

