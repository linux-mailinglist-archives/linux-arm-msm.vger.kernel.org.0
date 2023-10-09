Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2640A7BD706
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 11:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345697AbjJIJ3b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 05:29:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345801AbjJIJ3a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 05:29:30 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C7AD8E
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 02:29:27 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-50337b43ee6so5485558e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 02:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696843765; x=1697448565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Ft8rzeFfb+3Zy/RVc4524NJ3uIXFMLtpNTcOuyG46Y=;
        b=OLcEy191EMEOn1Fqk0MM8+EM9iyACquFPQgmMST8GhyQsC5C497R7FgkktPOGBinHU
         LEiEWTwIiw12ns7yhrRmRA69UqAipilW81ekJEl/MxTZT/73bw5VwHW7qKQJfca+L1gT
         rc9bvFIaqHaiMiZdQlg3muflFsHHWpatGaiv096ao63Jwd9vaOjrepjXitK+jqX2Kw5h
         i3iC/7nFSD1ZH/C+M4GeGDXdqL/B32z1/f/dompFmyF8ngjE5oLljn9BiSuPYV6cbi9e
         RP9QbVmj1HTnYSOtzDMtmyiU63kdwHZYAXN659HtrNWatfVfi5RbRUL8sIs13oxndNig
         8HLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696843765; x=1697448565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Ft8rzeFfb+3Zy/RVc4524NJ3uIXFMLtpNTcOuyG46Y=;
        b=Lk28FbQhOMQvFJfyZpAGfPEQzGZN9DXA9NrI18v5xZB9BNT7vHrIui5okbo8TGZHOG
         H99K4PYqmc+JDJpXmH80AH83WnKfeb7srXRCsCj6cjCT1A8m0JGqL4TZV1y84dNcenJz
         CHgrUH7oCBSNx0BF8BVxq9zIPZCpZcpT6rZM0rDbBBkK0LnIT2eLBxn/iHzcbSVw1KPf
         wdci6gvCuT+uAGpelSsIjqGx5xIxtJkVK4yZO0YO/KmAuxobL4j7+EkOROmT1BbyDhYt
         9b/hluvz35SiSeskolsXZjnARg0Wd0IobDn7Np5n/3z1jFK0emJxWWzwQMNctJwOcQX1
         4VuA==
X-Gm-Message-State: AOJu0YyYlsHPMxuKNfG4KSk/WqqpExz3cJne/3kJqRm3sZVQEEJghLn7
        WenpiheANVD6OcShPGAWlcEyMZ2h99SGgViAER3NlWPD
X-Google-Smtp-Source: AGHT+IE7WPTOf1bnyWz4aVrT9CULFFmLQuJdpxXr+CL8+LIIBWtl4V7TvzdA9XT+E7C5rdUqCL/DRQ==
X-Received: by 2002:a05:6512:308a:b0:502:e651:129b with SMTP id z10-20020a056512308a00b00502e651129bmr14703016lfd.19.1696843765485;
        Mon, 09 Oct 2023 02:29:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n24-20020a195518000000b004ff9ab6463fsm1377495lfe.87.2023.10.09.02.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 02:29:24 -0700 (PDT)
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
Subject: [PATCH v2 2/3] drm/msm/dpu: split _dpu_encoder_resource_control_helper()
Date:   Mon,  9 Oct 2023 12:29:21 +0300
Message-Id: <20231009092922.2590891-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009092922.2590891-1-dmitry.baryshkov@linaro.org>
References: <20231009092922.2590891-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Follow the _dpu_encoder_irq_control() change and split the
_dpu_encoder_resource_control_helper() into enable and disable parts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 +++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   | 12 ++++--
 2 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 46f4abe54cbd..30c457541645 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -769,8 +769,7 @@ static void _dpu_encoder_irq_disable(struct drm_encoder *drm_enc)
 	}
 }
 
