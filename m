Return-Path: <linux-arm-msm+bounces-63806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F6BAF9FA5
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 12:04:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71B7D4A489B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 10:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F56D291C30;
	Sat,  5 Jul 2025 10:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kfUaie67"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8A828FFE6
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 10:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751709771; cv=none; b=XzFaMeMSwDDpGgaPbFvxp5DkFcoAOTmH3LNOaZWDePhniliI9ugGQSgbOblLswjsirBNMAPoaWy+a96Xm3JlvfAOf7nUrEYUoAb3WwTrWahX9J3gUkD6eWeNVckLvkOZXZ/wtGQGZkz0Uz2JrX5b7S2mlSM8oVpgs/nhgbdE1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751709771; c=relaxed/simple;
	bh=KwQ9Fk/ez5j7BPU4OcwnfOs/f38mi3dlimt1zg0gBh0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g3vwDsis8MywilIpYHXbfKAHwH8zpYcWF047AMt6kxeA7Hr/Gws20FSNjsG0WiHJVsVn7YmuEQ8W5DeIKRUzOALWkM4TA1p/ilPuqDs91bz2S3prWhHAFMT0iObcmcv8BU6N5B0fC7OdOw9FLEyHHIuQ7liovseSseP1NKi3F5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kfUaie67; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5656D560026012
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 10:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v85XOlp6G22KyP3grDgfXY+/B0h4nwRKeUy1AK2CaOU=; b=kfUaie67mbW6FXvm
	DsoBw8fWFNd6fZYixJMvkxp/MxVN5JElfEAJvS35MQQdvUAuw2g1GhOHW8oVe6AS
	5uK7ZRe5xxcmpjRsAPOmODWCgW5SFEg6jPeRKRP45auxC37c5Dq5dCY7VOoT88K0
	IrC1J3guHUjOEbo+qWsa+sIkDf/D9gSO+DaX5dR603UlHTQHCkh37E93SiCRj52U
	GdloITm3NDw01YgW7v3yUKC1ssAToTKHGeW6n5xsf7zCvkRUQ8xubmulF/a9SVqz
	J8zXW5agY502KlQitDQBsNv/thY58JOKCk1uKBqrlwsVJBSmIzNPmOBUexEoxM32
	54Jcmg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdq8s27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 10:02:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d444d21b24so248056685a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 03:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751709767; x=1752314567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v85XOlp6G22KyP3grDgfXY+/B0h4nwRKeUy1AK2CaOU=;
        b=CGGW5CyWDmxt/PmKonSK7S6erLKhGOgXCCzoet/tlE0rvrt0D582yHUgi+r1M0Yhgl
         zDlNRenZjv7Dwc64mWoCtm7aQJCadUsTMUZzlyrbBCmWIZOm1uY+elGw39owXd4V94sq
         PEZXL0MAsPAfjqFH5DtxfRvDoeAmTuJAvFcoFF3kGf+0O/zy/AFWqBzHlluRcD5d92+Z
         F/PcBFr2DnLgHhXaDmNo5haVe9dhfV/I9vVLnpNdwEGWxhoQcZUHYIVsuA4ErTUwUGph
         iqOw3aO+Zdp2jHUpfVZaOG6pfzvjwGFcAsfDoqXclFaqD3dqv++2NR0ZsLa6fSAZJz/5
         241g==
X-Gm-Message-State: AOJu0YwQ8LxGdUkjAQUUOAbpqoC0RDeIRLZGsqkRtxMsSPQOWWYJh+Bm
	bXxqYpqD0YrpABP0vVeSXRHJmr0c/LbzR6d8JgldZQdXjV+jGJMcia+GbBs4DKADkl0+SvxgZkD
	3tNGx45EZu7al0xfD8d2LXxadTgpQbzT4cfgLJYoNdAaxrZLrbGXao9gOt9wEqvVuCAXo
X-Gm-Gg: ASbGnctQM3uxZjagXbu9TA8f1GYtyhPTUCIQO4oPGK7c31E4EJv8Sy4Fkh4LDFLdDJE
	ufn0adlleR5d1rZpqmHjrtt+JqGexjNThBpGP8KGpsiUovTc+4R88daBqYjulECan4UaGJb6pO/
	jaWsPB1XPHCet7Uw/N2fpkS/Ad76Ky9gwWIVlzvOK7jCJpVrD5kXTrA5jDYABcF/pGyUrI9c0OR
	42V1/MTQzZyqjsd+topKmtyOxREccU7T3KJunzAHtRypzP8q8+uF1PHoK71MlcougogM51BAntO
	bX/N+BpAJ2zWPRYExapPf1AU4iiScff9HfHOA3NYs73nYOkBql0U1wZGRbrGfS53BUdWoyWKvtE
	TaEu10nTAUfVHwGhENqK6pqqkvLCNOR1qxZs=
