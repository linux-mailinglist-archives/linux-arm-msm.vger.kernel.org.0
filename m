Return-Path: <linux-arm-msm+bounces-48169-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CE6A37EC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 10:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45E3E3ADD79
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 09:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94D902153D6;
	Mon, 17 Feb 2025 09:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AVfnMh7L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D922153C7;
	Mon, 17 Feb 2025 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739784989; cv=none; b=YCB730vEHbCKOyKDqler9THsodglalNj2jmcCV7gNkx0iToVK5vvMM6Yn/ypRrZOToPg6SNsHuGqSdQY+hPSSO6/a+fxiLKhIRhFgU3bgm+Di1o9cT2B97/Qv/VZQEFmsNHfD7gjZ9NVnFLoqehYq2bCtUOuoFSny3Bz8orK3U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739784989; c=relaxed/simple;
	bh=2hbBuhR12HCknxy3ZpWFC8nk41wqAjEyvCv4koA/gaw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S+DrqJQy//sQUx8To5Xf1/Rs3Ur/LmlQh+ivGdL0PjSiXSoOw8OuRsz5YfqNcTwJWTA9pudV/LrPU3+6WEWVJTJv4g3pBnyspFHKk0m1hrcAEd00wk2AIJUp+w3b3IEuEKZR/8w3bGCnhVhUO/XysMLOqZKmFrz4j6G9wMtorH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AVfnMh7L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H03U77025733;
	Mon, 17 Feb 2025 09:36:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n5s+flF43R133QAlfIXrz56WnUrn/DbnTJQG3zWrhNo=; b=AVfnMh7LT7LTskBD
	URfQ4+hGDxqSclGuEEkyuvnZy9MoOug7wHb9H+i8uXk28HXbUk/j0M8xOx023KJp
	DKPQtTdBiXfgisBJz/TJFBUlv7wLMlPm8n8/TGR1jyh3uVjWAq+n+DovNHmNFg4I
	usLIWV/GAzR5tnYG5MTzGiaGnT3byehaBDFODYJN9uB26TSv+6uPSl07LYzOFDK5
	oYTZm065p3ItZt/xKc0IZOwQINcuitXFXCfT/e0ObYrim6P/hTF1/0wiwayDRUNm
	YXlyfXAHp9EcDaYkEdUpaHJ0QZCFWaAdFxsbbes3FiHj8yEJufYu2yrFPwaDQ3xP
	cZ/nUw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7vs62q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 09:36:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51H9V3er018668
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 09:31:03 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 01:30:58 -0800
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao
	<quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v12 3/7] Coresight: Use coresight_etm_get_trace_id() in traceid_show()
Date: Mon, 17 Feb 2025 17:30:20 +0800
Message-ID: <20250217093024.1133096-4-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
References: <20250217093024.1133096-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ipFT_UIcbzjZFom6hem5sdX6eh0bJ2Yc
X-Proofpoint-ORIG-GUID: ipFT_UIcbzjZFom6hem5sdX6eh0bJ2Yc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0 mlxlogscore=723
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502170083

From: James Clark <james.clark@linaro.org>

Use the new API, coresight_etm_get_trace_id, to read the traceid of the ETM
device when call traceid_show via sysfs node.

Signed-off-by: James Clark <james.clark@linaro.org>
Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-etm3x-sysfs.c | 3 +--
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
index 68c644be9813..b9006451f515 100644
--- a/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm3x-sysfs.c
@@ -1190,10 +1190,9 @@ static DEVICE_ATTR_RO(cpu);
 static ssize_t traceid_show(struct device *dev,
 			    struct device_attribute *attr, char *buf)
 {
-	int trace_id;
 	struct etm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int trace_id = coresight_etm_get_trace_id(drvdata->csdev, CS_MODE_SYSFS, NULL);
 
-	trace_id = etm_read_alloc_trace_id(drvdata);
 	if (trace_id < 0)
 		return trace_id;
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index c767f8ae4cf1..e5216c0f60da 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -4,6 +4,7 @@
  * Author: Mathieu Poirier <mathieu.poirier@linaro.org>
  */
 
+#include <linux/coresight.h>
 #include <linux/pid_namespace.h>
 #include <linux/pm_runtime.h>
 #include <linux/sysfs.h>
@@ -2402,10 +2403,9 @@ static ssize_t trctraceid_show(struct device *dev,
 			       struct device_attribute *attr,
 			       char *buf)
 {
-	int trace_id;
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int trace_id = coresight_etm_get_trace_id(drvdata->csdev, CS_MODE_SYSFS, NULL);
 
-	trace_id = etm4_read_alloc_trace_id(drvdata);
 	if (trace_id < 0)
 		return trace_id;
 
-- 
2.34.1


