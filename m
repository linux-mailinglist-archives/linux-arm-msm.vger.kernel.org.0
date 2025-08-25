Return-Path: <linux-arm-msm+bounces-70718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9DDB343B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:29:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7DC7F206F21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462503090DD;
	Mon, 25 Aug 2025 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIlOjsgy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9547308F2C
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131588; cv=none; b=Kg9eh14CxFGqke1kJP3ZfROWYWZlQoxght6yKnsaFg57vtwGucYVZCA1Y0t7NEmF+BQnPzKfSWramWWWJ9PPGMmn1+Dzq8onIRtgzg8nxetfYYRAHPqhzRshguaN2mx7KGk4xWpxrJgfruZttdWhKE2MeLGtM7DqkytPiWzkYYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131588; c=relaxed/simple;
	bh=oCUBHkG6GpdcXqsxM8KNCtZVQwnjIFL+vEG1AP/TG4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iqABmhh0g59/U1tfnyJKoV6GRx27QSTFxfE9A+CNZ58N4MVXLsMEzyfu/UAZxj67SVWXEMBKXRm7pNgUPCTezsVJdMkBolqLn1xGbcKMXiHRczwA8RoYGSbvG2Pl+lzP1zMDoHfzv2OEfgeEHCCEU9gLCxXDcygqe2QNnAYU1hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIlOjsgy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8XLko026863
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+jVSUKAsQPlwDM3u72L5IpcDx7MSfvV8k0RhLT9MO78=; b=cIlOjsgy0stORp13
	cMIr4V6yg1/MoiujKBG1ddiRRx5+xYE5duh2JB9t26bVmhCQxdwhUTqerYF7fpGN
	6FQplpc7YsSF1vce94Fj79eiH/x/Gh/uO55Km6tHl9PkFYmDVdEEBPrAA8qGMy93
	6xJMKVsyIM82LaFsL5pYk07NghQIoWIhWgroBI0fo3stsMLZq9vDwyRnjrvc1Bj0
	uJdL5gqP0+LTzvV74dd5pMmy5HKcqDUAHzqoaH8Ajhu5dJwn3L7tpW0kUrAsjhgy
	GIBxSYptfir27eh2pR4gU9XjkRCS5OdBHWUHLD2c8rHHdUAVwuehw97+Z81rNwfV
	6sLcIw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thwbsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:19:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e1ff27cfaso5090006b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131584; x=1756736384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jVSUKAsQPlwDM3u72L5IpcDx7MSfvV8k0RhLT9MO78=;
        b=vljqAByAytAUzg8EJA7LM0y2IRlLrWwwIiseYbPmdMRMkRBYNGkPxgH71xzjr12++2
         Arl/sJuVkXg0jcEYY19FSZ6vhNOa0gZnBnBkSWwdObopfypo2nfMKNcrnVTk2pV0nKrO
         +PN0pMNWn5KcaZyTR6TLgFoy/YxlJyD1+HKmBPesB/hpKa9sG8yGmv/e0uBZsTamgBVS
         puQMWpt6JCT96Ve42NOyDA3T5azqX8hovdeEJRah4IQ31v1L/M+j9WqZhJ0gAOiun+Z8
         PxI81YA6NDds2d+Thzg6lwL+V3fT/ob/kZDjxpii/aAfNfQb978sV/s6W3mugPFBYy2A
         fkSg==
X-Gm-Message-State: AOJu0Yw7IveFOv9OLAzHzK46wCh1D1w4+KjD6ZKRQhD6eeKPA9UcCttV
	42ndnCYvyIptuD8qOTqfYTLH47TB+C+p1gGquIGs5wvxypYrwgC7/4KUbGyLm92OTIQZyRh9ES8
	m8oZ1fSl+8O+5JELBo+3du12/MS3nfyM0wsukWo2EG5SjvR+vpyrFCdAOi2Ss9Ba5LWFlVvigzT
	AL
