Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0CA957C52B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Oct 2023 13:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346466AbjJKL7m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Oct 2023 07:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346239AbjJKL7k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Oct 2023 07:59:40 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9944DA4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 04:59:37 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32157c8e4c7so6631428f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Oct 2023 04:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697025576; x=1697630376; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MmPmJm3CNDevihUD4M8cGm9Cm5AhD5l9ZhiqHeM+WY=;
        b=wP20SK5qWduJTNmfGGSM7ah+VzNI3eRwdphRK7nW2G8LELDRMTZLcHB6mKEw3P4xRd
         uH2MZ8gU4ebfX4vjXo64upVZY7IUhaRx7jQKvTJljUku5RLx3cSNTsRpRWzqj22IOT9w
         z0CFty+a1bL/qbRQk9uSRr8xMP+dZT6Lyrq9cfiPu+pq3CJ0/syV2UjDSj50rKpbxzo5
         QLBw3uMgMSRSd9gEId8DMOmAZdmApei/oCNRz/297Xddz1yFuwZ8H9QCCum/4PIUJZ3Y
         ji/pdElIJCaXIwdQ3Wx1r107tejFKRbb2pDDQWxA7VWHtGS9AIBFrxn59H0eUbUebGYp
         UoZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697025576; x=1697630376;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4MmPmJm3CNDevihUD4M8cGm9Cm5AhD5l9ZhiqHeM+WY=;
        b=iIjcibc9oWxKOnplWPEB6Y1tgKyrarKlGlFM4RQC9AxR6dF7JycE8gRcUuSw7AdBqc
         AZym9fGMquB0PsrzqRoXy6+2dDbkxxiq4BMT6JfPpvI+SPWWejNrYonPnQvBpyf7oXhT
         6206e7WP8lU4JvcLjVKPtaVvMcw9EqUKEKCJGeLSd2X96Z/UfWdcDLMQid1WVNtrFmbP
         bp0PsLnW8hpl2tGbHVs0yE7Ia4D1zcTPTTAd+T0kReJSSriwgozDxNIdAg6lYR2yCEIR
         mj06eliEz89NPQAADt6oMf0UKv/2jDDi1EL2Lcbm97IWCNlTvIxmShsu1mIDBRgsOwVz
         yC/w==
X-Gm-Message-State: AOJu0YzKheYQAKg3T24BV6kV9C8bUhXUynHlbFDctPDAsCGTBFgoM0he
        cY9CXJHO2M1eze2DTyZb+z6NzQ==
X-Google-Smtp-Source: AGHT+IEUnLDzqmJZX2y+yJAGUiVYZBdrkPdtkGA3TeKJqeL3DE7scV0GQzMV/mqzBt6IQs7lfFPsEg==
X-Received: by 2002:adf:f209:0:b0:321:63d4:55ca with SMTP id p9-20020adff209000000b0032163d455camr18936859wro.26.1697025576047;
        Wed, 11 Oct 2023 04:59:36 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id x11-20020adff0cb000000b00323293bd023sm15447805wro.6.2023.10.11.04.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:59:35 -0700 (PDT)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Wed, 11 Oct 2023 13:59:23 +0200
Subject: [PATCH v2 3/5] drm/msm/dpu: move setup_force_clk_ctrl handling
 into plane and wb
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-3-b219c945df53@linaro.org>
References: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
In-Reply-To: <20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10451;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=HtIDaw7w6wxE1J7gdFb3Ge/o1wu0CTG0MyAas5iv70o=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlJo4isHNXPKPzVHwLx8pf/FrdUALcKe1mHaapaGnu
 WLQrJXyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZSaOIgAKCRB33NvayMhJ0XMmD/
 9taDYCxB3aeUGurmdaLaj5/7N5e7iEr++LB67osy63Cr9Lp+ili5gs6Eo4GNQEphKuUBMRZOWxComE
 57CCGx5Aw/Zwc4sSEmh12UywWdQkJiHc693hT8gur2ExsyjiUfDJpfs66+HPt73ynnsnMLsszYI0wz
 lZEo7INBawTa020/d/YNUq1SZRZllhmUy1RUy5zCETnxNPpXFlg4epPm0pth2O5SZBMwtz8sRdXAIQ
 7LMahpDPQ7BKejNltOiilcifGTCZRLNteE2nNJO0FiJUNsBLSBUlRtQWaf3g+shQoRh0pcRTYqfJxP
 DcckH1iQSQRhKoJyzgzaHsxQKN5GvikCOgR2HyISlHMZAieQzaqsHHLuAkpfIQBZSEcqaqlbwrVl/9
 cluxuSf2PpEgL6oWEWR/9DGw6yVtCk0KK9diSKyzMGg0+PgBirAQSR9eT4gGDG8wc7R49CqQMevK9r
 B2pBXvFsiY/u4C4ldQXK2MCfh1WyFonIQhqwzFGZrfwqSj2iJjtKvSH5SBPUqwuLSddK5c+keJ/5VA
 tKtqdM9R1pmeP0lMYb0l9qzLd8z4dZ3ImEMErfxH5nTOCo2jLCbisZY0XdpCneNxAPMo4Jts2FefsB
 GsI3qRQTU9RkG0cCsbGIeCpwFx/Hot6JaaFAZUXkDV0zwYRHqBki3ThkVKAA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now SSPP and WB can have setup_force_clk_ctrl() ops, it's simpler to call
