Return-Path: <linux-arm-msm+bounces-58327-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2C2ABAF95
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 12:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03FCD1882FB1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 10:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F8221C173;
	Sun, 18 May 2025 10:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GwIE9sUb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7E021B18A
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565744; cv=none; b=ZoR8lqygQwZRVmEi8MEL8scNfetX7c+tbtGykbvxREZcBJlv65N0R9MLFca3JBn7dIxnHHACjklOdyHIgKtmHSgiR2skkuN5tzy92LZRdPnZDhjSE7JmjRhCUb77ZbUUc3GNmta3dAKO24eIh4QDkrB+NeMB7SOBdiM3AKEJQl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565744; c=relaxed/simple;
	bh=1CGQPf555qFJU/R7NQ3znd/IF9NZR/aTxcJ4mydnTq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tqz7/l+rMNxgv6876fOQEDGBA8yTglCED6OW95QKVRo5/hv2wducTRrJc9tLDRAfSLZaJDr/5j7bH7tBHZi4eKcnY5D9+msuaJhF8LQGKeQyqPiNydZ4WyY3g5nTt6ea1pQA7KhV0/iS+zIigzmdSeX73y83fZ3mQSFTYpWBO+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GwIE9sUb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I9UfLN003289
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PidCDaupyEMEwIHIG1xvK2j20VbRhsyPW2bIrlAsTDc=; b=GwIE9sUbD6PCS+UP
	WvZNYcKd+uxUaPQsBsvy9qSGyyUjx4jdlF2UFfO0y5hT3jaUmHSFJWLmanF8rJ85
	6fDw+wG1z3aObMkR6k93rF/t/swJcGcdZnPCm20gEuX76ho9ajGThVRWHOvNR7rY
	e2aPmRikdXGzdwIzHK+gTnSGcey14VcmrWc3hNWZink/98c+fcEGf0qrp7b15zog
	Rygz4NxZSajiD+bgZfJ7XwlnYDhfHqUra63TanTUU1u9pc/HEla/uPLyyNGheJ/f
	nf1JrbfRUfPmaLdOOzMlEKJbtkEjH6qBxZUXO2hULhy/GkHGE+Y20d8OgeEsSzkT
	GA4u1Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnyhvrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 10:55:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f6e5d2f612so81229656d6.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 May 2025 03:55:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565741; x=1748170541;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PidCDaupyEMEwIHIG1xvK2j20VbRhsyPW2bIrlAsTDc=;
        b=BRvYWbvYDxkoNcuKRDU5k4631XuTFR885mkx/gOtjzWUXn8rEsETp4p+MO9E2of4Ct
         EKP04G5mAWXaOXiVPSKTDg/cGZpBzIpjJkyyJJjdZyuRieSnFikBJjBFbo3pFbz/2j7o
         gQ4XofaB6HGmD3gSq3NFm/GfR+A1ZVArXkWecYispaeXn8F81dQn3YfS19cgDFeE5CDN
         PwUEZdzUnLezNUvgvWCzlYms8A4Y+wQQ0yJ9XXQ0rIagzhTDqPEZqNz1obWwCA7sBbE7
         CgPHvLo4qhcEf4OM2WLEOpDVZG52/tMUGqZ6IP0jTQw6089xVRCOWuL0o6vtAZIUfpO8
         wZog==
X-Gm-Message-State: AOJu0YyVsHAkIpIuF4xVbwRknjZQ+43h6QeiWjAkQQ2EX2KVWEHv5yf9
	fIOgFotnOZN2Z68zx/g4aOG0IM6tYEGmwXNMQifm9hz5mw4y9nr5yj7+t1W4fMO//aDeuAlBLz2
	o1DWqZ2+F2uv9uSjE0loHvJL+G2zpuJ+nKmKt/dOvksIQZpTQDDvYA9oqlEUvX3boDSm3
X-Gm-Gg: ASbGncsnCX5391y9Xm8bafQmHgbfZnqKMVQ43SKU8tJ0ci2eC1kxbeq5lkIKKjgO/WH
	WnbbMdoPvtpXmHygkS1yeAlxA5mjy/AF9afEZXeZULubR8oikkv/S6iXFmES8m+wIlyAr941lYG
	vVvgptDgnFf8aWbBa4PFH4fLxDIcIKVeb5ZxJzcgmbdLQcYKUakZLbYyiSzzvVy30Cc/GXqKdoT
	vvLLF2pAzBYKE/WFR10JxsDJi62BIzxKO/LeCofxI7Ph5WY6aKX4OrXJB5RnXsXc229Ge19iRbE
	C7doA+TwLd2NXOG8axsFA/AFxNIxbW4aeBmOW17Pw/RdDJITepxNseKgQGjj43hjKAhftDJAHrD
	B4ktBLixHld1lp28TIRDValyg
