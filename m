Return-Path: <linux-arm-msm+bounces-63804-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3090AF9FA0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 12:03:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 353204A38CE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 10:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8445228DEEE;
	Sat,  5 Jul 2025 10:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FrCJY771"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACE728C85A
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 10:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751709767; cv=none; b=gTkcs/C3diBQ9H+0J1DDoEVUhnNuKuHBleLuh4TIgsR0kri8VK973ICj2hFVVU+8XgpkhRAR1otBV1c2XTsrXcJA55u2pki1cIkK9NWmhzlPqpR5RXo9BsxAvUsn1LYjOEH8jE+YuD6Rn/90N+PFzePg1qNwUTV/ruZs9oX2s+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751709767; c=relaxed/simple;
	bh=0D6kJT+yXHsszE54CWySsslIGo0PaQaM3dWnrIckd7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZlR6y2GGaFewBAU5iWvFI36ziyI/h1ET9z2SPH/+zGna+bxg/jOsdhH2dZnneJOObL+2zXMc74WHY/enU0Kb5Z5X+M912rJiEpOh/z7YObB7Y83wI5X/xVzG1CmKqgTMVQXYbU8LwjR3kYY6MTm2K5sU1TIgb9Wn0Iadl0pVDS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FrCJY771; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5656EVxU028380
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 10:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUgWQS//G5f5QquYkCwqI5pTNxw8irblkzEPLEXGj/A=; b=FrCJY771h9hRVhy2
	2yeJGMNm/rsLOTPSamUu9XClZvjmnBN/xJXR//ue1XxxcewpKeDDfrWtwv65W+QG
	HACcWqNcuW1TxuUvzm7r3qIKSwUdrYDd1ZOj2XmVcrcerVYgT1MHbcrRhc/eKXx7
	MqZdV1HNJYb+Uo/hNONDVWVa6wtsCy7UkrVDtnsC6yI3oupi1UPRsffzCVR7PmG2
	AlsrY2bgleEs4Cqmh/9J1wSY63Y32qXHaP+TeYKITIRzewRoK4+BClm1Vxw39Y08
	uPxNTG42uEEhf8Yqk5Fzqkko5iSUuszrwhFBIHkvBt0XBcx64onzIqgXGBLCnNTZ
	f9sKVw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdq8s1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 10:02:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d44ff55c98so303908485a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 03:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751709763; x=1752314563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUgWQS//G5f5QquYkCwqI5pTNxw8irblkzEPLEXGj/A=;
        b=gbF3unWFv1WE7bpAqEK4ygu4kzXuNAHkY4S0KXU2rjCVDizeM3U2BhprAwDQhdfy4n
         SVo69nMg2TtJMqCwqHkV77E3k+HrJFAFpG2kzsc/3mhLWtpzZEmgMlMoL1XUYan/vi8p
         HEadu4691rxCi6udf7s+/W7LMhwlpvZB+heyfPURwLf4epyGq3211H0m4R22HbELgZhv
         cY9Gif2HgRTry0dkowBJK53LYMD3q0qyS8xvzGo3Yq5Q/vIfjLLZ8Yl3UvDWeui7qdqL
         HytaR6xQnQrTB9ebYYKND6MycrniONzadcN8eWKQs0+pDsafoQ9nNnXSTdcF0HhaR34P
         /jVA==
X-Gm-Message-State: AOJu0YwLxz4FrczkygBhoNN05uS9b4csdV/uwcecO5+sLIUXHsFTOIJf
	c15WVngLxgkzDYBjf+2YxNcqUMSqpipfXWxP3pCImunj6sC12GcqYdxtpGwcFI1DdiA7+WuKKoV
	T8QRH1X0VGu/bXegdREnY0+TO5SMFX3+SRnKBWfosnxgdxkb44yGrdPMMJxOX8hzFUKBM
