Return-Path: <linux-arm-msm+bounces-55213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 529F0A99A71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4733B1B84981
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE48229DB75;
	Wed, 23 Apr 2025 21:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMbtGsqs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA1A628DEE8
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442668; cv=none; b=fW3WfSRMS18sKds2wr38/hMF6PwoXtE1MHmo3fQo1tVCsdB92TxC+zssiWyNDyz2i060Nkqfxo2r7UQ3iSNy7giBQdRgHBTTO44OrPb0bjSBPnMbfBMhhWa1JVBbqarIDCo70w0zGqhwr6izBGdVP4U5RB/WeU+yvnOmpDInawU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442668; c=relaxed/simple;
	bh=Qc4rqvr7zhfxPGGqYXpJ17iPCKjlWq4qWh8s0Hk3O7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i5KswsV3cVMvsr6McZ6EnYdXHKByUwtKXeNvlTucjxy60mJ9yEMqBAJyghSNDm4Gat3TLRGny3xFaCVJoWj5qd07bfGSyQUgba6jvhGwZn+gdoPo86m1QZq/L8Bqi0GdYfPgxhM7mJn8mqEGox5gf3DxZYgCy1q280WhhjNsQXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMbtGsqs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAFHa3020392
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VG2GZHYD41UKjtYkxPhEwyWQWm9SxTIm0JxfKqMheSk=; b=KMbtGsqsbzFxomgm
	Y00QBaTWJ5iY5lTBGSNfnZ9xZlFJVjWjbt380suZ36nTbNNr85lCprz+ThEmDhQR
	o6pRbEO35wGvdafY9vQ8wRtVAVZ9z9at6FUO94cEVfA89GxnWD2fFVHXKQKKu+Pv
	zUkQrnRV4yFze5RQhyBnCxepaUwa9eccN5c5d5Y2gUO849Xhk8rjl9bLYxY27xAl
	wYOn9IebwASvB3Mno+7h0fX9ujbV/Hzhvpc4/Ptatz5pbnQD7oFbB3UfxEIQx6/U
	XFZ2gaNRofB73K1278Aq9KWavz8hJmgcA3XHBy7CUMIdqf5nKUl6Z6rqSI/+bCTo
	Y7lSKw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh23e0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:11:06 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f2b4ab462cso2837646d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442665; x=1746047465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VG2GZHYD41UKjtYkxPhEwyWQWm9SxTIm0JxfKqMheSk=;
        b=rzlJowERK0WPNYFCiwzlr975xNiSqzA3TT+WmhWUL1XlD0q8ozam97AaQTXDS0cyMk
         mWVKJA+6twrL7BO1Sm9ETenrx1R1gycY8FsmLMBrhhJdrWsD0LwgSIKvkQF7c8iOAt6N
         +CSdrFGIf5hw1JWIaz+Kor5TLH+Q0/sPCjMqc0icSGORq6nj1QbIcUNyXstSrHWAkouQ
         GjNCrndEuSN31i5a/skKjGwJH0eNuWB+hfFst7F25A6V1QBi/bVjSQdoOHoBy5TBz/Wb
         fF5xd8PTMjmQgZwr70cVXRpcH3hvbKuSlNZ7gYlGNrRJTaxEWneNHg/PckONc4SB3caA
         2StQ==
X-Gm-Message-State: AOJu0YwL1msNVQWmF+BkUQtBUxthYAChTfYJJ8M7TuxCfXUBXxTaewrf
	fhkAvOFkoTJ+8IFJG2+ber+AmMIjW1YE41YQt0SBMhqv+gx8+q1IvBTcSCNMzUS9EsMimEzICM4
	5i4IRJdFaA2s6NVOEZWtTLea43S+AnIV8+wvcWEAaMumwTPuFBs5Acq/c/WWHeVG+
X-Gm-Gg: ASbGncsgRkzpnMvtsqE4J+f+x8bPCfQ+oQYiompW3adjPQaCPfamdtaqzFbk96wRp44
	mw6n67NBoLbIRyJvNdp6s/im2terijuz3dLTtWjfpMiUVHgtVGYmiGkFjhNuzmjXnxN3pd1wEq+
	WPiz8Q+85dnMyC82XQ0apVywFbNM9PA1FCPDmnu4DAxfYQLyfdQkpwwQCme+pN2UKr8ZpYSOOh6
	eKPfgE5KRmkEg8CozYOzV/7JqATJL6aao2gr+GVzU1pwSAf6gwLPzVh5rN/aRZP3Y21jJE/EpUK
	kfuQVx7mA3BNLpLFleWrr+a+1u0fgcjGEre5sZLR9gSF4I2RKR90HL3dLgiSn99fxI2GrG7b4/h
	2/w4Lm7hGwXdpyF+muue82vCG
X-Received: by 2002:ad4:5aac:0:b0:6e8:fee2:aade with SMTP id 6a1803df08f44-6f4bfc6d88dmr4549436d6.25.1745442664551;
        Wed, 23 Apr 2025 14:11:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCTTixtPonUt6+ssXScCydDDieUYqDqbDzIjgMfyzOJdfw/QkgLAnM/CKqLzK7KcC7d9PW2w==
X-Received: by 2002:ad4:5aac:0:b0:6e8:fee2:aade with SMTP id 6a1803df08f44-6f4bfc6d88dmr4548876d6.25.1745442664111;
        Wed, 23 Apr 2025 14:11:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:11:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:18 +0300
