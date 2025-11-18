Return-Path: <linux-arm-msm+bounces-82204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB11AC6849E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 09:51:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 594012A4BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 08:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 471533009C7;
	Tue, 18 Nov 2025 08:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZbQn/brj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CsOu+f/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8697930AAB6
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455889; cv=none; b=LF1dfFh6i4knDLwtMggpgd/G8kiXvbUOoIRU+Oxp2ObGqA1BDeiQygpJ+wiEyffM//dLW8u9QetOeCC7WCIDB+dzbb6ngtx1WF140b+87dHymAkPpTIMXK8e7PuXG1EaKboT+8t4Tr6oKrZN6FxUyS1zZQCqN74Dg5+jPGggzek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455889; c=relaxed/simple;
	bh=75w/DSS2hsmQuGew0+oPiaGMUNyIZyrF4qSNr7xCjPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VuvLkqaYDMvn0+gAglzqH+65O9e0wAngpQ2pyPl6FPqgxYWrBwTLraDmcX6hC9h5/YXHpPIY3fDpdmovmUjfC0n8Q8mZcdsBzJDYJZMvUOgXL0Wj7jmm6qqhQhSLtGWHcUAg5xNVB2DFLpq0qF9kYuhcjQ8L2C9fQbANJmk4IsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZbQn/brj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsOu+f/N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6SxXe386625
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H4vCyzBAng103Oq0fMyz/UmnE+wwp6D/i+dL9/t/Pjo=; b=ZbQn/brjBhwoMCd/
	IXPswd+gdSg8ZixoZa5dJWsmP1Ku/zoA5LoC7BMJCRfwM0dL2cACyBXx/hP0dJNR
	w3gez8M0G3VQDwe0y9GX1ECUUhLBj43GfqOMriaOfD29Dgm4c5J3BEn+N1MYNSEe
	UmeJ9/fe9tXuwUhAJH3Vn9wGezXaxEMd2K96b+GZFFVPKpbBKdSVGFGDRkK2qIws
	c5F5qEGOddVkXdolc5LYbL+VBl7jBDAyAqRHr7vmCs68RP3IpaOevwTt4kEqlAMd
	2jQ3eF/DOGkCp4Rad4w59Y2nec+cy8oeqtvjQE8V7wkr26V4/+NJgzSuPy15ADCD
	8DBFMw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agag8hsw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 08:51:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29809acd049so90909485ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 00:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455885; x=1764060685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4vCyzBAng103Oq0fMyz/UmnE+wwp6D/i+dL9/t/Pjo=;
        b=CsOu+f/NBsjAVHzX9hxY0XPiofCx8tD3WnHFqNZGOJ/tta9TSesB2AYYE6n7cXwn3Y
         jXsBQbOCQgUDMj1WQ+D48F/Qx+UcJBFjvS1r4of0uwBOLGUBoAx0MXCD/e/vWfQ82W9b
         2Yppt50jSl7kBsWMsbI3vr7K+KlnMtmSOtI6K3bw0ERPYgrgMEbm5uGZvc3kr+0zr/F5
         s9vDNAx1XX8XZuUxEZZuTib0mWT4T5p8We7EPR8wuPua4yyBtKQ5Vi8tB0xpdRSRjrdI
         yysRB2f8md9om97u3NuYNzp4HGYmSABFBAWOreCd/BxDKWo1/7H5f0kUGRtomWyBTC6o
         H6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455885; x=1764060685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H4vCyzBAng103Oq0fMyz/UmnE+wwp6D/i+dL9/t/Pjo=;
        b=rq13OFprvFtBFLNUCx4Hpc1vdX+s5mSLfJ5uHRWo1lsBCILn/0r+3BN+t2A5MvM24c
         fE+XJE3JFTjgytEtMRchiXvGMJwHcSjDfBrBrf+7R73IwZbRXnn52xBEZJODL+ShmqAT
         fu/tYr0Rp5JwbYZXbYMq6Gh3VmvQxI3YTmmDvlGk0lwvKYg7CyQEqnSXUt8Ue3HGXrmn
         eSpNk5mcEjLuyy0ozfcZ1pwFRb5sTu83niS4MK8K1uca+hqf4TE/WOi0amgFr+nGrTKo
         Y7sy07HxP9AFrDgWx4l7Zj8cVimWUtPUMgM2hXIVAYq1tvRFWzcokH1UHCv/mcQKYWWC
         xg+w==
X-Gm-Message-State: AOJu0YyV5G3KHtDAjG3OalJmgxn0hStlifTB/cr9FphP6t2m5NlT7ion
	gdwodB+fXxLVzfqaBjDjhWZTmuWkMaWMu6AA1Iu8ILhgfXpeBKGHDiubchtgjYxKincUzqXco1Q
	u669l+i8/MlwZcc7G21HB/Mqqs5St9N0NLRzQM1W47Hn9VQaZCV8t7OqQ2YuM1e5r4WgI
