Return-Path: <linux-arm-msm+bounces-34318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0678699C896
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 13:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3796F1C230C5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 11:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9611AB500;
	Mon, 14 Oct 2024 11:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aMwRbHKg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7BB1AAE25;
	Mon, 14 Oct 2024 11:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728904549; cv=none; b=G+hgIEe2PtOconyz93rHcJchNtsNP1MeMohxPu1U/abx7wjcoeSGqFdDjiIpIrLIAZMvODChN0bJpkqHwn5kpPHzuzqRT3yjY/AQsil+Auc1hp59KgedhGYLBsz7B8pe1PPdVdwUnvo1V1ham2yWQ2/Rh2Vkny+AjhKVZdig2Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728904549; c=relaxed/simple;
	bh=ZJDRlwbzX85zubj52EhSQf7ucpmyudTfUhco9MrRKLc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M6PY2ol5ISRr3vmmNXLjl269dyrwXmnmD3ToMUn85tHBe0xk2ffgxaIu1JhgTGUzliqCwt0bTbtXL4fPnILA+uFVcM0uyOogbA9+kSh6MxekWvfEcVQryKS0WvVxZFEdm1itHIEG2opipHFRhhvtRGh8SwUNXzVJfsSA2xmXqDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aMwRbHKg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EAn2Ip015299;
	Mon, 14 Oct 2024 11:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nFe6whvJcLxUyYpEeIga7oAGdsfdjSnVS5f8iZnpKyM=; b=aMwRbHKgGZnWWOKw
	ceBU24pb1nBxHYlhoNEqPaAaH8Nh95iPxPtoXK8Fhf9AIZkR+dbnmEycF24QF6wk
	RK+lsOPdqyQ2+JHQpstpbxtcyarQBWECSultS298JeXVkNs186fhAZ35xeABZSN7
	80FodiI/je0iBga2a0O7c9dg/jBV1bGU7YffnX7/lSyfR3SvvLG7C73nOruDR8QJ
	5xhg04BiFFqr3YgCEWiQws11e3e0RWYQPlTNvD3NOhG1il/UHvKlT3e16Vl6X/it
	PBIS/o6TLlVwRtrDufiV2iMskIKzfiU5aStmW61Ph/xp06G+C+o5kXN7GGAzPuMQ
	NraanA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427gegv7tw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 11:15:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EBFfaq014854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 11:15:41 GMT
Received: from hu-kuldsing-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 04:15:37 -0700
From: Kuldeep Singh <quic_kuldsing@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qingqing
 Zhou" <quic_qqzhou@quicinc.com>
Subject: [PATCH v2 1/2] firmware: qcom: scm: Return -EOPNOTSUPP for unsupported SHM bridge enabling
Date: Mon, 14 Oct 2024 16:45:26 +0530
Message-ID: <20241014111527.2272428-2-quic_kuldsing@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014111527.2272428-1-quic_kuldsing@quicinc.com>
References: <20241014111527.2272428-1-quic_kuldsing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mhRum1Mo7tWrvR2xmQyFcZ-Io2vMGwZX
X-Proofpoint-ORIG-GUID: mhRum1Mo7tWrvR2xmQyFcZ-Io2vMGwZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140081

From: Qingqing Zhou <quic_qqzhou@quicinc.com>

When enabling SHM bridge, QTEE returns 0 and sets error 4 in result to
qcom_scm for unsupported platforms. Currently, tzmem interprets this as
an unknown error rather than recognizing it as an unsupported platform.

Error log:
[    0.177224] qcom_scm firmware:scm: error (____ptrval____): Failed to enable the TrustZone memory allocator
[    0.177244] qcom_scm firmware:scm: probe with driver qcom_scm failed with error 4

To address this, modify the function call qcom_scm_shm_bridge_enable()
to remap result to indicate an unsupported error. This way, tzmem will
correctly identify it as an unsupported platform case instead of
reporting it as an error.

Fixes: 178e19c0df1b ("firmware: qcom: scm: add support for SHM bridge operations")
Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
Co-developed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10986cb11ec0..0df81a9ed438 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -112,6 +112,7 @@ enum qcom_scm_qseecom_tz_cmd_info {
 };
 
 #define QSEECOM_MAX_APP_NAME_SIZE		64
+#define SHMBRIDGE_RESULT_NOTSUPP		4
 
 /* Each bit configures cold/warm boot address for one of the 4 CPUs */
 static const u8 qcom_scm_cpu_cold_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
@@ -1361,6 +1362,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
 
 int qcom_scm_shm_bridge_enable(void)
 {
+	int ret;
+
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_MP,
 		.cmd = QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
@@ -1373,7 +1376,15 @@ int qcom_scm_shm_bridge_enable(void)
 					  QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
 		return -EOPNOTSUPP;
 
-	return qcom_scm_call(__scm->dev, &desc, &res) ?: res.result[0];
+	ret = qcom_scm_call(__scm->dev, &desc, &res);
+
+	if (ret)
+		return ret;
+
+	if (res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
+		return -EOPNOTSUPP;
+
+	return res.result[0];
 }
 EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
 
-- 
2.34.1


