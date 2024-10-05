Return-Path: <linux-arm-msm+bounces-33177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EC199171A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 16:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7AC61B211AE
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 14:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFFC1547C9;
	Sat,  5 Oct 2024 14:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UoXvRcDu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A98C1386DA;
	Sat,  5 Oct 2024 14:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728136929; cv=none; b=OZVSz09Uq6gNv/UQGxhASPbckv9KPIVYs/+4m0LVAHO5iECHyAQVJbRoYHvw4cs93R20Gveq+vs9lKmne7yThTqGwhmF2HoMUBnqahGdBxg9WeTdNscGMGcYgEBWx1bQi4SJLkURPkIJ8Tumfme8piS+3zXvmRzaiPJKX9wJUm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728136929; c=relaxed/simple;
	bh=XnVjXaB71izyHK+WxaGL36Pv34dA6yhlxLof8kWZYXU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gm2sdRJBYAhNLKc8XEarnv4UxANdQkElFcqhuKkxD6AUHxwEZp89LNuRtM2evnBjiO8xWoVUwhts8+QbupXZvkW2oua85ZbGQiL4WwEEMFJWdFrtSGrulFRsbURpGTrKTKQBCIwhCTCWuC7fL6cSJUrBaRJ2IkhETj0Hi8B+xJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UoXvRcDu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 495Cxste028071;
	Sat, 5 Oct 2024 14:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TBn7DowOLLgtYq8yhfOlbpVdJ4v6lJ+BmshPqMXU5SI=; b=UoXvRcDuu0HSGWMB
	9YqUeT3VyqoOpio19vUk3onCixAoetDezujL+vq17+xMQIODpo8feic+3bNtryG+
	k+XKi4SkW9J3dsa2Hawow/xm6WE00YrEcgonaAoseKNDUKWdn2HA8tqURMq1tR28
	wjoJMtVflzZIsFsO0gaRLDmbUFhhkwGz1HCwJL2Pn0HqMp5PB4Lj9y/X/ynU8JLl
	Aev2MKlNpPelMgI0BTyIVsCgHxs1PT6Dc54yT+zFTLjf3vSZnfqnPe+wsft24bf4
	gf/v0ZVUgD9CQQuU78HuM7o1DW3WJSGZUiFcWtcE04TTmzfBNeqcdixKeqFaCYZQ
	QvaE2g==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xsn0ne5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 05 Oct 2024 14:02:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 495E228L026985
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 5 Oct 2024 14:02:02 GMT
Received: from hu-kuldsing-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 5 Oct 2024 07:02:00 -0700
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qingqing
 Zhou" <quic_qqzhou@quicinc.com>
Subject: [PATCH 1/2] firmware: qcom: scm: Return -EOPNOTSUPP for unsupported SHM bridge enabling
Date: Sat, 5 Oct 2024 19:31:49 +0530
Message-ID: <20241005140150.4109700-2-quic_kuldsing@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
References: <20241005140150.4109700-1-quic_kuldsing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9-FiJgI6UnIKNJxXJwnhuE6HUUDCk2sZ
X-Proofpoint-GUID: 9-FiJgI6UnIKNJxXJwnhuE6HUUDCk2sZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410050102

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

Currently for enabling shm bridge, QTEE will return 0 and put error 4 into
result[0] to qcom_scm for unsupported platform, tzmem will consider this
as an unknown error not the unsupported case on the platform.

Error log:
[    0.177224] qcom_scm firmware:scm: error (____ptrval____): Failed to enable the TrustZone memory allocator
[    0.177244] qcom_scm firmware:scm: probe with driver qcom_scm failed with error 4

Change the function call qcom_scm_shm_bridge_enable() to remap this
result[0] into the unsupported error and then tzmem can consider this as
unsupported case instead of reporting an error.

Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Co-developed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10986cb11ec0..620313359042 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -111,6 +111,10 @@ enum qcom_scm_qseecom_tz_cmd_info {
 	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
 };
 
+enum qcom_scm_shm_bridge_result {
+	SHMBRIDGE_RESULT_NOTSUPP	= 4,
+};
+
 #define QSEECOM_MAX_APP_NAME_SIZE		64
 
 /* Each bit configures cold/warm boot address for one of the 4 CPUs */
@@ -1361,6 +1365,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
 
 int qcom_scm_shm_bridge_enable(void)
 {
+	int ret;
+
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_MP,
 		.cmd = QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
@@ -1373,7 +1379,11 @@ int qcom_scm_shm_bridge_enable(void)
 					  QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
 		return -EOPNOTSUPP;
 
-	return qcom_scm_call(__scm->dev, &desc, &res) ?: res.result[0];
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	if (!ret && res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
+		return -EOPNOTSUPP;
+
+	return ret ?: res.result[0];
 }
 EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
 
-- 
2.34.1


