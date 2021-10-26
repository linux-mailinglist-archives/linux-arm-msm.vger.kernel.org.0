Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E76943A8B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 02:01:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235871AbhJZADo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 20:03:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235647AbhJZADV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 20:03:21 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64F76C061225
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:00:58 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id r28so7951433pga.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9+fM2dIjOxE0hdJ7o5inMEoSl4k+Dtn8hCQbdOli+o8=;
        b=WK1ox2oRHtuob3v/ROgeEhC1PVQBBzfwdp0Vcx+Dzp3pUstlggErRUG3DVNU3uE2n/
         vRNQwS26UtVE2R4pJjjbJxrVBD1WGWrU9P20RfSOtE5t14iUTUOVyJjOi4BSBgmP69U+
         Wx41UMi8X3CGf7P7D+FfisrIp491w2OHpPdzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9+fM2dIjOxE0hdJ7o5inMEoSl4k+Dtn8hCQbdOli+o8=;
        b=l2Ay0043/VRjs++z2/ff2Ob9k4Sk4LuGDtL7uvS9ljMUEekVdwQVJrpZxvzuZ7r9bM
         Tr0C57KPVB8RAzdprGWtwfL+gtOzfT7fFdBs/p3zUMaYCaU7T+9y2TDCx5vmpDqa0WkZ
         9NIbdBrDnYwkGamkdyq2AYErkhdnj7EhdfXv6QYQwRpunvWZz3QHGMgdv4TZ5q0bn9DF
         rlyWWHpELCWgCzO+I17hzZZbmhLoTJMO4B7RAUrlmXM1jZVPoY4imN5VjEMR1ecZXJ4h
         /D4LZUM5a6Y+5M5Adf4bPlxuCHvubXc64XZPFdrriEDZQuhEKaH69/jJ0uWNSjaHjOQw
         0LGQ==
X-Gm-Message-State: AOAM530stT7Cv/VZSfaaDqI7oTNYfHkKyqOhboqTegiWm9NHu6iq2/le
        hoNSYcOPYFNNcClD7qG5lPw6Pw==
X-Google-Smtp-Source: ABdhPJyAH+KqK4V7Wo1bh2UQ9/xYGJyYJ5MoNL/eKeZvWyDr56giKqwSJvUB9ld4uN59VRUEoCXXxw==
X-Received: by 2002:a62:2944:0:b0:44d:b731:4228 with SMTP id p65-20020a622944000000b0044db7314228mr21635086pfp.9.1635206457831;
        Mon, 25 Oct 2021 17:00:57 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
        by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 17:00:57 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Tian Tao <tiantao6@hisilicon.com>,
        John Stultz <john.stultz@linaro.org>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 13/34] drm/kirin: Migrate to aggregate driver
Date:   Mon, 25 Oct 2021 17:00:23 -0700
Message-Id: <20211026000044.885195-14-swboyd@chromium.org>
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

Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 98ae9a48f3fe..00d47c784cbb 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -217,8 +217,9 @@ static int kirin_drm_kms_cleanup(struct drm_device *dev)
 	return 0;
 }
 
-static int kirin_drm_bind(struct device *dev)
+static int kirin_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct kirin_drm_data *driver_data;
 	struct drm_device *drm_dev;
 	int ret;
@@ -253,8 +254,9 @@ static int kirin_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void kirin_drm_unbind(struct device *dev)
+static void kirin_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm_dev = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm_dev);
@@ -262,9 +264,13 @@ static void kirin_drm_unbind(struct device *dev)
 	drm_dev_put(drm_dev);
 }
 
-static const struct component_master_ops kirin_drm_ops = {
-	.bind = kirin_drm_bind,
-	.unbind = kirin_drm_unbind,
+static struct aggregate_driver kirin_drm_aggregate_driver = {
+	.probe = kirin_drm_bind,
+	.remove = kirin_drm_unbind,
+	.driver = {
+		.name = "kirin_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int kirin_drm_platform_probe(struct platform_device *pdev)
@@ -281,12 +287,12 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
 	drm_of_component_match_add(dev, &match, compare_of, remote);
 	of_node_put(remote);
 
-	return component_master_add_with_match(dev, &kirin_drm_ops, match);
+	return component_aggregate_register(dev, &kirin_drm_aggregate_driver, match);
 }
 
 static int kirin_drm_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &kirin_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &kirin_drm_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

