Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B53A7BE8EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 20:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377482AbjJISKv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 14:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377383AbjJISKv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 14:10:51 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6868D94
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 11:10:49 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-505748580ceso6029825e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696875047; x=1697479847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifZolr8J8pRMC1MF21MdWDJqO8xHcFjEBmzDjHRBYUI=;
        b=xXIh9b9UlMTmjm9UItnzy5WN7KMWXr/JReAX/gEMPIsXIPSEAiQbcxyF5VMun2+zcH
         LciFSnOFCaM7pbxKuvElKsuWATjveCXAQAZT4E12gKRex55ZTNuSvOFRQtqSIZUTo5wP
         sVglvlqzeBxMnjMQmoEUE9TigR8hhwO12YSJLyXeuz9txAe4AzMlfhMGq696BEGcN++u
         HLL2TPMqFzHFu27WjMGGaYSin+87PZ3WhYrqyKS2BfbvOJQpvL1ebz74N/ptsEnz3s1j
         ycujNziAiwoMrWABybOQC5GMGK1mVfbl1ofYVygwWCXIOK6KneTsCScliULs6dHNfow6
         Sw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696875047; x=1697479847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ifZolr8J8pRMC1MF21MdWDJqO8xHcFjEBmzDjHRBYUI=;
        b=sFuwYiaBKjsRLkru6HVWNZNRLSTv0v76c5vNwv0LhBXJAjKh6ilylovhSrODB3oVO5
         4m4xYBo9WPy65Vko5/JPH70cR30BuhGPggndeDVXDHjEvsT7wHWiTDZyDsmsawwtkNGf
         f+VC+d4T4U3jS+lfqrCNE9ufOJ6HZfUpWwBxCavp+oshPoGZUH/FE5mY8vhylRbjHSvc
         /lfdMovLHRHugnf6wrF6QUwWh8NZVrrqu2OHWlySgRjcb+kFCokFX1aR2CaNhFDwBNYw
         dzASIL8uvWa1QGxV72N62gL4buZfk5uOznvAsCJBCcfSfGWl9tTo8/gLTXGxJS3wFfr7
         7Qpw==
X-Gm-Message-State: AOJu0Yz7T9u2CpISPS0IwCpJjtrWF31zU148xdzOR2aCUGNbO6I8Ler5
        CXLafThmcn48Nopt6jI7Oi23fQ==
X-Google-Smtp-Source: AGHT+IETB9qHD6UMNe1JOlEW7KOoPOJKYdk0kJ8APv0qTfZQQEbMtXBZ0VbrfTht1hsJCagb4y0E/w==
X-Received: by 2002:ac2:4da8:0:b0:500:bffa:5b85 with SMTP id h8-20020ac24da8000000b00500bffa5b85mr12377982lfe.32.1696875047373;
        Mon, 09 Oct 2023 11:10:47 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:10:47 -0700 (PDT)
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
Subject: [PATCH v2 07/13] drm/msm: rename msm_pm_prepare/complete to note the KMS nature
Date:   Mon,  9 Oct 2023 21:10:34 +0300
Message-Id: <20231009181040.2743847-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
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

Rename the msm_pm_prepare() and msm_pm_complete() to
msm_kms_pm_prepare() and msm_kms_pm_complete() consequently.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 4 ++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 4 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 4 ++--
 drivers/gpu/drm/msm/msm_drv.c            | 4 ++--
 drivers/gpu/drm/msm/msm_drv.h            | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 12d604b6b7e0..1f06c0c36533 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1342,8 +1342,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
 	SET_RUNTIME_PM_OPS(dpu_runtime_suspend, dpu_runtime_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
-	.prepare = msm_pm_prepare,
-	.complete = msm_pm_complete,
+	.prepare = msm_kms_pm_prepare,
+	.complete = msm_kms_pm_complete,
 };
 
 static const struct of_device_id dpu_dt_match[] = {
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 18735bbaf798..386f61556789 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -501,8 +501,8 @@ static int mdp4_kms_init(struct drm_device *dev)
 }
 
 static const struct dev_pm_ops mdp4_pm_ops = {
-	.prepare = msm_pm_prepare,
-	.complete = msm_pm_complete,
+	.prepare = msm_kms_pm_prepare,
+	.complete = msm_kms_pm_complete,
 };
 
 static int mdp4_probe(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 68fcfd85d250..d936b6b958d1 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -960,8 +960,8 @@ static __maybe_unused int mdp5_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops mdp5_pm_ops = {
 	SET_RUNTIME_PM_OPS(mdp5_runtime_suspend, mdp5_runtime_resume, NULL)
-	.prepare = msm_pm_prepare,
-	.complete = msm_pm_complete,
+	.prepare = msm_kms_pm_prepare,
+	.complete = msm_kms_pm_complete,
 };
 
 static const struct of_device_id mdp5_dt_match[] = {
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index fe885bfd9742..76b69f605b9c 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1100,7 +1100,7 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
-int msm_pm_prepare(struct device *dev)
+int msm_kms_pm_prepare(struct device *dev)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev = priv ? priv->dev : NULL;
@@ -1111,7 +1111,7 @@ int msm_pm_prepare(struct device *dev)
 	return drm_mode_config_helper_suspend(ddev);
 }
 
-void msm_pm_complete(struct device *dev)
+void msm_kms_pm_complete(struct device *dev)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev = priv ? priv->dev : NULL;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index a6a29093bbe5..a28d93c09492 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -563,8 +563,8 @@ static inline unsigned long timeout_to_jiffies(const ktime_t *timeout)
 
 extern const struct component_master_ops msm_drm_ops;
 
-int msm_pm_prepare(struct device *dev);
-void msm_pm_complete(struct device *dev);
+int msm_kms_pm_prepare(struct device *dev);
+void msm_kms_pm_complete(struct device *dev);
 
 int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev),
-- 
2.39.2

