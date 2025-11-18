Return-Path: <linux-arm-msm+bounces-82219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D4DC685BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id E476B2A5B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D97F30F958;
	Tue, 18 Nov 2025 08:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZdesJnE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUjc7mgT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFA6287243
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763456008; cv=none; b=jkF4y+u5C/s+628ARX0KN9We9hvP3krOYnJdrIzGVBFkB8zTOOCsnO84stPP6YWtexG4PntdtWWcY5Vod3UgwTF3YSbZ8NJ7gZ6wtrm7mMWZ75tLhn/U1CrXue7k2ck5R1foJ0R+j0hPOVFU1V50u/jdgNB9aHbuAirscOsMKZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763456008; c=relaxed/simple;
	bh=PCP/73rSSP+ykkJPeuMAFzZS+FOfdS5f08zC1/lBMhU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gUmMjKcZbxemf7hAblErQBRpg2iB/U3OcHCNiZIeu61MwIKN2rkP6sET7UyZSw+xw60KDqNCwP3De8IUJUZTooWgCEWmVLuKlWyn/NLx4j93v6QF9YnnUomdUTBCcG1XyUwjEbBJYJbGe56GPdRP/cUyE63WXk/y/pPMNOBdm18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZdesJnE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUjc7mgT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI1M2vH4166714
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gZej80vlSW273rMLd3RVMaTYSytUZeJq4SYmPLls0YE=; b=gZdesJnEi0wtHSuW
	yRi6vnH1X54uly+Vjv4KnYvTOugcOCI2nmr90Ek+iCshdKFp6keuerpu4CTij3lX
	AQg064SC204Ljlh2utLo+NGWz8FcSgk0/5bCu9a3+lcbG/g7jchJn/Qs5XYBNmpZ
	SK3LcNM+wWhT0NfLOoCoqk5vHxWVrjFEhlJetU68Hp5zkxVRxc0JApbg2mRuNMIP
	ugXo8FcBScJQOqYKSOlSGWWWvTJZ2HItL5UgpVXdk3iPbS3Ff9qS6yg4UXEkvYDG
	AG2i16T9hG6wxD5McVOMcwYk5/XEvPdkGLtrtvF/LkFChr6gzhKtVJa1+/64yJUS
	2SJqzw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag593tux4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:53:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2956f09f382so46824545ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 00:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763456003; x=1764060803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZej80vlSW273rMLd3RVMaTYSytUZeJq4SYmPLls0YE=;
        b=YUjc7mgTFIlQv8qUuDz6h8cf39KG/3fBQugzVemF1qPig/yvO0zgwiQwEIYPbiqfQt
         tY5rxNRt/5jR9rgaMQINsC3ffDIcB5l2o1VE5kkTJ9zthXWdY+XYSqP8hC0f1avxlOil
         TJpP7a/AGQnnQpKOle0pblkqLsGHJWOdaswsp136m8QOk+We0rJRNjiOTDXU/rpJBh6s
         5G9Wxq2TnYHKcSynoMVtQAL5bJuZSy5zSSGguZK5xGMCJATmzQw3ZEYATA6BmiaxOjOn
         6SLryyNTYPJoN1/Rl4PX0yA1RDJ/h/CZWHg3sWlAfMb2qUaOer2koTnu/piM78ApnptO
         sWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763456003; x=1764060803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gZej80vlSW273rMLd3RVMaTYSytUZeJq4SYmPLls0YE=;
        b=iErsrPkyFalWzcCulInqZrPzRKJ1hSGrFnZvF8IzMTcNLdBzUjc205UxrMukL5SMz2
         VZrFwSEswCK9TM379Zv7Poor/NdsuuO32DSm7yRzPBA9FcU/gr8LG6H8+hjfyXM6VAZX
         4/DhwThCjLP1U8pH435n4UmJ3/o4o0auD3hBsTayNcP17L6ULdYg6rkZMe7bgQNEYtEJ
         aY/rcusNsW0i4v1LQtJVLN9rj2uQKf/4TT2EvbCHfhjjlF0KqDm9W62uf2g0NDmKFtsI
         r4QpP9eG9BpWvXws5yhU0uaO89Mh7sAgPq7N8u1eefK0C1Ji/DGKnFZkiRlxFrnuxieG
         bAXA==
X-Gm-Message-State: AOJu0Yw0KgHOTC5Npyx6U9nLfLmlmJzUS72j+AxHYekPcXMfwOVhH9QC
	/DnL8B7RyyIVPpQnFWqx0Ii5yX5WSXSQefBHBXjq9oIRXpQg0/BIpd+41VWO/zfiHTUuVNrbfKm
	EbX6HVoZev3FX1jQS7Lcbq1QwDMfAITdtbHjW0E+UGt2wP7h+njfsUE04kXamU4yXYwT4
