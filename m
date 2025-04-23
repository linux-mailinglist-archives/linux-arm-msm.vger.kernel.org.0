Return-Path: <linux-arm-msm+bounces-55204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A40FA99A54
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 23:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B30B85A1C74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B11296D1B;
	Wed, 23 Apr 2025 21:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="co8W2SKd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746312957D6
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442651; cv=none; b=mXABv3s+LCrOXoVi1GfWW7kYwjBxbtChjLhseoLdtR+8dcrD1NLg2TnQJYzahxdEmLamlmQuya4C6zMn4nefrxuAY7a7kF8Mk4ux7PRfHtAQYFJZOoL/aKmOHzRuqgXZNXr8p/O3q/4wn1Hc6dwCSUOLnCVbJ9L2ursyLZyNobA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442651; c=relaxed/simple;
	bh=sVjDnbu/vU4vbSPFjPQ8pr3iE3M+D1/vonOvIJym2ZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fdaVQ3PBGEBRlfgH9cBv3paDOSGbUOp8o+K7h9NRlMe8vaCbiJovhm4889PuQ5Dk4P/ztXzTLVQGwuB6uvR36QtF5mR/2+omxMzvrcuwvhwDLJ/GqFe5gv5KoEsl50SEdcA5tvzCdqghnF+azjsD0jPo1eXn8DcXqQSsKOvwfvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=co8W2SKd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAU2Qq014698
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUNohj1oYOREZSz2Ezwr1wwrzPXSOqlAlmNVNIytYfE=; b=co8W2SKdwhTDx88P
	cDW2wOZ2KOkbovw6LLpXU2zBbtFh0HcUu3FhESVfqEAhZiSi35SbqCxijXow6Mo6
	/G0LNg4xnHx/ViSasT9FZXgmjFLYlYOiYK023rLIy9n0+fx7HBy8UBy3USxybtL1
	diMA966AJIRdax3D45UiM8z0nEAenumqEZTkqb6X3c77JhBo/GBP4oDPUHXs7zrJ
	MMKBhucCkJxLUOjX45mVw3PVeokWGWKTdEAoq8AdiHRBnxrk3QtPfTT6T/bZJGrt
	xQA0gq3gUFMRtb1BdarY6hRc2/OsfYGxwO99L5CHMul6GMF8NkBSuSrkx9pZcR0B
	7FdoBQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0kcwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 21:10:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e28d0cc0so41826285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 14:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745442629; x=1746047429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUNohj1oYOREZSz2Ezwr1wwrzPXSOqlAlmNVNIytYfE=;
        b=pUQwCJsnz1Z8bViiwQQKz9djQDqdAe9Zepnsui8IGoo+h1O8xxFAVIvc3QL8IIrgxt
         SJELaHyldkrQ7oFc1e/No0HdA0INpnc1SND5Ru3tKwtkpcPVyTT2OBEGKh4kZLe5eAPp
         DYpdXrDML+Q5/sAHW1zhyUyJembPvJ2+3k57pDV+6xmhos8TRB4X9zJ7OmQZIpHEEXZ6
         zHKfDaa4BvcqZinLVfAopdO4mYbnmyiY9Fg4pofHineiygLD6M/iF9vAmZFdOGqFJzjW
         +r5w46xmftH5KCHMgXKSgyrvEoW+4bOlyg9uzv441XBtk7N0tAaOxY2PAO3+CECwxrGp
         kaxw==
X-Gm-Message-State: AOJu0YwKOVNlTwlNoBVBAvDfq5T57XaYcWVvI/Gx23akr2n13dgk05kh
	CEyrwDKcjvgUwiPtp/9SgKkfU2E0DPGQ5PezjUAsD9Vl4fBxiu3VnpNLm2j0PYi3zlhCaXV0/50
	JEy7In4yFwQC4jFyJOIMTdjeM6y6G3ob0lJNTGoN3ENp85/V6tjUXDIWM09PzyiEO
X-Gm-Gg: ASbGncv5999F5V6mG3qy+DE9w8xcgSu/6p8pfconmv9pgUVrss+Y433nFaEH6kaR0l8
	3rUm+Qjg7oSyGdqTGckylPmft5RszFYdxyHhbboSG6u7P+oaAezLzm+MaununDbDr0MRl7TXlAq
	ZbRls1hNaMph0qgs2tcvn8p9gjAVdifeZ0j1sJpu0G8rTPno5bXUdxurpInHzUbkfLPcIdJUtLZ
	BqbPFcpdixj4lJ5VfDFO0Pee3xSU90ud03mATt4cNfbGgPix/f8HdogHbGFztzalGAaBsGdX+Ew
	WVum+j225oJYa10ReX+LcQ7j3Bjrk96rxPR8LiqdAuRaBeLAXruB/r2iuu0J/Q7lYUqHvrdsNAL
	juTRZfKWEdVPtjW1v/7zlaIEZ
