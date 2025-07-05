Return-Path: <linux-arm-msm+bounces-63808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAE4AF9FA7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 12:04:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E7A3171654
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 10:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8D42957A3;
	Sat,  5 Jul 2025 10:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Thb20Ejc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDF128FFE6
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751709773; cv=none; b=uVchsOozXPHmJWCApeTeQR3MasgQBhY+g+MJJ9to5Fisfb45TGxsgRnWc9GynznHu45oCzqhcD91KjqeU2VhK0M8StnR5a3XYBzum9laEgGykR4iv2Y3457K4a6WwofV4VT+RiPBdY7HxwkJHfsYyvQ+LK3KkBrps+B49HXu2g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751709773; c=relaxed/simple;
	bh=fG270cxV/2q7kQa6T4r/dHwrEGN9NSQeGPoJADDDa3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LIxx63ov/1y9qk2yjgtudrLYbykd+xMsPHjGaza/OZ1RBtz6jkx70OgcDfRhxAsQBZZVV9/Ez3N0t6KFiVSH4Rm5PbQglmYVDIwG8WXM/a5n8tcPIbXMC8/fPaF4Q+YXtpz/m/s9mrIo1RL1cqTGT00PW3P7C3oeXrlYLdwTKlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Thb20Ejc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5659cvG1009567
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 10:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpieUQjCAob3oLlQXRGz5T12XycG9BXDdnTujA4EfOc=; b=Thb20EjcqqbYijoU
	P7qSSBdTEV2xrIRciJFW+ZcBnnpUQGZQmEKF4UZlHQdXMgbNzwuZ8zKg40rP+Axg
	OhkxXpaQ32hY3y4u1eyzX4nKyd1ezZ4AEkE586aIkcxRUizrMWCPA9HXX7WOIMNQ
	fd3TNH/zmQThfr0bTWsuIaep7EN55z+G4TmcpR7l94QwSjfQf+6sDYJrAuqMeMjT
	3/7gVQo+WfIPgPag65vWDwJ6i0HVJd4oBQsbpw7F2VsiYgzGXLeNE+gr+ciil7oN
	AzE31iK9L4apHv/DMtz9taf+sRYbUJu0zDbbmEZEQ/mfjv3hVZ5t0LfyR6yYOCit
	qM1xzQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2agnct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 10:02:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a98d1ed40aso37349611cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 03:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751709769; x=1752314569;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xpieUQjCAob3oLlQXRGz5T12XycG9BXDdnTujA4EfOc=;
        b=MTrUtel7mYnPxJBN9hh4Pw6njeQMExTYBVWtWGC+xxGfrzZOo3VGmusGAbUAmLnggF
         UsM79Yb0L4kw86WiH0vYoIt6Kq4LdzlRNrV6jWGDBCnPv0NaH3UBjjj8jYmCZLeY+x5h
         aq1dB+VSDkhbEPvPabWKwkGr/HZLU0LYpu4TTCOQbOWHbb2zABOqiWCMy74xbM3wRP8/
         Rq3cV4R/fkIKdhhWpJ8uZfgIpT8mEFcIgRATuReEPwbdtEI4VKJ4sOapCBO9mEtNfvcR
         zIfOXCzxWMFoBLv4U+dyMRhk5DIUcxAtaZgtWOmCowozFfLcaP4trZNQd11Ap9Hv6flL
         8wWA==
X-Gm-Message-State: AOJu0Yyo2WDZd6OpWYF4NJxSew7t5mEBlUm7fG/BomBAYj+2PI80IvFz
	KhVF3sq0wIBRC07z1l3S9dL8w+NKrVhe00QbQxloc/eLU2VrhmvAeQUDIFRNl0F9QuuPkaoD6/g
	vqrRlQOOpT0EbWYaE23fofqN6PaV77EpFeX9C4eEmwqtZaQRHbT1vIqyLuw6+9XgTYrVn
X-Gm-Gg: ASbGncscr2NuS0k7VFx3scydPKzcslSElBhMNSssIraoPybpsG6kf8+NX2tGoekodf5
	PQD/cjxYF0szOc4fKhbXeC+UaPUG0qjqhVZlcENQZGWYXyvl9+R11UvaCaBC8ySdHPNQRQvck3k
	rKzPytYrmwxLqqX12Y1X+4HZWoR5AvoXyMW9QH+oh/L3yruXXihWrrLJShkHGr+52LCbyotAs/D
	V96GbWs8rNtou+7+rj2AF+iniaMR574u6LoxJpKaxmrrEdn3lLG6UphToJZLXALo8NJij+/huTY
	bNQwrsj4XLy/OIYbRZs8ICl/NO+a7sLgknSeU2xAKfJy9MwUK1KJNqvrLuYlaUGZGphaiq8zarq
	5D1wVLN9+oHNeljIVUJQPtYH4gSrL7krBhiQ=
