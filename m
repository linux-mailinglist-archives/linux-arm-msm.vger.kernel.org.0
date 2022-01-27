Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3065549EC0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jan 2022 21:03:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343772AbiA0UDk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 15:03:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343829AbiA0UCd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 15:02:33 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E937C06173B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:22 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id h20-20020a17090adb9400b001b518bf99ffso8674520pjv.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=km10INCJaOtDHcOHVEwChqxOVacq/jIckMelDPfId8g=;
        b=J8JG6dKaTSgfj58AmDZpi6NnG+1JvETfnLcowzBO0x3Qy6rq53OG3iQ8SC2QccH5or
         kmgbyTIrVRw0FWOwvHltipYgDOSZF7UsNLQJmt8RPYt7bZEC1QEFqPorauhu3o+T5eYP
         kfOEQHep0THj6hqQ1LSBWSiaqR3ifg2OFHhXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=km10INCJaOtDHcOHVEwChqxOVacq/jIckMelDPfId8g=;
        b=akcEvpBUnUjc5EeSUwnP5+T0zJrtNB5/P+WedALH9NbSnK2J/u21hsVtNFJ690fxl+
         EUCi01LxW/XqUYAV8FTEf7+2dTL2wLzhO66JZs8E+L7uPRj5mDXkUPGU5ZdfnKF78mqx
         pfDuKT2ZRQ5wCQuyLMc0Irce7sOgScx77/BAbzf6r8FOVdkDkXE/winK+lwr4wC6KI0X
         OoDAYOP0AOuigjJ93mNl9qdaF9ISQeoynOeZvAteMYW6BgUlErejcEv6T2byHgNYzTsh
         X5sfS6V0hKaOlqUlxyDoy7Fsf6YFv8zpg85NpT5kY1HMOGsemDfP7MXPQryt8eoZWTQq
         DDpA==
X-Gm-Message-State: AOAM530pZkmJIjGIe/537Xk0AXzIY1KjuwpO2KsEEOwFHzVxlIkgK1g1
        zq/xgG7HpAc9THChIbuVt1J+Aw==
X-Google-Smtp-Source: ABdhPJwyogmHpshiG/xBbuQWcVBd4OG6Znv+GNEvLhn4iDt5WgBHGlQonK0bd4e81r4GQLgrtX2nyA==
X-Received: by 2002:a17:90b:1d91:: with SMTP id pf17mr15477568pjb.160.1643313741993;
        Thu, 27 Jan 2022 12:02:21 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
        by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 12:02:21 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v6 21/35] drm/sti: Migrate to aggregate driver
Date:   Thu, 27 Jan 2022 12:01:27 -0800
Message-Id: <20220127200141.1295328-22-swboyd@chromium.org>
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

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/sti/sti_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index c7efb43b83ee..958db315d547 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -182,8 +182,9 @@ static void sti_cleanup(struct drm_device *ddev)
 	ddev->dev_private = NULL;
 }
 
-static int sti_bind(struct device *dev)
+static int sti_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct drm_device *ddev;
 	int ret;
 
@@ -216,8 +217,9 @@ static int sti_bind(struct device *dev)
 	return ret;
 }
 
-static void sti_unbind(struct device *dev)
+static void sti_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct drm_device *ddev = dev_get_drvdata(dev);
 
 	drm_dev_unregister(ddev);
@@ -225,9 +227,13 @@ static void sti_unbind(struct device *dev)
 	drm_dev_put(ddev);
 }
 
-static const struct component_master_ops sti_ops = {
-	.bind = sti_bind,
-	.unbind = sti_unbind,
+static struct aggregate_driver sti_aggregate_driver = {
+	.probe = sti_bind,
+	.remove = sti_unbind,
+	.driver = {
+		.name = "sti_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int sti_platform_probe(struct platform_device *pdev)
@@ -249,12 +255,12 @@ static int sti_platform_probe(struct platform_device *pdev)
 		child_np = of_get_next_available_child(node, child_np);
 	}
 
-	return component_master_add_with_match(dev, &sti_ops, match);
+	return component_aggregate_register(dev, &sti_aggregate_driver, match);
 }
 
 static int sti_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &sti_ops);
+	component_aggregate_unregister(&pdev->dev, &sti_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

