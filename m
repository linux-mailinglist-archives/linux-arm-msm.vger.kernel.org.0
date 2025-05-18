Return-Path: <linux-arm-msm+bounces-58325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60744ABAF92
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 12:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52DB117A248
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 10:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939B321ADA3;
	Sun, 18 May 2025 10:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q70Rr1RB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E7721ADC9
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565741; cv=none; b=OmQ2i423d7UGdWzY+QSWUdaH1Ckt29aQG866HGy00OgKDZhTRfpDWiRg/7zKNTfSXFFS5N17oQIWFprr4QGC/aKrSY/P40m+f5WvptNVPAcUSXZmM4ycIQU9HWgot5NfJr5/wb6LV8BGpavFjTXhnczyh37R09L9uhvivC1U63s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565741; c=relaxed/simple;
	bh=/CfZ3JVdieLRawFuuuWtMdMn25crFvhgWl3NQ/L97lI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qNrNd2NgX5xfX5twxwQI+kLmhOLx9z3kHCVLAmv1big0s9SRsfuyK9WtzVqMWM48xW/Ui6uAUgj/K2SjgrGZcQpngMisdCrVf2IcrWnGwJmW/bl2q2qyjfKQFE+rJCKlG9b4an29Bi1gi7U/3rUc3AAQQFqoakXZxRNVsaahWq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q70Rr1RB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6U5xr002841
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Eic/j3udXgGjDEe50aB6TDhnyHwei1FJfflAUaczOYo=; b=Q70Rr1RBQa65ev2R
	cRiWVvDHtOl2T1t3EJ6AV30Rd2Spxsq1gzQsEDucaf/6pkrPdD9vWMuT68qrIfN8
	wfvkpq1aTrk6nkh3Ri2HdHq780OI4K3aY1dDwD6Fhe1hrIracaELUp3nHrC5X2NG
	TUeqFJfdGyKPT748BNxuE5JG+CZhGFaERXXpikcLqG8rr90Lzbxt2lrxRLZ2Lc8f
	iPjE9lpAgVRJylq+f8F3qnpnEV1Vg4ZAROnD/fCHKutiAxMK4eyyzdhPx8vrcvhn
	wpxLGHdmoc1k50PC3ZyjtV2mwfWbXkrPga6MbXWoDNVORo68Q4O6rpPJqiHRTsqh
	pas8NA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmesv28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8b14d49a4so28464876d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 03:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565737; x=1748170537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eic/j3udXgGjDEe50aB6TDhnyHwei1FJfflAUaczOYo=;
        b=CHXRmhZI5MSdwfsUx5IgxLn9sdHuFh7uFkFckV1My7FRImD131YN8DiyrZi6yrfzXl
         gx+XdByku3S60R/Cz3+rxKfg9kg48MOqo2qFKMzjp0xfsGvxmO9h+mVXqtc3rA57n6Ni
         M5h2CAnlr3/aDyBw3PvGLNvO2ckA6oqZfL4uLqrU6YuFnT0verwZw1zaYleSAy+xDvvo
         H7nWA5CRdIAfi6Er5ElE6zv2ayOO3qZhFUBacE7b+0dDSkydx4C6KpmRrkokqaxSzbDl
         v6FHTBv0BpaYpxZmObVhkSI9oHS4cBowa606g1DOnxoRj6viU4apA6nZzY4bGTtP02ZY
         hbPQ==
X-Gm-Message-State: AOJu0YzmJKvjv7APOfm4MMiQXIEUdcKHJZ5vzEtGCeR22iTsrs4hn5WN
	BDZJhHO9tdcCWCk6exrPt3JEGs3VLwg51Z+rhHPy7b1xOavXoaY6nIjMidBCEiJFBS3s1WkwAbN
	gR2GGfsOqjHfR/XzG+I4A9d1GIGkgmy4SA6BkFjVGqhS/tN9yM+Mw3HCL6FCjqKjnjzwU
X-Gm-Gg: ASbGnct77e6W6Jft4gMCUn3RRY06bS3M+Pwvh0/L+Hw+3vuuwR/na+f3oltr2UJCyj9
	ZAiCnEuXWFuxOZOeHoWKYMNgWZi94tS4EqpI3xFBL2ENK2w21JCeawFmacUa2ZW1mX65md0oILf
	NQPRMjMpb9NKl4stMfTakYs+Xdlp8n4YtQQSZ1RnOX1wmc/xt5nUZxGhVjYMBqaAWN5/QjLPbeP
	heh2fjuP88Q76SvcFUwoshW67lLvllwlgQ0/cz5f4TN5qlAGC+fBKzt9ifH2EmtQTxrMWMNnbFp
	9rXCx+s8aeWpVitEsYEaHeJMKNn1r8FKkD2BOxCS6InOobui8KfTrqYoLXnnjRgfijLB3MFVRHj
	RAO15C8oVPRKfQp94XjraYvJw
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id 6a1803df08f44-6f8bfbf5e85mr94272706d6.5.1747565736610;
        Sun, 18 May 2025 03:55:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY7+ORjwD4vUwzc9XCroeHBWmPc13T0Kc0uPLyjlzWGrGPHsjGFlHJUtNmn6HQETsO2Fntiw==
