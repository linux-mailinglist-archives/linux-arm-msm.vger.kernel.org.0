Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5956871F097
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jun 2023 19:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232754AbjFARWo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Jun 2023 13:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbjFARWn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Jun 2023 13:22:43 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F67B3
        for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jun 2023 10:22:41 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f3bb395e69so1541554e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jun 2023 10:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685640160; x=1688232160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9LHv6MLqj1UFslBgBU0GI2YzwaoUEtuSoDMMDqrvq0=;
        b=qfU7rQt9jF8gHaPx9R+03RaIYf95MMsgg3CUrMJ9Q1cEHJIvmUQ9hh68BDTXivBjji
         McLtVRxAwV+BQWDIRuF1fCaBFh3Pq0Hnu6xxjdRvgY6Gk3+33ZCr7RSSqx9IXrkKdKsg
         PSFrG8/I1THgYglH4JvwgjK2H66dXc+7/YSSx8QbbNGhnD2gnAL30U2Hjgtnyg9B7wqw
         u8QKg7ITsEG8brTuI+kT+Zg2TBaIy4dJu2IG1OhgRVZjoEWiWsE0bKXxHXbBgwyMuU7T
         gCUMc0D5btSQIv7zvyHdKUBUpmpsYnL14Phb9rzrbt0qqmLeY18cCVPSzWwWlcjYl+bI
         Atcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685640160; x=1688232160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M9LHv6MLqj1UFslBgBU0GI2YzwaoUEtuSoDMMDqrvq0=;
        b=hStzU/InWYEEFox48XqrI8pG70nfvI5io+q8sfjEd4bcK5bSs8eJ7PoD8HJco97xgn
         FtKuCm+SoTKlj8xC9JHwWJGUYu9lqRnm17mF6UkBHvMohJe6WJUsDiCG8nlAIpEssw4C
         tU2QZrleTsIxNrrsp8YmMZnbmwQJipUKo1wTotHzYptcxdkXm1JKioW1HHCY4y7l/sqx
         pIVBtOHpx2Z9yKRBMTelaVhOF6Qg33SEtoRWnH7okZR995DfmYsFXXWr0h7crzIf4xuF
         pGo2sE5KWr4AjeG99zXjhAMzjrg3JYTNeEPudD8m/mTI4EdEdpcG1+QJwGiDWg1Q3OJh
         Rrgg==
X-Gm-Message-State: AC+VfDwLr4RWHqpXM79eTzLxWTXPUTX4PG/1JzF9xanUziu2baHcv89O
        bakjKUj5mxv6k2WId/6Tw3Tpdw==
X-Google-Smtp-Source: ACHHUZ6+DdSQIzAoYqU/A1u6/YpK2zdXQR75xe+cWQwxTVGuh9MnuPxNT254xAbF/mpfW7npwa+yyA==
X-Received: by 2002:ac2:5474:0:b0:4f6:7f9:112e with SMTP id e20-20020ac25474000000b004f607f9112emr399625lfn.11.1685640159784;
        Thu, 01 Jun 2023 10:22:39 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b25-20020ac25e99000000b004eb2f35045bsm1145739lfq.269.2023.06.01.10.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 10:22:39 -0700 (PDT)
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
Subject: [PATCH v3 2/7] drm/msm/dpu: separate common function to init physical encoder
Date:   Thu,  1 Jun 2023 20:22:31 +0300
Message-Id: <20230601172236.564445-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
References: <20230601172236.564445-1-dmitry.baryshkov@linaro.org>
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

Move common DPU physical encoder initialization code to the new function
dpu_encoder_phys_init().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 29 +++++++++++++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  3 ++
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 17 ++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 17 ++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 17 ++---------
 5 files changed, 37 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d4b759e8f2ae..475b30bef72d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2321,8 +2321,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-		atomic_set(&phys->vsync_cnt, 0);
-		atomic_set(&phys->underrun_cnt, 0);
 
 		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
 			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
@@ -2524,3 +2522,30 @@ unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
 
 	return dpu_enc->dsc_mask;
 }
