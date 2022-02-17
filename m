Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB1154B97B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 05:31:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233814AbiBQEcJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 23:32:09 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233854AbiBQEcI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 23:32:08 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A050520194
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:31:53 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id b38so6427949ljr.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yYbkOkFGat0cqbwTQ8ClTqRlNlPF1QGsgj5ReXysfdw=;
        b=q1li0SXAdTI4moSmYEV3ZKUyytG+SSOQR1y2b4fN1S1Ppl9ZKFKqnkANnmXWT2k9AU
         iywuQuAnoUzyXtbgkweEt/jZpPWcAp1a03GFgSordholykmD6pr30UtFwDYjpmx8Vbpz
         Y/FbPeDVELvQf4jdlQ/L9vm2+myY7T/WnkcsppbW/BdPUn99RUoywmFFPoH5vQV9w3I3
         xJUqkJxH37NMGY2o0Oh6Ur4+V4CdlbV+CGLxFDtrhauZfbrYJM+kM3HAXLHGe/yY7Ftx
         rfXp1UkY46MIZlmBHlZNLJCqittKjAKEXaNTS3stXouk4pHH6LMo6T1B4NC5YGmxuDWX
         OV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yYbkOkFGat0cqbwTQ8ClTqRlNlPF1QGsgj5ReXysfdw=;
        b=3eoxvtyj8Zk5OhQYHR4j2ZedZJEfPjaxXmtqXEiUIcUFX6K6bl3seZRxyy1Mfwonmp
         Tle4HIwrdm80qNCbnsk+DfXe9fjn67zkDmoHMQdrUAEExlyiYbG+HszRptIU3ZuLhU6K
         tVtoqjgBco5m2pGlnHJmWgMiuSdO4thUt5uNLUo27n37ZXz+vi8fmZbU2Em0bnRI+YpX
         aw3VsrAPOef58azochkDDrNpK3/rXSTV8NretWrm5pOti+/6P3ZzRF3lvnPCUSEWc6Bb
         sQ4kW99lr5AGIl2GWuePDXIYi7lWlSLMzeSnkN077Q7nKx5OVG6Kb2dwocKaLln4iNd0
         irjg==
X-Gm-Message-State: AOAM533Y9ISec3CfAaNVOeiaqq1qSskKou3M1cP2tnG1Q3I1SLVVEsDA
        IvY99SfKycv3Q0H5UAVdfuFlqw==
X-Google-Smtp-Source: ABdhPJwKrcQFY9EYGS9iFVYjR/pNCIQEUlLK5X/y/eA+Vo7BjU31XsfV8+aTUS+HPzW3vvjWi1u1CQ==
X-Received: by 2002:a2e:2a44:0:b0:243:6b73:1c0 with SMTP id q65-20020a2e2a44000000b002436b7301c0mr961535ljq.376.1645072310956;
        Wed, 16 Feb 2022 20:31:50 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l8sm1463391ljb.140.2022.02.16.20.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 20:31:50 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 2/6] drm/msm/dpu: remove always-true argument of dpu_core_irq_read()
Date:   Thu, 17 Feb 2022 07:31:44 +0300
Message-Id: <20220217043148.480898-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
References: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
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

The argument clear of the function dpu_core_irq_read() is always true.
Remove it.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h      | 4 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 4 ++--
 3 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
index 7023ccb79814..6dce5d89f817 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h
@@ -33,13 +33,11 @@ irqreturn_t dpu_core_irq(struct msm_kms *kms);
  * dpu_core_irq_read - IRQ helper function for reading IRQ status
  * @dpu_kms:		DPU handle
  * @irq_idx:		irq index
- * @clear:		True to clear the irq after read
  * @return:		non-zero if irq detected; otherwise no irq detected
  */
 u32 dpu_core_irq_read(
 		struct dpu_kms *dpu_kms,
-		int irq_idx,
-		bool clear);
+		int irq_idx);
 
 /**
  * dpu_core_irq_register_callback - For registering callback function on IRQ
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1e648db439f9..5576b8a3e6ee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -301,8 +301,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 			wait_info);
 
 	if (ret <= 0) {
-		irq_status = dpu_core_irq_read(phys_enc->dpu_kms,
-				irq->irq_idx, true);
+		irq_status = dpu_core_irq_read(phys_enc->dpu_kms, irq->irq_idx);
 		if (irq_status) {
 			unsigned long flags;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 71882d3fe705..85404c9ab4e1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -357,7 +357,7 @@ static void dpu_disable_all_irqs(struct dpu_kms *dpu_kms)
 	wmb();
 }
 
-u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
+u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx)
 {
 	struct dpu_hw_intr *intr = dpu_kms->hw_intr;
 	int reg_idx;
@@ -384,7 +384,7 @@ u32 dpu_core_irq_read(struct dpu_kms *dpu_kms, int irq_idx, bool clear)
 	intr_status = DPU_REG_READ(&intr->hw,
 			dpu_intr_set[reg_idx].status_off) &
 		DPU_IRQ_MASK(irq_idx);
-	if (intr_status && clear)
+	if (intr_status)
 		DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
 				intr_status);
 
-- 
2.34.1

