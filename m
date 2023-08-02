Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F21F76CA69
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Aug 2023 12:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbjHBKEx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Aug 2023 06:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234233AbjHBKEf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Aug 2023 06:04:35 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 116AD2698
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Aug 2023 03:04:34 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b9cdbf682eso82511341fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Aug 2023 03:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690970672; x=1691575472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WhndaM+0T2ibx3guEkNODdgDbXmk17SelDpd2vbCW1E=;
        b=fE6H/PJWLpqR8AlJmiZZLARmxIPrp2c3QvnahArFVumx0WpouH+hOm+qJ8vbh/aGS/
         SBMbHqrxsHpG1xNFtoOel5/pIYPoeOO9xQYHjwki9KhfxSfvmPH/Y6Pna+ETEW7HiUxa
         tsQEMypv7EcCruGVbM20ojcYUyWyWFB1NcbO1OnOuWwR5X/oodHmeEfsCUBdEP/ZLlwi
         Tq2VuZCcfa7EpE44u+ZqNa6lXGwBzhxdN/fVFVdA64dYXuwpwxRsEAM5UW1W+Ej0ETL2
         2pzh6VMBPVn1NJGFmqm35Y82GI0Zlnkpw4xOLApaA0yZDQ2aVPNoVyl4m6lg3Aey8u7u
         u9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690970672; x=1691575472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WhndaM+0T2ibx3guEkNODdgDbXmk17SelDpd2vbCW1E=;
        b=HbPUg78DTzn+UtZgZrmvEK3kEwNYVDcvIQJdL923BMPv1RK4wmfCf4lt7pqtrCVu/T
         v8IZTFmTP9RXL7rVhnrp6UwvryBY/3OpqderjZtjqqrodjx0U9fqtXrJJtG7Kllm0oUj
         c0Gu3rMhpZQjgNeqijlpMusA19SAw8u9VU96T6wEhyhC8AfXwTuX9JCGN//E6EPu7qu2
         6V5BnCjU6V09a2/WvUJmsOzfgPW0oYIyjQhH88yfMcX384PQQYr0ZhnMGJutg4x6tkVO
         GcuRSc54y7qKiolDfHO/oGiPHCV0UiZooAO4ahD4G6FRCEqSamjtumthKQXlcl53s6UT
         FSwg==
X-Gm-Message-State: ABy/qLboGjIKPzJcY+mcHBNpGzR5lNxni3/hzfcdWo39+uGakdkPlSfc
        zF7CvZaIRwMgPKE8g9cys1rDmw==
X-Google-Smtp-Source: APBJJlFWp9VOIyubf6hiJjJVBsLlHAV1wV6NpCL1FyZfLj0Mp/ViMf6Nte9YCARZZT0YfgU+D1o1Pg==
X-Received: by 2002:a05:6512:2388:b0:4fe:676:8c0b with SMTP id c8-20020a056512238800b004fe06768c0bmr5681644lfv.11.1690970672356;
        Wed, 02 Aug 2023 03:04:32 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p21-20020a19f015000000b004fbf5242e8bsm2402353lfc.231.2023.08.02.03.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 03:04:32 -0700 (PDT)
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
Subject: [PATCH v5 7/8] drm/msm/dpu: stop using raw IRQ indices in the kernel traces
Date:   Wed,  2 Aug 2023 13:04:25 +0300
Message-Id: <20230802100426.4184892-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
References: <20230802100426.4184892-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In preparation to reworking IRQ indcies, stop using raw indices in
kernel traces. Instead use a pair of register index and bit. This
corresponds closer to the values in HW catalog.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  8 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 72 +++++++++++--------
 3 files changed, 49 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index b464df7a2dcf..80b0dfd58226 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -413,7 +413,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 	} else {
 		ret = 0;
 		trace_dpu_enc_irq_wait_success(DRMID(phys_enc->parent),
-			func, irq_idx,
+			func, DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
 			phys_enc->hw_pp->idx - PINGPONG_0,
 			atomic_read(wait_info->atomic_cnt));
 	}
@@ -1554,7 +1554,9 @@ static int dpu_encoder_helper_wait_event_timeout(
 				atomic_read(info->atomic_cnt) == 0, jiffies);
 		time = ktime_to_ms(ktime_get());
 
-		trace_dpu_enc_wait_event_timeout(drm_id, irq_idx, rc, time,
+		trace_dpu_enc_wait_event_timeout(drm_id,
+						 DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx),
+						 rc, time,
 						 expected_time,
 						 atomic_read(info->atomic_cnt));
 	/* If we timed out, counter is valid and time is less, wait again */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index c413e9917d7e..f85558f257f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -546,7 +546,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 		return -EBUSY;
 	}
 