X-Gm-Gg: ASbGncsF8adlSFplDuI15zTKlj0HzTQoB6ofC63ycYCXdVQATz+bBWJ0IpQCdzC2jYK
	oZILqIYE/rufEKhtMnOn/9TW/6JiJOuhidi+iYCbZOTVuGl9ur5FBSfz+9yjsfOstj0jYU17M1g
	yaOMPU9GZN7FbR7Q1T9fqLAw4zQATGVBfQM1pjlWeHI5qovj0hKnWycotoNAeQ/8SMPIVZLJz3G
	4Ifjw2rQK7vB6milZH49k86+/oYtoOWhVp1s0hTKKT20CIRIsE8mWk6saIbNVxgVZGXrNZ1TnUH
	7KdabB0MnHoUhWISazO/Kpc/v+FYR8MoDh2X/Qb7wQjAGU4xVrp4kvoSfieTAco/dDTQk0rFWHF
	VvgwmwpjDAtdecBZbY3z1PXQUwwY6rm6IOGE=
X-Received: by 2002:a05:620a:690d:b0:7d3:96ba:8561 with SMTP id af79cd13be357-7d5df0cd0b0mr673040885a.8.1751709763059;
        Sat, 05 Jul 2025 03:02:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOhrc5RwdFsBTih3OXP9bNNl7G4Yo9g67Tf5+f5eKLQmnNxCobBF9EFsjp0T66230u3YlvQQ==
X-Received: by 2002:a05:620a:690d:b0:7d3:96ba:8561 with SMTP id af79cd13be357-7d5df0cd0b0mr673035585a.8.1751709762523;
        Sat, 05 Jul 2025 03:02:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 03:02:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:31 +0300
Subject: [PATCH v4 06/10] drm/msm: make it possible to disable KMS-related
 code.
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-6-fb470c481131@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13609;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0D6kJT+yXHsszE54CWySsslIGo0PaQaM3dWnrIckd7E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPgzCiMBmk93zRbp6Cqwr0/V1GLLjDjN9kM95
 TL8xeton5aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4MwAKCRCLPIo+Aiko
 1elHCACoTwJc6/PuC5UTtm8YmVoxkeRSvtIRBjkz/BHZGLxvMhqZdBdfe0/zgw0pi0qHUXvfsYl
 UXiuX5WDw7RcIML+/6WLaIBHjBgNkR892vpmGNPDe4IqidkVNALma2mDMx6sy8sgtMq/xvmTAhr
 gIs8l5nkZKxaTmF32M1u28iWtJ42ChtKvEwBYyqOmfEfYV0NT2YENvNf40psr9zbGMjCBlQ7nLO
 KwY9kcJMCjca99MJCGn1v0qcQKmuQETCc0ZoWbrX8GdRMtN5poUVVN0pCielYFGHaPFyAUcOk/W
 0+uucdCR5BnoILApGMNiHNdm6kLztjm0srrWHOIKn5iqkMI5
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=6868f844 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=HLjn-ILLvqAx_VdQRNoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 025PCtZtW1XWIBsSN0SnYn6mbtpzNhWL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfX574i08mMwb9U
 5FaVOoron1txJJum2wqhoBF6tOXzVZiB2Riz0e8jwdBmZVaC3Bp2+yicTa3QZRgSMl08AqvEE1L
 l1r4EbKye5jzGknrM47r4e+kGtXV+7cC5zK25FJAFwN3pO+JsSEn1mDJyS5OAXHZC6jpaCaXkn6
 Mwqt+0uHpE9afu+gUWneNjm6yZZ+PW1iDKV/Sf8qu/XBqmktX7v13sh2z+lAocvx9I66hkK3c0i
 WdKoKZ3mWrWrrXQk1OXfNx15aHaZtqM2IPVIHcoQfp0E6qc2sYtgUvHnIaXac9jeZbOqOE6aqu5
 aFFAcC/uQBRqj3sB+J7uouqVBDlrXKfmYN/u8heBOUe2OUILIjwl0RkWWjGF9dbzZGZwKmpird1
 rp5pAkgd4nj9cMGTmW5pxEXcKc13P7tEtj7ac2G90bsD08IY122/E3Anwk+3MUgnTanPx3wt
