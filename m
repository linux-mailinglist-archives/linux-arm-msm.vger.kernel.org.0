Return-Path: <linux-arm-msm+bounces-74021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DDBB82D28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 05:52:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE5457BAB08
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 03:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06602459D7;
	Thu, 18 Sep 2025 03:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G81Oh7NX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EE3245010
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758167495; cv=none; b=DeASLqSNVkq92cvHKp9GcX+qDuOHeOe4nqqK1mvfK92ZC/fZgSztx3/R7M9uQVmWJ3LKRkl16eVu8N6ZCiLvXfeiZrkj3dQHJpkeJB+eVBWKmEYQjtsrfVTABpZ8d7cz/pEt/bExhWbis8AV/fNAN1hP2SFjN1U0N//XxNCzFgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758167495; c=relaxed/simple;
	bh=MPlM4YS1WNe5lcUQo7syRlnRAdiC33DpGMTUZ2Yq/Ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PbdFtP+4zqhHDl65GsH+NvrrIEmbqsVxiwYsbr0cvu9E+s8fHF94FD38V1yN6EZ0hZa5SLcUqPJJqw/R3nl6dv4yFPSlOi9r466cSMoveg9BGwLw46QUTS1k8BtcMMEjK+jLtvz/98BT2Hhm1AnuojB25ELULI4YYJHacRbYkl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G81Oh7NX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGUbX0014180
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2aFg0keuUaiCvcSu6LI8UzHfBFFR9GyPPp6KA0oigY8=; b=G81Oh7NX+qOcxkYg
	Q6OflROxqJ7IfuuhuWjWWYxvZLS/LesVGUVLkWGl5/tT4MvhjR1rOfjDqmSCLhlm
	ZTMSLj6D5EAOokT50k6wRreo9PnMMwo35tXSmjnuHfi6ZSaB4EjDPPuDwwNaCyWD
	/eS7c1TrX6nmDWHEeQhCHpqMvdfUS9otgT/Zi3Q58qjEOO//gMqNyRytmMJxJTUV
	sx48L/FXDgybcjFNH3l1uHcNAPzyGqVBPFM6lPRUszW7ZQGDHiRoA7PWjgNsDuT8
	v95HTGnqmi6/ldKgh0eOuX4vyB9JAvTEecHgrBo2sKOfBKtz9rKQTD7CvGnsT6R+
	7752MA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxu4u1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 03:51:32 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b5f290579aso10207971cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 20:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758167491; x=1758772291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aFg0keuUaiCvcSu6LI8UzHfBFFR9GyPPp6KA0oigY8=;
        b=A28Rq+xUuLXdqpxxifX0BGR37i8HIl5eCC1Ky/VmUhZ6cOJlsU7OTl7GiSC0JzWUP2
         /my0+vNcN+vaSG5VrRdo0ihNGQ1KYHT3mqbUOnzalvHoERuKFjdF2YEgNWYESBoIMcll
         uwt2gu9tq+I94fyy8I8dZdWtAMCzCRMexkioYbci1Z2LdTkP86NRYvpxESy33Mqw4z43
         /N//vd92JkILRfFFwWq/48rg38pzDKD8H+tWngDZoetQYPRff1NdskHzzk2C1A/S67nh
         SdiY3f2cUK49/lujOap8wLmZZfuLiAe+JEmpKfzvWCGgI3zt/wtJXNd2LGSUevyXcDbf
         NkSA==
X-Gm-Message-State: AOJu0Yyf4siDIEDoVDGXbGKrhQPokxXD194upQmNANhl5QoZhUp7PjIY
	sAp4BwyjuilbrsYKibHp+vzM7s0TvN4wnoZZxo+2fMgqZUDS2kP9eK9/YeJhDsXt7hkbKwyWY6h
	xCC43zNvgeedV+SUI8NfwKkalUlQh+E83B/d9KSO0XaYacA44WPrTsoGfFjAFE+g+Ujwv
