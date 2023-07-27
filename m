Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A60E4765871
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 18:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbjG0QVM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 12:21:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230516AbjG0QVL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 12:21:11 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 307BB19B
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 09:21:10 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-522382c4840so1519503a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 09:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690474868; x=1691079668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hss43lOMtTWZaP6PSxJpTqk3ynxiZmBIfWetPiB5OU4=;
        b=y/qEf/U9N0vmnlPM4Sya0OVBl059hMk+Q/cFoYuhWfv7iNuWhWX9al27Jh7m1iEGcp
         XzPkjf3d77I2S35ixUHETdxtTZaV27QHBAjhtUFg8hvF2XDtmFqMjHPbzdqD1y0Jcn/b
         P9mI7k6RADgTimuohuHwIPtN04cSmf8yYWYtr+4AtCmU0Mvn+FdwXX5U/XrQqyTGalUS
         //FZtyv0mXrKK4mccZn50MK1ui1Xb1/3kp7WtmsDXJGpT2JTCmrE7c1Znw+f1eeAW53w
         UCsqldfFCzco3puoaBzcyAdfA/OdIRocAClRWdDHbHgoKkvquv0TlwyiNAj0e3UAUnim
         179w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690474868; x=1691079668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hss43lOMtTWZaP6PSxJpTqk3ynxiZmBIfWetPiB5OU4=;
        b=K6Hbm8OAFf3QQWwrFnO5lM3mhgmFtavzHUwb9KgRnmWTcOplrkq+I7dU09+N1mCwNb
         J5N2sgYzw35Vagwo2qH1Zim1GLudjU8sfetpoDOsHSEPGPVVmR1hiTP9fG3kfszVctog
         KOxImC5tdjka5jvHnQXXYU5xqfanZrBxcdIjvQ5WODl3ShOm0xc+/0HJkAKX1X5g3wII
         DvdDT6IToN8l4iZPVQG7xRpc6OyMi58kkeoJrkW2zsNpbS9jSjyn4ddIFoT/uGgckjW2
         4mMfvvtEEkYSsoNtGCRbq/D19tq3fftRkrSxs7RC/W7/Yun4iQW5JHH91tlbdbeAxROB
         jj0Q==
X-Gm-Message-State: ABy/qLbF+6QpsZkb+GV3O+g5C+mShofks4/QL5TCKd9YIotcZOCYTTms
        PyVsy4v7SKk/L32MnSv5+RQXqg==
X-Google-Smtp-Source: APBJJlH/fIxEZ729kMD+e6bMyn267HlAYoWAPHkICnfabMa1VE0mlPeQcN1xXdi7j7obwrk87PK3Uw==
X-Received: by 2002:aa7:c68f:0:b0:522:3ef1:b10 with SMTP id n15-20020aa7c68f000000b005223ef10b10mr2113757edq.6.1690474868671;
        Thu, 27 Jul 2023 09:21:08 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a15-20020aa7d90f000000b00521953ce6e0sm808027edr.93.2023.07.27.09.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 09:21:08 -0700 (PDT)
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
Subject: [PATCH 2/7] drm/msm/dpu: drop the DPU_PINGPONG_TE flag
Date:   Thu, 27 Jul 2023 19:20:59 +0300
Message-Id: <20230727162104.1497483-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
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

