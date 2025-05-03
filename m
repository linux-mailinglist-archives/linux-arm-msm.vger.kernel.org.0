Return-Path: <linux-arm-msm+bounces-56635-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6D8AA7F32
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 09:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5B861BA5190
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 May 2025 07:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4BE11D6DBB;
	Sat,  3 May 2025 07:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0DKXqSm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B57E1CEAB2
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 May 2025 07:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746256649; cv=none; b=Xa6/Fpa/lK8iTjsRR2GZT3+PpFHuSCZTFrjk2zVwor97+QkoFuSlxcKcseCmcumnvJzyW4AASzctAejyrktxiB70pkx/zrHJy5IyAVzeecVWGm8p6EnivPB6dKAAFnTE11BI3vigYBG5Jhp7xe/gYotAbEJL19HuQIG7sWOFNWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746256649; c=relaxed/simple;
	bh=1CGQPf555qFJU/R7NQ3znd/IF9NZR/aTxcJ4mydnTq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SW1LNAKfQeG6V9dbTB6uLdOUZEkut5xhXnYd2vRhnze7zUCvR323HHXGA9KxvI32hipL1mbSTIrwW7Asvc2NcvOQYkfRE0kqFYjbouFGqbek5qQX6jhUV/KX/0OYWhRRpXLwvW7HBlgQe82ogUmR0YsibedPYVuzWvuF8vDm7oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0DKXqSm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5435XGMH012904
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 May 2025 07:17:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PidCDaupyEMEwIHIG1xvK2j20VbRhsyPW2bIrlAsTDc=; b=m0DKXqSm6EyfaLu/
	aYULsLAbxD6xsr8J0khOtrg/r6TS9wBbgmx1O5oBRtjc/rP/H2iThpYEyWv7Jg8r
	PzFCnUyrxyDGl8NYCZ9fUBH/kVlf1HjM67qz8M33uMcoKkQ7lV5dmHro8w1hcK54
	4ulb/K1pkzIFP4JMdXd3lXkJtiDrPoLeCdqBHKEZcRg/E/XU7I2vC1w6YyhEHl+c
	0HFzkpnKoQs4qsw+VRdyYr6mtql3+vXsfDYiuwEEl+nhpqJyx+USTTXiAvY/wBoy
	VfqEE8IjVndeQSCu2zw9CXMg6IrygxhY+sHmDy3G2PWbPu3ZlA/6JiYSzARUNNd5
	MJvW3w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dd3n03mx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 07:17:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e905e89798so52407776d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 May 2025 00:17:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746256646; x=1746861446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PidCDaupyEMEwIHIG1xvK2j20VbRhsyPW2bIrlAsTDc=;
        b=m35bcX6ak28FFAQRa85cF5l5YnQBw5HY0ZlAFnStv64YCeUW2CNg+2ITU98Xue7UZe
         nx6EOoA8WZFboTU1CwF2YNakMX3FiiiUQ3vPu2l2eHpbhoEfG/DDrUWUUSmV8pR2s3sC
         zaocLwHNwZVSju/IMkFVvX0PUaFV4zrmZOdX93mKw0Pc+TCl1pDAkHU/dNY2NlTMMH2j
         gMk0V67Fg5FkfzdFi3Nw7ZU6IXsFvYbP04BH5LMgti1252/BKvI4OK05NeRi4VxHpkCV
         qXtm2dRp/vYzi9sU2TF5DuWiIVNCqVEPJNnRgbUe0Y531wqtkXnEx3HN//MxvS3miMFT
         Crdw==
X-Gm-Message-State: AOJu0YxsMwDdOdvE5fxBOVc6kGjlDXXdDk2roq6LRWeBRcBaKf6Tz2iy
	hJQ9729dZN6+PLNSDcd+36PEhyS4zwPLioCL45+r9pTban1tJxhuv2oP0xd9SZCfitc6sd8pIxj
	P8KJ09Bi/CrJ4QA1izH4B4TgQEaTOPFKJBWdYm6DTyNTBUjg9BgWnOEAuZrgcG0i7
