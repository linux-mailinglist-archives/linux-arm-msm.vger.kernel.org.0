Return-Path: <linux-arm-msm+bounces-56637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A71AA7F34
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 09:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 94D0717816D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:19:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF3A01B0F2C;
	Sat,  3 May 2025 07:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nrBqsGiF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50E01B040B
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 07:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256666; cv=none; b=NoHLIBPcZR5Mkbnr87WCjXWYSG/A1ynZLA+Fr1m17XF2h3sUJoZ1n28C9zNwChms2OOTkxzPIZ1CEbNJFbfDl1//CoEXlbC81j1VMKGwLnzX2B2/S4cYHbqJ2JUlkUR9ukAbyuTLoHSr5Bt6SlwQfUGPu9fmD9ZlG8LQ+ZCzueI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256666; c=relaxed/simple;
	bh=JLs/KKCCJ5cFFV4YZHdaRKFpe+QlwFO5L5IsxuDoYMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TKjMWxl6R09yXI6lo10Q/ZTzPg6AMeoIt1JU09c6QZ6KthRuZmT3s5b1wJsuLyfATpviMBtNvzNQiVdl85sGh02TiLlLdkK6YSw3nBMedlaNgpAl4zEPhtlu9lgWg6R9IZP63sGLNM0Jqycgm5mA9jUNJwq1z4yHuoWu+0SAkLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nrBqsGiF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5434dtA3003691
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 07:17:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSJKkDkoSWE8nhkAgT4eH2XDgxhrq4hNsHec/iGqYag=; b=nrBqsGiFNdzRKvJ6
	RKqbzU66SJAiqkBistUISM4ZklLV1IYs9kDTTIj3tZ/X5TA6/L9Ugffstny9gK0M
	aNFFY59M7lYZ0fUSvAgnXNeRPxIEY3saCvtykuPwCnsShxB6ILTeFk0vdqNFeUe7
	8LDHVWeQ65nEX8qgQjNMVXv8e3gUfi3WQ5Wq7fnsSZyhRzQiEprBER4vjL+4KtDR
	JW/H0ZPteRhL4W/5QVGOeqTqXrSsA6W3mABsS1UCeDyhPUEihz4Jt6jF/1ySb3+x
	XfUHJT6HRaimd5o7A8koXiAW8B1hR5qbsJB41e1j3dvtc/xTzkJ86D68cKER7mPb
	rDN9HA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakg5fq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 07:17:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-47ae87b5182so57710561cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 00:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746256654; x=1746861454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lSJKkDkoSWE8nhkAgT4eH2XDgxhrq4hNsHec/iGqYag=;
        b=OkjxbkMdxYHwIJDkeDwu7NP99NRUK04pbPnXI1EVHzNLfz9ghlWBWoO8B+hYkbt5/a
         U3o99EWAEDDt4RUosGDUPt/67JQ4n7pU+MoN15tUyX9/764mdJ0aQd2R010vvQSyEoXh
         IYIx6ZgNztlbEgeGrJ9ako83ttbD7uAQs1/B4ZO5i45jar6VA9BJ+0qAS8xZ5jQnPfv4
         wSX3eFQJLQR+tw52DX9GFnLJU4vj2fIh1wdqbPUZppknTijD/lm1IcZUKBbcHdJKIrVl
         V2ACsY737/hscMVLaEQOwxc0LRWZ2P/sdImDcf1CtRkIGALyKH18/nNuRVPBUk2sa5H8
         qBow==
X-Gm-Message-State: AOJu0YzEOy8fg2vUAFXCK+NQPqVgqsGPYs9bo5ryuSUsT4OhamcZiBCU
	NbPsDcA8Bc5SHVKJF2dOMSOsaWHnPzrUSgZpRNF699Rem9qRicpJ9MujGIdqaKeizEP7OCTi53Z
	HRphItVEVCj1JCsMja+MhCmrPgUnbxDeSa0ujqCf9NwUKm1EHKNVuKpyooUqfDegR