X-Received: by 2002:ad4:5941:0:b0:6f5:f6e:832a with SMTP id 6a1803df08f44-6f8b0870f8dmr165088026d6.19.1747565741034;
        Sun, 18 May 2025 03:55:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXPRsgkQ5tj9rTK0IrAjGcywRW1fhh0muvVsDDNPPD2vIhT22UIKWmH4LZ5iw0W13ESp3Geg==
X-Received: by 2002:ad4:5941:0:b0:6f5:f6e:832a with SMTP id 6a1803df08f44-6f8b0870f8dmr165087866d6.19.1747565740747;
        Sun, 18 May 2025 03:55:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085cf8ccsm14314451fa.99.2025.05.18.03.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:55:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 13:55:26 +0300
Subject: [PATCH v3 08/11] drm/msm: rearrange symbol selection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-msm-gpu-split-v3-8-0e91e8e77023@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1CGQPf555qFJU/R7NQ3znd/IF9NZR/aTxcJ4mydnTq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKbyay+Pq88fpo0dRqmFzoV26PlTC9TQnpNLYR
 5PDNYGJeNCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCm8mgAKCRCLPIo+Aiko
 1c58CACfs88NPVsFXzwZNkPLlFX15tdciASdOlLfSQwLHX1zdi9ZhkvLBdU+c7rG27ZPuO9lECA
 WT6uVv5MwGc5jWMOzItU+Irm3L1GXyUuq/XQnE9LV8StycXsG4rbeAlo8K1vJeIHXUOW/XQ7LGs
 +oQr0E6l4R+YERDUKKVjG4s0Q2lDg0syUEyFtFy2Bn+EB/w9KbGRde5v4byWRQRMWtwCwNuZ+dv
 Ahg8Wp9DDrpAkKOnd6yiNp+REb8OAVr8PJOx4bD4cIEIIyqg4FoGhfq9S8J0j/zCfHqkLoZKSqQ
 mFKlUDz3sQLIphcnyldS5gEUvOcQ9eSaKVidN1XfYcOwig5I
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfX7OdrDIWtucED
 st4LyALxeIYrKhEHGG06hHHQizrzdAj/vg1W5zr14UZLmxlpqMxEPJ2FsE0p6x7zMA403HOkqQB
 yzscd02V72psEgnPkt4bzfaI9ZMjn50iSW1+Geg0T45dqghPF819M3Et+ldcYPlEwgl/Do8VMPp
 vyZ9L5x3zPU1QAu6NO0GQ39G5MhLqetUjtNb1aC48ac6y/c6BMXUTEaxj/SvqnMgmOmtO60ljJL
 B6DuZkAD1e+oEQLvQq8o5FwOYTBJdcdZt+xboOCbEtUJz7tsGUkprOIFfaXgSvYK7Kri4MVVV9j
 37dYYA8QAtHAzFdyZmg0SMfIF7wDQd0qfjwrpQ4ynUesD0dZYmVsZRy7w7qhAegHoNAjEsY4Ug6
 usKeDJbcvBVZ/jOLsnK27v43oWH1qirBgHGf+KkUmlMo8mLDraPLCwXuAE2FuHfNGswsoY+Y
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=6829bcad cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Dibrpul-hQ8xFFu5PoYA:9
 a=0W9TD_AsGAYKDBPL:21 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: mm4PwfoK0N9BmZnVSmCvIIhzykUzBpBT
X-Proofpoint-ORIG-GUID: mm4PwfoK0N9BmZnVSmCvIIhzykUzBpBT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104

Move symbol selection to be more fine grained: select DP helpers only if
DP driver is also enabled, move KMS and display helpers to the newly
introduced DRM_MSM_KMS.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Kconfig | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index cada5832db3e894c9bae4c6b0c6d935dbf5d933f..f6360931ae55a2923264f0e6cc33c6af0d50c706 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -15,18 +15,8 @@ config DRM_MSM
 	select IOMMU_IO_PGTABLE
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
-	select DRM_CLIENT_SELECTION
-	select DRM_DISPLAY_DP_AUX_BUS
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_BRIDGE_CONNECTOR
 	select DRM_EXEC
-	select DRM_KMS_HELPER
-	select DRM_PANEL
-	select DRM_BRIDGE
-	select DRM_PANEL_BRIDGE
 	select DRM_SCHED
-	select FB_SYSMEM_HELPERS if DRM_FBDEV_EMULATION
 	select SHMEM
 	select TMPFS
 	select QCOM_SCM
@@ -69,10 +59,18 @@ config DRM_MSM_VALIDATE_XML
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
@@ -118,6 +116,8 @@ config DRM_MSM_DP
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