X-Gm-Gg: ASbGncvln37lQFd9jQqdtrM8+MoKRZDZHDhWMFSaqsK2EMOFmphAEmLXz+/56oieOuE
	bMsNZIRjkINwXlsS+P9LllyzWZbp7Rv8ZmxPRHJYmALZ9gCzqaCT0e1kZAM3p7g0Q9q98ZSri+H
	bWOusnmHi9sdOG8Hj5AI9sDyrQgBT0Tm72XacmPzDSovId24nW7fPqSJgHdK4hO++0kAAPo8ZoN
	RHY/W60HE2EAo7tOJrdtx+b2KsI/bc06ZJz/1uFyn+cH3O1+NyIp6aVp1yn1ZEVwm3N/QM8Hv7z
	cJ4+v+m3jsfF9xfY89rNMHnS9C1thlonqXc0MSJqefLClvMgpmBY51M8ZdlAaY3F61Gp6ohGdtc
	Qz7toVC9Nz/wKl5CjyG/QYUA=
X-Received: by 2002:a17:903:acf:b0:283:f19a:bffe with SMTP id d9443c01a7336-299f55124c7mr30296175ad.7.1763456002482;
        Tue, 18 Nov 2025 00:53:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcoigj6nRmQosnkr9rw7cE4rOAgwvqgwAmwXuwnDhgbXQFUN800KdqXpCambBMw3w8bspvJw==
X-Received: by 2002:a17:903:acf:b0:283:f19a:bffe with SMTP id d9443c01a7336-299f55124c7mr30295815ad.7.1763456001941;
        Tue, 18 Nov 2025 00:53:21 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:53:21 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:43 +0530
Subject: [PATCH v4 16/22] drm/msm/a8xx: Add support for Adreno 840 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-16-86eeb8e93fb6@oss.qualcomm.com>
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
In-Reply-To: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=11950;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PCP/73rSSP+ykkJPeuMAFzZS+FOfdS5f08zC1/lBMhU=;
 b=o196UqaMOhYMd+mFGaB+xFgRLYpNzuK/wnUeLsfmSQXTdBZvxO5CXuTtzTfsvadiApO5z3tSO
 r9FqfP90QUCDTKN6exT/XzJ7rC5erTLVXYGINbQhA1VmoiwmiEqng2B
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=AKSYvs3t c=1 sm=1 tr=0 ts=691c3403 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=82J8C9I9mNOd__THQbkA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX4etppL5Tjqvr
 gxGhQiEMLD4GLgBHjeojLk/IG6NBLifBvLnshZ0CkE5vOfxsf/uI7cxDY7ixBf8N6NlhJ4WoUMV
 DfZyG+0WLvYFHcToWHt5Z8JzmoddNPY86NMZlXIz3yks7c+wSRPbPS16u4Fh/wXPAlyVxu02sqU
 18323U6pzj9y+Iuzeqq4mEdw528eGVCWPn7HAHgJGQzeW4PrUzBIfGNi16Fh4l4tEUzipVQu7K1
 S9vrCscdfwrJ9ZENQ9OcXTjSS96bv8R4s24a7ZrqlEurSbVXV6LOkk8mJuCkXa91NfRE2RPoiFP
 IcA6eaKy3hMvsPawOzZqP8hjfRnitBEM1FuaQ0cvspKdgjsOGEcE2mFgCSppnrWxSUccbMgz/id
 jyQ6efWpY8dutKO8KU20aE1A2IVbaQ==
X-Proofpoint-ORIG-GUID: h8Og334kR1OL2l-56rnzJGmyQbwchDkM
X-Proofpoint-GUID: h8Og334kR1OL2l-56rnzJGmyQbwchDkM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069

Adreno 840 present in Kaanapali SoC is the second generation GPU in
A8x family. It comes in 2 variants with either 2 or 3 Slices. This is
in addition to the SKUs supported based on the GPU FMAX.

Add the necessary register configurations to the catalog and enable
support for it.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 159 +++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |   8 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   1 +
 drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   5 +
 5 files changed, 174 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 70433965c303..94ac792fb796 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1628,6 +1628,164 @@ static const struct adreno_info a7xx_gpus[] = {
 };
 DECLARE_ADRENO_GPULIST(a7xx);
 
