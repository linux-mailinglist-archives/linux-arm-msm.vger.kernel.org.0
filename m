Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A31025F16F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2019 04:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727174AbfGDCfz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Jul 2019 22:35:55 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:38589 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726652AbfGDCfz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Jul 2019 22:35:55 -0400
Received: by mail-pf1-f195.google.com with SMTP id y15so2186169pfn.5;
        Wed, 03 Jul 2019 19:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=ojn+49ftq+z8784/6AsfYPnFGWstJKNc22LY9JyUdlw=;
        b=FxhQ1cdUpPS8yct2DSlYrMBDcU04+80klCz0EsXxr2SJy/bXip/j5g5YW3RezoBXiH
         6weMuHwDmJ52nHplt/mTdbYvqdzAtFr8UVX8bhRDlc+DZ+j5dxSEkzD/VdbatURStpcW
         fF6Jv3Ef+/zuYJZyDBuSBB+jKdMSVsTrhAL5eHpHbcvpmi9BVJiy0XVUBA/UXnUpS6rm
         /m2yW00jiu9cNGogxOeMKsoYRrUhCG6A8oU9KhZvlRwsBhrjo6oWeQx1LJUZjYVTZTeo
         oePhEQ9aOM4uVrR5VQXdi5B8biVyS7yB+hnKD5UkmpltXWz2Z23SL6IO9agQmQ9mIXsN
         bCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=ojn+49ftq+z8784/6AsfYPnFGWstJKNc22LY9JyUdlw=;
        b=iJ1rzeTYSj8DY5UxaVHV/tDZ9iw/JSdVn2bUKUd/hAvjgNT0I/F6vVD5OH5xevcT+b
         03DgFTErR3UgG+GBBqV9aHiTDkiz/AOZnaYv2W3gi0+GUK4mdHEksAVab4f9Vlpx5Uc3
         UCPIVBQcyhX/iWkzCi9dsxfc0R19H+NXqvrcXEWOElqqeU0X5OYZdjEOt90bM1GLBfp+
         nZqEiRxTj15G0eE9fR3G9GmAq/UeA3E0Kst/HQcHOoqpxcnSNMQTLZXNcKWOiQ/oKV2R
         TDSXOAHnU8WfuyIofm8uuMIEfWbKHTIxIUniE+sElN93XuBkDN9YadAfR/ZDDrQ7cxR4
         N4yw==
X-Gm-Message-State: APjAAAWIZ5z+j/TbdSiUgJ9cj9l/HNJtsHhZyOZKxG9VwwnvO9A3VMNV
        Zzlq5WKp0LGC/oCZG9g1P74=
X-Google-Smtp-Source: APXvYqzqvMWWHQM4sVeiCp9PcZJA0Ws8ePP+f3aZv97bhjphSnssU+dDzXMDMfH8Jnk46WlMAOTb4A==
X-Received: by 2002:a65:5689:: with SMTP id v9mr37803658pgs.293.1562207754394;
        Wed, 03 Jul 2019 19:35:54 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.googlemail.com with ESMTPSA id s66sm5290767pgs.39.2019.07.03.19.35.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 19:35:54 -0700 (PDT)
From:   Fuqian Huang <huangfq.daxian@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Fuqian Huang <huangfq.daxian@gmail.com>
Subject: [Patch v2 02/10] drm/msm: using dev_get_drvdata directly
Date:   Thu,  4 Jul 2019 10:35:46 +0800
Message-Id: <20190704023546.4503-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Several drivers cast a struct device pointer to a struct
platform_device pointer only to then call platform_get_drvdata().
To improve readability, these constructs can be simplified
by using dev_get_drvdata() directly.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
Changes in v2:
  - Make the commit message more clearly.

 drivers/gpu/drm/msm/adreno/adreno_device.c |  6 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c    | 13 +++++--------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   |  6 ++----
 drivers/gpu/drm/msm/dsi/dsi_host.c         |  6 ++----
 drivers/gpu/drm/msm/msm_drv.c              |  3 +--
 drivers/gpu/drm/msm/msm_gpu.c              |  6 +++---
 6 files changed, 15 insertions(+), 25 deletions(-)

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
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index b2a8411c2d84..ebbc6dff2cde 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -24,7 +24,7 @@
 static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 		u32 flags)
 {
-	struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
+	struct msm_gpu *gpu = dev_get_drvdata(dev);
 	struct dev_pm_opp *opp;
 
 	opp = devfreq_recommended_opp(dev, freq, flags);
@@ -45,7 +45,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
 static int msm_devfreq_get_dev_status(struct device *dev,
 		struct devfreq_dev_status *status)
 {
-	struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
+	struct msm_gpu *gpu = dev_get_drvdata(dev);
 	ktime_t time;
 
 	if (gpu->funcs->gpu_get_freq)
@@ -64,7 +64,7 @@ static int msm_devfreq_get_dev_status(struct device *dev,
 
 static int msm_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
 {
-	struct msm_gpu *gpu = platform_get_drvdata(to_platform_device(dev));
+	struct msm_gpu *gpu = dev_get_drvdata(dev);
 
 	if (gpu->funcs->gpu_get_freq)
 		*freq = gpu->funcs->gpu_get_freq(gpu);
-- 
2.11.0

