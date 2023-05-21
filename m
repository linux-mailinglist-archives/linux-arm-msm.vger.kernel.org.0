Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12F6370AFD7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 May 2023 21:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230033AbjEUTWg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 21 May 2023 15:22:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229693AbjEUTWe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 21 May 2023 15:22:34 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10458CF
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:22:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f24cfb8539so5979584e87.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 May 2023 12:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684696951; x=1687288951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXMRGb1MvFb3LR9SwxNQHCX1I7kyPozNJxpNIKTyp3E=;
        b=hsi1IcoKsc0d64hXiZiDaciRM53HQEg2Ubxutrf09X1xqOMis7b7B9hEaiy+nlz3xF
         SfRP2s1LL7sY+k/5o+7MgVgcWQEXGqJ7yejj9EArE2pmU/PaDaPowpq1NuHQG5Iv0ah+
         J5pggusa1LVw544Hi7A/G9Qff9SqXMF3TaSXWB0X7T1pgLojcLuODeXmmsuVSjCFqVxD
         zjuR1CJCkM3kmu2sNVw73Ov4EcA/3VL5QGLc0gJRY6l6tZ4pG/MeP6lsErbAxkN5D4B2
         8fd8tYUAnUXKMr7if6keOmGNqlNsfIS2SOYnDKFK0Yof0HiyFokrXD5whwfbo10VcQtg
         rjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684696951; x=1687288951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXMRGb1MvFb3LR9SwxNQHCX1I7kyPozNJxpNIKTyp3E=;
        b=PveJKiTgDiiL8GQk7LWtvGzIdaMA8a+H55LvKX0/DweXF4emXnaHaE4u3AVf9i8Bo2
         6+njQHL/1ZBAuOINCeQMwg2xizPi9nZn7ZSGtiLlcI7QCOIkq+Lu+/A+diPr+ynQqU0W
         Ox0V1uOAAVPNex9eIHcr34Nlo0es4VLgwVLw63APfUHtGIcPWLXKQYY1Yh4o1p/IlXYL
         RJodBBP4rFy3GtVpZMHYHhMHzikBw0nv/jPIl4IVTUfWqbQZSBiVSFa+XYsHogrNJcFt
         KENGmB8gL79KoNUbnApSRD7RMlYdF9lGAvTsG8We6zQ3/9tvqZYl+pHfiC+s0MbVwdtQ
         uhGg==
X-Gm-Message-State: AC+VfDxaHJy7uxWkAu05mEgEHfOFaxBpu/a8qHcbje8tpNVXSXMT0p50
        9ihusURVPwtJufzqwcp/X2G1tg==
X-Google-Smtp-Source: ACHHUZ6+bvWso9kzQFn1RxwOYHel9XJzOMy3jupoyWB+q6AHUyhrQwIyLl9PnTg0KE5aCkR6f80cFw==
X-Received: by 2002:ac2:44d6:0:b0:4f1:3eca:769c with SMTP id d22-20020ac244d6000000b004f13eca769cmr2713743lfm.42.1684696951195;
        Sun, 21 May 2023 12:22:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a13-20020a19f80d000000b004edc9da63bdsm692707lff.160.2023.05.21.12.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 May 2023 12:22:30 -0700 (PDT)
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
Subject: [PATCH v2 1/3] drm/msm/dpu: drop dpu_encoder_phys_ops::late_register()
Date:   Sun, 21 May 2023 22:22:28 +0300
Message-Id: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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

This callback has been unused since the driver being added. Drop it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 7 -------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h | 3 ---
 2 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1dc5dbe58572..c771383446f2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2115,7 +2115,6 @@ DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
 static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	int i;
 
 	char name[DPU_NAME_SIZE];
 
@@ -2134,12 +2133,6 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 	debugfs_create_file("status", 0600,
 		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
 
-	for (i = 0; i < dpu_enc->num_phys_encs; i++)
-		if (dpu_enc->phys_encs[i]->ops.late_register)
-			dpu_enc->phys_encs[i]->ops.late_register(
-					dpu_enc->phys_encs[i],
-					dpu_enc->debugfs_root);
-
 	return 0;
 }
 #else
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 1d434b22180d..9e29079a6fc4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -63,7 +63,6 @@ struct dpu_encoder_phys;
 /**
  * struct dpu_encoder_phys_ops - Interface the physical encoders provide to
  *	the containing virtual encoder.
- * @late_register:		DRM Call. Add Userspace interfaces, debugfs.
  * @prepare_commit:		MSM Atomic Call, start of atomic commit sequence
  * @is_master:			Whether this phys_enc is the current master
  *				encoder. Can be switched at enable time. Based
@@ -93,8 +92,6 @@ struct dpu_encoder_phys;
  */
 
 struct dpu_encoder_phys_ops {
-	int (*late_register)(struct dpu_encoder_phys *encoder,
-			struct dentry *debugfs_root);
 	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
 	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
-- 
2.39.2

