Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0DD7BF282
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Oct 2023 07:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379421AbjJJFya (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Oct 2023 01:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379414AbjJJFy3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Oct 2023 01:54:29 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51DC99D
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 22:54:28 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-50444e756deso7055070e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 22:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696917266; x=1697522066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QEUI7WElxyrFqo5uc28jvvLJFsc02bWiPPqj3cviB+U=;
        b=gH0RrYTIo1+peu54pKnsYvr+vQ9hhC+f2pP33D+eoNiz0fS/1PExqQFDuUwBCyaCVs
         ar+C0a3gkM+VqwRrsslNUni8Zn+P+sTjYASH7rODvNKL8gW6x0HEZm+04hvskEhvsAaW
         llAhYwfd7LjGm5hDlxVhoAGh+zz1WwZOwpi7KoUP9A/NE/WfLJYRdluj9hg/OcPfTSiT
         odZywCcg7PnMQp5pQmqOwo82IfXUaIUlBTFufuPtG0jPmsoE2FLr4k+/rmPUAkM9As0e
         4r/W2dlqpJ55twShDAharR0iXNvMbOgvF3QTv3c+9jvIxA4qjxwiCgwibAhNrXhL1nzd
         aM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696917266; x=1697522066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QEUI7WElxyrFqo5uc28jvvLJFsc02bWiPPqj3cviB+U=;
        b=kJDi33JtLnBzkzYh980OtAAoVMnae2l5jscQgAItUwaWRTsKF0QvhJGf0IVhlAfVFo
         549AUInmzdneH0IBX8W9wNp2tK3LIGLkzHpDstskoS7QihBrMx8lZX48JIVoMovdOQ7e
         4xoDRzSudojKgqGbPKmk8MrQVQWwj/GH8EnUGmdsfZc0TcqkiAswXT/pH5pWJMxjdL0D
         PxrKuwIqrqlJhTOugQIGMUNwSA6c/MKEq9IdRIRJFaN3K8gwAhTzLy2crUE9ahz0m+j1
         PwVH4/j0SqHM1n5AqzTehIbFFHsZeTCBez29qXY+dCuM/rXym90s0vF1swFmqWp4afYe
         U07g==
X-Gm-Message-State: AOJu0YwPiMvIHdekmMBkttSfnJJF+EH4Vf1kQD/++QQmEj9859+xixHu
        vf8dwd/RzbZi3an2b6NDLNTunw==
X-Google-Smtp-Source: AGHT+IGieqVKjLlnVHtcDymyKdRInCVinttJ4Uwo0Ld2tiGJ7uOdN5rtYPVDF6+cDspnRVciNuzVWg==
X-Received: by 2002:a05:6512:758:b0:503:59d:fbff with SMTP id c24-20020a056512075800b00503059dfbffmr6273168lfs.2.1696917266417;
        Mon, 09 Oct 2023 22:54:26 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v2-20020ac25582000000b004fe1f1c0ee4sm1668371lfg.82.2023.10.09.22.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 22:54:26 -0700 (PDT)
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
Subject: [PATCH] drm/msm: don't create GPU-related debugfs files with no GPU present
Date:   Tue, 10 Oct 2023 08:54:25 +0300
Message-Id: <20231010055425.2851776-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If there is no GPU present, skip creation of the GPU-related debugfs
files, making the MSM's debugfs more usable.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 41 +++++++++++++++++++------------
 drivers/gpu/drm/msm/msm_rd.c      |  3 +++
 2 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 04d304eed223..4494f6d1c7cb 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -304,36 +304,21 @@ int msm_debugfs_late_init(struct drm_device *dev)
 	return ret;
 }
 
-void msm_debugfs_init(struct drm_minor *minor)
+static void msm_debugfs_gpu_init(struct drm_minor *minor)
 {
 	struct drm_device *dev = minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dentry *gpu_devfreq;
 
-	drm_debugfs_create_files(msm_debugfs_list,
-				 ARRAY_SIZE(msm_debugfs_list),
-				 minor->debugfs_root, minor);
-
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
-	if (priv->kms) {
-		drm_debugfs_create_files(msm_kms_debugfs_list,
-					 ARRAY_SIZE(msm_kms_debugfs_list),
-					 minor->debugfs_root, minor);
-		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
-				    dev, &msm_kms_fops);
-	}
-
 	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
 		&priv->hangcheck_period);
 
 	debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
 		&priv->disable_err_irq);
 
-	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
-		dev, &shrink_fops);
-
 	gpu_devfreq = debugfs_create_dir("devfreq", minor->debugfs_root);
 
 	debugfs_create_bool("idle_clamp",0600, gpu_devfreq,
@@ -344,6 +329,30 @@ void msm_debugfs_init(struct drm_minor *minor)
 
 	debugfs_create_u32("downdifferential",0600, gpu_devfreq,
 			   &priv->gpu_devfreq_config.downdifferential);
+}
+
+void msm_debugfs_init(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+
+	drm_debugfs_create_files(msm_debugfs_list,
+				 ARRAY_SIZE(msm_debugfs_list),
+				 minor->debugfs_root, minor);
+
+	if (priv->gpu_pdev)
+		msm_debugfs_gpu_init(minor);
+
+	if (priv->kms) {
+		drm_debugfs_create_files(msm_kms_debugfs_list,
+					 ARRAY_SIZE(msm_kms_debugfs_list),
+					 minor->debugfs_root, minor);
+		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
+				    dev, &msm_kms_fops);
+	}
+
+	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
+		dev, &shrink_fops);
 
 	if (priv->kms && priv->kms->funcs->debugfs_init)
 		priv->kms->funcs->debugfs_init(priv->kms, minor);
diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
index 5adc51f7ab59..ca44fd291c5b 100644
--- a/drivers/gpu/drm/msm/msm_rd.c
+++ b/drivers/gpu/drm/msm/msm_rd.c
@@ -270,6 +270,9 @@ int msm_rd_debugfs_init(struct drm_minor *minor)
 	struct msm_rd_state *rd;
 	int ret;
 
+	if (!priv->gpu_pdev)
+		return 0;
+
 	/* only create on first minor: */
 	if (priv->rd)
 		return 0;
-- 
2.39.2