X-Proofpoint-GUID: 025PCtZtW1XWIBsSN0SnYn6mbtpzNhWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064

If the Adreno device is used in a headless mode, there is no need to
build all KMS components. Build corresponding parts conditionally, only
selecting them if modeset support is actually required.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig              | 14 +++++
 drivers/gpu/drm/msm/Makefile             | 19 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  4 +-
 drivers/gpu/drm/msm/dp/dp_debug.c        |  4 ++
 drivers/gpu/drm/msm/msm_debugfs.c        | 92 ++++++++++++++++++--------------
 drivers/gpu/drm/msm/msm_drv.h            | 10 +---
 drivers/gpu/drm/msm/msm_kms.c            |  6 +--
 drivers/gpu/drm/msm/msm_kms.h            | 30 +++++++++++
 8 files changed, 117 insertions(+), 62 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 8fb99f64a61548eae8ac74cf6cc99ffd2f3c7204..3a0a69f41153c5f32670e07f9728d9b9e947be92 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -68,6 +68,14 @@ config DRM_MSM_VALIDATE_XML
 	  Validate XML files with register definitions against rules-fd schema.
 	  This option is mostly targeting DRM MSM developers. If unsure, say N.
 
+config DRM_MSM_KMS
+	def_bool n
+	depends on DRM_MSM
+
+config DRM_MSM_KMS_FBDEV
+	def_bool DRM_FBDEV_EMULATION
+	depends on DRM_MSM_KMS
+
 config DRM_MSM_MDSS
 	bool
 	depends on DRM_MSM
@@ -76,6 +84,7 @@ config DRM_MSM_MDSS
 config DRM_MSM_MDP4
 	bool "Enable MDP4 support in MSM DRM driver"
 	depends on DRM_MSM
+	select DRM_MSM_KMS
 	default y
 	help
 	  Compile in support for the Mobile Display Processor v4 (MDP4) in
@@ -86,6 +95,7 @@ config DRM_MSM_MDP5
 	bool "Enable MDP5 support in MSM DRM driver"
 	depends on DRM_MSM
 	select DRM_MSM_MDSS
+	select DRM_MSM_KMS
 	default y
 	help
 	  Compile in support for the Mobile Display Processor v5 (MDP5) in
@@ -96,6 +106,7 @@ config DRM_MSM_DPU
 	bool "Enable DPU support in MSM DRM driver"
 	depends on DRM_MSM
 	select DRM_MSM_MDSS
+	select DRM_MSM_KMS
 	select DRM_DISPLAY_DSC_HELPER
 	default y
 	help
@@ -106,6 +117,7 @@ config DRM_MSM_DPU
 config DRM_MSM_DP
 	bool "Enable DisplayPort support in MSM DRM driver"
 	depends on DRM_MSM
+	depends on DRM_MSM_KMS
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
 	default y
@@ -117,6 +129,7 @@ config DRM_MSM_DP
 config DRM_MSM_DSI
 	bool "Enable DSI support in MSM DRM driver"
 	depends on DRM_MSM
+	depends on DRM_MSM_KMS
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select DRM_DISPLAY_DSC_HELPER
@@ -172,6 +185,7 @@ config DRM_MSM_DSI_7NM_PHY
 config DRM_MSM_HDMI
 	bool "Enable HDMI support in MSM DRM driver"
 	depends on DRM_MSM
+	depends on DRM_MSM_KMS
 	default y
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 514bacd5e4998a60da3fa9cb751220e96af0c2c9..0c0dfb25f01b193b10946fae20138caf32cf0ed2 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -100,18 +100,15 @@ msm-display-$(CONFIG_DRM_MSM_DPU) += \
 msm-display-$(CONFIG_DRM_MSM_MDSS) += \
 	msm_mdss.o \
 
