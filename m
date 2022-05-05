Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EA3651C156
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 15:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380114AbiEENy3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 09:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380127AbiEENx5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 09:53:57 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD48A583BC
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 06:50:12 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id b18so7587012lfv.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 06:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4TMEXMjLJmLbEp82QyGh3Ohj7SMwYayrIWMx4meas6A=;
        b=mq46J0H/IjNAIDz8bE6PrQuyTKG1597bUo+Deucv2qyqHWQbgksoq7fvxfIFGSD4VH
         Yvwuj4IBetARd3HxM7F45rEYRocIgBGSKM7ZUa8EuA6u3Bm24A7NtIKh7VEWeRwfdx1T
         OQTAyrtqFKNcG2RwP9jzeANvrP/kWSfE9uvMzG7heqPMz+ppsyDUXaAJQX0KEkS0oo1u
         ruYl8LKRZv7Ri5T+/L+tUV4/ZF5czKHuZObBBTypUTi3vY7w5QSqcPWmXT2u3ST+xXJF
         ws9ekV5CouCMxIrErUSJfoLMVxRhO+3mLMUQBV721oUJPx4QFrLWyrfwLFNr452ElBiY
         kRXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4TMEXMjLJmLbEp82QyGh3Ohj7SMwYayrIWMx4meas6A=;
        b=jw3GsVe5zLWV/XeVjMKAiCOoYOhyfHHv3TfijvIUUHRi5kDc+szDstwf2wMr+e7KlT
         KItJWpT83zEb/cyk430JJQ/45L62jrPx7TvsIh6ZO7JaLcdOKoLJHDaEIHUtFf9mMpfO
         qt3iGAdkC7deMdXnyqtOeik7PRyKXP6whrxGdR+NiLb2/YfcZQyM4sIlZsBLzLv79nYL
         u1w/LEXeu9V22nanXFjL+O5er2oQzPXF7y7Z76vTwCLS5E7xvhhoouDel4zJRC2hFwj9
         1p2aMjqB1u3p6RDLJDL4+eaHsnnnNudSjDFfihYhVRSKcHA0C0L9d2lIAkarEBrIr3Rt
         S+5w==
X-Gm-Message-State: AOAM530qJPKS2wWyaabGFhr3Fej4X191qQ2ydewE61/e+xtF5f5cYmo9
        cE5LW33FYWGFMS1EgWwItqKN0Q==
X-Google-Smtp-Source: ABdhPJy4OvbVt3GEoZrJDhM4UmwcIpYhzXR+SeylsTgUHNK2EM6X9YusgMqR1gXPROkM/kerD31MAA==
X-Received: by 2002:a05:6512:1395:b0:446:d382:79a5 with SMTP id p21-20020a056512139500b00446d38279a5mr17647734lfa.210.1651758610739;
        Thu, 05 May 2022 06:50:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c17-20020a2ea791000000b0024f3d1dae96sm210935ljf.30.2022.05.05.06.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 06:50:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm/mdp4: get rid of struct mdp4_platform_config
Date:   Thu,  5 May 2022 16:50:08 +0300
Message-Id: <20220505135008.1351533-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505135008.1351533-1-dmitry.baryshkov@linaro.org>
References: <20220505135008.1351533-1-dmitry.baryshkov@linaro.org>
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

Struct mdp4_platform_config is a relict from the DT-conversion time.
Move the max_clk field to the mdp4_kms_init(), the place where it is
used and drop the struct mdp4_platform_config and the mdp4_get_config()
function.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 21 ++++++---------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h |  5 -----
 2 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 1fba6ab06eb1..ccde710c63fa 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -13,8 +13,6 @@
 #include "msm_mmu.h"
 #include "mdp4_kms.h"
 
-static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev);
-
 static int mdp4_hw_init(struct msm_kms *kms)
 {
 	struct mdp4_kms *mdp4_kms = to_mdp4_kms(to_mdp_kms(kms));
@@ -384,7 +382,6 @@ static void read_mdp_hw_revision(struct mdp4_kms *mdp4_kms,
 static int mdp4_kms_init(struct drm_device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
-	struct mdp4_platform_config *config = mdp4_get_config(pdev);
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp4_kms *mdp4_kms;
 	struct msm_kms *kms = NULL;
@@ -392,6 +389,10 @@ static int mdp4_kms_init(struct drm_device *dev)
 	struct msm_gem_address_space *aspace;
 	int irq, ret;
 	u32 major, minor;
+	unsigned long max_clk;
+
+	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
+	max_clk = 266667000;
 
 	mdp4_kms = kzalloc(sizeof(*mdp4_kms), GFP_KERNEL);
 	if (!mdp4_kms) {
@@ -459,7 +460,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 		goto fail;
 	}
 
-	clk_set_rate(mdp4_kms->clk, config->max_clk);
+	clk_set_rate(mdp4_kms->clk, max_clk);
 
 	read_mdp_hw_revision(mdp4_kms, &major, &minor);
 
@@ -479,7 +480,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 			ret = PTR_ERR(mdp4_kms->lut_clk);
 			goto fail;
 		}
-		clk_set_rate(mdp4_kms->lut_clk, config->max_clk);
+		clk_set_rate(mdp4_kms->lut_clk, max_clk);
 	}
 
 	pm_runtime_enable(dev->dev);
@@ -552,16 +553,6 @@ static int mdp4_kms_init(struct drm_device *dev)
 	return ret;
 }
 
-static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
-{
-	static struct mdp4_platform_config config = {};
-
-	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
-	config.max_clk = 266667000;
-
-	return &config;
-}
-
 static const struct dev_pm_ops mdp4_pm_ops = {
 	.prepare = msm_pm_prepare,
 	.complete = msm_pm_complete,
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index 7cc549b6a82b..01179e764a29 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -42,11 +42,6 @@ struct mdp4_kms {
 };
 #define to_mdp4_kms(x) container_of(x, struct mdp4_kms, base)
 
-/* platform config data (ie. from DT, or pdata) */
-struct mdp4_platform_config {
-	uint32_t max_clk;
-};
-
 static inline void mdp4_write(struct mdp4_kms *mdp4_kms, u32 reg, u32 data)
 {
 	msm_writel(data, mdp4_kms->mmio + reg);
-- 
2.35.1