-	trace_dpu_core_irq_register_callback(irq_idx, irq_cb);
+	trace_dpu_core_irq_register_callback(DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx), irq_cb);
 	irq_entry->arg = irq_arg;
 	irq_entry->cb = irq_cb;
 
@@ -558,7 +558,7 @@ int dpu_core_irq_register_callback(struct dpu_kms *dpu_kms, int irq_idx,
 			  DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
-	trace_dpu_irq_register_success(irq_idx);
+	trace_dpu_irq_register_success(DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	return 0;
 }
@@ -579,7 +579,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 	     DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	spin_lock_irqsave(&dpu_kms->hw_intr->irq_lock, irq_flags);
-	trace_dpu_core_irq_unregister_callback(irq_idx);
+	trace_dpu_core_irq_unregister_callback(DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	ret = dpu_hw_intr_disable_irq_locked(dpu_kms->hw_intr, irq_idx);
 	if (ret)
@@ -592,7 +592,7 @@ int dpu_core_irq_unregister_callback(struct dpu_kms *dpu_kms, int irq_idx)
 
 	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
 
-	trace_dpu_irq_unregister_success(irq_idx);
+	trace_dpu_irq_unregister_success(DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 1a92d21094f4..b64bd8eba26c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -168,46 +168,50 @@ TRACE_EVENT(dpu_perf_crtc_update,
 );
 
 DECLARE_EVENT_CLASS(dpu_irq_template,
-	TP_PROTO(int irq_idx),
-	TP_ARGS(irq_idx),
+	TP_PROTO(unsigned int irq_reg, unsigned int irq_bit),
+	TP_ARGS(irq_reg, irq_bit),
 	TP_STRUCT__entry(
-		__field(	int,			irq_idx		)
+		__field(	unsigned int,		irq_reg		)
+		__field(	unsigned int,		irq_bit		)
 	),
 	TP_fast_assign(
-		__entry->irq_idx = irq_idx;
+		__entry->irq_reg = irq_reg;
+		__entry->irq_bit = irq_bit;
 	),
-	TP_printk("irq=%d", __entry->irq_idx)
+	TP_printk("IRQ=[%d, %d]", __entry->irq_reg, __entry->irq_bit)
 );
 DEFINE_EVENT(dpu_irq_template, dpu_irq_register_success,
-	TP_PROTO(int irq_idx),
-	TP_ARGS(irq_idx)
+	TP_PROTO(unsigned int irq_reg, unsigned int irq_bit),
+	TP_ARGS(irq_reg, irq_bit)
 );
 DEFINE_EVENT(dpu_irq_template, dpu_irq_unregister_success,
-	TP_PROTO(int irq_idx),
-	TP_ARGS(irq_idx)
+	TP_PROTO(unsigned int irq_reg, unsigned int irq_bit),
+	TP_ARGS(irq_reg, irq_bit)
 );
 
 TRACE_EVENT(dpu_enc_irq_wait_success,
 	TP_PROTO(uint32_t drm_id, void *func,
-		 int irq_idx, enum dpu_pingpong pp_idx, int atomic_cnt),
-	TP_ARGS(drm_id, func, irq_idx, pp_idx, atomic_cnt),
+		 unsigned int irq_reg, unsigned int irq_bit, enum dpu_pingpong pp_idx, int atomic_cnt),
+	TP_ARGS(drm_id, func, irq_reg, irq_bit, pp_idx, atomic_cnt),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		drm_id		)
 		__field(	void *,			func		)
-		__field(	int,			irq_idx		)
+		__field(	unsigned int,		irq_reg		)
+		__field(	unsigned int,		irq_bit		)
 		__field(	enum dpu_pingpong,	pp_idx		)
 		__field(	int,			atomic_cnt	)
 	),
 	TP_fast_assign(
 		__entry->drm_id = drm_id;
 		__entry->func = func;
-		__entry->irq_idx = irq_idx;
+		__entry->irq_reg = irq_reg;
+		__entry->irq_bit = irq_bit;
 		__entry->pp_idx = pp_idx;
 		__entry->atomic_cnt = atomic_cnt;
 	),
-	TP_printk("id=%u, callback=%ps, irq=%d, pp=%d, atomic_cnt=%d",
+	TP_printk("id=%u, callback=%ps, IRQ=[%d, %d], pp=%d, atomic_cnt=%d",
 		  __entry->drm_id, __entry->func,
-		  __entry->irq_idx, __entry->pp_idx, __entry->atomic_cnt)
+		  __entry->irq_reg, __entry->irq_bit, __entry->pp_idx, __entry->atomic_cnt)
 );
 
 DECLARE_EVENT_CLASS(dpu_drm_obj_template,
@@ -507,12 +511,13 @@ DEFINE_EVENT(dpu_id_event_template, dpu_crtc_frame_event_more_pending,
 );
 
 TRACE_EVENT(dpu_enc_wait_event_timeout,
-	TP_PROTO(uint32_t drm_id, int irq_idx, int rc, s64 time,
+	TP_PROTO(uint32_t drm_id, unsigned int irq_reg, unsigned int irq_bit, int rc, s64 time,
 		 s64 expected_time, int atomic_cnt),
-	TP_ARGS(drm_id, irq_idx, rc, time, expected_time, atomic_cnt),
+	TP_ARGS(drm_id, irq_reg, irq_bit, rc, time, expected_time, atomic_cnt),
 	TP_STRUCT__entry(
 		__field(	uint32_t,	drm_id		)
-		__field(	int,		irq_idx		)
+		__field(	unsigned int,	irq_reg		)
+		__field(	unsigned int,	irq_bit		)
 		__field(	int,		rc		)
 		__field(	s64,		time		)
 		__field(	s64,		expected_time	)
@@ -520,14 +525,15 @@ TRACE_EVENT(dpu_enc_wait_event_timeout,
 	),
 	TP_fast_assign(
 		__entry->drm_id = drm_id;
-		__entry->irq_idx = irq_idx;
+		__entry->irq_reg = irq_reg;
+		__entry->irq_bit = irq_bit;
 		__entry->rc = rc;
 		__entry->time = time;
 		__entry->expected_time = expected_time;
 		__entry->atomic_cnt = atomic_cnt;
 	),
-	TP_printk("id=%u, irq_idx=%d, rc=%d, time=%lld, expected=%lld cnt=%d",
-		  __entry->drm_id, __entry->irq_idx, __entry->rc, __entry->time,
+	TP_printk("id=%u, IRQ=[%d, %d], rc=%d, time=%lld, expected=%lld cnt=%d",
+		  __entry->drm_id, __entry->irq_reg, __entry->irq_bit, __entry->rc, __entry->time,
 		  __entry->expected_time, __entry->atomic_cnt)
 );
 
@@ -886,30 +892,34 @@ TRACE_EVENT(dpu_intf_connect_ext_te,
 );
 
 TRACE_EVENT(dpu_core_irq_register_callback,
-	TP_PROTO(int irq_idx, void *callback),
-	TP_ARGS(irq_idx, callback),
+	TP_PROTO(unsigned int irq_reg, unsigned int irq_bit, void *callback),
+	TP_ARGS(irq_reg, irq_bit, callback),
 	TP_STRUCT__entry(
-		__field(	int,				irq_idx	)
+		__field(	unsigned int,			irq_reg	)
+		__field(	unsigned int,			irq_bit	)
 		__field(	void *,				callback)
 	),
 	TP_fast_assign(
-		__entry->irq_idx = irq_idx;
+		__entry->irq_reg = irq_reg;
+		__entry->irq_bit = irq_bit;
 		__entry->callback = callback;
 	),
-	TP_printk("irq_idx:%d callback:%ps", __entry->irq_idx,
+	TP_printk("IRQ=[%d, %d] callback:%ps", __entry->irq_reg, __entry->irq_bit,
 		  __entry->callback)
 );
 
 TRACE_EVENT(dpu_core_irq_unregister_callback,
-	TP_PROTO(int irq_idx),
-	TP_ARGS(irq_idx),
+	TP_PROTO(unsigned int irq_reg, unsigned int irq_bit),
+	TP_ARGS(irq_reg, irq_bit),
 	TP_STRUCT__entry(
-		__field(	int,				irq_idx	)
+		__field(	unsigned int,			irq_reg	)
+		__field(	unsigned int,			irq_bit	)
 	),
 	TP_fast_assign(
-		__entry->irq_idx = irq_idx;
+		__entry->irq_reg = irq_reg;
+		__entry->irq_bit = irq_bit;
 	),
-	TP_printk("irq_idx:%d", __entry->irq_idx)
+	TP_printk("IRQ=[%d, %d]", __entry->irq_reg, __entry->irq_bit)
 );
 
 TRACE_EVENT(dpu_core_perf_update_clk,
-- 
2.39.2

