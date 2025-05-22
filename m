Return-Path: <linux-arm-msm+bounces-59110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49536AC142B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE5C15034ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A06E729B8F0;
	Thu, 22 May 2025 19:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OI5C51V5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC5F29A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940633; cv=none; b=eSqZ6h+/Nyhe+fwl+VGXfwet41Ftv4q4QuoEUU2uBPJcFMNREyG45da4CUlWRs84Ys1wirvQHILhyesn50MG52lTXGiGP8YO4vBMj4JoS9v1HAOgANpx23dQsbDtuduPisTwlETxXBiUdn1/BW4wEDk1D5MCv7oNt4iiWbffpEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940633; c=relaxed/simple;
	bh=PbNwFPnsz2j2NXJWY3qtYusppXZegcaNrDYsRqjbEEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XkdMVy5ZXzNE3Ui2dTpb2Oprz8vpHqtyi+IkjbGPCPBQCB6Cxb3KYVENbMq1K1/dwSj9tAgusNUyZABz18NUDXuk+992oNvlh7C3OBmHbuHcGclPJAtq3SpiXz9pNQKQ0mQFm1HLeNbhfnQfnzIBjhG5Px5GwIiLtlch/blZXOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OI5C51V5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MHgeOU014011
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:03:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AAL0npdqQBtYjwOdI2efX91wkcMPDhe43jrL70BGKqo=; b=OI5C51V58XrgB4jR
	/79haq5airvb76Q3Qqi4Xde6PKL74Lala3Lc7CmS8ClC1ztN+g9luDkvnGx2IihX
	2tMlOjz3EIPLdZ7S7rBPB3dZ2OThOFsQRai0ltgq+zu7aNgeAc4skkk5hrSZIwY7
	AjqInEhNaJTa+EWENdm2c/nQzBVSDxV+8f4KESneZX9GxABCrSCQ/xJPk05aexUP
	H/yTW14qmThgpulWf3NG9NB2h3VME6AOy3+vvg1hdGkfYEAyiHzN6bzwxRAh0VpN
	kgwNYerD3vYoAm7KChXCOJ00gBkJvmOAwjiAQKVP7Zd5rvii2c21ewfG6Xhv1oN8
	uL+KjQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9yf89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:03:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c760637fe5so1435130385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940627; x=1748545427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAL0npdqQBtYjwOdI2efX91wkcMPDhe43jrL70BGKqo=;
        b=CR9863v/oiQ5Enxe0EGXiOH454MnXym2sWDxKHbh9mhHZj9BlIUMwuaJ7pxmDOY2P6
         8Zkz7Qqm9VsLMvbFZfuPs51z353pyXXhFJMCdDBeUd45un3rYn7aXcG26hyjgNXFpBLU
         ssYqTZXx9yZD1+k0WYkMHc4nKohMTnqEYkoOQOQCYNp1zrN5QfE9PXClkM1zCK/QPmek
         Q80O5DNHaQaDEEbhvZZOfkqDrG+D6hBlanBJOWTjV10PRYlcYPDXEM2YWceUw8WmlqQu
         hdfA8OcCPKilSH9RcqAXhQhbMaQSpzotGWxy/eD8sp1kIO/CYGFhE2dhuibaa5TXr6Qi
         tDWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWd3b9jyLczTbijMBol/Iv7Fx1dRv7p2TTZuVdwrkyJpjLruU2c28sYkB4H7+AFSIMBwB0N+y/WExhOuu3J@vger.kernel.org
X-Gm-Message-State: AOJu0YyOWasnQKlHnfgdR77rO4F1E4na866cfbrp/SZc97fTlEMURJjG
	kR01HZ4skP2hFquGbBhlx4ap9p7vIPafJbk6OllqfuHLEgeWx1wmE/5/1cqX0H0ZCczoAZdm08N
	QSXvS+m1sRuXXwvCXojoV3q1/sYzofXj/5nHttYEJHDW/jbyGDYkVuRS9WxJWHnz+Ojj/