X-Gm-Gg: ASbGncuqsxLp2JcyHHZFuWolAOLXfhK3z/UfUQUdyAVo/b3b39app6GXMzoTGcRmhAK
	tiAcnTuK6k4XgCp9aL0FBIj8GOvldlLeTuKyyAoMWXTaHsv0UeIj2iigxuQu7FkbvV+lvVCp7Yo
	b+V36caa6p+4nA4n0wmv5ltcdyRFBHEjwgsAjo12Qlx3iqH1mpBEfv6dNxORKw0K5km2A+7m4w2
	uzqsQLxGMugRcJYrOCwgci2k32EutiEMWe1PvySl6Pe7uippmn2R5XAUSaj2VQF7SIiF/0m1n8y
	WqktvBAzNJ05OjygorctfmCSNTON3fpQQhX2eR2l3WNEBFRc4MZi/jV3947Qb7ovWCju3LQ=
X-Received: by 2002:a05:6a00:22d3:b0:771:ebf1:5e43 with SMTP id d2e1a72fcca58-771ebf167e9mr2327027b3a.8.1756131584141;
        Mon, 25 Aug 2025 07:19:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFe0YeC0P+4yC3N9AqqpH6lpU7B9stvJ/fZZOCIPAjAFRvUMYvzfHo9d1n1TKTLxwYU2PlooQ==
X-Received: by 2002:a05:6a00:22d3:b0:771:ebf1:5e43 with SMTP id d2e1a72fcca58-771ebf167e9mr2327002b3a.8.1756131583615;
        Mon, 25 Aug 2025 07:19:43 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:19:43 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:23 +0800
Subject: [PATCH v3 37/38] drm/msm/dp: fix the intf_type of MST interfaces
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131425; l=5326;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=+Hotjobwxn+plNyiLv9VlefYm+B1NrsXftE9mGji/Lg=;
 b=JbQJxplIOcDHZ0JmbYy/iZFMTiBfTUSofsps0wDjfQJg8eNPyTt0NnzvDfdNie2Xv99iSPYrZ
 nMia26c0WmzCZHuZ1DfLEKOJnwqj97/VWBYwvNeyEKC8FLyajce/9Jz
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX5OzlJWHe0Yt8
 NuXRCtDhnKJiw9XuLFCyz+YXAhWG5VOxNEdUVK5tgY4lZxEgtjWcWXgfYmM2UAOVihBbnhGX+Ss
 53ha3gZsqHeED/K1b89ZW6J6IEzxoDkvwqnnoZDezwNuASMQGc5V0NZFEtmXY8NHcJQwR5HKxC4
 avle94Vf2OS7n4ZW5jhR0qQsVHAUsBWaIW5tUYtNYoYedejE9KIe1tmqZVdBeqHnp7IxWAQ5J66
 L0DS7MTfZ1w0MPDHndmoJbbrx8SWXHg+BvYbSEnirUvWBdAZDkinrbIYABAIZsiiQ5g0/P9iHpx
 pVs0w3TmwFHuZ0/xH1TCEa/UjCFMczfD0QBz9qTqa4ombhDqvYDVqFzZ6Z25fhklKkDxukXx0VJ
 LINr6gFk
X-Proofpoint-ORIG-GUID: qDc_iv-qdmbwSRQiTIEw-qhsxDeikgV9
X-Proofpoint-GUID: qDc_iv-qdmbwSRQiTIEw-qhsxDeikgV9
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ac7101 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=LQ6fVd0KmpP54VAw49oA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Interface type of MST interfaces is currently INTF_NONE. Update this to
INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
dpu_8_4_sa8775p.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 303d33dc7783ac91a496fa0a19860564ad0b6d5d..ea2329f0b5e977bb0ee3035ec1b3a3e23bbe5b1e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -319,7 +319,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -351,7 +351,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -359,7 +359,7 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 0f7b4a224e4c971f482c3778c92e8c170b44223f..00fd0c8cc115a4a108363f6185edf93e771b2bf5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -347,7 +347,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -363,15 +363,15 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
-		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
-		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
+		.intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -379,7 +379,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 7243eebb85f36f2a8ae848f2c95d21b0bc3bebef..826f65adb18b118cf8b70208837aa7979c5701b6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -335,7 +335,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -367,7 +367,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -375,7 +375,7 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
 	}, {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),

-- 
2.34.1


