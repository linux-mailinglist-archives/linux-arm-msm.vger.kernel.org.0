Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 098ED7682D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 02:35:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229613AbjG3Af3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 20:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjG3Af2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 20:35:28 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539B919B5
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:35:27 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fe216edaf7so2176426e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690677325; x=1691282125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ft+lcYPkOD2X5Cy6eIa14FthuLC+uz/Nzwlggwr4hDE=;
        b=eenDRTCNw9tcFwjxwb0nO3oaZl3JXWAXLTSSAP0a0pejWlcUfPTDIDtmPv1x796Q97
         j/ANf+82FD8Byb/FlsRI9jVig3G0QysbBgz9HqRJb4FtB/iKBb2vF4+z9pJs4ay7owJo
         xSAtp/MSWfZHNW+RAY1xioTbjDFjEZmiStJinXaWbTtqKlMfsC8k08wXKVYdDWsZnbcO
         MUpnsjVDSCQvV88N/xZeTZiUKVjbHKG+tW3PEWHlTktlSFalCcUuXt9pVERb5q7bjdAU
         owoOJ5BQy72ZoYGBSXfOpWekK86TtBR9393TrhNkWznElXQRLZX/jAx6cHNgRKDO04ud
         LrcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690677325; x=1691282125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ft+lcYPkOD2X5Cy6eIa14FthuLC+uz/Nzwlggwr4hDE=;
        b=MOBgtZFbeV5TeYOV/n4L7onZEgWufgQnlcVOqS/i6Zzj5t+3SkpHvrIDjPwUIpgHMZ
         5fIqMzsRrEtG54Muliyx+FhG3DcvICoitOqL+3qzZp1rHhuzKl0y6BKtxbAeYe8+hEJh
         b8NKEQnGt21otFtNB0wadOuOAByd1XWe4f3fKQMz7hsY2JC9KwRSD+V/fusg7b+yGVeL
         4bF5W7o1CaypUPJVUi1QjhPL9j8lD24dI7TKyXbyxFvw/YK0EqO2X8OMNJ5eG9o3ZfmZ
         7Z12/ivuEmSa0cC3kNPTITO+vC2cSLUjH5YhbsDhYPzZfmS3xa+GQFQLMGAR/fYSD0bO
         /3HQ==
X-Gm-Message-State: ABy/qLY9BT/c4MPhsJe5vioDhVO95LY5+CbAlTsB9C07lOW9dpnDkrjn
        dpgJSX4CuddQ/AHGQNrvGVRVkw==
X-Google-Smtp-Source: APBJJlEYfgh+CNI4jN67nxwSyQTAdHekeCgdRvKPdgT3atYqVpm7UWXcS2p7/pBLpXjKZbYt1DfE6g==
X-Received: by 2002:a05:6512:1112:b0:4fd:d254:edc6 with SMTP id l18-20020a056512111200b004fdd254edc6mr3258073lfg.26.1690677325620;
        Sat, 29 Jul 2023 17:35:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 17:35:25 -0700 (PDT)
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
Subject: [PATCH v2 6/8] drm/msm/dpu: drop DPU_INTF_TE feature flag
Date:   Sun, 30 Jul 2023 03:35:16 +0300
Message-Id: <20230730003518.349197-7-dmitry.baryshkov@linaro.org>
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

Replace the only user of the DPU_INTF_TE feature flag with the direct
DPU version comparison.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 5 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c       | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h       | 2 --
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 9589fe719452..d1f309f45fa1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -776,8 +776,9 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	phys_enc->intf_mode = INTF_MODE_CMD;
 	cmd_enc->stream_sel = 0;
 
-	phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
-					 &phys_enc->hw_intf->cap->features);
+	/* DPU before 5.0 use PINGPONG for TE handling */
+	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
+		phys_enc->has_intf_te = true;
 
 	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
 	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index c19dc70d4456..17426f0f981e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -100,7 +100,6 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_TE) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
 	 BIT(DPU_DATA_HCTL_EN))
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index a6f8eee58b92..69c9099cf5a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -175,7 +175,6 @@ enum {
  * INTF sub-blocks
  * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
  *                                  pixel data arrives to this INTF
- * @DPU_INTF_TE                     INTF block has TE configuration support
  * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
  *                                  than video timing
  * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
@@ -183,7 +182,6 @@ enum {
  */
 enum {
 	DPU_INTF_INPUT_CTRL = 0x1,
-	DPU_INTF_TE,
 	DPU_DATA_HCTL_EN,
 	DPU_INTF_STATUS_SUPPORTED,
 	DPU_INTF_MAX
-- 
2.39.2