X-Gm-Gg: ASbGncuM4mYKVucW9TDXWYPZOm0LvjPDqzEVGrqf0iGUcr5cYTMIx+i5Jn7MHjxmzFf
	0XwJOIR0v1AC/kw+iEmNchuy+8xGm3koeyLmD+sE5qCalYdE3RuMT332pHzocybVqUW9vSK0thu
	r6Hho8DpWV6DFU5JBGluwSTXYRe+QRkzxEQoDxhkRascB32io/LkotX8vdleOZr66SNRdNiqn+l
	2eKOQFq/SUQ4W2iTIHaNfy4WcoUI/DS185uyMhea7NQ73iWnnVzHDvD58+mlbmBtXTIfXcnxcrH
	y27rWW0o+Jo7fCUXCa6roYXt/IiCpEA8RsoNm/FqaOCeacpE5jFm3kt5uudqJtB+7d8Bewj1gS4
	B3B8LQlGsDyAcrE4z8GdWjtDif0tT61NE+TS9deYAXLCyo1bZqEGG
X-Received: by 2002:ac8:5a8f:0:b0:4b2:ee19:ed57 with SMTP id d75a77b69052e-4ba6799d2d2mr50926711cf.12.1758167490644;
        Wed, 17 Sep 2025 20:51:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNpP8PjKrWWX8fJxpN8mpxakNvZGAhPJUW6Kzmnc2OVvCJOd10/Vr/df7omOH16dGAJDtG/Q==
X-Received: by 2002:ac8:5a8f:0:b0:4b2:ee19:ed57 with SMTP id d75a77b69052e-4ba6799d2d2mr50926541cf.12.1758167490063;
        Wed, 17 Sep 2025 20:51:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361aa38c4f7sm2799911fa.62.2025.09.17.20.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 20:51:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 06:50:26 +0300
Subject: [PATCH v5 5/5] drm/msm: make it possible to disable GPU support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-msm-gpu-split-v5-5-44486f44d27d@oss.qualcomm.com>
References: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
In-Reply-To: <20250918-msm-gpu-split-v5-0-44486f44d27d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=25185;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MPlM4YS1WNe5lcUQo7syRlnRAdiC33DpGMTUZ2Yq/Ws=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoy4GuRkoMds06CJWjhcR2NzxMhRnAcqHKWf65Q
 UBaLZI4D7SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMuBrgAKCRCLPIo+Aiko
 1YrEB/9X7sjrqwipG+XeWj1RvHGXAxylXQ4CkdDdhkpQZpcH7gGEmUzfdKNozD5doZ/w6gMo8Jr
 EtztzmbNeXpC01xGb3wEgzpCcADZBWNzZCOOq5XsHIyjxd1Euz6X7ARCIxThTlAlhwFfxvqlC7l
 w0O/JPfkodeK7esAmxAK15Hcm4Lvs/vyyC7M+1o2M/jcPXTKLscLh5QJBtqMvy8DebTgpd+cAVW
 97vzuWvGPbxJ3xmn7rNdHSya81hY9bGq91eX8iNfHr3yTyUhE+jCoWwULx59JkdgDXfM3d9rr1l
 XjrTRKpeGZ8xyRCNAq4coVqWdTmiiu1lwndBC+NCHIP6XzMp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX7CTyb4OqsJN0
 gKTFPeDbRcNIDLBQkO6KzLn4hFV5IdT8274aEtQytNYqyEjGBVnKTahGhp7wRsXjseaQMcte8B0
 iN9yNizRhjR9g/1N0gT9VaFh/hMwOkifWb4mY883r5m8RjcSmc7oUlGmr4DU6tdxbE3/j/b/aKQ
 0UH9/ZSLlVQa2fuSG9GIXWGqu70Hxb38PSy7MaJKdKKWohTks3UQ6aqgD6a+aeQsN726NYazjjQ
 4M7+Y+6M3sA0OaBzldI1ct/6FVlTbiexHXr7aIa6KuMEDQpsg7pIKsGxpfkzLQxgQRMD5cqEahG
 UFf+KZ4OlWyDWhsceqbNnQz98/aFIPncYGyqHOB8m68NoQrjnX7PZaMkHPejMJAMnX/DCiDGA0A
 lQqR2Wx2
X-Proofpoint-ORIG-GUID: 47QvnMNIMlM6vmcodSaK5tnt8gZnu0D6
X-Authority-Analysis: v=2.4 cv=R+UDGcRX c=1 sm=1 tr=0 ts=68cb81c4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=O_sw1XWOr4TBHZv0ZsgA:9
 a=Stk6j59YW_Pzu7xC:21 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 47QvnMNIMlM6vmcodSaK5tnt8gZnu0D6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