X-Gm-Gg: ASbGnct/uVEqkidNoWPPgjhlIVepjIQG6UbLltMH6V8AKyjVfqUApMKpMMejDAZ6oDa
	rBw8rwqGVMlXFbjFL7abpxxFzHIsBf5iv9BEei1cbdpbP5kzTqRR/rPTPRedw+DoxEn7IetuwQC
	L9wYzIUYB0jl+jJy032AJ/VnKljy/lNTuEXLkiNs6sRFw40q8cxt/oleqjiZSem5TH30sSrrhdn
	7BWgYvlMBAxnHnnp5PyfpmfOvqncaw4K2c+zZPwp5Xs27gUNS55XyyDBFLhYi6GPFvFYwDfgWqZ
	OUYm47qq0RS+LEVDbmzvXj+uCwwDYOjCLDCowN3invMB74Zg/LOo+g7eJduObZRMknq+EqdIiau
	HGcrXo5KA1Z3oH+EmDraH0aoh
X-Received: by 2002:a05:622a:48a:b0:48c:a62c:756b with SMTP id d75a77b69052e-48dffec0d5emr1316981cf.25.1746256653905;
        Sat, 03 May 2025 00:17:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLn6+yFYRF3qywhMHziWbwDigx46MW1YhSgbGnrfve/PE/e5AYsNCMtHmHg2jIwJui/E2g1g==
X-Received: by 2002:a05:622a:48a:b0:48c:a62c:756b with SMTP id d75a77b69052e-48dffec0d5emr1316791cf.25.1746256653473;
        Sat, 03 May 2025 00:17:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 00:17:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:10 +0300
Subject: [PATCH v2 11/11] drm/msm: make it possible to disable GPU support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-11-1292cba0f5ad@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=17562;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JLs/KKCCJ5cFFV4YZHdaRKFpe+QlwFO5L5IsxuDoYMA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLuxuPDXZzVzosLuL/vLNXb/1dtSylSV1sf5
 /a1U5joChuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7gAKCRCLPIo+Aiko
 1ehHCACCF8dITwCywmDwwOXMhLHC/QUy8u3zPeUxW+Hxd9ncwXyEfPiPYdIXDuYi5bUl4zPoFTu
 jTiJQVoP2lc35oHzs9Yapym22h1CDK0V67LfyXejg38VNF7p745fUse6N9EQ6ROBQcTt1V0BC0K
 cuKWXy8FxOafcRCjKOquOEi4GGhye8h5QIIEVEPFOq4YntUwR1/6tJLAjdfFWbT9IWR3/wIH0it
 WmZqdBEhPx+gIsn3796QIhNPpOzLbJ3XQPjrK1I1+AX+0JCGGGO0d1kelwxvwL9xpspRPre6odt
 5GRd7rrQJZk0yrMYBZQ71oeZeyIR8ew1CtX2f3BgaqlByzmH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MiBTYWx0ZWRfX1/jpW3d7/5o8
 rn8WUMIYyyQrQmG2zrMffsdcGHT4Lq72dhbUzuuF/fvvutQQpvTaVlW+kwN0EeECmegc9sEmxmn
 KAatrLSRTM/kLZBwg3P194iZNylpbQfmOltmJhDnmZXpzfP8OEPLA6xRxv8VwBIWBahydVAf9R8
 Xso0C1NeAN37cJSq2iyaxvIY9eBWgEDoHLIoPp+AjAloKM3HTaVqZoiJspTE+wlOjHepW6eyAAs
 lf1w4q997myd+yRp1/ZQBzZHtzt7wgWP80C2XAwskxSqao8PeeMe2TYCZ1gEO0C6bdIarsyUpjc
 A81CkHx7saVO+ismz7ptK9aGeTH09TqDizVDPaP6/EReT1xbiMNK5oGT7XOmsJWy2ic8wpZkOw9
 AFHapseKzqXIZroxhpe/50CLisEeVprRBOlDFEYeGLSctO5inwAuNP/5k3y/wSR02W2zJ0T0
X-Proofpoint-ORIG-GUID: 3_FfVLeIOFZV3BLhGep-lqlmJw3CJhhr
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=6815c318 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=XsBGUjEGan8I8CB0Vl8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 3_FfVLeIOFZV3BLhGep-lqlmJw3CJhhr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030062

