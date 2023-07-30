Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 655C47682D9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 02:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229493AbjG3Afa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 20:35:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjG3Afa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 20:35:30 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB99519B5
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:35:28 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b9338e4695so49591301fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690677327; x=1691282127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmjGd6hQg5+KzT5ujuzMh2o3ciL+YNI2GkvXWKUqqAs=;
        b=ZgJVLnAfJAQUM4bSILyTLf+Im47B/dyNmIyjpw4oLc7ObYAql/7HIJvFcc5f5ihTYT
         i9Ln4Mx04ujT9NUQWmmTbnq2NPgsbno7+kUVJWslgHnU0kk+YrAXB2n6PnOZuPK3iu2q
         ZM1fOzodAF9BzogVBY/7FuouLzzYKpeMyBwCtX5hVxKNpG+FsQa5igVuW1CPKj96xrSq
         nZkom/2QU0nJ5vgVrMr3kiQjoD98jU6Gd8i7H2EimBllj+MmF3AKfI1A2lywH24Um7m/
         NOsb38b5TXSVTAjkLyiqQxZOIR6rMROneXCiKZLru4YgDJWKPp3cK99x1iyGtdx5BAOl
         Ifag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690677327; x=1691282127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmjGd6hQg5+KzT5ujuzMh2o3ciL+YNI2GkvXWKUqqAs=;
        b=UG1ZB6cPA2dMSJ0hhHX5FZ3D5QF8kpQFtKtHkG1ENlRjTEZGIqMJRN1snBi5t5r7C/
         nfcQXFXPGo4jxBMfUGk4nKRYV0hSWANdnfHXUflsj400QbfKL02BWkpQOqIW27OXCfyJ
         uYSmG30E3zXWlwVZJNkUZ0LbDPHgQ7mOxSx496ID/wqTzpM6F8Zb+ZoLqeJYIK6GysyO
         q6RUNHc9HD31aI6oA5qnlabBS/9yafZuH1ZX2vynafjCQBSZQToDEa2h2KHLzxSAS3aW
         73VnRcrG4+cnGAzKtESzfOCsIyDxc4E/Mm4OodR9C33UU8BqU59olGEDMEoy3G3R9gdY
         XV2w==
X-Gm-Message-State: ABy/qLaLMkajAnnOi/z87HMRZXZEU/4CMrhsJMei+CxgqaaxhE0oyvT/
        KXoZoruVvNzYL7MKkROQ5C0wNg==
X-Google-Smtp-Source: APBJJlE/Masgcy12zxqKZTm46aarOd7BSDmEN/SL2Jz+5EdmLFdorC+H60FSJfrmlnBy05dFeOevtg==
X-Received: by 2002:a2e:c51:0:b0:2b9:e053:7a01 with SMTP id o17-20020a2e0c51000000b002b9e0537a01mr925423ljd.43.1690677327182;
        Sat, 29 Jul 2023 17:35:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 17:35:26 -0700 (PDT)
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
Subject: [PATCH v2 8/8] drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init
Date:   Sun, 30 Jul 2023 03:35:18 +0300
Message-Id: <20230730003518.349197-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
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

As the INTF is fixed at the encoder creation time, we can move the
check whether INTF supports tearchck to dpu_encoder_phys_cmd_init().
This function can return an error if INTF doesn't have required feature.
Performing this check in dpu_encoder_phys_cmd_tearcheck_config() is less
useful, as this function returns void.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 41 +++++++++++--------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 012986cff38c..adbd559a5290 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -325,24 +325,21 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	unsigned long vsync_hz;
 	struct dpu_kms *dpu_kms;
 
-	if (phys_enc->has_intf_te) {
-		if (!phys_enc->hw_intf ||
-		    !phys_enc->hw_intf->ops.enable_tearcheck) {
-			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
-			return;
-		}
-
-		DPU_DEBUG_CMDENC(cmd_enc, "");
-	} else {
-		if (!phys_enc->hw_pp ||
-		    !phys_enc->hw_pp->ops.enable_tearcheck) {
-			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
-			return;
-		}
-
-		DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
+	/*
+	 * TODO: if/when resource allocation is refactored, move this to a
+	 * place where the driver can actually return an error.
+	 */
+	if (!phys_enc->has_intf_te &&
+	    (!phys_enc->hw_pp ||
+	     !phys_enc->hw_pp->ops.enable_tearcheck)) {
+		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
+		return;
 	}
 
+	DPU_DEBUG_CMDENC(cmd_enc, "intf %d pp %d\n",
+			 phys_enc->hw_intf->idx - INTF_0,
+			 phys_enc->hw_pp->idx - PINGPONG_0);
+
 	mode = &phys_enc->cached_mode;
 
 	dpu_kms = phys_enc->dpu_kms;
@@ -768,10 +765,22 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	phys_enc->intf_mode = INTF_MODE_CMD;
 	cmd_enc->stream_sel = 0;
 
+	if (!phys_enc->hw_intf) {
+		DPU_ERROR_CMDENC(cmd_enc, "no INTF provided\n");
+
+		return ERR_PTR(-EINVAL);
+	}
+
 	/* DPU before 5.0 use PINGPONG for TE handling */
 	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
 		phys_enc->has_intf_te = true;
 
+	if (phys_enc->has_intf_te && !phys_enc->hw_intf->ops.enable_tearcheck) {
+		DPU_ERROR_CMDENC(cmd_enc, "tearcheck not supported\n");
+
+		return ERR_PTR(-EINVAL);
+	}
+
 	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
 	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
 
-- 
2.39.2

