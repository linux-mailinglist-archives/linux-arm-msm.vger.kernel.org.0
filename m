Return-Path: <linux-arm-msm+bounces-81083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E682C48374
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 18:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1B3F422F5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 16:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CAC31A800;
	Mon, 10 Nov 2025 16:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CK3GXIWW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GfZrCNmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07BA32E724
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762792831; cv=none; b=RrWAjqElJAi9huJZMli7DWkACOE8W2Oo/Z9fPnedF2s1Bd8yNTh086C5JI+MATD8vaGf1tX37thnc+7G44CabBwrsdnGVMy2s/336KPaSLzYj64PGWCRWsTsvDJreDe6gyqgief8YWmKUjj2b9aMMnhnPCrR3bKaCQNzvWg9cfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762792831; c=relaxed/simple;
	bh=rxo8KNe8fZ6GoE1qTMjcIu8xw+y8Jo6Z4njukymgL4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qeP9DJDRHGptl2Db2CJ0ERgxXTge+8lqUQzkxogS6vbZVdsZ6Z8bt0HdXdGcDRuTnku4uiOPJqmJE4DXBFZC/ER0TLWgxiks2LTUolrOe/vrSX31vr4ru04vxTFoM0KFLD0NAvQHJFKNph0mpJnBZuOMi+LK+Y7tMaFO340Lwsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CK3GXIWW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GfZrCNmU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AABZXMg3271042
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RAeWnBXUByzQY/0e2GxvvHvD5cXNbEZsRf8XUNNkp+I=; b=CK3GXIWW8A1zD/gW
	2CZ3e8l1BYQGa+IFQYgYUMFwQrlhUdspW67o1PqI4ij7m+UVSoIlYSfQyIgEKz1j
	UnzX9sB8cqri52EMt0AZfmoPaXR5tPdxZDAIHjCBI6xE9RzrS0uKn75JMh/jnDlX
	zKZJDTzDEOb2Ma0doyZgVNZhA5u8p9x0qdTKsHilczm9b0SbxgWQ3764kY3XFnsW
	9S0GfgsHZQ6iclJWaiqt7TrZVDX766p+mcwTmvPBL2DSZh7hEhcNmFewSphCtg+j
	c70nI036SAlOpwXqMagB295AOr6xAAyzjXgtfh1U22KEtUnt62WjUfQh3QzK+/RL
	WSx6Qw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abfafrvt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 16:40:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34377900dbcso2480540a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 08:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792827; x=1763397627; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RAeWnBXUByzQY/0e2GxvvHvD5cXNbEZsRf8XUNNkp+I=;
        b=GfZrCNmUg39yIELoQqvEr74yEocG9WzwPWsVD9dYuUK5jKc3PzP3Gx4b75JYUNyWRm
         b4G9jzlGsKaJqfwPrqA4MDNKiaE9zL3/b/+2QidHOoyEJ7iz5rp9QtQ74bK9xDJD5pg3
         T4nj8pLStYzgZrSSpdnO0RjMuwf0J5EDIDljCGlNzdbDMvK+DLTAyd05OOLFvbauzElB
         WQP3+s2e+h8CkqoL7s/MrU6DhvgnQvoxmsEXea9VXDtR7FDmKX2AegfKuQCXCw+UjGJh
         MmtZaMYiM92rVRiDOLx9jZ8OWymdjx5ddFMKMqXrv4nBg+j7lX2+pjHDb0wnsOEb1Sma
         oCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792827; x=1763397627;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RAeWnBXUByzQY/0e2GxvvHvD5cXNbEZsRf8XUNNkp+I=;
        b=fzhZZgSvUxu3dZVZB0IRaqNJ6Rdt9VIQMwV/f37QExPieSWrksa3G0aUKhWZX+AQ81
         uUVUX5ce4edAkd2wn8xJ4slsk9+WO9fB8MKpij9N1MmJ7NKV3u0bdSXzux4MnlQEzlFM
         iSvqcERm/Ka1rp/qLA3ObfAQ8tRZUtK94VvdCXDijBQ1uy3rXkl034iPv/DsrYAlwqGJ
         +AemAfTGnBevj2G/WkQLHHcfhJddk+o3rBGpXz6hbgWTTpgi9rH9kx8m8ZMHXbSqiCnI
         fB2vrigALpMij/6+5IiM0ckMUhSaqr91shTtkctmNiPGf+crdqQfnXkNt01pJawIyydD
         8+lg==
