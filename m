Return-Path: <linux-arm-msm+bounces-33690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AE49968C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 13:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0171F1C22BF2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 11:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82D7A1922C4;
	Wed,  9 Oct 2024 11:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OuCytY3h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF7A17C7CC;
	Wed,  9 Oct 2024 11:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728473155; cv=none; b=ECy/EWgPc/H1JmygMg9fTO8N343LIzYdoe2eJcbsZqft6yiNHVRMi8cAJzt2OD6UESoya7EKLkJ0hsganMH5oPdxUxe85WZxZkQ0/Gt+tQIxWdVGT1csU3/1HCvLFRhi6AUZH40sSFW/Tl0zEKUOzj0cFTi/RMfHuWLjDglgLEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728473155; c=relaxed/simple;
	bh=Q/U/skELwXjeFmlw+PXe9uYUEEGSBXfnkaPKKb5Mg18=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Sbzb083Zv1vVmMN8/1YfzZIK5LhIvQ4xxhOjLO7geQPqw0Q/5aGTmsfwcY+sJ5XK7K5612QXovHrcBN+NuQOls1lfnRo7O3LBojWcAld8mJay2pmTpddwZ/ucxs1Di+4GiRJIWMPGpzjsds0ey0B/v/QmDOMSgwFBOLgdm87ZOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OuCytY3h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4998wnEP022671;
	Wed, 9 Oct 2024 11:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vh3jC4N5eRkAxNBdeQhb1A
	g8xSvAbYmtno63h1C70z8=; b=OuCytY3hI2EoFZu++5b5ZeT1NLEV5zsFX5LC0F
	wdH5tEpqvydrJok5Fb62d8WCB+f90bGiVs44P9o1qPb6hUm1aHafIWQ7jFOuyppm
	Ver7PaPsruJ2cTzke8Two1toJQSAGJrCcDVBs6EMstuBAyW2xHNh4sSnET/X/Ue5
	AWsy+n+cdIbYWb67eJSX9M4bJnO8dirTBDkQmJTUVLr45Pff1HsAK9lWl77w7k7G
	ItbbBkThvj8CFuZZMYgLiVUDit7E+gEB6b477i/xitghBl720fPNEkUzPD//qznu
	jVwNHxMaUAwAcwZ9HlNiTxDZBku802vhSAjpzRx4o5nZUvNg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424kaewthe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 11:25:28 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 499BPRo6001429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 11:25:27 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 04:25:21 -0700
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
        Bjorn Andersson <andersson@kernel.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v6 0/5] Coresight: Add Coresight TMC Control Unit driver
Date: Wed, 9 Oct 2024 19:24:58 +0800
Message-ID: <20241009112503.1851585-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: 4EW3VtmYkST-Pie3jmhnUs09bLirC39u
X-Proofpoint-GUID: 4EW3VtmYkST-Pie3jmhnUs09bLirC39u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090075

The Coresight TMC Control Unit(CTCU) device hosts miscellaneous configuration
registers to control various features related to TMC ETR device.

The CTCU device works as a helper device physically connected to the TMC ETR device.
---------------------------------------------------------
             |ETR0|             |ETR1|
              . \                 / .
              .  \               /  .
              .   \             /   .
              .    \           /    .
---------------------------------------------------
ETR0ATID0-ETR0ATID3     CTCU    ETR1ATID0-ETR1ATID3
---------------------------------------------------
Each ETR has four ATID registers with 128 bits long in total.
e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.

Based on the trace id which is programed in CTCU ATID register of
specific ETR, trace data with that trace id can get into ETR's buffer
while other trace data gets ignored. The number of CTCU ATID registers
depends on the number of defined TMC ETR devices. For example, two TMC
ETR devices need eight ATID registers. ETR0 with ETR0ATID0-ETR0ATID3
and ETR1 with ETR1ATID0-ETRATID3.

The significant challenge in enabling the data filter function is how
to collect the trace ID of the source device. The introduction of
trace_id callback function addresses this challenge. The callback function
collects trace ID of the device and return it back. The trace ID will be
stored in the structure called cs_sink_data and transmitted to helper
and sink devices.

The cs_sink_data structure is created to address how to transmit
parameters needs by coresight_enable_path/coresight_disbale_path
functions.

Here is an example of the struct cs_sink_data:
struct cs_sink_data {
        struct perf_output_handle  *handle; //used by perf mode
        struct coresight_device    *sink;   //used to retrieve atid_offset
        u32                        traceid; //traceid needed by CTCU
};