X-Received: by 2002:a0c:fc50:0:b0:6f8:bfbf:5d49 with SMTP id 6a1803df08f44-6f8bfbf5e85mr94272536d6.5.1747565736083;
        Sun, 18 May 2025 03:55:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:55:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:24 +0300
Subject: [PATCH v3 06/11] drm/msm: make it possible to disable KMS-related
 code.
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-6-0e91e8e77023@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=13609;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/CfZ3JVdieLRawFuuuWtMdMn25crFvhgWl3NQ/L97lI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyavhiFLC946rCZkGhVU+aGkzuuBlMB1jk4D
 JdThGi9UPSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mgAKCRCLPIo+Aiko
 1ecvB/4qTLgcq6PTOajxXULjg0lBSGg1KV8luXrkM6yml3JVOmFTs/rJcoat6MWsxkdKQjlyxaa
 5LpDKoGQseXkgplGC67W4mSZWEVkizrmp36AqHP/B3sFsBKE7Bra1WImEpOB4j5yZ17UmbVAgUl
 s1oEZFaDZSDQ28c/X7bRF+CYABa4bbj4xrrHyd28QHY1tvLD3m6WI0Lq1gETRDllJOj+ao6n/UN
 DFco2ibkJs4O2W0eN9QHt8ZUercSBcA4FK75Tkf04VFN6BWM+Ta4pAKMIGw+P4PkMElfXOkKTC7
 iniUV5RVe/cggUOa4sv0gd3420/TLEDZ0C/bEdT3Xbi8uEaf
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=6829bcaa cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=HLjn-ILLvqAx_VdQRNoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: kIhkZ_TxSh7efFIsaSLmkaOURD8jDZWc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX8JNgrRdWN09/
 e3XreuaqZI0AIDtKKLVXvpsXc+fsxwOcF/kBgVf2XEIU+tXy/F01aGHQr+chw0i3JGSXF7kwpGV
 oyWcahdxKyNRWSAhxyEXcRcVws9oeC1Kcf21T+9A6i2wKwiXgeubIVclkjwYn3U3BuzGEJNVneV
 ogJyzR7flLyVWvBfOF+NkI50p7n5AsCSMFEEeS+zUw+QNKa29ihEedVCUFlibEke74Lm0h3tg+j
 SlMykGWN19Wh7HyRwFrXGAFVuFbunyIyekmn9BrB6Hgp34QX9KruhrSOaYJr1FIHLAPfY2EZIns
 a0EK+igft/6LokMwbQySR6lZ8zTlBkf1Vd0fr08SYFaxfW7Rw6Xztxaf9NcqBkMOpywVE74ahuh
 u5lAhuN7YlTZi3poIeqz/joeJFvKmchyMNPqPkDr1GI8TzWX7yvsFJ1rQyDobFVXS8gh1VgB
X-Proofpoint-GUID: kIhkZ_TxSh7efFIsaSLmkaOURD8jDZWc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104

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
index 7f127e2ae44292f8f5c7ff6a9251c3d7ec8c9f58..cada5832db3e894c9bae4c6b0c6d935dbf5d933f 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -66,6 +66,14 @@ config DRM_MSM_VALIDATE_XML
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
@@ -74,6 +82,7 @@ config DRM_MSM_MDSS
 config DRM_MSM_MDP4
 	bool "Enable MDP4 support in MSM DRM driver"
 	depends on DRM_MSM
+	select DRM_MSM_KMS
 	default y
 	help
 	  Compile in support for the Mobile Display Processor v4 (MDP4) in
@@ -84,6 +93,7 @@ config DRM_MSM_MDP5
 	bool "Enable MDP5 support in MSM DRM driver"
 	depends on DRM_MSM
 	select DRM_MSM_MDSS
+	select DRM_MSM_KMS
 	default y
 	help
 	  Compile in support for the Mobile Display Processor v5 (MDP5) in
@@ -94,6 +104,7 @@ config DRM_MSM_DPU
 	bool "Enable DPU support in MSM DRM driver"
 	depends on DRM_MSM
 	select DRM_MSM_MDSS
+	select DRM_MSM_KMS
 	select DRM_DISPLAY_DSC_HELPER
 	default y
 	help
@@ -104,6 +115,7 @@ config DRM_MSM_DPU
 config DRM_MSM_DP
 	bool "Enable DisplayPort support in MSM DRM driver"
 	depends on DRM_MSM
+	depends on DRM_MSM_KMS
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
 	default y
@@ -115,6 +127,7 @@ config DRM_MSM_DP
 config DRM_MSM_DSI
 	bool "Enable DSI support in MSM DRM driver"
 	depends on DRM_MSM