X-Received: by 2002:a05:620a:170a:b0:7c7:bb7d:f67e with SMTP id af79cd13be357-7c956f4e4e0mr58946785a.47.1745442628662;
        Wed, 23 Apr 2025 14:10:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+Xd025jTmDIj62H8Vi325NxoN4a6BcdO6hcK40T8p8JAc7GDxrLgz14ndc9MgBlum0nkXiQ==
X-Received: by 2002:a05:620a:170a:b0:7c7:bb7d:f67e with SMTP id af79cd13be357-7c956f4e4e0mr58943185a.47.1745442628220;
        Wed, 23 Apr 2025 14:10:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 14:10:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:04 +0300
Subject: [PATCH v2 08/33] drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-8-0a9a66a7b3a2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11085;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=x2jmSC9gKl9NnUFLRgdzswBb50uCdVNQ6+tX2ykb8hA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcrfAZT2Nr8ohtU0Bi62ICApZ4NYr9UVtZAY
 r926csyyauJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXKwAKCRCLPIo+Aiko
 1TNuB/48aajCkqms+vq/OPGGSVamQdEEKxdDnNWvcc56lHF+azbBDaTS7DmomWXJ2C/jsoWuB/7
 ElyvRCMGv1mT+Qn6bmoBNUKNwzx+wtPp8CMpwimEm/GFZqnllwABXuGc5byOay1unN+iW6RecCB
 ROoIVeqRjWGtzJr0OCca9loYK6NWSHkGIoQKemaVE9RLpU+gXc4BWJUvno6e2KaQMfJViM8dwI+
 ZDmzy2kCC0kTllvhn1Grqbwq4htSgAaoxLlFrvaZGnNmRaa/RqV0pVyuUi7vVCMKLVYJ4aeRZ9f
 /L2T+lnGlVO1FSiGA1z5UbZvs1iB2+KRAyraMXr/KTuIhuFB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: jZg-Y_TnjK194EwfZeYU_72To9uo32n3
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=68095758 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=mVeP-GC--jfuYOuej4MA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: jZg-Y_TnjK194EwfZeYU_72To9uo32n3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfXxvkkpQmfuoSo NVKGMTX83U8stAmojAwdj5zesvNETW1zypxDM7ouaQwBKVtm0QTPRWzZ9bAKHXLfz9JJ9nuAajQ DwxrQFSzCTgiBIMx2FEEFGJ/K37IGc96ldNl9mKMI/v48kMsj5LR++QQBwdfkb+8+n+OiS+4rNe
 LZunszzGCcUGrQtv2J/wxAOdUOw1/R4JSWxD4ifjqGt5+qMetrqR+fwXc4j+1wmYqRPQwL5oubx sFsrI8ZranddEJ8t6qfRjtLTZjB3sA11CmRFQ8xzeVVBFnCB4xXv1vMm0GVc4msSszUZrUXn00q KNAKa5aQDzw2A+rCacMJdRX0W+0i05i8y/vndmpwv4Z2IrXXBj/cNqC/xSk3fS792uHONEOkwag
 L5tTBQwUhW9+YNT6iQImngdfMTwDQYDzI9cBI2cFMQqfZNrY6mgpBC22R+Q/HZvgIVJCtaGB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_HAS_LAYER_EXT4 feature bit with the core_major_ver >= 9 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c               |  5 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h               |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                   |  2 +-
 8 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index f7acceba7af1e8ec4b9c0cb52cbec60842c73704..922c9c6ebd82cdfc7f948df590091852282c9f64 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -32,32 +32,32 @@ static const struct dpu_ctl_cfg sm8650_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x1000,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x1000,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x1000,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 3907d143056e2513a6a6bdd8aa2b56f63ac406cb..e17345d954f26b234ef6cd65843e1cb349376ed3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -32,32 +32,32 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 8cbec3741338aba07a780194ae50c162d2087d83..4d37587d6a6374d9e6ed6d8f13837aae0ef55c34 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -31,32 +31,32 @@ static const struct dpu_ctl_cfg x1e80100_ctl[] = {
 	{
 		.name = "ctl_0", .id = CTL_0,
 		.base = 0x15000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
 	}, {
 		.name = "ctl_1", .id = CTL_1,
 		.base = 0x16000, .len = 0x290,
-		.features = CTL_SM8550_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
+		.features = CTL_SC7280_MASK | BIT(DPU_CTL_SPLIT_DISPLAY),
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
 	}, {
 		.name = "ctl_2", .id = CTL_2,
 		.base = 0x17000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
 	}, {
 		.name = "ctl_3", .id = CTL_3,
 		.base = 0x18000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
 	}, {
 		.name = "ctl_4", .id = CTL_4,
 		.base = 0x19000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
 	}, {
 		.name = "ctl_5", .id = CTL_5,
 		.base = 0x1a000, .len = 0x290,
-		.features = CTL_SM8550_MASK,
+		.features = CTL_SC7280_MASK,
 		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
 	},
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index fda429972c35acc1e44c4384cf6d72d7e9f120eb..c3b659a12d58e18aaba65ba88ff5de131d712412 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -116,9 +116,6 @@
 	 BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
-#define CTL_SM8550_MASK \
-	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
-
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4cea19e1a20380c56ae014f2d33a6884a72e0ca0..81592cbdd5d234dacc154778492382faecfddb39 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -136,7 +136,6 @@ enum {
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_HAS_LAYER_EXT4:	CTL has the CTL_LAYER_EXT4 register
  * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
@@ -145,7 +144,6 @@ enum {
 	DPU_CTL_ACTIVE_CFG,
 	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_HAS_LAYER_EXT4,
 	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 466bfee3db52d980877a5cdc4eeb739cae250afc..8a7408801bb59e8799e67115ee00cdfe87eba668 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -549,7 +549,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(c, CTL_LAYER_EXT(lm), mixercfg[1]);
 	DPU_REG_WRITE(c, CTL_LAYER_EXT2(lm), mixercfg[2]);
 	DPU_REG_WRITE(c, CTL_LAYER_EXT3(lm), mixercfg[3]);
-	if ((test_bit(DPU_CTL_HAS_LAYER_EXT4, &ctx->caps->features)))
+	if (ctx->mdss_ver->core_major_ver >= 9)
 		DPU_REG_WRITE(c, CTL_LAYER_EXT4(lm), mixercfg[4]);
 }
 
@@ -720,12 +720,14 @@ static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
  * @dev:  Corresponding device for devres management
  * @cfg:  ctl_path catalog entry for which driver object is required
  * @addr: mapped register io address of MDP
+ * @mdss_ver: dpu core's major and minor versions
  * @mixer_count: Number of mixers in @mixer
  * @mixer: Pointer to an array of Layer Mixers defined in the catalog
  */
 struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 				   const struct dpu_ctl_cfg *cfg,
 				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver,
 				   u32 mixer_count,
 				   const struct dpu_lm_cfg *mixer)
 {
@@ -739,6 +741,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->hw.log_mask = DPU_DBG_MASK_CTL;
 
 	c->caps = cfg;
+	c->mdss_ver = mdss_ver;
 
 	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
 		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 080a9550a0cc6530b4115165dd737857b6213d15..aa560df698ed4e57a25e4a893d7333e19b065fe8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -272,6 +272,7 @@ struct dpu_hw_ctl_ops {
  * @pending_cwb_flush_mask: pending CWB flush
  * @pending_dsc_flush_mask: pending DSC flush
  * @pending_cdm_flush_mask: pending CDM flush
+ * @mdss_ver: MDSS revision information
  * @ops: operation list
  */
 struct dpu_hw_ctl {
@@ -293,6 +294,8 @@ struct dpu_hw_ctl {
 	u32 pending_dsc_flush_mask;
 	u32 pending_cdm_flush_mask;
 
+	const struct dpu_mdss_version *mdss_ver;
+
 	/* ops */
 	struct dpu_hw_ctl_ops ops;
 };
@@ -310,6 +313,7 @@ static inline struct dpu_hw_ctl *to_dpu_hw_ctl(struct dpu_hw_blk *hw)
 struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 				   const struct dpu_ctl_cfg *cfg,
 				   void __iomem *addr,
+				   const struct dpu_mdss_version *mdss_ver,
 				   u32 mixer_count,
 				   const struct dpu_lm_cfg *mixer);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 3efbba425ca6e037cb9646981ebb0f0354ffea8e..1ed458aed2bc2c54f6e02acce43d88927100b99c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -140,7 +140,7 @@ int dpu_rm_init(struct drm_device *dev,
 		struct dpu_hw_ctl *hw;
 		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
 
-		hw = dpu_hw_ctl_init(dev, ctl, mmio, cat->mixer_count, cat->mixer);
+		hw = dpu_hw_ctl_init(dev, ctl, mmio, cat->mdss_ver, cat->mixer_count, cat->mixer);
 		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed ctl object creation: err %d\n", rc);

-- 
2.39.5