them from the plane and wb code and call into the mdp ops if not present.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 37 +++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 42 +++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           | 30 +++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           |  4 ---
 4 files changed, 77 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 78037a697633..8802e007f8e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -34,6 +34,23 @@ static bool dpu_encoder_phys_wb_is_master(struct dpu_encoder_phys *phys_enc)
 	return true;
 }
 
+static bool _dpu_encoder_phys_wb_clk_force_ctrl(struct dpu_hw_wb *wb,
+						struct dpu_hw_mdp *mdp,
+						bool enable, bool *forced_on)
+{
+	if (wb->ops.setup_clk_force_ctrl) {
+		*forced_on = wb->ops.setup_clk_force_ctrl(wb, enable);
+		return true;
+	}
+
+	if (mdp->ops.setup_clk_force_ctrl) {
+		*forced_on = mdp->ops.setup_clk_force_ctrl(mdp, wb->caps->clk_ctrl, enable);
+		return true;
+	}
+
+	return false;
+}
+
 /**
  * dpu_encoder_phys_wb_set_ot_limit - set OT limit for writeback interface
  * @phys_enc:	Pointer to physical encoder
@@ -43,6 +60,7 @@ static void dpu_encoder_phys_wb_set_ot_limit(
 {
 	struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
 	struct dpu_vbif_set_ot_params ot_params;
+	bool forced_on = false;
 
 	memset(&ot_params, 0, sizeof(ot_params));
 	ot_params.xin_id = hw_wb->caps->xin_id;
@@ -52,10 +70,17 @@ static void dpu_encoder_phys_wb_set_ot_limit(
 	ot_params.is_wfd = true;
 	ot_params.frame_rate = drm_mode_vrefresh(&phys_enc->cached_mode);
 	ot_params.vbif_idx = hw_wb->caps->vbif_idx;
-	ot_params.clk_ctrl = hw_wb->caps->clk_ctrl;
 	ot_params.rd = false;
 
+	if (!_dpu_encoder_phys_wb_clk_force_ctrl(hw_wb, phys_enc->dpu_kms->hw_mdp,
+						 true, &forced_on))
+		return;
+
 	dpu_vbif_set_ot_limit(phys_enc->dpu_kms, &ot_params);
+
+	if (forced_on)
+		_dpu_encoder_phys_wb_clk_force_ctrl(hw_wb, phys_enc->dpu_kms->hw_mdp,
+						    false, &forced_on);
 }
 
 /**
@@ -67,6 +92,7 @@ static void dpu_encoder_phys_wb_set_qos_remap(
 {
 	struct dpu_hw_wb *hw_wb;
 	struct dpu_vbif_set_qos_params qos_params;
+	bool forced_on = false;
 
 	if (!phys_enc || !phys_enc->parent || !phys_enc->parent->crtc) {
 		DPU_ERROR("invalid arguments\n");
@@ -83,7 +109,6 @@ static void dpu_encoder_phys_wb_set_qos_remap(
 	memset(&qos_params, 0, sizeof(qos_params));
 	qos_params.vbif_idx = hw_wb->caps->vbif_idx;
 	qos_params.xin_id = hw_wb->caps->xin_id;
-	qos_params.clk_ctrl = hw_wb->caps->clk_ctrl;
 	qos_params.num = hw_wb->idx - WB_0;
 	qos_params.is_rt = false;
 
@@ -92,7 +117,15 @@ static void dpu_encoder_phys_wb_set_qos_remap(
 			qos_params.vbif_idx,
 			qos_params.xin_id, qos_params.is_rt);
 
+	if (!_dpu_encoder_phys_wb_clk_force_ctrl(hw_wb, phys_enc->dpu_kms->hw_mdp,
+						 true, &forced_on))
+		return;
+
 	dpu_vbif_set_qos_remap(phys_enc->dpu_kms, &qos_params);
+
+	if (forced_on)
+		_dpu_encoder_phys_wb_clk_force_ctrl(hw_wb, phys_enc->dpu_kms->hw_mdp,
+						    false, &forced_on);
 }
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c2aaaded07ed..c63cae8fb35c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -333,6 +333,23 @@ static void _dpu_plane_set_qos_ctrl(struct drm_plane *plane,
 				       enable);
 }
 
+static bool _dpu_plane_sspp_clk_force_ctrl(struct dpu_hw_sspp *sspp,
+					   struct dpu_hw_mdp *mdp,
+					   bool enable, bool *forced_on)
+{
+	if (sspp->ops.setup_clk_force_ctrl) {
+		*forced_on = sspp->ops.setup_clk_force_ctrl(sspp, enable);
+		return true;
+	}
+
+	if (mdp->ops.setup_clk_force_ctrl) {
+		*forced_on = mdp->ops.setup_clk_force_ctrl(mdp, sspp->cap->clk_ctrl, enable);
+		return true;
+	}
+
+	return false;
+}
+
 /**
  * _dpu_plane_set_ot_limit - set OT limit for the given plane
  * @plane:		Pointer to drm plane
@@ -348,6 +365,7 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_vbif_set_ot_params ot_params;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	bool forced_on = false;
 
 	memset(&ot_params, 0, sizeof(ot_params));
 	ot_params.xin_id = pipe->sspp->cap->xin_id;
@@ -357,10 +375,17 @@ static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
 	ot_params.is_wfd = !pdpu->is_rt_pipe;
 	ot_params.frame_rate = frame_rate;
 	ot_params.vbif_idx = VBIF_RT;
-	ot_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
 	ot_params.rd = true;
 
+	if (!_dpu_plane_sspp_clk_force_ctrl(pipe->sspp, dpu_kms->hw_mdp,
+					    true, &forced_on))
+		return;
+
 	dpu_vbif_set_ot_limit(dpu_kms, &ot_params);
+
+	if (forced_on)
+		_dpu_plane_sspp_clk_force_ctrl(pipe->sspp, dpu_kms->hw_mdp,
+					       false, &forced_on);
 }
 
 /**
@@ -374,21 +399,28 @@ static void _dpu_plane_set_qos_remap(struct drm_plane *plane,
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_vbif_set_qos_params qos_params;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	bool forced_on = false;
 
 	memset(&qos_params, 0, sizeof(qos_params));
 	qos_params.vbif_idx = VBIF_RT;
-	qos_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
 	qos_params.xin_id = pipe->sspp->cap->xin_id;
 	qos_params.num = pipe->sspp->idx - SSPP_VIG0;
 	qos_params.is_rt = pdpu->is_rt_pipe;
 
-	DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d, clk_ctrl:%d\n",
+	DPU_DEBUG_PLANE(pdpu, "pipe:%d vbif:%d xin:%d rt:%d\n",
 			qos_params.num,
 			qos_params.vbif_idx,
-			qos_params.xin_id, qos_params.is_rt,
-			qos_params.clk_ctrl);
+			qos_params.xin_id, qos_params.is_rt);
+
+	if (!_dpu_plane_sspp_clk_force_ctrl(pipe->sspp, dpu_kms->hw_mdp,
+					    true, &forced_on))
+		return;
 
 	dpu_vbif_set_qos_remap(dpu_kms, &qos_params);
+
+	if (forced_on)
+		_dpu_plane_sspp_clk_force_ctrl(pipe->sspp, dpu_kms->hw_mdp,
+					       false, &forced_on);
 }
 
 static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 1305e250b71e..47c02b98eac3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -169,23 +169,16 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 		struct dpu_vbif_set_ot_params *params)
 {
 	struct dpu_hw_vbif *vbif;
-	struct dpu_hw_mdp *mdp;
-	bool forced_on = false;
 	u32 ot_lim;
 	int ret;
 
-	mdp = dpu_kms->hw_mdp;
-
 	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
-	if (!vbif || !mdp) {
-		DRM_DEBUG_ATOMIC("invalid arguments vbif %d mdp %d\n",
-				vbif != NULL, mdp != NULL);
+	if (!vbif) {
+		DRM_DEBUG_ATOMIC("invalid arguments vbif %d\n", vbif != NULL);
 		return;
 	}
 
-	if (!mdp->ops.setup_clk_force_ctrl ||
-			!vbif->ops.set_limit_conf ||
-			!vbif->ops.set_halt_ctrl)
+	if (!vbif->ops.set_limit_conf || !vbif->ops.set_halt_ctrl)
 		return;
 
 	/* set write_gather_en for all write clients */
