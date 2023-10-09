Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 415257BEC1F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 22:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378102AbjJIU5i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 16:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378097AbjJIU5h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 16:57:37 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184F292
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 13:57:35 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5041bb9ce51so6240857e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 13:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696885053; x=1697489853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArTNHECreYuQA115CCTpUIP9lX7NmDsLaxdoYp/EqZs=;
        b=VWqUM2KZd1ro0RcTCDIjWaF+e7XTJMFTIWuvdDAqtjeGitiN7QpYBzMq5bQR/aTr5a
         uMJdmCajpSGim467s2DHSiGfCCY184cbCsTR6LLjTxIjpJxP43Zpfn+89lFnrG0q3MgI
         ZJEieBTisL4XudIIXvDY8khSiA4jMVthpxS6piKeyqXqe9zc7ba7al6dwujy5WFlsZdP
         9E1JxfQZCWuFZcUCBX89CxjT59Hr1jP9sjmvfTZN+GnAucLZPgoj8MZaBK2OE/bTMeAE
         AleFSpMzJTLX6nc2yd15rUf9Gbb8+Iz84de/tMeoXI2uoaHvPabXN3eLYKm6iILXTjGP
         0Ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696885053; x=1697489853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArTNHECreYuQA115CCTpUIP9lX7NmDsLaxdoYp/EqZs=;
        b=jNnyZA3zkxRZOe1qA4GDRm7lPXgrO+Pnw2qYiE1NmRWtBe8NIn6U0hQsrxOTS9SbSP
         q+hyhamEb57/sqErViTL/CO80XUgAtKvujZqCVbZwDKn8Fkr94TGA46ePvQ0/EEH2jIr
         oe11/rB9lAZd3UQQN3pJGFb16uEgb4aEdKh0t2d209mVcqYPQi6uX+X4Ba8+8+PpFQ9+
         fwp4F9qmwpdJBbIMHWvE/Ak2ZxEndug/uQMk25mcHelw00QR4khIRDDqbkEKAbxWXz6M
         k/TWn5lePOAN/gGvJ0R4Pi3cAmU4Oe4oHM7QhyS+MwrIli7GujiJQLgjTQSBJNCST/sE
         3tlw==
X-Gm-Message-State: AOJu0YzrSUsj3cGGRasbn/HWBLmn/zc3go289WgdALwZNOGfJXJNSwEW
        sVGjA/be7x7siLqZ4rNA1zTDTg==
X-Google-Smtp-Source: AGHT+IFtjkuBxGl/3Nes/WDrdrp39PAnSs0zIGl0jOFF7dz7VMinE6ZC8w+igb8Uj57ZYYH5paVm0g==
X-Received: by 2002:a19:f015:0:b0:503:3654:37bd with SMTP id p21-20020a19f015000000b00503365437bdmr12804812lfc.45.1696885053426;
        Mon, 09 Oct 2023 13:57:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f5-20020ac251a5000000b0050300e013f3sm1540844lfk.254.2023.10.09.13.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 13:57:32 -0700 (PDT)
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
Subject: [PATCH 5/5] drm/msm/mdp5: drop split display support
Date:   Mon,  9 Oct 2023 23:57:27 +0300
Message-Id: <20231009205727.2781802-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
References: <20231009205727.2781802-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The MSM DSI driver has dropped support for calling
mdp_kms_funcs::set_split_display() callback. Drop corresponding callback
from the mdp5 driver together with the rest of the infrastructure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c  | 42 -------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c  | 42 -------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      | 14 -------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h      |  9 ----
 drivers/gpu/drm/msm/msm_kms.h                 |  4 --
 5 files changed, 111 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
index a640af22eafc..e5662412db9b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c
@@ -158,46 +158,4 @@ void mdp5_cmd_encoder_enable(struct drm_encoder *encoder)
 
 	mdp5_cmd_enc->enabled = true;
 }
