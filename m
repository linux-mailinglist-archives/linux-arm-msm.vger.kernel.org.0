Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71E9A466C40
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 23:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377319AbhLBWb0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 17:31:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377252AbhLBWbO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 17:31:14 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4109C06175D
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 14:27:46 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id b11so716137pld.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 14:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NsjwfsQuiDMEQ+TXne3j17pwDv7xto97Rnhld6OcLgM=;
        b=edVjBt2zUt8d3ir9bHAny/D3iecuGEgCqLqHfB5LmxlqM/yeay/mFqvVssTz8pJmS1
         jIweoBkWZO8bpd1W6q5ofzuSBydx3x8o279iLi58XYs+aUU3Ru8bhRqzS309BXG95AOM
         pii45rKsVjczgp4/CPME0N90C+u8Xq5jwOJ0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NsjwfsQuiDMEQ+TXne3j17pwDv7xto97Rnhld6OcLgM=;
        b=DahajofM9Sm/rDfaHlUgFJSsqxh2AB009UZWweLB+IiBFqVNLop3VfBPvN1InNbqIU
         vEi4fiSdy3PjqvsNoyFsDR5C0204vW8JsgGb9UgGEGbCWms+1vXr0mzy7DhkPNdMWJWL
         uXNsnKDe5hvAESVE2MMkexai9OLkMZo0VJtNebyfm1khqeAfXOh/V5jsxhDDLck8SseJ
         WtJNClJXWuIveCfYTAE9mDph/5iBllIuxqPRGFLX54wiYp+2300kyTOMTO9rJu+ySFZu
         TxjsjrwZbRErCLylpQW0+Wg/xlGs1axS4nLQA859xewvYapag0q1f1NUUftlIx9fg1sC
         fIzg==
X-Gm-Message-State: AOAM533sUnLkxCfxBrCofTMumFC4rIB9YlP0Ogjmq8TkFCrDU0puHFJT
        NmAPgLKzXeht5B9e+Of2y/FR/Q==
X-Google-Smtp-Source: ABdhPJwr+y/130Jtap14aGacCeh6jp3d9XXNKHQZYwirxPlGzgQbGLR2z4IOOYuR0xMawVt16u+bLg==
X-Received: by 2002:a17:902:7890:b0:143:c4f7:59e6 with SMTP id q16-20020a170902789000b00143c4f759e6mr18430277pll.87.1638484066222;
        Thu, 02 Dec 2021 14:27:46 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
        by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:27:45 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v4 12/34] drm/etnaviv: Migrate to aggregate driver
Date:   Thu,  2 Dec 2021 14:27:10 -0800
Message-Id: <20211202222732.2453851-13-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use an aggregate driver instead of component ops so that we can get
proper driver probe ordering of the aggregate device with respect to all
the component devices that make up the aggregate device.

Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/etnaviv/etnaviv_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 7dcc6392792d..95d1e518ff13 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -494,8 +494,9 @@ static const struct drm_driver etnaviv_drm_driver = {
 /*
  * Platform driver:
  */
-static int etnaviv_bind(struct device *dev)
+static int etnaviv_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct etnaviv_drm_private *priv;
 	struct drm_device *drm;
 	int ret;
@@ -552,8 +553,9 @@ static int etnaviv_bind(struct device *dev)
 	return ret;
 }
 
-static void etnaviv_unbind(struct device *dev)
+static void etnaviv_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct etnaviv_drm_private *priv = drm->dev_private;
 
@@ -569,9 +571,13 @@ static void etnaviv_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops etnaviv_master_ops = {
-	.bind = etnaviv_bind,
-	.unbind = etnaviv_unbind,
+static struct aggregate_driver etnaviv_aggregate_driver = {
+	.probe = etnaviv_bind,
+	.remove = etnaviv_unbind,
+	.driver = {
+		.name = "etnaviv_drm",
+		.owner = THIS_MODULE,
+	},
 };
 
 static int compare_of(struct device *dev, void *data)
@@ -609,12 +615,12 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 			component_match_add(dev, &match, compare_str, names[i]);
 	}
 
-	return component_master_add_with_match(dev, &etnaviv_master_ops, match);
+	return component_aggregate_register(dev, &etnaviv_aggregate_driver, match);
 }
 
 static int etnaviv_pdev_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &etnaviv_master_ops);
+	component_aggregate_unregister(&pdev->dev, &etnaviv_aggregate_driver);
 
 	return 0;
 }
-- 
https://chromeos.dev

