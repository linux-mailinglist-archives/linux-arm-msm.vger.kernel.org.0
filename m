Return-Path: <linux-arm-msm+bounces-67024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7573AB14FCE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 16:58:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F4AC16367C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 14:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA12290098;
	Tue, 29 Jul 2025 14:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iiZYV5jr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F5E28D8ED
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753801068; cv=none; b=erZPRQDxIR1qJAlpRVaK2XC6Mwt9YcRr1cGtd+VrszhwyhD6nrxFeM8G3APGmhO+DtvYlYlJm7EJBVhw+ZdPUZF2yLMO70aXb0sfzgTgCNcioOXQyGoiJVk2V9hjBpAh7oxebBC1lmRq8NhqqfkeZsCsNmFwdjkAbi45O3hfM9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753801068; c=relaxed/simple;
	bh=FAN6MDlQ+moZayDw2NfRU6KnZ5pK8/y1vLnQw1RaZ7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOBNFOvJiqY0Dv2ieaWP9zJKpD7cVU7Wq3IdHkjjyZ642Dv6/B+KBF/hMUwlFx94Wea0EZFL8Nc/k2IGAMiZyw9VSmmYPwp0SmffeAXAkpPLpRiivoB72j5FexyRnp12EFZvn4aEirKMVRUUkbVTCyn/CIQlIXfYsWfQy1uj6H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iiZYV5jr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TA2u3C016216
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mD0NBZ6SOPW
	kY6KB67p+Vrn86xtl4nZV3W1LSsEOfPE=; b=iiZYV5jriManv4CDr58TLuNr65y
	F3hzRYwPt2s67ATn13QZ/6gDeuUYU3uD4URo+ta7htvq+r3eETOy1VvFOiJmxgNy
	cRNHjFJ36qq1/ybOdfYDP7dhA0VOPouoN9z1JvBnHvvpJxjv4EnYs64poNCsCEdx
	VgrPyzVEKhxkLtQ8fgXW8mTpWiG9LDKRjpHwwleAN4Q5NjWkhF3KueR9P9qRUm5o
	qVvXNYGLurukCT/96AxEfqVQCsb0qFAGw8/lbX91E9MLAQgfO/O9ddLDjg2PCbTZ
	fdGT773F9GA4kc4spG72TylUKJpoWSjFNNaLhad06NCoC10dT3MAgAkOVOw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 486v6y0v22-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:57:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-31ecb3a3d0aso2637255a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 07:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753801065; x=1754405865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mD0NBZ6SOPWkY6KB67p+Vrn86xtl4nZV3W1LSsEOfPE=;
        b=OdN2g6nzbjroUULe8C43HJmQeo0f5tBw5KcuyHE8lcAy+peaDpaoqHt9aNPrV3zv61
         KEVL1YyTt5QBJzhYO75sSnwA6gaHFsGUXe9Jm3rCMlFy54IEtLljtC0dORq0uRAV+GhC
         Ao2Cn3Op6419F9ZEiQzgJWXrnG0FcbEoHakN64+eW6QjI9SJvOUiswMhIgwH9amoMzM8
         uRQb2FlD6s05deW2FMgiOJIsPntLzcGacYa7F+xVGgfMabHBm04dwFVjCsrI6sv7sR3d
         2v2rfxCBeVbBUGZSPxDFrtaXCFVNTh0iCXEeLhQNdeDjXtznqw4Qw7S87sLuU3Qjqjne
         f07w==
X-Gm-Message-State: AOJu0YzU55CTk7r/0A6yC4Henq87k8L6MAGIGR79Sgl/KecYCJQ1YYAL
	t6RyA2FIbjhQVGbF98sJItdcq7cTBDJzWXyE4DaWeTtkVvnkKPOWKiB5Hztg0lsFdQnxPymyJAw
	UmXnufZTjR+UIwqRsWr+gB8voSiyvsEY4Sl6a8TUIZPv7PYKeLuduIn7mPFvlCszS817P
X-Gm-Gg: ASbGnct8ueZzJEE/JK4k3JBnWZmAu3Z4nIJAb/HQ54UULZ4+jcDt4oy2shOXIiFlSnb
	nUjZkOzPnCKTN5Bl65lVePVNrGSFdhL8Co8X1Rp+1AGmuqmgYSr/3KMnSQrwb41o2tCsWuSmZSN
	ZOED8F5yPWV4l732XGfNXiRFF1h33aJiNe5ZbeTS2I4EOgK3WDoO69HMtwah0md/I9idSEXO+km
	s1m9Ug1kUpgyaAOTiF1CIvQSfBomDLwZ76GgsoyAnOM3cnI/9rF+Nad13kvyB44HDkGpw+8tz0s
	frd/q4etvmNSIRQWJcttAjXW7BRFWIOdsr8R8AV4p6OYRBaGmX0=
