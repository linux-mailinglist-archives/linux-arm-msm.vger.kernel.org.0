Return-Path: <linux-arm-msm+bounces-56638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16769AA7F38
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 09:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 180AA1BA45F6
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:19:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BF31DF24E;
	Sat,  3 May 2025 07:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ALe8Dcqd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8841AD3E0
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 07:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256669; cv=none; b=Tn3hZCckDc7b7Fn6RGK5STigXLzKJEmS2EXpnR/M0DE5sXqCR6/0i618bgqn/o+I40wCzIC4VdnrgLspz6Jm5zvvOhAPPuHYwURzat6HSmjMBxrpsDh1A3PBhTZvNzJm7vyOeagOOABTdMUyOr/S1ws//yflJxxzLIID4wICRXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256669; c=relaxed/simple;
	bh=LygQOxLEQsPD0oOqeYPZ0TpNniR5HQkElGX4sNXvTkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DY4D0sd2haXQRX/Om4yMkJ4sYcDUbvCPKk3CCvI8klX0R6+QirE3ioFHmzBgzobdiJu/yVJ6F4M4BaDPoH8cM4V1Vv0wsehP5tk4asnPB0plHR6ZUhJ1JDFA8ITaHoGMANQpyg/QVTQD+5G6yJj8zABU2wjBW/3qq2w2z9X6tdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ALe8Dcqd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5436PaMj020946
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 07:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FjWHORKehJBI8n1hI3yF8rZTWsoCKV6hCnRHxz0Vk+w=; b=ALe8Dcqd+LnzAGCv
	JX43vDb6czVQIJrkOpOJBK+y4xuMCRWJB/Lm8R3wB1H/ilV19gaTcdrtcuwyrw7R
	/JSWkW7GaCOKgymc+tooo7JrNXUnJPaKhvBC6Eg7gn0wydQtAQE5/f3UXCMvh7hf
	vGGlrMgSY9Rzo+rYFH1FxtpY3aNqiZ7i0DBgYGpNk8unpaVwFAhODvfMCCnXljCt
	7RyxxO4nnEliDL2HflNnakmogIgvnhorcCLMWW8AgfC4zQShRrfVIy0AxVoell2u
	DoYRZsXbqcTBjIedBYzgvSkQugktzSHSySOc8FFX9eljfEEA6VV+8wn922Pna7Ko
	HCWxRw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg09un-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 07:17:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-47b36edcdb1so4222801cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 00:17:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746256650; x=1746861450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjWHORKehJBI8n1hI3yF8rZTWsoCKV6hCnRHxz0Vk+w=;
        b=kMgPGoAOPEMAqowcq0jCA00ESvg+1AKUzI7huB1Idkpk4ecUSYiLrRfDXGBBUggIX4
         BRZOtoGo7kCG4K/1chXkJVYSzzJESETLs83eubWFTK2EhUvvozmudBH9IC3YPBZMo6J4
         NgOBlH5zGdU8EGZuv9YU4leQRGoLUe9/rfSFyKLp3WJgT3ymxGgsUamtevJHasNHyupn
         vhE11DHcb7rO1BCbfid+hGP9yJWxiKfUvehVZKZuMtHwigedYd9hBtuGIJ6RagMHnECg
         SZ3WNF27k7sCb3ec4fDKAg5hkORwBO6wwLdcrrTajHwFGR2WFGHyrUboM92TBlJCgRs3
         fCVg==
X-Gm-Message-State: AOJu0YwvflEBCcz68LbcUOuFO345fTkKLDtJfLYv3/R78sbiiS2cNyvY
	MPodITdminCkkU/K4bqYd7+2sOMMyKUd2k9r4ApuPZgUaLauNV07jAUP18Nxe1TFpC99wPo3DCZ
	p6pDXnhcuqMkyjVdJ8S/4VftIcRRf8CH8VUxPAQRsgeQgYOW1LFb3V9FEt2GW+Nnb
