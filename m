Return-Path: <linux-arm-msm+bounces-61867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFAAAE1469
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 08:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08E3318977D2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 06:56:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF864225A34;
	Fri, 20 Jun 2025 06:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SeR6SXb1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655EC225791
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 06:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402529; cv=none; b=T4eveE2O1KVaKRUSY9oMdGqkXXH4nW9TgsvDB3dtPtKZxWO9T02lQvDOtuNg0Jrz29yXsghQhpY22kpzQmNY1ISXk7jVrh7PjPmUavr4IPG47B/Jx36fTqGnqzrHoFd296cvZcFFEe5KTVAdAxFQIOmiA1TYLHXA1hZYViSL+jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402529; c=relaxed/simple;
	bh=1oxyf68EFFylCmMjwV5jb0pfG0MEgVawKDcLqM/rxmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dVL9s5jlFdcXOj/dL+WSi6eghOZjLuGyHu8hOImzuqqQl8iQwvYLCXNZvVKx6uu3KCqaOD1nQeA/ofSaAD7QYw/lLIWaSnEA0LRD/YUDW+sGzyGsd9y6tbmYOnqqvjivr/Lhjb7zcZ4AWefpPMCi9lQZQsXUzQ7vXRR1Mo+QTHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SeR6SXb1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JIeZ0a004996
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 06:55:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UY8Xz4SAGxjtVkpxY96irg9pXQ6T1NS4IVwFIY8UKPA=; b=SeR6SXb1TsEqQHdC
	p4UluYnmYhsk4gwBJmQfy4n+8j4Cz+An4psweTNeUyZJjCsMFcolWfWiW+v6sFgV
	USDgaX5x7wWUCQnz05F8cgU2NwqCz1AhQTX6/arHEx4E9wVFYy5gwiuODz7I7+lz
	piH2xfuojK08ZNCR2N/pkz6AQ0zKJ8MUTNKfVMLSy6RuvNFZbkifc+SYUF9tzkqm
	r+6V+kioif4KO8eNavxIWQtehgMaePypIL4YyHQO8ce3XGB8PH1IlOi8wws1RdBc
	1injVwtI4E9WRE7s7Hm6MaEsO9g7Q+ckCZYVxs/YRLbUe9lmKZPXQ54XH4rjCIIX
	JoEHBg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mt7t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 06:55:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-234f1acc707so14820115ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 23:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402508; x=1751007308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UY8Xz4SAGxjtVkpxY96irg9pXQ6T1NS4IVwFIY8UKPA=;
        b=sztZy7aubXYHjzS6ZH5EC9Xyn+H5x4t4K9vhdHA66X+c9hk19zpYYzdSV3rMIhKgfe
         6BfQzgODjOXHb4u+W3J00W7mP7StgdkSkfZMPdZ8Z/aTdH4MnB9xU/9pImF5uyldhcjh
         p65D5vDOV9UCPvL7A8RUHlP0WXqfo2dHP3jjPb2TLb9kgcrHDKB5gt/7y4GvD55sD4rt
         Leycto4oAdNi1cvrySf1NMlSJL+nhpXrjuMQXzAd+6h3cscajQaiRzBLftiCzGG//10s
         hZi501UMoQ3kXHCdmJE8Z//Rx5xw/Vkx4R3vDhEjelpdq1v5zWZYfNLVes+Erg+3uSBv
         EaKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLgF0JF/KmcreT91v0aMErnSwVbEclrpBOUsJvIWRIRQWBEFn6VJm8bF9aKLZFvJVVTiOGASIcIi/EVHis@vger.kernel.org
X-Gm-Message-State: AOJu0YzkPTRmIpManG5cOpFopUXB9RZydtYIffs0qyaY1K1kr/HIcyYn
	AzRf81xAO7vCtPVkn4n2STfU+ClE9qsmucGYYqPVx+aAX1MZY6TJOK8to7fhnf/cuRtoo2tCeVw
	H6Tuk5fv4eq4ofKIR/DIjo06ubA5LVp2Hj4CKYRKRS2bTfTtDOsUdGjfI5mTAif9YownSDkLkcN
	ks
