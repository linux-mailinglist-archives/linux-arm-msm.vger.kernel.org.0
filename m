Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4CFA5B30E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2019 05:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbfGADXI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jun 2019 23:23:08 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45212 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbfGADXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jun 2019 23:23:08 -0400
Received: by mail-pg1-f194.google.com with SMTP id o13so790058pgp.12;
        Sun, 30 Jun 2019 20:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=PrNNA7UemSEt+9xPeSxVNoncNwrWLLFfcBGUueJJCmY=;
        b=iTQH984o/AQOMuBEhmTJENql3LVdFAOsva3/2ZUdQEsqIhyR+ekcVUPujjotl2K0l9
         XSpVBG37dDuryIlbEOognx1gEXHaEElKKoMBBbMgzcecxEbKV1OLkzeGbrWjB565F8WE
         yT4Z7kFxl07KpO/3NFmifHvxYamW02T+iyfbz7rk5H8dcs28GYJcvbtugoQ8BEnPWL7N
         EIyyrNtjpREchxTvQ4Qn8bm+YXkW0szlxSJk9iG8iQbv4jjcEvrvhCUzYbcjTLo9Kd6A
         EvljS4nAeapQPteUAnJPjmaghAd4s5vsIwju8UmL4hMUxKNP0WNCED39h2iEutGy3Z9B
         jvig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=PrNNA7UemSEt+9xPeSxVNoncNwrWLLFfcBGUueJJCmY=;
        b=NS38qi5KoCcmhsADHnVsWJP/JZl61EQx/sHNLFq5s4JgXCTsPlIOU5Lw4cB9lmAC9J
         BR0DMewZYgOvvjSPPnNB22FHzVmbfrs+B1GfO5FcUAN6UEJzVaeRBC98a7AsLYXfhNNK
         DNLgYlip9Otl9YhYWr/nbHN+KFh2jcXEQP0aF06+z5PQmV0Ypnrv8Fx9MKEEatMVJbYO
         n2dNiB6izAq6AwzQB/Q8OdBZNFMU1Z0PV5UUF+laEc1QRg6Cy5jE/asjDa2lF+Ijj9d2
         +ixKFh9deJjNrxQDyNN29eVLKzce8o0o50ncBgfx4z4SGYoiafCvnbw09gPxe3qx6OzD
         WjUA==
X-Gm-Message-State: APjAAAWDJs0itVLm34mnz63B9rUBTd3V4X6jH0tnYusFHB0Zl7+DUpbh
        FdGMhQHec1gkX/GRkvicswU=
X-Google-Smtp-Source: APXvYqzMEFgmFIqdX2C093FHy/XWxDUnBWMzfZ9JHtwBQdhr/x0OR95JKpj4+iE2WGIxuFjaIRCm2Q==
X-Received: by 2002:a17:90a:26e4:: with SMTP id m91mr28480919pje.93.1561951387264;
        Sun, 30 Jun 2019 20:23:07 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id v4sm10092040pff.45.2019.06.30.20.23.00
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 30 Jun 2019 20:23:06 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Fuqian Huang <huangfq.daxian@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Tomeu Vizoso <tomeu.vizoso@collabora.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Enrico Weigelt <info@metux.net>,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Mack <daniel@zonque.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Rajesh Yadav <ryadav@codeaurora.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] gpu: Use dev_get_drvdata()
Date:   Mon,  1 Jul 2019 11:22:35 +0800
Message-Id: <20190701032245.25906-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using dev_get_drvdata directly.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c      |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c         | 13 +++++--------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c        |  6 ++----
 drivers/gpu/drm/msm/dsi/dsi_host.c              |  6 ++----
 drivers/gpu/drm/msm/msm_drv.c                   |  3 +--
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c | 15 +++++----------
 drivers/gpu/drm/panfrost/panfrost_device.c      |  6 ++----
 7 files changed, 19 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index b3deb346a42b..fafd00d2574a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -403,16 +403,14 @@ static const struct of_device_id dt_match[] = {
 #ifdef CONFIG_PM
 static int adreno_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_gpu *gpu = platform_get_drvdata(pdev);
+	struct msm_gpu *gpu = dev_get_drvdata(dev);
 
 	return gpu->funcs->pm_resume(gpu);
 }
 
 static int adreno_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_gpu *gpu = platform_get_drvdata(pdev);
+	struct msm_gpu *gpu = dev_get_drvdata(dev);
 
 	return gpu->funcs->pm_suspend(gpu);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ae885e5dd07d..6c6f8ca9380f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1025,16 +1025,15 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
 
 static void dpu_unbind(struct device *dev, struct device *master, void *data)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
+	struct dpu_kms *dpu_kms = dev_get_drvdata(dev);
 	struct dss_module_power *mp = &dpu_kms->mp;
 
 	msm_dss_put_clk(mp->clk_config, mp->num_clk);
-	devm_kfree(&pdev->dev, mp->clk_config);
+	devm_kfree(dev, mp->clk_config);
 	mp->num_clk = 0;
 
 	if (dpu_kms->rpm_enabled)
