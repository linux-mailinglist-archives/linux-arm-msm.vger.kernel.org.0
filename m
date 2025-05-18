Return-Path: <linux-arm-msm+bounces-58328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 795B7ABAF98
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 12:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CA5C17A3D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 10:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD04521CA18;
	Sun, 18 May 2025 10:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g+Ch9nWq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF1B21C19E
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565746; cv=none; b=QlUyiA+qShl8+m7jRpbFY9ZcODKH5oGq/4JgXgdnecZw8IroYm6H/alYi92lNxZXyYxnB6pDXAqmrW8gqjbxYPggQe6KwfCW3oyBaay9pQ4oSmcqwb0qWn89pY9MyDODquL5zbJm3zvmMmye7F84KavwRv9GvV2Lb21cyDSTdn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565746; c=relaxed/simple;
	bh=0LqRPtPOFWdF3NM/7wOtnNgFIrF9n7ejqAUYuZxTuFI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FWASibGmtdOYzMTliyz0WNg7mWFn0O8GgvHA6S2+167X2mLbMNlP1f/c1pib1VkKidTNDQOmLOkwnMH7PNLzZHMr91vAO876vUlyZlJBxBCOSWhFdkqZHc2eMl4dl0d/xibzzrTPP7K5qEzFCEod8Hg/PJ+mTRTCW+LU+LL2D+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g+Ch9nWq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I5m7Si006428
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	967BFGTM2fUvMgLCbEf8k3a4tE16gLH10KN6lh/mGJQ=; b=g+Ch9nWqBwWiTwjG
	blPHgpqcB6+izV7Sn0PiSIJlNQbQ638PfFJN+5pnfHlPOKGuzE5aPQ8yNqFa8KJo
	u2g/VHiJHJIz0kixABvKnct/xiCZz6XtVFulAOePsyNtkAfmwvjN950B6ujoXJKU
	YxckUWEsTUaoI0muQoGQcyY4DB+spcN8jaVoeXbFELXNvkNHKDDq6F9ptvGw+Nv6
	j1VL6w6VUW+6piHkklRm5zyCcfeRYjksrshr983Ps9XvD9tMiquf3pL/5p4CYs0u
	Ql9KUITEiQJCdzczSmY9ORiiwrxsOFMUkLhcfPuagJarR9dbLhGOAvjDZlI4iO6e
	HfAlNQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyhvp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f6ee43c4a6so100524406d6.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 03:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565743; x=1748170543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=967BFGTM2fUvMgLCbEf8k3a4tE16gLH10KN6lh/mGJQ=;
        b=EsHEy9uBZJkf2HNj298dwKwf057Shjj6BQv8gKsYc/H+n7S+sBLSAlg6aO+tFnnZ6n
         cbwDBNtakvARbYFSX5THDLsLhfFc3QP99Tl4IAp6n01xWHSWJc2Aw0FLQfXQYJARu1YC
         HOCFbG4GIHbPHrEGcPE+bf7iY0PwhcVVWmTU9BQFr6Rq5o66HqJT8wv607R79edcZVbM
         rpbEJx0h8+TGJAwxwTqtRceR68u1hMTGfYhGSaoKMAxh8klx+lM/YVrSzgsHClD147RN
         Xyjjg/yDC6XQag2FcAUPE9rE2gJygNFkt3+I56eheZOFz+CIBv2huDlxLI50zSvt+WPI
         cBJg==
X-Gm-Message-State: AOJu0Ywqdl7IPx9CkmJ8qsm4TmnwBrMdYQSCnfRcPXaJOuPGNy44WjQN
	zi9i8rMOGujhd0l6bgIHaVnn2DEwbdd933trcRhf/tXIrImO9fb/5OjzGWeo6n3I3Y8cm5tLNga
	SWQuQgyhUgOKKvOUOhQIr1Ozhw80MsGZR0FpXsVXABZtwxh++NAu/xu2hALTM7bXUp75L