X-Gm-Message-State: AOJu0YxMv83uCk6qn6V/0oxSWCjrTZ2dd9XqP7Y1VvCYnD1mfzgTbIIc
	dTubKT6Xc4kyMcUMye8DgMlkNQPfc7bkMhKTJIEwdHeBlrYTffcJfsjsi4MbY+FIRxmwA3CBMmp
	O0mhGzlUKalrFq2BnRWvTmj/5kcnU3XJpMq2vkZ6MYdJuoaF8l9lWkNPfaUJKdh4AtdrU
X-Gm-Gg: ASbGncuDLkKbX9R6inHrhmj3DijYnC8hySyPce6GHPaQ4SYzuFF/difrqY9nu5n+sI4
	DjrCs+Adw3MtACY+Ydp7TBgC5m3I5wipw+ijY0RyhHXn3tEzVlNrQPHd/ZJtOmkswbYlBsl5Nxo
	wgAQJEbzvcLH6A/H5eYhrkqQFXpScmYYqEgN+62eYoTRepdPk9OmRMYy7mQf6LXpJFlxDAfGdUT
	MMnp4ww8AbvIQAa5JaQdPSSSFv+uR+TuivDmCQFDKQdsW7lKV1ca5Cx3bMImBVzix2aO9T5e2Gs
	kFferNC4BQJdhwf981FVKszqoUEG0bSBPRsNGhAtOcaroJx+HyBqsKIT6hFxXG/O+Dmo2cuCyNp
	W8UeyeOQoi6xwF+Gz47rUsuU=
X-Received: by 2002:a17:90b:350d:b0:340:c261:f9f3 with SMTP id 98e67ed59e1d1-3436cb8a0bdmr10996785a91.14.1762792827059;
        Mon, 10 Nov 2025 08:40:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ6SgEPHFLB7tJt1selzb+IAVcjypRQkbXXUrv1xQ3l5NKQ5mJIK5MHYoxyPRmLW5gHKNA0A==
X-Received: by 2002:a17:90b:350d:b0:340:c261:f9f3 with SMTP id 98e67ed59e1d1-3436cb8a0bdmr10996713a91.14.1762792826165;
        Mon, 10 Nov 2025 08:40:26 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:40:25 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 22:07:23 +0530
Subject: [PATCH v2 17/21] drm/msm/a8xx: Add support for Adreno X2-85 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-kaana-gpu-support-v2-17-bef18acd5e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=8669;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=rxo8KNe8fZ6GoE1qTMjcIu8xw+y8Jo6Z4njukymgL4A=;
 b=TS6ZFtwSLPe9sN3IJG6GTWIVoWt6rlf3J5a7WmqIuU03wFeD2NFAzBYZdQavOzYSylfjIQ5qo
 Z8uUNhBQnEuDl8/bfuQ7qPtMLlwdQg3zleZUtVEcZ4X1eP1LRMnGpgQ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: Z8l59df1gWJJ-PdrD0uwiA_qQZpyAwuF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfX28KYW9pdI2zI
 V7XHHMaz0tNnww7TTBtkYQMNBeeT7XmSfh0lOzmIqH8oCPzn5Ca48teFQXbUuc19UL/JFY7ZoPO
 9JnWkKY8tWH9dPLvRpkjGJe2Qx87qzX5f/2N6xykfbriggi9CWf90fIt8NFV0bl5+2wlvI6WyrH
 gSdUOVt8BOIMLGEqa78hVcyjiwIZc+oCJp7iuAACnmt8nuUswi//jZ6X8pwLq+vCvwKTmcb8unl
 AavOrxAoBtjQ6VFP3OW1G0gADRJHleSD2ztgGmurXLYZf499c/zMxoMRiNCNLJbccWaFcUfd1rl
 6rzTqarU6OLmHiSJRHw+0jDSbLihLynAFBKfQWx27yy6IZRFaPkcIHleQWTAItTNReM8g5qRQ4y
 z5zRemFoTPIfNREobASOJvcRtlV8eQ==
