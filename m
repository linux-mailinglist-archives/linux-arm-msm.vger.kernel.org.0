Return-Path: <linux-arm-msm+bounces-53538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED567A80C1A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 15:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDC6B505DBB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 13:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54B4C148;
	Tue,  8 Apr 2025 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MU3QPD55"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1413282899
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 13:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117371; cv=none; b=F2gOrWFIMcHvtiK/WQzRaNQSvZr6ottQsWxK47NxTr39VgARPoV40cw+PbcMvaAmrhGJ1lC4MceLicz1eGwCkMh5kDKVli0xuR/SusBc/01G6xx2dJ6AqzH3qtQoYka7YSuKYTuf0noz7xgx2P71lQmCYoAvBY9INqdmE0DoVFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117371; c=relaxed/simple;
	bh=JdlMXxUwizN2ti92XXyxVJFjwtOn6Nq4gI0Xlewt8tI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QvSC6a87XOsqNwQOA86e29RXHc8iN2yQYAk3cHk7E4DoXjmsHPQqhrsUXZBsq1VFE/hTCG/qOc0gMqnkwTeHsHUJKsIJFYyt89Vv10fpTEv/X5lkP/bkEIdqSXmHJAv2XVEMplJvUpMkRzQ9GOPYHUiyPzRfxciRPoSt0a+EkyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MU3QPD55; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538B8c63001919
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Apr 2025 13:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C99IbYsybOI0qp7XxA4lc+
	KIHKOFmr7JRjwEaTrZLy8=; b=MU3QPD55N9DA2pJuMf56VhN6m09g5P9xHnGDw0
	2GCTx8MvJlWt3jtXA9MH8Gn0Z5bS7LMNbHbfvkx5DvjZ+Dln/8+LGpfgNaVbHb5O
	bOuOW6k1nBuaKWCStWmwGorfPayYPSgwL1uiOFgLk+PoK7UHJ4qXxVnSv0aGwCr5
	RtzN+GItoymdF0pIv3jAMzn05AwNi17bdQqXswPi2ZlKfL9+hLdCIHrcCNWU76/h
	W4gzNKLGScWRQpdCtWu+2pC3mSzr+uDaYJaZpxgXihSyvKR7WsmvohT3Chaeo+YK
	RHTHD2W41mvVCoxZqtz1HnPn4fNsAEtiHgF02nt6g2lnjssw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe7uqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 13:02:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c9abdbd3so541201585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 06:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744117367; x=1744722167;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C99IbYsybOI0qp7XxA4lc+KIHKOFmr7JRjwEaTrZLy8=;
        b=qStrfFvigJf49Ty2CqOF9LnMSOoLQKAh0RcsvtPCRDb5K15ZyDPRde+YSaTWA/TI10
         o95WJOsjhChBoqCkmPquE/9JPUtlpNfEkcAF9xKSbbZ1jCDyvj9D7sbMOV/MsRT3gzpm
         GF7bWJ1CgBv0pcCptmJdPgqbZYAUzacbuDyHmYR8Gm7WDQvYaKS6Qems0iSUFQaENfMI
         LIxKwEs2ATHtMoS08dOuM69Ozf+jXkLn0tVaTZHfvLVFhPH/+EyJf1MGQn7vKpgQs5UF
         dwiqa6DGsuPp/g0HlX5XdLSwUNvR5hEa7YaiPznPBpr/+3mPbAojnTPvafpQ5oy2nwlD
         zYQg==
X-Gm-Message-State: AOJu0YzHvTM+wnGSYIZEH+ig2MSTpoDr8hoUaW05n7lLaBZSwZnvNNmK
	40ZmoioK9dyPlrF5EJbMBx/h3HZX+1HGL1UbhkCEv4Gvadtp2cDB009gBZO2WdUHJ+CGjEPYTiJ
	aDTUeiPJvILYKH7LW0tKaTNgHt2vqLdoPfMdDkreIDlZpnAPsxYdL1fpl6EzlX+kG