X-Gm-Gg: ASbGncvzI/QCYiVGiVMldFbZ8o31Qldrv1GaDOUJF3GTH6DP35fOOKWMKn2AJtLp50M
	txnkvhNCe/ItRIwWyzF0LLQNOkO/jqknfQeRGNLxlZf16aa5PHyB/+rPVu1O3lju2j9RQu82QA1
	r/fmbURkhU5gJEWabBRbBi2KmEK7NSqE0FZo+S+UxM64YpEjFvtH+M5aKIC/PXrJddgMaHO8BLL
	h07ZWPHjZKqrx6Wl2ndE3YeJ6yGQuU0nyACX2EjQpHd7H+C8M/Npdq7HA5khLHcTGujqjfb4st1
	OfJjpbN5UExueuVpscgLvswKeK7m8C0KcAdSSEFh+7vcI0VslYQTu37+z+T7Y+LaHN3p/sUPGbg
	sv3poJFExyVL40eD7oMkNn4TH
X-Received: by 2002:a0c:fb48:0:b0:6f8:aba5:ed67 with SMTP id 6a1803df08f44-6f8b2d0fcf6mr94568106d6.30.1747565742557;
        Sun, 18 May 2025 03:55:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFmTxe3fzf9wIb3hSyjW2e7g2RhpXUOaJEjP1Zi2GnPh99qsQD6f6HpXWSHKiNJuJ0w4pUSQ==
X-Received: by 2002:a0c:fb48:0:b0:6f8:aba5:ed67 with SMTP id 6a1803df08f44-6f8b2d0fcf6mr94567886d6.30.1747565742140;
        Sun, 18 May 2025 03:55:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:55:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:27 +0300
Subject: [PATCH v3 09/11] drm/msm: rework binding of Imageon GPUs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-9-0e91e8e77023@oss.qualcomm.com>
References: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
In-Reply-To: <20250518-msm-gpu-split-v3-0-0e91e8e77023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8539;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0LqRPtPOFWdF3NM/7wOtnNgFIrF9n7ejqAUYuZxTuFI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbya1AzQz4b/8IxydV3XRJgKMle+XUQ911LvG
 uFJbg4dUPaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mgAKCRCLPIo+Aiko
 1R1WB/9d+TsZ3SeNofduSai6+uHnuuU/lV5GVRWJONKdBgldEBA1F6wl966+AltHq7n0pqjdGaE
 u8XN4j/FwePUJ9+RgMiYXi3LCi+VwyuhX7Lk1a41EILLFzlgEo6fJpQN92kO5RoLZc/+PbtSOjN
 cMaqKP/YICW7Ryp7gJgf5xssIH6TNvoxHlH8zwxnpyqeO1JtFnXy9siIPizhNsj0F8RZUymiZ1B
 /iCW+c5FXdVTvYJ48xPRYZPvoQiwQz9O947HAALux9fpM/aGdeChukq1GHug2Ne3+qQ6agNitaK
 yXxbevk+JDjxu/1cdxuMcmDbpQDbi9cnAGyLpJz1q7oAVUq5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: BbtQKH7D7NCkvVZ-oTkz3AXn2mcbNJt5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX+sf8egDzZLFw
 ezUtnS3wpjvdp09fMWyBl2K4ots2Vj2cvwOLHD/X9HKXXPKK/x3kkhZ65euYck8ZLQ691CGHiwc
 eTb+Lx3a7d6XUkkP/y5xjopL63GATgPERHziivl+ZoFDzIxcOLckBB2vMsrDvXjltL06RaXccMm
 N7mLuk6/EbHwHrR+Y+7kLBC1y8FMcXsl7b8Czc4+Ko/PR/dePSQm4m38Ki0HezP05aB+nGnH5Qe
 0Rcg8wY7WBeCYOdDbQBGWPQhULEphxHQYZDG3c5Iw6gTSBkzxv8mTy5cmd7o5xgSbGOSufyYNsZ
 XfynpEwfgY3Y40O9ciQzfPQFaPlg0flXwlK2lQOeeEbw8sB3RCUb6RcpiMaqn1f+/aujMp0CVTt
 Sy7XVw3ALqGbijQ+sQ6SuFLmOwtBCqWGAf6HMtOdHtqeUrlSRufGWhm3vH6Ddn8SLwBCw3Cq
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=6829bcb0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WrGWoQF6NLblfNs28g4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: BbtQKH7D7NCkvVZ-oTkz3AXn2mcbNJt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104

