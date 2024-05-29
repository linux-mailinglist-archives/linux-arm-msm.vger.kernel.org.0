Return-Path: <linux-arm-msm+bounces-20996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1189E8D3E13
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 20:10:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD0E0286C0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 18:10:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440721C2302;
	Wed, 29 May 2024 18:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QicqMx7Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4B1836DE;
	Wed, 29 May 2024 18:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717006221; cv=none; b=sSClYK/HuyKWNum7phfVt7RM3Vj02MqPUo54Tq3e16rP74yyD4gwTDDHYvl7hELRFkr9N2s0ltvun6F20BgE+cdlx3RdK7doTvl0NRv3F2l3ipU+EeL5wkYpXMplFhfDWB4fx1xyk896JR1uzxqXY7eerYvwFQBBk9mTRXG6go0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717006221; c=relaxed/simple;
	bh=0kcDD/5ugp1alfrK4+zeqPWHZ6Ox9wD0gGIKPMAxpIg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NiOKgqlRl+f8HSqXo+vFSLLpWrxrShSGF4e0OHb1HHa1fV9CUa8GrviKMSc1kM5pkYbc4nCr6xVpbIXX8Eo3RfcXhRFQlH+Hy3imio8lN/udB6+mKnNn/w5dHBQcqOe4vS6h7245xjz3g7rKtM/gt8zzSIRsec99Uznt4PeOLc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QicqMx7Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TBHdm9012837;
	Wed, 29 May 2024 18:10:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4CscIOPSIzNF/B8vuaT4PurRNfIAAhpAp22/FUwa6ww=; b=QicqMx7QD6mdsxIL
	opZ57MCOeAvyP046IyzXUsMcPjr86HcDI/m21Q8A+Yxb5PERR7euQm0Q6WR/phw8
	24HumrXwCLHTmtxkPwtSCczMjB+BT5gk9db5jChcaCo+gKjk/QOk03KnrRLsij80
	LHhgChrbCXQOWgWxfpVspLjqp+7lsnYm6u1nq7wxHSUuf3gPqXPUeW5G1O9LILqK
	4UVUCegxKtZWT7nbNlKzcRaUf7fS6reH3Co64zxajRDQRofU9/LbiLjKb3mAz3jJ
	SmhVI5YSKIqqUZ6y1AbjxS7F1E+QMEcaDugbpGbAfL6WOV/tj6GsQLGkDNjlGavv
	YNdPPg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0qhurr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:10:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TIA0V5023051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 18:10:01 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 29 May 2024 11:10:00 -0700
From: Chris Lew <quic_clew@quicinc.com>
Date: Wed, 29 May 2024 11:09:58 -0700
Subject: [PATCH v3 4/4] remoteproc: qcom_q6v5_pas: Add hwspinlock bust on
 stop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240529-hwspinlock-bust-v3-4-c8b924ffa5a2@quicinc.com>
References: <20240529-hwspinlock-bust-v3-0-c8b924ffa5a2@quicinc.com>
In-Reply-To: <20240529-hwspinlock-bust-v3-0-c8b924ffa5a2@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717006199; l=3424;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=Fh1qjcjJVfLujRu9lV+ilZpdx4nr3R2fYPbCuSucud0=;
 b=rSI4BNpbFLSlMfe4BSfPwSXFFERdnA9hNZRn5X7NWLgT5aXlj/qia48D3MpjOhCfOULFqWbdr
 cZpOhCtr0lkAotxvR3KzsH3e4Cbd3+qWy8YU+UZjgN/faI9K+LF15cf
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yKndioMBwa7xc8se-FGAO4lSJwVPx5JN
X-Proofpoint-ORIG-GUID: yKndioMBwa7xc8se-FGAO4lSJwVPx5JN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_14,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290127

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
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
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


