Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB43D42472D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 21:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239793AbhJFTlk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 15:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239678AbhJFTlH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 15:41:07 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09BA9C06177B
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 12:38:54 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 66so3382677pgc.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 12:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HoQjuHREWvjsK8rKG+0w83Xi8iEfhBhp3a3+GSxKR9Y=;
        b=WVsXT9YPaOq6lbwor7C76akvY+2k/VH9yJnA2hvETtzvwXFjJa3PrLl0B5Ce5dPfXC
         je7l6/8GgIsVihohh2eSAciaEEEpOrrNQUbmt/RkQLQLT/i1+WOw7BoAAVAqo0kTTExd
         t6hnsTdsmOSgmHtdWXFcrJS/dfE2+Mb3FIkbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HoQjuHREWvjsK8rKG+0w83Xi8iEfhBhp3a3+GSxKR9Y=;
        b=a8LVBHjppz+NGqoUNZcyJretTrvq6QUC+jkx+1GzXtQy4pkgX68RcTPwqDUlRxBP85
         ea+ihR+AkQ/NUZH3S79C6XD9UUTVfY1dizK4igDziyYHGw5cCKJnQmHt5UcbYdYYuyHO
         N+6GYe9F3XlkBUv8UoF1+44UTBHJXe7iBJqPm7y5jhIai1eNlAknjhfSMa64dIQQrT/l
         654jYiNH2/znUi95DhFGEH5uUwXFnPBruQvNyUbfwDsDZugfZLx/XmjB7CfcQ+ckGgbO
         WIoeEfBN6haJmWa3gb2O8XyctnxbJ9DQUvK3CHnKzpTlC1kKdlf41FNeH9z1IIM1gX5C
         u5RA==
X-Gm-Message-State: AOAM530tdx4ha7cXoMEWe6uH2/HsUbz8PrcUGnO9C/QR+h2bfddeMkdQ
        QNSYhKGPjr0kxu6MG9YbIR9D1A==
X-Google-Smtp-Source: ABdhPJycvCyAm7YdfmtOg2mjiTXHN2Zij2prLgvspms7d33gQ9VOWrXUCMxUvC21GUMCDyr+OsPRpw==
X-Received: by 2002:aa7:9250:0:b0:44c:27d1:7f0f with SMTP id 16-20020aa79250000000b0044c27d17f0fmr166036pfp.41.1633549133593;
        Wed, 06 Oct 2021 12:38:53 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
        by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:38:53 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 26/34] iommu/mtk: Migrate to aggregate driver
Date:   Wed,  6 Oct 2021 12:38:11 -0700
Message-Id: <20211006193819.2654854-27-swboyd@chromium.org>
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

Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Will Deacon <will@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/iommu/mtk_iommu.c    | 14 +++++++++-----
 drivers/iommu/mtk_iommu.h    |  6 ++++--
 drivers/iommu/mtk_iommu_v1.c | 14 +++++++++-----
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index d837adfd1da5..8b303c388a9b 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -750,9 +750,13 @@ static int mtk_iommu_hw_init(const struct mtk_iommu_data *data)
 	return 0;
 }
 
-static const struct component_master_ops mtk_iommu_com_ops = {
-	.bind		= mtk_iommu_bind,
-	.unbind		= mtk_iommu_unbind,
+static struct aggregate_driver mtk_iommu_aggregate_driver = {
+	.probe		= mtk_iommu_bind,
+	.remove		= mtk_iommu_unbind,
+	.driver		= {
+		.name	= "mtk_iommu_agg",
+		.owner	= THIS_MODULE,
+	},
 };
 
 static int mtk_iommu_probe(struct platform_device *pdev)
@@ -893,7 +897,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			goto out_list_del;
 	}
 
-	ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
+	ret = component_aggregate_register(dev, &mtk_iommu_aggregate_driver, match);
 	if (ret)
 		goto out_bus_set_null;
 	return ret;
@@ -926,7 +930,7 @@ static int mtk_iommu_remove(struct platform_device *pdev)
 	device_link_remove(data->smicomm_dev, &pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	devm_free_irq(&pdev->dev, data->irq, data);
-	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
+	component_aggregate_unregister(&pdev->dev, &mtk_iommu_aggregate_driver);
 	return 0;
 }
 
diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
index f81fa8862ed0..064fd4f4eade 100644
--- a/drivers/iommu/mtk_iommu.h
+++ b/drivers/iommu/mtk_iommu.h
@@ -94,15 +94,17 @@ static inline void release_of(struct device *dev, void *data)
 	of_node_put(data);
 }
 
-static inline int mtk_iommu_bind(struct device *dev)
+static inline int mtk_iommu_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct mtk_iommu_data *data = dev_get_drvdata(dev);
 
 	return component_bind_all(dev, &data->larb_imu);
 }
 
-static inline void mtk_iommu_unbind(struct device *dev)
+static inline void mtk_iommu_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct mtk_iommu_data *data = dev_get_drvdata(dev);
 
 	component_unbind_all(dev, &data->larb_imu);
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index be22fcf988ce..5fb29058a165 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -534,9 +534,13 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{}
 };
 
-static const struct component_master_ops mtk_iommu_com_ops = {
-	.bind		= mtk_iommu_bind,
-	.unbind		= mtk_iommu_unbind,
+static struct aggregate_driver mtk_iommu_aggregate_driver = {
+	.probe		= mtk_iommu_bind,
+	.remove		= mtk_iommu_unbind,
+	.driver		= {
+		.name	= "mtk_iommu_agg",
+		.owner	= THIS_MODULE,
+	},
 };
 
 static int mtk_iommu_probe(struct platform_device *pdev)
@@ -624,7 +628,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 			goto out_dev_unreg;
 	}
 
-	ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
+	ret = component_aggregate_register(dev, &mtk_iommu_aggregate_driver, match);
 	if (ret)
 		goto out_bus_set_null;
 	return ret;
@@ -650,7 +654,7 @@ static int mtk_iommu_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(data->bclk);
 	devm_free_irq(&pdev->dev, data->irq, data);
-	component_master_del(&pdev->dev, &mtk_iommu_com_ops);
+	component_aggregate_unregister(&pdev->dev, &mtk_iommu_aggregate_driver);
 	return 0;
 }
 
-- 
https://chromeos.dev

