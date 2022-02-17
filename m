Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E9B84B974A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 04:54:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233219AbiBQDyY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 22:54:24 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233220AbiBQDyW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 22:54:22 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F4062A0D72
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:07 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id t14so6348815ljh.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 19:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LeHMkFoNMl5wbtqitgFOACM/7bfBhWBbMxRXA4GQO3c=;
        b=xDioYM+nRwpRvXfxQySDt5SdFQTGBo0mhX+hMfNRSjFUlxmIcFJBgc06uCvTNgCaG5
         B3h66Uou9fIGxPMo7HyCPbgblIcWQMQaF19lmzr7KatsujdAqHOSehyAcilrOPbqfMy1
         uA/I/5OPtdD5JY144Q9zebvyzW8GIOUQ12LIWttCDAzBmPMLXKiF1qumTDbOqVMbNg6/
         2At+UEGHcGbGQoFUYYaXoO61WBxO4tmmFePEl58tWdgAPXEU1VRDWLh/5r1Ni3SBGH8A
         OFjmUZPfKdRYBSO7qOPJYk5C44Mf9FPHMk1meyjqbcfWIwwK743Jn9HqW0cXUWnUq/wA
         59pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LeHMkFoNMl5wbtqitgFOACM/7bfBhWBbMxRXA4GQO3c=;
        b=DneHbW5epsGwdSc6fRHlzbbeU9mKluYs7oRh3pU9OKd1prnD14bNd4bDVb6VTQfQWl
         v0rV4AgZ8Zh+qZpubQ+LkxyL3GxglEJBE/2DYlvI9CPTHVfgVrPBeGud8g15cDGae9JR
         dteaMMLrRlfhTR30Bikbvg4iSDoyKiCVGWpbeBl+JFdeO/2VGdzJg5r6ExSM8PqHoz4Z
         iOKh9xw/fwmVwI8AaVgHlyk9/a2qVVgZlzQ6JA9fJ4ZH0vGJ9XEMJixf8AZB/ZLHBGvr
         Wbf6fSF/1RGZrT+uAclsFv7x7hKwcSfjOVXapVmz2E6ZIIHvgK09VRj7cI9RfZD0MEAL
         oDIA==
X-Gm-Message-State: AOAM531+wY3kZUxcO3cJsTv0d3sYgmv2d1xhruvpZYjbhxiFMjS2Jp93
        k8y8yjbmQ6GFwAB4W7BlIefSbQ==
X-Google-Smtp-Source: ABdhPJz+PKWLqFzChp7jfA7jBHOX8xftiL3eCkcqveRWvqbvaS4l2FiOK0ZSwpn+PFkSIlveg2cc0A==
X-Received: by 2002:a2e:3c04:0:b0:238:eb48:5fc8 with SMTP id j4-20020a2e3c04000000b00238eb485fc8mr895475lja.148.1645070044755;
        Wed, 16 Feb 2022 19:54:04 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h9sm1575454ljb.77.2022.02.16.19.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 19:54:04 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH v2 5/7] drm/msm/dpu: encoder: drop unused mode_fixup callback
Date:   Thu, 17 Feb 2022 06:53:56 +0300
Message-Id: <20220217035358.465904-6-dmitry.baryshkov@linaro.org>
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

Both cmd and vid backends provide useless mode_fixup() callback. Drop
it.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  4 ----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 10 ----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 --------------
 4 files changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f5bc15b2e56e..5b2eeea37d54 100644
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
index 34a6940d12c5..45fe97fb612d 100644
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
@@ -732,7 +723,6 @@ static void dpu_encoder_phys_cmd_init_ops(
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

