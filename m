Return-Path: <linux-arm-msm+bounces-81729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B5314C5A9FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 00:35:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0BC96356F21
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 23:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4A2933469F;
	Thu, 13 Nov 2025 23:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCI3DWmi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M644Nsau"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AD2334369
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763076703; cv=none; b=qYx4B4EdaWzIm5KtlK9mj6nJ7mijjfVh+9aSvTfxw+sWcX9h7SI0Aw7fJ/wkyQKoTTdAKaDSl2MxeDxlsAeEEg9UfkFM6T3pV++1aTIQjwyW3Odg96jW2rVlw1euy3HjBYrqphyoN91il7XX661+9ugjLeP3rmQG1xw5vx5RzaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763076703; c=relaxed/simple;
	bh=VoMSmXcFY6Ci/zNRlgtJuWw7PHMfGCGigcqeiE11YkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QsxgwhCAX5ogKkpShnRtSLFRhkcLucUcD4aVF2FMVZmVN5iOIiXw0di/eenn+/DPkI1u6HIGz1Nwz8YQlts7cfXEEET3/QOyM73TRygr9hhz11obWOiOmIXCp0oZfO//DEvWfy8w7BzBgFhq9edw2J2SuSDWp+b0/qKlT53RdIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCI3DWmi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M644Nsau; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMavJv1613139
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wC38AEKsD3B7V8rZLKYwhDs85k+BOEGh6Uc6s9U4RNU=; b=KCI3DWmiRHSkMGBQ
	6M6g6lQZ3WsjDBfx2Gg+rpXnJyqH9FDyIkykvkCzzqNBQPWUEj3uu4odvFs2ynmI
	I7hEYK/8LKzUo2B2kKWeu4qBKolm5XZZXKfNea9OGxuvX8vDZoS/TNRZMWEHMDcm
	iQh5cVWtboLDllQIRCkgY+6lCY4ni4wI+xW8ZGwXnka02rNSAGgacckQOqtJVAR5
	ldRjWT04+xMKi02UaQtkJ5TKxNvPfxqVaoFwd/mg8rQfyeWN2knwv7YZwoWHiNgG
	oCnGYqPuwFlqQpzmElKN8D/Gae8cruuJr2kG48RRqeEwIUwedcRPv/5qHr+gdqXw
	4xZtvQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9h044w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:31:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b8b79cbd76so1161866b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 15:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076699; x=1763681499; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wC38AEKsD3B7V8rZLKYwhDs85k+BOEGh6Uc6s9U4RNU=;
        b=M644NsaughxTrDffFG4pZTIfnaygUtC5ikTsa/xnxVD+shfwfQztkwtvv22UU4ai72
         c107jgDRE+RVGfXN5vFitlm/41EqfeToTIjmOuvIQufJ6tULg/igOYClzqjPFHdDCiYN
         XwKp9SgYeIibz3dx18n32ChUkw0N54/BbQ1O3FMJft8sIdsfMZhdYqRLL1W5ATun2n5l
         L+X2Q0NcdUnBisGQ0A6lb5SOXRUuudymS9V1ObbIsNAJ78Bcqfj3E1GATeFEX8Xpczm/
         tdyFULBFVmPLP3BKIPiz9bPZp6CO4Ke9ZaPL+kt/JGfVwPvzVWfglN50Q5Efpk3Ntm8b
         ULWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076699; x=1763681499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wC38AEKsD3B7V8rZLKYwhDs85k+BOEGh6Uc6s9U4RNU=;
        b=wIF7oWVqwsHsvJ5Ug4Xz3ws312x1YFjIwI7woRILctilBeAPECvTd7jjstL4vuJMxl
         PIlEvfTm0b9vASKa3Op++oePUnXZutazXRuKFTOhcFXJUirAsQJWOS5ooRV2pBSn5TRy
         e0Rw+0k6QdDyp2MsG422CaZAquHemZvhTSw/7eV85IBhZWFCzhh2Hq+jnHsAP/ORwytu
         41D6Z2YGcJxcAcBJDK7mv2a9LZFFP04/hKCfdJVvhFdwJ0XTHdaeCtiH09QoOCA4h4aj
         YmYhsdOo7ojcdp1zr35OXbr9pRZxy9szZjEvAieGKYzSraWimsop7Ktc3GpVOMOYhne9
         uGgw==
X-Gm-Message-State: AOJu0YwRMCmtWfWNj3Up/fb7CGS2ac2Khds4ggeTslLWPUKciaYA0Y3U
	BtDXPK9c6yGEAwvUsREpppt5pJoFs3kGyelEXCWXrmwdaeYJHZkjySyCAajlF5GGYJ1WkGwsiXC
	Eat+WG+/zcrTlozER2hmy3IV5y04ZSr+VKfyqw0Mtgsh1nG1u5gSiTrfoc1R/t3foUdM3