+
+void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
+			  struct dpu_enc_phys_init_params *p)
+{
+	int i;
+
+	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
+	phys_enc->intf_idx = p->intf_idx;
+	phys_enc->wb_idx = p->wb_idx;
+	phys_enc->parent = p->parent;
+	phys_enc->dpu_kms = p->dpu_kms;
+	phys_enc->split_role = p->split_role;
+	phys_enc->enc_spinlock = p->enc_spinlock;
+	phys_enc->enable_state = DPU_ENC_DISABLED;
+
+	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
+		phys_enc->irq[i] = -EINVAL;
+
+	atomic_set(&phys_enc->vblank_refcount, 0);
+	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
+	atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
+
+	atomic_set(&phys_enc->vsync_cnt, 0);
+	atomic_set(&phys_enc->underrun_cnt, 0);
+
+	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 90f177e43262..aa98bfb70a26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -407,4 +407,7 @@ void dpu_encoder_frame_done_callback(
 		struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *ready_phys, u32 event);
 
+void dpu_encoder_phys_init(struct dpu_encoder_phys *phys,
+			   struct dpu_enc_phys_init_params *p);
+
 #endif /* __dpu_encoder_phys_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index d8ed85a238af..2bd806c51882 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -756,7 +756,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_cmd *cmd_enc = NULL;
-	int i, ret = 0;
+	int ret = 0;
 
 	DPU_DEBUG("intf %d\n", p->intf_idx - INTF_0);
 
@@ -767,28 +767,17 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 		return ERR_PTR(ret);
 	}
 	phys_enc = &cmd_enc->base;
-	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
-	phys_enc->intf_idx = p->intf_idx;
+
+	dpu_encoder_phys_init(phys_enc, p);
 
 	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
-	phys_enc->parent = p->parent;
-	phys_enc->dpu_kms = p->dpu_kms;
-	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_CMD;
-	phys_enc->enc_spinlock = p->enc_spinlock;
 	cmd_enc->stream_sel = 0;
-	phys_enc->enable_state = DPU_ENC_DISABLED;
-	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
-		phys_enc->irq[i] = -EINVAL;
 
 	phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
 			&phys_enc->dpu_kms->catalog->intf[p->intf_idx - INTF_0].features);
 
-	atomic_set(&phys_enc->vblank_refcount, 0);
-	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
-	atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
 	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
-	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
 	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
 
 	DPU_DEBUG_CMDENC(cmd_enc, "created\n");
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 3a374292f311..dc951fdf473b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -699,7 +699,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 		struct dpu_enc_phys_init_params *p)
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
-	int i;
 
 	if (!p) {
 		DPU_ERROR("failed to create encoder due to invalid parameter\n");
@@ -712,24 +711,12 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 		return ERR_PTR(-ENOMEM);
 	}
 
-	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
-	phys_enc->intf_idx = p->intf_idx;
-
 	DPU_DEBUG_VIDENC(phys_enc, "\n");
 
+	dpu_encoder_phys_init(phys_enc, p);
+
 	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
-	phys_enc->parent = p->parent;
-	phys_enc->dpu_kms = p->dpu_kms;
-	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
-	phys_enc->enc_spinlock = p->enc_spinlock;
-	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
-		phys_enc->irq[i] = -EINVAL;
-
-	atomic_set(&phys_enc->vblank_refcount, 0);
-	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
-	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
-	phys_enc->enable_state = DPU_ENC_DISABLED;
 
 	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->intf_idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index bac4aa807b4b..93440a0016ef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -694,7 +694,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_wb *wb_enc = NULL;
 	int ret = 0;
-	int i;
 
 	DPU_DEBUG("\n");
 
@@ -712,28 +711,16 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	}
 
 	phys_enc = &wb_enc->base;
-	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
-	phys_enc->wb_idx = p->wb_idx;
+
+	dpu_encoder_phys_init(phys_enc, p);
 
 	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
-	phys_enc->parent = p->parent;
-	phys_enc->dpu_kms = p->dpu_kms;
-	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_WB_LINE;
-	phys_enc->wb_idx = p->wb_idx;
-	phys_enc->enc_spinlock = p->enc_spinlock;
 
 	atomic_set(&wb_enc->wbirq_refcount, 0);
 
-	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
-		phys_enc->irq[i] = -EINVAL;
-
-	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
-	atomic_set(&phys_enc->vblank_refcount, 0);
 	wb_enc->wb_done_timeout_cnt = 0;
 
-	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
-	phys_enc->enable_state = DPU_ENC_DISABLED;
 
 	DPU_DEBUG("Created dpu_encoder_phys for wb %d\n",
 			phys_enc->wb_idx);
-- 
2.39.2