The atid_offset mentioned before is the offset to ATID register in CTCU
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

Changes in V2:
1. Rename the device to Coresight Control Unit.
2. Introduce the trace_id function pointer to address the challeng how to
properly collect the trace ID of the device.
3. Introduce a new way to define the qcom,ccu-atid-offset property in
device tree.
4. Disabling the filter function blocked on acquiring the ATID-offset,
which will be addressed in a separate patch once it’s ready.

Previous discussion for V2:
https://lore.kernel.org/linux-arm-msm/20240705090049.1656986-1-quic_jiegan@quicinc.com/T/#t

Changes in V3:
1. Rename the device to Coresight TMC Control Unit(CTCU).
2. Introduce a new way to define the platform related configs. The new
   structure, qcom_ctcu_config, is used to store configurations specific
   to a platform. Each platform should have its own qcom_ctcu_config structure.
3. In perf mode, the ETM devices allocate their trace IDs using the
   perf_sink_id_map. In sysfs mode, the ETM devices allocate their trace
   IDs using the id_map_default.
4. Considering the scenario where both ETR devices might be enabled simultaneously
   with multiple sources, retrieving and using trace IDs instead of id_map is more effective
   for the CTCU device in sysfs mode. For example, We can configure one ETR as sink for high
   throughput trace data like ETM and another ETR for low throughput trace data like STM.
   In this case, STM data won’t be flushed out by ETM data quickly. However, if we use id_map to
   manage the trace IDs, we need to create a separate id_map for each ETR device. Addtionally, We
   would need to iterate through the entire id_map for each configuration.
5. Add support for apb's clock name "apb". If the function fails to obtain the clock with
   the name "apb_pclk", it will attempt to acquire the clock with the name "apb".

Previous discussion for V3:
https://lore.kernel.org/linux-arm-kernel/20240812024141.2867655-1-quic_jiegan@quicinc.com/

Changes in V4:
1. Add TMC description in binding file.
2. Restrict the number of ports for the CTCU device to a range of 0 to 1 in the binding file,
because the maximum number of CTCU devices is 2 for existing projects.

Previous discussion for V4:
https://lore.kernel.org/linux-arm-msm/20240828012706.543605-1-quic_jiegan@quicinc.com/

Changes in V5:
1. Fix the format issue for description paragrah in dt binding file.
2. Previous discussion for why use "in-ports" property instead of "ports".

Previous discussion for V5:
https://lore.kernel.org/linux-arm-msm/20240909033458.3118238-1-quic_jiegan@quicinc.com/

Changes in V6:
1. Collected reviewed-by tag from Rob for dt-binding patch.
2. Rebased on tag next-20241008.
3. Dropped all depends-on tags.

Jie Gan (5):
  Coresight: Add support for new APB clock name
  Coresight: Add trace_id function to retrieving the trace ID
  dt-bindings: arm: Add Coresight TMC Control Unit hardware
  Coresight: Add Coresight TMC Control Unit driver
  arm64: dts: qcom: Add CTCU and ETR nodes for SA8775p

 .../bindings/arm/qcom,coresight-ctcu.yaml     |  84 +++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 160 ++++++++++
 drivers/hwtracing/coresight/Kconfig           |   8 +
 drivers/hwtracing/coresight/Makefile          |   1 +
 drivers/hwtracing/coresight/coresight-core.c  |  59 +++-
 drivers/hwtracing/coresight/coresight-ctcu.c  | 292 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu.h  |  21 ++
 drivers/hwtracing/coresight/coresight-etb10.c |   3 +-
 .../hwtracing/coresight/coresight-etm-perf.c  |  37 ++-
 .../coresight/coresight-etm3x-core.c          |  30 ++
 .../coresight/coresight-etm4x-core.c          |  29 ++
 drivers/hwtracing/coresight/coresight-priv.h  |  13 +-
 drivers/hwtracing/coresight/coresight-stm.c   |  22 ++
 drivers/hwtracing/coresight/coresight-sysfs.c |  24 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   |   3 +-
 .../hwtracing/coresight/coresight-tmc-etr.c   |   6 +-
 drivers/hwtracing/coresight/coresight-tpda.c  |  20 ++
 drivers/hwtracing/coresight/coresight-trbe.c  |   4 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c    |   3 +-
 include/linux/coresight.h                     |  16 +-
 20 files changed, 807 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.c
 create mode 100644 drivers/hwtracing/coresight/coresight-ctcu.h


base-commit: 33ce24234fca4c083e6685a18b460a18ebb5d5c1
-- 
2.34.1


