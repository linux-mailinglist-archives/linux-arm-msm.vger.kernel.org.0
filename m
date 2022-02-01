Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EFD84A5FAF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Feb 2022 16:11:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240103AbiBAPLC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Feb 2022 10:11:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240113AbiBAPLC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Feb 2022 10:11:02 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5F6AC061714
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Feb 2022 07:11:01 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id z7so24596916ljj.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Feb 2022 07:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rStlTv/QLBk6KsFVu0/iZDaKBkJO7zJVGuOILLqnt5c=;
        b=mBvRaov7kXUZJbbBGmYwL865IkYzMKUi6VGXGwk8/+sbEhvr/OfoTroK0Obq60dxAC
         MfGUqE4FzLuS6XowC0d/q3lvwCMVK2P5h69IUhNrHvsnMd2nu/z0kF328GCKzc/obLLO
         1WYNJ7iCHemNwTVCjJwn/DgWrIwwoTFoUsVHf03r5bT75qHsvx/vzWj3hXTxibvg2EAA
         vqmw0qKSA/wpfdJ5o+MgVNx2xmjfhmItzzunM2CIh0Up3NXIQvKfCeMhjUxuSyXMdMr+
         u6SzQiV5kjwFd54eBlNk/o3vZ/TxZsuDkTSF9kjSPVFZ5QuAb4635rD9kbwY6TEqAO4w
         jAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rStlTv/QLBk6KsFVu0/iZDaKBkJO7zJVGuOILLqnt5c=;
        b=oos5kEQaqmuU7zzTkxANzuTOgTvkRk0G9VWC9Ppj1Sfr1YQM+RM9ab/Q0Bts1kKbJH
         DwOVxARROyt0sPL8YUpcq6kQz0Rianxjy3Jm5xf5D8jbP1hQnRyQTwRFM80JwSIBxDOD
         rnuSEtwAApM976Lz5MQh5FocOFciwS3IpsJW4lp9dr8P4Rtz72t1RoH63J8lM5ELy5a9
         +keziwg7OTRDVc1WiLLtfa2qBb3AWwSMz7phoJhoUF6i6BBisJGMOH/WjJ+SPB5yzWmE
         6UFXDAfYuGeSnf7CmvwKvFx0GuuoDimupQp0mb0ooXonXJ5j6FWMMeR+0BaWeIKWD8+m
         iDJw==
X-Gm-Message-State: AOAM531SECKUE2zUeKJQsaDAOtExeSh+nZ4UlAixaDUAAzydJ5gPwZ94
        tLPUxDV7cTxyECMZZicj+O9CcQ==
X-Google-Smtp-Source: ABdhPJzq9CJyf0JuC5CGgMT/Ht0mAwkETYveQMmGOdE2xCYm21V94ua9h1e6atg/5Ls/bfs82LvnWw==
X-Received: by 2002:a05:651c:1249:: with SMTP id h9mr16891980ljh.127.1643728259886;
        Tue, 01 Feb 2022 07:10:59 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y6sm1337723lfk.157.2022.02.01.07.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 07:10:59 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/6] drm/msm/dpu: remove always-true argument of dpu_core_irq_read()
Date:   Tue,  1 Feb 2022 18:10:52 +0300
Message-Id: <20220201151056.2480055-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The argument clear of the function dpu_core_irq_read() is always true.
Remove it.

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