-
-int mdp5_cmd_encoder_set_split_display(struct drm_encoder *encoder,
-				       struct drm_encoder *slave_encoder)
-{
-	struct mdp5_encoder *mdp5_cmd_enc = to_mdp5_encoder(encoder);
-	struct mdp5_kms *mdp5_kms;
-	struct device *dev;
-	int intf_num;
-	u32 data = 0;
-
-	if (!encoder || !slave_encoder)
-		return -EINVAL;
-
-	mdp5_kms = get_kms(encoder);
-	intf_num = mdp5_cmd_enc->intf->num;
-
-	/* Switch slave encoder's trigger MUX, to use the master's
-	 * start signal for the slave encoder
-	 */
-	if (intf_num == 1)
-		data |= MDP5_SPLIT_DPL_UPPER_INTF2_SW_TRG_MUX;
-	else if (intf_num == 2)
-		data |= MDP5_SPLIT_DPL_UPPER_INTF1_SW_TRG_MUX;
-	else
-		return -EINVAL;
-
-	/* Smart Panel, Sync mode */
-	data |= MDP5_SPLIT_DPL_UPPER_SMART_PANEL;
-
-	dev = &mdp5_kms->pdev->dev;
-
-	/* Make sure clocks are on when connectors calling this function. */
-	pm_runtime_get_sync(dev);
-	mdp5_write(mdp5_kms, REG_MDP5_SPLIT_DPL_UPPER, data);
-
-	mdp5_write(mdp5_kms, REG_MDP5_SPLIT_DPL_LOWER,
-		   MDP5_SPLIT_DPL_LOWER_SMART_PANEL);
-	mdp5_write(mdp5_kms, REG_MDP5_SPLIT_DPL_EN, 1);
-	pm_runtime_put_sync(dev);
-
-	return 0;
-}
 #endif /* CONFIG_DRM_MSM_DSI */
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
index 79d67c495780..7c2092ca4040 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_encoder.c
@@ -274,48 +274,6 @@ u32 mdp5_encoder_get_framecount(struct drm_encoder *encoder)
 	return mdp5_read(mdp5_kms, REG_MDP5_INTF_FRAME_COUNT(intf));
 }
 
-int mdp5_vid_encoder_set_split_display(struct drm_encoder *encoder,
-				       struct drm_encoder *slave_encoder)
-{
-	struct mdp5_encoder *mdp5_encoder = to_mdp5_encoder(encoder);
-	struct mdp5_encoder *mdp5_slave_enc = to_mdp5_encoder(slave_encoder);
-	struct mdp5_kms *mdp5_kms;
-	struct device *dev;
-	int intf_num;
-	u32 data = 0;
-
-	if (!encoder || !slave_encoder)
-		return -EINVAL;
-
-	mdp5_kms = get_kms(encoder);
-	intf_num = mdp5_encoder->intf->num;
-
-	/* Switch slave encoder's TimingGen Sync mode,
-	 * to use the master's enable signal for the slave encoder.
-	 */
-	if (intf_num == 1)
-		data |= MDP5_SPLIT_DPL_LOWER_INTF2_TG_SYNC;
-	else if (intf_num == 2)
-		data |= MDP5_SPLIT_DPL_LOWER_INTF1_TG_SYNC;
-	else
-		return -EINVAL;
-
-	dev = &mdp5_kms->pdev->dev;
-	/* Make sure clocks are on when connectors calling this function. */
-	pm_runtime_get_sync(dev);
-
-	/* Dumb Panel, Sync mode */
-	mdp5_write(mdp5_kms, REG_MDP5_SPLIT_DPL_UPPER, 0);
-	mdp5_write(mdp5_kms, REG_MDP5_SPLIT_DPL_LOWER, data);
-	mdp5_write(mdp5_kms, REG_MDP5_SPLIT_DPL_EN, 1);
-
-	mdp5_ctl_pair(mdp5_encoder->ctl, mdp5_slave_enc->ctl, true);
-
-	pm_runtime_put_sync(dev);
-
-	return 0;
-}
-
 void mdp5_encoder_set_intf_mode(struct drm_encoder *encoder, bool cmd_mode)
 {
 	struct mdp5_encoder *mdp5_encoder = to_mdp5_encoder(encoder);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 11d9fc2c6bf5..22f2d2ec4a9c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -190,19 +190,6 @@ static void mdp5_complete_commit(struct msm_kms *kms, unsigned crtc_mask)
 		mdp5_smp_complete_commit(mdp5_kms->smp, &global_state->smp);
 }
 
