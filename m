Return-Path: <linux-arm-msm+bounces-27193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA7D93EE37
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 09:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5318D1F232D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 07:15:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED7F84A39;
	Mon, 29 Jul 2024 07:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GZNKC0mf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D78F7406F;
	Mon, 29 Jul 2024 07:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722237295; cv=none; b=bOUldS2hOtNURrejqYL43AhTq58SQO/P4yNGD1T//wuR9X9q+CPHa1F9aGn/yh5FBVngD9DVt9MYFo0/RWCh8mju50tgitqlA+JwYl0Xpdejz7yfxDCGZhIse9r6bPoI7rqvbA1BdeISc1M8FVEbtN858tYBieX/Sj6ddax4aFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722237295; c=relaxed/simple;
	bh=6U+p8ZIJcELoCEQ2PharZExlW1dG6N1so+b1+qs98gc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PpfhX5WDf613GQMMIhCNsTmYm+woYpxgBEMhQj7FtPDbXgZ6fGoeC6V6fO1I0jXuZIdObmGUNPU575Cmk+TAPKAedV2Fi6jZ2X1T2QLpogZj3WFbcVP1C1B3/zdwZX2G1Llj2E/8+Y62OJOKMJzScvZDYpnXv61IcNi+rY87Jp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GZNKC0mf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46SMnwYp021411;
	Mon, 29 Jul 2024 07:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=G8qDFjadhy7dNDhCQQ9Z9l
	IHr6yYz23a/hgKypjSlP0=; b=GZNKC0mfdnwhAeRbjutd7E40Wd3eoLmTEjdH07
	EbWpK6JVJ+71AqysQ+0uBaUSTqpO1ATIVnepxjYxcEfLlDKH37iCCHJbuPWQ/QI9
	z3Nuqvnfm1hUqXET2Rfh9LYHt85Ta2PGkHG8b65iqRLDrXEatgZOE9WHAFuISx4f
	3njlsYVk5o43G43ME4z3wPiBfXtmvXHcjSinoCPtpBWLeByIhk5f9iIt59T9+mN0
	evsDhfvqsiwRcUmK2b+FpbZyaIAvB+gR0DcO1iU32H+rpe5FiwWQ8xpkEnrJQNcL
	za1bWq28BGk3vf6HN+MQ55lpQn7PpOGb9A/aoMEIGQ5vCn2Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mp8muh97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 07:14:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46T7EPEh028698
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 07:14:25 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Jul 2024 00:14:25 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v4 0/3] coresight: Add static trace id support
Date: Mon, 29 Jul 2024 00:14:08 -0700
Message-ID: <20240729071414.5410-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KvUgF-oFeFrtJrBVGk-5moJhXHvGY4A5
X-Proofpoint-ORIG-GUID: KvUgF-oFeFrtJrBVGk-5moJhXHvGY4A5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_05,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290048

Some HW has static trace id which cannot be changed via
software programming. For this case, configure the trace id
in device tree with "arm,static-trace-id = <xxx>", and
call coresight_trace_id_get_static_system_id with the trace id value
in device probe function. The id will be reserved for the HW
all the time if the device is probed.

Changes since V3:
1. Adda new API function
int coresight_trace_id_get_system_static_id(int trace_id).
2. Use the term "static trace id" for these devices where
the hardware sets a non-programmable trace ID. 

Changes since V2:
1. Change "trace-id" to "arm,trace-id".
2. Add trace id flag for getting preferred id or ODD id.

Changes since V1:
1. Add argument to coresight_trace_id_get_system_id for preferred id
instead of adding new function coresight_trace_id_reserve_system_id.
2. Add constraint to trace-id in dt-binding file.

Mao Jinlong (3):
  dt-bindings: arm: Add arm,trace-id for coresight dummy source
  coresight: Add support to get static id for system trace sources
  coresight: dummy: Add static trace id support for dummy source

 .../sysfs-bus-coresight-devices-dummy-source  | 15 +++++
 .../arm/arm,coresight-dummy-source.yaml       |  6 ++
 drivers/hwtracing/coresight/coresight-dummy.c | 59 +++++++++++++++++--
 .../hwtracing/coresight/coresight-platform.c  | 26 ++++++++
 .../hwtracing/coresight/coresight-trace-id.c  | 38 ++++++++----
 .../hwtracing/coresight/coresight-trace-id.h  |  9 +++
 include/linux/coresight.h                     |  1 +
 7 files changed, 140 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source

-- 
2.41.0


