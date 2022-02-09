Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54C6C4AF80C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Feb 2022 18:25:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238141AbiBIRZ0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Feb 2022 12:25:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238148AbiBIRZZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Feb 2022 12:25:25 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0A72C05CB82
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Feb 2022 09:25:27 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id k13so5522331lfg.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Feb 2022 09:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tkfC5TUEm5vYZaztIKawUNBYYGPAof7pzxftrloc+wI=;
        b=LvUk4/uHqG/gKvS0PZOGMhkFtgMM9yc5eEz3ZqImdyu9B8PIxteNjz0eTBVxWBEDHx
         En/z4XAejrLOQyEIZHEE/IGyiGl2AgGh60Q+2iJCwwHjqNzrykbJQ/ZWQKHdBN9r5AiT
         dd+Tz3wMeMZ/HU/RzH52+nv7tqKG2V39N8pb5vtJQmlSMvrmpiKTmyg8XC6WO9ETy1K8
         t50lC1hQTcP4sRaxd1eQnHIi6DnfY+11NqzM4SfY4f9CTRZ3pUr6rtQZLpM0ntbRN61c
         17E8pBR00zaQZ75OURn4pBTn7Dvnckty4Aw7L+qmGMNVUU5lFoT3GJoBEAM5WkF68Rgo
         4QMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tkfC5TUEm5vYZaztIKawUNBYYGPAof7pzxftrloc+wI=;
        b=tSvLiIahc7uvJKcUzmLxV/EADZKsrlcsjJCzM9/RQKaERsFCOkMTddJ6VW+4rllg11
         a9y59S3gyFi+sQEypP/pkfZh9dRjm46AhBLVhdCqyzyicBz8og3wgm0frZ7Vd4ytUo4K
         0vX3BsjNx6ezNj62FHVMQXrBH80k0obdPwe3CaboTTSMbChzbNxyG5/LDb4kKXd3jdDo
         cMqRqm41ko1b/CVjJlwz0pbkxvD8snw3YhTfii4MBim0GM9N6d1dCT5hVx9go0Kwwon8
         LgiyI80GqXOs142nYRos/aJDJXIriZF+kd9jzZ+8K1iGgpGfBxyXGAKXlXHE6LF0EK2C
         1OnA==
X-Gm-Message-State: AOAM533cu04G0IGgLE2BuFzKXGZzhiXB62lByO6dRNS0BWyJFXqvo8ko
        hyCdfuvBwwH/GMThlc+kc/lGOQ==
X-Google-Smtp-Source: ABdhPJxFnSDUdeXlEr/gTiTZj/RrA+xjsQ81Wk8JIJ8mFzZkzyOgzgbB0nIhOdkcfDPYd7TFEmCXgw==
X-Received: by 2002:ac2:5dcb:: with SMTP id x11mr2235969lfq.254.1644427526198;
        Wed, 09 Feb 2022 09:25:26 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u14sm2560055lji.40.2022.02.09.09.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Feb 2022 09:25:25 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 04/25] drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
Date:   Wed,  9 Feb 2022 20:24:59 +0300
Message-Id: <20220209172520.3719906-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
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

As SSPP blocks are now visible through dpu_kms->rm.sspp_blocks, move
SSPP debugfs creation from dpu_plane to dpu_kms.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 19 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 16 ----------------
 3 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index f805c30643b1..674f311f99b4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -415,7 +415,6 @@ struct dpu_hw_pipe *dpu_hw_sspp_init(enum dpu_sspp idx,
  */
 void dpu_hw_sspp_destroy(struct dpu_hw_pipe *ctx);
 
-void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root);
 int _dpu_hw_sspp_init_debugfs(struct dpu_hw_pipe *hw_pipe, struct dpu_kms *kms, struct dentry *entry);
 
 #endif /*_DPU_HW_SSPP_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 4d2b75f3bc89..8196b11fe2f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -259,6 +259,25 @@ void dpu_debugfs_create_regset32(const char *name, umode_t mode,
 	debugfs_create_file(name, mode, parent, regset, &dpu_fops_regset32);
 }
 
+static void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
+{
+	struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
+	int i;
+
+	if (IS_ERR(entry))
+		return;
+
+	for (i = SSPP_NONE; i < SSPP_MAX; i++) {
+		struct dpu_hw_pipe *pipe_hw;
+
+		if (!dpu_kms->rm.sspp_blks[i - SSPP_NONE])
+			continue;
+
+		pipe_hw = to_dpu_hw_pipe(dpu_kms->rm.sspp_blks[i - SSPP_NONE]);
+		_dpu_hw_sspp_init_debugfs(pipe_hw, dpu_kms, entry);
+	}
+}
+
 static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 146dbccd79cd..37742f74a7bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1359,22 +1359,6 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 	_dpu_plane_set_qos_ctrl(plane, enable, DPU_PLANE_QOS_PANIC_CTRL);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
-
-/* SSPP live inside dpu_plane private data only. Enumerate them here. */
-void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
-{
-	struct drm_plane *plane;
-	struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
-
-	if (IS_ERR(entry))
-		return;
-
-	drm_for_each_plane(plane, dpu_kms->dev) {
-		struct dpu_plane *pdpu = to_dpu_plane(plane);
-
-		_dpu_hw_sspp_init_debugfs(pdpu->pipe_hw, dpu_kms, entry);
-	}
-}
 #endif
 
 static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
-- 
2.34.1