Some of the platforms don't have onboard GPU or don't provide support
for the GPU in the drm/msm driver. Make it possible to disable the GPU
part of the driver and build the KMS-only part.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig           |  20 +++--
 drivers/gpu/drm/msm/Makefile          |  14 ++--
 drivers/gpu/drm/msm/msm_debugfs.c     | 135 ++++++++++++++++++----------------
 drivers/gpu/drm/msm/msm_drv.c         |  37 ++++++++--
 drivers/gpu/drm/msm/msm_drv.h         |   3 +
 drivers/gpu/drm/msm/msm_gpu.h         |  71 +++++++++++++++---
 drivers/gpu/drm/msm/msm_submitqueue.c |  12 +--
 7 files changed, 191 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index f6360931ae55a2923264f0e6cc33c6af0d50c706..5605d2bc93a8ad9cb33afcb8ca9da44c68250620 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -15,29 +15,37 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_EXEC
-	select DRM_SCHED
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
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
+	select SYNC_FILE
+	help
+	  Enable support for the GPU present on most of Qualcomm Snapdragon
+	  SoCs. If you are unsure, say Y.
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
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 7c4508f0e5c84914633f8f2d5ddd04bd10e4d189..6a24f78d7fc51cc1c9cd706d746cabd5f567d282 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -109,21 +109,23 @@ msm-display-$(CONFIG_DRM_MSM_KMS) += \
 msm-y += \
 	msm_debugfs.o \
 	msm_drv.o \
-	msm_fence.o \
 	msm_gem.o \
 	msm_gem_prime.o \
 	msm_gem_shrinker.o \
-	msm_gem_submit.o \
 	msm_gem_vma.o \
-	msm_gpu.o \
-	msm_gpu_devfreq.o \
 	msm_io_utils.o \
 	msm_iommu.o \
+	msm_gpu_tracepoints.o \
+
+msm-$(CONFIG_DRM_MSM_ADRENO) += \
+	msm_fence.o \
+	msm_gem_submit.o \
+	msm_gpu.o \
+	msm_gpu_devfreq.o \
 	msm_perf.o \
 	msm_rd.o \
 	msm_ringbuffer.o \
 	msm_submitqueue.o \
-	msm_gpu_tracepoints.o \
 
 msm-$(CONFIG_DRM_MSM_KMS) += \
 	msm_atomic.o \
@@ -159,7 +161,7 @@ msm-display-$(CONFIG_DRM_MSM_DSI_14NM_PHY) += dsi/phy/dsi_phy_14nm.o
 msm-display-$(CONFIG_DRM_MSM_DSI_10NM_PHY) += dsi/phy/dsi_phy_10nm.o
 msm-display-$(CONFIG_DRM_MSM_DSI_7NM_PHY) += dsi/phy/dsi_phy_7nm.o
 
-msm-y += $(adreno-y)
+msm-$(CONFIG_DRM_MSM_ADRENO) += $(adreno-y)
 msm-$(CONFIG_DRM_MSM_KMS) += $(msm-display-y)
 
 obj-$(CONFIG_DRM_MSM)	+= msm.o
diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index 6e60a74b13d72c47e45cb9dc65ed67b977e900fa..fa9a94a86d060e28d4ee93fda1f22924fd5af606 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -20,6 +20,7 @@
 #include "msm_debugfs.h"
 #include "disp/msm_disp_snapshot.h"
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 /*
  * GPU Snapshot:
  */
@@ -117,6 +118,76 @@ static const struct file_operations msm_gpu_fops = {
 	.release = msm_gpu_release,
 };
 