-msm-display-y += \
+msm-display-$(CONFIG_DRM_MSM_KMS) += \
 	disp/mdp_format.o \
 	disp/mdp_kms.o \
 	disp/msm_disp_snapshot.o \
 	disp/msm_disp_snapshot_util.o \
 
 msm-y += \
-	msm_atomic.o \
-	msm_atomic_tracepoints.o \
 	msm_debugfs.o \
 	msm_drv.o \
-	msm_fb.o \
 	msm_fence.o \
 	msm_gem.o \
 	msm_gem_prime.o \
@@ -122,7 +119,6 @@ msm-y += \
 	msm_gpu_devfreq.o \
 	msm_io_utils.o \
 	msm_iommu.o \
-	msm_kms.o \
 	msm_perf.o \
 	msm_rd.o \
 	msm_ringbuffer.o \
@@ -130,13 +126,17 @@ msm-y += \
 	msm_syncobj.o \
 	msm_gpu_tracepoints.o \
 
-msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
+msm-$(CONFIG_DRM_MSM_KMS) += \
+	msm_atomic.o \
+	msm_atomic_tracepoints.o \
+	msm_fb.o \
+	msm_kms.o \
 
-msm-display-$(CONFIG_DEBUG_FS) += \
-	dp/dp_debug.o
+msm-$(CONFIG_DRM_MSM_KMS_FBDEV) += msm_fbdev.o
 
 msm-display-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
 	dp/dp_ctrl.o \
+	dp/dp_debug.o \
 	dp/dp_display.o \
 	dp/dp_drm.o \
 	dp/dp_link.o \
@@ -159,7 +159,8 @@ msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
 msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
 msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
 
-msm-y += $(adreno-y) $(msm-display-y)
+msm-y += $(adreno-y)
+msm-$(CONFIG_DRM_MSM_KMS) += $(msm-display-y)
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 782aa86208d54cc28c5ad51215ef458483ff3dfb..d4b545448d74657aafc96e9042c7756654b4f0e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -742,7 +742,7 @@ void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event)
 	fevent->event = event;
 	fevent->crtc = crtc;
 	fevent->ts = ktime_get();
-	kthread_queue_work(priv->event_thread[crtc_id].worker, &fevent->work);
+	kthread_queue_work(priv->kms->event_thread[crtc_id].worker, &fevent->work);
 }
 
 /**
@@ -911,7 +911,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
 	dev = crtc->dev;
 	priv = dev->dev_private;
 
-	if (crtc->index >= ARRAY_SIZE(priv->event_thread)) {
+	if (crtc->index >= ARRAY_SIZE(priv->kms->event_thread)) {
 		DPU_ERROR("invalid crtc index[%d]\n", crtc->index);
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index b65b358e98381488ecd0ecb8648dbe76dd6ff310..cf3838fcd154e67b6bd8f6321a8711419543abcb 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -5,6 +5,8 @@
 
 #define pr_fmt(fmt)"[drm-dp] %s: " fmt, __func__
 
+#ifdef CONFIG_DEBUG_FS
+
 #include <linux/debugfs.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_file.h>
@@ -234,3 +236,5 @@ int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 
 	return 0;
 }
+
+#endif
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 6af72162cda4c8d4bc8dd4c6473cbc29817bb3c6..4680ccf3e72fa5c31afda5665defe71d1f238dac 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -117,6 +117,36 @@ static const struct file_operations msm_gpu_fops = {
 	.release = msm_gpu_release,
 };
 
+#ifdef CONFIG_DRM_MSM_KMS
+static int msm_fb_show(struct seq_file *m, void *arg)
+{
+	struct drm_info_node *node = m->private;
+	struct drm_device *dev = node->minor->dev;
+	struct drm_framebuffer *fb, *fbdev_fb = NULL;
+
+	if (dev->fb_helper && dev->fb_helper->fb) {
+		seq_puts(m, "fbcon ");
+		fbdev_fb = dev->fb_helper->fb;
+		msm_framebuffer_describe(fbdev_fb, m);
+	}
+
+	mutex_lock(&dev->mode_config.fb_lock);
+	list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
+		if (fb == fbdev_fb)
+			continue;
+
+		seq_puts(m, "user ");
+		msm_framebuffer_describe(fb, m);
+	}
+	mutex_unlock(&dev->mode_config.fb_lock);
+
+	return 0;
+}
+
+static struct drm_info_list msm_kms_debugfs_list[] = {
+		{ "fb", msm_fb_show },
+};
+
 /*
  * Display Snapshot:
  */
