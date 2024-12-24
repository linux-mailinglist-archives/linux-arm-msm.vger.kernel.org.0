Return-Path: <linux-arm-msm+bounces-43178-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9573A9FB93A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 05:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4282416571B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 04:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD58515534D;
	Tue, 24 Dec 2024 04:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T+Dnv0A+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B467814E2C2
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Dec 2024 04:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735014328; cv=none; b=eISLGgjAMNBF8DFWdoSySd/VhuXXr/gOtARxUrzoynzNIYi9tyOJKTpMCqYPba3Dls/JO4Mvh+ETLgK7PtGXjg+BIaHnGVcw/gOnWg27cVqsZZyqPWkOMwaJo9wLEHjrPObeK/+uBLNoU1UikDLFIXQW+4kvM1fBSpXGXrBGTV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735014328; c=relaxed/simple;
	bh=ZXxgbzMdqtz5oJuqlyyNFT3oACaXQzTXc450XsuBBWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f8RKiEVWu1mip5YtfCAodHdfz22evsem2oVnJwTubB72xQSU0ETDqaGaLH2NHVv6x1cF6hjgRqSrDzx4t/PqjQnzQ4yyDU8k9pjJNGYd3Z4Sa+rfHqAG9gwae35S0YngPZiJ5JspShZHEeSCbFlhDEQY3rXTq3AfGIPXSDgV6OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T+Dnv0A+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53e399e3310so5728240e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Dec 2024 20:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735014325; x=1735619125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=857EsT01ECbPhK+ioiRWQ8g1TSEtk3nEPihtdgryD7Y=;
        b=T+Dnv0A+FeP1MIKEPmnhE5VNikItD03Qmljba54jkfQGzIkaVq7JfQoExaRWo2k14J
         MqHpW8iJjIUMJMNelH7+KfCqFYDz4mwuB8kY6uvqQ7tKu1FddpEZULFCb+TF1UXrl8uv
         0qAG7TwTEjCDtNOIC9L6Oh0rN35wABreaOjqlsPlQ04ae1biAzY32kH5mhZqbqTOIhlt
         ZrcMQfW5FBRFfF6yTlLjG5cdA2HxFG68N806qYg5xzfrOo5e3hjP2fVX+Z57z6wMlvei
         WkhAsZLQJh3/IiiMmrsk0ATCk2Swa43Le0mtCH3m64J0N8OZs9PeN4b9azdQ7gFOpRxf
         Z1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735014325; x=1735619125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=857EsT01ECbPhK+ioiRWQ8g1TSEtk3nEPihtdgryD7Y=;
        b=wUjwj9ZpYOXEmjKua0M39tJzKph0HGCSncY+KuSdxWLTyHSvVtODLz9Wb1Vi8IowGJ
         xh6a1VaMlEMC9/fqNrJj/ZqvUyUeC83Wx3LBxs8vcNdoAwiyULxwvQXvwqbK0CbTPf1/
         lTf4xdEacYTDFp2OTIx/B/Ny/TjDIFiQhIC7HNptyIekB40W1QSz2Hy1sQXxXyMImQl9
         ZpqWrOBnxkPU1ajZrZgZ0qggb4U7EwSC1bmQj36Y9R0NMMJr1QtHTkPzpdOMOF3eX6m6
         W2J7fsiwUMlBKy1nrkXw1+AyeIpSDg5rPk6d8DuNRxjnUiuzzf4IIxzKuDUI7mbtEaXN
         G3aQ==
X-Gm-Message-State: AOJu0YxpJgDzy5iPsDQycIt8KAEnOW7wQhsbZbWaiks3dCdqd/bC8Q7h
	YAEbAhlZTqsO/4ikvpBoQCLOMqte457rlgabrnosyZkVCe0y1DqPLYuHuVD08Ic=
X-Gm-Gg: ASbGnctLGCVTgxnocZJfZiEBPKWhh3/gFBPlmMC3RW7Yt0vcg2z08cXqJyp7Yozl9li
	7iloJvrsQD9Tu3ucjUJMHmV7Q+GF4pOotKKpTO/WrHD5T8ObXLrDIa6wft0BYB2kNuIxR8gWf5R
	w+/ty9RtgPiNdZjDO+Bd/fZfPQ2lw5E8Pd+1REI1bf2nZBvYo/6EkAlHFMnsJiqXy6i+A8HO1Wv
	ue4yaLstbo/b/TdT4AwLaNozsmZ5UTcel6rF+KW7pF6kPiTReE/nmud4tLqGOed