Some of the platforms don't have onboard GPU or don't provide support
for the GPU in the drm/msm driver. Make it possible to disable the GPU
part of the driver and build the KMS-only part.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig           |  27 +++++--
 drivers/gpu/drm/msm/Makefile          |  15 ++--
 drivers/gpu/drm/msm/msm_drv.c         | 133 ++++++++++++++--------------------
 drivers/gpu/drm/msm/msm_drv.h         |  16 ----
 drivers/gpu/drm/msm/msm_gem.h         |   2 +
 drivers/gpu/drm/msm/msm_gem_vma.h     |  14 ++++
 drivers/gpu/drm/msm/msm_gpu.c         |  45 ++++++++++++
 drivers/gpu/drm/msm/msm_gpu.h         | 111 +++++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_submitqueue.c |  12 +--
 9 files changed, 240 insertions(+), 135 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 250246f81ea94f01a016e8938f08e1aa4ce02442..f833aa2e6263ea5509d77cac42f94c7fe34e6ece 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -13,33 +13,43 @@ config DRM_MSM
 	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
 	depends on PM
 	select IOMMU_IO_PGTABLE
-	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_EXEC
 	select DRM_GPUVM
-	select DRM_SCHED
 	select SHMEM
 	select TMPFS
-	select QCOM_SCM
 	select QCOM_UBWC_CONFIG
 	select WANT_DEV_COREDUMP
 	select SND_SOC_HDMI_CODEC if SND_SOC
-	select SYNC_FILE
 	select PM_OPP
-	select NVMEM
 	select PM_GENERIC_DOMAINS
 	select TRACE_GPU_MEM
 	help
 	  DRM/KMS driver for MSM/snapdragon.
 
+config DRM_MSM_ADRENO
+	bool "Qualcomm Adreno GPU support"
+	default y
+	depends on DRM_MSM
+	select DRM_EXEC
+	select DRM_SCHED
+	select NVMEM
+	select QCOM_MDT_LOADER if ARCH_QCOM
+	select QCOM_SCM if ARCH_QCOM
+	select SYNC_FILE
+	help
+	  Enable support for the GPU present on most of Qualcomm Snapdragon
+	  platforms. Without this option the driver will only support the
+	  unaccelerated display output.
+	  If you are unsure, say Y.
+
 config DRM_MSM_GPU_STATE
 	bool
-	depends on DRM_MSM && (DEBUG_FS || DEV_COREDUMP)
+	depends on DRM_MSM_ADRENO && (DEBUG_FS || DEV_COREDUMP)
 	default y
 
 config DRM_MSM_GPU_SUDO
 	bool "Enable SUDO flag on submits"
-	depends on DRM_MSM && EXPERT
+	depends on DRM_MSM_ADRENO && EXPERT
 	default n
 	help
 	  Enable userspace that has CAP_SYS_RAWIO to submit GPU commands
@@ -189,6 +199,7 @@ config DRM_MSM_HDMI
 	default y
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
+	select QCOM_SCM
 	help
 	  Compile in support for the HDMI output MSM DRM driver. It can
 	  be a primary or a secondary display on device. Note that this is used
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index a475479fe201cb03937d30ee913c2e178675384e..ffa0767601fc8b2bc8f60506f0aac6f08a41f3c5 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -108,26 +108,29 @@ msm-display-$(CONFIG_DRM_MSM_KMS) += \
 
 msm-y += \
 	msm_drv.o \
-	msm_fence.o \
 	msm_gem.o \
 	msm_gem_debugfs.o \
 	msm_gem_prime.o \
 	msm_gem_shrinker.o \
-	msm_gem_submit.o \
 	msm_gem_vma.o \
+	msm_io_utils.o \
+	msm_iommu.o \
+	msm_gpu_tracepoints.o \
+
+msm-$(CONFIG_DRM_MSM_ADRENO) += \
+	msm_fence.o \
+	msm_gem_submit.o \
 	msm_gem_vm_bind.o \
 	msm_gpu.o \
+	msm_gpu_debugfs.o \
 	msm_gpu_devfreq.o \
 	msm_gpu_debugfs.o \
-	msm_io_utils.o \
 	msm_ioctl.o \
