Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 357457217E5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 16:45:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbjFDOpV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 10:45:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231742AbjFDOpT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 10:45:19 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 820FDBC
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 07:45:18 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f6195d2b3fso1483000e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 07:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685889917; x=1688481917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XGGSdfCbsBNbwyef8Nb7m7BC2wJ4z01Pzv4/SUxCqbY=;
        b=bzH+C7i2fsbFxAVG4fGz+L2gJ4FKtrc9BSXQ4ZMmiy/SaQp6GUgCJpL+PUbf1YPCbG
         cBSrnjPUwWnoMbFXZpLJKNFnRayNuxfUrZ9BsEGv1uTWuau0VHNkxhSfaA2Tx/2uwWij
         tWVKfgOoHKS3PTtox3l+RAC654T9TflyjGhNj919jLK3Y8WLrP8lDQ5Cn7Bcdowr/vlB
         SxMZ0INqxkoGfVMqEohbPwffNcrliIvqDqQBspIro6qdvnyrCJXRYOCkdE7OWfIYKe7a
         XS1yG/QKrc8qjW+yjyX7uGCLtEDQK9FY9wx975Bbb6dqX+y0s2lq5CPK+V7BhS0viIxz
         2Yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685889917; x=1688481917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XGGSdfCbsBNbwyef8Nb7m7BC2wJ4z01Pzv4/SUxCqbY=;
        b=Phv873CU+1fg6CSWOZiF+fkYpaZfoh+XHYnSDVlQAnCJAkoYpaFMirYThp0ZEp5aiC
         46IL0ejTm0c9KANhW9vab4ajoBUfgzliNFhv1TSnKzkhhC7hybIL2u2TWTJIqkbMoEWd
         vnpflPyO0J8dsaIPiDNKSMT92v2B/pn5KMDexrX16ebM05GT9qNB5ewu3iHAAx6ueT+e
         rJXGJFYzycXGsxah3qlJYaD6FJ4ZtDr0uHGyTOaIKMQDTF0f09S3Sz5CuyXe0tDTCsoJ
         v/g5leNNx0etehJCunYjEev5WyBdwgzGZNDZ5cYlMDO8wnLKhfh8BFjiw3QSiN0Ua350
         MJ7g==
X-Gm-Message-State: AC+VfDx//10V1mHk2Hufsb5d/7mAISUa6FfRRFSJQAwxLjq9FEF26Edf
        bdqLnTOBjIzZsd6CUaGcwUVHBA==
X-Google-Smtp-Source: ACHHUZ4j5C8xL6XAiCpH3QdTXg72QJnx7Ts7fWE2BB/RDyis3nO7+z8f875nzGQpJnh2MTEVInzhRA==
X-Received: by 2002:ac2:5143:0:b0:4f4:c973:c97d with SMTP id q3-20020ac25143000000b004f4c973c97dmr3694773lfd.25.1685889916913;
        Sun, 04 Jun 2023 07:45:16 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a22-20020ac25216000000b004f42718cbb1sm788912lfl.292.2023.06.04.07.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 07:45:16 -0700 (PDT)
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
Subject: [PATCH 2/3] drm/msm/dpu: split _dpu_encoder_resource_control_helper()
Date:   Sun,  4 Jun 2023 17:45:13 +0300
Message-Id: <20230604144514.949628-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604144514.949628-1-dmitry.baryshkov@linaro.org>
References: <20230604144514.949628-1-dmitry.baryshkov@linaro.org>
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

Follow the _dpu_encoder_irq_control() change and split the
_dpu_encoder_resource_control_helper() into enable and disable parts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 +++++++++++++--------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7c131c5cbe71..cc61f0cf059d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -757,8 +757,7 @@ static void _dpu_encoder_irq_disable(struct drm_encoder *drm_enc)
 	}
 }
 
-static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
-		bool enable)
+static void _dpu_encoder_resource_enable(struct drm_encoder *drm_enc)
 {
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
@@ -768,28 +767,42 @@ static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
 
-	trace_dpu_enc_rc_helper(DRMID(drm_enc), enable);
+	trace_dpu_enc_rc_helper(DRMID(drm_enc), true);
 
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
+	trace_dpu_enc_rc_helper(DRMID(drm_enc), false);
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
@@ -847,7 +860,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		if (is_vid_mode && dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE)
 			_dpu_encoder_irq_enable(drm_enc);
 		else
-			_dpu_encoder_resource_control_helper(drm_enc, true);
+			_dpu_encoder_resource_enable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_ON;
 
@@ -942,7 +955,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		 * and in IDLE state the resources are already disabled
 		 */
 		if (dpu_enc->rc_state == DPU_ENC_RC_STATE_PRE_OFF)
-			_dpu_encoder_resource_control_helper(drm_enc, false);
+			_dpu_encoder_resource_disable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_OFF;
 
@@ -977,7 +990,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		if (is_vid_mode)
 			_dpu_encoder_irq_disable(drm_enc);
 		else
-			_dpu_encoder_resource_control_helper(drm_enc, false);
+			_dpu_encoder_resource_disable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_IDLE;
 
-- 
2.39.2

