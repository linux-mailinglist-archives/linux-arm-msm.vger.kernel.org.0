Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5A9B70AFB8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 21:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbjEUTEt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 15:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230108AbjEUTEs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 15:04:48 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A2E7D7
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:04:46 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f3a9ad31dbso3752000e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684695884; x=1687287884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFwtzcvqRvNroUtFoB812ypHe5ZO1CHq5l5/BXNAQBY=;
        b=PdWPwOSn4lfj7ffc4GHQUp7BAeYOBLWIOAI8sZh83v5fokUirhtuSPDdqughJXa8FJ
         aZtdOyWWqwFc/sP13sEQHwgiOaPRZ0hceKvr4An6GjFbTprd/Lf0ldcJo+1Ad+H+SkWE
         7Pdy/iEUuZRynHn3w/UKObFQWLIm/yjXeOxuV6gnX7ZVF2vu90pB+2cEvmcVY/ObLzn8
         fvYo9jdw+fGLCAyZ4C7N+rT3eL0BHm5HF6jF7d2dA8jXG5XwXa9Tp2pFdGV4DxDKjUKy
         cuXUMqMkaR8pytZ/+1YN1b8TOpmL3SMBmG1xyJDuQ6rlVEYl1kPpqYikyEiGlxdi3+wE
         wlhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684695884; x=1687287884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFwtzcvqRvNroUtFoB812ypHe5ZO1CHq5l5/BXNAQBY=;
        b=i3gRyR3yOCNaf6tqu+H4z2EDBjvwNT6EUp8OpJ5BRQUAk0BT/CzfoR/U4ZgpUl+5Sm
         AsJ5F3xn+mmn4YPDzFDkhy3Zftgu/FSh9O0lMBCgdVwwdn/p2/e9Re00SFr7qMACWsRl
         D9LFuAxXhMfaVvKpvPB1OX2yTVEfrkgISkrOJyTIONjKyq6gBSCQPeGAWPIjaYPDd1sV
         aYJ57SpCg+ugIKlNF5D8iCwAUhqrywO5VrFLsK5BlwyFVtMfZr0uLnX+GrsVEJiv/o78
         9eETdNSRrB+t1zeGKFoZDxpiGxEjZxfCCRuxFheMeRkVg5jsJQJ7lo4hAgverznByZof
         KQbg==
X-Gm-Message-State: AC+VfDy3AZ6pDIqt+xzt0jFMIdMOfs7mzPBMKSd/QIGTU7mh2a2HTYM7
        z+lXsH5eSPz1T7IRnoAOQDli2A==
X-Google-Smtp-Source: ACHHUZ5KLyPcDMihVmWbsBXJBaR7W4XAp5A315zXXHlc1KZhux+m/uzZjrknqXCRVOC4stVRYAVugQ==
X-Received: by 2002:ac2:4e63:0:b0:4f3:5038:5857 with SMTP id y3-20020ac24e63000000b004f350385857mr2289443lfs.55.1684695884594;
        Sun, 21 May 2023 12:04:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r22-20020ac252b6000000b004f1d884a4efsm694495lfm.242.2023.05.21.12.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 12:04:44 -0700 (PDT)
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
Subject: [PATCH 1/2] drm/msm/dpu: drop (mostly) unused DPU_NAME_SIZE define
Date:   Sun, 21 May 2023 22:04:41 +0300
Message-Id: <20230521190442.8293-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230521190442.8293-1-dmitry.baryshkov@linaro.org>
References: <20230521190442.8293-1-dmitry.baryshkov@linaro.org>
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

