Return-Path: <linux-arm-msm+bounces-55218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4EEA99A7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BF81448178
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DB0A2BD5BB;
	Wed, 23 Apr 2025 21:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnCVF3vF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED522BD59E
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442683; cv=none; b=UBJPqIe3P3g5o3rCUDjRDSEUtsXQLRkNmau/ryrzlcpT7ev7ZMPK0olrf3QLSSeAwP7r5VEpAp4SO6KZ62u+2b8/5u6maWK9wlPiX7lNBsZCrMvAPRgvEiRUm+OJ+fSo4aG73q+MVVf2uhSVaUJFXv9O+1OXl8WsCQTSlAeKfw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442683; c=relaxed/simple;
	bh=4BOR5gPJgm1fJqm2rMSgSkTq+VP6DrN/1mNuzkwV7B0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bcmJr2flRZJSRUvd7oGxAWi9Y5CAD1QdMsxTsUgT+HJf5kd3GJ/e8rhAQ6bZDkBaW1ixQCkO67+9F7SXUIWIlSmxdFf+HhnzMLAWixF/XcpoOqzuybRu4gFPjuLDmpjLCUmVnvGRuQ9IwG3+58ykJE3ceLGLSFfyfzqxgDk22z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnCVF3vF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NB5F0n014200
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYR8ks14WTLcA4n7Z2f976HkqtO1kBIjdRCHab5Tyz4=; b=RnCVF3vFETjAwIKr
	K4K51L8Ys0NkwEeqk3RpwbINwF20bScEsj3381LZ+FhHPShoWqVhSkk+gOBKSDta
	be+e3FjUzLAi5kbUGuQDdRMKX+XSzWsIad8zSz9edmUHwGQRPthY27uxrQ75aT8Y
	0g6tMShXWKwbotm+yVAy5I9uMTA7hbBqqIWZUm0wXeJOSWdFfoTWTLrXjYtWHvm6
	ulUYZBrTLykHffuMwFA1257/H3Me3ApKtMKhw6XRlWqjw4GMziNzeOjkJqJwvWpU
	m6xzaPHiAPY6Eand280KSZWevEEhsKEP2tQFSmEViuu9ufPd5Y4YpZU6Bv39L/8k
	8Q6aoQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3bd1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c92425a8b1so49213885a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442680; x=1746047480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QYR8ks14WTLcA4n7Z2f976HkqtO1kBIjdRCHab5Tyz4=;
        b=fJliUcE41f1c1tZFyD7aUA48nH7MihgILLILnDK6lUkvLzQPj0xSgnvPbO9xa5zHX0
         GkmZvIx0jxRW7+Oxog/oE/Z/8q4InBXiJCxXfjhnNNcR6VqwKCBh/nE/lyqUnz4AgxSr
         ++NFnE38cegZzUYUs3Aqxt4H5V/B96QWb9orPJv8vAfD0w9u5UHKncz/NJk+bFC+T30Q
         Pyij9FXanS1Yv687bNU9AUITca4QQzA00/+1RMAX7hmKOfz5c6bEZCHuvT4w5KqjE3rK
         svOaBRP0AcMmOzBpDyPD7pbBOaf2AcXOHnSxMTBGxHR6hFg/G2dkFKaRU2YCuOuuZ7gS
         njOA==
X-Gm-Message-State: AOJu0YxNuOyXegnYkCZbvrV/y9/j6TkB28ULxG/j4fJ8q/Oefo07wfRQ
	Hm/CLrMVjV30GTL4P2yvhwhUwXrEYr+FfCn16AXm9TPso3d9IFmz5nn5pGUL3x1wdJXS2Xj8pGs
	0a6ecUnN51zuKPabzZl8KAebHJmNhoWbA+ELg+RKJ+iVgo28qpr3+idCjFt79/CMw
X-Gm-Gg: ASbGncsEh/Xfp+wYV676E8wiJ38u0xpuyP/R/XZc+TIq3Hs6rhnf+ZpNDBwOf2laxPN
	oc7KN+Bex/OLoaA9zYci+LQc6zw19w2aZqNWyQbiyZ6mmM0mJ4C4zCHecnJpesibyL5HNMrussE
	HPjH7n1coftaFZ4SPGMY7Yjz+jZpZtssKiXT/E9A6g/eDPqzgKVeQ4rE7CUhE1oUZrIiiy+TIKq
	G/5xJw5f/iNUGyDflamr9S9jH8M+riWfoPDTqrH0dAOS9NLMBZ8S8/UhH9MQ7tMVDBZr3bAXqDN
	Vep0vKpH8et6oi5wX6/Mv2VwqH8F5I+KN8MWY6Zk3jTmCVagrA2FZGmD+ya/LIiuC3sTVeSIp+J
	2DF80Hb0joIetN2kUcoyNggFo
