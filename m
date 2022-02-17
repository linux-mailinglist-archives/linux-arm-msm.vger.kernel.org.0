Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCF544B978A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 05:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbiBQEQl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 23:16:41 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233645AbiBQEQk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 23:16:40 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEA822A4176
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:16:25 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id d23so7581440lfv.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EzadT20Zr/ZeW8r5rp9uo3p4E6QU5UVyLrZNjA9gwg4=;
        b=EO9cj//M/kr+RvxJJFnilgXVFWWakFlX7R4LyCM03+ZicKVd5mUR//7dO5Ag7L0XDM
         wiy8yxjzqGG9F+woeRnUH73vWjPiVLpvByG6ANvZnBt5KaZhZMvkFY6VNjEMBXhcz3lZ
         UBLeR6fcHOlP/ReRvRj8gtcE+yvWEPrGPJxy2hh2Z/9b26YqNV0vD9hhZfeRWTkAMcTf
         j+WkemKHVBeT3a+cVZtM2qC9S8pyUdrmkFOFQn2mnR3YtjEf9bRhJBzDtcQ8LCwMWzp1
         bJmiI+LZa4LMAyqd93Xt4aV16QwyA4dGAJ7uegeQzsZnKmchKaQfquckQNlq4j9u6RGs
         Kakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EzadT20Zr/ZeW8r5rp9uo3p4E6QU5UVyLrZNjA9gwg4=;
        b=sJa9MqeD5mfUam2u/MqrhyxB7dayxSZl7HWI9rLVwRhQ0edezujXS6sqw+JiIL4NFa
         cOngAK1EoaEFfZhyNBDSIB0YpXNe2CY1EocjcUy81zlqEu8RNC6gx6rTkRghuKmDMawf
         veGt0ztoJTXr8SeL9VCBOw5t+N4falsEKXihmygi6wpyugCVeXfu1pEi+Y0KvtWJsKoz
         KMrxNUDV5FGboMtTRBST15NxBG1qkEmP+SAsv9NH3+pxgw+iyPuVRTLnxyCKUrSWiRl+
         mR5YBDd8r6KLVcydIBaXVc649f3RKbjE21/G0KPjMmnC6gbLrMYuC/wqIloWW8xvrRCp
         4frg==
X-Gm-Message-State: AOAM5316sJ6FAWvJQdHm2u5riBI7qbr0Xy3tYp3yxSU7Y8u7LLav3T3q
        w6XWnJDHrjHQnea9slE7HjUdelxKi9QT+A==
X-Google-Smtp-Source: ABdhPJzysRSG+1h4phNAEZZmBJ9g4SZzIz5N3fFfw2/HCkiSZ4BI7QPD9ugdDfbEQ8iPvnQimoLgqA==
X-Received: by 2002:ac2:5478:0:b0:443:6754:acca with SMTP id e24-20020ac25478000000b004436754accamr876581lfn.51.1645071384048;
        Wed, 16 Feb 2022 20:16:24 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k16sm2452349ljg.25.2022.02.16.20.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 20:16:23 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/msm/dpu: pass irq to dpu_encoder_helper_wait_for_irq()
Date:   Thu, 17 Feb 2022 07:16:17 +0300
Message-Id: <20220217041617.470875-7-dmitry.baryshkov@linaro.org>
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

