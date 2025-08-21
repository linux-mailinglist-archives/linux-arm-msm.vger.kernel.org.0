Return-Path: <linux-arm-msm+bounces-70217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBC9B30273
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 20:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C13CE1CC690F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 18:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6881F7569;
	Thu, 21 Aug 2025 18:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F5m7PP76"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB47345726
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 18:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755802581; cv=none; b=KhlfUXDsu+d68YLCm5JRaFsI1knFOXUe0dhQmbwYocVpvU1HC9M1A39BUzM3gsHOL2vk53lTp4/rfgbUsiQTlsuvcCPxtP5s7AZy3BiiEFJjAq45803FiqrgHWycHb7bQdGudX9d/kdfyofht/kw6nND/Q2Svh4jJHl6ZBN75/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755802581; c=relaxed/simple;
	bh=dh5yRCCrqgo7ITPRxOGs22CFdqaavTKFG8dmxBRd41I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYT4jJITvTJ/dtTAubQbMVjQVrNaVYInO/hMtYWs4VXJ0sS8wwUKMRrkA/78vuAXDlaVSnhPkEcU3UNfl9N4wI4Kcfrt2XHP2AyiDgoTdpagZM+b9IARNv3IfRE0mAGwj2WUdqsJ54NQbQWPr7fA0jyYBaky9vU1f87wt3LCxU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F5m7PP76; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57LI9SuJ005729
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 18:56:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b2aaGGi9vgh1ezkBA9wTuECFddorJT4shW0GuOItXNs=; b=F5m7PP76e/eiqROC
	vH9TlsXcBMa8M91NDemycmNCAihQsQLASWEUqCp2o0y2hohDkUdhxUQx2zKT4uqe
	kU8cjQB5PsR4nEvu6hQJAnmzhHLDNX8KG+PXeCoY2kbLfu13JzBr7U4/C7KynRHO
	9DDygMSCV0AuBdA0y04UTLCHFbKYlyxM6sUKzdo3zMQOLz43Lqzb/xS46JJY5pav
	5g4IJ3Wa2zmxuVgy3W5FISh/bzXr6vohl8DNmkaPLKstKXS67hXF36qCeqh17dCf
	8PwX/OYICINDfKkAZekxKU6I7jvLE/uXF3pwMPnc+eImw1OoDrsPqQpLFzAJGCbv
	twpptg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cpj45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 18:56:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b47174b2582so2215703a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 11:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755802578; x=1756407378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2aaGGi9vgh1ezkBA9wTuECFddorJT4shW0GuOItXNs=;
        b=CC0ah+9Diw6RHqox/R96XuKOnUINrkJZtLYK6lANdAw+fD6MkKRkmbwvJujMJvXhvK
         Es/il9O3SarhKuHZ0PbjCdNJsW8eVDR0zijF7zoQecpcusx2dIGlPMVweT262guJ07Ji
         qVLpLVfoG8PxQGuwYwnQfqBKRYM9q9f4ztTqc1MQf/BJRePIeWeWCBTAjhOOgyrI16Nz
         DLGw0ylIDwJPqfOqyTinhSj0tLJ+J6tI4NpwZgbuaeQ8eS/UXFx8nRPeMoZwbtDr/+77
         /q6xNNWKLqjjWWxu32ygDewiRn6ko7Hfy3OG7cauEdyoCeFc00pqqJVTMPS+l77Ny1hh
         z+7A==
X-Forwarded-Encrypted: i=1; AJvYcCUEDiw+vssoKNz5fnZghOS+gYkqL94LUZeNaCLHpaMeFBhT6OY1JgIWuT/y1+2SZQnMwgBQpqVvHirZImaQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8nBw1UXIgnktrxZ6JDUu3ncix+1v61hvBIhH9CGWIT8SlxqPG
	hpmzCAYQ4cV/hAqu8aHRIV76HRXpy1hHXpmmOPGSXhtaOfJLyxYzrPGVS/gqyeJJOGbqpFqU/hn
	ZeX5mZkkpAKBd7m8BSP64+7qv39VxkaHb0coVDot7Wt5X9RyBzB7IQGrEI2fjG5y/F45I
