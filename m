Return-Path: <linux-arm-msm+bounces-42449-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4339F3F7C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 01:50:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87872188BC4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 00:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21EC21DACBF;
	Tue, 17 Dec 2024 00:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iK3M3g62"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E78C15B546;
	Tue, 17 Dec 2024 00:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396231; cv=none; b=HQcRkURP4uuXsF0BDdlMSiW3FJ2g3VC4lnf6NKf3uhcrrojshdSWdjKxh8MbfU3qvwZjub2jo/jk/UzthWflbQBpUUEAniwboWi95b4LCwHt7ezn3HtgkNSm9RfovM1hbaSBhy3VMoMLGtgOe32orOvUR59RfbO7G34+A37DuRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396231; c=relaxed/simple;
	bh=6TmjvrMFq82rXxJ63TTJFbF6OaDvNWhdftRI5ih59ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Br1M1L/HxN/XhtTmo2njIg3CRwwnBTNo6splGImXBM91mzmiHBx3qwU81gZKfJUTBjenXA9XOauJSoAL/gNuyoSAWKugPjcaqAQiidGwWgm0OyoydNA9ZDzEZh1iqr+75ja+Ne8xRBw3umkuABpKv3nLocdo07ZluqpliPdcAEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iK3M3g62; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGNrXFM029241;
	Tue, 17 Dec 2024 00:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a+/weF5FMqL6CWUohtahW61Y8XPnw/d0QZXbRQON2n8=; b=iK3M3g62ySZsGXIy
	1Dh1cGkyeMNRlmde/LICAl6bjEfsoG8anrUp2wgI8+doH5Tn6yMu58ES3/EGAfov
	G6hEE+UC8/3REIMessTsfM/JH9oqDEvMp/9UFhBCT50XZFIcdfwR/aJvGIHIBsfI
	FrRVB0q3FfZveTlqYrEsI4Fr6Peqv1+GJdOkEn3tiNWCVHT5AiHEU6cwhI0X628P
	zXDm2T3sV3x9vpAF5WBsHi2qPGWlf4DcuyUns19LeB/D58QZ0GnUmD7NnhpHpT8g
	X5eNQikUxx4ZEcUBEXeIiJmyhDk35Cm26Hxu3crlzAJALk+JoVtSh5dOH0/eLu0g
	M59+Vw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jx9dg2w7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 00:43:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH0hTaH026908
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 00:43:29 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 16:43:28 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 16 Dec 2024 16:43:24 -0800
Subject: [PATCH v4 13/25] drm/msm/dpu: add CWB support to dpu_hw_wb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241216-concurrent-wb-v4-13-fe220297a7f0@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734396205; l=982;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=7lCsl32FDI3nF0Cp2gbNQTowDMly5nFBRwOQ66ZX6VU=;
 b=EZH5PA4l5py6Z9e0o3vA9+sft0xN2KE104exVlC6r1kLTcBuv1dpb/7yC42mO64rqDpnzeFNa
 u57Y+3YWKd3AjikSC6egCU4m+r0j+srTFhnTWN6RQMYDQvTGDeYJZC2
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Uy5ClqlEhQcVUxmzvOPqSxVnISUs2xo2
X-Proofpoint-ORIG-GUID: Uy5ClqlEhQcVUxmzvOPqSxVnISUs2xo2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 mlxlogscore=872 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412170004

From: Esha Bharadwaj <quic_ebharadw@quicinc.com>

Adjust the WB_MUX configuration to account for using dedicated CWB
pingpong blocks.

Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index fb9f909577624959560abddbab8d03b0b1ea11a1..4853e516c48733231de240b9c32ad51d4cf18f0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -173,7 +173,9 @@ static void dpu_hw_wb_bind_pingpong_blk(
 	mux_cfg = DPU_REG_READ(c, WB_MUX);
 	mux_cfg &= ~0xf;
 
-	if (pp)
+	if (pp >= PINGPONG_CWB_0)
+		mux_cfg |= (pp < PINGPONG_CWB_2) ? 0xd : 0xb;
+	else if (pp)
 		mux_cfg |= (pp - PINGPONG_0) & 0x7;
 	else
 		mux_cfg |= 0xf;

-- 
2.34.1


