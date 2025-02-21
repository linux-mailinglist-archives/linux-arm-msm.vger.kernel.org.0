Return-Path: <linux-arm-msm+bounces-48800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5265A3EC99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 07:07:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B5871775B1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 06:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66881FECDB;
	Fri, 21 Feb 2025 06:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VJftN9Mc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265901FECC2;
	Fri, 21 Feb 2025 06:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740118001; cv=none; b=XVUR1Qm7QQjmVYDiG+xDVMtHhPsyFI67WnEDaDW0fiTE7ncd/CahZuS+sG07EDzVMjsCyZUgxOboZJHN5OXNvi/iA5UvkfV2xl22JNcfOy+Ky+LTQF5HE1XjVfBV2mhcItr9Iwph9Dy5OlLfQ9F+2bPEegV5LG0TWYEpTVib9qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740118001; c=relaxed/simple;
	bh=SgfwcNAGtGysz8w5ImfVW71Vm+58S1DAXlJz7MZp4Vc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WyCADjCZrmXhgsVYpQZ0wK2lOYVNKpJDs+geYuYwfgko1V+KNJTZA8oz58R83BochGg4oxK4ZuO/+MPDKacWwTQQa86850OIjdkJX8tyCvLuxEYEQE5Nv8TScfoTb6DJWZxWe2YUm8OmmhqbSUENIfNLO4xcU2VtGS6dziNbFD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VJftN9Mc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L5RcvK015031;
	Fri, 21 Feb 2025 06:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cyWBbkGS49vwWOjICuYMJBNYDFOfeu+z9/asngCMic=; b=VJftN9McxGuNE7/m
	6PTgw2MfahQ9dzFe8XcAJgVZj3rEDpadQIU152Pt6n9SZLWPYYEgXUwnfGmQEjoG
	E/DvCFn4LyA98Vpncf5ah3P1PXsfBh10he9LUq4v7bF6rI3Rj2nuMDpuDdFm65XD
	dyY33s2SKWtvlSq4kSIPII0siTle7+xJZkYCowZWfo17aMA3gwHCk6ECQhp1FGCV
	IsSQASKarcOzWa63eo/R/FUBiIBkvDrDAGxOUycpHTqULlTPH4T2f8EDYvEsw0+k
	3wYovJTQqxGWt/+9l2a+UcH1ss3szyUcRXbHMXW6CQnHNA+U9eJQeGg7EkACBjf/
	PPgtBQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy18ms3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 06:06:25 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L66OqH015449
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 06:06:24 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 22:06:19 -0800
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
Subject: [PATCH v13 3/7] Coresight: Use coresight_etm_get_trace_id() in traceid_show()
Date: Fri, 21 Feb 2025 14:05:39 +0800
Message-ID: <20250221060543.2898845-4-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221060543.2898845-1-quic_jiegan@quicinc.com>
References: <20250221060543.2898845-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-GUID: Yp8JO5mrodgrKONsXfsgYQdOr0FLHxr9
X-Proofpoint-ORIG-GUID: Yp8JO5mrodgrKONsXfsgYQdOr0FLHxr9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=802 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502210044

From: James Clark <james.clark@linaro.org>

Use the new API, coresight_etm_get_trace_id, to read the traceid of the ETM
device when call traceid_show via sysfs node.

Signed-off-by: James Clark <james.clark@linaro.org>
Reviewed-by: James Clark <james.clark@linaro.org>
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


