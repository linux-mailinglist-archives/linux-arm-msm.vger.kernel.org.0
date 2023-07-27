Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6A8C7656CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 17:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234286AbjG0PFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 11:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234238AbjG0PFP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 11:05:15 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D8122D70
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 08:05:01 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-98de21518fbso142766866b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 08:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690470299; x=1691075099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znblpuRy3gZou2cx35uTcthh3ry6mTJP1E2s5bnB1uo=;
        b=g5uasyJk2efqx40d3W7Wxitt4aN614ferr2JlR3TLvc0zcPMnaiwYWXaUFR3eboGDB
         TlNURqQekQ7yau1hidoTmd5frqo2scXAMmdg2vOAo79OuB6rYRA0G4DgbOUkrHYjz1as
         wNLnVxvbUreIIMqML2rSng8lQzCksSR5nKPFZfSu7lu/9Cjka/fD+cBoLM137R27It9a
         4FRQmL1hH8HkuWwIrJgbI1wQyBwO2bcSSG3qlPVKrmMg4bRS//VLd8AMcYxjg97relim
         JKWrjb2FXW9a1BSTUDx+xmdr8FzQY1c+ALRouGsxWYoIOsLs72qd8PygOBn2zoQLuKA8
         /uJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690470299; x=1691075099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=znblpuRy3gZou2cx35uTcthh3ry6mTJP1E2s5bnB1uo=;
        b=kptUCwlidmHTa89lrQ1i4mAlsCtLNPF8ZpgC51bnZ1LgkiL8ES2IXKgpAkSOfl+tlU
         VFpWMYt+5FC7nKcgCexIidmmOKK0PZtUlla9ZsOLc7w2bMR1gdgh+IdPZXN3vjUNAuGz
         Q9r2HxIdFYkIwLMiFUQlu7c27laNz4NXEvCqgWE5IRMa4WKtwcpEaEDAFRw+ILHm/q6F
         xqct87Hyo/z7H+SscPtPc+M0y3clMK2UNtXE2wbSeCIz74TVj/k9E4chu3p3nvGzO3sA
         I9OP9Dd4wHvkJsae+ATfEGyce+ZVSTbEwLAYPlWyGrvQjhSLpAwx4+ShGjFXDCA9fejT
         LNGw==
X-Gm-Message-State: ABy/qLYtrnt0UJGjUPfxalZopqW9TVEsM7lgeKYIAj9dY0XBHBl7T7Wh
        Lb6+F88jZpCa7fgMG+b5gcQHGA==
X-Google-Smtp-Source: APBJJlEq2OTOISI/OGf6Yw57VSvpZajPAa5e6l34/L2S7Z732SwvD0nraHFeA361clercDFTfyPA5g==
X-Received: by 2002:a17:906:3118:b0:994:555a:e49f with SMTP id 24-20020a170906311800b00994555ae49fmr2126869ejx.31.1690470299513;
        Thu, 27 Jul 2023 08:04:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id jp21-20020a170906f75500b00992e94bcfabsm857195ejb.167.2023.07.27.08.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 08:04:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/msm/dpu: move several IRQ-related defines
Date:   Thu, 27 Jul 2023 18:04:53 +0300
Message-Id: <20230727150455.1489575-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
References: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
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

In preparation of slighly changing IRQ numbering, move DPU_IRQ_REG()
macro to the dpu_hw_interrupts.h header. Also split the DPU_IRQ_MASK()
macro into local DPU_IRQ_MASK() and the global DPU_IRQ_OFFSET() macros.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 01a9ccfcd54b..eaae7f11f57f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -197,8 +197,7 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 	},
 };
 
-#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
-#define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
+#define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_OFFSET(irq_idx)))
 
 /**
  * dpu_core_irq_callback_handler - dispatch core interrupts
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index e2b00dd32619..3a988a4e4f33 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -37,6 +37,8 @@ enum dpu_hw_intr_reg {
 #define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
 
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
+#define DPU_IRQ_REG(irq_idx)		((irq_idx) / 32)
+#define DPU_IRQ_OFFSET(irq_idx)		((irq_idx) % 32)
 
 /**
  * struct dpu_hw_intr: hw interrupts handling data structure
-- 
2.39.2