X-Gm-Gg: ASbGncuQRXS7gpMmORB9ePJZy66bs71D4NRQJc+28ayVcBfhZOKxoBrX4wTCGjBNIrC
	HCMW9/teB4cetKnyOjLrlUgkoAuk+Gv8JqfgeD8KK5dA4g3Pu9L9LrjftDB5yoZUU/cZF7UJZmf
	Xop5LUxVYg6AWdpPqQmqyMMnY97uOsy9/kaij+3vq41O1lDp5njcEExPvyRXpxyuNXuZo3IdH1d
	Y2YxF5qiW4tajw3NcmAxEcUFr+LbSOHU//1x9glaZyHxlgLFmM746G1pi9A97yl5Id2UzueKJw0
	VM2UYs1F8h+b+34ihuZWHgZSgJ/QXfa1TmeAb8mtzRv/WEqdJkkW0T0Dk7WCziYednwXfcVmIWL
	lAZifGQs1fX54UKb9488QO3O3vReU
X-Received: by 2002:a05:620a:404d:b0:7c5:4be5:b0b1 with SMTP id af79cd13be357-7c775abf4demr2156429685a.35.1744117367507;
        Tue, 08 Apr 2025 06:02:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaECUNZdRzJhLeXw75QE0R57Qpn6GFw1WDUnaDhh01xqCeMB3cxE/BN2Oc2HzYpAvyKc0/7w==
X-Received: by 2002:a05:620a:404d:b0:7c5:4be5:b0b1 with SMTP id af79cd13be357-7c775abf4demr2156423685a.35.1744117366999;
        Tue, 08 Apr 2025 06:02:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e670d1bsm1560613e87.214.2025.04.08.06.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:02:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 16:02:44 +0300
Subject: [PATCH] drm/msm/dpu: drop rogue intr_tear_rd_ptr values
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-dpu-drop-intr-rd-ptr-v1-1-eeac337d88f8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHMe9WcC/x2MQQqAIBAAvxJ7bkElK/pKdKjcai8qa0Ug/T3pN
 MxhJkMiYUowVBmEbk4cfBFdV7Aes98J2RUHo4xVjerRxQudhIjsT0FxGAu6drGm0e2qjYWSRqG
 Nn387Tu/7Ae5Oh7tmAAAA
X-Change-ID: 20250408-dpu-drop-intr-rd-ptr-76b52416c125
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8183;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JdlMXxUwizN2ti92XXyxVJFjwtOn6Nq4gI0Xlewt8tI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn9R50D8d8SZ21NDKudMR43W7rVbh+XQ/JeL46E
 rTpKwT/QwOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/UedAAKCRCLPIo+Aiko
 1TBAB/9CG/SR1t4i7Zbc+3thhGxKeEe1SkmXyismu5gPfIWoRcjUOkzRJRDqJHynfQRE5ujp9Tb
 rsKr28RJPLvgHJjHVU2fy2eHDVBL/0Ef6+nfwQhd+FnXvr6fx8Ccdha2/1t6rR61NLn0+K0l12O
 g0FUDyCblRJeM90M6KFVcDZreLRx1ym+I1g693JRWhpLwEvwdA3E888oa1KU6WCCIMP2/F6rHvf
 P5xWunufE4HbFzgCEfQK5n+3hpokY906G9NsZeFm50qsFO5sQIZ+vDQI+r0ao0h1MDKfVq6+csS
 sa9VQffKBsgBuoMt/4AtYS8HNL6Py0dhfujMIifTyPhLdVSh
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -AU0rX5wLCMYkpJeM1t4eWnrcSKcSBdb
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f51e79 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ZZee45BDSTTCXVxweLkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: -AU0rX5wLCMYkpJeM1t4eWnrcSKcSBdb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080092

The commit 5a9d50150c2c ("drm/msm/dpu: shift IRQ indices by 1") shifted
IRQ indices by 1, making 'NO_IRQ' to be 0 rather than -1 (and allowing
to skip the definition if the IRQ is not present).
Several platform files were sketched before that commit, but got applied
afterwards. As such, they inherited historical (and currently incorrect)
setting of .intr_tear_rd_ptr = -1 for 'NO_IRQ' value.