X-Gm-Gg: ASbGncvLUKheTmOXiOG+8OSLwzTWKoBs/x02LHPzRywWPitAxUjsd2eVCTjo+5VPPp8
	iRMwZr8H86QXcJ6GimdKEuRMuWa56DKY6k11uER9pr74B3bw9Mx3M4FoMaSxwANQzX/NXRwGPQA
	SqwmeoEvxjUn2fO6QgaHXVHTCuDsRulCCIuN3J/V2mA+JZCvA3vBagVHCT844KLTeL9or/Ed7Ja
	rBYd6XIv8ksgbleVJxrXwmofGWYoPMY1Ht2ioV2ePRP1v8fu/7S+DOU0RXnjyCKch1zfPN1hRtc
	byXCojnzFNaq5jGZurtPvk2WEyHTPCUqQqvUNDN4Zdn8uOPdxGE1i8EQrhizahpO9VpudxMlrhF
	l6UQeEzCMs5U3+ntgZpXvx51w
X-Received: by 2002:a05:620a:2987:b0:7ce:d0cf:6213 with SMTP id af79cd13be357-7ced0cf65e0mr1205901985a.3.1747940626411;
        Thu, 22 May 2025 12:03:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh1FDtRf3SaVWGRb6O1J8PwQnn0BNGU6mLywxpiw8q9pFBZc4zPmqFEWslOOzt+gG7ohEFsg==
X-Received: by 2002:a05:620a:2987:b0:7ce:d0cf:6213 with SMTP id af79cd13be357-7ced0cf65e0mr1205896785a.3.1747940625865;
        Thu, 22 May 2025 12:03:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:26 +0300
Subject: [PATCH v5 07/30] drm/msm/dpu: remove DSPP_SC7180_MASK
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-7-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=26280;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HFoHoFOmqjM+HB4fAK3V/eauXLyAtHo7gfN3JCzXVn8=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4Z+yZ+krrs/elb1fN1Z+vqAXX6i979JPX7Td6nvsJqQd
 P0+I39qJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAm4rCA/a9U+U1RaQM+L7Op
 fEe0fHpiQ9rjb78syb/adrcq8/c/312TSl7Em0+p+9+TOuVGqgWTxN1nPmfitGUuX1E/Mt3H7Za
 +g8GuzZsudQaU9z6aWnWK6czLszyzXN+F9KwSkH21/OXXdX9WVrbsreKxk9OpXvlfU9380DcZYc
 EtVtxVkgwfdN736uQF7qpRnMAtcjfZQt+8ft7KjYL6JjUJKcyny/asi59RkrU33o391z5pFo2SA
 O8NVzfudVzdzMM5/2LCnP5etRUOr0O3TAgWb7TqdWlYwRihkB3GeymthPXtgr0scy8pvXBYZ1y9
 9GiHUxVvSsifOKvghn8P0ztrmdpKK572rNNqZJ3GIfsAAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f7513 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mYGjOyR_Ic6jQ6k2fpMA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WK1k8S13_xJEUusepkgMlTyRWvOjKjpA
X-Proofpoint-GUID: WK1k8S13_xJEUusepkgMlTyRWvOjKjpA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX+olrs0r4fNi2
 06fAKdZIeyTutfTisysETXjfe2jwpkQsxPQWrMFUlEeQQxE6KtpLA1jV4SKE8DUkX8lipaNsEwO
 WGE7WIpfAFjyrPGgaP1SQfQnzk8/gNpvl6GxSBsKqfG1/zuAUqVpWbY8SzLhNiYaQWdcxwfI84C
 TbdIKRnDAyTM089W58oXM+r2S0TkvrRQHzF+VncF5GDp0bMZz4lobvtw/ZCXoB96K62l1d7STAY
 Z/QPvtt5xTir5WKAZVG5Whyd1eRcypzLFLDFIhRVbL5OyfpofMc8puSg3ewEb3JEX0a9+Cb5XZS
 KQrJs8zgyHJX/1IIfUmpMXjuffuiCxka/oI2ZrLRSlFpZN0+MLMZ7xp8mELBpIYhIrH52YkNe3C
 qy1lsknMm5fctM8arRvReKx1xX6lIDjUPiHmjjFGqh6nepw/JE9HV+CSj7uv9GwF9Ry98Jjn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Stop declaring DPU_DSPP_PCC as a part of the DSPP features, use the
