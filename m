Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22D366BD664
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 17:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbjCPQzz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Mar 2023 12:55:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbjCPQzx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Mar 2023 12:55:53 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF8721C7FF
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:55:51 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id t11so3205307lfr.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Mar 2023 09:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678985750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0ShU0VoJuNaKygLaJG1lCz4q0jlhQ8mz6XNRmWcdJs=;
        b=QuHvkes9v4ZTH/Vl9DB0orcq9WFCciQYdTzD9HTFz//niEMeahCpZ6DSXlRZzojKtz
         DRhHZaED9qUo9xSVegq8hbhn/YWA1/i/64IGlZgcxN81ElFSTQa67e4zV+H+Eg5j20Ds
         hionxBfHDG1HviuNXY6M1/HmwFUBpiZrcXMGI/uzcS8uF5irdGfsOCzQFAfZSYE7O4aJ
         ACUD72yNhzSrBv4kDfOAKzF237jZbBxuBFY2dqDDMaJbb9QZDndo1Ats2oO8rbMT7szf
         ECAfDL/7Oz0f5aZx9YWGNv9HDYCohBm3rVg69v5zNwoaHCzd1OipeOZd2I/ZGewmV9Zk
         lLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678985750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C0ShU0VoJuNaKygLaJG1lCz4q0jlhQ8mz6XNRmWcdJs=;
        b=thXNSoQSdh0A74aOShCg0cfwQFANjaiCXiHWxw12zipFW+eSU7Su7vTZDs5BTcb9Jx
         Qm8iT8iKMYblxi49dQi6xQnaAR8/gaEkfFlMcKPMC6sa/kgo6Jc6AQ2gsGGw1I+uVw6P
         Y9LQrXs/eObfZlgxNev4KF7NpArzNMpVZ07xgJBtkDMDDCBnxXwhDEzHqfrZ+Sv/BI3L
         xOV833x0IbJMEua03n2pOdZ4J5GD00CymzoX5cScp0mRI9SgnCfrOI7sjWOwaHq4+IGo
         /1WT4blr//RGQhLiW8+f4D25l4qE6rWHKnqgUI44VUByyhj3ZIT5EKHN52q5YEh4q7n0
         6/1A==
X-Gm-Message-State: AO0yUKVbr+4mJmXHaDnqOOpurWgvfAVYLUaneYxBSabXiTUoy8bOH31q
        LUfqgwSaMEmT4ITwgXRcmTFfVwCUjvVcqiM5lG8=
X-Google-Smtp-Source: AK7set8hEMPRMlGti3hJfxaUCYimcmozpQeodINvAsD+3JlHSMFVODMXbt8+vBM7RUdmZfZOgw3j1g==
X-Received: by 2002:a05:6512:2303:b0:4db:787:e43b with SMTP id o3-20020a056512230300b004db0787e43bmr32660lfu.8.1678985750142;
        Thu, 16 Mar 2023 09:55:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id t18-20020a2e9c52000000b002934b5d6a61sm2661ljj.121.2023.03.16.09.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 09:55:49 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [RFC PATCH v1 07/12] drm/msm/dpu: fill CRTC resources in dpu_crtc.c
Date:   Thu, 16 Mar 2023 19:55:37 +0300
Message-Id: <20230316165542.4109764-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
References: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
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

Stop poking into CRTC state from dpu_encoder.c, fill CRTC HW resources
from dpu_crtc_assign_resources().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 27 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++----------------
 2 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 77226de54363..8ef191fd002d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1177,6 +1177,7 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 }
 
 #define MAX_HDISPLAY_SPLIT 1080
+#define MAX_CHANNELS_PER_CRTC 2
 
 static struct msm_display_topology dpu_crtc_get_topology(
 			struct drm_crtc *crtc,
@@ -1219,9 +1220,14 @@ static struct msm_display_topology dpu_crtc_get_topology(
 
 static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
 {
+	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_CRTC];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_CRTC];
+	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_CRTC];
+	int i, num_lm, num_ctl, num_dspp;
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
 	struct dpu_global_state *global_state;
 	struct msm_display_topology topology;
+	struct dpu_crtc_state *cstate;
 	int ret;
 
 	/*
@@ -1243,6 +1249,27 @@ static int dpu_crtc_assign_resources(struct drm_crtc *crtc, struct drm_crtc_stat
 	if (ret)
 		return ret;
 
+	cstate = to_dpu_crtc_state(crtc_state);
+
+	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
+	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
+	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		crtc, DPU_HW_BLK_DSPP, hw_dspp,
+		ARRAY_SIZE(hw_dspp));
+
+	for (i = 0; i < num_lm; i++) {
+		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
+
+		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
+		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
+		if (i < num_dspp)
+			cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
+	}
+
+	cstate->num_mixers = num_lm;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 204360485b81..068d4e47eaa9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -934,14 +934,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc;
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
-	struct dpu_crtc_state *cstate;
 	struct dpu_global_state *global_state;
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
-	int num_lm, num_ctl, num_pp, num_dsc;
+	int num_pp, num_dsc;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -968,13 +965,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
 		ARRAY_SIZE(hw_pp));
-	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
-	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
 	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->crtc, DPU_HW_BLK_DSPP, hw_dspp,
-		ARRAY_SIZE(hw_dspp));
+		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
@@ -992,18 +984,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	dpu_enc->dsc_mask = dsc_mask;
 
-	cstate = to_dpu_crtc_state(crtc_state);
-
-	for (i = 0; i < num_lm; i++) {
-		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
-
-		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
-		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
-		cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
-	}
-
-	cstate->num_mixers = num_lm;
-
 	dpu_enc->connector = conn_state->connector;
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-- 
2.30.2

