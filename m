Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74E143A8C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 02:01:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235703AbhJZADu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 20:03:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235686AbhJZAD0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 20:03:26 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC71C061767
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:01:02 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id g184so12292668pgc.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SfmZAoSN1UYJWac68o+RmufoyphUhdu5prdrSebp+yc=;
        b=Mpvt6TZqBJRjjpQueNxpmUOJ/CuHCPf3g57W5nKE4F6VDMbDyu4dhn3uzf/zJu2HoD
         HYPHTESFuoQPQ/vTZtliG3cDTOHLv5VXBkOcN/ec5j8HsNjVn8ADoZeIsVujQHf9TFT3
         VPxGTWoSrkHT8HeS1x5yN8nsoANr0l+Gcp1iQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SfmZAoSN1UYJWac68o+RmufoyphUhdu5prdrSebp+yc=;
        b=7LzwQgIMy1AwWBE0BjIJ81PVHjUKpC++hBc6PF7Hl8/BgqDpm8yCFzDtyU6OLCiUXB
         YcHdiEPid81Fpr/3xwBQakuA+2O3XlumzEsOw3+KOSuo75hT/V60gS2cJlnxDOL5JuYE
         auFbmdV+3I0xliniBc17mRr7CyLsYKCpDvsmnS5tsPkBZ3nKQG8lrTaZ5GAC2P4oYwBX
         5xOR0PYFCDdgBGPqkXLq5qps61Xi6LQP4ChOFrlpAJuSi6mlEnqadghjn4VZa0VwHdnp
         tqE5hdSZvDR+fG/kxVkg96c+uD5yziIT91fF7zi8Tr9oKv09p2W3rbZU4u1quA2uNR8E
         RPaw==
X-Gm-Message-State: AOAM533tHG67/EwYg2tAPOODGHI+Ol9w6h9TkdZUOwC0vKuI1Exx2PB8
        Uyp8GUCyIf+SOJPv6J9mtj0/lw==
X-Google-Smtp-Source: ABdhPJzoTsDymuGkAscyrEmo2xwB1uYCO2fe1f91WYkrzlJ++iMBXIbSeP8G+Pno+4D5KBVt1XjAuA==
X-Received: by 2002:aa7:8c0d:0:b0:47b:dc76:38c1 with SMTP id c13-20020aa78c0d000000b0047bdc7638c1mr16798377pfd.22.1635206462140;
        Mon, 25 Oct 2021 17:01:02 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
        by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 17:01:01 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 18/34] drm/mediatek: Migrate to aggregate driver
Date:   Mon, 25 Oct 2021 17:00:28 -0700
Message-Id: <20211026000044.885195-19-swboyd@chromium.org>
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

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index aec39724ebeb..a3f27b8c9769 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -348,8 +348,9 @@ static int compare_of(struct device *dev, void *data)
 	return dev->of_node == data;
 }
 
-static int mtk_drm_bind(struct device *dev)
+static int mtk_drm_bind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 	struct drm_device *drm;
 	int ret;
@@ -380,8 +381,9 @@ static int mtk_drm_bind(struct device *dev)
 	return ret;
 }
 
-static void mtk_drm_unbind(struct device *dev)
+static void mtk_drm_unbind(struct aggregate_device *adev)
 {
+	struct device *dev = adev->parent;
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 
 	drm_dev_unregister(private->drm);
@@ -391,9 +393,13 @@ static void mtk_drm_unbind(struct device *dev)
 	private->drm = NULL;
 }
 
-static const struct component_master_ops mtk_drm_ops = {
-	.bind		= mtk_drm_bind,
-	.unbind		= mtk_drm_unbind,
+static struct aggregate_driver mtk_drm_aggregate_driver = {
+	.probe		= mtk_drm_bind,
+	.remove		= mtk_drm_unbind,
+	.driver		= {
+		.name	= "mtk_drm",
+		.owner	= THIS_MODULE,
+	},
 };
 
 static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
@@ -593,7 +599,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, private);
 
-	ret = component_master_add_with_match(dev, &mtk_drm_ops, match);
+	ret = component_aggregate_register(dev, &mtk_drm_aggregate_driver, match);
 	if (ret)
 		goto err_pm;
 
@@ -616,7 +622,7 @@ static int mtk_drm_remove(struct platform_device *pdev)
 	struct mtk_drm_private *private = platform_get_drvdata(pdev);
 	int i;
 
-	component_master_del(&pdev->dev, &mtk_drm_ops);
+	component_aggregate_unregister(&pdev->dev, &mtk_drm_aggregate_driver);
 	pm_runtime_disable(&pdev->dev);
 	of_node_put(private->mutex_node);
 	for (i = 0; i < DDP_COMPONENT_ID_MAX; i++)
-- 
https://chromeos.dev