+	depends on DRM_MSM_KMS
 	select DRM_PANEL
 	select DRM_MIPI_DSI
 	select DRM_DISPLAY_DSC_HELPER
@@ -170,6 +183,7 @@ config DRM_MSM_DSI_7NM_PHY
 config DRM_MSM_HDMI
 	bool "Enable HDMI support in MSM DRM driver"
 	depends on DRM_MSM
+	depends on DRM_MSM_KMS
 	default y
 	select DRM_DISPLAY_HDMI_HELPER
 	select DRM_DISPLAY_HDMI_STATE_HELPER
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7a2ada6e2d74a902879e4f12a78ed475e5209ec2..7c4508f0e5c84914633f8f2d5ddd04bd10e4d189 100644
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
@@ -122,21 +119,24 @@ msm-y += \
 	msm_gpu_devfreq.o \
 	msm_io_utils.o \
 	msm_iommu.o \
-	msm_kms.o \
 	msm_perf.o \
 	msm_rd.o \
 	msm_ringbuffer.o \
 	msm_submitqueue.o \
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
 	dp/dp_catalog.o \
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
index 0714936d883523e5c53bfb42f932234db76c58db..08ea11d452f2ea93fba8bdcc487385433e81d224 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -709,7 +709,7 @@ void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event)
 	fevent->event = event;
 	fevent->crtc = crtc;
 	fevent->ts = ktime_get();
-	kthread_queue_work(priv->event_thread[crtc_id].worker, &fevent->work);
+	kthread_queue_work(priv->kms->event_thread[crtc_id].worker, &fevent->work);
 }
 
 /**
@@ -878,7 +878,7 @@ static void dpu_crtc_atomic_flush(struct drm_crtc *crtc,
 	dev = crtc->dev;
 	priv = dev->dev_private;
 
-	if (crtc->index >= ARRAY_SIZE(priv->event_thread)) {
+	if (crtc->index >= ARRAY_SIZE(priv->kms->event_thread)) {
 		DPU_ERROR("invalid crtc index[%d]\n", crtc->index);
 		return;
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
index 22fd946ee201397b72b43c8499714139deb7ba82..7835d93015b31a69aac824ca04dc65b374546e5c 100644
--- a/drivers/gpu/drm/msm/dp/dp_debug.c
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -5,6 +5,8 @@
 
 #define pr_fmt(fmt)"[drm-dp] %s: " fmt, __func__
 
+#ifdef CONFIG_DEBUG_FS
+
 #include <linux/debugfs.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_file.h>
@@ -235,3 +237,5 @@ int msm_dp_debug_init(struct device *dev, struct msm_dp_panel *panel,
 
 	return 0;
 }
+
+#endif
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 7ab607252d183f78b99c3a8b878c949ed5f99fec..2b12f2851fadbc3c924827e11570352736869614 100644
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
@@ -238,40 +289,11 @@ static int msm_mm_show(struct seq_file *m, void *arg)
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
@@ -343,20 +365,12 @@ void msm_debugfs_init(struct drm_minor *minor)
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
index 5ec129bf6a9c83ec8e3d5b667411dd0917a76582..f6b4c5e1dc3a18516e0e40703b24d3ae37b7c35d 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -72,12 +72,6 @@ enum msm_dsi_controller {
 
 #define MSM_GPU_MAX_RINGS 4
 
-/* Commit/Event thread specific structure */
-struct msm_drm_thread {
-	struct drm_device *dev;
-	struct kthread_worker *worker;
-};
-
 struct msm_drm_private {
 
 	struct drm_device *dev;
@@ -167,8 +161,6 @@ struct msm_drm_private {
 		struct mutex lock;
 	} lru;
 
-	struct msm_drm_thread event_thread[MAX_CRTCS];
-
 	/* VRAM carveout, used when no IOMMU: */
 	struct {
 		unsigned long size;
@@ -261,7 +253,7 @@ struct drm_framebuffer *msm_framebuffer_create(struct drm_device *dev,
 struct drm_framebuffer * msm_alloc_stolen_fb(struct drm_device *dev,
 		int w, int h, int p, uint32_t format);
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#ifdef CONFIG_DRM_MSM_KMS_FBDEV
 int msm_fbdev_driver_fbdev_probe(struct drm_fb_helper *helper,
 				 struct drm_fb_helper_surface_size *sizes);
 #define MSM_FBDEV_DRIVER_OPS \
diff --git a/drivers/gpu/drm/msm/msm_kms.c b/drivers/gpu/drm/msm/msm_kms.c
index 9dfe0fb4755ddd11277f524234297ccd5ea96001..ea133e50d0bfd2b2b60e5ceb37dfaf72f43a2828 100644
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
index 14762b39edca381c817fa509d0d1da6f535e5da7..c15868bd380937d64455f9bf2d2571c7492396b4 100644
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


