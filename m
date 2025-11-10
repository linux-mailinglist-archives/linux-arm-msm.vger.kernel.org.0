Return-Path: <linux-arm-msm+bounces-81080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C510BC48249
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 17:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3CEDA4FC400
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63817314B73;
	Mon, 10 Nov 2025 16:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IdqjNAvF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRgPHyfH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9950531961B
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792806; cv=none; b=OSgz8hC8VHVOfhJ7Ln5ST/4cn+QKPqE7NjsVm4zx4qmvNcwullV5XigzLpEdLGCPkMy1uNf7ZFzCNhEVcnGqpn0zNCZKA6l23p/jey0XsRly09nfxmHPduTyubL2niFzTWvk82Yp4WZvxOZVXVTdGjO/UKhcCgHwP4wCxWtye7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792806; c=relaxed/simple;
	bh=qO7+Zu0jaqw1wGzwD2M4glYIIsdjEUELmwQBxl1LlAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LBK39QS262Gifjl5XwivYKWBUKWyJNXuYAzkcnqUgKeT8UjQPL0R4caos94kIRDks4meOh3xvXqCByanZTXG1oRsUQCMX6tz0Ub0f9GtGKf5+7TAwrvxYErjlv1gok42DpEJxitQZ7J2kkZRoHM5/kHuIpxXKOH6e54pgUdUY0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IdqjNAvF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRgPHyfH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAFQ2vd4071349
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:40:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MjiTt5ghvaBZ1ee5wBxftA1oQFTxDbd5jXrSSKPsmU8=; b=IdqjNAvFs95sCmbs
	MnnHhgwGJ8ALXcgJRJ7/Q+JVDTED6H6J9Ru/z/l40B3DoT/BduEjeDGX5YoFJj3l
	aZVc/E78gWHQiIy6y+P4kTYB6yF+Xfj1G39nzhtA8ydMKSsOwSR5/2FNFn+N2ME+
	WFKMzg434+TGrN7F5L4YPEPxp3A9gksw+S/FQFzyuECpxtisL86Zkoy/HLm1CHgt
	XWGwiRpx/G2KxiJ+ea0uofH/0ngW4Z9OpibZkHUtKD5Zld/VR7dFDapLbHpcYf2e
	80pdjbvn6Qd9/K8lgM70WdavcE1FNPriBppJgLXnX8ImY8NmP1XvHZ6D/WMEqSyi
	YZez7w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjpgr936-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:40:03 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34374bfbcccso1772859a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792802; x=1763397602; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjiTt5ghvaBZ1ee5wBxftA1oQFTxDbd5jXrSSKPsmU8=;
        b=aRgPHyfHE6JdH4/OWlF5e790T5MaINYEqTOP/Wu7Jq/Kaz5DLT3AD/1ASj8j/Ujgpp
         xRUtY1AU1zEC5goP784vlb45VI1LloZHaWMil2zLdAdnuuBpc133qOM8z401ItAnuMDg
         +o2ol0H3wRR8G7n55wi4E520BntmiSOrg/WIE4SkvX57HTt8sOlgma4icZW5qJCSwTwu
         zf6qXiATk9glgi7CRHP5r6xmaLoRYxXjK+p+aOrS8bUeAVzShWBcPVQx/NXu5+wGiaUV
         SHVXLNKhT+tERCo43qZxGOEKX3b3cjIWeb6TSGFK+VlMUEOXB9ut3JOAQ8nYHalHnhJK
         2/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792802; x=1763397602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MjiTt5ghvaBZ1ee5wBxftA1oQFTxDbd5jXrSSKPsmU8=;
        b=Q2y3YXlyx8t6Hds1AufO4i2OZTuiYqmw+YfRhUThygvEhABcNrhG4dFWIDkghEQD8W
         bggCUB3023s67lFg7wbL2JhgL4UXcq0yQXR+VAwY2EUguhHomIN+4K2EqlTlrPRCoCvA
         bzB8GpQ/8tsalnfkL5rbLDV2IpK3T8xxtVKQKMD6oMwHLHoc5tmYfNahF0pOgWcLnRBM
         in01kBJcjWVs732AlcaMhcLfrw4R7qO4UmjrYMyEIRu8HMANEo1DHpps+F+FSt99iKS1
         n93c6gew163qjcVuAx7y+qAW/Y52NXrxh/9elufgro72RnhgcDFMcKnKRKiphsXuoVS7
         1UBA==
X-Gm-Message-State: AOJu0Yz6xIODGFhsmGFAYRUGNVcRgHskyt56GVZVy3fnCXgYQBC34bzm
	nRLGTlq+LGqTiB+siHuz5ce4OEvPmZDNZRIPKKPmOuH/W0uwgbIl0aNCSKkLC1Uq0gbFKqYn27c
	V6kAjmONrw1FKxnF9FNdTdDqAs5LKyxdVBDVZMJ/UZBabzl/0399TWi1O5I8z1NJh6voM
X-Gm-Gg: ASbGncsSONq8V2ZSYHb0ND4no8Bz6g2Ti0Cmo/RYS8WlcyQAIwJEsnhxNezRh308mh2
	LFNiMv/ypk+9SIumTlubrHm4/5C52qFuQClvdNHL2zS0/Hu/Js5yL/RGkree2MUUU8hUZMPW9Yt
	6g3ZSUqeHZcuXwtJ7R8DUW1+wOVdmq8leo6T9c+EUexoeENn0ucCXLrPO/P5db7U8zO5eUh6o2C
	hAj3ygr9anJ66spz7uX9hkND0hpxy3b5tzhD145btdQoSxIljhKtdpazzHebPunr9Vyr/nMVkOE
	wpGhN18tvlIomJOOKYXxUHWG5A9vG1EEhwCZbv8vC12Oiz2WJse1zknfS32lkQB3wkMbyoIc6ZJ
	g95v3kVFVLzbl2lPQQRTKAi4=