X-Gm-Gg: ASbGncv2TkU0NWPAjNBsD/MGltjE61OjfxOdbOezCEjypihGh/m7bTg9v3lBve/Cu3+
	mJAXbvD7OstVS4LB6X+TJVZkxdj0An3DJcLBTD5oql7MhlgjR/peHAN/c4ZJoh4vFY9lSamtfoV
	yHo9fnXIDlj4MCqqKmIIKv2q/cFH2Y7Re4K94i8lSm+OZhw0GHrYnF4Dd3jnHi07lJ57fhgsP3D
	nLmClfTjebKnKlcxYBU9AjteLU+Ou6HbnfxFFjOjN0RyMIyc3114o4MJc8JrbnFBI0+oHRZ4M4w
	k2n0AUa7TmpiKuvBUKJ+cgaeTqCYfdsmFdJRUtAmdOHH7mYL2XlDXNxuBeRb9gyQYTjgMKJAaiB
	Jh2OgoG4UvFIVfmonc62ceElo
X-Received: by 2002:a05:6214:2129:b0:6e8:9021:9095 with SMTP id 6a1803df08f44-6f5237fbbb1mr27600746d6.32.1746256646248;
        Sat, 03 May 2025 00:17:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpB3pHTIUqZGcsBp0Il5fJqaHfOAUEGlJgoPXLApyd6X97N7fzz6CuVAEWn767gkXc6Hk4BA==
X-Received: by 2002:a05:6214:2129:b0:6e8:9021:9095 with SMTP id 6a1803df08f44-6f5237fbbb1mr27600466d6.32.1746256645925;
        Sat, 03 May 2025 00:17:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94c5557sm692816e87.84.2025.05.03.00.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 May 2025 00:17:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 May 2025 10:17:07 +0300
Subject: [PATCH v2 08/11] drm/msm: rearrange symbol selection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250503-msm-gpu-split-v2-8-1292cba0f5ad@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=1CGQPf555qFJU/R7NQ3znd/IF9NZR/aTxcJ4mydnTq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoFcLuBMMn4ItSbf332XStKlW35YGuLZVxWVA8m
 25P9Ac1XzKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBXC7gAKCRCLPIo+Aiko
 1dtxB/42QE9ea3mH4vZB5MqtG3+5CAfJWvYdq5Uau9Gm5ZB0YuiFOpwCgBvNwzk+ecvA6/grL4e
 Ennjfd1ZhPjowB1gdRAPbNturCs6p70ZK9avu4lTx7KkdsdwK0GQ2OVYxRiUWDUgPFTW+4i3GZe
 C0G4hiUkCoZ6fzWHddY98lM1VcZBVNA7/GvULRuc/tiFn6X6nSoJ6qnGwqLOsKOhr372i+QNz5P
 8NKNh1G2j2ahLeI6lkyFnq4fWEu2riXsU5WB20ZQEPptG60ZP6VbPwk7q5PCQwqnqjQX6SAXR66
 DtOgoZ7koBsXNNQ9I8KvhvQhqLOsgI7VjgKYsuLdoiwcNMQv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA2MSBTYWx0ZWRfX8kbomYHl/DtA
 pInNDlXKuIC82YOIopyqPD00pp9trLaqePMF1afcZliPmkCdAuFnQZoM3co+9hUrZw+CJ2dERk1
 48he0yQ7kl3gDykleEp5eSEA1diy1TSVqYa8ccdT+gyF6N8UHpWgRImjSM82vYolG4OQ8t6poiG
 Bv0aA2qWDYVYzEFqqFapnVOeZ4fxd5c7JdvWtNkvyWOZxp/q0zoHZhL+vmWXquExV1D3w459704
 xSvzNHF5pWWxu714CBRxFVuW1D4cN79D1bmlmDiziNYJlIb9jBjWe6BvbaBr4Qd65Olx8JPGyTM
 ACLVwJZUP6BpieOlZmk/CF3UJMkNPQvaRFvLSbYSVAORG8F0gfmZwkkJuuV2IfvZyVyiiH7315+
 +pK5vcNvv9ScYdOBuU6kH6k+j9o70lvHlGXYy1LTRHqeNblk2ttof6Kr1tFGZIBFYBriLRcZ
X-Proofpoint-GUID: AAAhURxBa3FE8SGINj8YSigpttTfRwa_
X-Proofpoint-ORIG-GUID: AAAhURxBa3FE8SGINj8YSigpttTfRwa_
X-Authority-Analysis: v=2.4 cv=UNDdHDfy c=1 sm=1 tr=0 ts=6815c306 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=Dibrpul-hQ8xFFu5PoYA:9
 a=0W9TD_AsGAYKDBPL:21 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030061

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


