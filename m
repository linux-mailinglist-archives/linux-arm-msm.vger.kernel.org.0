Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 530594B6E88
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 15:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238496AbiBOORB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 09:17:01 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238507AbiBOORA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 09:17:00 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3DD27FFB
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:16:50 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id b9so12972633lfv.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 06:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zOWsFQ2NqdBKJaWz8vlkHE1lWZ3O8C4cPJw7Ctmru5A=;
        b=ar3rW97Bd/FO3/TiXMLwcY5rUfU+ObqWzWidDP6RqiKwOimcHmEUimm0UfmtFkl+ZY
         L/BEn+OZGQJnYcnOKPgy21EZ6vD0lIst/8Syl3z7NrF8Vkwh4AoFKsqVPi4jPaiWj6EJ
         e5/i8Qrd7Z9zD6epSqcnAtQBBQDURdwHriUDYextSnl+RG5HsfWloX+hVWk/cIFFfEA6
         qdBBi8D68pUh6KZ6QaGMiV9Rg/eIfqMEpB2+3Y1GLwWidsbsOaoCXAL5a7ZupVoKE5Ch
         FWqezFdsn7BthdHgOjTr47xeMKggMQA59gPGKU6PWLaKorvc7K7NqWL3D9+YDgOdcSFM
         ZJRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zOWsFQ2NqdBKJaWz8vlkHE1lWZ3O8C4cPJw7Ctmru5A=;
        b=z++dMCZk/HIsA3q+j6xZXTdQz0zUFNxCvTAHCo7fc2N7zK1SozD5eA4omMc2BfUqce
         5ID/aMQsSBd4ZCl3FgvQHvAHlyfFDDaPDzGTtw4VNlx7vVxTeqBqx9Bobl6MqRsPrGN2
         UAwwB3JjsfuhX8K0seZyZf6n2327AFne95IZEQKglRl/FJ2ixnKGh+eL+jSqASqJ2lNK
         luft3PcWssJhwQ1VaLk/l2bu6UckNtUShhaKBwgtwYI//GDN8uhRtDW/+EH0gajmJ6UA
         lk2K4qVmpNn7eFhtHr2X+SEi9FUX0HA6JhmIryv9ZPJ4gWNK8Ajbm/mNl5WdNgNYmf8C
         LENQ==
X-Gm-Message-State: AOAM533U5dLCt7/3zhMDy5xAGKNsGfFrQmZtHsUh25sorNL7G7zUO3Bt
        3ovdVOULsOn+4I5utgY3Ro9PeA==
X-Google-Smtp-Source: ABdhPJwWu5XdG7swBIg4pLmlGomfy+NBGho2JRvRwq/drXs3qdUsRfmYvewCOymKNtQ43WXvP49t7w==
X-Received: by 2002:a05:6512:1081:: with SMTP id j1mr3247583lfg.257.1644934608816;
        Tue, 15 Feb 2022 06:16:48 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m16sm1018044ljb.131.2022.02.15.06.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 06:16:48 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/msm/dpu: encoder: drop unused mode_fixup callback
Date:   Tue, 15 Feb 2022 17:16:40 +0300
Message-Id: <20220215141643.3444941-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
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

Both cmd and vid backends provide useless mode_fixup() callback. Drop
it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  4 ----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 10 ----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 --------------
 4 files changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 480d02ccff8c..394916e8fe08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -602,10 +602,6 @@ static int dpu_encoder_virt_atomic_check(
 		if (phys->ops.atomic_check)
 			ret = phys->ops.atomic_check(phys, crtc_state,
 					conn_state);
-		else if (phys->ops.mode_fixup)
-			if (!phys->ops.mode_fixup(phys, mode, adj_mode))
-				ret = -EINVAL;
-
 		if (ret) {
 			DPU_ERROR_ENC(dpu_enc,
 					"mode unsupported, phys idx %d\n", i);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index e7270eb6b84b..7b14948c4c87 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -84,7 +84,6 @@ struct dpu_encoder_virt_ops {
  * @is_master:			Whether this phys_enc is the current master
  *				encoder. Can be switched at enable time. Based
  *				on split_role and current mode (CMD/VID).
- * @mode_fixup:			DRM Call. Fixup a DRM mode.
  * @mode_set:			DRM Call. Set a DRM mode.
  *				This likely caches the mode, for use at enable.
  * @enable:			DRM Call. Enable a DRM mode.
@@ -117,9 +116,6 @@ struct dpu_encoder_phys_ops {
 			struct dentry *debugfs_root);
 	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
-	bool (*mode_fixup)(struct dpu_encoder_phys *encoder,
-			const struct drm_display_mode *mode,
-			struct drm_display_mode *adjusted_mode);
 	void (*mode_set)(struct dpu_encoder_phys *encoder,
 			struct drm_display_mode *mode,
 			struct drm_display_mode *adjusted_mode);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 35071964d0f6..1796f83b47ae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -45,15 +45,6 @@ static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
 	return (phys_enc->split_role != ENC_ROLE_SLAVE);
 }
 
-static bool dpu_encoder_phys_cmd_mode_fixup(
-		struct dpu_encoder_phys *phys_enc,
-		const struct drm_display_mode *mode,
-		struct drm_display_mode *adj_mode)
-{
-	DPU_DEBUG_CMDENC(to_dpu_encoder_phys_cmd(phys_enc), "\n");
-	return true;
-}
-
 static void _dpu_encoder_phys_cmd_update_intf_cfg(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -756,7 +747,6 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
 	ops->is_master = dpu_encoder_phys_cmd_is_master;
 	ops->mode_set = dpu_encoder_phys_cmd_mode_set;
-	ops->mode_fixup = dpu_encoder_phys_cmd_mode_fixup;
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
 	ops->destroy = dpu_encoder_phys_cmd_destroy;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ddd9d89cd456..1831fe37c88c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -225,19 +225,6 @@ static void programmable_fetch_config(struct dpu_encoder_phys *phys_enc,
 	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
 }
 
-static bool dpu_encoder_phys_vid_mode_fixup(
-		struct dpu_encoder_phys *phys_enc,
-		const struct drm_display_mode *mode,
-		struct drm_display_mode *adj_mode)
-{
-	DPU_DEBUG_VIDENC(phys_enc, "\n");
-
-	/*
-	 * Modifying mode has consequences when the mode comes back to us
-	 */
-	return true;
-}
-
 static void dpu_encoder_phys_vid_setup_timing_engine(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -676,7 +663,6 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_vid_is_master;
 	ops->mode_set = dpu_encoder_phys_vid_mode_set;
-	ops->mode_fixup = dpu_encoder_phys_vid_mode_fixup;
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
 	ops->destroy = dpu_encoder_phys_vid_destroy;
-- 
2.34.1

