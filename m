Return-Path: <linux-arm-msm+bounces-2952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5D5801513
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E23BAB21087
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 21:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F325915F;
	Fri,  1 Dec 2023 21:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xqhiF2JF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3C510D7
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 13:18:50 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c9c5d30b32so34666081fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 13:18:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701465528; x=1702070328; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfjmtjuYyUGetq1EYOrQqqOBHzCj2I72tnhNE0aTlL0=;
        b=xqhiF2JFFK7qp0o5fUQ28QlBJkfpYI2AatM1xojgbwp/ecq1bwLnM2z/tNg4RVS+3g
         p2Wljgux2ZPYZObvL4HQaJ7NZTR1w2/8ZYyEHgMbfrQA/cSgcm3iNMM6nsXJaUX14N9e
         lIPo81EgDAOuB9U6yCdkxzBRbH+UWc8+8B5V8urm9mjUsb8Xa+QX7VBhxZYhvknc+6r+
         4I86fu1+4nJDmISuWnEHkBv4qerz3X0FDbETyfPp/hNap4ORy1a6NA+xULeQThz1zCOj
         oFUMwipWKpxQRBjQjulqXKeHmWJ4Xg0Lwg9vCx21omQmz52vGcHE/b9ZFB9jSUS+leY0
         /bkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701465528; x=1702070328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kfjmtjuYyUGetq1EYOrQqqOBHzCj2I72tnhNE0aTlL0=;
        b=fKHDcl8gPthosJhAn1czzNrUY94bzyZbBVCFEYBbWyz1nVDkKGUTKWv8VC9BlrDv8n
         pOXQd6VzywJB2jHTfwrhLcdir3SwE9HBp2uj9Iz4MhUXOQnu2wuivcYlFY8gldr53dug
         if/2O6WrJvLknJOyC9s2vNuSIuWkpgw7hyS9yJLPTnfrm4laB5JCyiz5zsGAxlbzq58I
         lIDTV3leOqjqmyQ4cOBZUaLfnu1viVXxlynsWCszguCVfmyqxTmIvN78/mOy4+wj8E+L
         FW5zoHEFXBEtIk05GSmCzgaw5jHxq/OSLFc14boURqbwspLMeZqQ40RT/10FORkHl2oo
         y7cA==
X-Gm-Message-State: AOJu0YwRtDF7/7AP9SMGdKWHRWFsilu6G6ohj/5nJYQaQAsjrBZJKKvE
	UYy6vwQyv0tH6hHVN2sQo5nbiQ==
X-Google-Smtp-Source: AGHT+IHE7XUe5xgiG4ivFApONInXTxF4NJgbohhfe1xx/9WzkjLE9wM/mJd731P27tjT5/ICn4YLGg==
X-Received: by 2002:a2e:8457:0:b0:2c9:c191:abb8 with SMTP id u23-20020a2e8457000000b002c9c191abb8mr1276983ljh.23.1701465528442;
        Fri, 01 Dec 2023 13:18:48 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id z4-20020a05651c022400b002c123b976acsm503612ljn.76.2023.12.01.13.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 13:18:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v4 01/13] drm/msm/dpu: cleanup dpu_kms_hw_init error path
Date: Sat,  2 Dec 2023 00:18:33 +0300
Message-Id: <20231201211845.1026967-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
References: <20231201211845.1026967-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It was noticed that dpu_kms_hw_init()'s error path contains several
labels which point to the same code path. Replace all of them with a
single label.

Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index fe7267b3bff5..3b6ed60e1143 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1078,7 +1078,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	if (!dpu_kms->catalog) {
 		DPU_ERROR("device config not known!\n");
 		rc = -EINVAL;
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	/*
@@ -1088,26 +1088,26 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	rc = _dpu_kms_mmu_init(dpu_kms);
 	if (rc) {
 		DPU_ERROR("dpu_kms_mmu_init failed: %d\n", rc);
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	dpu_kms->mdss = msm_mdss_get_mdss_data(dpu_kms->pdev->dev.parent);
 	if (IS_ERR(dpu_kms->mdss)) {
 		rc = PTR_ERR(dpu_kms->mdss);
 		DPU_ERROR("failed to get MDSS data: %d\n", rc);
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	if (!dpu_kms->mdss) {
 		rc = -EINVAL;
 		DPU_ERROR("NULL MDSS data\n");
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	rc = dpu_rm_init(&dpu_kms->rm, dpu_kms->catalog, dpu_kms->mdss, dpu_kms->mmio);
 	if (rc) {
 		DPU_ERROR("rm init failed: %d\n", rc);
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	dpu_kms->rm_init = true;
@@ -1119,7 +1119,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		rc = PTR_ERR(dpu_kms->hw_mdp);
 		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
 		dpu_kms->hw_mdp = NULL;
-		goto power_error;
+		goto err_pm_put;
 	}
 
 	for (i = 0; i < dpu_kms->catalog->vbif_count; i++) {
@@ -1130,7 +1130,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed to init vbif %d: %d\n", vbif->id, rc);
-			goto power_error;
+			goto err_pm_put;
 		}
 
 		dpu_kms->hw_vbif[vbif->id] = hw;
@@ -1146,7 +1146,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	rc = dpu_core_perf_init(&dpu_kms->perf, dpu_kms->catalog->perf, max_core_clk_rate);
 	if (rc) {
 		DPU_ERROR("failed to init perf %d\n", rc);
-		goto perf_err;
+		goto err_pm_put;
 	}
 
 	dpu_kms->hw_intr = dpu_hw_intr_init(dpu_kms->mmio, dpu_kms->catalog);
@@ -1154,7 +1154,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 		rc = PTR_ERR(dpu_kms->hw_intr);
 		DPU_ERROR("hw_intr init failed: %d\n", rc);
 		dpu_kms->hw_intr = NULL;
-		goto hw_intr_init_err;
+		goto err_pm_put;
 	}
 
 	dev->mode_config.min_width = 0;
@@ -1179,7 +1179,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	rc = _dpu_kms_drm_obj_init(dpu_kms);
 	if (rc) {
 		DPU_ERROR("modeset init failed: %d\n", rc);
-		goto drm_obj_init_err;
+		goto err_pm_put;
 	}
 
 	dpu_vbif_init_memtypes(dpu_kms);
@@ -1188,10 +1188,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	return 0;
 
-drm_obj_init_err:
-hw_intr_init_err:
-perf_err:
-power_error:
+err_pm_put:
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 error:
 	_dpu_kms_hw_destroy(dpu_kms);
-- 
2.39.2