X-Gm-Gg: ASbGncsK0a5+btblzN49bZHGEYFydRRUPEDbFWHWooUydLGSSC+sRDHKP4OzZ3AX9Ei
	fsUWOCqT/7/Nl5x5Rm9qQCnbFiYwbsQ66pTx94niz39ZGX4r61a5dVDjQp0/ysJWd60bFUcnQ5r
	qAulODxPjnK7FKg54BLHv2ji+ARM/rwTvfrsbCEeFOmcMMj4zEOjbkVQ7AFZ4rk7MtVqr9yPW7d
	HD8gu84Q2Fwf8kBthFllrbFdFxvrrPVon7QkAKPX7CWKB6JZ72MKNgAI8JxFaK9TTWXSqh9foJl
	t9pLz7BeUlC/hmXzMhgS2806wEoLyK50
X-Received: by 2002:a17:903:2f08:b0:235:efbb:9539 with SMTP id d9443c01a7336-237d9906e40mr27772645ad.17.1750402507469;
        Thu, 19 Jun 2025 23:55:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ5LpDJJHEcZBAtNAGjCwyfD1eLqoPaVU68U54gQ31anHAn9sWvOPT8dxNj9uXQ8vEOHStmw==
X-Received: by 2002:a17:903:2f08:b0:235:efbb:9539 with SMTP id d9443c01a7336-237d9906e40mr27772265ad.17.1750402507104;
        Thu, 19 Jun 2025 23:55:07 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8701c0csm10636185ad.223.2025.06.19.23.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 23:55:06 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 12:24:29 +0530
Subject: [PATCH v3 2/4] arm64: defconfig: Enable X1P42100 GPUCC driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-x1p-adreno-v3-2-56398c078c15@oss.qualcomm.com>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402486; l=857;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=1oxyf68EFFylCmMjwV5jb0pfG0MEgVawKDcLqM/rxmo=;
 b=8PF3//AD3gGPG03AcLC4ONVS69EyuqXu0pNc26VvETNgzRpHlRintCMdeMBUfPaRptrZsJlyV
 vJLwgH/Zyh0BgDMciHJYI0hdt2oscEXRCGJBuuNwMM8XQ99xTylLnso
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA1MSBTYWx0ZWRfXz8TpGxV/8RWw
 FbCokJQDZ3GjanAjosPahFqvJBlRZen9XcATQwt1o2oxmQSOsiZKTMNc58iSBmNU2ODCOcE2v4R
 eFQwpen+/esZJT5Z73vR+6IZaY5/nIB5wEAF2uKTJ87WYK917I19UMV6sRuZW8J2Z4+V2HK0Rdw
 puekomngEzJTDS3SzYrdysYGcdjv1X/0RxgozX48IaAaaZdEnHTvUIqW3OJIarN92Es6uukoPGJ
 nIyb5niDkWMhipxKvzYGMas4y67Hc4IzWosR5J7cV2OHaXCatjuKlTS3/i6B98CzrQA8gucV9rG
 ofwxvr7FD5rtYeaiVR/vdlTPcsBkvCSE1NEYGMuT+B7AiHuXUM9YOc7r95HFDP0kDtsWoMY42kY
 TunHm9Gk6GjkSRA9YX3Cz1einkCGcLSc12wymcIyFYd+2LwDyq6a8vXq6gq8NS80rNxbAos3
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=685505df cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=GAw9eemyJ_aXAIuB88AA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: 9NK-sVCg_L9ualX4Z7WZzBVcIk6Btvvb
X-Proofpoint-ORIG-GUID: 9NK-sVCg_L9ualX4Z7WZzBVcIk6Btvvb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=489 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200051

In order to enable GPU support in X1P42100-CRD and other similar
laptops with Snapdragon X1P42100 SoC, enable X1P42100 GPUCC driver
as a module.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 897fc686e6a91b79770639d3eb15beb3ee48ef77..ccd03ab5de495498281175a4550bc73d3e65f3f4 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1347,6 +1347,7 @@ CONFIG_CLK_X1E80100_CAMCC=m
 CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
+CONFIG_CLK_X1P42100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
 CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y

-- 
2.48.1


