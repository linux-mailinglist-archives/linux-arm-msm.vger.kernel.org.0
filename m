Return-Path: <linux-arm-msm+bounces-59127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EC9AC14BF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57BE57BBEC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:11:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1E02C2AC2;
	Thu, 22 May 2025 19:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpMwAvY8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AF22C2AA8
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940690; cv=none; b=lh2vy/0MmWkH7Q6VhnINZHDRbWP1dKqH94xlXOh4uuM3eC/PRyb/U4cai0MufS8hWLu5UDAnCgaBK1FqITZe3F8Vf6LAgiw6t8U2ybA41pyTewe/MZysHapxx8x7GuKP3L7YDflusMjUhBL3yAQUCR2EyoI2aBEl8DAaRO1DzT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940690; c=relaxed/simple;
	bh=qx/3iDx8aDBw5InHILUUHiX+VU9a2n8/qKew1Bth8fo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nzTVy7gpVHPthR/Ijq5yxHoTY2HDNOiNloWPpsFYXnb1AN8NXG92TMaFH+GH3ESlHfcLfNsCFp1Z4QVAzQsilOHcv/nY48z/a5+IcIfEVhGGLOe330yUUFZgiAtVNGEAExlWE3s3r/dfnc7V4BvuooFJnT8931w8aMfq2LsFoE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpMwAvY8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFXuXg020943
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Cp8/lz9YYtxNtZJAqucfpXh+wcoh0tWxSqCU4G/8fo=; b=mpMwAvY8Kbtk9Siy
	36gcy4h7XdYCkuK8qAUJnXVa2/IUrMO35cAoGacEebLntwL9Z6BF5JGyi+6Gmtvj
	gh2XwZjygVKDokL7/Iv4KOMlvMxZVn4d2UMavyPzotUuUjG98ejtgDjO5ig3iBXk
	9zGPPx22jppwsjcbKoVmfRNAvunADZ6FLvLxTHPkt6AMVhbfpmMISL1ojmo6G8+8
	Zn0kPlqlsF62EyGd9Tf2IGdY1IJnQel6ECVFu8cGuoTUmLIkveEI4hBxZkCLdn5J
	dn1bxqMlzzknLajU5I/BybAlrWTtBAg0q0C1tcMFBhrMY2JipBfKWbkfDo/wNkKA
	qvOj7A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf07nyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5b9333642so1020485485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940685; x=1748545485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Cp8/lz9YYtxNtZJAqucfpXh+wcoh0tWxSqCU4G/8fo=;
        b=EZrLeT7gzzHbdC9JLZEAP09fSGbhRIFMLmr2CDUyE5RpsmBwfeYUUC9eFHZvnY1BZz
         xAoTUyLZA8Tsd3J2t0cchFBG6DLGpE9WPXc+7ei8C/jVyNwrLZJiZxaQuvlyInB1yqpt
         WpgECHlDPdSkscNV22lj4RSjCQmGUnGOxV5ozpqAv0FMvPqFhlyoVwqq3EdEaIpYRJFU
         Be6IFS3k85kaajsK5gQoEfIus1lZ3FNUFRZaGaE3DNOXFC8jzBYjqtiWX8nX+22O8H7Q
         ydicbtsNRqATz9iOyywwAe9mYTUwTVLoOAQ+H4YSPmFRzpA2+IK/xhw3HHo/498QYo3u
         FVbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdJuz8UmMSGK9ppz9dEiZ9t+lfsNUTnJ8WcenJOlMS5nGe554jJ7vaefff9PRV7Z476bQgDjYK2kj5DpWS@vger.kernel.org
X-Gm-Message-State: AOJu0YwJwahnb8quMCbpsQiT2efcYVHA3cQlEf+fx6/eIiXUlaeFFzlp
	02gafzePcFv77uMjDFlcsREVszslhcHTkOhr8nil0lwi2OBPRD4ic4NN6xwXleRyoR0hFeKhV4Z
	K2zKA9ChE+riwyP4S1SOIrb0tc2YhdyqFCFiHEK0r/KYkUyf1pLfNzIdfycx77W7Scgzb
