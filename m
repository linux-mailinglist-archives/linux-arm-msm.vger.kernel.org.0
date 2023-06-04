Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31722721469
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 05:13:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbjFDDNP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Jun 2023 23:13:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjFDDNN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Jun 2023 23:13:13 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 748F0CF
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jun 2023 20:13:12 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b1b66a8fd5so18903141fa.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jun 2023 20:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685848391; x=1688440391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYLA29VsU9QCk6j7LBZzCA0nCXZou+a5ye4Thvl7Rxo=;
        b=HztxMKCjxn2iCy5+lKlyACMqndYqI1V/ksSjlVruigvSq/ug6f1EoUI/zC6A8+34pP
         F57WAu/rYH6GQToz7vOezLYQYc3o5sVYbi+lgvB+a0KlxYqwykMDE8ovLDQWqOc44Grh
         m2ntvWcA6BCyVJSBcJhmUcrHbJMOoZG0QyvS64kFHmesYqraZkR5JbTEVPij97ljFnRU
         MYUPrxrS+c31XW5CYJOOOflOHsDfPhV7FMpUp8HHr8uHGsVX/ezCqgeQTMoseL3WD5u5
         GStbySJUfL4xExFGk4cYAM2IeT2qUbLF8uj8FoxjIHnOzai2W2NBf701t2sDryi5w2+e
         /kDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685848391; x=1688440391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYLA29VsU9QCk6j7LBZzCA0nCXZou+a5ye4Thvl7Rxo=;
        b=U9ABWby4XKixHNN3CCsi7uZCwXxqQiayrcHqGXSQd247bZbmCtxcwzmjrgEXQpY4kQ
         qMNr/wimzm44K7oGiA9vnLTl7D2l9dWGaZlyANe2zYDVhqt/XNG357T5ULlPaIuFxnJM
         U3bK/VoLVyhMcHp3G4hMj236eoGtHcPmBX+Avx5HFJ+xo0bLUhAApavL2ObRXRZLwPtN
         dH4pPJXBlxiemAX1p8vbJVw+fWfGv9Xw8KDHbGXNFHfJA0VBI4l0ljpNrmM+hqOyeWsM
         sENO9Kv8Yoh93a7R/Xr5mfvrNExKNWR4M+3iR3i9UmCMBpe24M6gC1DNFn7PEbjuvAiF
         C0QQ==
X-Gm-Message-State: AC+VfDy+73R6R6tjVbORC7432yJAHagV0I+iJcvN52lK8Q2HQ2S4y21r
        rRtSJO0N+0sKuwuXlcITP0rysg==
X-Google-Smtp-Source: ACHHUZ6C1Zsu6SNPpSrE1bjGwvHfaesKAskzT3VFGGgWgUsSxGvJTy75bbTAzHjxdUzU/gMGIGLbww==
X-Received: by 2002:a2e:86d0:0:b0:2af:18f9:ed31 with SMTP id n16-20020a2e86d0000000b002af18f9ed31mr2301801ljj.1.1685848390773;
        Sat, 03 Jun 2023 20:13:10 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a25-20020a2e8619000000b002ab5ad42f3fsm856261lji.92.2023.06.03.20.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jun 2023 20:13:10 -0700 (PDT)
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
Subject: [PATCH v2 2/2] drm/msm/dpu: use PINGPONG_NONE to unbind WB from PP
Date:   Sun,  4 Jun 2023 06:13:08 +0300
Message-Id: <20230604031308.894274-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604031308.894274-1-dmitry.baryshkov@linaro.org>
References: <20230604031308.894274-1-dmitry.baryshkov@linaro.org>
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

Currently the driver passes the PINGPONG index to
dpu_hw_wb_ops::bind_pingpong_blk() callback and uses separate boolean
flag to tell whether WB should be bound or unbound. Simplify this by
passing PINGPONG_NONE in case of unbinding and drop the flag completely.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c         | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c           | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h           | 2 +-
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3e543d664c98..493905a5b63a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2080,8 +2080,7 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
 	if (phys_enc->hw_wb) {
 		/* disable the PP block */
 		if (phys_enc->hw_wb->ops.bind_pingpong_blk)
-			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, false,
-					phys_enc->hw_pp->idx);
+			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, PINGPONG_NONE);
 
 		/* mark WB flush as pending */
 		if (phys_enc->hw_ctl->ops.update_pending_flush_wb)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index e9325cafb1a8..a466ff70a4d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -210,7 +210,7 @@ static void dpu_encoder_phys_wb_setup_cdp(struct dpu_encoder_phys *phys_enc)
 
 		/* setup which pp blk will connect to this wb */
 		if (hw_pp && phys_enc->hw_wb->ops.bind_pingpong_blk)
-			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, true,
+			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb,
 					phys_enc->hw_pp->idx);
 
 		phys_enc->hw_ctl->ops.setup_intf_cfg(phys_enc->hw_ctl, &intf_cfg);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index dcffd6cc47fc..ebc416400382 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -154,7 +154,7 @@ static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
 
 static void dpu_hw_wb_bind_pingpong_blk(
 		struct dpu_hw_wb *ctx,
-		bool enable, const enum dpu_pingpong pp)
+		const enum dpu_pingpong pp)
 {
 	struct dpu_hw_blk_reg_map *c;
 	int mux_cfg;
@@ -167,7 +167,7 @@ static void dpu_hw_wb_bind_pingpong_blk(
 	mux_cfg = DPU_REG_READ(c, WB_MUX);
 	mux_cfg &= ~0xf;
 
-	if (enable)
+	if (pp)
 		mux_cfg |= (pp - PINGPONG_0) & 0x7;
 	else
 		mux_cfg |= 0xf;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
index c7f792eeb55c..2d7db2efa3d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
@@ -49,7 +49,7 @@ struct dpu_hw_wb_ops {
 			  bool enable);
 
 	void (*bind_pingpong_blk)(struct dpu_hw_wb *ctx,
-			bool enable, const enum dpu_pingpong pp);
+				  const enum dpu_pingpong pp);
 };
 
 /**
-- 
2.39.2

