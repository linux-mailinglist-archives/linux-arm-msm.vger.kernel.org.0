Return-Path: <linux-arm-msm+bounces-19953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4B08C7EA0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2024 00:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEAB7282DA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 22:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2458B25622;
	Thu, 16 May 2024 22:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A3UW7i4T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E884C8D1;
	Thu, 16 May 2024 22:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715900385; cv=none; b=tXBP7ILO1hmPSxVYFwUe0I0ODHpsEHpnng0cB8HA7cXxrYCkdLBqxSdUoGiOH/0t5hmiOyO2mZesDCwgBXVSWfubd7CR8+00mD08zAVKqBtr/1FG8JY+vuBPxjwKH+c3ebTb3rl0JwMVvr6ZcLRUoHk6E3BF4Mu+xSeiA2rcU6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715900385; c=relaxed/simple;
	bh=UMQ33vmXjIMVoAouJoABlu/c79HijRXgfnTvWg20ShA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XobqDAHtuXr+lQDv7JaWGT7kNqwe0kWu1i0f4J85yi7au1mVti44yWEcZF6o9kLZfUh28mloHp2d5OUrM7pBgKjnYRPIkwfuLy6jr+tmi3jMGGMFWyA+Hl3TUwchqjVTufyntUyC52VtOn4S1qXgXNIdzYLd3wZSkWbBQb3uf/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A3UW7i4T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44GKNDJp032690;
	Thu, 16 May 2024 22:59:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:date:subject:mime-version:content-type
	:content-transfer-encoding:message-id:references:in-reply-to:to
	:cc; s=qcppdkim1; bh=E/63Sm+Bi5aqxDOepesdMg1nnCYC9lkcftzk5W6WgGs
	=; b=A3UW7i4Tj9HW3UumqUwwMzOBiwGq3oybEAv3BBwh+tCTHQbceFBR76JcnF7
	ZpH+1BKRWWVZymuMdKfWZUvumd4YxDy0zCKjFl4f51lsNFmSyJKPR1hzEK5foRQy
	zP/FhAlJ/wsSidyfVRphbl3wH2W2b7uf7lkOZtx8PUJo6wJZIM3N9Dqjh1LeQl3u
	qT+38k1wJT5YtMLwOGR//B4zAg0PMrclXmtVwqM1ZAuPkrqtmf/f/RVFQHn98l5B
	kxzGPbTvC9uWtEvVqYzMQM1ai5TBQVn+WUvyzpxZ6tdbNXFAWQEuWfePeRR+ZM8w
	vCAx69e8pOi3CjYnJNHGSDff2+A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y2125mysu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 22:59:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GMx6K5012432
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 22:59:07 GMT
Received: from hu-clew-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 16 May 2024 15:59:06 -0700
From: Chris Lew <quic_clew@quicinc.com>
Date: Thu, 16 May 2024 15:58:24 -0700
Subject: [PATCH 6/7] remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240516-hwspinlock-bust-v1-6-47a90a859238@quicinc.com>
References: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
In-Reply-To: <20240516-hwspinlock-bust-v1-0-47a90a859238@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715900345; l=4083;
 i=quic_clew@quicinc.com; s=20240508; h=from:subject:message-id;
 bh=FkvH3elkGao6or4V/MDCjMsiD3XkOU6SIJC7v+USEdM=;
 b=4WEx//Hw4anqI5f+HIotqEfGnzhI3Ck8MCmBfD3B89kiR3vmkPFuvW0nAGIbw1KTUNoyq4SZw
 wGcT2qPNlkUAZ9KqgONQ4CXBmkw5MRrwWZyHfUuLmeovomhIhS4vN25
X-Developer-Key: i=quic_clew@quicinc.com; a=ed25519;
 pk=lEYKFaL1H5dMC33BEeOULLcHAwjKyHkTLdLZQRDTKV4=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: C60B6rHy56yAz3aOe7ijaxWzk9TykVxK
X-Proofpoint-ORIG-GUID: C60B6rHy56yAz3aOe7ijaxWzk9TykVxK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160168

From: Richard Maina <quic_rmaina@quicinc.com>

When remoteproc goes down unexpectedly this results in a state where any
acquired hwspinlocks will remain locked possibly resulting in deadlock.
In order to ensure all locks are freed we include a call to
hwspin_lock_bust() during remoteproc shutdown.

