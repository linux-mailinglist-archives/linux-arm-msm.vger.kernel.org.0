Return-Path: <linux-arm-msm+bounces-42436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BDE9F3F61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 01:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEBD6188BA2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 00:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F25D165F1D;
	Tue, 17 Dec 2024 00:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NBm+txOa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560A4144304;
	Tue, 17 Dec 2024 00:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396227; cv=none; b=dsEuqKAQaWhS8RHW9Jtzw1C536tuccxrbfBpyG/AZxtPXfsd9kiyx998pcgQKK18JSbKBFVsR29eIP5DJEH7W/wdkRFIv3J3nZ13yR3qA52tySvzEAbpcSEN+CLkEXVJMwsiXVQejeScnam+PVsW472+c5OrcQWUpkhBAF8Mt+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396227; c=relaxed/simple;
	bh=UIFJUBfcWwuu/5uShWzSTjrR9NKM2FrGyohMdZ4Knx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZYlzZVCYP6HS10tBz2Tst4zmMyqVSaZ7o2gJCok7QWPEZbL7+54h7p0iVc94RspApnkzs3Une0SMYhfX+Axuz0sXG42jiv8YOS2/l4C2fimY47UIItcno4JadzrVvxzYtWptyYHF/adbH0oVDOSbsGGcpYLDl0gUwTNgI33s6Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NBm+txOa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGIwlxF010559;
	Tue, 17 Dec 2024 00:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pjb8K9raaPoM51P8gPQlDCx/+9Iblgy4uUEHm377GN4=; b=NBm+txOayx8ADg2X
	g5w/0MB/HUndn5CAeNkZ/lZ7dxxP7nccr6uWaUWTvx2YXVZHrMfJmZd4an9bfIXi
	Z4cCWtvMkHpXSvLgbiac4cgj5HBaUnbLY3PrpGCH94/X1wUYlYycr+epNxas0KYG
	9S93yey6SJeXC6jUW02DoPMzcClVXoYvsWYTRMvJpZqMW7O21plj+eCfAZ9+Dy82
	GVe4lCS6XvCLwvAvtIo1NCZUiVGFRj+prpD1bkwdpzIWGfBTrwS0j6Gb+ZO7x9m/
	P5zt6w/qrorsZZA6+ZvbeVnKsQ9NoJLNBeeino3b6SRG6HhS1YnX2ClQVQspoame
	vquAxg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jsy70mn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 00:43:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH0hSfO026901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 00:43:28 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 16:43:28 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 16 Dec 2024 16:43:21 -0800
Subject: [PATCH v4 10/25] drm/msm/dpu: Specify dedicated CWB pingpong
 blocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241216-concurrent-wb-v4-10-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
In-Reply-To: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734396205; l=6525;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=UIFJUBfcWwuu/5uShWzSTjrR9NKM2FrGyohMdZ4Knx4=;
 b=7fKCccagAD7yowz1dK7rawUNN4AT8zvgYuvDA6bjB1LFzFUPf8lImk4kX78k84hDJcbxxyrQK
 UDNDkk0UlDGBtswhz7Q5qCbRZHGBWcvBKIYWgZyRiyt+fq2UiPJ0cek
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: AXz0_Q7DrkZPDJrxKBkBZFqOGz4BQ92n
X-Proofpoint-GUID: AXz0_Q7DrkZPDJrxKBkBZFqOGz4BQ92n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 mlxlogscore=730 clxscore=1015
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170004

Change pingpong index and names to distinguish between general use
pingpong blocks and pingpong blocks dedicated for concurrent writeback

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h              | 8 ++++----
 6 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 33f5faf4833f7534a1403ccec560fffe8ea0bb1f..bfb64b7c1a471d0f9b9e69e9a0ed12bfc7f48a85 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -252,25 +252,25 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
-		.name = "pingpong_6", .id = PINGPONG_6,
+		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_7", .id = PINGPONG_7,
+		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_8", .id = PINGPONG_8,
+		.name = "pingpong_cwb_2", .id = PINGPONG_CWB_2,
 		.base = 0x7e000, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_4,
 	}, {
-		.name = "pingpong_9", .id = PINGPONG_9,
+		.name = "pingpong_cwb_3", .id = PINGPONG_CWB_3,
 		.base = 0x7e400, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index a1779c5597ae701496f21d3a8cb513189424a484..08742472f9cc812fbaf8f842ff7bd78f597e2b8d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -257,13 +257,13 @@ static const struct dpu_pingpong_cfg sm8450_pp[] = {
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
-		.name = "pingpong_6", .id = PINGPONG_6,
+		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x65800, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_7", .id = PINGPONG_7,
+		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x65c00, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 907b4d7ceb470b0391d2bbbab3ce520efa2b3263..76ec72a323781363d37b62fec752ea1232bbd75b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -256,13 +256,13 @@ static const struct dpu_pingpong_cfg sa8775p_pp[] = {
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
-		.name = "pingpong_6", .id = PINGPONG_6,
+		.name = "pingpong_6", .id = PINGPONG_CWB_0,
 		.base = 0x65800, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_7", .id = PINGPONG_7,
+		.name = "pingpong_7", .id = PINGPONG_CWB_1,
 		.base = 0x65c00, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index ad48defa154f7d808c695860fd91e60bbb08f42a..173f6f53a30cad117c0faea14f4cc512988a61f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -251,13 +251,13 @@ static const struct dpu_pingpong_cfg sm8550_pp[] = {
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
-		.name = "pingpong_6", .id = PINGPONG_6,
+		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_7", .id = PINGPONG_7,
+		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index a3e60ac70689e7f8af8813d978626cd7d4c9fb3e..592ba9abd1adce2932d5e891aefa1bbd3867e5ed 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -251,13 +251,13 @@ static const struct dpu_pingpong_cfg x1e80100_pp[] = {
 		.merge_3d = MERGE_3D_2,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
 	}, {
-		.name = "pingpong_6", .id = PINGPONG_6,
+		.name = "pingpong_cwb_0", .id = PINGPONG_CWB_0,
 		.base = 0x66000, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = MERGE_3D_3,
 	}, {
-		.name = "pingpong_7", .id = PINGPONG_7,
+		.name = "pingpong_cwb_1", .id = PINGPONG_CWB_1,
 		.base = 0x66400, .len = 0,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index f8806a4d317be0974c6ad5ad9f772c5029c1f8e1..fb3b6db8112f567f23ddab474d777182abb86033 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -181,10 +181,10 @@ enum dpu_pingpong {
 	PINGPONG_3,
 	PINGPONG_4,
 	PINGPONG_5,
-	PINGPONG_6,
-	PINGPONG_7,
-	PINGPONG_8,
-	PINGPONG_9,
+	PINGPONG_CWB_0,
+	PINGPONG_CWB_1,
+	PINGPONG_CWB_2,
+	PINGPONG_CWB_3,
 	PINGPONG_S0,
 	PINGPONG_MAX
 };

-- 
2.34.1