Currently the msm driver creates an extra interim platform device for
Imageon GPUs. This is not ideal, as the device doesn't have
corresponding OF node. If the headless mode is used for newer GPUs, then
the msm_use_mmu() function can not detect corresponding IOMMU devices.
Also the DRM device (although it's headless) is created with modesetting
flags being set.

To solve all these issues, rework the way the Imageon devices are bound.
Remove the interim device, don't register a component and instead use a
cut-down version of the normal functions to probe or remove the driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 36 +++---------
 drivers/gpu/drm/msm/msm_drv.c              | 91 ++++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_drv.h              |  4 ++
 3 files changed, 72 insertions(+), 59 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index f5e1490d07c1868fa21cddb38de44c28af5ca0d5..574bc452f3df539cc8e03e161043b310d83c624f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -245,42 +245,22 @@ static const struct component_ops a3xx_ops = {
 	.unbind = adreno_unbind,
 };
 
-static void adreno_device_register_headless(void)
-{
-	/* on imx5, we don't have a top-level mdp/dpu node
-	 * this creates a dummy node for the driver for that case
-	 */
-	struct platform_device_info dummy_info = {
-		.parent = NULL,
-		.name = "msm",
-		.id = -1,
-		.res = NULL,
-		.num_res = 0,
-		.data = NULL,
-		.size_data = 0,
-		.dma_mask = ~0,
-	};
-	platform_device_register_full(&dummy_info);
-}
-
 static int adreno_probe(struct platform_device *pdev)
 {
-
-	int ret;
-
-	ret = component_add(&pdev->dev, &a3xx_ops);
-	if (ret)
-		return ret;
-
 	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon"))
-		adreno_device_register_headless();
+		return msm_gpu_probe(pdev, &a3xx_ops);
 
-	return 0;
+	return component_add(&pdev->dev, &a3xx_ops);
 }
 
 static void adreno_remove(struct platform_device *pdev)
 {
-	component_del(&pdev->dev, &a3xx_ops);
+	struct msm_drm_private *priv = platform_get_drvdata(pdev);
+
+	if (priv->kms_init)
+		component_del(&pdev->dev, &a3xx_ops);
+	else
+		msm_gpu_remove(pdev, &a3xx_ops);
 }
 
 static void adreno_shutdown(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 2c6997c85fbbc3767315ca3a166a99b322f1218a..804b594ba1e7df9d9aec53a9be1451f1167fc77a 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -62,7 +62,7 @@ module_param(modeset, bool, 0600);
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
-static int msm_drm_uninit(struct device *dev)
+static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct msm_drm_private *priv = platform_get_drvdata(pdev);
@@ -91,7 +91,10 @@ static int msm_drm_uninit(struct device *dev)
 
 	msm_deinit_vram(ddev);
 
-	component_unbind_all(dev, ddev);
+	if (gpu_ops)
+		gpu_ops->unbind(dev, dev, NULL);
+	else
+		component_unbind_all(dev, ddev);
 
 	ddev->dev_private = NULL;
 	drm_dev_put(ddev);
@@ -200,7 +203,8 @@ static void msm_deinit_vram(struct drm_device *ddev)
 			attrs);
 }
 
-static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
+static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
+			const struct component_ops *gpu_ops)
 {
 	struct msm_drm_private *priv = dev_get_drvdata(dev);
 	struct drm_device *ddev;
@@ -247,7 +251,10 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	dma_set_max_seg_size(dev, UINT_MAX);
 
 	/* Bind all our sub-components: */
-	ret = component_bind_all(dev, ddev);
+	if (gpu_ops)
+		ret = gpu_ops->bind(dev, dev, NULL);
+	else
+		ret = component_bind_all(dev, ddev);
 	if (ret)
 		goto err_deinit_vram;
 
@@ -259,11 +266,6 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 		ret = msm_drm_kms_init(dev, drv);
 		if (ret)
 			goto err_msm_uninit;
-	} else {
-		/* valid only for the dummy headless case, where of_node=NULL */
-		WARN_ON(dev->of_node);
-		ddev->driver_features &= ~DRIVER_MODESET;
-		ddev->driver_features &= ~DRIVER_ATOMIC;
 	}
 
 	ret = drm_dev_register(ddev, 0);