For qcom_q6v5_pas remoteprocs, each remoteproc has an assigned id that
is used to take the hwspinlock. Remoteproc should use this id to try and
bust the lock on remoteproc stop.

This edge case only occurs with q6v5_pas watchdog crashes. The error
fatal case has handling to clear the hwspinlock before the error fatal
interrupt is triggered.

Signed-off-by: Richard Maina <quic_rmaina@quicinc.com>
Signed-off-by: Chris Lew <quic_clew@quicinc.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 54d8005d40a3..57178fcb9aa3 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
+#include <linux/hwspinlock.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -52,6 +53,7 @@ struct adsp_data {
 	const char *ssr_name;
 	const char *sysmon_name;
 	int ssctl_id;
+	int hwlock_id;
 
 	int region_assign_idx;
 	int region_assign_count;
@@ -84,6 +86,9 @@ struct qcom_adsp {
 	bool decrypt_shutdown;
 	const char *info_name;
 
+	struct hwspinlock *hwlock;
+	int hwlock_id;
+
 	const struct firmware *firmware;
 	const struct firmware *dtb_firmware;
 
@@ -399,6 +404,12 @@ static int adsp_stop(struct rproc *rproc)
 	if (handover)
 		qcom_pas_handover(&adsp->q6v5);
 
+	if (adsp->hwlock) {
+		ret = hwspin_lock_bust(adsp->hwlock, adsp->hwlock_id);
+		if (ret)
+			dev_info(adsp->dev, "failed to bust hwspinlock\n");
+	}
+
 	return ret;
 }
 
@@ -684,6 +695,7 @@ static int adsp_probe(struct platform_device *pdev)
 	struct rproc *rproc;
 	const char *fw_name, *dtb_fw_name = NULL;
 	const struct rproc_ops *ops = &adsp_ops;
+	int hwlock_idx;
 	int ret;
 
 	desc = of_device_get_match_data(&pdev->dev);
@@ -736,6 +748,17 @@ static int adsp_probe(struct platform_device *pdev)
 		adsp->dtb_firmware_name = dtb_fw_name;
 		adsp->dtb_pas_id = desc->dtb_pas_id;
 	}
+
+	if (desc->hwlock_id) {
+		adsp->hwlock_id = desc->hwlock_id;
+		hwlock_idx = of_hwspin_lock_get_id(pdev->dev.of_node, 0);
+		if (hwlock_idx >= 0) {
+			adsp->hwlock = hwspin_lock_request_specific(hwlock_idx);
+			if (!adsp->hwlock)
+				dev_err(&pdev->dev, "failed to request hwspinlock\n");
+		}
+	}
+
 	platform_set_drvdata(pdev, adsp);
 
 	ret = device_init_wakeup(adsp->dev, true);
@@ -1196,6 +1219,7 @@ static const struct adsp_data sm8550_adsp_resource = {
 	.ssr_name = "lpass",
 	.sysmon_name = "adsp",
 	.ssctl_id = 0x14,
+	.hwlock_id = 3,
 };
 
 static const struct adsp_data sm8550_cdsp_resource = {
@@ -1216,6 +1240,7 @@ static const struct adsp_data sm8550_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.hwlock_id = 6,
 };
 
 static const struct adsp_data sm8550_mpss_resource = {
@@ -1236,6 +1261,7 @@ static const struct adsp_data sm8550_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.hwlock_id = 2,
 	.region_assign_idx = 2,
 	.region_assign_count = 1,
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,
@@ -1275,6 +1301,7 @@ static const struct adsp_data sm8650_cdsp_resource = {
 	.ssr_name = "cdsp",
 	.sysmon_name = "cdsp",
 	.ssctl_id = 0x17,
+	.hwlock_id = 6,
 	.region_assign_idx = 2,
 	.region_assign_count = 1,
 	.region_assign_shared = true,
@@ -1299,6 +1326,7 @@ static const struct adsp_data sm8650_mpss_resource = {
 	.ssr_name = "mpss",
 	.sysmon_name = "modem",
 	.ssctl_id = 0x12,
+	.hwlock_id = 2,
 	.region_assign_idx = 2,
 	.region_assign_count = 3,
 	.region_assign_vmid = QCOM_SCM_VMID_MSS_MSA,

-- 
2.25.1