X-Received: by 2002:a17:90b:4d8f:b0:315:fefe:bebf with SMTP id 98e67ed59e1d1-31e7785f8bbmr20455324a91.13.1753801064922;
        Tue, 29 Jul 2025 07:57:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEiMpmUR+bY4vgJDJrIuyQ52pRlkgEThbWo2keOzuYnD0mITzM0Bk5ZrIUFuV4Dy4dKAex9g==
X-Received: by 2002:a17:90b:4d8f:b0:315:fefe:bebf with SMTP id 98e67ed59e1d1-31e7785f8bbmr20455279a91.13.1753801064338;
        Tue, 29 Jul 2025 07:57:44 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e66eabf0esm12322972a91.11.2025.07.29.07.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:57:44 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 5/7] drm/msm: Fix a7xx debugbus read
Date: Tue, 29 Jul 2025 07:57:22 -0700
Message-ID: <20250729145729.10905-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
References: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExNCBTYWx0ZWRfX7esu+HPQxq5r
 8zPaMcKHqzw/qzHQUMDu0ra2lojNniseVjj0oOWYveVR2abKhWpFnOgCmOn9+ssUk1aBfPMwg/J
 b2CHf2pSGcZyjVvspgCIxTRdM/9cVLpHi/vD5urgrBiPNU2x3qudDDXj9DDN3z5znzWN0DKmmFQ
 vBX3c0dUNX1AcFV7WAiOKwN+Wl99T5Rvz4TswaSP0UWqHNZAR9cgwNt9LQWldIpfw3LeRSzXlDA
 twytvnkRdw9dOoTLv8WRT3D2WeM5SpD571Rxwmyu6U+npPRMjModwLsGB/UWS9MWXGQ1Kitdjn3
 ajQwgRczSuxwXzVHCsTQReWuisOo7+JlqoSMJCpjpXCH8YYluqrJP7UjcdAPYe1fRaI7kC3b6wv
 CPYyn0Nn3od5UE/QQN+6zJGpURxiUDFzYfQ5okf18YQV8yFgjHcbSFzGSekoMFqhGhR3geEY
X-Proofpoint-GUID: NSBbBpxWP1VvVv5IjpJ_35S2gVpTYXBT
X-Proofpoint-ORIG-GUID: NSBbBpxWP1VvVv5IjpJ_35S2gVpTYXBT
X-Authority-Analysis: v=2.4 cv=QYlmvtbv c=1 sm=1 tr=0 ts=6888e169 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=IkVRe3mbPPK2UihE07gA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507290114

The bitfield positions changed in a7xx.

v2: Don't open-code the bitfield building

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   | 11 +++++++++--
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  6 +++++-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 173c14f215a7..8317e1107389 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -174,8 +174,15 @@ static int a6xx_crashdumper_run(struct msm_gpu *gpu,
 static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
 		u32 *data)
 {
-	u32 reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
-		A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	u32 reg;
+
+	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
+		reg = A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	} else {
+		reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	}
 
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index d860fd94feae..7a32f6715752 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -594,10 +594,14 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0600" name="DBGC_CFG_DBGBUS_SEL_A"/>
 	<reg32 offset="0x0601" name="DBGC_CFG_DBGBUS_SEL_B"/>
 	<reg32 offset="0x0602" name="DBGC_CFG_DBGBUS_SEL_C"/>
-	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D">
+	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D" variants="A6XX">
 		<bitfield high="7" low="0" name="PING_INDEX"/>
 		<bitfield high="15" low="8" name="PING_BLK_SEL"/>
 	</reg32>
+	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D" variants="A7XX-">
+		<bitfield high="7" low="0" name="PING_INDEX"/>
+		<bitfield high="24" low="16" name="PING_BLK_SEL"/>
+	</reg32>
 	<reg32 offset="0x0604" name="DBGC_CFG_DBGBUS_CNTLT">
 		<bitfield high="5" low="0" name="TRACEEN"/>
 		<bitfield high="14" low="12" name="GRANU"/>
-- 
2.50.1