X-Received: by 2002:a05:620a:454a:b0:7c5:e8c5:a307 with SMTP id af79cd13be357-7c95782607bmr13347785a.9.1745442679842;
        Wed, 23 Apr 2025 14:11:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHc9Clm08wXIMSkloNkcryzQ54VDilhcRI8JTPa3Im5SATSs/JRC0sqOSe7Heo2ibj/BU7tQ==
X-Received: by 2002:a05:620a:454a:b0:7c5:e8c5:a307 with SMTP id af79cd13be357-7c95782607bmr13343985a.9.1745442679509;
        Wed, 23 Apr 2025 14:11:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:11:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:23 +0300
Subject: [PATCH v2 27/33] drm/msm/dpu: drop unused MDP TOP features
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-27-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1025;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Rp2b7HkiPFY5uR85fuuwlCMt0ynxuJbG+1cuM8N4RUw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcuwug605fj2frhMONLFMahoGskqNw2Ccr8I
 j19OUUNBS6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLgAKCRCLPIo+Aiko
 1VMgB/9NB0MepE64MHxrGHbxOdiLlpwoRt/c0gwNAOVJSRD7mdmQgFBXxbA4LYeLHQwa0CU0OFe
 QLb58zZsRXGd9b8InXt5NvHlQCLTunAVyDSL/8D7gcWEof+FBZN4DIXnBwknaRPr8pjaDuC2lKp
 xKd4llVj/6dvm5HlhJqrpn3KSFYRAVjOaVxVlpj1dwO20MuhtkxVpHMEXrU3AtrTzLd1WCzA4bA
 DK1kN0k5iA4AyXGv2mJeBR0+Wfru8YQ1L68M3TwMTh+0KUY8tLYOLbAnjekxp8iQxW8fugwhvIy
 HVKtFnnYApZHz4fxHtRkesEavsCRK8Lu5kVXNyIUlpVbKr/a
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX2Xho4gYFqFI9 kR4U2n+en9deNaT7ttkyfhqwzXsJxyfRWGpwv82DzpOckCNDouZnH4fwyccrrjO6dpZqDCeuXVx +58JKxfQYmeivFyXG5l/z5F0ZUuckDlHIyXn0v023hdXxE72//Jj4fN4zA+vrcoU2iEJku2rYJo
 lg9N6NihW8fqajCoFQMwJVvta38oVZRiYHz4B1mjf520YsZfpYxq3g0/73Gar1ekCxUdKcnzfyx 6F9I8C7OJKusTEtHB0JHWzZq4SxDoDcUgdhvw03WGMRKy8/Lrr49mhxts+n9KyadadokrXUC5w8 kjWjOK1FNvNWwBf6SR4h49RusRIGDAm1aMVaoLTJsgLBsopv1O1ACjMM8ehZX8Ef/NEYQ9FfMmn
 XymlaQ+mOUIW/JKxTD1EMmDqDcfhwP1Ro1JZrJ32eY8k4jy/2MOcdVgmI96iNoElENZ4K6R2
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=68095779 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=8brcGD95nZB0FecW0AkA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kvvx5Io58CtAqw_wz69SUWuisJchbifp
X-Proofpoint-GUID: kvvx5Io58CtAqw_wz69SUWuisJchbifp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=717 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Drop unused MDP TOP features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 01763e0bf1359527b0c441ca36b27264dad636c0..4b6af58429361c49b71f6067dce8ca1daa6493fa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -28,19 +28,6 @@
 
 #define MAX_XIN_COUNT 16
 
-/**
- * MDP TOP BLOCK features
- * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
- * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_MAX            Maximum value
-
- */
-enum {
-	DPU_MDP_PANIC_PER_PIPE = 0x1,
-	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_MAX
-};
-
 /**
  * SSPP sub-blocks/features
  * @DPU_SSPP_SCALER_QSEED2,  QSEED2 algorithm support

-- 
2.39.5