X-Gm-Gg: ASbGncv1d+hNA6mBBYPZHm1H9sFrjv0vPXgNWf/bGI2U6nC3i+dqDryu7L1h4vYqRz0
	zWlkH81cLurSqw8I7JBPFLdWseahcc71RweTlBZjn/S+FH6dpj+JJHjyTMXpN7iS3+H56KwcZe9
	WNelGqq9mD+xk/qa4J7zRijgwzCfLR5Ga0EfgCU0iPCzrMNMf8jhudJt7ORYF9FEIY5IbuV8kdJ
	96etiIKJG1t+JwOY/Qk2r7VNVghrqxLquNfi1IPdlC1J34iMHjDOEeSyoSqMholCzPpoIN2zqok
	M3MEAmPOKW08zwh+ILS6nK4IbPAhd6PI5yZ08P5YhefzCKWJFoeB9V19JxLP5zr3vFfAo7cJs3J
	VTand2tj+S06BmbpOwJLAYfY=
X-Received: by 2002:a17:902:f603:b0:295:5b68:9967 with SMTP id d9443c01a7336-2986a752d17mr194313005ad.49.1763455885234;
        Tue, 18 Nov 2025 00:51:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFbC51hO2dOCARJAyGl+8Koi6W7aP2bRmpLcyj3T7XMY2HEbsh68c6kf4TSJcXeGL2xke4r6g==
X-Received: by 2002:a17:902:f603:b0:295:5b68:9967 with SMTP id d9443c01a7336-2986a752d17mr194312525ad.49.1763455884759;
        Tue, 18 Nov 2025 00:51:24 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:51:24 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 14:20:28 +0530
Subject: [PATCH v4 01/22] drm/msm/a6xx: Fix out of bound IO access in
 a6xx_get_gmu_registers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-kaana-gpu-support-v4-1-86eeb8e93fb6@oss.qualcomm.com>
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
        stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=1041;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=75w/DSS2hsmQuGew0+oPiaGMUNyIZyrF4qSNr7xCjPw=;
 b=jLipoeUTateSBD+g7vKKvS2yUCM4T7jj8HbWbcE3idzdOQIu0EPirauUiY3Is2Tzh/Nibkr/K
 97kGQ3WCvoMAzjLIS/xjcAXB0eXKO6+mlb+Pc7iuP/yIi+AHnbe11mu
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: _aZDPFzNpoKXERurcIIVoIfWR1gH5E14
X-Proofpoint-ORIG-GUID: _aZDPFzNpoKXERurcIIVoIfWR1gH5E14
X-Authority-Analysis: v=2.4 cv=G6sR0tk5 c=1 sm=1 tr=0 ts=691c338d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=PiXygW76SPkGC_ia2qEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX/1S6/fBfYwqQ
 8p//6on/7aJwcxaLu7N+HZL3DPAu05WCM0AabC0YWfNZiwoUPd3U10ujTEgLZ7rAKMZFoMRql90
 mAYHfC+dXW9ymFm78u8M0V/WxYdKs/fONwVxWUcyKeydTfGcuhy7kjaKCOLpQOi5bst5+JJNsIB
 JmuHfsuqQBXVs2onjv1Pkdh+AgwR4Xvn/DU8doR1/HthqWLbyK0DmsdCdAC+JIrlKVEJ7EIBvpu
 LFUvZ9qtC/B9mbDhZsFztb/r03PEK83tR7A/lJi6PgBw/FJxK1kNV3oIAs3qXqJ+9Uu3/M3ss6S
 OInabrEkpUAV8mHRxhDddeQ/qBQsifRahXKtRIbr0ToIzzCiRdQKFhpQ+1IJwc2eCe9NYEKJe3C
 kd2FJxfexCe2+KHNuCGf5dAHUnEnSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180069

REG_A6XX_GMU_AO_AHB_FENCE_CTRL register falls under GMU's register
range. So, use gmu_write() routines to write to this register.

Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
Cc: stable@vger.kernel.org
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 838150ff49ab..d2d6b2fd3cba 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -1255,7 +1255,7 @@ static void a6xx_get_gmu_registers(struct msm_gpu *gpu,
 		return;
 
 	/* Set the fence to ALLOW mode so we can access the registers */
-	gpu_write(gpu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_AO_AHB_FENCE_CTRL, 0);
 
 	_a6xx_get_gmu_registers(gpu, a6xx_state, &a6xx_gmu_reglist[2],
 		&a6xx_state->gmu_registers[3], false);

-- 
2.51.0