@@ -280,7 +282,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	return 0;
 
 err_msm_uninit:
-	msm_drm_uninit(dev);
+	msm_drm_uninit(dev, gpu_ops);
 
 	return ret;
 
@@ -896,6 +898,28 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
+static const struct drm_driver msm_gpu_driver = {
+	.driver_features    = DRIVER_GEM |
+				DRIVER_RENDER |
+				DRIVER_SYNCOBJ_TIMELINE |
+				DRIVER_SYNCOBJ,
+	.open               = msm_open,
+	.postclose          = msm_postclose,
+	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init       = msm_debugfs_init,
+#endif
+	.show_fdinfo        = msm_show_fdinfo,
+	.ioctls             = msm_ioctls,
+	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
+	.fops               = &fops,
+	.name               = "msm",
+	.desc               = "MSM Snapdragon DRM",
+	.major              = MSM_VERSION_MAJOR,
+	.minor              = MSM_VERSION_MINOR,
+	.patchlevel         = MSM_VERSION_PATCHLEVEL,
+};
+
 /*
  * Componentized driver support:
  */
@@ -1020,12 +1044,12 @@ static int add_gpu_components(struct device *dev,
 
 static int msm_drm_bind(struct device *dev)
 {
-	return msm_drm_init(dev, &msm_driver);
+	return msm_drm_init(dev, &msm_driver, NULL);
 }
 
 static void msm_drm_unbind(struct device *dev)
 {
-	msm_drm_uninit(dev);
+	msm_drm_uninit(dev, NULL);
 }
 
 const struct component_master_ops msm_drm_ops = {
@@ -1074,29 +1098,34 @@ int msm_drv_probe(struct device *master_dev,
 	return 0;
 }
 
-/*
- * Platform driver:
- * Used only for headlesss GPU instances
- */
-
-static int msm_pdev_probe(struct platform_device *pdev)
+int msm_gpu_probe(struct platform_device *pdev,
+		  const struct component_ops *ops)
 {
-	return msm_drv_probe(&pdev->dev, NULL, NULL);
+	struct msm_drm_private *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+
+	/* on all devices that I am aware of, iommu's which can map
+	 * any address the cpu can see are used:
+	 */
+	ret = dma_set_mask_and_coherent(&pdev->dev, ~0);
+	if (ret)
+		return ret;
+
+	return msm_drm_init(&pdev->dev, &msm_gpu_driver, ops);
 }
 
-static void msm_pdev_remove(struct platform_device *pdev)
+void msm_gpu_remove(struct platform_device *pdev,
+		    const struct component_ops *ops)
 {
-	component_master_del(&pdev->dev, &msm_drm_ops);
+	msm_drm_uninit(&pdev->dev, ops);
 }
 
-static struct platform_driver msm_platform_driver = {
-	.probe      = msm_pdev_probe,
-	.remove     = msm_pdev_remove,
-	.driver     = {
-		.name   = "msm",
-	},
-};
-
 static int __init msm_drm_register(void)
 {
 	if (!modeset)
@@ -1111,13 +1140,13 @@ static int __init msm_drm_register(void)
 	adreno_register();
 	msm_mdp4_register();
 	msm_mdss_register();
-	return platform_driver_register(&msm_platform_driver);
+
+	return 0;
 }
 
 static void __exit msm_drm_unregister(void)
 {
 	DBG("fini");
-	platform_driver_unregister(&msm_platform_driver);
 	msm_mdss_unregister();
 	msm_mdp4_unregister();
 	msm_dp_unregister();
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index f6b4c5e1dc3a18516e0e40703b24d3ae37b7c35d..e7d8715bc61ccdee822bc6a1a0b0bbe7c8ff3552 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -532,6 +532,10 @@ extern const struct component_master_ops msm_drm_ops;
 int msm_kms_pm_prepare(struct device *dev);
 void msm_kms_pm_complete(struct device *dev);
 
+int msm_gpu_probe(struct platform_device *pdev,
+		  const struct component_ops *ops);
+void msm_gpu_remove(struct platform_device *pdev,
+		    const struct component_ops *ops);
 int msm_drv_probe(struct device *dev,
 	int (*kms_init)(struct drm_device *dev),
 	struct msm_kms *kms);

-- 
2.39.5


