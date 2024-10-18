Return-Path: <linux-arm-msm+bounces-34842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A079A3351
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 05:22:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1693F285447
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 03:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ED641547C3;
	Fri, 18 Oct 2024 03:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UNI0K26H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8E456B81;
	Fri, 18 Oct 2024 03:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729221773; cv=none; b=LKOc786Cb8RAx/j9Nj/JrJQgLAgy0RHX+2NvRo8hdxgj2TaO9l+PWlnZjt/Cku1mcQ1u/qVhPqWfzmpvNy8XvYplz2lxyFXlLomxIiobqmB0Yk62/aqXceCby30ij0tT5BnyUGcYHbN5aoLWMPXfXP8bu9nrExK5rxDCiZ9t558=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729221773; c=relaxed/simple;
	bh=aGXs6MEByXvezSEcyFCnLj2/deW5Lu45Q3ildAly6ts=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VNLtayCYkHTYb1epxwoBZ3+5UvcKlBc+mqVcoLwNInND0nxqbE92y8ZN8PbaSSaDyhXxzkPziFwFddfOqGNyXbilw5Nbp5vS2RNdyim16XWgKE8PC/OoQdUwYqPbfb1IWtkKxh4IL2GWSpG+8J6PBRTQ3gAlg2+33Lj3uLXze7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UNI0K26H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49HKJdga028782;
	Fri, 18 Oct 2024 03:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=Ec52w5XDSk2SGU4S+7x8mZnRhGFFwBUGPykCvX9wRGQ=; b=UN
	I0K26HeoFRRIk96tq2Xul8gu/XUGUCJ2hc3e1fYk9eZTBEYgLpOra+NM5JsoNzp1
	R0tEbZqdz5OTbeIdrDsPLLUE+28HgsiANAffHbb5KylSqOs3RXY4mzVno4G6nFAw
	Sa6VavBvAjCtQCAgSikb8ND+ldhtVFWhroBPNc4030TwmdKHtDxpSZ2en0zxMRWW
	rRJrXDOEz688kTXQOLO6yFucF68HWsEpCqtdb3dkmlugEmrLSgie56hBGLkoOvBY
	Ubb5ppGZ97dweUejGqC6nZZPtb9oL9pURBynTATrSUHfEzGY8ke5sSSYkJYPh4XA
	HzG9bVA0QrEguzyhLT1A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ay8jarex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 03:22:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49I3Mbt0016799
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Oct 2024 03:22:37 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 20:22:34 -0700
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
Subject: [PATCH v5 0/3] coresight: Add static trace id support
Date: Fri, 18 Oct 2024 11:22:14 +0800
Message-ID: <20241018032217.39728-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rTdL01yTBzwezWfRhQDKww4OoT9KHLMh
X-Proofpoint-ORIG-GUID: rTdL01yTBzwezWfRhQDKww4OoT9KHLMh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410180019

Some HW has static trace id which cannot be changed via
software programming. For this case, configure the trace id
in device tree with "arm,static-trace-id = <xxx>", and
call coresight_trace_id_get_static_system_id with the trace id value
in device probe function. The id will be reserved for the HW
all the time if the device is probed.

Changes since V4:
1. Use fwnode_property_read_u32 in fwnode_property_read_u32.
2. Update date and version in sysfs-bus-coresight-devices-dummy-source

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
  dt-bindings: arm: Add arm,static-trace-id for coresight dummy source
  coresight: Add support to get static id for system trace sources
  coresight: dummy: Add static trace id support for dummy source

 .../sysfs-bus-coresight-devices-dummy-source  | 15 +++++
 .../arm/arm,coresight-dummy-source.yaml       |  6 ++
 drivers/hwtracing/coresight/coresight-dummy.c | 59 +++++++++++++++++--
 .../hwtracing/coresight/coresight-platform.c  |  9 +++
 .../hwtracing/coresight/coresight-trace-id.c  | 38 ++++++++----
 .../hwtracing/coresight/coresight-trace-id.h  |  9 +++
 include/linux/coresight.h                     |  1 +
 7 files changed, 123 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source

-- 
2.17.1