X-Gm-Gg: ASbGncvfMBEUH+VZ0GObj3AtifzYnvTMTqhFMg56MzbpHiZjME1mQK136hZcWJ/sgvj
	8sp2XU1dKhNkUV59R+g+63hMD3v51AWS78L/DJKEuENXyWpIcIijpNDRY7//eZ2suh6RhL8pUCo
	G52t5spm8YmzWZUhyJ0+c4Jj1FdsNqsSGkmXBEFouPNZtzA56KgA9M+47rg4W5h5GJci3pL/U1R
	ohDxrU96/eTAeetnYmAVyfc/KPTaRQkLh/A5HDotIE1pThB+D7JulpDww68YGn3ZppzEBXeNb4K
	wcS0oqXDOwPXB2dudhHlMZ1mytxma8SkFa2aHqw5IZ+GxDUM5q82zMfXw6V1fZaZdtFJawozxYY
	QCo5tyNPfm4OoPYE8ZD8mguj8
X-Received: by 2002:a05:620a:414c:b0:7ce:b4d4:395a with SMTP id af79cd13be357-7cee31e6baemr10234485a.18.1747940684853;
        Thu, 22 May 2025 12:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiVdkCzYsxrVdumQrpvbGRjuzFrEGFDwfTitkYuUDK8W2nhJnkHgOjevAfE7fTTd+TfV8tsw==
X-Received: by 2002:a05:620a:414c:b0:7ce:b4d4:395a with SMTP id af79cd13be357-7cee31e6baemr10230185a.18.1747940684427;
        Thu, 22 May 2025 12:04:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:43 +0300
