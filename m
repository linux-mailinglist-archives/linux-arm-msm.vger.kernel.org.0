Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3DD3418916
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Sep 2021 15:42:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231723AbhIZNoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Sep 2021 09:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231769AbhIZNoR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Sep 2021 09:44:17 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C4C5C061570
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 06:42:41 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i25so64425287lfg.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rlWdpxs06o6BKntUmFuTyMgh8/xRKIkF0pvChWN0UpU=;
        b=u7fCHwagnurRz0JEcjetSix9eW39ilQu3Ks+mQPl52alU4ohHjcsIsMJUjQf/4fHE1
         VC39tBM4ZKTKh6HSwdP/UVrA00BDmnKt/2dAVzqpx+9JxcF/XAcieYdty6weMFUWruix
         8ghqmaM0jn3bMqWZUa0K5n3TKBC+xwRcfmkQgurfxViNzrq/uUhHXaOQdbYv02uo4G0V
         a3GBgrs4ze6kmY16NTV3JipD3j3cCdsJNe6PSjd1rT+AJoSsZqXeukMcHyl+i19hdMLW
         5qXUxw2nDHf0iQt88Zk+sD2bDR7nBnoW8bH/1hLSuF2x/dsT4vb4DFZUfdtcahiNmeN0
         WMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rlWdpxs06o6BKntUmFuTyMgh8/xRKIkF0pvChWN0UpU=;
        b=waobw0ZNERGfmazTaBkDfFPCqjcFr9j4XLwkYs2SiPR9BgDSRKI2SpOlLL18nJcbPO
         rJXU6ieo1pdcjQz+f99nKwIOA6aydAWUnFjhGN0NeAeKZCmTLtW7fG5AEoCZm69UaC1h
         9aQx0wOujnAxAR+vSp1UKI6CD/koIXk+vLNm4+C1D/+6+nADS9cq+Bg1IwkOT5/rIJL/
         iQn0I0OPZaVoehXDSg+Fy+jazw0b3BdYXjNwCweB4FLQTALVmh/uhcM81GL75x3fjHpx
         uDbBvexyPR4jxVPxks60zkCZesqkJu1LzMLLUp4fukZYCqcgV/clCJqLVTmXCbVcKyID
         8R+A==
X-Gm-Message-State: AOAM531WH+lKbiLugqBwI1vFdbaWIqt9072fr1G2yk4zqImsjYTFa2qB
        prBobbbmJjvAGodiKKlugXGL5g==
X-Google-Smtp-Source: ABdhPJwbzm8S7/kiV9y3Y/+ilaG2LYbxDhV+9Gx+pMuDM9bcue1mpUONPtr6uHJaf0h04v7lZNvQyw==
X-Received: by 2002:a2e:974b:: with SMTP id f11mr22475591ljj.385.1632663758814;
        Sun, 26 Sep 2021 06:42:38 -0700 (PDT)
Received: from umbar.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k21sm1787925lji.81.2021.09.26.06.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 06:42:38 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/2] thermal: qcom: tsens: remove data indirection in the debugfs
Date:   Sun, 26 Sep 2021 16:42:36 +0300
Message-Id: <20210926134237.23863-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is no reason to pass platform device to debugfs just to get the
tsens_priv from it. Not to mention that for TSENS_V0 the platform device
(gcc) might have other device data. Pass the tsens_priv data to debugfs
callbacks directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/thermal/qcom/tsens.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 4c7ebd1d3f9c..6aeea74c1bb0 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -657,8 +657,7 @@ int get_temp_common(const struct tsens_sensor *s, int *temp)
 #ifdef CONFIG_DEBUG_FS
 static int dbg_sensors_show(struct seq_file *s, void *data)
 {
-	struct platform_device *pdev = s->private;
-	struct tsens_priv *priv = platform_get_drvdata(pdev);
+	struct tsens_priv *priv = s->private;
 	int i;
 
 	seq_printf(s, "max: %2d\nnum: %2d\n\n",
@@ -675,8 +674,7 @@ static int dbg_sensors_show(struct seq_file *s, void *data)
 
 static int dbg_version_show(struct seq_file *s, void *data)
 {
-	struct platform_device *pdev = s->private;
-	struct tsens_priv *priv = platform_get_drvdata(pdev);
+	struct tsens_priv *priv = s->private;
 	u32 maj_ver, min_ver, step_ver;
 	int ret;
 
@@ -701,9 +699,8 @@ static int dbg_version_show(struct seq_file *s, void *data)
 DEFINE_SHOW_ATTRIBUTE(dbg_version);
 DEFINE_SHOW_ATTRIBUTE(dbg_sensors);
 
-static void tsens_debug_init(struct platform_device *pdev)
+static void tsens_debug_init(struct platform_device *pdev, struct tsens_priv *priv)
 {
-	struct tsens_priv *priv = platform_get_drvdata(pdev);
 	struct dentry *root, *file;
 
 	root = debugfs_lookup("tsens", NULL);
@@ -715,14 +712,14 @@ static void tsens_debug_init(struct platform_device *pdev)
 	file = debugfs_lookup("version", priv->debug_root);
 	if (!file)
 		debugfs_create_file("version", 0444, priv->debug_root,
-				    pdev, &dbg_version_fops);
+				    priv, &dbg_version_fops);
 
 	/* A directory for each instance of the TSENS IP */
 	priv->debug = debugfs_create_dir(dev_name(&pdev->dev), priv->debug_root);
-	debugfs_create_file("sensors", 0444, priv->debug, pdev, &dbg_sensors_fops);
+	debugfs_create_file("sensors", 0444, priv->debug, priv, &dbg_sensors_fops);
 }
 #else
-static inline void tsens_debug_init(struct platform_device *pdev) {}
+static inline void tsens_debug_init(struct platform_device *pdev, struct tsens_priv *priv) {}
 #endif
 
 static const struct regmap_config tsens_config = {
@@ -918,7 +915,7 @@ int __init init_common(struct tsens_priv *priv)
 	if (tsens_version(priv) >= VER_0_1)
 		tsens_enable_irq(priv);
 
-	tsens_debug_init(op);
+	tsens_debug_init(op, priv);
 
 err_put_device:
 	put_device(&op->dev);
-- 
2.30.2