X-Received: by 2002:a17:90a:ad97:b0:32e:9da9:3e60 with SMTP id 98e67ed59e1d1-3436cd0f015mr8782661a91.36.1762792802412;
        Mon, 10 Nov 2025 08:40:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8dsQiFeXCA3fQRx1qGyG/iQYXdTGCJDeJX9jjxp7LxaCPRH2dmxyXa0Klr5WF7V5Abo/lOw==
X-Received: by 2002:a17:90a:ad97:b0:32e:9da9:3e60 with SMTP id 98e67ed59e1d1-3436cd0f015mr8782625a91.36.1762792801836;
        Mon, 10 Nov 2025 08:40:01 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:40:01 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:20 +0530
Subject: [PATCH v2 14/21] drm/msm/adreno: Support AQE engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-14-bef18acd5e94@oss.qualcomm.com>
References: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
In-Reply-To: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=3675;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=qO7+Zu0jaqw1wGzwD2M4glYIIsdjEUELmwQBxl1LlAQ=;
 b=hZZOFcaPhVuWtqncNPi1IHicthjYztjO/P4SCnU7EW1A8P0x5HCdnawmFDGbHm+nWpUXFDXsl
 jCAWRGM4iwACOOTExMrXI98NF5IldyXXWJfe9aGT5YfMU1e+uh9mzI9
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX/dje3kSAHAHf
 gAqshxXYF2LPKvKUCwgnJOGq5hqBS2CM1bAR3R/x6zi1Rt+smBNbNOOqwqhZjCdCbtUn16n8P3m
 ekSpLbxymsk0KdJnpvCyifVDXJ8HG4DET9ODefmhyP9Sxc7WceVx/XHTZ9cmswN+hQ3XR5doGZn
 uhVNVTpMN3riTOiw6B/piXJ1UDCC8fbVLhQoKrebcWZkOBi2ITDec1Yqev8rqTs06xk7shdT5Xj
 aFlAqzdwfbjZ1pmI+k+F+nWVozcGIkCnz1Z0d7EDjFp5ln6Tb3qx6/MyZI3o4fgNDfAVFheEoGc
 1X4DWijzTExePwDSfdlQAioam83+0LQ57OuBRCdK12VzfWJNzMmv5pJ0l3TJRI0Ye9VOHw9eAFv
 68fjBXHebNgtbJRI7CKm3QKZoSUykg==
X-Authority-Analysis: v=2.4 cv=br5BxUai c=1 sm=1 tr=0 ts=69121563 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=o4z2bafxGXL3rZEXBYUA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: M0XcWMlw7nMdzlzAyuyxYk1EUL2uY72S
X-Proofpoint-ORIG-GUID: M0XcWMlw7nMdzlzAyuyxYk1EUL2uY72S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140

AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
in Raytracing related workloads. Add support for loading the AQE firmware
and initialize the necessary registers.

Since AQE engine has dependency on preemption context records, expose
Raytracing support to userspace only when preemption is enabled.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 26 ++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 836100047be3..029f7bd25baf 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1104,6 +1104,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
 		}
 	}
 
+	if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
+		a6xx_gpu->aqe_bo = adreno_fw_create_bo(gpu,
+			adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iova);
+
+		if (IS_ERR(a6xx_gpu->aqe_bo)) {
+			int ret = PTR_ERR(a6xx_gpu->aqe_bo);
+
+			a6xx_gpu->aqe_bo = NULL;
+			DRM_DEV_ERROR(&gpu->pdev->dev,
+				"Could not allocate AQE ucode: %d\n", ret);
+
+			return ret;
+		}
+
+		msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");
+	}
+
 	/*
 	 * Expanded APRIV and targets that support WHERE_AM_I both need a
 	 * privileged buffer to store the RPTR shadow
@@ -2132,8 +2149,13 @@ static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
 		 */
 		fuse_val = a6xx_llc_read(a6xx_gpu,
 					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
-		adreno_gpu->has_ray_tracing =
-			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
+		/*
+		 * AQE requires preemption records, so disable raytracing
+		 * if preemption is not supported
+		 */
+		if (gpu->nr_rings == 1)
+			adreno_gpu->has_ray_tracing =
+				!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
 	} else if (adreno_is_a740(adreno_gpu)) {
 		/* Raytracing is always enabled on a740 */
 		adreno_gpu->has_ray_tracing = true;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index b507ff4e1756..7921b4a68937 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -58,6 +58,8 @@ struct a6xx_gpu {
 
 	struct drm_gem_object *sqe_bo;
 	uint64_t sqe_iova;
+	struct drm_gem_object *aqe_bo;
+	uint64_t aqe_iova;
 
 	struct msm_ringbuffer *cur_ring;
 	struct msm_ringbuffer *next_ring;
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 78dcb9bc3377..2ef69161f1d0 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -616,6 +616,9 @@ static int hw_init(struct msm_gpu *gpu)
 		goto out;
 
 	gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
+	if (a6xx_gpu->aqe_iova)
+		gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
+
 	/* Set the ringbuffer address */
 	gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
 	gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 17863c3287f5..4c0d9024d497 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -27,6 +27,7 @@ enum {
 	ADRENO_FW_PFP = 1,
 	ADRENO_FW_GMU = 1, /* a6xx */
 	ADRENO_FW_GPMU = 2,
+	ADRENO_FW_AQE = 3,
 	ADRENO_FW_MAX,
 };
 

-- 
2.51.0