@@ -180,6 +210,27 @@ static const struct file_operations msm_kms_fops = {
 	.release = msm_kms_release,
 };
 
+static void msm_debugfs_kms_init(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+
+	drm_debugfs_create_files(msm_kms_debugfs_list,
+				 ARRAY_SIZE(msm_kms_debugfs_list),
+				 minor->debugfs_root, minor);
+	debugfs_create_file("kms", 0400, minor->debugfs_root,
+			    dev, &msm_kms_fops);
+
+	if (priv->kms->funcs->debugfs_init)
+		priv->kms->funcs->debugfs_init(priv->kms, minor);
+
+}
+#else /* ! CONFIG_DRM_MSM_KMS */
+static void msm_debugfs_kms_init(struct drm_minor *minor)
+{
+}
+#endif
+
 /*
  * Other debugfs:
  */
@@ -267,40 +318,11 @@ static int msm_mm_show(struct seq_file *m, void *arg)
 	return 0;
 }
 
-static int msm_fb_show(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct drm_framebuffer *fb, *fbdev_fb = NULL;
-
-	if (dev->fb_helper && dev->fb_helper->fb) {
-		seq_printf(m, "fbcon ");
-		fbdev_fb = dev->fb_helper->fb;
-		msm_framebuffer_describe(fbdev_fb, m);
-	}
-
-	mutex_lock(&dev->mode_config.fb_lock);
-	list_for_each_entry(fb, &dev->mode_config.fb_list, head) {
-		if (fb == fbdev_fb)
-			continue;
-
-		seq_printf(m, "user ");
-		msm_framebuffer_describe(fb, m);
-	}
-	mutex_unlock(&dev->mode_config.fb_lock);
-
-	return 0;
-}
-
 static struct drm_info_list msm_debugfs_list[] = {
 		{"gem", msm_gem_show},
 		{ "mm", msm_mm_show },
 };
 
-static struct drm_info_list msm_kms_debugfs_list[] = {
-		{ "fb", msm_fb_show },
-};
-
 static int late_init_minor(struct drm_minor *minor)
 {
 	int ret;
@@ -375,20 +397,12 @@ void msm_debugfs_init(struct drm_minor *minor)
 	if (priv->gpu_pdev)
 		msm_debugfs_gpu_init(minor);
 
-	if (priv->kms) {
-		drm_debugfs_create_files(msm_kms_debugfs_list,
-					 ARRAY_SIZE(msm_kms_debugfs_list),
-					 minor->debugfs_root, minor);
-		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
-				    dev, &msm_kms_fops);
-	}
+	if (priv->kms)
+		msm_debugfs_kms_init(minor);
 
 	debugfs_create_file("shrink", S_IRWXU, minor->debugfs_root,
 		dev, &shrink_fops);
 
