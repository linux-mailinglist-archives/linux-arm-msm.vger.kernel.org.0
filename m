Return-Path: <linux-arm-msm+bounces-45646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 85588A1776B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 07:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A0AC188A7C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 06:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427281A9B32;
	Tue, 21 Jan 2025 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SKO1ALpM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C1617B425;
	Tue, 21 Jan 2025 06:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737441581; cv=none; b=NwuSejEwuYqIhEw4+4ApliERubq1ma49fQOYTrQHmOwtgnoB3K6I5qh/GH9fUJu2mRhQoVdWqSXq1lptC9RspFcsS2iqSfgNvREWoXLh30bL6QjAuO7wRC2fDeyFyLsr+WmRry+i82iNFD2cT1dsLYyWs1BTxYLIsfwyzcVaA2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737441581; c=relaxed/simple;
	bh=MUKKi0CoiLM+p9ic+BuECRFblngK0WT/SoYcNlpdrK0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JpgRcH82h38OHgVs5ZbE6Gt4tFUt0+CJerHeJcO6r9ZSxadcOZh8LVCCwh0cLJhb7KzEocxnA/2u5i/oRgLIPPNJY3+e2REw7ryOg3Bm2kxdu0z4J9dzcZbGdubud7aYQE2bXc+HYQ/XY2AXyCcMejy48N2H9sty+DzJCbR2n1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SKO1ALpM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50KMs8wN028217;
	Tue, 21 Jan 2025 06:39:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=qawjtUOAIINR3LXTgb05U4jI5Cq8VWRU9DI1GwyMY3Y=; b=SK
	O1ALpMmWfANJN7EUXcrGDuGYIFxUoSixJj7YxQY+CUXy882n4LL8ZP4/Mo9M7qoU
	es7+cMBRvmHWeQU2pd12KZJUc87aR1yB23FqSMIpgPsHXcQCUG4Guj8dfTkvYcb/
	vIjgpO07o4Zk+j8QJnyBqrKox6sORhpyQA3v1U0xel00JYqbNZOfP2oreiq7lKkt
	ZXN5M1OXV3tGo86YLhoL6deAbLf6NqlYkVsuddPkr6xZ03qYX/KheOXiD1toTnrw
	pXS7u3BEar3LwNbiwRCCxzMvMjTmnhn0fajuEUdonQxmfuWG0Zp4FolRmukyRMfu
	4mEZ+JyfjRrDkVshEt3Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 449whe8xnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 06:39:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L6dLms023008
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 06:39:21 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 Jan 2025 22:39:17 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 0/2] coresight: Add remote etm support
Date: Tue, 21 Jan 2025 14:38:58 +0800
Message-ID: <20250121063900.3211-1-quic_jinlmao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: e_DfBgNPFU88-BpGKWlFkw5nYuoGgFfT
X-Proofpoint-GUID: e_DfBgNPFU88-BpGKWlFkw5nYuoGgFfT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_03,2025-01-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 mlxscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210053

The system on chip (SoC) consists of main APSS(Applications processor
subsytem) and additional processors like modem, lpass. There is
coresight-etm driver for etm trace of APSS. Coresight remote etm driver
is for enabling and disabling the etm trace of remote processors.
It uses QMI interface to communicate with remote processors' software
and uses coresight framework to configure the connection from remote
etm source to TMC sinks.

Example to capture the remote etm trace:

Enable source:
echo 1 > /sys/bus/coresight/devices/tmc_etf0/enable_sink
echo 1 > /sys/bus/coresight/devices/remote_etm0/enable_source

Capture the trace:
cat /dev/tmc_etf0 > /data/remote_etm.bin

Disable source:
echo 0 > /sys/bus/coresight/devices/remote_etm0/enable_source

Changes since V3:
1. Use different compatible for different remote etms in dt.
2. Get qmi instance id from the match table data in driver.

Change since V2:
1. Change qcom,inst-id to qcom,qmi-id
2. Fix the error in code for type of remote_etm_remove
3. Depend on QMI helper in Kconfig

Changes since V1:
1. Remove unused content
2. Use CORESIGHT_DEV_SUBTYPE_SOURCE_OTHERS as remote etm source type.
3. Use enabled instead of enable in driver data.
4. Validate instance id value where it's read from the DT.

Mao Jinlong (2):
  dt-bindings: arm: Update compatible for remote etm
  coresight: Add remote etm support

 .../arm/qcom,coresight-remote-etm.yaml        |  11 +-
 drivers/hwtracing/coresight/Kconfig           |  13 +
 drivers/hwtracing/coresight/Makefile          |   1 +
 drivers/hwtracing/coresight/coresight-qmi.h   |  89 +++++
 .../coresight/coresight-remote-etm.c          | 316 ++++++++++++++++++
 5 files changed, 428 insertions(+), 2 deletions(-)
 create mode 100644 drivers/hwtracing/coresight/coresight-qmi.h
 create mode 100644 drivers/hwtracing/coresight/coresight-remote-etm.c

-- 
2.17.1