Subject: [PATCH v2 22/33] drm/msm/dpu: get rid of DPU_DIM_LAYER
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-22-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5770;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=zPzoSre6QlYhSZgH7eVz8ApdAwO0iDMR9kpYQh6k0wA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVct1wtalIZzYjYz2oYBvOdLQv7DXp1k0KMhH
 yYLpC0qF6iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLQAKCRCLPIo+Aiko
 1fCVCACcPhwaMtXnzP4AfF5jNqpgs8DSLEK6wQzNGko0C7IkVqJB4zP8Qa53bWPj3k9b6mOfrBe
 85LKdg4cxcmIcILSP9UwOI+UBP9ZEYEOZK67iPwNvjxLCocm/eI/60WPSw7Xen6fOt36i299NkS
 mgsb9qqgmByq3EZUwfL1xReLKbw6uAgkB/wixiC1X3MT5Vmc2WsHVMPUBBiu8B4jKXYlz7vQ4ti
 RPQlvkO3Jb+kI9tFEgW4q5+CVwVG0K5+nZTYQj638MEFQX+Xs9fxo7k4lAd4CS5wbkzNq0YsHaU
 1YOK6xEMTVZpRdlDOs+RuZzAmGD18Sdjb6+StKnQiphfJr/H
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=EtLSrTcA c=1 sm=1 tr=0 ts=6809576a cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=whSD1cen4EvMnTwSsNsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NAqw91Ndx_HjY354EDehPC627BwJKCUt
X-Proofpoint-ORIG-GUID: NAqw91Ndx_HjY354EDehPC627BwJKCUt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfXxoE9w7jyIwt8 7Fd4dp/q6UtMyEmvQYZHdc8OHo81DSSvUA3mAjLtWirprySy6k1MjSv92Xw7prcGq1hirhQmm5o +LK3psJhCLfta+ihIxwihLcqKL/QvWfGPJjkoQc4UwPWlEYWV+ofkUCsYaSv0/EtYJ/pjXHe0ft
 XJndkubtv5ACIIW3AIufH6BTDcQjRR6yFY62QAu/OKpf6AoyQbYg9Y+BpEjW+6xcCk/XZMBTYk0 KrJCsNHqYAxnICqID86yyjDYNxXFOP1tT7YVDTlrN0X77mlTqcvJaHpHmvulj0S6yJwcVvEtOI8 QJA4jeOlLfwtqmN3jqwFIcYg6bFA2bcjtrR5/ZK585A3frveSjz7adFqEWHcQUv0uBsbH51lHDy
 2gerBINFndLTZ+I7r60aYId4XtXSLcScNKxaJ7UvHb2RF2K+ANwEE11CTleVQ9+kWPfJaGXU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and drop the
DPU_DIM_LAYER feature bit. It is currently unused, but can be replaed
with the core_major_ver >= 4 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 5 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 --
 7 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index e2306d314ef8f8b59078a8ca8c529f2e56385c98..8fb926bff36d32fb4ce1036cb69513599dc7b6b7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -107,20 +107,17 @@ static const struct dpu_lm_cfg sm6150_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_1,
 	}, {
 		.name = "lm_2", .id = LM_2,
 		.base = 0x46000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_2,
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index c75d0d42b6d856f98580068a5ac7f82f90380ac9..af7433fc6c128c2e29381ba6bf56388bccdd93f8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -91,7 +91,6 @@ static const struct dpu_lm_cfg sm6125_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
@@ -99,7 +98,6 @@ static const struct dpu_lm_cfg sm6125_lm[] = {
 	}, {
 		.name = "lm_1", .id = LM_1,
 		.base = 0x45000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &sdm845_lm_sblk,
 		.pingpong = PINGPONG_1,
 		.dspp = 0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 842505ab5c4a6555e0a3223804065e68a5a4e680..155db203282f687e5632dcb042393951bb03876f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -57,7 +57,6 @@ static const struct dpu_lm_cfg sm6115_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &qcm2290_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 7087c3c2e728c51f070b67ab0f8039f74eb7da6c..708cf1544bd1d5c72a125b572e51d628c53f5033 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -57,7 +57,6 @@ static const struct dpu_lm_cfg qcm2290_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &qcm2290_lm_sblk,
 		.pingpong = PINGPONG_0,
 		.dspp = DSPP_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index a2fdbe39e4415c1da1da0517db2284f368bfa07b..b5a3574e2ce43f7f5d47c42fe1bdd0f084396a9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -58,7 +58,6 @@ static const struct dpu_lm_cfg sm6375_lm[] = {
 	{
 		.name = "lm_0", .id = LM_0,
 		.base = 0x44000, .len = 0x320,
-		.features = MIXER_QCM2290_MASK,
 		.sblk = &qcm2290_lm_sblk,
 		.lm_pair = 0,
 		.pingpong = PINGPONG_0,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index e22ad69e451bb5ed38f056e95b0944fb5c21ec7b..5ca696b8cd92cefe295cc7e45974e1da0d420cad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -90,10 +90,7 @@
 	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define MIXER_SDM845_MASK \
-	(BIT(DPU_MIXER_SOURCESPLIT) | BIT(DPU_DIM_LAYER))
-
-#define MIXER_QCM2290_MASK \
-	(BIT(DPU_DIM_LAYER))
+	(BIT(DPU_MIXER_SOURCESPLIT))
 
 #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
 			 BIT(DPU_WB_UBWC) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index e1fc6fdd8864b017bec35e448ef15420530e018b..8e6fcb51aad8278eb80570a44a423c2443744c61 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -84,14 +84,12 @@ enum {
  * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
  * @DPU_MIXER_GC              Gamma correction block
- * @DPU_DIM_LAYER             Layer mixer supports dim layer
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
 	DPU_MIXER_LAYER = 0x1,
 	DPU_MIXER_SOURCESPLIT,
 	DPU_MIXER_GC,
-	DPU_DIM_LAYER,
 	DPU_MIXER_MAX
 };
 

-- 
2.39.5


