Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 342AE3ABEC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 00:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbhFQWWo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 18:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbhFQWWo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 18:22:44 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A87C06175F
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 15:20:35 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 131so11221209ljj.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 15:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Jzs2DywkTXblufGfcJJvXwLGtRDUMYYgqcQdK2UvYs=;
        b=nf/R3gMKmZ8YgJAIeW60PBX9O9+j3CsjOZDroP9lA9yyvHNR7Ca40xUawrTgWUTg1N
         BQu0Z5+/n5ovKf0/qjnQ7GG9EOwTdpb2mGE2O4V+w6lbeZ3wt1rw6R/bBn8NyWydIsSD
         S1NKDTJSygtKDGiQsk1U2BbPWwHLQUwjjKjMict3x1ahfh8Br1AviN9pzzeGsLdH8Scm
         TesUzsO8PJxSSWSsizW9MeGAwk01dFj8tC29SB2w7R857fqIpzcfS6YJs6AyCc6d31ge
         vP4uqGgoxapXtXrsDxq6P6IlvhEgkbaNgFCAkkflnpqORETZ5Xltds3q89BC+TV2slmH
         nnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Jzs2DywkTXblufGfcJJvXwLGtRDUMYYgqcQdK2UvYs=;
        b=WSt0+5BlOGhyHw+N1ZX3SBWA9Yl8b19vSWvNQS/GGBEqDoHgF/W8qyM3i2uYTjYIJQ
         YpChjJz+2vM/c5cG5Knm6fv2eKE7fX0k0rm7ur+qY6jXiFQi0kCUusCfUY8gAh5JJ9Cv
         FxAS89TNe513fh92xiWEbr7H4K48NefIiZDagJqGapgxpi/3Tq1I1SSVM1wEjNj3SuK6
         +IpIoAmR9Tsvk4cne3ZhEJfNkOYGU5U7YPo3e0j8jmhGDvAeBtl3IkCjKhVNz9gvrw86
         EqmIw+GIyYlA1ldBtcJTmTyh0EUkUcCiJ+zHxqKdFTA48j6/B3+S72dDW2Iqf2G8j6to
         Mpgw==
X-Gm-Message-State: AOAM5311YD6ov/rBcV7jKjd8+aA/TbmDQzQw20cOK/Lr6ge19JoYL24a
        3TfGW2EmBHqF9uYCXPih1vIXsA==
X-Google-Smtp-Source: ABdhPJzPs0irvwnPKXw3J2P+XJG57pLvbM7p+TMR28NCYTmMBcBStdtF8CyUECqv4poLyv9KuTCiwA==
X-Received: by 2002:a2e:9f14:: with SMTP id u20mr1035864ljk.222.1623968433429;
        Thu, 17 Jun 2021 15:20:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a5sm895594ljq.0.2021.06.17.15.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 15:20:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/msm/dpu: don't clear IRQ register twice
Date:   Fri, 18 Jun 2021 01:20:24 +0300
Message-Id: <20210617222029.463045-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
References: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We already clear the IRQ status register before processing IRQs, so do
not clear the register again. Especially do not clear the IRQ status
_after_ processing the IRQ as this way we can loose the event.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c   | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 2437b0c7c073..28e9b0d448db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -120,21 +120,6 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 #define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
 #define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
 
-static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
-		int irq_idx)
-{
-	int reg_idx;
-
-	if (!intr)
-		return;
-
-	reg_idx = DPU_IRQ_REG(irq_idx);
-	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off, DPU_IRQ_MASK(irq_idx));
-
-	/* ensure register writes go through */
-	wmb();
-}
-
 /**
  * dpu_core_irq_callback_handler - dispatch core interrupts
  * @arg:		private data of callback handler
@@ -203,8 +188,6 @@ irqreturn_t dpu_core_irq(struct dpu_kms *dpu_kms)
 
 			dpu_core_irq_callback_handler(dpu_kms, irq_idx);
 
-			dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
-
 			/*
 			 * When callback finish, clear the irq_status
 			 * with the matching mask. Once irq_status
-- 
2.30.2