Pass IRQ number directly rather than passing an index in the dpu_encoder's irq table.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 29 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  4 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  9 ++++--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 12 ++++----
 5 files changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 83b6715820fa..4c9e7c4fa14b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -260,38 +260,35 @@ static int dpu_encoder_helper_wait_event_timeout(int32_t drm_id,
 		u32 irq_idx, struct dpu_encoder_wait_info *info);
 
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
-		enum dpu_intr_idx intr_idx,
+		int irq,
 		void (*func)(void *arg, int irq_idx),
 		struct dpu_encoder_wait_info *wait_info)
 {
-	int irq;
 	u32 irq_status;
 	int ret;
 
-	if (!wait_info || intr_idx >= INTR_IDX_MAX) {
+	if (!wait_info) {
 		DPU_ERROR("invalid params\n");
 		return -EINVAL;
 	}
-	irq = phys_enc->irq[intr_idx];
-
 	/* note: do master / slave checking outside */
 
 	/* return EWOULDBLOCK since we know the wait isn't necessary */
 	if (phys_enc->enable_state == DPU_ENC_DISABLED) {
-		DRM_ERROR("encoder is disabled id=%u, intr=%d, irq=%d\n",
-			  DRMID(phys_enc->parent), intr_idx,
+		DRM_ERROR("encoder is disabled id=%u, callback=%ps, irq=%d\n",
+			  DRMID(phys_enc->parent), func,
 			  irq);
 		return -EWOULDBLOCK;
 	}
 
 	if (irq < 0) {
-		DRM_DEBUG_KMS("skip irq wait id=%u, intr=%d\n",
-			      DRMID(phys_enc->parent), intr_idx);
+		DRM_DEBUG_KMS("skip irq wait id=%u, callback=%ps\n",
+			      DRMID(phys_enc->parent), func);
 		return 0;
 	}
 
-	DRM_DEBUG_KMS("id=%u, intr=%d, irq=%d, pp=%d, pending_cnt=%d\n",
-		      DRMID(phys_enc->parent), intr_idx,
+	DRM_DEBUG_KMS("id=%u, callback=%ps, irq=%d, pp=%d, pending_cnt=%d\n",
+		      DRMID(phys_enc->parent), func,
 		      irq, phys_enc->hw_pp->idx - PINGPONG_0,
 		      atomic_read(wait_info->atomic_cnt));
 
@@ -305,8 +302,8 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 		if (irq_status) {
 			unsigned long flags;
 
-			DRM_DEBUG_KMS("irq not triggered id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
-				      DRMID(phys_enc->parent), intr_idx,
+			DRM_DEBUG_KMS("irq not triggered id=%u, callback=%ps, irq=%d, pp=%d, atomic_cnt=%d\n",
+				      DRMID(phys_enc->parent), func,
 				      irq,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
 				      atomic_read(wait_info->atomic_cnt));
@@ -316,8 +313,8 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 			ret = 0;
 		} else {
 			ret = -ETIMEDOUT;
-			DRM_DEBUG_KMS("irq timeout id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d\n",
-				      DRMID(phys_enc->parent), intr_idx,
+			DRM_DEBUG_KMS("irq timeout id=%u, callback=%ps, irq=%d, pp=%d, atomic_cnt=%d\n",
+				      DRMID(phys_enc->parent), func,
 				      irq,
 				      phys_enc->hw_pp->idx - PINGPONG_0,
 				      atomic_read(wait_info->atomic_cnt));
@@ -325,7 +322,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 	} else {
 		ret = 0;
 		trace_dpu_enc_irq_wait_success(DRMID(phys_enc->parent),
-			intr_idx, irq,
+			func, irq,
 			phys_enc->hw_pp->idx - PINGPONG_0,
 			atomic_read(wait_info->atomic_cnt));
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 803fd6f25da1..9843acdc33bd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -341,13 +341,13 @@ void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
  * dpu_encoder_helper_wait_for_irq - utility to wait on an irq.
  *	note: will call dpu_encoder_helper_wait_for_irq on timeout
  * @phys_enc: Pointer to physical encoder structure
- * @intr_idx: encoder interrupt index
+ * @irq: IRQ index
  * @func: IRQ callback to be called in case of timeout
  * @wait_info: wait info struct
  * @Return: 0 or -ERROR
  */
 int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
-		enum dpu_intr_idx intr_idx,
+		int irq,
 		void (*func)(void *arg, int irq_idx),
 		struct dpu_encoder_wait_info *wait_info);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 7f5b7f0fff2e..8bc3fdbe4821 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -234,7 +234,8 @@ static int _dpu_encoder_phys_cmd_wait_for_idle(
 	wait_info.atomic_cnt = &phys_enc->pending_kickoff_cnt;
 	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
 
-	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_PINGPONG,
+	ret = dpu_encoder_helper_wait_for_irq(phys_enc,
+			phys_enc->irq[INTR_IDX_PINGPONG],
 			dpu_encoder_phys_cmd_pp_tx_done_irq,
 			&wait_info);
 	if (ret == -ETIMEDOUT)
@@ -659,7 +660,8 @@ static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
 	wait_info.atomic_cnt = &phys_enc->pending_ctlstart_cnt;
 	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
 
-	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_CTL_START,
+	ret = dpu_encoder_helper_wait_for_irq(phys_enc,
+			phys_enc->irq[INTR_IDX_CTL_START],
 			dpu_encoder_phys_cmd_ctl_start_irq,
 			&wait_info);
 	if (ret == -ETIMEDOUT) {
@@ -715,7 +717,8 @@ static int dpu_encoder_phys_cmd_wait_for_vblank(
 
 	atomic_inc(&cmd_enc->pending_vblank_cnt);
 
-	rc = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_RDPTR,
+	rc = dpu_encoder_helper_wait_for_irq(phys_enc,
+			phys_enc->irq[INTR_IDX_RDPTR],
 			dpu_encoder_phys_cmd_pp_rd_ptr_irq,
 			&wait_info);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 1a319d56c879..f262e59d5f5c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -486,7 +486,8 @@ static int dpu_encoder_phys_vid_wait_for_vblank(
 	}
 
 	/* Wait for kickoff to complete */
-	ret = dpu_encoder_helper_wait_for_irq(phys_enc, INTR_IDX_VSYNC,
+	ret = dpu_encoder_helper_wait_for_irq(phys_enc,
+			phys_enc->irq[INTR_IDX_VSYNC],
 			dpu_encoder_phys_vid_vblank_irq,
 			&wait_info);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 95b449a6e349..eab6c2e06fe6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -188,25 +188,25 @@ DEFINE_EVENT(dpu_irq_template, dpu_irq_unregister_success,
 );
 
 TRACE_EVENT(dpu_enc_irq_wait_success,
-	TP_PROTO(uint32_t drm_id, enum dpu_intr_idx intr_idx,
+	TP_PROTO(uint32_t drm_id, void *func,
 		 int irq_idx, enum dpu_pingpong pp_idx, int atomic_cnt),
-	TP_ARGS(drm_id, intr_idx, irq_idx, pp_idx, atomic_cnt),
+	TP_ARGS(drm_id, func, irq_idx, pp_idx, atomic_cnt),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		drm_id		)
-		__field(	enum dpu_intr_idx,	intr_idx	)
+		__field(	void *,			func		)
 		__field(	int,			irq_idx		)
 		__field(	enum dpu_pingpong,	pp_idx		)
 		__field(	int,			atomic_cnt	)
 	),
 	TP_fast_assign(
 		__entry->drm_id = drm_id;
-		__entry->intr_idx = intr_idx;
+		__entry->func = func;
 		__entry->irq_idx = irq_idx;
 		__entry->pp_idx = pp_idx;
 		__entry->atomic_cnt = atomic_cnt;
 	),
-	TP_printk("id=%u, intr=%d, irq=%d, pp=%d, atomic_cnt=%d",
-		  __entry->drm_id, __entry->intr_idx,
+	TP_printk("id=%u, callback=%ps, irq=%d, pp=%d, atomic_cnt=%d",
+		  __entry->drm_id, __entry->func,
 		  __entry->irq_idx, __entry->pp_idx, __entry->atomic_cnt)
 );
 
-- 
2.34.1

