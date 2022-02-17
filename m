Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95A0A4B9785
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 05:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232046AbiBQEQj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 23:16:39 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231146AbiBQEQi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 23:16:38 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D9323D3F4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:16:22 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id p22so7645751lfu.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yYbkOkFGat0cqbwTQ8ClTqRlNlPF1QGsgj5ReXysfdw=;
        b=bkhuZyhZCMGvu5H/DkxhUkW2wgOQzYi/8NORCjzbidTjKpvX2kmxbeqH0VBs0M1JDK
         L9WJoRjJEBuJ6U/jTladD+RG03szdfMm4enpBOv4zNTBqrSD3KN58RPgiRtwnbcoP1QI
         x2jBNLd3Vr89wZvymnwfSnhY6sluxk3Vz+AdFJHhrLjhwpc078Q+t7WInw5dN+4UJe07
         52OLXkIMpcUfW9xcr+kHj0kigieUFmJ8Z8wf8ZwEWtArHy4A1lAEoYaODSQIica1NWBe
         y5Y+ByKr+QtFNjd0mtj2QvU4nSPMxf6w0akozqL+abl1vVS8yJH4fC+umjlBu6lO02hX
         GE4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yYbkOkFGat0cqbwTQ8ClTqRlNlPF1QGsgj5ReXysfdw=;
        b=eAVmDNxB/5q2EoXcij2/vMSb6N+CmpVsRxaNzYx9Gls2bEB9OZce0L/aO3OhWVkblD
         z/n23SvyW2+qkwgEPxtqGz55RzdWQ06Aq74TZx1e6PvweFyygoIgTxhDM5MEL9lt5WwB
         VjTDT5atw2u5aiYCIApLkGpK1KV2kssOKlinPGTq+VT9FLk+7wz1aW/P8m2Qamnqgeqw
         l2TnghMSQVYvz0/q8JZsRMBLUFpEouymtiJs3SMnWJYyfBlZcNBDNDzJAAt/NUWGrMGr
         EjFSdVd1KKdCj3dGxYaTG7P/wL3W+FnVMymOwbEEx/J8nwbhpNv4wGeDchds6VZMOHq6
         40yQ==
X-Gm-Message-State: AOAM533Ikttt8k11SBUMCAcnpNg7NsdpDJOOJUAKjmI4J7RGXS5OsYHU
        IQ0NxMiGnfEV+c9sotCrhFh0Hg==
X-Google-Smtp-Source: ABdhPJyrfjUrfsWHk0OaXnezPMdkjID3KTb3i1Tfr2BKqkJq3LVzQ0x9tMJ1XNpSnRSVtXqFTFeCMA==
X-Received: by 2002:ac2:4d06:0:b0:443:5f59:45e0 with SMTP id r6-20020ac24d06000000b004435f5945e0mr844221lfi.500.1645071380577;
        Wed, 16 Feb 2022 20:16:20 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16sm2452349ljg.25.2022.02.16.20.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 20:16:20 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/msm/dpu: remove always-true argument of dpu_core_irq_read()
Date:   Thu, 17 Feb 2022 07:16:13 +0300
Message-Id: <20220217041617.470875-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217041617.470875-1-dmitry.baryshkov@linaro.org>
References: <20220217041617.470875-1-dmitry.baryshkov@linaro.org>
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

