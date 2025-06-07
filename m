Return-Path: <linux-arm-msm+bounces-60513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67371AD0DD8
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 16:16:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90A8D3A3968
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Jun 2025 14:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06AABCA5A;
	Sat,  7 Jun 2025 14:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZGHI5nL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B931D5CFE
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Jun 2025 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749305751; cv=none; b=d4rEIGX2D+8UXaQtllDKzRbjleJacTK/GN1ytOYJlUttbBzgySmx7yu6CY1ghgeUmLOYapagwElMc0ccboobp9+jmxTwHa26hR5eMSqIueIt9rV3DgFXMM3oghFgDFwg0CrsraoBSSyxeXd2wbpvPyNQVIR9DpNNM9INLPNYl9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749305751; c=relaxed/simple;
	bh=IqnVoqmB8d59JEJdsGY4n78aKgioKIUNfsYGLkBpCCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g47fVCt90egjxcwjHQVwI4cARWhEu/fITHbkSp/QUVIei8F9T6raeCMsofMGxsJ86IoYNXTMQxgmsxRyT5jVawrpxRFnX6+PsXB4p0Bqo9Hq+vboJLYWyUdb4XN9ZDKBkRr43n2Y0S8q3Ng5dFrSIPGF5qG6DDSwvH4ebcisAjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZGHI5nL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 557DOA76027643
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Jun 2025 14:15:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e2nJaAzmCmJpQHSs08XFmrbpQ14EhvsPNPiNTSQUelY=; b=jZGHI5nLZI5hGMaR
	gCxGHxaLP5Y1D1HwZx4aiDNjMae6QwfLi6XgAto57v8VLKsrSKKy9SoH8h5Oktao
	fp6lEIqMepF7jpd7hthOuLbX/BdQsJPvrWBsIfuoAFj9K8TfmuS9jqL8QGNBqqXK
	l0EPCW59iAYf0tYwu5HUujjbGDVLK1dS70Dq2Abw8lArFp2/kfQbYsLX4x94tOmx
	a5u+RAeupT5VKJ4c8/aYfvTMJI6sK3bhWoukt91F2ncPswKdDCYdptPU4Bx2aa+T
	VW3W1AeJsWzU6e6CgZv211VygoZ1F5EzRbb8yQOlW6qfvfvIfJtY1tZYej1dZU0U
	pkg75w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474e6j8m57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 14:15:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2355651d204so28049605ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Jun 2025 07:15:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749305749; x=1749910549;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2nJaAzmCmJpQHSs08XFmrbpQ14EhvsPNPiNTSQUelY=;
        b=C6HI6PwqrnaoGjuaO7C2i2c3/ILqFciSnixCzDW6miu2SSZcviuLJ54dfeqgKEcV/l
         K5jt31MAoxbW36Ze+SQC1RQsbfvshZu8Dmj+kiEB118bKo118xcX9jyT1kVuFw7Cd7nC
         JR1g3m29Pk0KZYVjkPwAsaHHkKk7pBiacHWEzPjASSkRl77pWeZPCfrH+FYiQnp3DU05
         LyWWHqo1vkLOlE2PbBVPB0gJV2VjqkiLGJeb9PLW9HVTosbayrTRDLGiIh8wh/dtv3+z
         mI+u08TqWSl2u6JjrAWY0eupDoOBI72aqljBgfcB0Kvs0HrurqOabzRzpRAz6wWwNc83
         c2Pw==
X-Forwarded-Encrypted: i=1; AJvYcCVl8jtKouKZIU730xsf9IhDWpOViPqC4ljO9XYvYJhveO0tZS47VPCs2RIp4Z+9JtoVYroSPjdlUoOfqvMM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1qyX2eA6iCzTaQXIx36LUHQQaqSTTRYYm2DFbhQGeCVV0kbpT
	6eYO19C8Gr83E3xmWmN4CxUrYFAJYFQim9bt6qnVDfcuQBN2MreRB6xxRTFnkL4dy7V6fBUjTpc
	l8odhduRVQ0Bdmvt86R9aBZIlpPNwhUp2CvgoSau8vGsWRtXP0T7fpWU8BYOO1uESDXIo
