Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5FA76A97B7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Mar 2023 13:57:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229563AbjCCM5f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Mar 2023 07:57:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbjCCM5b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Mar 2023 07:57:31 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBDBD567B2
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Mar 2023 04:57:29 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id k14so3447378lfj.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Mar 2023 04:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yt62C7qHhet0eDGfwuI4lO3fuOx6eMbCxLDhsjhMDQw=;
        b=WcrwNiIIqSi2xnBKQkK9+JVXuLosMGBcwngfzRheEFP+bghiuNx3TV3NAypJzkHVUM
         lrMiUuOE715b1j3JVht0E8yfRJsyKWfRLlrJgNmMJ3+D15b2O9S3PbLangwlY1k8vb5D
         HBDYl2fd/OeZYmR93rB4wjsVrWyXHhDPfS6gaNp+XtF/AkSV0HRVGlZD6kd6ZaFF6mV0
         xrbJ8kxzpfRu1RSmcA2gjt7Qdi0EB/s2jycageL6fGfGVBOd/lWBmMGiDUhslFWjylv9
         5hudmGjUCs8PoRs34WPppvL3GmTGLCs0ys+9jlB5nSKiV2a/Gr5IBhYjjfowq7g6jVaw
         bn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt62C7qHhet0eDGfwuI4lO3fuOx6eMbCxLDhsjhMDQw=;
        b=DEETpfYPEjnDQIVOZ2bTJxoWtcycKD/m8bS07JrFWN+mz4g7X5UiGbQoBxStyvNisU
         BnqDJLY26XJCBIhc+mBJqLt/7iXxxKVR7PZnGJX0NJ1wGmChHle/oVt/mxOMK8N7o8IG
         A1iNBD8ZpSOEajRoZ1503Zyn146nX0Z6KeoL1r0MPxZKmepiLugNmTTKbmQQeJJeZt4U
         E3aoE0fKL8l/LrVdKzER1r81X7mJtiHQDayqcJggE4TbmH8MYp+P6QvfT+7GMlQykRS0
         Km9f4Vj9vjA6Ul+9MXhlQA4iwAqKZXqovoggtuCqImsp08fG8o/SdXUJoihDU2qvfFHs
         FGEg==
X-Gm-Message-State: AO0yUKUqUMXBgTy7WGvw2ASazjbpd32zgvXQl9AKbID+lFtm1/plphBQ
        GROYjmWVJ7XJ1o1BC0l68Zc98Q==
X-Google-Smtp-Source: AK7set9WXEHTTIfOlH4/M39O1CsRskZdSYbVsVVtDy26H0V1QoYM3D9Mmui9j0vsrKc9xCnU2tlvyw==
X-Received: by 2002:ac2:514f:0:b0:4b5:61c5:8927 with SMTP id q15-20020ac2514f000000b004b561c58927mr505321lfd.42.1677848248202;
        Fri, 03 Mar 2023 04:57:28 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 04:57:27 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 03/30] drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
Date:   Fri,  3 Mar 2023 14:56:58 +0200
Message-Id: <20230303125725.3695011-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
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

As SSPP blocks are now visible through dpu_kms->rm.sspp_blocks, move
SSPP debugfs creation from dpu_plane to dpu_kms. We are going to break
the 1:1 correspondence between planes and SSPPs, so it makes no sense
anymore to create SSPP debugfs entries in dpu_plane.c

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 16 ----------------
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index bbff908e6dbe..c30f168b6c0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -388,7 +388,6 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
  */
 void dpu_hw_sspp_destroy(struct dpu_hw_sspp *ctx);
 
-void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root);
 int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
 			      struct dentry *entry);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a683bd9b5a04..0d2ef83c38ea 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -250,6 +250,24 @@ void dpu_debugfs_create_regset32(const char *name, umode_t mode,
 	debugfs_create_file(name, mode, parent, regset, &dpu_regset32_fops);
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
+		struct dpu_hw_sspp *hw = dpu_rm_get_sspp(&dpu_kms->rm, i);
+
+		if (!hw)
+			continue;
+
+		_dpu_hw_sspp_init_debugfs(hw, dpu_kms, entry);
+	}
+}
+
 static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index b054055f120b..2b0ebdd4c207 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1399,22 +1399,6 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
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
2.39.2