-	msm_iommu.o \
 	msm_perf.o \
 	msm_rd.o \
 	msm_ringbuffer.o \
 	msm_submitqueue.o \
 	msm_syncobj.o \
-	msm_gpu_tracepoints.o \
 
 msm-$(CONFIG_DRM_MSM_KMS) += \
 	msm_atomic.o \
@@ -163,7 +166,7 @@ msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
 msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
 msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
 
-msm-y += $(adreno-y)
+msm-$(CONFIG_DRM_MSM_ADRENO) += $(adreno-y)
 msm-$(CONFIG_DRM_MSM_KMS) += $(msm-display-y)
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 28a5da1d1391f6c3cb2bfd175154016f8987b752..f7fb80b6c6d333149eaef17407cfc06d2f1abf3f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -51,7 +51,11 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
+#ifndef CONFIG_DRM_MSM_ADRENO
+static bool separate_gpu_kms = true;
+#else
 static bool separate_gpu_kms;
+#endif
 MODULE_PARM_DESC(separate_gpu_kms, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
 module_param(separate_gpu_kms, bool, 0400);
 
@@ -204,53 +208,20 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv,
 	return ret;
 }
 
-/*
- * DRM operations:
- */
-
-static void load_gpu(struct drm_device *dev)
+void __msm_context_destroy(struct kref *kref)
 {
-	static DEFINE_MUTEX(init_lock);
-	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_context *ctx = container_of(kref, struct msm_context, ref);
 
-	mutex_lock(&init_lock);
+	msm_submitqueue_fini(ctx);
 
-	if (!priv->gpu)
-		priv->gpu = adreno_load_gpu(dev);
+	drm_gpuvm_put(ctx->vm);
 
-	mutex_unlock(&init_lock);
-}
-
-/**
- * msm_context_vm - lazily create the context's VM
- *
- * @dev: the drm device
- * @ctx: the context
- *
- * The VM is lazily created, so that userspace has a chance to opt-in to having
- * a userspace managed VM before the VM is created.
- *
- * Note that this does not return a reference to the VM.  Once the VM is created,
- * it exists for the lifetime of the context.
- */
-struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx)
-{
-	static DEFINE_MUTEX(init_lock);
-	struct msm_drm_private *priv = dev->dev_private;
-
-	/* Once ctx->vm is created it is valid for the lifetime of the context: */
-	if (ctx->vm)
-		return ctx->vm;
-
-	mutex_lock(&init_lock);
-	if (!ctx->vm) {
-		ctx->vm = msm_gpu_create_private_vm(
-			priv->gpu, current, !ctx->userspace_managed_vm);
-
-	}
-	mutex_unlock(&init_lock);
+#ifdef CONFIG_DRM_MSM_ADRENO
+	kfree(ctx->comm);
+	kfree(ctx->cmdline);
+#endif
 
-	return ctx->vm;
+	kfree(ctx);
 }
 
 static int context_init(struct drm_device *dev, struct drm_file *file)
@@ -262,9 +233,6 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	if (!ctx)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&ctx->submitqueues);
-	rwlock_init(&ctx->queuelock);
-
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
@@ -280,7 +248,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
 	/* For now, load gpu on open.. to avoid the requirement of having
 	 * firmware in the initrd.
 	 */
-	load_gpu(dev);
+	msm_gpu_load(dev);
 
 	return context_init(dev, file);
 }
@@ -307,31 +275,13 @@ static void msm_postclose(struct drm_device *dev, struct drm_file *file)
 	context_close(ctx);
 }
 
-static const struct drm_ioctl_desc msm_ioctls[] = {
-	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_SET_PARAM,    msm_ioctl_set_param,    DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_GEM_SUBMIT,   msm_ioctl_gem_submit,   DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_WAIT_FENCE,   msm_ioctl_wait_fence,   DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_RENDER_ALLOW),
-};
-
 static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 {
 	struct drm_device *dev = file->minor->dev;
 	struct msm_drm_private *priv = dev->dev_private;
 
-	if (!priv->gpu)
-		return;
-
-	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
+	if (priv->gpu)
+		msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
 
 	drm_show_memory_stats(p, file);
 }
@@ -357,6 +307,23 @@ static const struct file_operations fops = {
 		DRIVER_MODESET | \
 		0 )
 
