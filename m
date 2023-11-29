Return-Path: <linux-arm-msm+bounces-2359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A147FCF8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 07:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A1081C20951
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 06:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A922A101DF;
	Wed, 29 Nov 2023 06:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EmjoSRZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B7319AB;
	Tue, 28 Nov 2023 22:58:22 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AT4DS6n009415;
	Wed, 29 Nov 2023 06:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=qGDZyLkSoHtcMnsZPlA3sOSXl2/82Oeo64ZLTh+FD5o=;
 b=EmjoSRZG3kb8A6fRCw1WqHZ0g/Dt9pmOJx1O3jZXfQQNdQuTqwCua0D5qOlFYRhMUhY8
 j0mGvzZt+gJbnfZiAvedTy1y0NaMrSv70+fHR/8+9WikaWlA3wXhMBP09N0IqXaaL7vy
 Vq1GvEeOqNtKGRdID7yfq9dYHzOuxnwYlfBFFKKwIzJx/DKyZGpwp1WwuRIGQAKA7TZG
 PihhZENtuLhVWHySJ+RYr6FRmQe5n/vsgOwtv2vouLOF2H6siHR56NBPmRs6fRIwiJyI
 8XGFt5oqOfQLRZN1TV+beY016u/IuEYmWGp9GgPyrU6NxyfXScycibBgJx+Uy+1weG0G aw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3unjdtj37b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 06:58:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AT6wG1T027258
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Nov 2023 06:58:16 GMT
Received: from blr-ubuntu-253.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 28 Nov 2023 22:58:13 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mdtipton@quicinc.com>, <linux-arm-kernel@lists.infradead.org>,
        <quic_asartor@quicinc.com>, <quic_lingutla@quicinc.com>,
        Sibi Sankar
	<quic_sibis@quicinc.com>
Subject: [PATCH 2/3] firmware: arm_scmi: Fix freq/power truncation in the perf protocol
Date: Wed, 29 Nov 2023 12:27:47 +0530
Message-ID: <20231129065748.19871-3-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231129065748.19871-1-quic_sibis@quicinc.com>
References: <20231129065748.19871-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ai59dcvVBLIw8QsbmAkP_tBPyjQWr3r4
X-Proofpoint-ORIG-GUID: Ai59dcvVBLIw8QsbmAkP_tBPyjQWr3r4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_03,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290049

Fix frequency and power truncation seen in the performance protocol by
casting it with the correct type.

Fixes: a9e3fbfaa0ff ("firmware: arm_scmi: add initial support for performance protocol")
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/firmware/arm_scmi/perf.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index a648521e04a3..3344ce3a2026 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -804,9 +804,9 @@ static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,
 
 	for (idx = 0; idx < dom->opp_count; idx++) {
 		if (!dom->level_indexing_mode)
-			freq = dom->opp[idx].perf * dom->mult_factor;
+			freq = (unsigned long)dom->opp[idx].perf * dom->mult_factor;
 		else
-			freq = dom->opp[idx].indicative_freq * 1000;
+			freq = (unsigned long)dom->opp[idx].indicative_freq * 1000;
 
 		data.level = dom->opp[idx].perf;
 		data.freq = freq;
@@ -879,7 +879,7 @@ static int scmi_dvfs_freq_get(const struct scmi_protocol_handle *ph, u32 domain,
 		return ret;
 
 	if (!dom->level_indexing_mode) {
-		*freq = level * dom->mult_factor;
+		*freq = (unsigned long)level * dom->mult_factor;
 	} else {
 		struct scmi_opp *opp;
 
@@ -887,7 +887,7 @@ static int scmi_dvfs_freq_get(const struct scmi_protocol_handle *ph, u32 domain,
 		if (!opp)
 			return -EIO;
 
-		*freq = opp->indicative_freq * 1000;
+		*freq = (unsigned long)opp->indicative_freq * 1000;
 	}
 
 	return ret;
@@ -908,9 +908,9 @@ static int scmi_dvfs_est_power_get(const struct scmi_protocol_handle *ph,
 
 	for (opp = dom->opp, idx = 0; idx < dom->opp_count; idx++, opp++) {
 		if (!dom->level_indexing_mode)
-			opp_freq = opp->perf * dom->mult_factor;
+			opp_freq = (unsigned long)opp->perf * dom->mult_factor;
 		else
-			opp_freq = opp->indicative_freq * 1000;
+			opp_freq = (unsigned long)opp->indicative_freq * 1000;
 
 		if (opp_freq < *freq)
 			continue;
-- 
2.17.1


