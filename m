Return-Path: <linux-arm-msm+bounces-3054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AD2801F23
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 23:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B8D128102C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Dec 2023 22:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8EEC2231B;
	Sat,  2 Dec 2023 22:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eAqRW7rG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAE2211F
	for <linux-arm-msm@vger.kernel.org>; Sat,  2 Dec 2023 14:42:50 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50bc21821a1so4662476e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Dec 2023 14:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701556969; x=1702161769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3aih6OHSDkGdiO3pHVc1FL+ZZ8/szuX4lHE6IeURhsw=;
        b=eAqRW7rGrb5kR6M+wGh5K7etg/MmLi6hjI+GE3JUGUnLpimons7m3nLGFtzzQgS+sW
         d8bqSNTYN+wL4Gdc7MQV6iIVbp9qLy8QNLzOrOSyekd80k7onhxN1/xN3JD1oTtz80qW
         pnC1OZjC8kQ9v0e0yuHC+BOv3J4K2LbjU9Z9ntPlW6hAGBLzylM+6Di+2JZFzyIr8QLo
         RlTmnCS6H7K+0Hf5cc7Qtnc6W1R7ILcaKjiW8xh+Ld2N0+ITXjruMDpKRve/zbG4YWhi
         nbautUUP37OAZtE9ld01GvvcmgMclBpFwD0LfQqoNFc5ZEP+dT8Gr4FLVHQoEXA6jvx9
         WuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701556969; x=1702161769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3aih6OHSDkGdiO3pHVc1FL+ZZ8/szuX4lHE6IeURhsw=;
        b=s7jKrVkQYQje612ueFiu8kVtUu+FhfLaQ08LpBQrKDMhGb+Laqza8qnOC9SqnELkpm
         ZdGaK93qrYdNTOJEKAc8o1SYWXQNMZfcsNd6SFrojBMdSTFntWI4M/ayI+MrAFMqYWRF
         j6Bzmmp4rQpalhT8KpSK7YAQiMhoUa7d8s81fQkQeuLLG5MP2GF6sNPOPIDrzUovzg4n
         tB2C0f/7MBXineJZ7WUhW30HFoe4l8il0z87bk+E7LzeulSHXMvlOni1XiJ+I5crmDLo
         gbpHBTr+jRYPEJuFEQmTCQ+2JDUN1fBraAn671jWI2IhITsolCnBsXbboeMVow3UFI75
         ocmA==
X-Gm-Message-State: AOJu0YwQNOBWpaH8R3pqlehmxEhyzKnwk2AZa98oilaPHhASU2y4pIk7
	j/YAH/gLu8OQNDY5jH520LeD2A==
X-Google-Smtp-Source: AGHT+IHZeVKOmByoJTMNtpTseW+90giyj7nm8L2MlkKFWc7pmChImdK+NbNbAAwO85Bzsqca44SybQ==
X-Received: by 2002:a05:6512:104f:b0:50b:e1ea:f7c5 with SMTP id c15-20020a056512104f00b0050be1eaf7c5mr937950lfb.138.1701556969321;
        Sat, 02 Dec 2023 14:42:49 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id o20-20020a056512051400b0050bed700f5esm187015lfb.91.2023.12.02.14.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 14:42:48 -0800 (PST)
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
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4 1/4] drm/msm/mdss: switch mdss to use devm_of_icc_get()
Date: Sun,  3 Dec 2023 01:42:44 +0300
Message-Id: <20231202224247.1282567-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
References: <20231202224247.1282567-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop using hand-written reset function for ICC release, use
devm_of_icc_get() instead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 29bb38f0bb2c..53bc496ace99 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -50,14 +50,14 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	struct icc_path *path0;
 	struct icc_path *path1;
 
-	path0 = of_icc_get(dev, "mdp0-mem");
+	path0 = devm_of_icc_get(dev, "mdp0-mem");
 	if (IS_ERR_OR_NULL(path0))
 		return PTR_ERR_OR_ZERO(path0);
 
 	msm_mdss->path[0] = path0;
 	msm_mdss->num_paths = 1;
 
-	path1 = of_icc_get(dev, "mdp1-mem");
+	path1 = devm_of_icc_get(dev, "mdp1-mem");
 	if (!IS_ERR_OR_NULL(path1)) {
 		msm_mdss->path[1] = path1;
 		msm_mdss->num_paths++;
@@ -66,15 +66,6 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 	return 0;
 }
 
-static void msm_mdss_put_icc_path(void *data)
-{
-	struct msm_mdss *msm_mdss = data;
-	int i;
-
-	for (i = 0; i < msm_mdss->num_paths; i++)
-		icc_put(msm_mdss->path[i]);
-}
-
 static void msm_mdss_icc_request_bw(struct msm_mdss *msm_mdss, unsigned long bw)
 {
 	int i;
@@ -391,9 +382,6 @@ static struct msm_mdss *msm_mdss_init(struct platform_device *pdev, bool is_mdp5
 	dev_dbg(&pdev->dev, "mapped mdss address space @%pK\n", msm_mdss->mmio);
 
 	ret = msm_mdss_parse_data_bus_icc_path(&pdev->dev, msm_mdss);
-	if (ret)
-		return ERR_PTR(ret);
-	ret = devm_add_action_or_reset(&pdev->dev, msm_mdss_put_icc_path, msm_mdss);
 	if (ret)
 		return ERR_PTR(ret);
 
-- 
2.39.2


