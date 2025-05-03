Return-Path: <linux-arm-msm+bounces-56636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7760EAA7F33
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 09:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3F61172A0F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D42731AF0B6;
	Sat,  3 May 2025 07:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HxNZR0LE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC161A76AE
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 07:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256663; cv=none; b=aPNfxPpBolHFs9qoBDEsDKkhTiDwzHkelkUcEragJGSJASOF3Xn1+p193q39QgZOpVJp8JzO5D+9r3eSoFrEgvrMd99DLb2Gbpyjb1GaZ3THcppFSeLNxOvD1EMQvO0OQzw06TI/ndGncklyPJU2bcKOPA5AWpsSn5aIMLY+mCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256663; c=relaxed/simple;
	bh=Mg4Q92qhb1QoXFerPIZAI3leBVJXb5Fy5IUO22wVyOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L8Eg3lnv9sMpCfPwIfGeF9OQngr6og6ZCc1MLZ6lR8zeX4zsOyHJREQJPWxUN6v7rSxTBuh5MKCyZaaKTM7DEetgVVuJRTT9QyfQopLj+s0v59e36lQ3dyR+yRWlrHgdfwmCzGza20VFqes2l1na6mA1zrtvjHw31zjRoahs/S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HxNZR0LE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5436DMHq029323
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 07:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bVrQEbWdpGXkYntxxR8pnnrniy2aRqMQ+FcBVLkbpZ8=; b=HxNZR0LECU6iOe18
	qDDw0nGD0zQEu2OK7euapznuO8FlcHjoqy+Hlwq0/2nxqABkooy/yBFSHUCaMo/F
	tboNEtQ695V6rY6c3h7tdVmhll1+D5BT42hkC1T27BjNx3VKo4eGGf9gLuDRDQ8Q
	VNUW8sJAqLsGwOATdc9qZxCBFtP7yOXi83qgXl+qnpdvS7c+/oQk7+KDAxkIZ9Ri
	1G7Xk99NS3Pzb6gkB2Z1ZU9IFDb3mD0xNaWWxS+CNheschcq4SytGU1OoMvuq4cF
	M+32W1G1fRc+M+xPCWzj+JTGjKhw0hpPeJtMyZYvP2l99iVjmwv74OTLiQpbgyQk
	iK402A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce98586-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 07:17:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8f4367446so32638196d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 00:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746256652; x=1746861452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bVrQEbWdpGXkYntxxR8pnnrniy2aRqMQ+FcBVLkbpZ8=;
        b=D0pWVxMR6Roulj3vJeSVIUD4yO5aSuvP793C5mBiZGwfCd3daAZxjfKYk46P1eRqkL
         IZ0yxbmL+YRW1HQYqaOl4CL6KM9AfIYqqDfFaUnjA0MVHGyM7t7ioOaoDqElyP+vF9RU
         lJe3mcgcioK3GC3gMKyKKBEWt2onxx58zEWzN4c/O7duJF5uMshhHbonUHitNsxvgGJE
         M+0tUqMciBVrAMls1TaO/m/P1NTLYF3GK+9w2l0Jg3MQpeLV7XozMSYGLII0ZOVyi68U
         ssHC0SiiKLIaBGRMpQuRJPKmenuXPeN/fcaKwLm6BR2vkFAeJ4NFnUvsp82jtD8jo+4i
         Rb1A==
X-Gm-Message-State: AOJu0Yxy+y4hFmO3aw9vVY/V5NhHcjIZbbSmEIIIsNKVoEAsxPREhmnh
	Oq17D68K4U4k11RKOsUYAh9zemwuGTwUiLwoq9LZ9n0hLlwSubPWISyPnvq8TyTqfi1t7Q4CUbR
	ZO8cOxFZ+NORo2+BtGQ4Np0HTepwQfB5tLZE6CbKgOxUZ3UA1cXpH/aK06sme5Q69