Subject: [PATCH v5 24/30] drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-24-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9063;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i8JmTvononL4yoOyQq3OE4pr9KSmd4HWeSbiGbGi6Lc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T/VN74XJeqizypfRlT4+bopo/Izij231x2D
 Sx44ZClovSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/wAKCRCLPIo+Aiko
 1YzvB/9wOzwod0+pSlghLwWxQCy4piJy5vlwBYaPjgnAQln0CiqMk9kjGN5PzZTqERS9MmPg+Bx
 sbpDwh1+g1HuLfGPG99Q2WoeFhnWqkXWVMtFCAMW3ivVPteeI+zWGa6ZQ9as10Exv/SEztpsD1v
 0+Mq/xpubgGu2k5rIPVb10eUfypXyAc4CL3FAgD8WEy6urMvmIggnEoY+Jf9vJA7S63CdjwbsZH
 EVDQkbReYRO8WomY7XK2fLQXoG4JGl6//vJeOj3IhO0vrJz+Ik/EH0L8IELlq7rOQ6N+P1wZxJY
 2eYsKVY0qOsdufkcBnapiJnvVoMk0wedJTp1G7QP7WH0zSHs
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: sqJnSwK1V-DvqlPIj3aEzCglL_DZHk7Z
X-Proofpoint-ORIG-GUID: sqJnSwK1V-DvqlPIj3aEzCglL_DZHk7Z
X-Authority-Analysis: v=2.4 cv=ZP3XmW7b c=1 sm=1 tr=0 ts=682f754e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Vb8ASh8KX3Dd0k_o0G4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX2NcLtmnSnQel
 LL9hOEVndz5CA07wWK7kMduseazRE+PaorTz/3tqeXOE3eJiF6dKkvpgYBkqwYeB8GAsRVxMvXZ
 p6OoA34KKBbsmbzsVf5nWwLhcY2P3KL4Q/HJYCeF5ZZaQuJWX65Cdu0UdkslFTJehBvhfLwC7Mg
 oJOw/NTRKbekMdL/y6PT03gHrMo91enwYIuROf4CzIDQ5BBZVjbcN1NcJfIKQ71iIVwRKDnj+o2
 c/RiIe+LHEEgr7tDHuyHfH+8XmNWUmCgomrBqRDMBC0awiXAGIPwoiXMPWwnfDOwM9PipR/glhQ
 s3UdDTVmuTWQhJJ67AxifzoahuI/7b2Axv6FoPYsclkXVZslTs33VO+1rw3iKSmfbKMXATE/+kO
 WSDpSTkM1mkz2k3tHg3Q7qmg947Zo4Vl32uLqLs9vzJvZablwgfu+/Y+Nx7K6fNh3VATdfnc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 impostorscore=0 phishscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_DSC_OUTPUT_CTRL feature bit with the core_major_ver >= 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c              | 6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h              | 3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                  | 2 +-
 10 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 8e37c40620b62aacdcb47c7a04bcfce944ab0b4c..5d3b864d28a86fb86fc4576210c9418604afd844 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -259,19 +259,15 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index a05d2ef8fc9d217898b8c12d4639563b28b4477b..a6e9dfc583f283d752545b3f700c3d509e2a2965 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -259,27 +259,21 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_4", .id = DSC_4,
 		.base = 0x81000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_5", .id = DSC_5,
 		.base = 0x81400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index cb0b5687b5239418f50c539447f9cfa56e81fcc6..fe9c9301e3d9d2d3a0a34ab9aed0f307d08c34ca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -193,11 +193,9 @@ static const struct dpu_dsc_cfg sm7150_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 17fa0ef9ac03e4649a218cd837b296211ef4506c..9ceff398fd6f554085440f509b6f8398b4fbf304 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -258,19 +258,15 @@ static const struct dpu_dsc_cfg sm8250_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_1", .id = DSC_1,
 		.base = 0x80400, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_2", .id = DSC_2,
 		.base = 0x80800, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	}, {
 		.name = "dsc_3", .id = DSC_3,
 		.base = 0x80c00, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 06bcaf4d8b0db74c349112af6884f7f3139a7ff8..a46e9e3ff565ba5ef233af76f1c6cebb1d0c318a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -135,7 +135,6 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 9c4e8450b67760c880d9bd2528c6a954a0282e08..98190ee7ec7aca6835376b030379a5a3d8b0859b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -87,7 +87,6 @@ static const struct dpu_dsc_cfg sm6375_dsc[] = {
 	{
 		.name = "dsc_0", .id = DSC_0,
 		.base = 0x80000, .len = 0x140,
-		.features = BIT(DPU_DSC_OUTPUT_CTRL),
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 01430ff90ab0988bdaa91b85458dd649aab543b3..41906dadff5a8ef39b2e90f3e80bb699a5cf59b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -174,14 +174,11 @@ enum {
 
 /**
  * DSC sub-blocks/features
- * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
- *                            the pixel output from this DSC.
  * @DPU_DSC_NATIVE_42x_EN     Supports NATIVE_422_EN and NATIVE_420_EN encoding
  * @DPU_DSC_MAX
  */
 enum {
-	DPU_DSC_OUTPUT_CTRL = 0x1,
-	DPU_DSC_NATIVE_42x_EN,
+	DPU_DSC_NATIVE_42x_EN = 0x1,
 	DPU_DSC_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index c7db917afd27e3daf1e8aad2ad671246bf6c8fbf..3a149caa7ff4f20dc7a902033cf29a168268839e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -186,11 +186,13 @@ static void dpu_hw_dsc_bind_pingpong_blk(
  * @dev:  Corresponding device for devres management
  * @cfg:  DSC catalog entry for which driver object is required
  * @addr: Mapped register io address of MDP
+ * @mdss_ver: dpu core's major and minor versions
  * Return: Error code or allocated dpu_hw_dsc context
  */
 struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 				   const struct dpu_dsc_cfg *cfg,
-				   void __iomem *addr)
+				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver)
 {
 	struct dpu_hw_dsc *c;
 
@@ -207,7 +209,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 	c->ops.dsc_disable = dpu_hw_dsc_disable;
 	c->ops.dsc_config = dpu_hw_dsc_config;
 	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+	if (mdss_ver->core_major_ver >= 5)
 		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index fc171bdeca488f6287cf2ba7362ed330ad55b28f..b7013c9822d23238eb5411a5e284bb072ecc3395 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -64,7 +64,8 @@ struct dpu_hw_dsc {
 
 struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 				   const struct dpu_dsc_cfg *cfg,
-				   void __iomem *addr);
+				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver);
 
 struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
 				       const struct dpu_dsc_cfg *cfg,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index c2a659512cb747e1dd5ed9e28534286ff8d67f4f..a2219c4f55a45db894ff18c1fd0a810c1a3cf811 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -171,7 +171,7 @@ int dpu_rm_init(struct drm_device *dev,
 		if (cat->mdss_ver->core_major_ver >= 7)
 			hw = dpu_hw_dsc_init_1_2(dev, dsc, mmio);
 		else
-			hw = dpu_hw_dsc_init(dev, dsc, mmio);
+			hw = dpu_hw_dsc_init(dev, dsc, mmio, cat->mdss_ver);
 
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);

-- 
2.39.5


