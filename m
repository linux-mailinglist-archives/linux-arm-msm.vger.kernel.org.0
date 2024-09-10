Return-Path: <linux-arm-msm+bounces-31402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E53339730A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 12:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9BD6288560
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 10:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 851FE18F2D6;
	Tue, 10 Sep 2024 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Z+igTG2O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EA517BEAD;
	Tue, 10 Sep 2024 10:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725962513; cv=none; b=WYiUNOWsuDpRCJntLUZpQHHJT0fmkwM8SqWJzGj839ZthUlqb5zJ75dJXVsaDYF1z8E7tjgbjWOnmwg8p9ljm6vuipjBEYe8OhXpMgEl3Ex/anjUuGJ3edbBF6+/Y/ufvyUa/NXDbWytpq/4KzVwIRSwCLhfcc94gjqOLnLZrjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725962513; c=relaxed/simple;
	bh=EhBsYloVB+zYiiKtGFXpoYaZd8W39qoAE0ePMjthAzE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PABJvnnsCzUtIzKmOzwVXljBKNX6ybBRP813VX4/DlBTFCaRpR6cV2Fx52cbfUpi01Kkc+ZYenLssg8HKDq7OLhujg8z5KlZ/wQa61nferwVO8frs8yIrymAz4Gh1yG7kY5WOrHzRGDq7D/VCcd4e0+ORgE+lzaXLmmOxWIU1mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Z+igTG2O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A47osa022192;
	Tue, 10 Sep 2024 10:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GKViQbQ56BBU4UqObaKO7g
	KB2TF6OxYpGJ6GbHkBu0M=; b=Z+igTG2OE/leliHLnwRx/+rbO9cjCE96pfXZyk
	4g0cIfj5I9cYoUevJo1QQ1+eEjCIfUhK39C3XYSQUmR8HFTDURSNC7XScK0Wn1hn
	84t3fstqAnnnybW5TPtT7V4a+DVKJkBosePEoh94eQXroEd2MUMnKHQLe/xs2WdM
	9lXxo0qv7D67qzHW6Jz0GDGyxzrj02m0dijlSn/oF7Vcnr6x7vmYWoj52CxATqNX
	5ovxzj9RQlGpd17vslkAscHiP+DC3AfqDU2noPf6odUqkqRh3QUC5lx/9KqVThKf
	5jVJmhLmNr/kSEKz99OpBFReFXKc/6aV4QTTA69sCmu1Vz8Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41he5dvpqc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 10:01:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48AA1dU2031658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 10:01:39 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Sep 2024 03:01:38 -0700
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
Subject: [PATCH v4 RESEND 0/3] coresight: Add static trace id support
Date: Tue, 10 Sep 2024 03:01:22 -0700
Message-ID: <20240910100127.8948-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: R5ob_mQzI7_5Fdt_lWfhOtK93roNfaAY
X-Proofpoint-GUID: R5ob_mQzI7_5Fdt_lWfhOtK93roNfaAY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100075

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
2.46.0


