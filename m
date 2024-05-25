Return-Path: <linux-arm-msm+bounces-20437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F18D58CED60
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 03:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 682D61F221F6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 May 2024 01:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02CA8882B;
	Sat, 25 May 2024 01:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ipRCtaUF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CC246A4;
	Sat, 25 May 2024 01:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716600450; cv=none; b=qZ05I4oDQMAbV1AFShgvnZnVrDRAV8KwMtDUWKhMVrlvTLAxD2A2X9gP+pNNaiNw7m6ue6yQVhUWY+SrXNRnC/2DUjAx16Kdjj5/M/u4MRN0RDas/aJgHc8cPZtKkf1RchgJCviKQ0BSzugZh/O37pNoj9QW30K2iQVlZ7xT7lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716600450; c=relaxed/simple;
	bh=h8/x/nojwmlf2HnpF6hwawLk+eFeNc0MudxL4faEzdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=SO9u66ES9jmufzhwV+q8E/wAPTApWVavPgfcSxhNCpYa6rtxC8zH6cKH5hjRSNLXnZRLihcvPXnMmpSVw2doRjNXElfOyZ8HcPUOnpWGLUgmN1ACKVUbdLjGcjGoqW7HUzstlnAZERDYtjBdUhOorRooSWhCFHGbJgi8bPxqLsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ipRCtaUF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44P0JiMu017055;
	Sat, 25 May 2024 01:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	08bJfs2H660VcmuoqOaZBlaE5FuMCkgrQv4/h/sI1t8=; b=ipRCtaUFB/e5y8Z/
	w4yujab4GiKxbBKkEj017WTYf+IxvmoJiTTCBLZqJG8QZrczXvKSRtwwZQshLFqs
	EsGc36rn8G7yp8Oce5jkbKDZGivWzJTrOohvY4BWKGCRVpsUjdYei6onQt8ieuqH
	q7hlyKiaGOM5mayr0EqDVP+4Sy+P2aniQbG3BtoJKdkTuiGpR7MAl8Xp+eyZR+p/
	y6eWHr0+Do4IZuTgT7osjBN/IvGy9LLMj+Dh73LSgJOm7Kh+c4b2T4c3A9n5wFn5
	+q4JWH8xI8CCZP2cl7tkFGypRlZ4h5F4Zpz1hvOG3VVxX8d/hHgD40XRAHr0fV4a
	FYV0VQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yaa9turp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 01:27:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44P1Qxc7032128
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 May 2024 01:27:00 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 24 May 2024 18:26:59 -0700
From: Chris Lew <quic_clew@quicinc.com>
Date: Fri, 24 May 2024 18:26:43 -0700
Subject: [PATCH v2 4/4] remoteproc: qcom_q6v5_pas: Add hwspinlock bust on
 stop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240524-hwspinlock-bust-v2-4-fb88fd17ca0b@quicinc.com>
References: <20240524-hwspinlock-bust-v2-0-fb88fd17ca0b@quicinc.com>
In-Reply-To: <20240524-hwspinlock-bust-v2-0-fb88fd17ca0b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ingo
 Molnar" <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        Waiman Long
	<longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Chris Lew <quic_clew@quicinc.com>,
        "Richard
 Maina" <quic_rmaina@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716600418; l=3371;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=04VWK3g6daj/n9WPpcOfbHpyv8+UkjZcCDj0SDZ6cE8=;
 b=rkRDw9j/Vbw5Sfy9p7uhuLgqMbtCxt99HCUMSJLbzl3BX0avLe+RswqlwChprCCCiBSsJvtw4
 sPg+0yWJYFOCCXD7VnFeTi0qhFwQFiQWSxDSzDNPhRzOaThpgTxVcBh
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2BqomTspuyfdFmaWviBMMXYn6-8mCn4L
X-Proofpoint-ORIG-GUID: 2BqomTspuyfdFmaWviBMMXYn6-8mCn4L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-24_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 suspectscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405250010

From: Richard Maina <quic_rmaina@quicinc.com>

When remoteproc goes down unexpectedly this results in a state where any
acquired hwspinlocks will remain locked possibly resulting in deadlock.
In order to ensure all locks are freed we include a call to
qcom_smem_bust_hwspin_lock_by_host() during remoteproc shutdown.

For qcom_q6v5_pas remoteprocs, each remoteproc has an assigned smem
host_id. Remoteproc can pass this id to smem to try and bust the lock on
remoteproc stop.

This edge case only occurs with q6v5_pas watchdog crashes. The error
fatal case has handling to clear the hwspinlock before the error fatal
interrupt is triggered.

Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 54d8005d40a3..8458bcfe9e19 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -52,6 +52,7 @@ struct adsp_data {
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
+	unsigned int smem_host_id;
 
 	int region_assign_idx;
 	int region_assign_count;
@@ -81,6 +82,7 @@ struct qcom_adsp {
 	int lite_pas_id;
 	unsigned int minidump_id;
 	int crash_reason_smem;
+	unsigned int smem_host_id;
 	bool decrypt_shutdown;
 	const char *info_name;
 
@@ -399,6 +401,9 @@ static int adsp_stop(struct rproc *rproc)
 	if (handover)
 		qcom_pas_handover(&adsp->q6v5);
 
+	if (adsp->smem_host_id)
+		ret = qcom_smem_bust_hwspin_lock_by_host(adsp->smem_host_id);
+
 	return ret;
 }
 
@@ -727,6 +732,7 @@ static int adsp_probe(struct platform_device *pdev)
 	adsp->pas_id = desc->pas_id;
 	adsp->lite_pas_id = desc->lite_pas_id;
 	adsp->info_name = desc->sysmon_name;
+	adsp->smem_host_id = desc->smem_host_id;
 	adsp->decrypt_shutdown = desc->decrypt_shutdown;
 	adsp->region_assign_idx = desc->region_assign_idx;
 	adsp->region_assign_count = min_t(int, MAX_ASSIGN_COUNT, desc->region_assign_count);
@@ -1196,6 +1202,7 @@ static const struct adsp_data sm8550_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.smem_host_id = 2,
 };
 
 static const struct adsp_data sm8550_cdsp_resource = {
@@ -1216,6 +1223,7 @@ static const struct adsp_data sm8550_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.smem_host_id = 5,
 };
 
 static const struct adsp_data sm8550_mpss_resource = {
@@ -1236,6 +1244,7 @@ static const struct adsp_data sm8550_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.smem_host_id = 1,
 	.region_assign_idx = 2,
 	.region_assign_count = 1,
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
@@ -1275,6 +1284,7 @@ static const struct adsp_data sm8650_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.smem_host_id = 5,
 	.region_assign_idx = 2,
 	.region_assign_count = 1,
 	.region_assign_shared = true,
@@ -1299,6 +1309,7 @@ static const struct adsp_data sm8650_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.smem_host_id = 1,
 	.region_assign_idx = 2,
 	.region_assign_count = 3,
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,

-- 
2.25.1


