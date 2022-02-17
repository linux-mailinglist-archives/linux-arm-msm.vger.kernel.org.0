Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA0B4B97BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 05:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233859AbiBQEcO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 23:32:14 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:36434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233867AbiBQEcN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 23:32:13 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2134245A8
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:31:57 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id j15so7639050lfe.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 20:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JSqX7u3LubRxGSWxyg4lAeG2HvIGpcdBGF8VpC9iRlY=;
        b=sqynsZoXAZ4jASk2csYD+Q9QmyZHHDCRuEq76GVaUgMBeAPB8JBeTwK+DdLmuV7+hb
         ScOING8RniR2NeaEXD+ckJSab3OXSlLuowkfs+SccVkKyMflaT1dXcPB4Id4NtoCWcPP
         mnNQ8A59A8IhBG882L81tx3M2lqKzRoZXH+WhM5a4iNx1+uQ9AhCpYY3BV44HzAtVp67
         CUOEwB4eIYpEciGJkPfRsAbWo+5ski6lOIGLOSoaEtk4ruhI3yX6ZK92MezC2JBa5DiB
         BVMH9tk0G1sIBDQrkHiG7My7rrWrVryeqfuExH1EN0jqBgzT6N7dE7OE8/ip1JUzosen
         IVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JSqX7u3LubRxGSWxyg4lAeG2HvIGpcdBGF8VpC9iRlY=;
        b=S8Wtzss12ajoRtr8g/87OFzFpNxJZMVPAGTpsch7QG5Ma6soTScSFCmznqP5EdzSHM
         pxt/iOwu8iLC5qiHwduzveoYcX0awY8+ceJr5T5sf9X/1OaD1L7OqE8Izznck3O2XvP9
         Rfjx8F4Kot/WFbC7YBc/l8722lG6CFWV3UVEujTgg8692IW0Yz/t5hHfMOHSWmzANIoH
         2pO0Err91SzXIHn87N2/GpfrDl9Zl8ZTO2VsiNc6vv5Ctdrkikg0P3QbzsLRMaGxzRBU
         fLmCnNxyMYHAFtzo9iTGQyIrTiSbd5YwvleARY6fIqr2dCKfRyM/FfBPdrUvBboRp4BX
         z6Bg==
X-Gm-Message-State: AOAM531BDEsK3KA0kwBSwheoN1CmQ7lHDNIBBSFs28mYBQcZ1Lqv1WXq
        L9M1zGCGAZjHg8WX5ixNU932NA==
X-Google-Smtp-Source: ABdhPJyMGy0+1a9kXqznzO9yqTCefcHN/VuiYNR6qwMB2knLqvDTQUwYU+zgldPUss54rBTpAJDzyQ==
X-Received: by 2002:a05:6512:4021:b0:443:150e:6984 with SMTP id br33-20020a056512402100b00443150e6984mr843984lfb.423.1645072314497;
        Wed, 16 Feb 2022 20:31:54 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l8sm1463391ljb.140.2022.02.16.20.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 20:31:53 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v3 6/6] drm/msm/dpu: pass irq to dpu_encoder_helper_wait_for_irq()
Date:   Thu, 17 Feb 2022 07:31:48 +0300
Message-Id: <20220217043148.480898-7-dmitry.baryshkov@linaro.org>
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
index 60f63a15a894..58b411fea7d7 100644
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

