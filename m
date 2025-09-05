Return-Path: <linux-arm-msm+bounces-72272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47272B4569F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 13:40:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB9F01C82361
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 11:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18EAF345738;
	Fri,  5 Sep 2025 11:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nftj2L7o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528893431E7;
	Fri,  5 Sep 2025 11:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757072387; cv=none; b=B/ukRtqeEqCWldY7bABmUXfrcp+vnoteJRBA8HwLXOTrJMBRWTgVu/NOSvY3C/9rb5AGCkCBdaqN7TQDcIVC1lP+EnPyWIEgNn8AHgoQwQ5HFQrBgoPJdJZAxMU4vISkAZFj+Zt2vqxh4hWrge+8rZT15bLJcWm57L65DttLpGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757072387; c=relaxed/simple;
	bh=sA1Qa9eAFu4jKg9STm99bgdrKQUviZF2tsq0paX7kxI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CfzIIF7oCdf3KPSkeV0kAaEsrCIfc9dg2FJCEingNxht3byUd0Z0zNz5pFOLy0CfhzurXcb8aLixo3IlcxRdv8/3Zk+qc78kbBK6Q2fgo5SKu1wShtCtgwQa0fJmvajXC/Cdujc87tcFanEMWF89NdImI2tBcEq8lL6uaLv0P8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nftj2L7o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5856lapW024267;
	Fri, 5 Sep 2025 11:39:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JO0ByhWMlXZgHRV2oIb9njmZj8dDlepqv38
	U0FSCO30=; b=Nftj2L7odX9NX42BG+L6n5x4I98RLIWUQ+YtGJAJfCluZs1EIeL
	ZIoo4PXKmtFGQyd49E1/pdtDM9D5zEwpIMOQRtub8EgdqsCruLe8k/YCwY8PKzhF
	qkpkJcyjsIVCNQOR+xdzW+6WS959acnyVu4aZRWvOfv0UeZmWH6IXUz6WwhsT12i
	pdVgsIEP+cx8wgq31MsG1ZF6FSqm2niiNiyuFyLlmtGWwAOho0RgHgkOP5BXQtgF
	GzTtsMbohIEvTbUt/LDo2jCeJJvcizVEXrs5ro/pruny9RdoUJ0knWO7IGG8MbY3
	EKgPgCoizSnpqvDr5Et9BsCw0l9qEiW1sRw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2ftu45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 11:39:41 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 585BdcqF029947;
	Fri, 5 Sep 2025 11:39:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48utcmfs6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 11:39:38 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 585BdcVK029937;
	Fri, 5 Sep 2025 11:39:38 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pussin-hyd.qualcomm.com [10.147.247.182])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 585Bdbfu029934
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Sep 2025 11:39:38 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4706513)
	id 7095253B; Fri,  5 Sep 2025 17:09:36 +0530 (+0530)
From: Pushpendra Singh <quic_pussin@quicinc.com>
To: quic_bjorande@quicinc.com
Cc: andersson@kernel.org, krzysztof.kozlowski@linaro.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rgottimu@quicinc.com,
        Shivnandan Kumar <quic_kshivnan@quicinc.com>,
        Pushpendra Singh <quic_pussin@quicinc.com>
Subject: [PATCH V2] soc: qcom: icc-bwmon: Update zone1_thres_count to 3
Date: Fri,  5 Sep 2025 17:09:23 +0530
Message-Id: <20250905113923.3944347-1-quic_pussin@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfXzHII4DoBvFSn
 CV6jPfqaHDLZdrpFaT7APr1p9uu8XfcaFdLG6eshh4ePkbR1sv90v/WeIhnCgjnidaP516HP8Ww
 ++FxBGV3fSzM+ac/9BfnSU2KBrSNVhoTVnMwe4VpbJQ1V1RVcJGcXKFBmc3XOyGbxgo+wgEki4+
 l1zzXcPtf+u35CHSVAJ/Hiw5nMYoGDbzwEGUfbDqs3ofY70Xge0J1aIbdq0mxsKj+sCAtGU2aNf
 VVcxk2LiBcoipsbLx9wXWuHYjZQV0Y3QO4OpvrDoSXuQyT537s12hOzlgNSK4hpl4YGcnSHt6MO
 859umM+wavFTEkyA9A5UnJ4YkzpJNl1H/X4rDAlJ4dzrs3Z6QAKTrRBKox5Bh9oMhdOvc/NvzvQ
 LeMtSJ2H
X-Proofpoint-ORIG-GUID: nfseTv96nNwb-Qd6i1edfjJO_wKGC9hf
X-Proofpoint-GUID: nfseTv96nNwb-Qd6i1edfjJO_wKGC9hf
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68bacbfd cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=O-FpyXNYiwpG-GJNJQQA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038

From: Shivnandan Kumar <quic_kshivnan@quicinc.com>

Update zone1_thres_count to 3 from 16 so that
driver can reduce bus vote in 3 sample windows instead
of waiting for 16 windows.

The 16-window (64 ms) waiting time is too long to reduce the
bus vote. At higher FPS, there will be multiple frames in 64ms
e.g. 4 frames at 60FPS in 64ms. Hence, delay of 64ms in decision
making will lead to higher power regression. We tested across
multiple usecases, and observed significant power savings.

USECASE				zone1_thres_count=16     zone1_thres_count=3
4K video playback       236.15 mA                  203.15 mA
Sleep					   7mA			   			6.9mA
Display (dle display)    71.95mA			       67.11mA

Signed-off-by: Shivnandan Kumar <quic_kshivnan@quicinc.com>
Signed-off-by: Pushpendra Singh <quic_pussin@quicinc.com>
---
Changes in v2:
-Update commit message
-Link to v1:https://lore.kernel.org/lkml/463eb7c8-00fc-4441-91d1-6e48f6b052c8@quicinc.com

 drivers/soc/qcom/icc-bwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/icc-bwmon.c b/drivers/soc/qcom/icc-bwmon.c
index 3dfa448bf8cf..a245a8b2cfef 100644
--- a/drivers/soc/qcom/icc-bwmon.c
+++ b/drivers/soc/qcom/icc-bwmon.c
@@ -827,7 +827,7 @@ static const struct icc_bwmon_data msm8998_bwmon_data = {
 static const struct icc_bwmon_data sdm845_cpu_bwmon_data = {
 	.sample_ms = 4,
 	.count_unit_kb = 64,
-	.zone1_thres_count = 16,
+	.zone1_thres_count = 3,
 	.zone3_thres_count = 1,
 	.quirks = BWMON_HAS_GLOBAL_IRQ,
 	.regmap_fields = sdm845_cpu_bwmon_reg_fields,
@@ -846,7 +846,7 @@ static const struct icc_bwmon_data sdm845_llcc_bwmon_data = {
 static const struct icc_bwmon_data sc7280_llcc_bwmon_data = {
 	.sample_ms = 4,
 	.count_unit_kb = 64,
-	.zone1_thres_count = 16,
+	.zone1_thres_count = 3,
 	.zone3_thres_count = 1,
 	.quirks = BWMON_NEEDS_FORCE_CLEAR,
 	.regmap_fields = sdm845_llcc_bwmon_reg_fields,
-- 
2.34.1


