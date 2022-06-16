Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFB1954DC62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jun 2022 10:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359589AbiFPIAC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jun 2022 04:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359601AbiFPH77 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jun 2022 03:59:59 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A59DD5D66B
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 00:59:52 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id w20so988816lfa.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jun 2022 00:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dGNB/O3yb7InoceOz218JG2VBA+WBg1TNFmvlSb9qs4=;
        b=r+E2w2g7kU/m5Jr0w0Drcz2bPBn34gKqqSXBxG5d8BwyplJn7R7M7M2PiO6ne0VXZb
         mYxo66C5nVhVcpF+pE/0jhkLHlExdeRd2ShodhvuLcaMvmlJigkzuXRixRemaIuHxBdq
         cyaHn7pgSlCByF/+wDk105c1JF29pJ8Y8Xn1M/qjTIFGYlxZmnAVROKq2jGQ967qjnr+
         F37sZRCjG4i3EG/+vcJrb2D/yHnVjjIDZjpWjxWBcViG3iXdFdzmBPSNfJnBVL5BdMBA
         n5Hs1vTZIjNG/Lg+PQpdI3Xgeg2cFSeGpp6AKeAyGLe0/FxtG2SD0DNqbrI2yjSxJYSD
         LT0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dGNB/O3yb7InoceOz218JG2VBA+WBg1TNFmvlSb9qs4=;
        b=nxP4B//UPMrrdsyyMcT9kOPUUTGvSQ2icDDqfebAlkgRoaO+aswOu9Lt5N6E3b7ioK
         +DytLjf9EiYB/1li6KF3IgzMsTsG+34+pUsNcgpcoY5kyH/f7QGVak6jJORriHil9//D
         b25p5/nAVPQlSYkOj2auKrRDgG6w9Nzgu/s8IlNVZbi+M38ukHAiujkk6ZB7MJDlXu4W
         Z0YSY+qDWeDHIf37dMhK0QIFwVhu54hMremhphA9xuKTN4r4bF5SKK6LQJ+d/F5T71IT
         xkDbtfyYJHR35DK/IMnFfnRQjP2PFt/t5B1+jd/JomGH0orWkKRVRVKzfWUwDtzShUsC
         3bcw==
X-Gm-Message-State: AJIora8TA0r161hD96Uj+dSEtNgOvWoig/ta8erOzkNUNn1dNbkHqzyP
        9PEqmkLhn0QbJ8tZEe9/Pbm5/A==
X-Google-Smtp-Source: AGRyM1sx2nicYgg93ap4FUAhGh09GFwJWRgk3UeOuYV3q7MS9dXIEn4guklkp1o/i6NMcPNhrZLniQ==
X-Received: by 2002:a19:dc57:0:b0:479:5300:4e0e with SMTP id f23-20020a19dc57000000b0047953004e0emr2030677lfj.236.1655366391010;
        Thu, 16 Jun 2022 00:59:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id d3-20020a056512368300b00478ff020832sm136717lfs.106.2022.06.16.00.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 00:59:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/3] drm/msm/hdmi: drop constant resource names from platform config
Date:   Thu, 16 Jun 2022 10:59:46 +0300
Message-Id: <20220616075947.347888-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
References: <20220616075947.347888-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All MSM HDMI devices use "core_physical" and "qfprom_physical" names for
register areas. Drop them from the platform config.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 9 +++------
 drivers/gpu/drm/msm/hdmi/hdmi.h | 3 ---
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 9ff9a68b201b..8dfe5690366b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -133,7 +133,7 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 	hdmi->config = config;
 	spin_lock_init(&hdmi->reg_lock);
 
-	hdmi->mmio = msm_ioremap(pdev, config->mmio_name);
+	hdmi->mmio = msm_ioremap(pdev, "core_physical");
 	if (IS_ERR(hdmi->mmio)) {
 		ret = PTR_ERR(hdmi->mmio);
 		goto fail;
@@ -141,14 +141,14 @@ static struct hdmi *msm_hdmi_init(struct platform_device *pdev)
 
 	/* HDCP needs physical address of hdmi register */
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-		config->mmio_name);
+		"core_physical");
 	if (!res) {
 		ret = -EINVAL;
 		goto fail;
 	}
 	hdmi->mmio_phy_addr = res->start;
 
-	hdmi->qfprom_mmio = msm_ioremap(pdev, config->qfprom_mmio_name);
+	hdmi->qfprom_mmio = msm_ioremap(pdev, "qfprom_physical");
 	if (IS_ERR(hdmi->qfprom_mmio)) {
 		DRM_DEV_INFO(&pdev->dev, "can't find qfprom resource\n");
 		hdmi->qfprom_mmio = NULL;
@@ -510,9 +510,6 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 		return -ENXIO;
 	}
 
-	hdmi_cfg->mmio_name     = "core_physical";
-	hdmi_cfg->qfprom_mmio_name = "qfprom_physical";
-
 	dev->platform_data = hdmi_cfg;
 
 	hdmi = msm_hdmi_init(to_platform_device(dev));
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index a6c88d157bc3..7263bcbf4d06 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -84,9 +84,6 @@ struct hdmi {
 
 /* platform config data (ie. from DT, or pdata) */
 struct hdmi_platform_config {
-	const char *mmio_name;
-	const char *qfprom_mmio_name;
-
 	/* regulators that need to be on for hpd: */
 	const char **hpd_reg_names;
 	int hpd_reg_cnt;
-- 
2.35.1

