Return-Path: <linux-arm-msm+bounces-42427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A38AF9F3F52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 01:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E3C016F10C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 00:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18AB814373F;
	Tue, 17 Dec 2024 00:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dppen9IF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228BC80BFF;
	Tue, 17 Dec 2024 00:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396223; cv=none; b=lnFEeIF0pvA3Igj1oUm8VfEmTJd8AGXk25nZtX+0FkjwROjscmVEAHGJlnmY0Zenef+QtblNE+4Oa8T2UaDO+Axzii8CjCrLgTYsF7ja8wIACu8qlg/NS9Oiy9jBpb689Gn6uCgu+ChcXFpg8yHXwXh6q3GhKch0up60hCCvRGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396223; c=relaxed/simple;
	bh=DFFSKRyL7yUawUyomMYfyzdvDTfJddfGjdlnoGtai+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Jpbh9/ean31MSErtG/Evr1QT13KuRxc2L93u9nNuBaLa81VWoe/MuQ3/bUaPvrCKOSYxs9qOz9z/veVhy4LK19qAnOW+J+hTJFxSRb9nAeJFBGrIam67pFYgUo2NYaFrfZgJFHXRGXaYlyh8NQ360s3g0zXKrada5dQjHHO8V1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dppen9IF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGMs0mP007517;
	Tue, 17 Dec 2024 00:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FJ+EnLMRzKUO6ekhFDU87KXcJr5GfDtByCFcvC8K6pM=; b=dppen9IFi236g09w
	DmrGjQsyNsS8elDIB7r/w9RQSMu3wNNiURybBtCQS7wkrPdvyrQp3TmRqNIMOk5w
	vujuO+H9G/Eb6zUw1fIuybZwGsVGb/YoLErU7mXsKahxW36yxFjCead0NvGxk9iT
	FJzfp78zMGZnwzG0m9RycnLuDF+Y72ofShFMWY4dh80D3qAYI1skxCX87dbfZqox
	fDEqtH4VBrAPL9nWMr8F3nVj0zo+lVWFFcNi2IosLoVuawxPlU5q1j8RdMqj5ggX
	2VGHnYaFuM9GNbCn3DznlSDC1oCg+sFV5VunlQ4XkI77VCuYL1YZmYwM1jSF3RVt
	l0Ienw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jwda062f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 00:43:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH0hS9b010612
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 00:43:28 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 16:43:27 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 16 Dec 2024 16:43:20 -0800
Subject: [PATCH v4 09/25] drm/msm/dpu: Add CWB entry to catalog for SM8650
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241216-concurrent-wb-v4-9-fe220297a7f0@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734396205; l=2728;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=kStX8bh0aA5tRNKzd3qDFnSHMOXA6VdkU7MMoTR0Z2I=;
 b=y+hzN9g4TSw6rH+hzNl5jXBRwoXH1tc8WDkoWBp98WSg5nMfWB4NcKJt+to9LJ2/Pzl4ooh7K
 n3V+Y5lbtVgBZ00942mpd6DtpBeZJqSgmRKO5h6mVl7P7lUotFxGmTL
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: egSxRwYUlBVVatlrIh5W6nYUX-ZeVQGj
X-Proofpoint-ORIG-GUID: egSxRwYUlBVVatlrIh5W6nYUX-ZeVQGj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170004

From: Esha Bharadwaj <quic_ebharadw@quicinc.com>

Add a new block for concurrent writeback mux to the SM8650 HW catalog

Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index eb5dfff2ec4f48d793f9d83aafed592d0947f04b..33f5faf4833f7534a1403ccec560fffe8ea0bb1f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -350,6 +350,25 @@ static const struct dpu_wb_cfg sm8650_wb[] = {
 	},
 };
 
+static const struct dpu_cwb_cfg sm8650_cwb[] = {
+	{
+		.name = "cwb_0", .id = CWB_0,
+		.base = 0x66200, .len = 0x8,
+	},
+	{
+		.name = "cwb_1", .id = CWB_1,
+		.base = 0x66600, .len = 0x8,
+	},
+	{
+		.name = "cwb_2", .id = CWB_2,
+		.base = 0x7E200, .len = 0x8,
+	},
+	{
+		.name = "cwb_3", .id = CWB_3,
+		.base = 0x7E600, .len = 0x8,
+	},
+};
+
 static const struct dpu_intf_cfg sm8650_intf[] = {
 	{
 		.name = "intf_0", .id = INTF_0,
@@ -447,6 +466,8 @@ const struct dpu_mdss_cfg dpu_sm8650_cfg = {
 	.merge_3d = sm8650_merge_3d,
 	.wb_count = ARRAY_SIZE(sm8650_wb),
 	.wb = sm8650_wb,
+	.cwb_count = ARRAY_SIZE(sm8650_cwb),
+	.cwb = sm8650_cwb,
 	.intf_count = ARRAY_SIZE(sm8650_intf),
 	.intf = sm8650_intf,
 	.vbif_count = ARRAY_SIZE(sm8650_vbif),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c701d18c3522393b7d18d085d6554119f27f737b..a407b522282bf07a12cd3af8febff8d91f52b8da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -613,6 +613,16 @@ struct dpu_wb_cfg {
 	enum dpu_clk_ctrl_type clk_ctrl;
 };
 
+/*
+ * struct dpu_cwb_cfg : MDP CWB mux instance info
+ * @id:                enum identifying this block
+ * @base:              register base offset to mdss
+ * @features           bit mask identifying sub-blocks/features
+ */
+struct dpu_cwb_cfg {
+	DPU_HW_BLK_INFO;
+};
+
 /**
  * struct dpu_vbif_dynamic_ot_cfg - dynamic OT setting
  * @pps                pixel per seconds
@@ -815,6 +825,9 @@ struct dpu_mdss_cfg {
 	u32 dspp_count;
 	const struct dpu_dspp_cfg *dspp;
 
+	u32 cwb_count;
+	const struct dpu_cwb_cfg *cwb;
+
 	/* Add additional block data structures here */
 
 	const struct dpu_perf_cfg *perf;

-- 
2.34.1


