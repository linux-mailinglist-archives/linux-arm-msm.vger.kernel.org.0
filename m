Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F26E485C3A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 00:27:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245375AbiAEX1E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 18:27:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245364AbiAEX1E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 18:27:04 -0500
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F87C061245
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 15:27:03 -0800 (PST)
Received: by mail-lj1-x231.google.com with SMTP id r22so1258730ljk.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 15:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RQh0W27z9Rv8021nYV+r9aQSz9qOZHpHoOU5e94BJ0c=;
        b=WmXDkjduVnMsUHg2LOv65HvhWzePdCIECoq3lazikJl7anZYZaokQ839BsCpFkGfvq
         3y9hMxtHV/ytT1WK5xnTTY4V+gPY3mx02MxNLqpMneQbARuampSNif3rlS3ldokxsG1l
         VUwLH6bY5gMmfGetALw+MeqBjj1WEmZxb4lTr3aqk4Djru+VAWAiVs9l80VyUGcGu5UM
         pRV+R3Rop1CacCnsBq1s7+frZCkGRWep89Re3RDw7b0MI6ip3lZGTdYcIfOLa/etIZGO
         0eLPg67lt2uX/2+yuNqfxCjkGrJ7mVK/xI9rfwq8yFwMh0q4KB+R0ab8EChvn3DONSou
         xnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RQh0W27z9Rv8021nYV+r9aQSz9qOZHpHoOU5e94BJ0c=;
        b=iKGeQHKKoT3G5g+hui+pzJW3KKXgfMjOB+nQh/ufD1eqz5UcrY/6Hz8e8roifSGqew
         56vUC1wrBYYGbMpMvppzrW8FdSOoumEkFzl3ze3wTrCWgcrfcMTH6+DEQTqCwEocI2Tm
         LW+cZHljeIJsjoksX+/3qHdXskSYW2XGooO70JEPL32yRDqH/YZLja9ZzcFz1pskYBO6
         OXjI5LrXNr+M8XSpnjr9Ou7Ytwrmn03MZrz3pemMDHAx1iMxqRhbzEEl4YPK+wGho8sm
         l/5O7siZyGcKjZqK+BCfA7hMI98tS4ToloiRKAOluMqTKPWD4RerxSraTiWJBuEuit9s
         n7og==
X-Gm-Message-State: AOAM530poK3A2atbr9a0U97/No3yISTxsscg/MiGN6bV0VyDQsDXCb9O
        XnLioUtq5xKMrmpnCVAunpWjPA==
X-Google-Smtp-Source: ABdhPJwELggaCq5BR8C/eGMIQp7LDD84EX9N2Axz9S2aOKx7DwFioc78YAhCCQqEKoH/BP/sYqqySg==
X-Received: by 2002:a2e:9788:: with SMTP id y8mr44792149lji.135.1641425221796;
        Wed, 05 Jan 2022 15:27:01 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b29sm28730lfv.187.2022.01.05.15.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 15:27:01 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/msm: drop register logging support
Date:   Thu,  6 Jan 2022 02:26:58 +0300
Message-Id: <20220105232700.444170-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Register logging was used during early stages of msm driver development
to compare upstream and downstream register traces. However the tool was
never updated to work with mdp5 hardware. Later it was dropped
completely when Rob imported freedreno tools into mesa. All this makes
DRM_MSM_REGISTER_LOGGING irrelevant now, so it can be dropped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig   |  9 ---------
 drivers/gpu/drm/msm/msm_drv.c | 16 +---------------
 2 files changed, 1 insertion(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 1eae5a9645f4..9b019598e042 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -33,15 +33,6 @@ config DRM_MSM_GPU_STATE
 	depends on DRM_MSM && (DEBUG_FS || DEV_COREDUMP)
 	default y
 
-config DRM_MSM_REGISTER_LOGGING
-	bool "MSM DRM register logging"
-	depends on DRM_MSM
-	default n
-	help
-	  Compile in support for logging register reads/writes in a format
-	  that can be parsed by envytools demsm tool.  If enabled, register
-	  logging can be switched on via msm.reglog=y module param.
-
 config DRM_MSM_GPU_SUDO
 	bool "Enable SUDO flag on submits"
 	depends on DRM_MSM && EXPERT
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ad35a5d94053..cfc9a0c9ec39 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -57,14 +57,6 @@ static const struct drm_mode_config_helper_funcs mode_config_helper_funcs = {
 	.atomic_commit_tail = msm_atomic_commit_tail,
 };
 
-#ifdef CONFIG_DRM_MSM_REGISTER_LOGGING
-static bool reglog;
-MODULE_PARM_DESC(reglog, "Enable register read/write logging");
-module_param(reglog, bool, 0600);
-#else
-#define reglog 0
-#endif
-
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 static bool fbdev = true;
 MODULE_PARM_DESC(fbdev, "Enable fbdev compat layer");
@@ -150,9 +142,6 @@ static void __iomem *_msm_ioremap(struct platform_device *pdev, const char *name
 		return ERR_PTR(-ENOMEM);
 	}
 
-	if (reglog)
-		printk(KERN_DEBUG "IO:region %s %p %08lx\n", dbgname, ptr, size);
-
 	if (psize)
 		*psize = size;
 
@@ -179,16 +168,13 @@ void __iomem *msm_ioremap_size(struct platform_device *pdev, const char *name,
 
 void msm_writel(u32 data, void __iomem *addr)
 {
-	if (reglog)
-		printk(KERN_DEBUG "IO:W %p %08x\n", addr, data);
 	writel(data, addr);
 }
 
 u32 msm_readl(const void __iomem *addr)
 {
 	u32 val = readl(addr);
-	if (reglog)
-		pr_err("IO:R %p %08x\n", addr, val);
+
 	return val;
 }
 
-- 
2.34.1