-static int mdp5_set_split_display(struct msm_kms *kms,
-		struct drm_encoder *encoder,
-		struct drm_encoder *slave_encoder,
-		bool is_cmd_mode)
-{
-	if (is_cmd_mode)
-		return mdp5_cmd_encoder_set_split_display(encoder,
-							slave_encoder);
-	else
-		return mdp5_vid_encoder_set_split_display(encoder,
-							  slave_encoder);
-}
-
 static void mdp5_destroy(struct mdp5_kms *mdp5_kms);
 
 static void mdp5_kms_destroy(struct msm_kms *kms)
@@ -275,7 +262,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.wait_flush      = mdp5_wait_flush,
 		.complete_commit = mdp5_complete_commit,
 		.get_format      = mdp_get_format,
-		.set_split_display = mdp5_set_split_display,
 		.destroy         = mdp5_kms_destroy,
 #ifdef CONFIG_DEBUG_FS
 		.debugfs_init    = mdp5_kms_debugfs_init,
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
index 29bf11f08601..ee68e9913f8c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
@@ -291,8 +291,6 @@ struct drm_crtc *mdp5_crtc_init(struct drm_device *dev,
 
 struct drm_encoder *mdp5_encoder_init(struct drm_device *dev,
 		struct mdp5_interface *intf, struct mdp5_ctl *ctl);
-int mdp5_vid_encoder_set_split_display(struct drm_encoder *encoder,
-				       struct drm_encoder *slave_encoder);
 void mdp5_encoder_set_intf_mode(struct drm_encoder *encoder, bool cmd_mode);
 int mdp5_encoder_get_linecount(struct drm_encoder *encoder);
 u32 mdp5_encoder_get_framecount(struct drm_encoder *encoder);
@@ -303,8 +301,6 @@ void mdp5_cmd_encoder_mode_set(struct drm_encoder *encoder,
 			       struct drm_display_mode *adjusted_mode);
 void mdp5_cmd_encoder_disable(struct drm_encoder *encoder);
 void mdp5_cmd_encoder_enable(struct drm_encoder *encoder);
-int mdp5_cmd_encoder_set_split_display(struct drm_encoder *encoder,
-				       struct drm_encoder *slave_encoder);
 #else
 static inline void mdp5_cmd_encoder_mode_set(struct drm_encoder *encoder,
 					     struct drm_display_mode *mode,
@@ -317,11 +313,6 @@ static inline void mdp5_cmd_encoder_disable(struct drm_encoder *encoder)
 static inline void mdp5_cmd_encoder_enable(struct drm_encoder *encoder)
 {
 }
-static inline int mdp5_cmd_encoder_set_split_display(
-	struct drm_encoder *encoder, struct drm_encoder *slave_encoder)
-{
-	return -EINVAL;
-}
 #endif
 
 #endif /* __MDP5_KMS_H__ */
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 44aa435d68ce..0641f6111b93 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -105,10 +105,6 @@ struct msm_kms_funcs {
 	/* misc: */
 	long (*round_pixclk)(struct msm_kms *kms, unsigned long rate,
 			struct drm_encoder *encoder);
-	int (*set_split_display)(struct msm_kms *kms,
-			struct drm_encoder *encoder,
-			struct drm_encoder *slave_encoder,
-			bool is_cmd_mode);
 	/* cleanup: */
 	void (*destroy)(struct msm_kms *kms);
 
-- 
2.39.2