+static void msm_debugfs_gpu_init(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct dentry *gpu_devfreq;
+
+	debugfs_create_file("gpu", 0400, minor->debugfs_root,
+			    dev, &msm_gpu_fops);
+
+	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
+			   &priv->hangcheck_period);
+
+	debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
+			    &priv->disable_err_irq);
+
+	gpu_devfreq = debugfs_create_dir("devfreq", minor->debugfs_root);
+
+	debugfs_create_bool("idle_clamp", 0600, gpu_devfreq,
+			    &priv->gpu_clamp_to_idle);
+
+	debugfs_create_u32("upthreshold", 0600, gpu_devfreq,
+			   &priv->gpu_devfreq_config.upthreshold);
+
+	debugfs_create_u32("downdifferential", 0600, gpu_devfreq,
+			   &priv->gpu_devfreq_config.downdifferential);
+}
+
+static int late_init_minor(struct drm_minor *minor)
+{
+	struct drm_device *dev = minor->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	int ret;
+
+	if (!minor)
+		return 0;
+
+	if (!priv->gpu_pdev)
+		return 0;
+
+	ret = msm_rd_debugfs_init(minor);
+	if (ret) {
+		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");
+		return ret;
+	}
+
+	ret = msm_perf_debugfs_init(minor);
+	if (ret) {
+		DRM_DEV_ERROR(minor->dev->dev, "could not install perf debugfs\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+int msm_debugfs_late_init(struct drm_device *dev)
+{
+	int ret;
+
+	ret = late_init_minor(dev->primary);
+	if (ret)
+		return ret;
+	ret = late_init_minor(dev->render);
+	return ret;
+}
+#else /* ! CONFIG_DRM_MSM_ADRENO */
+static void msm_debugfs_gpu_init(struct drm_minor *minor)
+{
+}
+#endif /* CONFIG_DRM_MSM_ADRENO */
+
 #ifdef CONFIG_DRM_MSM_KMS
 static int msm_fb_show(struct seq_file *m, void *arg)
 {
@@ -294,70 +365,6 @@ static struct drm_info_list msm_debugfs_list[] = {
 		{ "mm", msm_mm_show },
 };
 
-static int late_init_minor(struct drm_minor *minor)
-{
-	struct drm_device *dev = minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	int ret;
-
-	if (!minor)
-		return 0;
-
-	if (!priv->gpu_pdev)
-		return 0;
-
-	ret = msm_rd_debugfs_init(minor);
-	if (ret) {
-		DRM_DEV_ERROR(minor->dev->dev, "could not install rd debugfs\n");
-		return ret;
-	}
-
-	ret = msm_perf_debugfs_init(minor);
-	if (ret) {
-		DRM_DEV_ERROR(minor->dev->dev, "could not install perf debugfs\n");
-		return ret;
-	}
-
-	return 0;
-}
-
-int msm_debugfs_late_init(struct drm_device *dev)
-{
-	int ret;
-	ret = late_init_minor(dev->primary);
-	if (ret)
-		return ret;
-	ret = late_init_minor(dev->render);
-	return ret;
-}
-
-static void msm_debugfs_gpu_init(struct drm_minor *minor)
-{
-	struct drm_device *dev = minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct dentry *gpu_devfreq;
-
-	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
-		dev, &msm_gpu_fops);
-
-	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
-		&priv->hangcheck_period);
-
-	debugfs_create_bool("disable_err_irq", 0600, minor->debugfs_root,
-		&priv->disable_err_irq);
-
-	gpu_devfreq = debugfs_create_dir("devfreq", minor->debugfs_root);
-
-	debugfs_create_bool("idle_clamp",0600, gpu_devfreq,
-			    &priv->gpu_clamp_to_idle);
-
-	debugfs_create_u32("upthreshold",0600, gpu_devfreq,
-			   &priv->gpu_devfreq_config.upthreshold);
-
-	debugfs_create_u32("downdifferential",0600, gpu_devfreq,
-			   &priv->gpu_devfreq_config.downdifferential);
-}
-
 void msm_debugfs_init(struct drm_minor *minor)
 {
 	struct drm_device *dev = minor->dev;
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index eec7501eb05b6c31ffd9dc5a7ba430e3284ea5ed..f12549ebfc83fe35de12b48c30a3da3f7035dc96 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -59,7 +59,11 @@ static bool modeset = true;
 MODULE_PARM_DESC(modeset, "Use kernel modesetting [KMS] (1=on (default), 0=disable)");
 module_param(modeset, bool, 0600);
 
+#ifndef CONFIG_DRM_MSM_ADRENO
+static bool separate_gpu_drm = true;
+#else
 static bool separate_gpu_drm;
+#endif
 MODULE_PARM_DESC(separate_gpu_drm, "Use separate DRM device for the GPU (0=single DRM device for both GPU and display (default), 1=two DRM devices)");
 module_param(separate_gpu_drm, bool, 0400);
 
@@ -320,6 +324,22 @@ static void load_gpu(struct drm_device *dev)
 	mutex_unlock(&init_lock);
 }
 
+void __msm_file_private_destroy(struct kref *kref)
+{
+	struct msm_file_private *ctx = container_of(kref,
+		struct msm_file_private, ref);
+
+	msm_submitqueue_fini(ctx);
+	msm_gem_address_space_put(ctx->aspace);
+
+#ifdef CONFIG_DRM_MSM_ADRENO
+	kfree(ctx->comm);
+	kfree(ctx->cmdline);
+#endif
+
+	kfree(ctx);
+}
+
 static int context_init(struct drm_device *dev, struct drm_file *file)
 {
 	static atomic_t ident = ATOMIC_INIT(0);
@@ -330,9 +350,6 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
 	if (!ctx)
 		return -ENOMEM;
 
-	INIT_LIST_HEAD(&ctx->submitqueues);
-	rwlock_init(&ctx->queuelock);
-
 	kref_init(&ctx->ref);
 	msm_submitqueue_init(dev, ctx);
 
@@ -717,6 +734,7 @@ static int msm_ioctl_gem_info(struct drm_device *dev, void *data,
 	return ret;
 }
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 static int wait_fence(struct msm_gpu_submitqueue *queue, uint32_t fence_id,
 		      ktime_t timeout, uint32_t flags)
 {
@@ -787,6 +805,7 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
 
 	return ret;
 }
+#endif
 
 static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
 		struct drm_file *file)
@@ -820,6 +839,7 @@ static int msm_ioctl_gem_madvise(struct drm_device *dev, void *data,
 }
 
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 static int msm_ioctl_submitqueue_new(struct drm_device *dev, void *data,
 		struct drm_file *file)
 {
@@ -845,6 +865,7 @@ static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
 
 	return msm_submitqueue_remove(file->driver_priv, id);
 }
+#endif
 
 static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
@@ -853,12 +874,14 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_GEM_INFO,     msm_ioctl_gem_info,     DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_PREP, msm_ioctl_gem_cpu_prep, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_GEM_CPU_FINI, msm_ioctl_gem_cpu_fini, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_RENDER_ALLOW),
+#ifdef CONFIG_DRM_MSM_ADRENO
 	DRM_IOCTL_DEF_DRV(MSM_GEM_SUBMIT,   msm_ioctl_gem_submit,   DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_WAIT_FENCE,   msm_ioctl_wait_fence,   DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(MSM_GEM_MADVISE,  msm_ioctl_gem_madvise,  DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
+#endif
 };
 
 static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
@@ -866,10 +889,8 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
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
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 1ff799f0c78133e73c6857e3692c2dca2c5e60fa..ba4012ea2f6845061380ae2daa8eb3a0999f2e9e 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -424,6 +424,9 @@ static inline void msm_mdss_unregister(void) {}
 
 #ifdef CONFIG_DEBUG_FS
 void msm_framebuffer_describe(struct drm_framebuffer *fb, struct seq_file *m);
+#endif
+
+#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_DRM_MSM_ADRENO)
 int msm_debugfs_late_init(struct drm_device *dev);
 int msm_rd_debugfs_init(struct drm_minor *minor);
 void msm_rd_debugfs_cleanup(struct msm_drm_private *priv);
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index e25009150579c08f7b98d4461a75757d1093734a..6db6ef6b02db2450be68cc27e65be9aced6da7ce 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -358,12 +358,13 @@ struct msm_gpu_perfcntr {
  * @seqno:        unique per process seqno
  */
 struct msm_file_private {
-	rwlock_t queuelock;
-	struct list_head submitqueues;
-	int queueid;
 	struct msm_gem_address_space *aspace;
 	struct kref ref;
 	int seqno;
+#ifdef CONFIG_DRM_MSM_ADRENO
+	rwlock_t queuelock;
+	struct list_head submitqueues;
+	int queueid;
 
 	/**
 	 * sysprof:
@@ -425,6 +426,7 @@ struct msm_file_private {
 	 * level.
 	 */
 	struct drm_sched_entity *entities[NR_SCHED_PRIORITIES * MSM_GPU_MAX_RINGS];
+#endif
 
 	/**
 	 * ctx_mem:
@@ -559,6 +561,7 @@ struct msm_gpu_state {
 	struct msm_gpu_state_bo *bos;
 };
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 static inline void gpu_write(struct msm_gpu *gpu, u32 reg, u32 data)
 {
 	writel(data, gpu->mmio + (reg << 2));
@@ -612,6 +615,7 @@ void msm_gpu_show_fdinfo(struct msm_gpu *gpu, struct msm_file_private *ctx,
 			 struct drm_printer *p);
 
 int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
+void msm_submitqueue_fini(struct msm_file_private *ctx);
 struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
 		u32 id);
 int msm_submitqueue_create(struct drm_device *drm,
@@ -624,8 +628,42 @@ void msm_submitqueue_close(struct msm_file_private *ctx);
 
 void msm_submitqueue_destroy(struct kref *kref);
 
+static inline void msm_submitqueue_put(struct msm_gpu_submitqueue *queue)
+{
+	if (queue)
+		kref_put(&queue->ref, msm_submitqueue_destroy);
+}
+
 int msm_file_private_set_sysprof(struct msm_file_private *ctx,
 				 struct msm_gpu *gpu, int sysprof);
+#else
+static inline void msm_gpu_show_fdinfo(struct msm_gpu *gpu,
+				       struct msm_file_private *ctx,
+				       struct drm_printer *p)
+{
+}
+
+static inline int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
+{
+	return -ENXIO;
+}
+
+static inline void msm_submitqueue_fini(struct msm_file_private *ctx)
+{
+}
+
+static inline void msm_submitqueue_close(struct msm_file_private *ctx)
+{
+}
+
+static inline int msm_file_private_set_sysprof(struct msm_file_private *ctx,
+					       struct msm_gpu *gpu,
+					       int sysprof)
+{
+	return 0;
+}
+#endif
+
 void __msm_file_private_destroy(struct kref *kref);
 
 static inline void msm_file_private_put(struct msm_file_private *ctx)
@@ -640,6 +678,7 @@ static inline struct msm_file_private *msm_file_private_get(
 	return ctx;
 }
 
+#ifdef CONFIG_DRM_MSM_ADRENO
 void msm_devfreq_init(struct msm_gpu *gpu);
 void msm_devfreq_cleanup(struct msm_gpu *gpu);
 void msm_devfreq_resume(struct msm_gpu *gpu);
@@ -671,12 +710,6 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev);
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
@@ -712,5 +745,25 @@ static inline void msm_gpu_crashstate_put(struct msm_gpu *gpu)
 #define check_apriv(gpu, flags) \
 	(((gpu)->hw_apriv ? MSM_BO_MAP_PRIV : 0) | (flags))
 
+#else /* ! CONFIG_DRM_MSM_ADRENO */
+static inline struct msm_gem_address_space *
+msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *task)
+{
+	return NULL;
+}
+
+static inline struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
+{
+	return NULL;
+}
+
+static inline void __init adreno_register(void)
+{
+}
+
+static inline void __exit adreno_unregister(void)
+{
+}
+#endif /* ! CONFIG_DRM_MSM_ADRENO */
 
 #endif /* __MSM_GPU_H__ */
diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index 7fed1de63b5d9e20df88db8d9ca6ea45ec1a2846..dfb6f42a963ee3d314f11716d8649f3bf82a3eb6 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -46,10 +46,8 @@ int msm_file_private_set_sysprof(struct msm_file_private *ctx,
 	return 0;
 }
 
-void __msm_file_private_destroy(struct kref *kref)
+void msm_submitqueue_fini(struct msm_file_private *ctx)
 {
-	struct msm_file_private *ctx = container_of(kref,
-		struct msm_file_private, ref);
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(ctx->entities); i++) {
@@ -59,11 +57,6 @@ void __msm_file_private_destroy(struct kref *kref)
 		drm_sched_entity_destroy(ctx->entities[i]);
 		kfree(ctx->entities[i]);
 	}
-
-	msm_gem_address_space_put(ctx->aspace);
-	kfree(ctx->comm);
-	kfree(ctx->cmdline);
-	kfree(ctx);
 }
 
 void msm_submitqueue_destroy(struct kref *kref)
@@ -226,6 +219,9 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
 	struct msm_drm_private *priv = drm->dev_private;
 	int default_prio, max_priority;
 
+	INIT_LIST_HEAD(&ctx->submitqueues);
+	rwlock_init(&ctx->queuelock);
+
 	if (!priv->gpu)
 		return -ENODEV;
 

-- 
2.39.5


