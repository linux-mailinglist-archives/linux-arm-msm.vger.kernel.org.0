Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0045A49EBA5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jan 2022 21:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343674AbiA0UCL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 15:02:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343668AbiA0UCK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 15:02:10 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B442CC061747
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:10 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id a8so3788709pfa.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V5D9W8mLQzBapDg8PfAl6xWrk61L3pMoLZNoKlrReQc=;
        b=Us8nN6E0hRmknbgfLO6sMIk5lgb5byWV5VYlILdj0cELP44JPjS1NfL65N4JRWx0QC
         K6x4pocN37foE0fWEh2I1lYGaMQGu/zv05JQ3yV/nV2eiCpDakPJ9HIV/R/pnz1ushah
         JXw1+0lpLlh7MSHzawG+YdhOzUbpm/ktDsNnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V5D9W8mLQzBapDg8PfAl6xWrk61L3pMoLZNoKlrReQc=;
        b=D/F4uypqdEvekh7yFckXB1ERbYzREhGd29T1j3ICfPC+pwqc/elSjY/TQ/uDWHnG4e
         YNh8a1SPvtSrYJcGGOYR6rKk0V96sFP08sdvMoY64dE9dbYWWNWAn4BlcWLKcihfcRYo
         xwjdypNCL/SugL/3F2i6J5xg8kVinAiGMSVZ1sKkTWxvl+sW0iwDOAG8ri5xsjNZ8r1X
         HcTQ5O0D31qqAgOrBQ1ofGu8MYmjOfLoNBClO81SJm9NG2QO6l0K+X59bA85SY9ChdQN
         lGNtRvShJC+QrtKzT+f21X3C5qpLylTkOBU0qsmLeliRvjplBx6L/kK2lvjA+xVGoqiG
         8/Gg==
X-Gm-Message-State: AOAM531VO8Luifx6NBOpTNjt/PdLvSjusbDnBFaNkY+suPL1Y9l1UR9u
        Cfec7EbUjfW38GR18IlhmUKEeg==
X-Google-Smtp-Source: ABdhPJxXtbjlaVenB3yzOYY0uagjNycGvBicVRVVV0S8pQIqcpwlB0Y7yF6gDT8i/RK6UDO8P4+ylw==
X-Received: by 2002:aa7:8484:: with SMTP id u4mr4344004pfn.70.1643313730286;
        Thu, 27 Jan 2022 12:02:10 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
        by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 12:02:09 -0800 (PST)
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
Subject: [PATCH v6 12/35] drm/kirin: Migrate to aggregate driver
Date:   Thu, 27 Jan 2022 12:01:18 -0800
Message-Id: <20220127200141.1295328-13-swboyd@chromium.org>
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
index 98ae9a48f3fe..338077908177 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -217,8 +217,9 @@ static int kirin_drm_kms_cleanup(struct drm_device *dev)
 	return 0;
 }
 
-static int kirin_drm_bind(struct device *dev)
+static int kirin_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct kirin_drm_data *driver_data;
 	struct drm_device *drm_dev;
 	int ret;
@@ -253,8 +254,9 @@ static int kirin_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void kirin_drm_unbind(struct device *dev)
+static void kirin_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
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

