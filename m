Return-Path: <linux-arm-msm+bounces-75996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ADABBCF3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 03:40:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7424E3B755E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 01:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735111C7005;
	Mon,  6 Oct 2025 01:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pLCnz8Qg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F511A9F8D;
	Mon,  6 Oct 2025 01:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759714788; cv=none; b=pXM7Uiuls3xkmYqa3xqfkDgJboPI5JoNZUHhdi9kejAScTMFuK+gcAuNNwZguusRb1kVlcpsNaNP547U5japFoMLyMwG5pjYO/CzYiROxDmSjTStZKqxhfmyWdtwi8rEuMybvgkSK56Izyhw3o+Vx1TjnDzycCCBQoBWwIvb8dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759714788; c=relaxed/simple;
	bh=ESgYYVi0A0xncklkl9NDgoQ/TzaNJ96GPyvpZFXhDEY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UPoPxpa/8byz8qKvTVAO3MPNki5hU3a54idlzHMZcTU8QlpJavCR+gxKvqChTUJg+W9XaXmQ+EXfucCflkpH6/MZZNb8gnKAtixiDEx6S1aTYxirISXQiQqSxzJkKiZFvAmj2UJSoTubwMLBcbgvl0g+w2OAK1cNg+HbFcMnIvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pLCnz8Qg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5961VHDq009872;
	Mon, 6 Oct 2025 01:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7GcIhqa553o
	mhiuOGSm46VDvLsLp5sH2+vBnZdVzvnE=; b=pLCnz8QgSfCOty7iFFSGNRrEsfe
	dJGgAn7DQVpZ3mKISl2CpuJYAPReHGj4rcSQHxFSnrdWCiiMHE8Lo1KPYYl9G1lG
	S2eBHy3taczpCAPkNge2E+5tWQ6ZkGRQAlRIFlhXQ7j94IrFjEFqPDcnMWUV6edB
	+kKqh5LbvyBHGDAOwiEXf2fE048TQ9ovEl2lhKvd58FFBNW0/PWLlLi/Jj4Kytbg
	DxJ8uJLIajX3rjPJvloswglveTCgIFP6FfA7DP72BNjpTW1Xwv8ZVU4jZ1KALeEG
	9ZPTZhUYU/MfjJ10gr8QRd8sS1ul+JPPWSYEhV1XXIDOYWm2grWRiv+weoA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu2s70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:39:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5961dRHq003772;
	Mon, 6 Oct 2025 01:39:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 49jvnkybtx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:39:28 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5961dRtt003738;
	Mon, 6 Oct 2025 01:39:28 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5961dSbN003790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Oct 2025 01:39:28 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 5787C59E; Mon,  6 Oct 2025 07:09:26 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: [PATCH v2 5/7] drm/msm/dsi: add DSI support for QCS8300
Date: Mon,  6 Oct 2025 07:09:22 +0530
Message-Id: <20251006013924.1114833-6-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
References: <20251006013924.1114833-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PImj46BdAPpzGjJqdexAHCCnTdgdAmq2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX7ZJAFMIGytmj
 Xh3dUR4chHz7KF3Z4z1Z9sTjBFy5MvmtvdLW+P/7ZsOP7eOSny0xBGbB/iTZBrDiXrdDeyUbIKx
 jb2QkmQ9OpNNrtUnyUFaUPP7zrYuMXZyXG0PWFGFkNFdot0OAii8iGnjtSJAmt9pH1u1H+kFney
 oSTK30D6MgXUMcbh49GnCG6kkn5BDydt36hpOg3qlh+QMrOlxk59jwI0ivbypd6NlgULbRtItz+
 qrpCLbTQXbPnkB0pGKXULK1WHwCcRtVw2sE1Kmv7O6o1psWVlJXSct844M2EufwA2YMyMG2Iqzn
 zo7gVfYpRXPRscaWEUg8/57n4tbZuBMv4rqsWs8bV7Yx3QnBKboV0Gx9X/Zm1hU4MpDlg8u1U+x
 vOq892G4IIXDLRV7anPv0GXD6U/Epg==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e31dd5 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=A-KxhFXCQp9C2J9DxaUA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=nl4s5V0KI7Kw-pW0DWrs:22 a=pHzHmUro8NiASowvMSCR:22
 a=xoEH_sTeL_Rfw54TyV31:22
X-Proofpoint-GUID: PImj46BdAPpzGjJqdexAHCCnTdgdAmq2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_01,2025-10-02_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

Add DSI Controller v2.5.1 support for QCS8300 SoC.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index fed8e9b67011..b60384ea0b32 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -226,6 +226,17 @@ static const struct regulator_bulk_data sa8775p_dsi_regulators[] = {
 	{ .supply = "refgen" },
 };
 
+static const struct msm_dsi_config qcs8300_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.regulator_data = sa8775p_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sa8775p_dsi_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
+	.io_start = {
+		{ 0xae94000},
+	},
+};
+
 static const struct msm_dsi_config sa8775p_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.regulator_data = sa8775p_dsi_regulators,
@@ -322,6 +333,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
 		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_1,
+		&qcs8300_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_1,
 		&sa8775p_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
-- 
2.34.1