Drop that setting for all the affected platforms.

Fixes: 62af6e1cb596 ("drm/msm/dpu: Add support for MSM8917")
Fixes: c079680bb0fa ("drm/msm/dpu: Add support for MSM8937")
Fixes: 7a6109ce1c2c ("drm/msm/dpu: Add support for MSM8953")
Fixes: daf9a92daeb8 ("drm/msm/dpu: Add support for MSM8996")
Fixes: 7204df5e7e68 ("drm/msm/dpu: add support for SDM660 and SDM630 platforms")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 4 ----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 2 --
 6 files changed, 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index 1f32807bb5e5d49b696832c4eab54c05106bfd4b..ad60089f18ea6c22160533874ea0cc54c352e064 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -132,7 +132,6 @@ static const struct dpu_intf_cfg msm8937_intf[] = {
 		.prog_fetch_lines_worst_case = 14,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x268,
@@ -141,7 +140,6 @@ static const struct dpu_intf_cfg msm8937_intf[] = {
 		.prog_fetch_lines_worst_case = 14,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index 42131959ff22020a83c0ea65d79a56fd57c800f9..a1cf89a0a42d5f3c909798c30901fe8796b15075 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -118,7 +118,6 @@ static const struct dpu_intf_cfg msm8917_intf[] = {
 		.prog_fetch_lines_worst_case = 14,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index 2b4723a5c67606d68dea905d947cd691bb28eda0..eea9b80e2287a86448ab4e1a5914c1914d5a2090 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -131,7 +131,6 @@ static const struct dpu_intf_cfg msm8953_intf[] = {
 		.prog_fetch_lines_worst_case = 14,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x268,
@@ -140,7 +139,6 @@ static const struct dpu_intf_cfg msm8953_intf[] = {
 		.prog_fetch_lines_worst_case = 14,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x268,
@@ -149,7 +147,6 @@ static const struct dpu_intf_cfg msm8953_intf[] = {
 		.prog_fetch_lines_worst_case = 14,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 5cf19de71f060818d257f95aa781b91ec201d4e4..ae18a354e5d2a3d2e073f2099e4d970bff5ed085 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -241,7 +241,6 @@ static const struct dpu_intf_cfg msm8996_intf[] = {
 		.prog_fetch_lines_worst_case = 25,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x268,
@@ -250,7 +249,6 @@ static const struct dpu_intf_cfg msm8996_intf[] = {
 		.prog_fetch_lines_worst_case = 25,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x268,
@@ -259,7 +257,6 @@ static const struct dpu_intf_cfg msm8996_intf[] = {
 		.prog_fetch_lines_worst_case = 25,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x6b800, .len = 0x268,
@@ -267,7 +264,6 @@ static const struct dpu_intf_cfg msm8996_intf[] = {
 		.prog_fetch_lines_worst_case = 25,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 31),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 4f2f68b07f203a11529f7a680fb87b448305d80a..bb89da0a481dec053e06369dee8b0854a3427aaf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -202,7 +202,6 @@ static const struct dpu_intf_cfg sdm660_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
@@ -211,7 +210,6 @@ static const struct dpu_intf_cfg sdm660_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_2", .id = INTF_2,
 		.base = 0x6b000, .len = 0x280,
@@ -220,7 +218,6 @@ static const struct dpu_intf_cfg sdm660_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 28),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 29),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index c70bef025ac4190347f81d75caf4777786fbeaf7..7caf876ca3e30cc9230cbc6f19b9d3d1b954e2e0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -147,7 +147,6 @@ static const struct dpu_intf_cfg sdm630_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 24),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 25),
-		.intr_tear_rd_ptr = -1,
 	}, {
 		.name = "intf_1", .id = INTF_1,
 		.base = 0x6a800, .len = 0x280,
@@ -156,7 +155,6 @@ static const struct dpu_intf_cfg sdm630_intf[] = {
 		.prog_fetch_lines_worst_case = 21,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 26),
 		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 27),
-		.intr_tear_rd_ptr = -1,
 	},
 };
 

---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250408-dpu-drop-intr-rd-ptr-76b52416c125

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


