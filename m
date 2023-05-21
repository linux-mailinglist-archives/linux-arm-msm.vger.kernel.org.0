Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 689F070AFD8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 21:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229693AbjEUTWh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 15:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbjEUTWf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 15:22:35 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C14DD
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:22:33 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f3bb61f860so1046915e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684696952; x=1687288952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFwtzcvqRvNroUtFoB812ypHe5ZO1CHq5l5/BXNAQBY=;
        b=jnxrhtGKPOnumKOFqmzCjKhWr/QccFJoU/UZOXeSqL5f3kHkgcBzhZnUjDuCDhs/F7
         +RQQmrsw3aK3fNvSBSlwUgudk61C6ZLlpob/qYb8B78Eu1xMOOAeojlfCNa95eZ3NiGM
         Od0Q1D5wCC3TaUs1niVVVSKgrKr5g2UsqrwbaPYGEGeRyM9qtcG2omxbLkR4CSqDWSNn
         ulVPXnIOi+kgmu+4uP64hXECDqbRjWnnBlCFLyX/dQlBljIBazh1NDxGxOPreQ/EJVFX
         hFT80C7JeJIazxgw0ASdDcvZPq4m/JaO8LhyMLvVcrhZMu4h63PcZ0TQDgOdn0IgDP52
         dhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684696952; x=1687288952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFwtzcvqRvNroUtFoB812ypHe5ZO1CHq5l5/BXNAQBY=;
        b=k0XmWctb7lfBoMfaX/2a+g7JfFYb2rx0B3PeJxmh123VOHop/CmIhhUg1WZ6VlZ7W+
         8aeaTBsmn4IYMgOuSoF4eDlBujR+UAkc8wCgJ8l2D+Hqpn39fdYynaaKyl41I/P6BYvB
         9bO+wPX5SAyBtjGtveVrY61ffKnqwFkmvqlGDlOEf11ba2OLtVY7moCPPsSPrQPQ6DuQ
         5OylExTSwc57oIbjOaU/dJnC92XqY1rknZl4F4LFOr8d53E2+CFdp0QTUzhcKArmTgsU
         AgRddTiSzfWAGKFU5LLR/Vb8cXorDwa9CxzNdU7Blyev3oE0+vqDBqJKrOVOQLVvlyMJ
         JglQ==
X-Gm-Message-State: AC+VfDy0NxGlelW8vdSEE6I2Qb/fPQv7hXwDxOPVsGwYKnUAgDfXpsEL
        mIb1FZeYTmORTGKRJx9Wm6X5Rw==
X-Google-Smtp-Source: ACHHUZ4K/Tv/eWzuvSp2fQQkhbRq8GcIGoMuPJcUj1H+iiYPZC4+lBWGJCFv93++OxrjrVvbXntzVw==
X-Received: by 2002:ac2:5298:0:b0:4f3:7c24:1025 with SMTP id q24-20020ac25298000000b004f37c241025mr2693894lfm.26.1684696951949;
        Sun, 21 May 2023 12:22:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a13-20020a19f80d000000b004edc9da63bdsm692707lff.160.2023.05.21.12.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 12:22:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/msm/dpu: drop (mostly) unused DPU_NAME_SIZE define
Date:   Sun, 21 May 2023 22:22:29 +0300
Message-Id: <20230521192230.9747-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
References: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
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

This define is used only in one place, in dpu_encoder debugfs code.
Inline the value and drop the define completely.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 2 --
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index c771383446f2..af34932729db 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2116,14 +2116,14 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 
-	char name[DPU_NAME_SIZE];
+	char name[12];
 
 	if (!drm_enc->dev) {
 		DPU_ERROR("invalid encoder or kms\n");
 		return -EINVAL;
 	}
 
-	snprintf(name, DPU_NAME_SIZE, "encoder%u", drm_enc->base.id);
+	snprintf(name, sizeof(name), "encoder%u", drm_enc->base.id);
 
 	/* create overall sub-directory for the encoder */
 	dpu_enc->debugfs_root = debugfs_create_dir(name,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 66209e2448d2..c4f82180ad10 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -63,8 +63,6 @@
 #define ktime_compare_safe(A, B) \
 	ktime_compare(ktime_sub((A), (B)), ktime_set(0, 0))
 
-#define DPU_NAME_SIZE  12
-
 struct dpu_kms {
 	struct msm_kms base;
 	struct drm_device *dev;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 14b5cfe30611..ac75ba13aa01 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -42,8 +42,6 @@
 #define SHARP_SMOOTH_THR_DEFAULT	8
 #define SHARP_NOISE_THR_DEFAULT	2
 
-#define DPU_NAME_SIZE  12
-
 #define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
 #define DPU_ZPOS_MAX 255
 
-- 
2.39.2