X-Gm-Gg: ASbGnculk8GyAhjxOGq6i47bezvPszjCZmDtDDkcMLVLb3zQgm8EHrDQXmOimZ7I3SC
	VUbl00rSeSc3Gtj6ABwEwQtMcshnhpcd3DjZcZpQqWLAo1eq97NjUNWXUgMBk8sFilW/lx9L+ni
	yH+OpEVOaLJ1etL06LZS56RYqFzI9fCgStJHlKQeckJUUzzHUdZ36krIFjSoRqGCtrKQinTKI3w
	n+Yv8rTpIwAqxj2jN81uGKn0X2Jkd8YvhFc6KHY77VU2PL0JBJybAXEqlpi2FCjqA0q0aWtjA5W
	kvoCP8t17X+XuagrdGrKFNs7vky3REPUE8yaNpg3SA+yJms+l0pWyBtuZuvQGfgTNbFg2WPgBNk
	dp2ygMKW5+NIGLkHSMKLAQNw=
X-Received: by 2002:a05:6a20:a12a:b0:346:3d90:84dd with SMTP id adf61e73a8af0-35a4eb00800mr6204685637.1.1763076699063;
        Thu, 13 Nov 2025 15:31:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENxctPrldxOzif92GoKD1y226rUWYijcY2LHFhHQxQgNVexu1y+n7SMd0KMvvv7QIY55c87g==
X-Received: by 2002:a05:6a20:a12a:b0:346:3d90:84dd with SMTP id adf61e73a8af0-35a4eb00800mr6204650637.1.1763076698423;
        Thu, 13 Nov 2025 15:31:38 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:31:38 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:59:12 +0530
Subject: [PATCH v3 15/20] drm/msm/a8xx: Add support for Adreno 840 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-15-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076574; l=11950;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=VoMSmXcFY6Ci/zNRlgtJuWw7PHMfGCGigcqeiE11YkE=;
 b=p7nfQezwkSIlUQt2OHpwucF0IBGfvH+KH9X9CRncs4jopUorvIgLumSwcBETxBTAl855w8ZaL
 6w4ZDJsot2hCxZXudCutoHZBzS34d+uEr4vA8xRAwcvrphJ+6lHOk2J
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: _2I4TKsHm8Hyi93AdFWhISKRQ44c7foo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfXzm/nZtfr2zfk
 bwNMYAHWZl9T++8ZSMxBlGIVPuq5DJ4PkzcA3n3QxSCCBd/lP45C/JqrmTe9uAgzxniYyJSutTy
 YCmOEh0b9fa1UeCsgC7RV2mu+1Nu/qz6Mzpoc47EXQHcQoRYImClxcjF5n5DICElOLXXMTIMH0f
 wBXkE5MUbH7xHMPfGo9XhCvx4Be8qMZo1rvP1cF4EsSSWFu91gZSzJcELciwy17WY8WAvI0VlZs
 yLzvSq+Sib50pVw4kSrKFHOnwx0S1jQBmUZyNsTHhmxDQWRw3M3UuDEQuwqjUjDenM9+g861+JC
 38AQcf6G+hLf9AlT+N5ynQIhOKbYrfNzrLQcUuj9668SSogg1w9RYS4D0gKla0LvRUABsy/KGVs
 WFHo/97EvE5onkTpQzyhvfmHBEFg5A==
X-Proofpoint-GUID: _2I4TKsHm8Hyi93AdFWhISKRQ44c7foo
X-Authority-Analysis: v=2.4 cv=V+1wEOni c=1 sm=1 tr=0 ts=69166a5c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=82J8C9I9mNOd__THQbkA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185

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
index 9007a0e82a59..ffd977cc4ea5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1612,6 +1612,164 @@ static const struct adreno_info a7xx_gpus[] = {
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
@@ -1619,4 +1777,5 @@ static inline __always_unused void __build_asserts(void)
 	BUILD_BUG_ON(a660_protect.count > a660_protect.count_max);
 	BUILD_BUG_ON(a690_protect.count > a690_protect.count_max);
 	BUILD_BUG_ON(a730_protect.count > a730_protect.count_max);
+	BUILD_BUG_ON(a840_protect.count > a840_protect.count_max);
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 3b4f05430ebe..063dfc392b9d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -575,16 +575,22 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 
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
index edf1f6624c31..450e655f59a4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -568,6 +568,11 @@ static inline int adreno_is_a8xx(struct adreno_gpu *gpu)
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


