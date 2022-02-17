Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 676E84B974D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 04:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233203AbiBQDyZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 22:54:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233220AbiBQDyY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 22:54:24 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EED62A22AA
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:09 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id d23so7511868lfv.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xedxWSvx9ArNTGyT36JcyEF8rqvDUNlS4BZYi2FfR8w=;
        b=rVZE9qBJZLndJhlNOKlLZzK62wUYGptsMSkrLS+NeMLGQIIQqeJmvJ+O4UqFAPISYO
         7kd550UaHIzijTAPvJ1yUcOeUkXT9uI4LOdTdBdphKvTnQuKzez8knxMWAT0lJYwVGmi
         tBwVt2REaCirHL1qVixNbTznBuxiwE1bd7Z5/bJVKhiS4gjMgOnoOiA6SVCQEvwwYfOH
         4OiZRN/X+7vaZ7C40KmtArWt718BYiLy28tH1ccRNhjDQGfQ7rhCMMAOHkFJQjJWnzbY
         2nInpAuMxtnS64Op02a993VpoW+UKQCu3QXaFU3LvCiPPYhfd5RthqjMqZ0qsKXhcepr
         g+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xedxWSvx9ArNTGyT36JcyEF8rqvDUNlS4BZYi2FfR8w=;
        b=L4OOpNnmk6RZFZIZ+Zd4YWb2q8cmsNeqI0DdhypH+3/M8Bh8jVb5hBVfHz+sUizrtv
         2+PUtBwtM01EQZMGQX/e/1ngPBq0/XpOMNoxxacIS3W3xiHEtSs6z2e7Lw0I+lLNukjR
         obGPIoflPqOMYfogMwuo4gc7m1pKwVc8IllPcWVeiJ50pHuor9genuQL5f7jBEcD/24P
         kX0iBHqrJg5dJoOfQLqX3+AoCvVWIVyWh3tjnAXneODlMp+ixL/PfLfTwyil5XTKj3V7
         jkVSOE8OUXV1aB/5jV2haL33xcJYM9ksvouvhfLGmouC4r3kxgRsgJis08CJ7JDJ7ML4
         xgUA==
X-Gm-Message-State: AOAM5328RoBvUDHMyYp6j9572tHIt9ejQVHx1poOMZRAlB8OGiqOq8+K
        DV6KqYKGDFRqr74CF+c8VDIYRw==
X-Google-Smtp-Source: ABdhPJwWetsx1UaiDYt5MGZF+Lw/m7+9qt6Fs5IFrgZVbVyCRbPSBs1EwLfO/diZE5O9YSKcH1F0GQ==
X-Received: by 2002:a05:6512:104f:b0:443:15b3:ba57 with SMTP id c15-20020a056512104f00b0044315b3ba57mr825472lfb.239.1645070046318;
        Wed, 16 Feb 2022 19:54:06 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h9sm1575454ljb.77.2022.02.16.19.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 19:54:05 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 7/7] drm/msm/dpu: pull connector from dpu_encoder_phys to dpu_encoder_virt
Date:   Thu, 17 Feb 2022 06:53:58 +0300
Message-Id: <20220217035358.465904-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
References: <20220217035358.465904-1-dmitry.baryshkov@linaro.org>
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

All physical encoders used by virtual encoder share the same connector,
so pull the connector field from dpu_encoder_phys into dpu_encoder_virt
structure. Otherwise code suggests that different phys_encs
can have different connectors.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 11 ++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 --
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index a8c9f5a4dd67..b23f12eb0e0e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -143,6 +143,7 @@ enum dpu_enc_rc_states {
  *			link between encoder/crtc. However in this case we need
  *			to track crtc in the disable() hook which is called
  *			_after_ encoder_mask is cleared.
+ * @connector:		If a mode is set, cached pointer to the active connector
  * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
  *				all CTL paths
  * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
@@ -183,6 +184,7 @@ struct dpu_encoder_virt {
 	bool intfs_swapped;
 
 	struct drm_crtc *crtc;
+	struct drm_connector *connector;
 
 	struct dentry *debugfs_root;
 	struct mutex enc_lock;
@@ -1010,6 +1012,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	cstate->num_mixers = num_lm;
 
+	dpu_enc->connector = conn_state->connector;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		int num_blk;
 		struct dpu_hw_blk *hw_blk[MAX_CHANNELS_PER_ENC];
@@ -1047,7 +1051,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 			return;
 		}
 
-		phys->connector = conn_state->connector;
 		phys->cached_mode = crtc_state->adjusted_mode;
 		if (phys->ops.atomic_mode_set)
 			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
@@ -1081,7 +1084,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 
 	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_DSI &&
 			!WARN_ON(dpu_enc->num_phys_encs == 0)) {
-		unsigned bpc = dpu_enc->phys_encs[0]->connector->display_info.bpc;
+		unsigned bpc = dpu_enc->connector->display_info.bpc;
 		for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
 			if (!dpu_enc->hw_pp[i])
 				continue;
@@ -1185,9 +1188,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_STOP);
 
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		dpu_enc->phys_encs[i]->connector = NULL;
-	}
+	dpu_enc->connector = NULL;
 
 	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 6309c5e30d20..43ce56109c41 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -178,7 +178,6 @@ struct dpu_encoder_irq {
  *	tied to a specific panel / sub-panel. Abstract type, sub-classed by
  *	phys_vid or phys_cmd for video mode or command mode encs respectively.
  * @parent:		Pointer to the containing virtual encoder
- * @connector:		If a mode is set, cached pointer to the active connector
  * @ops:		Operations exposed to the virtual encoder
  * @parent_ops:		Callbacks exposed by the parent to the phys_enc
  * @hw_mdptop:		Hardware interface to the top registers
@@ -207,7 +206,6 @@ struct dpu_encoder_irq {
  */
 struct dpu_encoder_phys {
 	struct drm_encoder *parent;
-	struct drm_connector *connector;
 	struct dpu_encoder_phys_ops ops;
 	const struct dpu_encoder_virt_ops *parent_ops;
 	struct dpu_hw_mdp *hw_mdptop;
-- 
2.34.1