+static const struct adreno_reglist_pipe a840_nonctxt_regs[] = {
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
+	/* Disable Dead Draw Merge scheme on RB-HLSQ */
+	{ REG_A6XX_RB_RBP_CNTL, BIT(5), BIT(PIPE_BV) | BIT(PIPE_BR) },
+	{ REG_A7XX_RB_CCU_CNTL, 0x00000068, BIT(PIPE_BR) },
+	/* Partially enable perf clear, Disable DINT to c/z be data forwarding */
+	{ REG_A7XX_RB_CCU_DBG_ECO_CNTL, 0x00002200, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_GC_GMEM_PROTECT, 0x12000000, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_RESOLVE_PREFETCH_CNTL, 0x00000007, BIT(PIPE_BR) },
+	{ REG_A8XX_RB_CMP_DBG_ECO_CNTL, 0x00004000, BIT(PIPE_BR) },
+	{ REG_A8XX_RBBM_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_SLICE_NC_MODE_CNTL, 0x00000001, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_POWER_UP_RESET_SW_OVERRIDE, 0x70809060, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_POWER_UP_RESET_SW_BV_OVERRIDE, 0x30000000, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL, 0x00000030, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_WAIT_IDLE_CLOCKS_CNTL2, 0x00000030, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_INTERFACE_HANG_INT_CNTL, 0x0fffffff, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_GBIF_CLIENT_QOS_CNTL, 0x22122212, BIT(PIPE_NONE) },
+	{ REG_A8XX_RBBM_CGC_P2S_CNTL, 0x00000040, BIT(PIPE_NONE) },
+	/* Disable mode_switch optimization in UMAS */
+	{ REG_A6XX_SP_CHICKEN_BITS, BIT(24) | BIT(26), BIT(PIPE_NONE) },
+	/* Disable LPAC large-LM mode */
+	{ REG_A8XX_SP_SS_CHICKEN_BITS_0, BIT(3), BIT(PIPE_NONE) },
+	/* Disable PS out of order retire */
+	{ REG_A7XX_SP_CHICKEN_BITS_2, 0x00c21800, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_CHICKEN_BITS_3, 0x00300000, BIT(PIPE_NONE) },
+	/* Disable SP2TP info attribute */
+	{ REG_A8XX_SP_CHICKEN_BITS_4, 0x00000002, BIT(PIPE_NONE) },
+	{ REG_A6XX_SP_PERFCTR_SHADER_MASK, 0x0000003f, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_HLSQ_DBG_ECO_CNTL, BIT(14), BIT(PIPE_NONE) },
+	/* Ignore HLSQ shared constant feedback from SP */
+	{ REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_1, BIT(17), BIT(PIPE_NONE) },
+	/* Disable CS dead batch merge */
+	{ REG_A7XX_SP_HLSQ_DBG_ECO_CNTL_2, BIT(24), BIT(PIPE_NONE) },
+	{ REG_A8XX_SP_HLSQ_DBG_ECO_CNTL_3, BIT(7), BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_HLSQ_TIMEOUT_THRESHOLD_DP, 0x00000080, BIT(PIPE_NONE) },
+	{ REG_A7XX_SP_READ_SEL, 0x0001ff00, BIT(PIPE_NONE) },
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL, 0x10100000, BIT(PIPE_NONE) },
+	/* BIT(26): Disable final clamp for bicubic filtering */
+	{ REG_A6XX_TPL1_DBG_ECO_CNTL1, 0x04000720, BIT(PIPE_NONE) },
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
+static const u32 a840_protect_regs[] = {
+	A6XX_PROTECT_RDONLY(0x00008, 0x039b),
+	A6XX_PROTECT_RDONLY(0x003b4, 0x008b),
+	A6XX_PROTECT_NORDWR(0x00440, 0x001f),
+	A6XX_PROTECT_RDONLY(0x00580, 0x005f),
+	A6XX_PROTECT_NORDWR(0x005e0, 0x011f),
+	A6XX_PROTECT_RDONLY(0x0074a, 0x0005),
+	A6XX_PROTECT_RDONLY(0x00759, 0x001b),
+	A6XX_PROTECT_NORDWR(0x00775, 0x000a),
+	A6XX_PROTECT_RDONLY(0x00789, 0x0000),
+	A6XX_PROTECT_RDONLY(0x0078c, 0x0013),
+	A6XX_PROTECT_NORDWR(0x00800, 0x0029),
+	A6XX_PROTECT_NORDWR(0x00837, 0x00af),
+	A6XX_PROTECT_RDONLY(0x008e7, 0x00c9),
+	A6XX_PROTECT_NORDWR(0x008ec, 0x00c3),
+	A6XX_PROTECT_NORDWR(0x009b1, 0x0250),
+	A6XX_PROTECT_NORDWR(0x00c07, 0x0008),
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
+	A6XX_PROTECT_NORDWR(0x0ae00, 0x0000),
+	A6XX_PROTECT_NORDWR(0x0ae02, 0x0004),
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
+	A6XX_PROTECT_NORDWR(0x27882, 0x0009),
+	A6XX_PROTECT_NORDWR(0x27c06, 0x0000),
+};
+DECLARE_ADRENO_PROTECT(a840_protect, 15);
+
+static const struct adreno_info a8xx_gpus[] = {
+	{
+		.chip_ids = ADRENO_CHIP_IDS(0x44050a01),
+		.family = ADRENO_8XX_GEN2,
+		.fw = {
+			[ADRENO_FW_SQE] = "gen80200_sqe.fw",
+			[ADRENO_FW_GMU] = "gen80200_gmu.bin",
+			[ADRENO_FW_AQE] = "gen80200_aqe.fw",
+		},
+		.gmem = 18 * SZ_1M,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
+			  ADRENO_QUIRK_HAS_HW_APRIV,
+		.funcs = &a8xx_gpu_funcs,
+		.a6xx = &(const struct a6xx_info) {
+			.protect = &a840_protect,
+			.nonctxt_reglist = a840_nonctxt_regs,
+			.max_slices = 3,
+			.gmu_chipid = 0x8020100,
+			.bcms = (const struct a6xx_bcm[]) {
+				{ .name = "SH0", .buswidth = 16 },
+				{ .name = "MC0", .buswidth = 4 },
+				{
+					.name = "ACV",
+					.fixed = true,
+					.perfmode = BIT(2),
+					.perfmode_bw = 10687500,
+				},
+				{ /* sentinel */ },
+			},
+		},
+		.preempt_record_size = 19708 * SZ_1K,
+	}
+};
+
+DECLARE_ADRENO_GPULIST(a8xx);
+
 static inline __always_unused void __build_asserts(void)
 {
 	BUILD_BUG_ON(a630_protect.count > a630_protect.count_max);
@@ -1635,4 +1793,5 @@ static inline __always_unused void __build_asserts(void)
 	BUILD_BUG_ON(a660_protect.count > a660_protect.count_max);
 	BUILD_BUG_ON(a690_protect.count > a690_protect.count_max);
 	BUILD_BUG_ON(a730_protect.count > a730_protect.count_max);
+	BUILD_BUG_ON(a840_protect.count > a840_protect.count_max);
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 5c30b3258165..d5e000676258 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -601,16 +601,22 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 
 static void a6xx_rpmh_stop(struct a6xx_gmu *gmu)
 {
+	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	u32 bitmask = BIT(16);
 	int ret;
 	u32 val;
 
 	if (test_and_clear_bit(GMU_STATUS_FW_START, &gmu->status))
 		return;
 
+	if (adreno_is_a840(adreno_gpu))
+		bitmask = BIT(30);
+
 	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1);
 
 	ret = gmu_poll_timeout_rscc(gmu, REG_A6XX_GPU_RSCC_RSC_STATUS0_DRV0,
-		val, val & (1 << 16), 100, 10000);
+		val, val & bitmask, 100, 10000);
 	if (ret)
 		DRM_DEV_ERROR(gmu->dev, "Unable to power off the GPU RSC\n");
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index 3a054fcdeb4a..0ec265d4b91a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -228,6 +228,7 @@ struct a7xx_cp_smmu_info {
 extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
 extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;
 extern const struct adreno_gpu_funcs a7xx_gpu_funcs;
+extern const struct adreno_gpu_funcs a8xx_gpu_funcs;
 
 static inline bool a6xx_has_gbif(struct adreno_gpu *gpu)
 {
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cb4113612b82..554d746f115b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -34,6 +34,7 @@ extern const struct adreno_gpulist a4xx_gpulist;
 extern const struct adreno_gpulist a5xx_gpulist;
 extern const struct adreno_gpulist a6xx_gpulist;
 extern const struct adreno_gpulist a7xx_gpulist;
+extern const struct adreno_gpulist a8xx_gpulist;
 
 static const struct adreno_gpulist *gpulists[] = {
 	&a2xx_gpulist,
@@ -42,6 +43,7 @@ static const struct adreno_gpulist *gpulists[] = {
 	&a5xx_gpulist,
 	&a6xx_gpulist,
 	&a7xx_gpulist,
+	&a8xx_gpulist,
 };
 
 static const struct adreno_info *adreno_info(uint32_t chip_id)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 0aca222c46bc..7a8cb1ea2a38 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -580,6 +580,11 @@ static inline int adreno_is_a8xx(struct adreno_gpu *gpu)
 	return gpu->info->family >= ADRENO_8XX_GEN1;
 }
 
+static inline int adreno_is_a840(struct adreno_gpu *gpu)
+{
+	return gpu->info->chip_ids[0] == 0x44050a01;
+}
+
 /* Put vm_start above 32b to catch issues with not setting xyz_BASE_HI */
 #define ADRENO_VM_START 0x100000000ULL
 u64 adreno_private_vm_size(struct msm_gpu *gpu);

-- 
2.51.0