-static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
-		bool enable)
+static void _dpu_encoder_resource_enable(struct drm_encoder *drm_enc)
 {
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
@@ -780,28 +779,42 @@ static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
 
-	trace_dpu_enc_rc_helper(DRMID(drm_enc), enable);
+	trace_dpu_enc_rc_enable(DRMID(drm_enc));
 
 	if (!dpu_enc->cur_master) {
 		DPU_ERROR("encoder master not set\n");
 		return;
 	}
 
-	if (enable) {
-		/* enable DPU core clks */
-		pm_runtime_get_sync(&dpu_kms->pdev->dev);
+	/* enable DPU core clks */
+	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
-		/* enable all the irq */
-		_dpu_encoder_irq_enable(drm_enc);
+	/* enable all the irq */
+	_dpu_encoder_irq_enable(drm_enc);
+}
 
-	} else {
-		/* disable all the irq */
-		_dpu_encoder_irq_disable(drm_enc);
+static void _dpu_encoder_resource_disable(struct drm_encoder *drm_enc)
+{
+	struct msm_drm_private *priv;
+	struct dpu_kms *dpu_kms;
+	struct dpu_encoder_virt *dpu_enc;
 
-		/* disable DPU core clks */
-		pm_runtime_put_sync(&dpu_kms->pdev->dev);
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	priv = drm_enc->dev->dev_private;
+	dpu_kms = to_dpu_kms(priv->kms);
+
+	trace_dpu_enc_rc_disable(DRMID(drm_enc));
+
+	if (!dpu_enc->cur_master) {
+		DPU_ERROR("encoder master not set\n");
+		return;
 	}
 
+	/* disable all the irq */
+	_dpu_encoder_irq_disable(drm_enc);
+
+	/* disable DPU core clks */
+	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 
 static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
@@ -859,7 +872,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		if (is_vid_mode && dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE)
 			_dpu_encoder_irq_enable(drm_enc);
 		else
-			_dpu_encoder_resource_control_helper(drm_enc, true);
+			_dpu_encoder_resource_enable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_ON;
 
@@ -954,7 +967,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		 * and in IDLE state the resources are already disabled
 		 */
 		if (dpu_enc->rc_state == DPU_ENC_RC_STATE_PRE_OFF)
-			_dpu_encoder_resource_control_helper(drm_enc, false);
+			_dpu_encoder_resource_disable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_OFF;
 
@@ -989,7 +1002,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		if (is_vid_mode)
 			_dpu_encoder_irq_disable(drm_enc);
 		else
-			_dpu_encoder_resource_control_helper(drm_enc, false);
+			_dpu_encoder_resource_disable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_IDLE;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 95ce7647ff76..bd92fb2979aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -273,6 +273,14 @@ DEFINE_EVENT(dpu_drm_obj_template, dpu_crtc_runtime_resume,
 	TP_PROTO(uint32_t drm_id),
 	TP_ARGS(drm_id)
 );
+DEFINE_EVENT(dpu_drm_obj_template, dpu_enc_rc_enable,
+	TP_PROTO(uint32_t drm_id),
+	TP_ARGS(drm_id)
+);
+DEFINE_EVENT(dpu_drm_obj_template, dpu_enc_rc_disable,
+	TP_PROTO(uint32_t drm_id),
+	TP_ARGS(drm_id)
+);
 
 TRACE_EVENT(dpu_enc_enable,
 	TP_PROTO(uint32_t drm_id, int hdisplay, int vdisplay),
@@ -342,10 +350,6 @@ DECLARE_EVENT_CLASS(dpu_enc_id_enable_template,
 	TP_printk("id=%u, enable=%s",
 		  __entry->drm_id, __entry->enable ? "true" : "false")
 );
-DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_rc_helper,
-	TP_PROTO(uint32_t drm_id, bool enable),
-	TP_ARGS(drm_id, enable)
-);
 DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_vblank_cb,
 	TP_PROTO(uint32_t drm_id, bool enable),
 	TP_ARGS(drm_id, enable)
-- 
2.39.2

