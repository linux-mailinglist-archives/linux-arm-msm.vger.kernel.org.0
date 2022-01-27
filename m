Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0E849EC06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jan 2022 21:03:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240324AbiA0UDi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 15:03:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343847AbiA0UCe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 15:02:34 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83364C061771
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:26 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id s2-20020a17090ad48200b001b501977b23so8676591pju.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 12:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w0WjtZCiA2Izv5LYYNS4nUlyXyc0y53v4Rvk7s0pbe0=;
        b=N1+WfbFdWfFWm8JZDkISDKtq8PppgDmD79xW8tNVglUX7OWvRmJS2Wh8sMT5FI3vAy
         tsKqmQ0M8qIAp054xQUwpCGIaNg9cIbGxzzwfhBal7cAk2vj8DKOZGPx05QoCOH+i7Eq
         moKrr1lTYTcMvhTnoQwPjc8fbcGK4uzBIFz24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w0WjtZCiA2Izv5LYYNS4nUlyXyc0y53v4Rvk7s0pbe0=;
        b=tDGnwP7CT3BAGoAlOTEYJf27lnl/3ftZoqvZ9vOZKUCaxj+jYTKstOD05g03PeMSzI
         IHqLfmEtPNB8YMI0r7paBOh2oV782bxC5OEXQEm1eZ+bdmK2n4GhzKMIEEdIr3xRPks7
         NisnYEHnJlHA9XqoGdhc00ZpyZCxanfpnfPogzeZamuzNf3F/y9G/nPobWO/EavgPeGs
         6mUBukBqafVQac1jiSKyysiIEW3Z4hAGznApCHDwrS7dZCp8/euUFsVH8M8nlbCurDmr
         cSMqBALFRg+4rXIQns2LLa85rrQd1XUk8oTtgezn/IfoDTU5X+hblAzSSaTSSs0rntZ8
         2R4A==
X-Gm-Message-State: AOAM533aQybtfmXAgDqX/+AuHF9Ns+zBA3hUnv2oXg7NHh3S5ArAslUr
        HAW4FT2qH7jomvSzmvJMogCBXw==
X-Google-Smtp-Source: ABdhPJzgzcKDYSY6QDkCMyGRcUuonDiSsTyh/el8NoU7HL3yzfQZ3ufK+XGi3zh1Oa5ipMLqxteAAw==
X-Received: by 2002:a17:90b:4d0e:: with SMTP id mw14mr3383117pjb.133.1643313746070;
        Thu, 27 Jan 2022 12:02:26 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:9246:1838:3243:3071])
        by smtp.gmail.com with ESMTPSA id k21sm6561190pff.33.2022.01.27.12.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 12:02:25 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Emma Anholt <emma@anholt.net>,
        Maxime Ripard <mripard@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v6 24/35] drm/vc4: Migrate to aggregate driver
Date:   Thu, 27 Jan 2022 12:01:30 -0800
Message-Id: <20220127200141.1295328-25-swboyd@chromium.org>
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

Cc: Emma Anholt <emma@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/vc4/vc4_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 16abc3a3d601..297ecddea5fb 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -212,8 +212,9 @@ static void vc4_match_add_drivers(struct device *dev,
 	}
 }
 
-static int vc4_drm_bind(struct device *dev)
+static int vc4_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct platform_device *pdev = to_platform_device(dev);
 	struct drm_device *drm;
 	struct vc4_dev *vc4;
@@ -284,8 +285,9 @@ static int vc4_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void vc4_drm_unbind(struct device *dev)
+static void vc4_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = aggregate_device_parent(adev);
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -293,9 +295,13 @@ static void vc4_drm_unbind(struct device *dev)
 	drm_atomic_helper_shutdown(drm);
 }
 
-static const struct component_master_ops vc4_drm_ops = {
-	.bind = vc4_drm_bind,
-	.unbind = vc4_drm_unbind,
+static struct aggregate_driver vc4_aggregate_driver = {
+	.probe = vc4_drm_bind,
+	.remove = vc4_drm_unbind,
+	.driver = {
+		.name = "vc4_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 /*
@@ -326,12 +332,12 @@ static int vc4_platform_drm_probe(struct platform_device *pdev)
 	vc4_match_add_drivers(dev, &match,
 			      component_drivers, ARRAY_SIZE(component_drivers));
 
-	return component_master_add_with_match(dev, &vc4_drm_ops, match);
+	return component_aggregate_register(dev, &vc4_aggregate_driver, match);
 }
 
 static int vc4_platform_drm_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &vc4_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &vc4_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

