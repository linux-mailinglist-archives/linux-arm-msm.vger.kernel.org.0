Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18C3E4ABBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 22:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730341AbfFRUZh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 16:25:37 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:32852 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfFRUZh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 16:25:37 -0400
Received: by mail-qt1-f193.google.com with SMTP id x2so17124986qtr.0;
        Tue, 18 Jun 2019 13:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TIBkr0/rm+35I5D7kp+sjlYQTXR18bhJrUdb3/bbQ84=;
        b=JzIaP7LAy2wIvaikkMC1orlL4s5PdBVDz4CL4pDrdsxcbFxQRrSSI6av7lg5iyWeJx
         D6gxxbjD9PKpHOyVDhnbqfDiULIz7Xrzm7DrPEROmjz+evt2xCbXAQAjwSdYq0SrjMam
         d65vYOkms8s/UaeijLu6MzXEPxKO8aykgjttdDO1+xZjpgTpLNInekcKX+0TQHd+OxcI
         V4TM/sPVhXKFA4BoLbdMkvLYn5r4Mu1t5pcdHsKUK/MNscjvtiMsWyHt30Z+qnUMFpR4
         BuVXt6I5vzGJdtx/Gx734zD92abVTPq+3S2GCnodb4U//4k8vFeAWOzGN3SlX87A/LVu
         2PCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TIBkr0/rm+35I5D7kp+sjlYQTXR18bhJrUdb3/bbQ84=;
        b=BupaAMYqFcSJrHqnSwZ5VFHIQgii+xuBNeLKkD+P33jdAu+SV53NWdkznz53uS5TVz
         7ZU4CrevrZmKfY+H11tbCzS/vDiDRUsCLhgwNQtZzCCkyaJ/myNxkzzdIu5MsFCl4Ztp
         9UkIMj5zT68F1B63Zt8WOe8Rsspw+mmnGl0FdEYQeq37QStVgEigqpvKLThhzunZFhQw
         WN+8n45XQ+hZyDZj6X78Jt194H9kLLKWSUSJ74+ar3JrPFdbfQwjmAxfKH+avWe9YsYB
         1FZqFggqxiuS8Qz8n6sIepbnTdLq8mDHyN8VAI8a6sMxfiXOpnCRp+SURhhrSs/H1JlS
         iW3A==
X-Gm-Message-State: APjAAAUyLerBHQigDvrslC07elD9wJO90gJeSmV07As429pj+6vP4AZw
        DHhM3J3tF0T02OrzCS1tei0=
X-Google-Smtp-Source: APXvYqzC40YKPX8T0MLddHulG6MVab9KyzdiIugXiY2lSC7GvTD8kn2aajJ7FYhNz2sI74Hn0qiCWg==
X-Received: by 2002:a0c:bd9a:: with SMTP id n26mr29411009qvg.25.1560889535497;
        Tue, 18 Jun 2019 13:25:35 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
        by smtp.gmail.com with ESMTPSA id k15sm7617420qtg.22.2019.06.18.13.25.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 13:25:35 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] drm/msm/dpu: add icc voting in dpu_mdss_init
Date:   Tue, 18 Jun 2019 13:24:12 -0700
Message-Id: <20190618202425.15259-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618202425.15259-1-robdclark@gmail.com>
References: <20190618202425.15259-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Abhinav Kumar <abhinavk@codeaurora.org>

dpu_mdss_destroy() can get called not just from
msm_drm_uninit() but also from msm_drm_bind() in case
of any failures.

dpu_mdss_destroy() removes the icc voting by calling
icc_put. This could accidentally remove the voting
done by pm_runtime_enable.

To make the voting balanced add a minimum vote in
dpu_mdss_init() to avoid any unclocked access.

This change depends on the following patch which
introduces interconnect binding to MDSS driver:

https://patchwork.codeaurora.org/patch/708155/

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
Reviewed-by: Sean Paul <sean@poorly.run>
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index b1d0437ac7b6..986915bbbc02 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -49,6 +49,16 @@ static int dpu_mdss_parse_data_bus_icc_path(struct drm_device *dev,
 	return 0;
 }
 
+static void dpu_mdss_icc_request_bw(struct msm_mdss *mdss)
+{
+	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
+	int i;
+	u64 avg_bw = dpu_mdss->num_paths ? MAX_BW / dpu_mdss->num_paths : 0;
+
+	for (i = 0; i < dpu_mdss->num_paths; i++)
+		icc_set_bw(dpu_mdss->path[i], avg_bw, kBps_to_icc(MAX_BW));
+}
+
 static void dpu_mdss_irq(struct irq_desc *desc)
 {
 	struct dpu_mdss *dpu_mdss = irq_desc_get_handler_data(desc);
@@ -160,11 +170,9 @@ static int dpu_mdss_enable(struct msm_mdss *mdss)
 {
 	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
 	struct dss_module_power *mp = &dpu_mdss->mp;
-	int ret, i;
-	u64 avg_bw = dpu_mdss->num_paths ? MAX_BW / dpu_mdss->num_paths : 0;
+	int ret;
 
-	for (i = 0; i < dpu_mdss->num_paths; i++)
-		icc_set_bw(dpu_mdss->path[i], avg_bw, kBps_to_icc(MAX_BW));
+	dpu_mdss_icc_request_bw(mdss);
 
 	ret = msm_dss_enable_clk(mp->clk_config, mp->num_clk, true);
 	if (ret)
@@ -277,6 +285,8 @@ int dpu_mdss_init(struct drm_device *dev)
 
 	pm_runtime_enable(dev->dev);
 
+	dpu_mdss_icc_request_bw(priv->mdss);
+
 	pm_runtime_get_sync(dev->dev);
 	dpu_mdss->hwversion = readl_relaxed(dpu_mdss->mmio);
 	pm_runtime_put_sync(dev->dev);
-- 
2.20.1