X-Authority-Analysis: v=2.4 cv=UZJciaSN c=1 sm=1 tr=0 ts=6912157b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=EwBcg19hBkDoPxKGktEA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: Z8l59df1gWJJ-PdrD0uwiA_qQZpyAwuF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511100140

Adreno X2-85 GPU is found in the next generation of Qualcomm's compute
series chipset called Snapdragon X2 Elite (a.k.a Glymur). It is based
on the new A8x slice architecture and features up to 4 slices. Due to
the wider 12 channel DDR support, there is higher DDR bandwidth available
than previous generation to improve performance.

Add a new entry in the catalog along with the necessary register
configurations to enable support for it.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 131 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |   3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |   5 ++
 3 files changed, 139 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index fa3ae725f389..2e5b0573c212 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1625,6 +1625,108 @@ static const struct adreno_info a7xx_gpus[] = {
 };
 DECLARE_ADRENO_GPULIST(a7xx);
 
+static const struct adreno_reglist_pipe x285_nonctxt_regs[] = {
+	{ REG_A8XX_CP_SMMU_STREAM_ID_LPAC, 0x00000101, BIT(PIPE_NONE) },
+	{ REG_A8XX_GRAS_DBG_ECO_CNTL, 0x00000800, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_GRAS_TSEFE_DBG_ECO_CNTL, 0x00200000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A6XX_PC_AUTO_VERTEX_STRIDE, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_VIS_STREAM_CNTL, 0x10010000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CONTEXT_SWITCH_STABILIZE_CNTL_1, 0x00000002, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_1, 0x00000003, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_2, 0x00000200, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_3, 0x00500000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_PC_CHICKEN_BITS_4, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x15000000, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
+	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, 0x0fffffff, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_CHICKEN_BITS_2, 0x00820800, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
+	{ REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
+	/* Disable CS dead batch merge */
+	{ REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_2, BIT(31), BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10000000, BIT(PIPE_NONE) },
+	/* BIT(26): Disable final clamp for bicubic filtering */
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x00000720, BIT(PIPE_NONE) },
+	{ REG_A6XX_UCHE_MODE_CNTL, 0x80080000, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_CCHE_MODE_CNTL, 0x00001000, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_CCHE_CACHE_WAYS, 0x00000800, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_GBIF_GX_CONFIG, 0x010240e0, BIT(PIPE_NONE) },
+	{ REG_A8XX_UCHE_VARB_IDLE_TIMEOUT, 0x00000020, BIT(PIPE_NONE) },
+	{ REG_A7XX_VFD_DBG_ECO_CNTL, 0x00008000, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BV_THRESHOLD, 0x00500050, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BR_THRESHOLD, 0x00600060, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_BUSY_REQ_CNT, 0x00200020, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VFD_CB_LP_REQ_CNT, 0x00000020, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A8XX_VPC_FLATSHADE_MODE_CNTL, 0x00000001, BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ },
+};
+
+static const u32 x285_protect_regs[] = {
+	A6XX_PROTECT_RDONLY(0x00008, 0x039b),
+	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
+	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
+	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
+	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
+	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
+	A6XX_PROTECT_RDONLY(0x00759, 0x0026),
+	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
+	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
+	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
+	A6XX_PROTECT_NORDWR(0x0082c, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
+	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
+	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
+	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
+	A6XX_PROTECT_RDONLY(0x00ce0, 0x0001),
+	A6XX_PROTECT_RDONLY(0x00df0, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00df1, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00e01, 0x0000),
+	A6XX_PROTECT_NORDWR(0x00e03, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x03c00, 0x00c5),
+	A6XX_PROTECT_RDONLY(0x03cc6, 0x0039),
+	A6XX_PROTECT_NORDWR(0x03d00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x08600, 0x01ff),
+	A6XX_PROTECT_NORDWR(0x08e00, 0x00ff),
+	A6XX_PROTECT_RDONLY(0x08f00, 0x0000),
+	A6XX_PROTECT_NORDWR(0x08f01, 0x01be),
+	A6XX_PROTECT_NORDWR(0x09600, 0x01ff),
+	A6XX_PROTECT_RDONLY(0x0981a, 0x02e5),
+	A6XX_PROTECT_NORDWR(0x09e00, 0x01ff),
+	A6XX_PROTECT_NORDWR(0x0a600, 0x01ff),
+	A6XX_PROTECT_NORDWR(0x0a82e, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0ae00, 0x0006),
+	A6XX_PROTECT_NORDWR(0x0ae08, 0x0006),
+	A6XX_PROTECT_NORDWR(0x0ae10, 0x00bf),
+	A6XX_PROTECT_RDONLY(0x0aed0, 0x002f),
+	A6XX_PROTECT_NORDWR(0x0af00, 0x027f),
+	A6XX_PROTECT_NORDWR(0x0b600, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x0dc00, 0x1fff),
+	A6XX_PROTECT_RDONLY(0x0fc00, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x18400, 0x003f),
+	A6XX_PROTECT_RDONLY(0x18440, 0x013f),
+	A6XX_PROTECT_NORDWR(0x18580, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1b400, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x1f400, 0x0477),
+	A6XX_PROTECT_RDONLY(0x1f878, 0x0507),
+	A6XX_PROTECT_NORDWR(0x1f930, 0x0329),
+	A6XX_PROTECT_NORDWR(0x1fd80, 0x1fff),
+	A6XX_PROTECT_NORDWR(0x27800, 0x007f),
+	A6XX_PROTECT_RDONLY(0x27880, 0x0385),
+	A6XX_PROTECT_NORDWR(0x27882, 0x000a),
+	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
+};
+
+DECLARE_ADRENO_PROTECT(x285_protect, 64);
+
 static const uint32_t a840_pwrup_reglist_regs[] = {
 	REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP,
 	REG_A7XX_SP_READ_SEL,
@@ -1809,6 +1911,35 @@ static const struct adreno_reglist a840_gbif[] = {
 
 static const struct adreno_info a8xx_gpus[] = {
 	{
+		.chip_ids = ADRENO_CHIP_IDS(0x44070041),
+		.family = ADRENO_8XX_GEN1,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen80100_sqe.fw",
+			[ADRENO_FW_GMU] = "gen80100_gmu.bin",
+		},
+		.gmem = 21 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.funcs = &a8xx_gpu_funcs,
+		.a6xx = &(const struct a6xx_info) {
+			.protect = &x285_protect,
+			.nonctxt_reglist = x285_nonctxt_regs,
+			.gbif_cx = a840_gbif,
+			.gmu_chipid = 0x8010100,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 16500000,
+				},
+				{ /* sentinel */ },
+			},
+		},
+	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x44050a31),
 		.family = ADRENO_8XX_GEN2,
 		.fw = {
diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index ad140b0d641d..d283d0b55623 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -175,6 +175,9 @@ static void a8xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	u32 val;
 
+	if (adreno_is_x285(adreno_gpu))
+		gpu_write(gpu, REG_A8XX_RBBM_CGC_0_PC, 0x00000702);
+
 	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
 			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
 	gmu_write(gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index f53ceacb1419..cd9eeb8ea00b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -569,6 +569,11 @@ static inline int adreno_is_a8xx(struct adreno_gpu *gpu)
 	return gpu->info->family >= ADRENO_8XX_GEN1;
 }
 
+static inline int adreno_is_x285(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x44070001;
+}
+
 static inline int adreno_is_a840(struct adreno_gpu *gpu)
 {
 	return gpu->info->chip_ids[0] == 0x44050a31;

-- 
2.51.0


