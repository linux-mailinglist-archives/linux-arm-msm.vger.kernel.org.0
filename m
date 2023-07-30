Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 529DF7682D3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 02:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjG3Af1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Jul 2023 20:35:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjG3Af0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Jul 2023 20:35:26 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294CB19B5
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:35:24 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b703a0453fso50020631fa.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Jul 2023 17:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690677322; x=1691282122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHzsSg6PgQAbXC1fW+qawXCLZd1pWpOGGfXZvnTM7V8=;
        b=i1b/4elKekiFdllyB7yaCQosxADFk946gBfbH8whkJpNXH5nzwlYkAgHuw2viRxn/N
         vu8AkBAxS0l02DfmHkAIc2Pxe4NBuOkENZ7CB1cI0KIRlWWgysBc1h6+u5T/RpN2WXWP
         RO0VyCoxlcWrSV9pnSiK1zGiLLI9O6Sn6FqUbjP6AHJwHZ9u3jmy9OfBCrFl9V92J9A5
         26HzIP9qWVGYg2f2xPXwXeXvKZc7nCK88NJU+Ppy9trJbfN/ZmgF1GoeGApykBozyt1Z
         CiM40srzlpm578yMgc7clOjlWL7bN/cfWYs9FHEqmivGnJbtW5hlGz+JNE/2HO38lNON
         57IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690677322; x=1691282122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHzsSg6PgQAbXC1fW+qawXCLZd1pWpOGGfXZvnTM7V8=;
        b=jyrypD0py59Vxus3rWx8NTJ0lWFeYbS4l7P/TX/fQbYYH/fYIjwy3rWDGWZMr02W+l
         HzGd551pJR7LUOgIa8jx+Q/pGly6tZwMqxj75Iv2/8W2wbr9sihsgELqqZEwQsjgzyD6
         +Xib/vm8sgn+496YegQLd1pVIf/agF26QYLWIIC9BtPv8HLk4GxN2yzMDP7979z/3rZj
         6RS/lEyjA2Iuz41FuBfNZxwKng1MnqQbxg3/n0/aJAOZ8zqwwpHdkj2gCYLmthSO18ri
         S9w2Aco+n8mFwn6TU33BJvexp6SG4Kmvl8Zbj8WR5b/doGogjDnI1t9ULolQ49A88sMl
         dLrg==
X-Gm-Message-State: ABy/qLZPfPr1oDAAPgQwlSB++El50blk6uUyVfRqUL/eYBGhvsY1OSoX
        HEliv9UPgT+WpRkVTffaH2yLlw==
X-Google-Smtp-Source: APBJJlEam35F/ytgrDAXFDexoo3mbj9BefEnZ6vWczKxROs1tw7pyLmJJYPr8cEvagNUEPisfr6wzQ==
X-Received: by 2002:a2e:b0d1:0:b0:2b9:acad:b4b2 with SMTP id g17-20020a2eb0d1000000b002b9acadb4b2mr4143778ljl.6.1690677322455;
        Sat, 29 Jul 2023 17:35:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 17:35:21 -0700 (PDT)
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
Subject: [PATCH v2 3/8] drm/msm/dpu: drop the DPU_PINGPONG_TE flag
Date:   Sun, 30 Jul 2023 03:35:13 +0300
Message-Id: <20230730003518.349197-4-dmitry.baryshkov@linaro.org>
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

The DPU_PINGPONG_TE flag became unused, we can drop it now.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 3ff07d7cbf4b..c19dc70d4456 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -79,7 +79,7 @@
 	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
 
 #define PINGPONG_SDM845_MASK \
-	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_TE) | BIT(DPU_PINGPONG_DSC))
+	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define PINGPONG_SDM845_TE2_MASK \
 	(PINGPONG_SDM845_MASK | BIT(DPU_PINGPONG_TE2))
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 945b88c5ab58..a6f8eee58b92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -136,7 +136,6 @@ enum {
 
 /**
  * PINGPONG sub-blocks
- * @DPU_PINGPONG_TE         Tear check block
  * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
  * @DPU_PINGPONG_SPLIT      PP block supports split fifo
  * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
@@ -145,8 +144,7 @@ enum {
  * @DPU_PINGPONG_MAX
  */
 enum {
-	DPU_PINGPONG_TE = 0x1,
-	DPU_PINGPONG_TE2,
+	DPU_PINGPONG_TE2 = 0x1,
 	DPU_PINGPONG_SPLIT,
 	DPU_PINGPONG_SLAVE,
 	DPU_PINGPONG_DITHER,
-- 
2.39.2