X-Google-Smtp-Source: AGHT+IF8ma4sG7lSVR9UTofsmyM/1XLKfAoMakvJaJM5YLPkSH3bsTdJo9tiXjCDDCxv9oZ3I1d7jQ==
X-Received: by 2002:a05:6512:39cc:b0:53e:94f9:8c86 with SMTP id 2adb3069b0e04-5422956026dmr5349411e87.35.1735014324854;
        Mon, 23 Dec 2024 20:25:24 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542248cc8e3sm1467277e87.103.2024.12.23.20.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 20:25:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Dec 2024 06:25:18 +0200
Subject: [PATCH 2/4] drm/msm/dpu: enable CDM_0 for all DPUs which are known
 to have it
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-dpu-add-cdm-v1-2-7aabfcb58246@linaro.org>
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
In-Reply-To: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14089;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ZXxgbzMdqtz5oJuqlyyNFT3oACaXQzTXc450XsuBBWo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnajetUD6q25zFFDMXHQDWn9S7ZhGG+L+e2pnHn
 XU/VAgaD3qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2o3rQAKCRCLPIo+Aiko
 1YFZCACqb+Ni3s/N1lHN1rntXb3CldaE8JwoVWq89QNCYS8zzQVWLzhZBAC1SIqExyXrJ1LqmTs
 22+F8lbaipT76nYzgcmzSBZbjjkbwA8WNvzGy0qlFPzzOCj5B17U6Y9CkRXBF6P5MrEUqkW/GBc
 seJNpDIbUlyhFO+Svb8WPS9ZQ27y4d/NuXBx168PURiuRfj/m3+cyw7WAkdY/6k+hO4EDBxwNEP
 EDJ5zrhrCdDhs/L8n3bXkrNha5VZYGeFAzl+AVbcZ3gUOebcQG6yAWcDU69YaNCSdeG3UCb7uOk
 RTB6vziIY1J57xUKidFsCJABkfte5hzDSK13gYdZ7VrLCidf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable the CDM_0 block on all DPU generations which have the CDM block