+#ifdef CONFIG_DRM_MSM_ADRENO
+static const struct drm_ioctl_desc msm_ioctls[] = {
+	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_SET_PARAM,    msm_ioctl_set_param,    DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_SUBMIT,   msm_ioctl_gem_submit,   DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_WAIT_FENCE,   msm_ioctl_wait_fence,   DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_RENDER_ALLOW),
+};
+
 static const struct drm_driver msm_driver = {
 	.driver_features    = DRIVER_FEATURES_GPU | DRIVER_FEATURES_KMS,
 	.open               = msm_open,
@@ -380,39 +347,40 @@ static const struct drm_driver msm_driver = {
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
 
-static const struct drm_driver msm_kms_driver = {
-	.driver_features    = DRIVER_FEATURES_KMS,
+static const struct drm_driver msm_gpu_driver = {
+	.driver_features    = DRIVER_FEATURES_GPU,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
-	.dumb_create        = msm_gem_dumb_create,
-	.dumb_map_offset    = msm_gem_dumb_map_offset,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
 #endif
-	MSM_FBDEV_DRIVER_OPS,
 	.show_fdinfo        = msm_show_fdinfo,
+	.ioctls             = msm_ioctls,
+	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
 	.fops               = &fops,
-	.name               = "msm-kms",
+	.name               = "msm",
 	.desc               = "MSM Snapdragon DRM",
 	.major              = MSM_VERSION_MAJOR,
 	.minor              = MSM_VERSION_MINOR,
 	.patchlevel         = MSM_VERSION_PATCHLEVEL,
 };
+#endif
 
-static const struct drm_driver msm_gpu_driver = {
-	.driver_features    = DRIVER_FEATURES_GPU,
+static const struct drm_driver msm_kms_driver = {
+	.driver_features    = DRIVER_FEATURES_KMS,
 	.open               = msm_open,
 	.postclose          = msm_postclose,
+	.dumb_create        = msm_gem_dumb_create,
+	.dumb_map_offset    = msm_gem_dumb_map_offset,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
 #endif
+	MSM_FBDEV_DRIVER_OPS,
 	.show_fdinfo        = msm_show_fdinfo,
-	.ioctls             = msm_ioctls,
-	.num_ioctls         = ARRAY_SIZE(msm_ioctls),
 	.fops               = &fops,
-	.name               = "msm",
+	.name               = "msm-kms",
 	.desc               = "MSM Snapdragon DRM",
 	.major              = MSM_VERSION_MAJOR,
 	.minor              = MSM_VERSION_MINOR,
@@ -511,6 +479,7 @@ bool msm_disp_drv_should_bind(struct device *dev, bool dpu_driver)
 }
 #endif
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 /*
  * We don't know what's the best binding to link the gpu with the drm device.
  * Fow now, we just hunt for all the possible gpus that we support, and add them
@@ -549,6 +518,12 @@ static int msm_drm_bind(struct device *dev)
 				    &msm_driver,
 			    NULL);
 }
+#else
+static int msm_drm_bind(struct device *dev)
+{
+	return msm_drm_init(dev, &msm_kms_driver, NULL);
+}
+#endif
 
 static void msm_drm_unbind(struct device *dev)
 {
@@ -583,11 +558,13 @@ int msm_drv_probe(struct device *master_dev,
 			return ret;
 	}
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 	if (!msm_gpu_no_components()) {
 		ret = add_gpu_components(master_dev, &match);
 		if (ret)
 			return ret;
 	}
+#endif
 
 	/* on all devices that I am aware of, iommu's which can map
 	 * any address the cpu can see are used:
@@ -603,6 +580,7 @@ int msm_drv_probe(struct device *master_dev,
 	return 0;
 }
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 int msm_gpu_probe(struct platform_device *pdev,
 		  const struct component_ops *ops)
 {
@@ -630,6 +608,7 @@ void msm_gpu_remove(struct platform_device *pdev,
 {
 	msm_drm_uninit(&pdev->dev, ops);
 }
+#endif
 
 static int __init msm_drm_register(void)
 {
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 646ddf2c320ac94ff7b0f5c21dab60fe777a10bf..dd77e26895fb493ce73181581434fb42885a089e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -436,22 +436,6 @@ static inline void msm_mdss_unregister(void) {}
 
 #ifdef CONFIG_DEBUG_FS
 void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
-void msm_gpu_debugfs_init(struct drm_minor *minor);
-void msm_gpu_debugfs_late_init(struct drm_device *dev);
-int msm_rd_debugfs_init(struct drm_minor *minor);
-void msm_rd_debugfs_cleanup(struct msm_drm_private *priv);
-__printf(3, 4)
-void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
-		const char *fmt, ...);
-int msm_perf_debugfs_init(struct drm_minor *minor);
-void msm_perf_debugfs_cleanup(struct msm_drm_private *priv);
-#else
-__printf(3, 4)
-static inline void msm_rd_dump_submit(struct msm_rd_state *rd,
-			struct msm_gem_submit *submit,
-			const char *fmt, ...) {}
-static inline void msm_rd_debugfs_cleanup(struct msm_drm_private *priv) {}
-static inline void msm_perf_debugfs_cleanup(struct msm_drm_private *priv) {}
 #endif
 
 struct clk *msm_clk_get(struct platform_device *pdev, const char *name);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index 3a0086a883a2c2e57b01a5add17be852f2877865..088a84dbc564066310c6ef9d9077b802c73babb9 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -68,6 +68,7 @@ struct msm_gem_vm {
 	/** @base: Inherit from drm_gpuvm. */
 	struct drm_gpuvm base;
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 	/**
 	 * @sched: Scheduler used for asynchronous VM_BIND request.
 	 *
@@ -94,6 +95,7 @@ struct msm_gem_vm {
 		 */
 		atomic_t in_flight;
 	} prealloc_throttle;
+#endif
 
 	/**
 	 * @mm: Memory management for kernel managed VA allocations
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.h b/drivers/gpu/drm/msm/msm_gem_vma.h
index f702f81529e72b86bffb4960408f1912bc65851a..0cf92b111c17bfc1a7d3db10e4395face1afaa83 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.h
+++ b/drivers/gpu/drm/msm/msm_gem_vma.h
@@ -95,11 +95,25 @@ vm_map_op(struct msm_gem_vm *vm, const struct msm_vm_map_op *op)
 				   op->range, op->prot);
 }
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 int msm_gem_vm_sm_step_map(struct drm_gpuva_op *op, void *_arg);
 int msm_gem_vm_sm_step_remap(struct drm_gpuva_op *op, void *arg);
 int msm_gem_vm_sm_step_unmap(struct drm_gpuva_op *op, void *_arg);
 
 int msm_gem_vm_sched_init(struct msm_gem_vm *vm, struct drm_device *drm);
 void msm_gem_vm_sched_fini(struct msm_gem_vm *vm);
+#else
+
+#define msm_gem_vm_sm_step_map   NULL
+#define msm_gem_vm_sm_step_remap NULL
+#define msm_gem_vm_sm_step_unmap NULL
+
+static inline int msm_gem_vm_sched_init(struct msm_gem_vm *vm, struct drm_device *drm)
+{
+	return -EINVAL;
+}
+
+static inline void msm_gem_vm_sched_fini(struct msm_gem_vm *vm) {}
+#endif
 
 #endif
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 17759abc46d7d7af4117b1d71f1d5fba6ba0b61c..9ac6f04e95a61143dc6372fde165d45a306a495c 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -1146,3 +1146,48 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
 
 	platform_set_drvdata(gpu->pdev, NULL);
 }
+
+void msm_gpu_load(struct drm_device *dev)
+{
+	static DEFINE_MUTEX(init_lock);
+	struct msm_drm_private *priv = dev->dev_private;
+
+	mutex_lock(&init_lock);
+
+	if (!priv->gpu)
+		priv->gpu = adreno_load_gpu(dev);
+
+	mutex_unlock(&init_lock);
+}
+
+/**
+ * msm_context_vm - lazily create the context's VM
+ *
+ * @dev: the drm device
+ * @ctx: the context
+ *
+ * The VM is lazily created, so that userspace has a chance to opt-in to having
+ * a userspace managed VM before the VM is created.
+ *
+ * Note that this does not return a reference to the VM.  Once the VM is created,
+ * it exists for the lifetime of the context.
+ */
+struct drm_gpuvm *msm_context_vm(struct drm_device *dev, struct msm_context *ctx)
+{
+	static DEFINE_MUTEX(init_lock);
+	struct msm_drm_private *priv = dev->dev_private;
+
+	/* Once ctx->vm is created it is valid for the lifetime of the context: */
+	if (ctx->vm)
+		return ctx->vm;
+
+	mutex_lock(&init_lock);
+	if (!ctx->vm) {
+		ctx->vm = msm_gpu_create_private_vm(
+			priv->gpu, current, !ctx->userspace_managed_vm);
+
+	}
+	mutex_unlock(&init_lock);
+
+	return ctx->vm;
+}
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index a597f2bee30b6370ecc3639bfe1072c85993e789..def2edadbface07d26c6e7c6add0d08352b8d748 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -345,20 +345,6 @@ struct msm_gpu_perfcntr {
  * struct msm_context - per-drm_file context
  */
 struct msm_context {
-	/** @queuelock: synchronizes access to submitqueues list */
-	rwlock_t queuelock;
-
-	/** @submitqueues: list of &msm_gpu_submitqueue created by userspace */
-	struct list_head submitqueues;
-
-	/**
-	 * @queueid:
-	 *
-	 * Counter incremented each time a submitqueue is created, used to
-	 * assign &msm_gpu_submitqueue.id
-	 */
-	int queueid;
-
 	/**
 	 * @closed: The device file associated with this context has been closed.
 	 *
@@ -394,6 +380,20 @@ struct msm_context {
 	 * pointer to the previous context.
 	 */
 	int seqno;
+#ifdef CONFIG_DRM_MSM_ADRENO
+	/** @queuelock: synchronizes access to submitqueues list */
+	rwlock_t queuelock;
+
+	/** @submitqueues: list of &msm_gpu_submitqueue created by userspace */
+	struct list_head submitqueues;
+
+	/**
+	 * @queueid:
+	 *
+	 * Counter incremented each time a submitqueue is created, used to
+	 * assign &msm_gpu_submitqueue.id
+	 */
+	int queueid;
 
 	/**
 	 * @sysprof:
@@ -455,6 +455,7 @@ struct msm_context {
 	 * level.
 	 */
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
+#endif
 
 	/**
 	 * @ctx_mem:
@@ -613,6 +614,7 @@ struct msm_gpu_state {
 	struct msm_gpu_state_bo *bos;
 };
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 static inline void gpu_write(struct msm_gpu *gpu, u32 reg, u32 data)
 {
 	trace_msm_gpu_regaccess(reg);
@@ -673,6 +675,7 @@ void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_context *ctx,
 			 struct drm_printer *p);
 
 int msm_submitqueue_init(struct drm_device *drm, struct msm_context *ctx);
+void msm_submitqueue_fini(struct msm_context *ctx);
 struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_context *ctx,
 		u32 id);
 int msm_submitqueue_create(struct drm_device *drm,
@@ -688,6 +691,44 @@ void msm_submitqueue_destroy(struct kref *kref);
 int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sysprof);
 void __msm_context_destroy(struct kref *kref);
 
+static inline void msm_submitqueue_put(struct msm_gpu_submitqueue *queue)
+{
+	if (queue)
+		kref_put(&queue->ref, msm_submitqueue_destroy);
+}
+
+int msm_context_set_sysprof(struct msm_context *ctx,
+				 struct msm_gpu *gpu, int sysprof);
+#else
+static inline void msm_gpu_show_fdinfo(struct msm_gpu *gpu,
+				       struct msm_context *ctx,
+				       struct drm_printer *p)
+{
+}
+
+static inline int msm_submitqueue_init(struct drm_device *drm, struct msm_context *ctx)
+{
+	return -ENXIO;
+}
+
+static inline void msm_submitqueue_fini(struct msm_context *ctx)
+{
+}
+
+static inline void msm_submitqueue_close(struct msm_context *ctx)
+{
+}
+
+static inline int msm_context_set_sysprof(struct msm_context *ctx,
+					       struct msm_gpu *gpu,
+					       int sysprof)
+{
+	return 0;
+}
+#endif
+
+void __msm_context_destroy(struct kref *kref);
+
 static inline void msm_context_put(struct msm_context *ctx)
 {
 	kref_put(&ctx->ref, __msm_context_destroy);
@@ -700,6 +741,7 @@ static inline struct msm_context *msm_context_get(
 	return ctx;
 }
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 void msm_devfreq_init(struct msm_gpu *gpu);
 void msm_devfreq_cleanup(struct msm_gpu *gpu);
 void msm_devfreq_resume(struct msm_gpu *gpu);
@@ -726,6 +768,7 @@ struct drm_gpuvm *
 msm_gpu_create_private_vm(struct msm_gpu *gpu, struct task_struct *task,
 			  bool kernel_managed);
 
+void msm_gpu_load(struct drm_device *dev);
 void msm_gpu_cleanup(struct msm_gpu *gpu);
 
 struct msm_gpu *adreno_load_gpu(struct drm_device *dev);
@@ -733,12 +776,6 @@ bool adreno_has_gpu(struct device_node *node);
 void __init adreno_register(void);
 void __exit adreno_unregister(void);
 
-static inline void msm_submitqueue_put(struct msm_gpu_submitqueue *queue)
-{
-	if (queue)
-		kref_put(&queue->ref, msm_submitqueue_destroy);
-}
-
 static inline struct msm_gpu_state *msm_gpu_crashstate_get(struct msm_gpu *gpu)
 {
 	struct msm_gpu_state *state = NULL;
@@ -776,5 +813,39 @@ void msm_gpu_fault_crashstate_capture(struct msm_gpu *gpu, struct msm_gpu_fault_
 #define check_apriv(gpu, flags) \
 	(((gpu)->hw_apriv ? MSM_BO_MAP_PRIV : 0) | (flags))
 
+#else /* ! CONFIG_DRM_MSM_ADRENO */
+static inline void __init adreno_register(void)
+{
+}
+
+static inline void __exit adreno_unregister(void)
+{
+}
+
+static inline void msm_gpu_load(struct drm_device *dev)
+{
+}
+#endif /* ! CONFIG_DRM_MSM_ADRENO */
+
+#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_DRM_MSM_ADRENO)
+void msm_gpu_debugfs_init(struct drm_minor *minor);
+void msm_gpu_debugfs_late_init(struct drm_device *dev);
+int msm_rd_debugfs_init(struct drm_minor *minor);
+void msm_rd_debugfs_cleanup(struct msm_drm_private *priv);
+__printf(3, 4)
+void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
+		const char *fmt, ...);
+int msm_perf_debugfs_init(struct drm_minor *minor);
+void msm_perf_debugfs_cleanup(struct msm_drm_private *priv);
+#else
+static inline void msm_gpu_debugfs_init(struct drm_minor *minor) {}
+static inline void msm_gpu_debugfs_late_init(struct drm_device *dev) {}
+__printf(3, 4)
+static inline void msm_rd_dump_submit(struct msm_rd_state *rd,
+			struct msm_gem_submit *submit,
+			const char *fmt, ...) {}
+static inline void msm_rd_debugfs_cleanup(struct msm_drm_private *priv) {}
+static inline void msm_perf_debugfs_cleanup(struct msm_drm_private *priv) {}
+#endif
 
 #endif /* __MSM_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index d53dfad16bde7d5ae7b1e48f221696d525a10965..aa8fe0ccd80b4942bc78195a40ff80aaac9459e2 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -49,10 +49,8 @@ int msm_context_set_sysprof(struct msm_context *ctx, struct msm_gpu *gpu, int sy
 	return 0;
 }
 
-void __msm_context_destroy(struct kref *kref)
+void msm_submitqueue_fini(struct msm_context *ctx)
 {
-	struct msm_context *ctx = container_of(kref,
-		struct msm_context, ref);
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(ctx->entities); i++) {
@@ -62,11 +60,6 @@ void __msm_context_destroy(struct kref *kref)
 		drm_sched_entity_destroy(ctx->entities[i]);
 		kfree(ctx->entities[i]);
 	}
-
-	drm_gpuvm_put(ctx->vm);
-	kfree(ctx->comm);
-	kfree(ctx->cmdline);
-	kfree(ctx);
 }
 
 void msm_submitqueue_destroy(struct kref *kref)
@@ -264,6 +257,9 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_context *ctx)
 	struct msm_drm_private *priv = drm->dev_private;
 	int default_prio, max_priority;
 
+	INIT_LIST_HEAD(&ctx->submitqueues);
+	rwlock_init(&ctx->queuelock);
+
 	if (!priv->gpu)
 		return -ENODEV;
 

-- 
2.47.3


