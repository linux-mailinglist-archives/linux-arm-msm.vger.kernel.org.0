Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 00228721895
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 18:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbjFDQ2K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 12:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbjFDQ2J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 12:28:09 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 904FFDC
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 09:28:07 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b1b06af50eso27838191fa.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 09:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685896086; x=1688488086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/cqM9viGLTu192wkMsov0ajiNjj+NmmxiCOn9iYik4=;
        b=ZQr/SJnzBw4GJ1037RBft6IVlthK93fqC9cCzRRDk+6tKIggaOecfstBNDmtDPCaOK
         FdAn+nOs+WpxbgS6KFmL9AVDJ81wMDlAuTDtGGJ7C6ouu8lMN99kcJEZ6VFVpdEDORZY
         s1Ndv0fYNcqAmgUpBv9IDXGIXsRLyOWCALMHJEaXmsfWonfWaGQCTmpzl/ew/LOBT2xY
         DP9KnGk+a5Zw3+Pbl6A9q2x14X0wiAo0kRUL944u1ChO2BA639mI8zNGYgsA716JqD3C
         tSBhF/J5eGaUZ7ttTlizLWJeUOIvJG8VdxBMMCHUl5yh8IjSPmRwfr3JpCatiwpc91vJ
         P/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685896086; x=1688488086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/cqM9viGLTu192wkMsov0ajiNjj+NmmxiCOn9iYik4=;
        b=ZiRJp8pJHJ+Y3jmXpT0UNgha21JYQbWe1akhC4RNOnw9jddRfQDIxCcXZvmkPsPTij
         dnUeArdnpsl03+yW5nwxRabeRU/gXHfxE/zHwyDF4k/gOCCH56AUhov/ZR5N//MwpW82
         uKowjOMxLCab2FzUPIP+AAQu1aiSuZJiClyhsWJolV4XERUaw70jcN0j/DnBQRHs7J32
         BT1Zj25Po24/BOYE5Dt5jJw97dRBvbYjmUYH4uS461Io++5BkOa7QHmPTvT9C7G3FMrK
         TckIgzonUCL/Clf7auvmbXI21ulkGYIL9zBfwmN9UkN0Mnpi5fIokk5pGnF4V7eWUV0v
         C2ww==
X-Gm-Message-State: AC+VfDyCYBUlSRJDzRKCCO5MtKNLtcGkmuOLUV28iac9P6LjuBaYjOmU
        O+VWmfps8m3CDmmZ4/WGUbzZtA==
X-Google-Smtp-Source: ACHHUZ4Lox8qsngdtwvWe7KEHgFClGgkaSyNQiJ8jBQkx46A8dWTpU6cvSvK7q3wF3CNCS5L9ra3mw==
X-Received: by 2002:a19:a413:0:b0:4f6:2199:57b4 with SMTP id q19-20020a19a413000000b004f6219957b4mr1001377lfc.47.1685896085934;
        Sun, 04 Jun 2023 09:28:05 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id g14-20020a19ee0e000000b004f61a57797esm537975lfb.69.2023.06.04.09.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 09:28:05 -0700 (PDT)
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
Subject: [PATCH 6/8] drm/msm/dpu: move several IRQ-related defines
Date:   Sun,  4 Jun 2023 19:27:58 +0300
Message-Id: <20230604162800.1048327-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604162800.1048327-1-dmitry.baryshkov@linaro.org>
References: <20230604162800.1048327-1-dmitry.baryshkov@linaro.org>
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
index 9eeeb046db15..3bc0e6f704a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -178,8 +178,7 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 	},
 };
 
-#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
-#define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
+#define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_OFFSET(irq_idx)))
 
 /**
  * dpu_core_irq_callback_handler - dispatch core interrupts
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
index 06c7bedd5c0a..41f2dff7d689 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
@@ -42,6 +42,8 @@ enum dpu_hw_intr_reg {
 };
 
 #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
+#define DPU_IRQ_REG(irq_idx)		((irq_idx) / 32)
+#define DPU_IRQ_OFFSET(irq_idx)		((irq_idx) % 32)
 
 /**
  * struct dpu_hw_intr: hw interrupts handling data structure
-- 
2.39.2