documented in the vendor dtsi file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
 20 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index eb5dfff2ec4f48d793f9d83aafed592d0947f04b..581c9bb4b193280fd6b7c8cc4e3ef8b2e9e95dfb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -431,6 +431,7 @@ const struct dpu_mdss_cfg dpu_sm8650_cfg = {
 	.mdss_ver = &sm8650_mdss_ver,
 	.caps = &sm8650_dpu_caps,
 	.mdp = &sm8650_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm8650_ctl),
 	.ctl = sm8650_ctl,
 	.sspp_count = ARRAY_SIZE(sm8650_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index ab3dfb0b374ead36c7f07b0a77c703fb2c09ff8a..f6ee09a148c214bce7bae2c7df868d95c4cf9833 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -190,6 +190,7 @@ const struct dpu_mdss_cfg dpu_msm8937_cfg = {
 	.mdss_ver = &msm8937_mdss_ver,
 	.caps = &msm8937_dpu_caps,
 	.mdp = msm8937_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(msm8937_ctl),
 	.ctl = msm8937_ctl,
 	.sspp_count = ARRAY_SIZE(msm8937_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 6bdaecca676144f9162ab1839d99f3e2e3386dc7..06c8e2226276e4e704852ca542272f61775c899e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -167,6 +167,7 @@ const struct dpu_mdss_cfg dpu_msm8917_cfg = {
 	.mdss_ver = &msm8917_mdss_ver,
 	.caps = &msm8917_dpu_caps,
 	.mdp = msm8917_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(msm8917_ctl),
 	.ctl = msm8917_ctl,
 	.sspp_count = ARRAY_SIZE(msm8917_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 14f36ea6ad0eb61e87f043437a8cd78bb1bde49c..6e5290024274446519f4d5ce3558a861781f82d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -198,6 +198,7 @@ const struct dpu_mdss_cfg dpu_msm8953_cfg = {
 	.mdss_ver = &msm8953_mdss_ver,
 	.caps = &msm8953_dpu_caps,
 	.mdp = msm8953_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(msm8953_ctl),
 	.ctl = msm8953_ctl,
 	.sspp_count = ARRAY_SIZE(msm8953_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 491f6f5827d151011dd3f74bef2a4b8bf69591ab..586ab170c375540d95a19d9f8cf424d0735a29c3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -316,6 +316,7 @@ const struct dpu_mdss_cfg dpu_msm8996_cfg = {
 	.mdss_ver = &msm8996_mdss_ver,
 	.caps = &msm8996_dpu_caps,
 	.mdp = msm8996_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(msm8996_ctl),
 	.ctl = msm8996_ctl,
 	.sspp_count = ARRAY_SIZE(msm8996_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 64c94e919a69804599916404dff59fa4a6ac6cff..298c6874957fbb4d369a191cc5fbc28f4499dafb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -302,6 +302,7 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
 	.mdss_ver = &msm8998_mdss_ver,
 	.caps = &msm8998_dpu_caps,
 	.mdp = &msm8998_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(msm8998_ctl),
 	.ctl = msm8998_ctl,
 	.sspp_count = ARRAY_SIZE(msm8998_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 424815e7fb7dd858448bd41b5368b729373035f8..2074d18c367589a8f54f58368a7f072ff5a213ba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -269,6 +269,7 @@ const struct dpu_mdss_cfg dpu_sdm660_cfg = {
 	.mdss_ver = &sdm660_mdss_ver,
 	.caps = &sdm660_dpu_caps,
 	.mdp = &sdm660_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sdm660_ctl),
 	.ctl = sdm660_ctl,
 	.sspp_count = ARRAY_SIZE(sdm660_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index df01227fc36468f4945c03e767e1409ea4fc0896..d5011e1a690389db7f99672b9313b44b07e914b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -205,6 +205,7 @@ const struct dpu_mdss_cfg dpu_sdm630_cfg = {
 	.mdss_ver = &sdm630_mdss_ver,
 	.caps = &sdm630_dpu_caps,
 	.mdp = &sdm630_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sdm630_ctl),
 	.ctl = sdm630_ctl,
 	.sspp_count = ARRAY_SIZE(sdm630_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 72bd4f7e9e504c771d999dcf6277fceb169cffca..2f82cd346456d0f2334f1f47a9b2b7e33464eb92 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -319,6 +319,7 @@ const struct dpu_mdss_cfg dpu_sdm845_cfg = {
 	.mdss_ver = &sdm845_mdss_ver,
 	.caps = &sdm845_dpu_caps,
 	.mdp = &sdm845_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sdm845_ctl),
 	.ctl = sdm845_ctl,
 	.sspp_count = ARRAY_SIZE(sdm845_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index cbbdaebe357ec4a82a3c3d950aa13792a1fb2d6e..ac1fd7608dbe5ef76ecb9b27706bb23cf10773e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -84,6 +84,7 @@ const struct dpu_mdss_cfg dpu_sdm670_cfg = {
 	.mdss_ver = &sdm670_mdss_ver,
 	.caps = &sdm845_dpu_caps,
 	.mdp = &sdm670_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sdm845_ctl),
 	.ctl = sdm845_ctl,
 	.sspp_count = ARRAY_SIZE(sdm670_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 6ccfde82fecdb4e3612df161814b16f7af40ca5f..9e6846dcf82eb0004b665389ab29cd25103cd482 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -386,6 +386,7 @@ const struct dpu_mdss_cfg dpu_sm8150_cfg = {
 	.mdss_ver = &sm8150_mdss_ver,
 	.caps = &sm8150_dpu_caps,
 	.mdp = &sm8150_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm8150_ctl),
 	.ctl = sm8150_ctl,
 	.sspp_count = ARRAY_SIZE(sm8150_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index bab19ddd1d4f97805c1bfba8ba6e117ae77c6c2e..084422182e89020dc64f01fd42c66a018cf02771 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -412,6 +412,7 @@ const struct dpu_mdss_cfg dpu_sc8180x_cfg = {
 	.mdss_ver = &sc8180x_mdss_ver,
 	.caps = &sc8180x_dpu_caps,
 	.mdp = &sc8180x_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sc8180x_ctl),
 	.ctl = sc8180x_ctl,
 	.sspp_count = ARRAY_SIZE(sc8180x_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 2fe674d1e05988f39f66a01fedee96113437ea65..d5e595800b9a50e414e1b7df301cacd9858510b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -309,6 +309,7 @@ const struct dpu_mdss_cfg dpu_sm7150_cfg = {
 	.mdss_ver = &sm7150_mdss_ver,
 	.caps = &sm7150_dpu_caps,
 	.mdp = &sm7150_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm7150_ctl),
 	.ctl = sm7150_ctl,
 	.sspp_count = ARRAY_SIZE(sm7150_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 621a2140f675fa28b3a7fcd8573e59b306cd6832..d9979f2459c3d204a68e9e81cfd842f59db0072f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -234,6 +234,7 @@ const struct dpu_mdss_cfg dpu_sm6150_cfg = {
 	.mdss_ver = &sm6150_mdss_ver,
 	.caps = &sm6150_dpu_caps,
 	.mdp = &sm6150_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm6150_ctl),
 	.ctl = sm6150_ctl,
 	.sspp_count = ARRAY_SIZE(sm6150_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index d039b96beb97cfeda629ef2546902f7281c53543..72f72b8632aded2a289f56caa10a181911229b36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -216,6 +216,7 @@ const struct dpu_mdss_cfg dpu_sm6125_cfg = {
 	.mdss_ver = &sm6125_mdss_ver,
 	.caps = &sm6125_dpu_caps,
 	.mdp = &sm6125_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm6125_ctl),
 	.ctl = sm6125_ctl,
 	.sspp_count = ARRAY_SIZE(sm6125_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 7382ebb6e5b2a0c1190e914fb593da93879c0d9a..8fd799a4eb4ddd1ade45a8f056faf7aa961148b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -204,6 +204,7 @@ const struct dpu_mdss_cfg dpu_sc7180_cfg = {
 	.mdss_ver = &sc7180_mdss_ver,
 	.caps = &sc7180_dpu_caps,
 	.mdp = &sc7180_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sc7180_ctl),
 	.ctl = sc7180_ctl,
 	.sspp_count = ARRAY_SIZE(sc7180_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 0502cee2f116e8ce24a0daf995f46b1d693aacaa..cdd3c7a9e273a8a10a1647c8757e2d270db6c962 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -222,6 +222,7 @@ const struct dpu_mdss_cfg dpu_sm6350_cfg = {
 	.mdss_ver = &sm6350_mdss_ver,
 	.caps = &sm6350_dpu_caps,
 	.mdp = &sm6350_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm6350_ctl),
 	.ctl = sm6350_ctl,
 	.sspp_count = ARRAY_SIZE(sm6350_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index aced16e350daa1bf5d24078b2468b5095a40ce07..eb29ba58e765e823d252f2178bf4a6ff65bf2da7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -394,6 +394,7 @@ const struct dpu_mdss_cfg dpu_sm8350_cfg = {
 	.mdss_ver = &sm8350_mdss_ver,
 	.caps = &sm8350_dpu_caps,
 	.mdp = &sm8350_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm8350_ctl),
 	.ctl = sm8350_ctl,
 	.sspp_count = ARRAY_SIZE(sm8350_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index a1779c5597ae701496f21d3a8cb513189424a484..521cb89a7bf975d55374a520eefbac4a403e0f74 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -412,6 +412,7 @@ const struct dpu_mdss_cfg dpu_sm8450_cfg = {
 	.mdss_ver = &sm8450_mdss_ver,
 	.caps = &sm8450_dpu_caps,
 	.mdp = &sm8450_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm8450_ctl),
 	.ctl = sm8450_ctl,
 	.sspp_count = ARRAY_SIZE(sm8450_sspp),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ad48defa154f7d808c695860fd91e60bbb08f42a..135fe90aaef88cba21624e1f180e9a0e9adce751 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -405,6 +405,7 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
 	.mdss_ver = &sm8550_mdss_ver,
 	.caps = &sm8550_dpu_caps,
 	.mdp = &sm8550_mdp,
+	.cdm = &dpu_cdm_0,
 	.ctl_count = ARRAY_SIZE(sm8550_ctl),
 	.ctl = sm8550_ctl,
 	.sspp_count = ARRAY_SIZE(sm8550_sspp),

-- 
2.39.5