-	if (priv->kms && priv->kms->funcs->debugfs_init)
-		priv->kms->funcs->debugfs_init(priv->kms, minor);
-
 	fault_create_debugfs_attr("fail_gem_alloc", minor->debugfs_root,
 				  &fail_gem_alloc);
 	fault_create_debugfs_attr("fail_gem_iova", minor->debugfs_root,
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e7872b752c6c8e5869927634184733796afa1967..5b276a4540753aa25d46e50f0957790ed39474ae 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -70,12 +70,6 @@ enum msm_dsi_controller {
 
 #define MSM_GPU_MAX_RINGS 4
 
-/* Commit/Event thread specific structure */
-struct msm_drm_thread {
-	struct drm_device *dev;
-	struct kthread_worker *worker;
-};
-
 struct msm_drm_private {
 
 	struct drm_device *dev;
@@ -165,8 +159,6 @@ struct msm_drm_private {
 		struct mutex lock;
 	} lru;
 
-	struct msm_drm_thread event_thread[MAX_CRTCS];
-
 	struct notifier_block vmap_notifier;
 	struct shrinker *shrinker;
 
@@ -272,7 +264,7 @@ struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 struct drm_framebuffer * msm_alloc_stolen_fb(struct drm_device *dev,
 		int w, int h, int p, uint32_t format);
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#ifdef CONFIG_DRM_MSM_KMS_FBDEV
 int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 				 struct drm_fb_helper_surface_size *sizes);
 #define MSM_FBDEV_DRIVER_OPS \
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index a63d014c19039835de47fb3fb610ce67652b5d2c..6889f1c1e72121dcc735fa460ea04cdab11c6705 100644
--- a/drivers/gpu/drm/msm/msm_kms.c
+++ b/drivers/gpu/drm/msm/msm_kms.c
@@ -246,8 +246,8 @@ void msm_drm_kms_uninit(struct device *dev)
 
 	/* clean up event worker threads */
 	for (i = 0; i < MAX_CRTCS; i++) {
-		if (priv->event_thread[i].worker)
-			kthread_destroy_worker(priv->event_thread[i].worker);
+		if (kms->event_thread[i].worker)
+			kthread_destroy_worker(kms->event_thread[i].worker);
 	}
 
 	drm_kms_helper_poll_fini(ddev);
@@ -300,7 +300,7 @@ int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
 		struct msm_drm_thread *ev_thread;
 
 		/* initialize event thread */
-		ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
+		ev_thread = &kms->event_thread[drm_crtc_index(crtc)];
 		ev_thread->dev = ddev;
 		ev_thread->worker = kthread_run_worker(0, "crtc_event:%d", crtc->base.id);
 		if (IS_ERR(ev_thread->worker)) {
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index f4eb486531890f3351cf83670be801e8fd3631bb..8a7be7b854deea9b763ec45df275fab77d806e44 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -13,6 +13,8 @@
 
 #include "msm_drv.h"
 
+#ifdef CONFIG_DRM_MSM_KMS
+
 #define MAX_PLANE	4
 
 /* As there are different display controller blocks depending on the
@@ -127,6 +129,12 @@ struct msm_pending_timer {
 	unsigned crtc_idx;
 };
 
+/* Commit/Event thread specific structure */
+struct msm_drm_thread {
+	struct drm_device *dev;
+	struct kthread_worker *worker;
+};
+
 struct msm_kms {
 	const struct msm_kms_funcs *funcs;
 	struct drm_device *dev;
@@ -161,6 +169,7 @@ struct msm_kms {
 	struct msm_pending_timer pending_timers[MAX_CRTCS];
 
 	struct workqueue_struct *wq;
+	struct msm_drm_thread event_thread[MAX_CRTCS];
 };
 
 static inline int msm_kms_init(struct msm_kms *kms,
@@ -210,4 +219,25 @@ void msm_drm_kms_post_init(struct device *dev);
 void msm_drm_kms_unregister(struct device *dev);
 void msm_drm_kms_uninit(struct device *dev);
 
+#else /* ! CONFIG_DRM_MSM_KMS */
+
+static inline int msm_drm_kms_init(struct device *dev, const struct drm_driver *drv)
+{
+	return -ENODEV;
+}
+
+static inline void msm_drm_kms_post_init(struct device *dev)
+{
+}
+
+static inline void msm_drm_kms_unregister(struct device *dev)
+{
+}
+
+static inline void msm_drm_kms_uninit(struct device *dev)
+{
+}
+
+#endif
+
 #endif /* __MSM_KMS_H__ */

-- 
2.39.5