X-Received: by 2002:a05:620a:31a4:b0:7d4:2889:b456 with SMTP id af79cd13be357-7d5f15f64d5mr239815485a.45.1751709766750;
        Sat, 05 Jul 2025 03:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyEbozZlrjhSQ3iied2i5GKQxbxxyAlBZWrqrOQXmdyuUtu57UO4K9M3gldjqkE0QGpWdjVQ==
X-Received: by 2002:a05:620a:31a4:b0:7d4:2889:b456 with SMTP id af79cd13be357-7d5f15f64d5mr239810985a.45.1751709766131;
        Sat, 05 Jul 2025 03:02:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 03:02:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:33 +0300
Subject: [PATCH v4 08/10] drm/msm: rearrange symbol selection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-8-fb470c481131@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KwQ9Fk/ez5j7BPU4OcwnfOs/f38mi3dlimt1zg0gBh0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPg0j7zdBjOLSrDl22Ex55JC6SmmlXYlMrJxq
 wMMvG/m3jqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4NAAKCRCLPIo+Aiko
 1e/aCACaV/t6Vw5KZ+eAanxu1951sFjQ4+RjZFkCY0/4NcQ31GHSeszc4BiUEILCbCK8syLF+D7
 RcMWhY+E+UXJrnABI3EP4bCejopES7I+ibcjedaSINikVJ71q2Y3/vTgTqIPWZgl0hdtG4vVRHa
 adZCY0oTJ3BvDPBGJ92eWVYwdz11qZoWLIQHo6SMwX8ShfWLl/RATYVz2gS10xVEHCKB9TrmNhT
 XvW4ccCY9QLdCKQMaMEh91MNQHiqdG0sMF5VtMVJzUbQxyvzZanP0ylOmkqC5cd8A/w+S95eyV1
 YWeRvqYd+7QezzXiPtsd2+cC/bIwpjy/nDq/rMuBglBgGLlY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=6868f848 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Dibrpul-hQ8xFFu5PoYA:9
 a=7cPi-V01pGkjOeJz:21 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: DDn8srvMkC9YeHGMdt-OaGa1VgLyMatY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfXzF7vqt2YKYO3
 04+G2EjgCjNm8Q6HSwJhwXd113e60oEpFvavmqhGnqDKTAxgx5t6D3BrpHPmrFniNIeYQ2HS6/c
 VIA+DThAEjCz004l9GYeHMxp391kgVGcFABato9VLekG94uSfrMBOpCGJpp+l8a+n+lNXRBUAnz
 ER3WqOSKQ3Lnv4uJzge/mLp1+7/3K7fIFI6fK6NqR+MQEE4/hPj1YkH3whnbG47rtKP15ElDGHN
 djBw6TQa3Hf2FLQczJC++Wpj+00kc+ItMlnWR5+I2bhLMTQMkzUJSxSnEMALD1gRQYxD/aTmhAr
 eOJDHx8VbdnGeBb+orJvHIY9EhBHjj8bjiNJfMupPA1mZ+TApqudsfXGNn9DpHuJw5pJ5gp9xRM
 bml3qxGzrvMO0N7Aq+cXvqj0hlrdsUjJbekIsVAYZTuBKCw5j3vO4pgLxpSNY4HbxeONcFui
X-Proofpoint-GUID: DDn8srvMkC9YeHGMdt-OaGa1VgLyMatY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064

Move symbol selection to be more fine grained: select DP helpers only if
DP driver is also enabled, move KMS and display helpers to the newly
introduced DRM_MSM_KMS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 3a0a69f41153c5f32670e07f9728d9b9e947be92..250246f81ea94f01a016e8938f08e1aa4ce02442 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -15,19 +15,9 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_CLIENT_SELECTION
-	select DRM_DISPLAY_DP_AUX_BUS
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
 	select DRM_GPUVM
-	select DRM_KMS_HELPER
-	select DRM_PANEL
-	select DRM_BRIDGE
-	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
-	select FB_SYSMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
@@ -71,10 +61,18 @@ config DRM_MSM_VALIDATE_XML
 config DRM_MSM_KMS
 	def_bool n
 	depends on DRM_MSM
+	select DRM_BRIDGE
+	select DRM_BRIDGE_CONNECTOR
+	select DRM_CLIENT_SELECTION
+	select DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
+	select DRM_PANEL
+	select DRM_PANEL_BRIDGE
 
 config DRM_MSM_KMS_FBDEV
 	def_bool DRM_FBDEV_EMULATION
 	depends on DRM_MSM_KMS
+	select FB_SYSMEM_HELPERS
 
 config DRM_MSM_MDSS
 	bool
@@ -120,6 +118,8 @@ config DRM_MSM_DP
 	depends on DRM_MSM_KMS
 	select DRM_DISPLAY_HDMI_AUDIO_HELPER
 	select RATIONAL
+	select DRM_DISPLAY_DP_AUX_BUS
+	select DRM_DISPLAY_DP_HELPER
 	default y
 	help
 	  Compile in support for DP driver in MSM DRM driver. DP external

-- 
2.39.5