X-Gm-Gg: ASbGncvWkQoirtaAQJjLngNWuc2nNW8V1Hbk6OOugJ82ANBOzroBEQ77NZKQwcBqeSr
	AVguTGWq9sstRCjFvEJjYedlaalCoZUl5nnpw4yymLfLk0GlJUe4wk5tdK6WuRWsRPeRQiiyPpx
	iEF5bvj5edrKWPhhWEKLfcSFz0/+82g0iae4y5sFhOQjwpQW8Gkc3ILE4RoFIvgXuwEBdFQ8ill
	gv/9yoLyltvNH22oQjMpv/SY7lCh42P+S0W3+Hv27QAkFKKfphpFuxg90z1hFzU9GHDFxSX4B5/
	lyyJ6oz0fN9y/Ac1Ap0WztswZD2rYhEfFDu6kE73U8Ad3v2kIm5rkw/OD/h+3BYK
X-Received: by 2002:a05:6a20:a11e:b0:240:1bdb:bed2 with SMTP id adf61e73a8af0-24340e1c5e9mr249952637.32.1755802578289;
        Thu, 21 Aug 2025 11:56:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/PvcztiKQ3+ysLQC44wdzL2nnd84bffnnBw7HXxvb3QajRBbw4ri6k6aeKp1I8dqHAddoNg==
X-Received: by 2002:a05:6a20:a11e:b0:240:1bdb:bed2 with SMTP id adf61e73a8af0-24340e1c5e9mr249926637.32.1755802577894;
        Thu, 21 Aug 2025 11:56:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4764090b0esm2106977a12.37.2025.08.21.11.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 11:56:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 00:25:26 +0530
Subject: [PATCH v4 1/6] drm/msm/adreno: Add speedbins for A663 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-a663-gpu-support-v4-1-97d26bb2144e@oss.qualcomm.com>
References: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
In-Reply-To: <20250822-a663-gpu-support-v4-0-97d26bb2144e@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755802565; l=831;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=dh5yRCCrqgo7ITPRxOGs22CFdqaavTKFG8dmxBRd41I=;
 b=/5kTakfykQ3AmdnUdoMQ4AB9+wrpS6Sg4icxX7Pn8G4w06qjqaLrqdMWxoFfR2c6gCf1yXHzU
 hcJfMlyo44VADh1a3HtlGxlKxaAgKW+a2+/QdkolNcZo5tFG1ddh8Ea
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: FMELyv1giryTfgHIhV210ASqgTOATqoy
X-Proofpoint-ORIG-GUID: FMELyv1giryTfgHIhV210ASqgTOATqoy
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a76bd3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=HtRe1b87dyxWHwbGPHEA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX2IyRIW6CRNHz
 7tfqDZFXoUKLiEz8US9aOMm1S59zBgYMPryhHj7UwL9v5zI1zKr98gXGinXcaIu834TFVHMVXM6
 lmfMkb2TE2jgbmZHHFsrysw7kfAJDl3AiZq/DbrysmCDg0cLIl4mOB4Z/htdG90JN7BEpsIWLkP
 tonD0MrrB8kZOTXasZvOQRtySZC0adL3rXmXq5t8QIoBpj+cpkdptdEdLnJpZIGYxOJJ1ueCLYx
 fQw8RkyrmxHlb0lE2rAkcam0+RC+DclNiLBaSElSwcA1iBD9uVkaBHRYTaswtD2+RDdN97X7DWb
 SRJ8VeM4eGJS/FRR44dAZOlO8p8i0gR+R7bX10Y8Gn/a8ErXpqZ2ghphzuJ0Sf0tGdPWaQyefme
 WEGm70PmX+W4qK8QUzneyMsiPGTMYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add speedbin mappings for A663 GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..2b1c41f6cfeee912ba59f00c1beb4a43f0914796 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1024,6 +1024,11 @@ static const struct adreno_info a6xx_gpus[] = {
 			.gmu_cgc_mode = 0x00020200,
 			.prim_fifo_threshold = 0x00300200,
 		},
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0,   0 },
+			{ 169, 0 },
+			{ 113, 1 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x06030500),
 		.family = ADRENO_6XX_GEN4,

-- 
2.50.1


