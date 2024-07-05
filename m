Return-Path: <linux-arm-msm+bounces-25335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4597B92846E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 11:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0D1F1F231D9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jul 2024 09:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAC71474AF;
	Fri,  5 Jul 2024 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XtH8lL1b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB5E1465A9;
	Fri,  5 Jul 2024 09:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720170087; cv=none; b=aP93+8ySzpduz3c4iqKy8kOHlY6bUAehkB6G6ePZDYrVgBuiduBqCEU/NyFUadDisc6DpdBonlfQvaoirAM5s7+pNH11qeMzigzWfmvZp97yE0N2MG0CVIqwLzG9KyyBteRVPG9zl990oxhacgItzzTe9nakdPoorvUIHcugyoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720170087; c=relaxed/simple;
	bh=zShQJ2xaddQPUH0o5D/FiebnKdfM57McvAJECGZDgVU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Zj/jIz6Janf2HRh4VTZ+tXDRKyDV54aSXDj0vTLoLmJ+WVSdPhM2k1mNXC3VVahsfpEeH9IA8//rtvyVAJa1px8lSYVMvr9RwpwUtABYbgB7O9P0LQsHJ0j4kkIe+ANOZkgypKrfV6g8ZiYevJEZD1RAfec6Q37TSu03UZndRuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XtH8lL1b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4650sc0Y032627;
	Fri, 5 Jul 2024 09:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gVLD0PfTypd3x/2oUv8q80
	Q3drogbSippc8/52aK+4M=; b=XtH8lL1bpfk3Wu/ry9SNZnXap83lAM7iw62cHJ
	1IYNWUWBaZMkFMWEV5LmNfxEZya8RT1Ig7MNtvLBmtqnO4XimMjzrWx23SxLzxiy
	Hx/FeC6Uqb+RTY0+Yd9noouP7vtlYCOgphWyjqJuGSuVfJUhzA2qF4r9WhUFzhUl
	pIvnTksgkuIZPiV0gO13vao1xWrRiwErBP+DqhX7WEYRcDeVsFeDR9I7lvw1YlIY
	H28ftqo5XX3tyzbTnngJk8yWRj2IZkYIR1waR8resSBqeAiK1a13JiULbrue2Zo4
	3C79M6NLzSvzCymXZsquvvzCv8Cojmf4crWXwZXgFLc2tW0w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402abtwc3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jul 2024 09:01:12 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46591AI5002658
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jul 2024 09:01:10 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 5 Jul 2024 02:01:05 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Mike Leach <mike.leach@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        James Clark <james.clark@arm.com>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, Leo Yan <leo.yan@linaro.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang
	<quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        "Tao
 Zhang" <quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Song
 Chai" <quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 0/4] Coresight: Add Coresight Control Unit driver
Date: Fri, 5 Jul 2024 17:00:45 +0800
Message-ID: <20240705090049.1656986-1-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ymAvc8GBymTm_U0haFnAqBiqUnZr9yFO
X-Proofpoint-ORIG-GUID: ymAvc8GBymTm_U0haFnAqBiqUnZr9yFO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-05_05,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407050067

The Coresight Control Unit(CCU) device hosts miscellaneous configuration
registers to control various features related to TMC ETR device.

The CCU device works as a helper device physically connected to the TMC ETR device.
---------------------------------------------------------
             |ETR0|             |ETR1|
              . \                 / .
              .  \               /  .
              .   \             /   .
              .    \           /    .
---------------------------------------------------
ETR0ATID0-ETR0ATID3     CCU     ETR1ATID0-ETR1ATID3
---------------------------------------------------
Each ETR has four ATID registers with 128 bits long in total.
e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.

Based on the trace id which is programed in CCU ATID register of
specific ETR, trace data with that trace id can get into ETR's buffer
while other trace data gets ignored. The number of CCU ATID registers
depends on the number of defined TMC ETR devices. For example, two TMC
ETR devices need eight ATID registers. ETR0 with ETR0ATID0-ETR0ATID3
and ETR1 with ETR1ATID0-ETRATID3.