X-Gm-Gg: ASbGnctWOLaJ0VtnoMGbyjHK/mGJskSBN034HhUPc0Ge60Fkf5AdDyrtB4IolB2rppE
	xRhsQ2JxZ8PjoChveUfXYZXPCmjIm1WHgBPZy/wHEnoskI3EvyDfAQQUIbV7LIlOyFYTr/wGHhN
	7BeWyLKkMqVO386LeyzliAorD0KWOzoxTkM6FbbR8YJmjxyi0QVUiX5in9CqoqgFmsjsP39Fe7W
	auzEYdQG6Mm87DBpWaQVAx/GaoaZpVhfvB1eBeDUCn4wrgFcYrlVvGCWzg2aiqtCTbUvDLxZDl9
	VvX3NtHk1boqgnhi1g+taxburw6hcxn9qzGfYW86//NGGV+b9CLdqvHlNSonspO7ea5FlMxVC5h
	+PsYaYBdbpT3Sc9a+1vqWIy2X
X-Received: by 2002:ad4:5d4a:0:b0:6e8:fe16:4d4f with SMTP id 6a1803df08f44-6f528c9a8abmr1929966d6.26.1746256652406;
        Sat, 03 May 2025 00:17:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7OWwx1vio0cEX4R//GXWxkEhzXX84Pz7RG1tdPHWRA3tDj/+yhSs/WEkfqPOMkY9QKyR5Uw==
X-Received: by 2002:ad4:5d4a:0:b0:6e8:fe16:4d4f with SMTP id 6a1803df08f44-6f528c9a8abmr1929766d6.26.1746256652052;
        Sat, 03 May 2025 00:17:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 00:17:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:09 +0300
Subject: [PATCH v2 10/11] drm/msm: enable separate binding of GPU and
 display devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-10-1292cba0f5ad@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5275;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Mg4Q92qhb1QoXFerPIZAI3leBVJXb5Fy5IUO22wVyOs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLulU4MAR5JJFmdZHKUjMa+tYfEqfs/IbHf2
 rgvJ9g446qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7gAKCRCLPIo+Aiko
 1WR1CAClpicrOysCcP+BXUVafnKUgkx73xXz2cxoG5q5SyyX+dJjus4krAWHaz65/JIKvwp3yzy
 7lnMMblIYkq3i7DJ8vS+HrQNeFOkdTEUKmtJYk4lQRKqUJFyD95VYhIbNqhZ+20F/ZJXgN7ZjjG
 +cOg4ZzmZvld/eR9pSXHpwkk40CWEqYLPcze9FMO5EbceQ66Z9m98Nxo3nWsh/b93G+mlSVyuOE
 zg45Blv5D/jZ1eylSD2L+Hh3/vW+aDdP1WmJsUHD3vZevVTQYnqtLYcmOTFV3zIPCAQFhZwsNg4
 KxIlyX4hz126U3P5BlCU3hROfqoaitEOs8mkGH/JWvyfssRp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MiBTYWx0ZWRfX2SN3bkXC8eMn
 rXr5SVSDGJD71ZCftoAzprE9VPbjuSrMF34sX688emcU9NzVvgQI4gBD+OHwoytBZYvGs8Bkhej
 8eWlavcaJSqYhPB/o6FQc/tWSLVPxGEByJJ9rfqpx31g/a/M3/2s1aiWXKjuUWvKuKpdiPn8dQz
 iOniqP9cUhw7YFmYIKe1a2EOeZWUlmJSqNd8NH1RhvdyYf89B2/8sAriY7Vv77i4qMFSVWAZNtQ
 gzdRd2HXxU6k7nGQCAW7J4nmJGTPChXwn1xmOJZCXr/xedxpXakKkvSETbcwex5HF74zZbd+q9I
 Evz6DQdmTQakRXBTXJiokeXUe9CxVuSPfLSLl/CrpdnNFVCujDlBeyjM3khA79C+UqyIgehtoyv
 dFurY7JHtB+1Io2Mb9rGuGZISjF5xMJlJA5viiHvU+V+b4VnpoGmGpi/k/61ZbmwT15hazCj
X-Proofpoint-ORIG-GUID: TFOlgc-M73U_d40mKtlM7S0bBxU2UCWC
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=6815c312 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=d3EbUlffPpwbv2rupc8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: TFOlgc-M73U_d40mKtlM7S0bBxU2UCWC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030062

There are cases when we want to have separate DRM devices for GPU and
display pipelines.
One example is development, when it is beneficial to be able to bind the
GPU driver separately, without the display pipeline (and without the
hacks adding "amd,imageon" to the compatible string).
Another example is some of Qualcomm platforms, which have two MDSS
units, but only one GPU. With current approach it is next to impossible
to support this usecase properly, while separate binding allows users to
have three DRM devices: two for MDSS units and a single headless GPU.

