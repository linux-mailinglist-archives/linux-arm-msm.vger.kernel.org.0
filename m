Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28FBA486C4C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 22:46:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244585AbiAFVq1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 16:46:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244502AbiAFVqP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 16:46:15 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76AFFC061201
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 13:46:15 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id lr15-20020a17090b4b8f00b001b19671cbebso4562426pjb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 13:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9+fM2dIjOxE0hdJ7o5inMEoSl4k+Dtn8hCQbdOli+o8=;
        b=WMHlwmVoo1ow1wofjzv++KabJgE5A6EpO98LpbSnWXIy+DtxgACpsY6fIhJHEKp4Bd
         W+/v2FNvE3U3LbDMGYS3WkdtPvljEpVfgIA6g7AmLK3pZtGtdL0WDNRxlHud8Ao9Elb2
         aXXS4XgNXK4ewetP2amhDNnmvvcOWnwPPzCEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9+fM2dIjOxE0hdJ7o5inMEoSl4k+Dtn8hCQbdOli+o8=;
        b=XY/3lsP/ASWuaXG8FJjCd9+Qsjev7TRer3CtH58vQOSkCk/bns+bDKpWY0I81SaexW
         1Aehow0FdBXOulA9yE87FYdseP0j/5ZDxGUBNfxr0UEDwO7aG/M2XdBPMd73VA/BG22z
         04aWfRYjk7JwcI+5wymBIV4P39fV5DLsvQSsoGI+KwXkaGZKoGolyD6W1cjuzmBOT9ST
         k4PfelkrcbsQaLqW0DpgcJJ+VoV+Bms7WxulzMuBAw9U7CXHuEUaNWJRl+srka7gvdMg
         IXuRS0aW7VxmgJTwNDAQo535kYtkiKu5ir8qXrJ4MSSc+9ogX4C9nF4ASmF4qESh8sZr
         lWFw==
X-Gm-Message-State: AOAM5302DUTvhyVivsQ/T6Hm90mk2oQZl5ouAFGSg7mPP/4UtBeH0ukw
        +JR7XUODDhMTcobDcdaEr2M4RA==
X-Google-Smtp-Source: ABdhPJwpQFHrvpwt076C/B60hfpgIoYWieUUFNJrKvBbE5BuNSwKXiWe++ylmqtUWZXuGmGRj9RTqg==
X-Received: by 2002:a17:90b:3808:: with SMTP id mq8mr12220192pjb.85.1641505574987;
        Thu, 06 Jan 2022 13:46:14 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
        by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 13:46:14 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
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
Subject: [PATCH v5 12/32] drm/kirin: Migrate to aggregate driver
Date:   Thu,  6 Jan 2022 13:45:35 -0800
Message-Id: <20220106214556.2461363-13-swboyd@chromium.org>
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

