Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C274235A973
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Apr 2021 02:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235230AbhDJAOs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 20:14:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235208AbhDJAOs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 20:14:48 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AFB4C061762
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Apr 2021 17:14:34 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id p23so4741459ljn.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Apr 2021 17:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XVOy4fgMUlHspu+4cBqeL0KKWzBqXTAeE3Y/jlAnjk4=;
        b=ZsnumkQiVI0JO3QUmCYB70xnS2Qfgrh/bEViTKsPWel/EvTmZnIDicpKY3VlAUsdKa
         XmuTUmOIWoWgb8Y5x8eOoydy6qGidg3bpd6VPXAKehAiu/j5cqmDnxwj4pgGPCx87ybi
         Z9sGCRf3POyNk8S3kB1hkANeuJK9cgO84RisLvnPEA6wzKqwxgQH0AQq7PIU7wkmRFU6
         9ZjRhLqmnNxLkZas9J0ZwaoBTi/UegcMfnF4/mx0yWydVXTyyWD+R8p1Y5wDXplbF5nI
         HsEZtuRZhHDDiOTfN9Ro6ga93stMMViYkIxpf7g5tVufTnx1Ua422ZDAxUfJM5cCe4um
         WXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XVOy4fgMUlHspu+4cBqeL0KKWzBqXTAeE3Y/jlAnjk4=;
        b=G6V2iAOFBzKLHoXPsGIb0XKjpga4o4CgCOkK1d9FNmYN1UVMtPBHA4Pg3zbtaq4RFw
         SOZjUPvY9Uf1Q7oMjPQnQ8j0DA9ekZYlVX493fsnchi14CDafWKtKbgfwzru04qpMkAO
         sw4ybS8dtC1sA89p5Yb7FynCV2UH0820T7dqbSf3BrxBlOhnReUaRfTOWiCH8AAQaSOw
         veyrJjPDPuVCf+xTIDoD/rSvwe+FfNlkB5ur9oYM504XzsNtxw1YnUEDDCqESAmbUQQA
         Q2Gi+d0/klTk+TDdw4uXB4b+RasA73lnXxUAS8m8rdlp7P6NAAsKwuMBH/D8REq1f+zK
         PC9Q==
X-Gm-Message-State: AOAM532avPDEJrr9HfeAywJYhOdNYGtBOwlDFKOfxu591PR073+q71Om
        bLm6U89DlGT8NWWhO3BOOoUl0g==
X-Google-Smtp-Source: ABdhPJzrHAAINr94MMEkM9Nz/5LIVbBylUmMFVPcOKPEoo6u/oX0koMC3yWQAkBFpKbGQDEnL0kp3Q==
X-Received: by 2002:a2e:8708:: with SMTP id m8mr10886037lji.339.1618013672565;
        Fri, 09 Apr 2021 17:14:32 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a17sm323360lfg.20.2021.04.09.17.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 17:14:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 2/3] drm/msm/dpu: hw_intr: always call dpu_hw_intr_clear_intr_status_nolock
Date:   Sat, 10 Apr 2021 03:14:29 +0300
Message-Id: <20210410001430.1732450-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210410001430.1732450-1-dmitry.baryshkov@linaro.org>
References: <20210410001430.1732450-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Always call dpu_hw_intr_clear_intr_status_nolock() from the
dpu_hw_intr_dispatch_irqs(). This simplifies the callback function
and enforces clearing the hw interrupt status.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  |  9 -----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 39 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  9 -----
 3 files changed, 18 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
index c977e8484174..dadb4103b0eb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
@@ -41,15 +41,6 @@ static void dpu_core_irq_callback_handler(void *arg, int irq_idx)
 		if (cb->func)
 			cb->func(cb->arg, irq_idx);
 	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
-
-	/*
-	 * Clear pending interrupt status in HW.
-	 * NOTE: dpu_core_irq_callback_handler is protected by top-level
-	 *       spinlock, so it is safe to clear any interrupt status here.
-	 */
-	dpu_kms->hw_intr->ops.clear_intr_status_nolock(
-			dpu_kms->hw_intr,
-			irq_idx);
 }
 
 int dpu_core_irq_idx_lookup(struct dpu_kms *dpu_kms,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index a8d463a8e8fe..3d48ad69c901 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -771,6 +771,22 @@ static int dpu_hw_intr_irqidx_lookup(enum dpu_intr_type intr_type,
 	return -EINVAL;
 }
 
+static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
+		int irq_idx)
+{
+	int reg_idx;
+
+	if (!intr)
+		return;
+
+	reg_idx = dpu_irq_map[irq_idx].reg_idx;
+	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
+			dpu_irq_map[irq_idx].irq_mask);
+
+	/* ensure register writes go through */
+	wmb();
+}
+
 static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 		void (*cbfunc)(void *, int),
 		void *arg)
@@ -837,9 +853,8 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
 				 */
 				if (cbfunc)
 					cbfunc(arg, irq_idx);
-				else
-					intr->ops.clear_intr_status_nolock(
-							intr, irq_idx);
+
+				dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
 
 				/*
 				 * When callback finish, clear the irq_status
@@ -1004,23 +1019,6 @@ static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
 	return 0;
 }
 
-
-static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
-		int irq_idx)
-{
-	int reg_idx;
-
-	if (!intr)
-		return;
-
-	reg_idx = dpu_irq_map[irq_idx].reg_idx;
-	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
-			dpu_irq_map[irq_idx].irq_mask);
-
-	/* ensure register writes go through */
-	wmb();
-}
-
 static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
 		int irq_idx, bool clear)
 {
@@ -1062,7 +1060,6 @@ static void __setup_intr_ops(struct dpu_hw_intr_ops *ops)
 	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
 	ops->clear_all_irqs = dpu_hw_intr_clear_irqs;
 	ops->disable_all_irqs = dpu_hw_intr_disable_irqs;
-	ops->clear_intr_status_nolock = dpu_hw_intr_clear_intr_status_nolock;
 	ops->get_interrupt_status = dpu_hw_intr_get_interrupt_status;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index d8b9d5fe6b8c..8d005687b265 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -141,15 +141,6 @@ struct dpu_hw_intr_ops {
 			void (*cbfunc)(void *arg, int irq_idx),
 			void *arg);
 
-	/**
-	 * clear_intr_status_nolock() - clears the HW interrupts without lock
-	 * @intr:	HW interrupt handle
-	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
-	 */
-	void (*clear_intr_status_nolock)(
-			struct dpu_hw_intr *intr,
-			int irq_idx);
-
 	/**
 	 * get_interrupt_status - Gets HW interrupt status, and clear if set,
 	 *                        based on given lookup IRQ index.
-- 
2.30.2