Add kernel param msm.separate_gpu_drm, which if set to true forces
creation of separate display and GPU DRM devices. Mesa supports this
setup by using the kmsro wrapper.

The param is disabled by default, in order to be able to test userspace
for the compatibility issues. Simple clients are able to handle this
setup automatically.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c |  3 +-
 drivers/gpu/drm/msm/msm_drv.c              | 49 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_drv.h              |  2 ++
 3 files changed, 49 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 325cb710ea08ac8e5c3d9c80c8d8e18e1946e994..2322a3301a5226c4e2590344e4744934addeea33 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -243,7 +243,8 @@ static const struct component_ops a3xx_ops = {
 
 static int adreno_probe(struct platform_device *pdev)
 {
-	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon"))
+	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
+	    msm_gpu_no_components())
 		return msm_gpu_probe(pdev, &a3xx_ops);
 
 	return component_add(&pdev->dev, &a3xx_ops);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 804b594ba1e7df9d9aec53a9be1451f1167fc77a..eec7501eb05b6c31ffd9dc5a7ba430e3284ea5ed 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -59,9 +59,18 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
+static bool separate_gpu_drm;
+MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
+module_param(separate_gpu_drm, bool, 0400);
+
 DECLARE_FAULT_ATTR(fail_gem_alloc);
 DECLARE_FAULT_ATTR(fail_gem_iova);
 
+bool msm_gpu_no_components(void)
+{
+	return separate_gpu_drm;
+}
+
 static int msm_drm_uninit(struct device *dev, const struct component_ops *gpu_ops)
 {
 	struct platform_device *pdev = to_platform_device(dev);
@@ -898,6 +907,32 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
+static const struct drm_driver msm_kms_driver = {
+	.driver_features    = DRIVER_GEM |
+				DRIVER_ATOMIC |
+				DRIVER_MODESET |
+				DRIVER_SYNCOBJ_TIMELINE |
+				DRIVER_SYNCOBJ,
+	.open               = msm_open,
+	.postclose          = msm_postclose,
+	.dumb_create        = msm_gem_dumb_create,
+	.dumb_map_offset    = msm_gem_dumb_map_offset,
+	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
+#ifdef CONFIG_DEBUG_FS
+	.debugfs_init       = msm_debugfs_init,
+#endif
+	MSM_FBDEV_DRIVER_OPS,
+	.show_fdinfo        = msm_show_fdinfo,
+	.ioctls             = msm_ioctls,
+	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
+	.fops               = &fops,
+	.name               = "msm-kms",
+	.desc               = "MSM Snapdragon DRM",
+	.major              = MSM_VERSION_MAJOR,
+	.minor              = MSM_VERSION_MINOR,
+	.patchlevel         = MSM_VERSION_PATCHLEVEL,
+};
+
 static const struct drm_driver msm_gpu_driver = {
 	.driver_features    = DRIVER_GEM |
 				DRIVER_RENDER |
@@ -1044,7 +1079,11 @@ static int add_gpu_components(struct device *dev,
 
 static int msm_drm_bind(struct device *dev)
 {
-	return msm_drm_init(dev, &msm_driver, NULL);
+	return msm_drm_init(dev,
+			    msm_gpu_no_components() ?
+				    &msm_kms_driver :
+				    &msm_driver,
+			    NULL);
 }
 
 static void msm_drm_unbind(struct device *dev)
@@ -1080,9 +1119,11 @@ int msm_drv_probe(struct device *master_dev,
 			return ret;
 	}
 
-	ret = add_gpu_components(master_dev, &match);
-	if (ret)
-		return ret;
+	if (!msm_gpu_no_components()) {
+		ret = add_gpu_components(master_dev, &match);
+		if (ret)
+			return ret;
+	}
 
 	/* on all devices that I am aware of, iommu's which can map
 	 * any address the cpu can see are used:
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e7d8715bc61ccdee822bc6a1a0b0bbe7c8ff3552..1ff799f0c78133e73c6857e3692c2dca2c5e60fa 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -543,4 +543,6 @@ void msm_kms_shutdown(struct platform_device *pdev);
 
 bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
+bool msm_gpu_no_components(void);
+
 #endif /* __MSM_DRV_H__ */

-- 
2.39.5