presence of the PCC sblk to check whether PCC is present in the hardware
or not.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c              | 2 +-
 31 files changed, 1 insertion(+), 73 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 61420821a5f2dd5e56b8336c898290a2552c77fa..b14d0d6886f019c8fa06047baf734e38696f14ce 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -189,22 +189,18 @@ static const struct dpu_dspp_cfg sm8650_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index 39027a21c6feecfba2d164799d9d982fc282d06b..c0b4db94777c42efd941fdd52993b854ab54c694 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -116,7 +116,6 @@ static const struct dpu_dspp_cfg msm8937_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 8d1b43ea1663cfbf35bed7b913d5d0bd16757162..d3e4c48be306a04b457cc002910eb018a3f13154 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -103,7 +103,6 @@ static const struct dpu_dspp_cfg msm8917_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 16c12499b24bb4cb4a7f126dd6580d9d366142d8..c488b88332d0e69cfb23bcf4e41a2e4f4be6844d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -116,7 +116,6 @@ static const struct dpu_dspp_cfg msm8953_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 91f514d28ac62deeafa843b5fbd0c8eb856fa49e..8fe07a5683f734a058e7e7250f0811e3b7b7cf07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -223,12 +223,10 @@ static const struct dpu_dspp_cfg msm8996_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 413cd59dc0c4270973b34fc3a19405feff5b47e3..91285519c540025abce5c51f2f28442ed9d479b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -212,12 +212,10 @@ static const struct dpu_dspp_cfg msm8998_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index b2eb7ca699e3ddacee441216be647784c9bbfcb5..50e0e3aec23c02acc1ce2d2a8a5658d6d49a62ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -183,12 +183,10 @@ static const struct dpu_dspp_cfg sdm660_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 85e121ad84a0f35fe2ba45cb76856ad83effdf44..1c299491e61f0465a164be74b7a754435f347cb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -133,7 +133,6 @@ static const struct dpu_dspp_cfg sdm630_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &msm8998_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 49363d7d5b9384dd66ed02ee9ada05b24355f1bf..50e40405a5271ea6b12caa7a931ff7fe3f2478a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -170,22 +170,18 @@ static const struct dpu_dspp_cfg sdm845_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index c2fde980fb521d9259a9f1e3bf88cc81f46fdfe8..3a60432a758a942eb1541f143018bd466b2bdf20 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -103,12 +103,10 @@ static const struct dpu_dspp_cfg sdm670_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 08d38e1d420c1ceb9cc527b260c08edcddb139f4..b2ee5ee01870507d9f01020443c30dc573414c72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -193,22 +193,18 @@ static const struct dpu_dspp_cfg sm8150_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index d6f8b1030c68a428a144428b422b63b960c2fdba..6db04c668a87a9f7baea01a9ea2a0f1bbb1212bf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -193,22 +193,18 @@ static const struct dpu_dspp_cfg sc8180x_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 71ba48b0565648a02044d444d0242fe04cb34478..6f61ce85c536e36b65b98ba4740711cb495a7c9a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -150,12 +150,10 @@ static const struct dpu_dspp_cfg sm7150_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index da11830d44072666e47b0505e2edc3ae7717eb23..dc6d8fd05c2e3afbe5182b1ae8dd9fea8b6543e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -136,7 +136,6 @@ static const struct dpu_dspp_cfg sm6150_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index fcfb3774f7a18d8e01546a3ac72aa29f7b750443..192e90b570dbf8f5c3c24f572443e111f6cf3db2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -117,7 +117,6 @@ static const struct dpu_dspp_cfg sm6125_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index a86fdb33ebddc7f2a9914ef04899397e3271b79e..bdd92b5a61eabc6a1d5e0bfe740ed6d9f1e8e94f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -191,22 +191,18 @@ static const struct dpu_dspp_cfg sm8250_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 842fcc5887fef15789fbc686fe2156b6b509b45c..ce2ec6af5f53e2177009ca8826ca510fa08c03c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -106,7 +106,6 @@ static const struct dpu_dspp_cfg sc7180_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index c5fd89dd7c89046bdbf1b1bf223aac2e3c4c0b26..986179b53f8b59200d10f5159cac630732dc7196 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -69,7 +69,6 @@ static const struct dpu_dspp_cfg sm6115_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index a234bb289d247d065b336564faea8dc35b00def9..c2321a4a7d3894d85062d083b45402950122007b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -115,7 +115,6 @@ static const struct dpu_dspp_cfg sm6350_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 53f3be28f6f61bb7e3f519b0efa4cb2f68d38810..c3dd2383bd5f32926b50d98c937da25ed59d7cb3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -69,7 +69,6 @@ static const struct dpu_dspp_cfg qcm2290_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 3a3bc8e429be0ba86185741b6b27d8a62489779f..abeaa2b8e06fdf6ce5cec2c1a4fd025a342f5a2f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -71,7 +71,6 @@ static const struct dpu_dspp_cfg sm6375_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index e887e78059a81569fac8a4246ad63856dc48cfcb..bbef0e1c597299d24a923e1f0d977c99afedb8fb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -191,22 +191,18 @@ static const struct dpu_dspp_cfg sm8350_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 1edec0644b078ac1fff129354d4d02eec015a331..281826170da082fc90a05c641060901ece0fbed3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -117,7 +117,6 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 9d60208745138bf29a7bdbd14ef28a2102f36f9f..1dd0a1aa222d65f03013d634a87371dc552b5bd8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -191,22 +191,18 @@ static const struct dpu_dspp_cfg sc8280xp_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 631154059c31e8ce1b9e3631552ce49aa589d4cf..50142b14e24eb875e72e5cff3b28ff8aba89fc9c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -192,22 +192,18 @@ static const struct dpu_dspp_cfg sm8450_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 3547fdfb28cae6cd8d1909b268b88676afad0be7..264cd6d3640be1bf321fda429748ecdafbeed214 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -191,22 +191,18 @@ static const struct dpu_dspp_cfg sa8775p_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index e16e47a6f426359548434569ad632aa68f32908d..4c5785332b5240109af36a1256d4ea29c348bced 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -189,22 +189,18 @@ static const struct dpu_dspp_cfg sm8550_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index f85d5d7ae51d64203647a8bcec91f524c6e33528..960c68f33074e0cec0f33aa7d4f8f3b4cc69bac5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -189,22 +189,18 @@ static const struct dpu_dspp_cfg sar2130p_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 0d6511f90975508b36b0fa00a92349a82eff4d52..85dcf577b844995fe11322ec506885bc4a85e33c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -188,22 +188,18 @@ static const struct dpu_dspp_cfg x1e80100_dspp[] = {
 	{
 		.name = "dspp_0", .id = DSPP_0,
 		.base = 0x54000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_1", .id = DSPP_1,
 		.base = 0x56000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_2", .id = DSPP_2,
 		.base = 0x58000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	}, {
 		.name = "dspp_3", .id = DSPP_3,
 		.base = 0x5a000, .len = 0x1800,
-		.features = DSPP_SC7180_MASK,
 		.sblk = &sdm845_dspp_sblk,
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index d383368c743b202d7256f6759deecaf9d756bb02..00e6f3e56ed1f9af581bad9845971fad315ef83c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -113,8 +113,6 @@
 #define CTL_SM8550_MASK \
 	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
 
-#define DSPP_SC7180_MASK BIT(DPU_DSPP_PCC)
-
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
index 0f5a74398e66642fba48c112db41ffc75ae2a79f..11fb1bc54fa92a5d9926addb437bc4b8f283723b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
@@ -90,7 +90,7 @@ struct dpu_hw_dspp *dpu_hw_dspp_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	if (test_bit(DPU_DSPP_PCC, &c->cap->features))
+	if (c->cap->sblk->pcc.base)
 		c->ops.setup_pcc = dpu_setup_dspp_pcc;
 
 	return c;

-- 
2.39.5