X-Gm-Gg: ASbGncvuI2kv1DY3i7umfvR6hU5WIP3ZOBFKh/3jGs0oZKepC5tqWzN591qxhxZ8wwx
	8j0lmZNBc6mJ/Uj6CYZiZitNkmgAj3hvhGQYO1wR23+h8kNIoiy88DkJkYYNoQK+b45tJ9o1/bz
	VYeK4Ei8CQiS2ep/Exn5CU+IUzAfsj4eF0GXQwy8J8+nQpypoCoHWrtMr7b2QxTBQM5ka/miDeb
	+X13rAALwAdOs61WpUmbntU0Kka6bnH2BZTs+MrZ45YXKYTIGxEv4qxdTvgYAbjyaDdQ0AboUmH
	M2LPP6DbnIjArCGqZwpKb7myhOHjHjvVMFwOAS6abdDzH0klC2Lv7hmgrY4RA5gFzrXXnSrLQfC
	GQG62PgOsY+1yw4UbxARqcZtv
X-Received: by 2002:a05:622a:22a7:b0:476:97d3:54f with SMTP id d75a77b69052e-48dff4de974mr1620541cf.14.1746256649917;
        Sat, 03 May 2025 00:17:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1bzAAdQlXhBzA5PTRId/zIWytzDLkPwsjKAlBtMNTIcrcDvoywr254sWtwJFp/iqar13fZg==
X-Received: by 2002:a05:622a:22a7:b0:476:97d3:54f with SMTP id d75a77b69052e-48dff4de974mr1620231cf.14.1746256649610;
        Sat, 03 May 2025 00:17:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 00:17:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:08 +0300
Subject: [PATCH v2 09/11] drm/msm: rework binding of Imageon GPUs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-9-1292cba0f5ad@oss.qualcomm.com>
References: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
In-Reply-To: <20250503-msm-gpu-split-v2-0-1292cba0f5ad@oss.qualcomm.com>
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
 bh=LygQOxLEQsPD0oOqeYPZ0TpNniR5HQkElGX4sNXvTkw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4booXccTgyqU9uqPO7yxuZXOEpuavKdezmDO/35IpcZW
 suz9vZ1MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAirbrs/2vbHMPmpH88qxut
 yDf50ppFZzLMlVo2dfxyXVb+tt7Fe3/t4Zqd0v12R5u26324+P3mv+vyHpcbv8wokxGsK4rQ3PF
 F0+ZVitsErb9/dwvP6nixPebNj6w3bV7JJRWVibW5F9k1S98/ZpolWiF8uKvkxZGpL/aLvW8xfr
 0iurfStH/ZpLDsZ835ce8zslnTv76/0NqkLHZjjcyyBtUDz1dFO+1dly39LuejzcrVW7rOd7cyJ
 tf5urFJdFxbEJsXUtBV+Oqh2lPnBzJezjKvGF5xuhQskxP/fp/NSe6yLHf944azVeouasp9rz14
 yl5rJf26nudqkF3RcOqghOFjn0Lu9wYKEv6bNJ72nygBAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: G9jw8NCpe7guP2y3rorDg9xlPg7u-VxO
X-Proofpoint-ORIG-GUID: G9jw8NCpe7guP2y3rorDg9xlPg7u-VxO
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=6815c31a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=WrGWoQF6NLblfNs28g4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MiBTYWx0ZWRfXxgKz0gYeMAEy
 aR1Ky4H2lzjkEx3cTmxVJdw6MSVQZSYlHvsLNw7+QBHrOzf0b72HJdPgQ6FRbC3Jkvpv8IEcgBZ
 IgkwX+H3laKj/WNPWJHmOB/VF4mvEAITWRmknJIP4Awybox0NhDLPd/a7l6/ES+OHiHmdL0LGjS
 34bm+eMC8fj6/3WQLFQIjbdZk+R4kChy/f7AC1usv51HROU+H64mnaQfP2ShOfpWIfVSfRmuZqa
 a37ALgU8AFVlNkSJlyQcZBTeI/tTWgiTCwVYy4X20E488sYQIwrJOMlZBnrRLRzJuH89AJWGE1v
 ORtL5MMrDgTLD0M4Kqz/xY4c6RWQx1xKIwWYebXVVQC5HPSEjDWj6YNWF7O+4mWZGzRRwrjpe+z
 9M8uXbX87/fCiJxZ8GoKuHN6Don6de2i4SE7Hiqn/ewGqV5RiJAoZV3mFP9OXbTgcOd6Tsod
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030062

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
index 236b25c094cd5d462f4b6653de7b7910985cccb6..325cb710ea08ac8e5c3d9c80c8d8e18e1946e994 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -241,42 +241,22 @@ static const struct component_ops a3xx_ops = {
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


