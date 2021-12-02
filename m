Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1023466C4C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 23:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377383AbhLBWbd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 17:31:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377258AbhLBWbO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 17:31:14 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4D4C0613DD
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 14:27:48 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id v19so739056plo.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 14:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FPtGNMfzlxXubKgayi75A1lRD5p2YHP9GYCHjNIhA04=;
        b=h6Zc00mbdNK4C5OKSsLKR+Q5xo/hWZf9dntwCh9eLhyHChFuCiFp48PqdvBc9zQLvX
         5cW4RQoyc4XWAoC+w+gkdIICQjYWXHg7WFYJpFRNdf8T3MsRBN7Pg2Q2s7mplQYCk8Pw
         Q2GJuIDu/DUPETO/rxcEyAkD7AYJ9yjkSz22o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FPtGNMfzlxXubKgayi75A1lRD5p2YHP9GYCHjNIhA04=;
        b=lqZ8Gxnx35yTUawvEfG1ZAdGel77f4/RSIEdx14OoOezEEiT5X30taGCk6rIMEBlq9
         B8ph7AN3k9SOftDm6oP3kQXvVNREGmr/lwxik5sExnsSvpxLT734zeirQKsCih5zFRkk
         D4jLlLaVpm24ZlytRR59/AlqUC4T5M4VOMO/lgVuG3193cFABQhqOufDpE4yIXJB1Qpr
         lyh2TJhVVNa5WU+djy/f1vy32u8RAL8pOCW8Ze1I2JD+/Ge6otWSyJPbI00poAR9l9n8
         S1wktBzggvrA09gC5Smmu4HbPEwfbPdjAq1rQpCbpcerdSQOw/9f0NLd2nC3ye4F+7xX
         pLJw==
X-Gm-Message-State: AOAM530crmDIocnVbN6hsIuJcO6FI9090FYnu5W2D2tIowbR0eADtEgj
        GLRREgefbFncXozMp7F2yNbtfQ==
X-Google-Smtp-Source: ABdhPJyI/H2UZa/knKpc1NxwfqxSD+BRLUNEpghQZhKIwSpmILkwL5jjn7t7Z3Gmqe7p/Wydt3JXFw==
X-Received: by 2002:a17:90a:f00e:: with SMTP id bt14mr9162131pjb.219.1638484067838;
        Thu, 02 Dec 2021 14:27:47 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
        by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:27:47 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v4 14/34] drm/exynos: Migrate to aggregate driver
Date:   Thu,  2 Dec 2021 14:27:12 -0800
Message-Id: <20211202222732.2453851-15-swboyd@chromium.org>
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

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index d8f1cf4d6b69..dcb52ec2bd35 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -253,8 +253,9 @@ static struct component_match *exynos_drm_match_add(struct device *dev)
 	return match ?: ERR_PTR(-ENODEV);
 }
 
-static int exynos_drm_bind(struct device *dev)
+static int exynos_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct exynos_drm_private *private;
 	struct drm_encoder *encoder;
 	struct drm_device *drm;
@@ -330,8 +331,9 @@ static int exynos_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void exynos_drm_unbind(struct device *dev)
+static void exynos_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct drm_device *drm = dev_get_drvdata(dev);
 
 	drm_dev_unregister(drm);
@@ -350,9 +352,13 @@ static void exynos_drm_unbind(struct device *dev)
 	drm_dev_put(drm);
 }
 
-static const struct component_master_ops exynos_drm_ops = {
-	.bind		= exynos_drm_bind,
-	.unbind		= exynos_drm_unbind,
+static struct aggregate_driver exynos_drm_aggregate_driver = {
+	.probe		= exynos_drm_bind,
+	.remove		= exynos_drm_unbind,
+	.driver		= {
+		.name	= "exynos_drm",
+		.owner	= THIS_MODULE,
+	},
 };
 
 static int exynos_drm_platform_probe(struct platform_device *pdev)
@@ -365,13 +371,12 @@ static int exynos_drm_platform_probe(struct platform_device *pdev)
 	if (IS_ERR(match))
 		return PTR_ERR(match);
 
-	return component_master_add_with_match(&pdev->dev, &exynos_drm_ops,
-					       match);
+	return component_aggregate_register(&pdev->dev, &exynos_drm_aggregate_driver, match);
 }
 
 static int exynos_drm_platform_remove(struct platform_device *pdev)
 {
-	component_master_del(&pdev->dev, &exynos_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &exynos_drm_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

