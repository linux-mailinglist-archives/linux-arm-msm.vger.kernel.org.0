Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42FF918140
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2019 22:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727469AbfEHUnd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 May 2019 16:43:33 -0400
Received: from mail-qt1-f196.google.com ([209.85.160.196]:35406 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbfEHUnc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 May 2019 16:43:32 -0400
Received: by mail-qt1-f196.google.com with SMTP id d20so63833qto.2;
        Wed, 08 May 2019 13:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XjAj7v9d1aFWP7B+0xfRD5AnYiJJiQMWuu96HEDaElE=;
        b=T/+EnRFMcDyr1RrV7kcej6Ow39TkoY3F1smOkQuf5l6uCBt81vot92yNBQxWOcDcCs
         Qqcl1B6gwDTNOb7/QSYC2yIex/0RVt/KAyODUZgk7kHdAHsNddjHAKXmVj8EdQMDEjeS
         HlcEmwv69jwrzfE22npYldfROske9UHbAXUtubTKxGlxI02N/0wbYoaH73zqmEvQI9AP
         GYc5tFrMYbHozC0mLFtsbszTNH9a8WXkqzIASfNATUOFh5g0q9Fl+NlYX25niLpN8bPA
         PYKfBNMEURawv/KdIN9jPJh5BUJpICniKY5Ach7lZfX4y4zISSmGAeNTiha9hPCbqeUY
         WDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XjAj7v9d1aFWP7B+0xfRD5AnYiJJiQMWuu96HEDaElE=;
        b=GYfEQ9qPX9kkPQ8Jw4L02oacAu1UAM2dRZm175QpG0tBrQhN9tiN14IFIo8Q2//BPU
         8WF4PvshwF7RIxnuHcQ5dfW1b+tAWouI8VaY7MFDh0DTihtjZUa93BpnkDoeVfdFd/d7
         80y+YbCkupTLy3y7g2lgeRwzJbL8+APV9WMFux4ljAmtpp6oZsHrn/0M5ZtBgobFSou3
         88Inv5gBaUcVtiCrwD2UWj3xjoZJqf9LHoAPjEVLr3YBcgVf9GH4UXOLn7LhMKhCl8/g
         ZftqJ8Ngb3q5B3FarkZORKfLgfu7sa2ycCfojdBSs4JvQNHJF5fJNp/blRwWXOq03dSp
         8iXA==
X-Gm-Message-State: APjAAAWFqrCvk2h5hd9Vt0OpCkQjvTpSlWPkW3lCdhNX3cHBHD4BzUTp
        skEE5qYuM+fXN9PQBCG2ApY=
X-Google-Smtp-Source: APXvYqxqOuM2hNNnGXrJHF+QOV08Kuzc4qJe/4y5c0uV13OeTKBfj8Qb4Lug/R5PLCbC3M3zwTk6Ig==
X-Received: by 2002:a0c:addd:: with SMTP id x29mr228478qvc.130.1557348211545;
        Wed, 08 May 2019 13:43:31 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:6268:7a0b:50be:cebc])
        by smtp.gmail.com with ESMTPSA id k4sm290053qth.63.2019.05.08.13.43.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 13:43:30 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] drm/msm/dpu: add icc voting in dpu_mdss_init
Date:   Wed,  8 May 2019 13:42:14 -0700
Message-Id: <20190508204219.31687-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508204219.31687-1-robdclark@gmail.com>
References: <20190508204219.31687-1-robdclark@gmail.com>
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
index e3c56ccd7357..b42537a663f7 100644
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

