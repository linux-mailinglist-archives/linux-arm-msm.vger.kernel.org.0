Return-Path: <linux-arm-msm+bounces-24197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9A691771D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 06:06:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A24D21F22CEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 04:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C1F7132139;
	Wed, 26 Jun 2024 04:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QZxDOz05"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07238248D;
	Wed, 26 Jun 2024 04:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719374757; cv=none; b=e+BGt04idA1OjuJQPq+55gQ37IXfKrL1ybiGsUzT1+CY1iH76taL75Rs6qZYqGw7cWLPBhKVdwu0eg0FJNJoBhdtMAU5BDvO+XXsnJbPaaEp1izfGGvowkmt9Enq/7A+JHMozC3bI2msTSx1/7SvuuaqvdCBWlfejP44bvj11hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719374757; c=relaxed/simple;
	bh=2IH3vs5vfdoTfuI7fwaFWDiJ6u84pkj3MfXxTxsoavU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jCX365AFBKErm1yY94gJw1Y6PPm12sMuLNdT8Hlstd2d3sheux/a60cDeqGLr37s6wTX7hSMN+d5sIcSOIJGQwqYOO5GDZRCNouuR5srMcYu5Mk5mm4T+hcE1EKq9VU3+DGQU7h8C6COxUPAeSu8nE2JEgZXhJjOcz/g56OO8FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QZxDOz05; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PH7huB001496;
	Wed, 26 Jun 2024 04:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=98ObzfEly/d4Nr2Nilamu/
	lbiOrA4bHdu/SU/01hHw4=; b=QZxDOz05Pme3H93IYLsruA4RpggCo9UIAkrEKS
	Jczl9xoKUUF3PgeC3vKI81FrP4x3d1nXNUuX6zqRjD32tUF/HzIgHrwg72dkYWWV
	K7DtnLITBjrCtLgYO/odlzjO2ZuzgOoxJGtXh8klaw941474v70vjB3m472lYtIL
	nFpEouF48PVHXrGbtHnI79g2z8DBHVOa0FC8sSBHArSJoEnrGYdgG6KZJWAw84Fl
	m4cKVj9bKNjuJP9M0CEd4HKJjS8M1VZpt7X7yusEnjIYY6pdiIsHTeruYadOm5ac
	Vqt9czx3LCcJvIMtI0+0k5LWZfIBdYYkTZ5enGyowOusTbrw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmaf0qj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 04:05:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45Q45hj2023179
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 04:05:43 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Jun 2024 21:05:36 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>,
        <quic_yijiyang@quicinc.com>, <quic_yuanjiey@quicinc.com>,
        <quic_liuxin@quicinc.com>, <quic_yanzl@quicinc.com>,
        <quic_xinlon@quicinc.com>, <quic_xueqnie@quicinc.com>,
        <quic_sijiwu@quicinc.com>
Subject: [PATCH v1] Coresight: Set correct cs_mode for dummy source to fix disable issue
Date: Wed, 26 Jun 2024 12:05:21 +0800
Message-ID: <20240626040521.1909119-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: J4KlLZkYcs3Jv0oPE6HqMpDubQ2zPxz4
X-Proofpoint-GUID: J4KlLZkYcs3Jv0oPE6HqMpDubQ2zPxz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_02,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406260030

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


