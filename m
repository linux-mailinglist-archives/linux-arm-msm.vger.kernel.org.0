Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A435079F9C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 07:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232060AbjINFHQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 01:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232110AbjINFHP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 01:07:15 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17C3B193
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:11 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2bfbbd55158so8341541fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 22:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694668029; x=1695272829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R10mXVtDMcWIBom4B4RANApmxfehNpaKxAb93aUCAhw=;
        b=FiAOlyD9fUWRKVb3+SUEVN0q6GuZyMZ1YgCBuuJW/f+pBIoZpPq1fgYRL8IvTJ4HGc
         wxMYdL48mqOYO4p90OpoZQVCJ6gppXqHYe4aKpLiorhQ+wWz5CJIA4y+kSr9OELvq3qr
         W4Mp3CTnIuW/bhKpxT6HEZL59RLuKpgPKgiDYCqlApI04krzdLjCZ2VMD1rmTmjNMujP
         ZkxxzHvvdwJ9sh0q2Q9fGKqGPybzvRUEB26/f4yWSiDWJKN55mrE9ul3at64pLB0UDS4
         tPGg0pJUH9igfulyJYSnh/DXieX93riMl80VD/aH8r1rZsZsexIdBpUOWSL8ydAxXvtZ
         h6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694668029; x=1695272829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R10mXVtDMcWIBom4B4RANApmxfehNpaKxAb93aUCAhw=;
        b=AIu5hXOY/AoBpbDIQImwapMRDV3xzuv60zkY/sla4qQFSRfnTjVjabo2CEhKBfNb8q
         NyzIsaPU/5zYD8SkH4/0xNQo17Qe1o1yPK8rTUvqSYDEyN0bKoJhOKxeX0dKfElYGyw+
         mQwFMYenxBVvP8gbD3ts0k8ASAVyP7rhoQ+gp3DYzZmoaQ+r9kxdxVt00Gwk9q2lri+z
         nTd/JQC9G+oUbv4ssuC4jKaqo6AMPsurBzrF5axEyoaT7apovEDP/yjxMnSzr4gQSS4s
         Awsfu7s58ab8tMQ/18UCxhZ2GIgbaGXsH3JX9IRj1MnkHPZCVziVzB/9KsqhtA4V9xpD
         rewg==
X-Gm-Message-State: AOJu0YybwzD9kYJce835us8ln2mDLT4dL4V+TsGotXdX5jP0eIdbq620
        UOqeo1kfVafsTJ3D9Jxwv2WI3A==
X-Google-Smtp-Source: AGHT+IHnihmtc2vsv5dhrZBDc8UMldl6OVUIYcXEBdHEa7UfMhDIENjazXuDNb321U3p6nkW1W1rlA==
X-Received: by 2002:a2e:98d7:0:b0:2b9:48f1:b195 with SMTP id s23-20020a2e98d7000000b002b948f1b195mr3853326ljj.44.1694668029333;
        Wed, 13 Sep 2023 22:07:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 22:07:08 -0700 (PDT)
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
Subject: [PATCH v3 02/12] drm/msm/dpu: add current resource allocation to dumped state
Date:   Thu, 14 Sep 2023 08:06:56 +0300
Message-Id: <20230914050706.1058620-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Provide atomic_print_state callback to the DPU's private object. This
way the debugfs/dri/0/state will also include RM's internal state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |  4 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 48 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  8 +++++
 4 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ee84160592ce..172b64dc60e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -362,6 +362,7 @@ static void dpu_kms_global_destroy_state(struct drm_private_obj *obj,
 static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
 	.atomic_duplicate_state = dpu_kms_global_duplicate_state,
 	.atomic_destroy_state = dpu_kms_global_destroy_state,
+	.atomic_print_state = dpu_rm_print_state,
 };
 
 static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
@@ -375,6 +376,9 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
 	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
 				    &state->base,
 				    &dpu_kms_global_state_funcs);
+
+	state->rm = &dpu_kms->rm;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index ed549f0f7c65..dd2be279b366 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -130,6 +130,8 @@ struct vsync_info {
 struct dpu_global_state {
 	struct drm_private_state base;
 
+	struct dpu_rm *rm;
+
 	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
 	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
 	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f9215643c71a..5e3442fb8678 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -652,3 +652,51 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	return num_blks;
 }
+
+void dpu_rm_print_state(struct drm_printer *p,
+			const struct drm_private_state *state)
+{
+	const struct dpu_global_state *global_state = to_dpu_global_state(state);
+	const struct dpu_rm *rm = global_state->rm;
+	int i;
+
+	drm_puts(p, "pingpong:");
+	for (i = 0; i < ARRAY_SIZE(global_state->pingpong_to_enc_id); i++)
+		if (rm->pingpong_blks[i])
+			drm_printf(p, " %d,", global_state->pingpong_to_enc_id[i]);
+		else
+			drm_puts(p, " -,");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "mixer:");
+	for (i = 0; i < ARRAY_SIZE(global_state->mixer_to_enc_id); i++)
+		if (rm->mixer_blks[i])
+			drm_printf(p, " %d,", global_state->mixer_to_enc_id[i]);
+		else
+			drm_puts(p, " -,");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "ctl:");
+	for (i = 0; i < ARRAY_SIZE(global_state->ctl_to_enc_id); i++)
+		if (rm->ctl_blks[i])
+			drm_printf(p, " %d,", global_state->ctl_to_enc_id[i]);
+		else
+			drm_puts(p, " -,");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "dspp:");
+	for (i = 0; i < ARRAY_SIZE(global_state->dspp_to_enc_id); i++)
+		if (rm->dspp_blks[i])
+			drm_printf(p, " %d,", global_state->dspp_to_enc_id[i]);
+		else
+			drm_puts(p, " -,");
+	drm_puts(p, "\n");
+
+	drm_puts(p, "dsc:");
+	for (i = 0; i < ARRAY_SIZE(global_state->dsc_to_enc_id); i++)
+		if (rm->dsc_blks[i])
+			drm_printf(p, " %d,", global_state->dsc_to_enc_id[i]);
+		else
+			drm_puts(p, " -,");
+	drm_puts(p, "\n");
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 2b551566cbf4..913baca81a42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -92,6 +92,14 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
 
+/**
+ * dpu_rm_print_state - output the RM private state
+ * @p: DRM printer
+ * @state: private object state
+ */
+void dpu_rm_print_state(struct drm_printer *p,
+			const struct drm_private_state *state);
+
 /**
  * dpu_rm_get_intf - Return a struct dpu_hw_intf instance given it's index.
  * @rm: DPU Resource Manager handle
-- 
2.39.2

