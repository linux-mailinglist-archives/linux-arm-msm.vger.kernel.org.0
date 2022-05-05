Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF3151C15F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 15:51:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380122AbiEENy3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 09:54:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380126AbiEENx5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 09:53:57 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB3195838B
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 06:50:11 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id b18so7586941lfv.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=48aIM/KpZ2USvZfBjFUkxb9XMnlqoCOw+7fM77NfVAA=;
        b=NMoeNvcLJk+xmbePWh3To9N8YfwCw+vd1k+B9lNsy1gqOT9AMDa45R//CGpom4peg+
         /v1FCPS0nMVyWu22f0C64GjOlFzVNoqdymZCI1IgtvjpD3OHA+mRJTlLe5GqbOQA5ctQ
         MIKGqSOGnNYbss2M26R4BntyKss1T1oKWxvC7cuVOSFofNo95QR4aiXpAtha03xewhy3
         jk5PJyDbp0302H8n24oqony+SD8B1/rtgyh0RH/Ohp3daHD6ixh5raeIJ9ChnylFE8le
         FGIP4OBESn8VgJ43dWCK0TDfFGIVQTxaCR0jmBvFW0wAZGnjBWDctsFWWIqpXVHheo/g
         X/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=48aIM/KpZ2USvZfBjFUkxb9XMnlqoCOw+7fM77NfVAA=;
        b=bV43cbmSORy4Q0hunAnH+WuyUNqdE2Of8NK82NKcYq1xmvkHowHQ7RMVV29ljp/yyE
         uig9ut4mh8Ymm0WZL7HlwTSSheBA1nrPJvG67883ZCK2hGIQWqKcjeyhyTq0iOLflJ6G
         eizLnz6G4P9Gt7/djUII5sn+UB9CRwZ17+NfrcYQS8vRJiNWjony2eyMvAut+wDLG2Jb
         Fq96jUAc0i0YkZJe6a8LbZocupB+CGk5tlD8wmdAf+lRYgJ3jUhR5JvLQ8pT7/IL2Xnr
         nXhZmKXS3iuEZCCvcfdDxbYlS9hZCCs8NtqiVQ6jqfTl1ybhEaBgPPxytf3kjjFA5h7f
         evJQ==
X-Gm-Message-State: AOAM5329sVucUEisJPZY7T7te2KaFvTz62zNWAAU8I4kajW8J8lbcvTx
        HmRHXDCI/5xPuefjD5D31NS6kg==
X-Google-Smtp-Source: ABdhPJzqtJE/niHNvJTferK/O5UKI9g35GxmefvqtWOB+1+GmgdY0AtN0f9+Srwt/hIbilzloKtYGA==
X-Received: by 2002:a05:6512:128e:b0:473:d371:5a38 with SMTP id u14-20020a056512128e00b00473d3715a38mr2576589lfs.502.1651758610065;
        Thu, 05 May 2022 06:50:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c17-20020a2ea791000000b0024f3d1dae96sm210935ljf.30.2022.05.05.06.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 06:50:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/mdp4: move iommu_domain_alloc() call close to its usage
Date:   Thu,  5 May 2022 16:50:07 +0300
Message-Id: <20220505135008.1351533-2-dmitry.baryshkov@linaro.org>
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

Move iommu_domain_alloc() in front of adress space/IOMMU initialization.
This allows us to drop it from struct mdp4_cfg_platform which
remained from the pre-DT days.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 8 ++++----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h | 1 -
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index fb48c8c19ec3..1fba6ab06eb1 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -388,6 +388,7 @@ static int mdp4_kms_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct mdp4_kms *mdp4_kms;
 	struct msm_kms *kms = NULL;
+	struct iommu_domain *iommu;
 	struct msm_gem_address_space *aspace;
 	int irq, ret;
 	u32 major, minor;
@@ -495,9 +496,9 @@ static int mdp4_kms_init(struct drm_device *dev)
 	mdp4_disable(mdp4_kms);
 	mdelay(16);
 
-	if (config->iommu) {
-		struct msm_mmu *mmu = msm_iommu_new(&pdev->dev,
-			config->iommu);
+	iommu = iommu_domain_alloc(pdev->dev.bus);
+	if (iommu) {
+		struct msm_mmu *mmu = msm_iommu_new(&pdev->dev, iommu);
 
 		aspace  = msm_gem_address_space_create(mmu,
 			"mdp4", 0x1000, 0x100000000 - 0x1000);
@@ -557,7 +558,6 @@ static struct mdp4_platform_config *mdp4_get_config(struct platform_device *dev)
 
 	/* TODO: Chips that aren't apq8064 have a 200 Mhz max_clk */
 	config.max_clk = 266667000;
-	config.iommu = iommu_domain_alloc(&platform_bus_type);
 
 	return &config;
 }
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index e8ee92ab7956..7cc549b6a82b 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -44,7 +44,6 @@ struct mdp4_kms {
 
 /* platform config data (ie. from DT, or pdata) */
 struct mdp4_platform_config {
-	struct iommu_domain *iommu;
 	uint32_t max_clk;
 };
 
-- 
2.35.1