The significant challenge in enabling the data filter function is how
to collect the trace ID of the source device. The introduction of
trace_id callback function addresses this challenge. The callback function
collects trace ID of the device and return it directly. The trace ID will be
stored in the structure called cs_sink_data and transmitted to helper
and sink devices.

The cs_sink_data structure is created to address how to transmit
parameters needs by coresight_enable_path/coresight_disbale_path
functions.

Here is an example of the struct cs_sink_data:
struct cs_sink_data {
        struct perf_output_handle  *handle; //used by perf mode
        struct coresight_device    *sink;   //used to retrieve atid_offset
        u32                        traceid; //traceid needed by CCU
};

The atid_offset mentioned before is the offset to ATID register in CCU
device.

Enabling the source device will configure one bit in the ATID register based
on its trace ID.
Disabling the source devices will reset the bit in the AITD register
based on its trace ID.

Useage:
Enable:
STM device with trace ID 5 and ETR0 is activated.
Bitmap before the enablement:
ETR0ATID0:
31..................543210
==========================
0000000000000000000000...0
==========================

Bitmap after the enablement:
31..................543210
==========================
0000000000000...0000100000
==========================

The bit 5 of the ETR0ATID0 register is configured to 1 when enabling the
STM device.

Disable:
STM device with trace ID 5 and ETR0 is activated.
Bitmap before the disablement:
ETR0ATID0:
31................6543210
=========================
000000000010111...0100000
=========================

Bitmap after the disablement
ETR0ATID0:
31................6543210
=========================
000000000010111...0000000
=========================

The bit 5 of the ETR0ATID0 register is reset to 0 when disabling the STM
device.

Previous discussion for V1:

https://lore.kernel.org/lkml/20240618072726.3767974-1-quic_jiegan@quicinc.com/T/#t

V1->V2:
1. Rename the device to Coresight Control Unit.
2. Introduce the trace_id function pointer to address the challeng how to
properly collect the trace ID of the device.
3. Introduce a new way to define the qcom,ccu-atid-offset property in
device tree.
4. Disabling the filter function blocked on acquiring the ATID-offset,
which will be addressed in a separate patch once it’s ready.

Jie Gan (4):
  Coresight: Add trace_id function to collect trace ID
  dt-bindings: arm: Add binding document for Coresight Control Unit
    device.
  Coresight: Add Coresight Control Unit driver
  arm64: dts: qcom: Add CCU and ETR nodes for SA8775p

 .../bindings/arm/qcom,coresight-ccu.yaml      |  87 ++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 163 ++++++++++
 drivers/hwtracing/coresight/Kconfig           |   6 +
 drivers/hwtracing/coresight/Makefile          |   1 +
 drivers/hwtracing/coresight/coresight-ccu.c   | 290 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ccu.h   |  18 ++
 drivers/hwtracing/coresight/coresight-core.c  |  53 +++-
 drivers/hwtracing/coresight/coresight-etb10.c |   3 +-
 .../hwtracing/coresight/coresight-etm-perf.c  |  34 +-
 .../coresight/coresight-etm3x-core.c          |  14 +
 .../coresight/coresight-etm4x-core.c          |  13 +
 drivers/hwtracing/coresight/coresight-priv.h  |  12 +-
 drivers/hwtracing/coresight/coresight-stm.c   |  13 +
 drivers/hwtracing/coresight/coresight-sysfs.c |  24 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   |   3 +-
 .../hwtracing/coresight/coresight-tmc-etr.c   |   6 +-
 drivers/hwtracing/coresight/coresight-tpda.c  |  13 +
 drivers/hwtracing/coresight/coresight-trbe.c  |   4 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c    |   3 +-
 include/linux/coresight.h                     |   4 +
 20 files changed, 739 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ccu.yaml
 create mode 100644 drivers/hwtracing/coresight/coresight-ccu.c
 create mode 100644 drivers/hwtracing/coresight/coresight-ccu.h

-- 
2.34.1


