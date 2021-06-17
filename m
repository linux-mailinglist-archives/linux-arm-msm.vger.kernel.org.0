Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6788F3AB570
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 16:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbhFQOLW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 10:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231311AbhFQOLW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 10:11:22 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26EEFC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 07:09:14 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id r198so10714029lff.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 07:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HxVxCNncfl7sobKYPc3WOH+hS+AyXpqE4qRLACNBDX8=;
        b=RG06X/tJrgCg+FrkuxXBXDuRBfW7ZdVciZaTP19z/4bhsGpNUZ8zXzcWuo91+cv02F
         nkJre9ZPDwR1bypTclkOZj7feawbil9LLIAbuRM4gdpAAwl6j104VhSYYTPJKSekGXHt
         RCULRxYc6nTQdsciK5XeNuhmiKAGLnFzqvmQjlyCrOX+0zyLf4mkg1XZ7vXvrLQinZNE
         W4ME8Vs0/oORhvwgse/bXx7kJdy4CqnoyPXpH8/zmwzu6tqB75cfHoSUYmPg/0OjELzh
         tTPCDg3rKESV1jiAE28hWkwq5Y6TWkR6/DQfPuM2GVJ8lebb02ASxNgyTDopPXzQDoDZ
         Q28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HxVxCNncfl7sobKYPc3WOH+hS+AyXpqE4qRLACNBDX8=;
        b=hbcrBHhAtlFh/uCH0g98tcNP81FMyEJrBy3IUI4QpMT9NUq2zfWy4hD0ER8oNxDhBu
         GEL+heGClzGAVThFdCreWlUuGDC1lo631evxM8QfUPSYXA3m+9HTQgIZkfFoPYaGwAO+
         Xc5BmC6AVE2Z2ri8jgEL33Yx7Xo+uBiOIzYbBnTldLk8nIVzxLFRK0cfkeIZIWI7ZUIa
         kNCV4Br5h1gDnTKfNzBNMQm7Ink7GlOBt5m+GZNpuQYsJ2+o0/VhWTHwL3j+b1pPCnyi
         KutOKt2VCpmTROOaIRd0bEjw/CSZOT53ZL9Sg1KX3D3S/lYf48PWirRnOn3ZB/hgcrrf
         HgOw==
X-Gm-Message-State: AOAM530TAxLa+AOsWRXwW8WwF1b8qbEan5bfsWt3EY1R0bX46PYev+AI
        P1K0fhlPiZAsU7jN2EHn52zP+w==
X-Google-Smtp-Source: ABdhPJz85Hl6Hdni9SW5sjuXFNjJ4wAq3ZwSkvQ0MbsTbY3BfJO7BeInf5/zbpBTaO6qNHH0lqaLkQ==
X-Received: by 2002:a19:c3d1:: with SMTP id t200mr3442592lff.220.1623938952229;
        Thu, 17 Jun 2021 07:09:12 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm592471lfm.128.2021.06.17.07.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 07:09:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 2/7] drm/msm/dpu: don't clear IRQ register twice
Date:   Thu, 17 Jun 2021 17:09:03 +0300
Message-Id: <20210617140908.412298-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
References: <20210617140908.412298-1-dmitry.baryshkov@linaro.org>
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
index 8e890f981afd..17ad78d49948 100644
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