@@ -200,8 +193,6 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 	trace_dpu_perf_set_ot(params->num, params->xin_id, ot_lim,
 		params->vbif_idx);
 
-	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
-
 	vbif->ops.set_limit_conf(vbif, params->xin_id, params->rd, ot_lim);
 
 	vbif->ops.set_halt_ctrl(vbif, params->xin_id, true);
@@ -211,25 +202,19 @@ void dpu_vbif_set_ot_limit(struct dpu_kms *dpu_kms,
 		trace_dpu_vbif_wait_xin_halt_fail(vbif->idx, params->xin_id);
 
 	vbif->ops.set_halt_ctrl(vbif, params->xin_id, false);
-
-	if (forced_on)
-		mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, false);
 }
 
 void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		struct dpu_vbif_set_qos_params *params)
 {
 	struct dpu_hw_vbif *vbif;
-	struct dpu_hw_mdp *mdp;
-	bool forced_on = false;
 	const struct dpu_vbif_qos_tbl *qos_tbl;
 	int i;
 
-	if (!params || !dpu_kms->hw_mdp) {
+	if (!params) {
 		DPU_ERROR("invalid arguments\n");
 		return;
 	}
-	mdp = dpu_kms->hw_mdp;
 
 	vbif = dpu_get_vbif(dpu_kms, params->vbif_idx);
 
@@ -238,7 +223,7 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		return;
 	}
 
-	if (!vbif->ops.set_qos_remap || !mdp->ops.setup_clk_force_ctrl) {
+	if (!vbif->ops.set_qos_remap) {
 		DRM_DEBUG_ATOMIC("qos remap not supported\n");
 		return;
 	}
@@ -251,8 +236,6 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		return;
 	}
 
-	forced_on = mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, true);
-
 	for (i = 0; i < qos_tbl->npriority_lvl; i++) {
 		DRM_DEBUG_ATOMIC("%s xin:%d lvl:%d/%d\n",
 				dpu_vbif_name(params->vbif_idx), params->xin_id, i,
@@ -260,9 +243,6 @@ void dpu_vbif_set_qos_remap(struct dpu_kms *dpu_kms,
 		vbif->ops.set_qos_remap(vbif, params->xin_id, i,
 				qos_tbl->priority_lvl[i]);
 	}
-
-	if (forced_on)
-		mdp->ops.setup_clk_force_ctrl(mdp, params->clk_ctrl, false);
 }
 
 void dpu_vbif_clear_errors(struct dpu_kms *dpu_kms)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
index ab490177d886..e1b1f7f4e4be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h
@@ -16,13 +16,11 @@ struct dpu_vbif_set_ot_params {
 	bool rd;
 	bool is_wfd;
 	u32 vbif_idx;
-	u32 clk_ctrl;
 };
 
 struct dpu_vbif_set_memtype_params {
 	u32 xin_id;
 	u32 vbif_idx;
-	u32 clk_ctrl;
 	bool is_cacheable;
 };
 
@@ -30,14 +28,12 @@ struct dpu_vbif_set_memtype_params {
  * struct dpu_vbif_set_qos_params - QoS remapper parameter
  * @vbif_idx: vbif identifier
  * @xin_id: client interface identifier
- * @clk_ctrl: clock control identifier of the xin
  * @num: pipe identifier (debug only)
  * @is_rt: true if pipe is used in real-time use case
  */
 struct dpu_vbif_set_qos_params {
 	u32 vbif_idx;
 	u32 xin_id;
-	u32 clk_ctrl;
 	u32 num;
 	bool is_rt;
 };

-- 
2.34.1