-		pm_runtime_disable(&pdev->dev);
+		pm_runtime_disable(dev);
 }
 
 static const struct component_ops dpu_ops = {
@@ -1056,8 +1055,7 @@ static int dpu_dev_remove(struct platform_device *pdev)
 static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 {
 	int rc = -1;
-	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
+	struct dpu_kms *dpu_kms = dev_get_drvdata(dev);
 	struct drm_device *ddev;
 	struct dss_module_power *mp = &dpu_kms->mp;
 
@@ -1077,8 +1075,7 @@ static int __maybe_unused dpu_runtime_suspend(struct device *dev)
 static int __maybe_unused dpu_runtime_resume(struct device *dev)
 {
 	int rc = -1;
-	struct platform_device *pdev = to_platform_device(dev);
-	struct dpu_kms *dpu_kms = platform_get_drvdata(pdev);
+	struct dpu_kms *dpu_kms = dev_get_drvdata(dev);
 	struct drm_encoder *encoder;
 	struct drm_device *ddev;
 	struct dss_module_power *mp = &dpu_kms->mp;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 901009e1f219..25d1ebb32e73 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -1052,8 +1052,7 @@ static int mdp5_dev_remove(struct platform_device *pdev)
 
 static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
+	struct mdp5_kms *mdp5_kms = dev_get_drvdata(dev);
 
 	DBG("");
 
@@ -1062,8 +1061,7 @@ static __maybe_unused int mdp5_runtime_suspend(struct device *dev)
 
 static __maybe_unused int mdp5_runtime_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct mdp5_kms *mdp5_kms = platform_get_drvdata(pdev);
+	struct mdp5_kms *mdp5_kms = dev_get_drvdata(dev);
 
 	DBG("");
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index dbf490176c2c..882f13725819 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -477,8 +477,7 @@ static void dsi_bus_clk_disable(struct msm_dsi_host *msm_host)
 
 int msm_dsi_runtime_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_dsi *msm_dsi = platform_get_drvdata(pdev);
+	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
 	struct mipi_dsi_host *host = msm_dsi->host;
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 
@@ -492,8 +491,7 @@ int msm_dsi_runtime_suspend(struct device *dev)
 
 int msm_dsi_runtime_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct msm_dsi *msm_dsi = platform_get_drvdata(pdev);
+	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
 	struct mipi_dsi_host *host = msm_dsi->host;
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index f38d7367bd3b..0d9e46561609 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -241,8 +241,7 @@ static int vblank_ctrl_queue_work(struct msm_drm_private *priv,
 
 static int msm_drm_uninit(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct drm_device *ddev = platform_get_drvdata(pdev);
+	struct drm_device *ddev = dev_get_drvdata(dev);
 	struct msm_drm_private *priv = ddev->dev_private;
 	struct msm_kms *kms = priv->kms;
 	struct msm_mdss *mdss = priv->mdss;
diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
index 8edef8ef23b0..53240da139b1 100644
--- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
+++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
@@ -407,8 +407,7 @@ static const struct backlight_ops dsicm_bl_ops = {
 static ssize_t dsicm_num_errors_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
+	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 	struct omap_dss_device *src = ddata->src;
 	u8 errors = 0;
 	int r;
@@ -439,8 +438,7 @@ static ssize_t dsicm_num_errors_show(struct device *dev,
 static ssize_t dsicm_hw_revision_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
+	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 	struct omap_dss_device *src = ddata->src;
 	u8 id1, id2, id3;
 	int r;
@@ -506,8 +504,7 @@ static ssize_t dsicm_show_ulps(struct device *dev,
 		struct device_attribute *attr,
 		char *buf)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
+	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 	unsigned int t;
 
 	mutex_lock(&ddata->lock);
@@ -521,8 +518,7 @@ static ssize_t dsicm_store_ulps_timeout(struct device *dev,
 		struct device_attribute *attr,
 		const char *buf, size_t count)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
+	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 	struct omap_dss_device *src = ddata->src;
 	unsigned long t;
 	int r;
@@ -553,8 +549,7 @@ static ssize_t dsicm_show_ulps_timeout(struct device *dev,
 		struct device_attribute *attr,
 		char *buf)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct panel_drv_data *ddata = platform_get_drvdata(pdev);
+	struct panel_drv_data *ddata = dev_get_drvdata(dev);
 	unsigned int t;
 
 	mutex_lock(&ddata->lock);
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
index 3b2bced1b015..ed187648e6d8 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.c
+++ b/drivers/gpu/drm/panfrost/panfrost_device.c
@@ -227,8 +227,7 @@ const char *panfrost_exception_name(struct panfrost_device *pfdev, u32 exception
 #ifdef CONFIG_PM
 int panfrost_device_resume(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
+	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 
 	panfrost_gpu_soft_reset(pfdev);
 
@@ -243,8 +242,7 @@ int panfrost_device_resume(struct device *dev)
 
 int panfrost_device_suspend(struct device *dev)
 {
-	struct platform_device *pdev = to_platform_device(dev);
-	struct panfrost_device *pfdev = platform_get_drvdata(pdev);
+	struct panfrost_device *pfdev = dev_get_drvdata(dev);
 
 	if (!panfrost_job_is_idle(pfdev))
 		return -EBUSY;
-- 
2.11.0

