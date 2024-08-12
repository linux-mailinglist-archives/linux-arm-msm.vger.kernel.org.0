Return-Path: <linux-arm-msm+bounces-28286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 285FF94E5C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 06:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AE09BB21214
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 04:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973DA13633B;
	Mon, 12 Aug 2024 04:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UxMNyTDl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF9B37B;
	Mon, 12 Aug 2024 04:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723437075; cv=none; b=D3PEtZ8Fd/XPgCQur/ebJIb0IbPCpPvmZgGAWxFR54g4byn2G+hSK1JCwFyg3MyQDdKa7Z/WsxjSNooI1ugA69uIpw/uz7lC7e2xbV1ZJEZM8CratO7eRIpzRfQ7ZE9/4zNvnVVv6IIPUFKMBU7fp3kLxYnr80SYm+ZLDo9aSj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723437075; c=relaxed/simple;
	bh=4EXmUsFo8b2xhR1P7lQQvnCd0Xtbmq9kHad9mhdzlz8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aSaAVuMK9ShjbCTEOq/oiBmWMrmpwDRwwOcLD6eE4xD3QWR7DAgU6r8G5/OAXcjJ13sRCAIix6UJKfmtp52KElLj5U7dE5FnqNTTYU7ZabdzQDuQl0l9D2hqziluLxxyUr5Ki3zK0ROo6jl4hM3lAzU1zK/b9mG9AcVqU7ePs7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UxMNyTDl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C2ZuqM014292;
	Mon, 12 Aug 2024 04:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IeGrfFSUKNXY/SQdHsLOXN
	+RZ1hfsllv4M0nMVD7vZM=; b=UxMNyTDlSZ908fHolb2WlitweTUxGYgeiLoMVz
	prxtXr+S1kBvBuMjUxbgbmRVq7A7+cd4Y6S7U5ZQlipzci8JhyQBARB9oEquc6gO
	hgT1OFBXtlSEA+ieV2gyYmSP2xgYi1i2IUoEEX8X0qNfBSxEHetydxill0grb2Yr
	F6eknD9lc9PS8B37REp2XumK6tdxI/fo36Rjw1A/G6mgmUBR9gCI9x+Bf1Uzxgfd
	7eDhGXViHxI4MJ6RPUaQlFGtSL60YUlFTVZBHv1EFDRYhAszgK/ci6owzNqYyTnZ
	+9wBtjbaRbGARLR0aq5eS9H7nN9//6ZbUujxPoaJV8iG/CpA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18xtu9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 04:31:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47C4V3YL020811
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 04:31:03 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 11 Aug 2024 21:31:00 -0700
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
        Song Chai
	<quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 RESEND] Coresight: Set correct cs_mode for TPDM to fix disable issue
Date: Mon, 12 Aug 2024 12:30:43 +0800
Message-ID: <20240812043043.2890694-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-GUID: eBUZWovCI_mdj7PdZ2BQX_x5oBlsHJx9
X-Proofpoint-ORIG-GUID: eBUZWovCI_mdj7PdZ2BQX_x5oBlsHJx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120033

The coresight_disable_source_sysfs function should verify the
mode of the coresight device before disabling the source.

However, the mode for the TPDM device is always set to
CS_MODE_DISABLED, resulting in the check consistently failing.
As a result, TPDM cannot be properly disabled.

Configure CS_MODE_SYSFS/CS_MODE_PERF during the enablement.
Configure CS_MODE_DISABLED during the disablement.

Fixes: b3c71626a933 ("Coresight: Add coresight TPDM source driver")
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index a9708ab0d488..90a5105f6199 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -449,6 +449,11 @@ static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
 		return -EBUSY;
 	}
 
+	if (!coresight_take_mode(csdev, mode)) {
+		spin_unlock(&drvdata->spinlock);
+		return -EBUSY;
+	}
+
 	__tpdm_enable(drvdata);
 	drvdata->enable = true;
 	spin_unlock(&drvdata->spinlock);
@@ -506,6 +511,7 @@ static void tpdm_disable(struct coresight_device *csdev,
 	}
 
 	__tpdm_disable(drvdata);
+	coresight_set_mode(csdev, CS_MODE_DISABLED);
 	drvdata->enable = false;
 	spin_unlock(&drvdata->spinlock);
 
-- 
2.34.1