X-Gm-Gg: ASbGncuyX5b8RT3YEt+CFWBT9bOkaQnqChNk/4Fua+6TuvYWp5GSW5FR4hb9L/z987F
	yaX0nmKHSl5sk6/9TQPU9l4j6Ufrpp2bnAtk6gvKoIKjUlwBT+NzvO3PrNdeP6MtEwGR5QJ2tCd
	lBpoIA326mciNsoqe1gF1ecwcNKthJJjPIT1JP8bTYfIzlgANpt+gdtztUtyX8N7BTNOBYnqOGo
	PuWXDLEMbr/6+IqWAiHJ14hEcUN1Gu+CWKFCN4aYcQwqd8PIJPEtIGIF3sBdBygKto+ax65W9fJ
	PmnVWrfZ1Vnt40ru6aSIJICrLMLwGeyN
X-Received: by 2002:a17:902:da8c:b0:234:d7b2:2aa9 with SMTP id d9443c01a7336-23601e7f4eamr98882235ad.29.1749305748842;
        Sat, 07 Jun 2025 07:15:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHd4AhO0+uyFenbxz5BoU1UkltM+5rAvhX1ayslAlVrN/dKMNnxfksMZHw0Th/YAjYimUSGQ==
X-Received: by 2002:a17:902:da8c:b0:234:d7b2:2aa9 with SMTP id d9443c01a7336-23601e7f4eamr98881805ad.29.1749305748452;
        Sat, 07 Jun 2025 07:15:48 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603405732sm27500435ad.155.2025.06.07.07.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 07:15:48 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 07 Jun 2025 19:44:59 +0530
Subject: [PATCH 1/3] arm64: defconfig: Enable X1P42100_GPUCC driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-x1p-adreno-v1-1-a8ea80f3b18b@oss.qualcomm.com>
References: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
In-Reply-To: <20250607-x1p-adreno-v1-0-a8ea80f3b18b@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749305735; l=768;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=IqnVoqmB8d59JEJdsGY4n78aKgioKIUNfsYGLkBpCCY=;
 b=orMoZgj6M4ufoVDkueL+fO7/LhI5JIhY3qZdqVDmIqEE50/Kj3kw5xT+6x+14Co9K5qyeq0t5
 mqNkL9pGnTGCbInzyOTHDsuUrJiX9j4N5pxuICrEcKGcCO12weAfn8F
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Id6HWXqa c=1 sm=1 tr=0 ts=68444995 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1cELwbfB7FenbO21xW0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: FlJPuNdxAat1p7heADuJqrOVehrWhDYy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDEwMiBTYWx0ZWRfXyTuolW+cW8Uk
 J+FDIR/foITKA2PoloYxDByfuhmEF1DV3T0OAf8ctC4/OatdZZwfZiKTDWCJ7BpqeJ+j65BYQD4
 PcyQLbMndH0znd1j60DUCzSNR5nkrQj2bjrtPyV54AvAhobtzA5ufyoSgMZXLSeAyFBu0XVR/AJ
 LIQBmgM0yxpQ3immY/Yob7kvIWzLD7EqlKOEXUiDIVXy++9F/wUzyJbf5XdeYCnKtubnbbi7L75
 DOLxgAnBB6oDU/YoUBT3ENg51N9E19DfOBZwjLRksUV2HntuAhbEUCzY+Bai2walfU2FwCH2rxe
 veRHgoG1WILI6yXlif5jpGurLAvBRiN7QfxQGLLcfcuxw+UXaye++es9adfQc0CuVNyK/2DH9ss
 GwJA+RfIcZx5bOIlsETH8ArDBOPUjiark3CQoIhoJBQbjR60laq63jtrh7Ek5VRWSNy/bNaZ
X-Proofpoint-GUID: FlJPuNdxAat1p7heADuJqrOVehrWhDYy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 malwarescore=0 mlxlogscore=595
 clxscore=1011 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506070102

In order to enable GPU support in Snapdragon X1P42100
(8 CPU core version), enable X1P42100 GPUCC driver as a module.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 62d3c87858e1817bac291780dff3823dacd72510..9cc473fd0d3308f7869d00425e17b114c87093b2 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1350,6 +1350,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
+CONFIG_CLK_X1P42100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y

-- 
2.48.1