X-Received: by 2002:a05:620a:46a0:b0:7cd:3b13:c5b4 with SMTP id af79cd13be357-7d5f0286caamr235694685a.24.1751709769441;
        Sat, 05 Jul 2025 03:02:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLFY60CQNpL3C+yvQakg2k85gAZCLriNkaPNQyhvp8oKtheOso4rDEGIWdjnPNdKdgNtluIw==
X-Received: by 2002:a05:620a:46a0:b0:7cd:3b13:c5b4 with SMTP id af79cd13be357-7d5f0286caamr235690685a.24.1751709768808;
        Sat, 05 Jul 2025 03:02:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 03:02:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:35 +0300
Subject: [PATCH v4 10/10] drm/msm: enable separate binding of GPU and
 display devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-10-fb470c481131@oss.qualcomm.com>
References: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
In-Reply-To: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5219;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fG270cxV/2q7kQa6T4r/dHwrEGN9NSQeGPoJADDDa3w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPg0D8TLyxpxyMP5ZOm6f/GyJWsJzX6ZcuA4r
 FCYCYgTH++JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4NAAKCRCLPIo+Aiko
 1QvtB/0f5DxO5BvqdVoPXZaDjS6R3QfljCGAuivAD4aP8SahrZOkfS8yC5L+862G61Kl1A0QwoZ
 pOocaIuIDTdq3a2U7PP1gDB79IUrNh+Jj5YkWOqE0q2d+jiaVlcdhySbrYhXm3Nfwwbw79DKeBg
 r8J2pylstkUlBHQtdm2Z+0gLbp2cNQEISwi9xHI3cO8f6KVtAmYoPgbSJclsfyHnk65kB2qUo1K
 WVd+P+dJJgmrk/YI9ID0FrmiBvXoputJ5iXF0V75jZ6KK9QtWOGFiNml93xgpea+j8Xk/JkzaZd
 f/1Uz7I8ICTvR7k6pPB2lA5Vjf6xSTcKP41+AHWcspLFx+0k
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfX3sfBKjm+kE+z
 qVbY8erbJw6cZD/zBPo7Zs8zgG9UQ9bCgW5EhoXAWR4IFmxPa91ZlPnuW/tb0vR/hdD1M+QSGOA
 C2OaBA0rmn6cRwue/4nXiNc/WpBwhCuHIm/yamxHO7nfJpp8upvBmk8DzH2e0JXucR+H1LNbHLw
 3N/CXuZ0P3iHPPexpXcsMmBDNoj39OpvVpeYIBywdnle6PZPbOUUObSuWLW1QJ2R9wDUZoY67r+
 d2IIfa7SzVTNAfwoSYo7CnlL08e7zzZW3ZnZMH7NW4PueDnIvThcKSFS2cuRABw+Ys29XOBEkoS
 XEIU8/jdDEtWbnwiHorLpqul+yEJvv+oClsKWZfHaCZWkTRVhyUThByPHQzM1bURHIPIBofXbPE
 60laFK5oz/L3wQgMiaFaq2eYmIdmZzjIDnUr9d8/iF0ABqews2Qwa6o+gnPMUrjX9Gh/e/51
X-Proofpoint-ORIG-GUID: OcdvkEUcKZy0YJxGbZMoiEh3wgLirOMz
X-Proofpoint-GUID: OcdvkEUcKZy0YJxGbZMoiEh3wgLirOMz
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=6868f84a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=d3EbUlffPpwbv2rupc8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050064

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
 drivers/gpu/drm/msm/msm_drv.c              | 47 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_drv.h              |  2 ++
 3 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 99c8d2f4e4b49fda912fa49429399cf207eccead..50945bfe9b4992118f23db3cd17ac348be9f9c9d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -262,7 +262,8 @@ static const struct component_ops a3xx_ops = {
 
 static int adreno_probe(struct platform_device *pdev)
 {
-	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon"))
+	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
+	    msm_gpu_no_components())
 		return msm_gpu_probe(pdev, &a3xx_ops);
 
 	return component_add(&pdev->dev, &a3xx_ops);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 0ab005a7d5e99e46fe47c9e64514434416898d20..2966ba086b2cdb3232a7fa0445b953787cfad2b0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -54,9 +54,18 @@ static bool modeset = true;
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
@@ -836,6 +845,30 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
+static const struct drm_driver msm_kms_driver = {
+	.driver_features    = DRIVER_GEM |
+				DRIVER_ATOMIC |
+				DRIVER_MODESET,
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
@@ -982,7 +1015,11 @@ static int add_gpu_components(struct device *dev,
 
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
@@ -1018,9 +1055,11 @@ int msm_drv_probe(struct device *master_dev,
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
index e3dfaa156307dcd8bb675f865985a0888be8fb87..9875ca62e9adb12dca9bcc74e2825b0364372a54 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -554,4 +554,6 @@ void msm_kms_shutdown(struct platform_device *pdev);
 
 bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver);
 
+bool msm_gpu_no_components(void);
+
 #endif /* __MSM_DRV_H__ */

-- 
2.39.5


