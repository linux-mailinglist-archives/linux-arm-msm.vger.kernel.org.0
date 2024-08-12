Return-Path: <linux-arm-msm+bounces-28285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D01C94E5C0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 06:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A30A281800
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 04:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3228413E02D;
	Mon, 12 Aug 2024 04:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NKyoJiM4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610F133C7;
	Mon, 12 Aug 2024 04:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723436958; cv=none; b=aXczvzAoXBu0VzdUidvox+xO62ohYN+MuyTDm1+WubYZub6s9JjkFMBfWdI9F3nqCfvKC5H03CAK44hzzQQ/epmzEi8PGnCzehJ73r5M+qXbTrYDM4/fLuNrH9oKV3PtP2+MzFIZG+B8AwLO8dPnGOBH9VOk1Melq64Rsy5KK5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723436958; c=relaxed/simple;
	bh=2IH3vs5vfdoTfuI7fwaFWDiJ6u84pkj3MfXxTxsoavU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BBXFu1W1YhzBytaTvnf6A91WXSch6E98yVmNQiKMqzuBFJ8JErno+uL1s3Dm+lKrfcrRai+XCmjJCjJJdPCOEU9Pgxgh2Evw05jVJfNqPCRVh1cUVKSDPVXH1/37eD7y8K3IiF/S6lFukWrKPpxUd7QV2nK/0SSMePwnOu8lJtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NKyoJiM4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C2Zpqg026990;
	Mon, 12 Aug 2024 04:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=98ObzfEly/d4Nr2Nilamu/
	lbiOrA4bHdu/SU/01hHw4=; b=NKyoJiM4gPGqq3fMSOBNqaS50+VQLL6vqGpJ2T
	RDcbHfJ/zWDGQqJBvOwzCBl+eCYQAN6ZiNRAB7XAe+1dLdIqRBbLPv8BKhmA42oJ
	CLZTC8m1YclmoecF1VcsIEu5dFPQ8Mf977eECmHPYaA8Sr/+Y75irZ5vt3LQ0ULQ
	vJ61w4IKL+W1x+6J7CJGIAQWZPinl2x8F+kFqtr/wvzJrBsOuOD8N4WjRDR8Eh3I
	+gsiTq60VxkfjiliWvo43XRdQQiPdHTEAhR/1/I3h4657WptCUzSMco3NWcGpk98
	CVibbpwUdNHQx4cex2F/9slwkrniq7P0UgBJzyv78QiqJTDQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x1d4at7s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 04:29:06 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47C4T522017483
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 04:29:05 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 11 Aug 2024 21:29:01 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v1 RESEND] Coresight: Set correct cs_mode for dummy source to fix disable issue
Date: Mon, 12 Aug 2024 12:28:44 +0800
Message-ID: <20240812042844.2890115-1-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: uIxFwSbxAE1rUL_PdyCLOA8U3Lkluy0P
X-Proofpoint-GUID: uIxFwSbxAE1rUL_PdyCLOA8U3Lkluy0P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120032

The coresight_disable_source_sysfs function should verify the
mode of the coresight device before disabling the source.
However, the mode for the dummy source device is always set to
CS_MODE_DISABLED, resulting in the check consistently failing.
As a result, dummy source cannot be properly disabled.

Configure CS_MODE_SYSFS/CS_MODE_PERF during the enablement.
Configure CS_MODE_DISABLED during the disablement.

Fixes: 9d3ba0b6c056 ("Coresight: Add coresight dummy driver")
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-dummy.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-dummy.c b/drivers/hwtracing/coresight/coresight-dummy.c
index ac70c0b491be..dab389a5507c 100644
--- a/drivers/hwtracing/coresight/coresight-dummy.c
+++ b/drivers/hwtracing/coresight/coresight-dummy.c
@@ -23,6 +23,9 @@ DEFINE_CORESIGHT_DEVLIST(sink_devs, "dummy_sink");
 static int dummy_source_enable(struct coresight_device *csdev,
 			       struct perf_event *event, enum cs_mode mode)
 {
+	if (!coresight_take_mode(csdev, mode))
+		return -EBUSY;
+
 	dev_dbg(csdev->dev.parent, "Dummy source enabled\n");
 
 	return 0;
@@ -31,6 +34,7 @@ static int dummy_source_enable(struct coresight_device *csdev,
 static void dummy_source_disable(struct coresight_device *csdev,
 				 struct perf_event *event)
 {
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	dev_dbg(csdev->dev.parent, "Dummy source disabled\n");
 }
 
-- 
2.34.1


