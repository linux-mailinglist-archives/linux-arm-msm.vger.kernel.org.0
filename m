Return-Path: <linux-arm-msm+bounces-22971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66F90C46C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 09:35:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA68BB21B89
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 07:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D8F13A895;
	Tue, 18 Jun 2024 07:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EScJdUd7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9841E863;
	Tue, 18 Jun 2024 07:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718695697; cv=none; b=i/5hMeqYEiE/FZBr/VoCCuv4zjUpMCTkeuKMX46RjRNtP+rp0g5Ru5QCqKd2a20N20BsWCbipqr3A40fqdtO7Z3SRAp/oSafiHi3N6t6fz0DPZirxc9DsjqD30buq3Pl/72xUQBY16at4kv4kTgV/O2H6QQd+Y0dSlkYXPdZD6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718695697; c=relaxed/simple;
	bh=Pm+g1zuO3lpBcnw4Y+4LbimsaZWAveg3kEfjlLAa/k0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l1lu/PhVnWwbIlOgKIbKB4E2v7vpAnf4Wzupwk7eST11H0ANlEpqSFoNnNE8iuQUagvXXX/I+v9kolRPLIUmf4pYqcxDlapfe2vjj54+PelaDgxXUHSqVZ4BJdkkCx4cOVl2CHfX6N27WC/XZBLciWtol6L9vAlehkNrdzDzfIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EScJdUd7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HLfSXN025439;
	Tue, 18 Jun 2024 07:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WVaPTYXZ+AMwgmFA5PnrJu
	PY3/z3kl0dMUW5njXHbq8=; b=EScJdUd7aEBQG/nPJUQEgIwpm1FS+ffW/EDANy
	O9GVebWqzgFzHXRzB2jWirUvsZKHPsyEM3mXox+OL72B2A5J3/dCcDw6QZywiNJL
	cc2/mm5Bf9U515U6KA6SVDd5ZOX02+YB/kmTmtbXt+/BGN2FeNeMjkKn0c68cLnA
	86GG1JV/UBoKmoHdeMg66uUSAQGumQ0kUHuiVNFET3W0oPEoM9ck7JZdzAPeQqRG
	YPXrAdzNGge0tK4WmAKG9W2kWKFxcMfC0DpXU8B8JBvjlVqb3IYbQHOCyP04wdO8
	sMX+YEumNnk78i8lgc0IZ15yEl6+qiE31PPRi2q5XwAQvcMg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys3qf5ta9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 07:27:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45I7Rv2N024337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 07:27:57 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 00:27:45 -0700
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
Subject: [PATCH v1 0/3] Add coresight slave register driver to support data filter function
Date: Tue, 18 Jun 2024 15:27:23 +0800
Message-ID: <20240618072726.3767974-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-GUID: jv1hjDa81jJN9reNr2ZGwldPlZi59B5j
X-Proofpoint-ORIG-GUID: jv1hjDa81jJN9reNr2ZGwldPlZi59B5j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 malwarescore=0 spamscore=0 mlxlogscore=999 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406180054

The Coresight Slave Register(CSR) device hosts miscellaneous configuration
registers to control various features related to TMC ETR device.

The CSR device works as a helper device physically connected to the TMC ETR device.
---------------------------------------------------------
             |ETR0|             |ETR1|
              . \                 / .
              .  \               /  .
              .   \             /   .
              .    \           /    .
---------------------------------------------------     
ETR0ATID0-ETR0ATID3     CSR     ETR1ATID0-ETR1ATID3
---------------------------------------------------
Each ETR has four ATID registers with 128 bits long in total.
e.g. ETR0ATID0-ETR0ATID3 registers are used by ETR0 device.

Based on the trace id which is programed in CSR ATID register of
specific ETR, trace data with that trace id can get into ETR's buffer
while other trace data gets ignored. CSR may contain several ATID registers. 
Each ATID register is associated with an ETR device.

To achieve this function, the trace id is obtained and stored in the related
ETR device's driver data just before enabling the CSR. Then, the CSR
device can easily obtain the trace ID from the ETR's driver data because the
ETR's driver data is passed to the CSR's enable/disable functions.

Ensure that every source device has already allocated a trace ID in its probe
session because the sink device should always be the first device to
enable when operating coresight_enable_path function. As a helper device of the
ETR, the CSR device will program the ATID register of a specific ETR according to
the trace id to enable data filter function at a very early stage. Without the
correct trace ID, the enablement session will not work.

Each CSR's enable session will set one bit in the ATID register.
Every CSR's disbale seesion will reset all bits of the ATID register.

This patch only supports sysfs mode. I will send the perf mode part patch
once it is ready.

Looking forward to receiving comments as this is a new driver.

Thanks!

Jie Gan (3):
  dt-bindings: arm: Add binding document for Coresight Slave Register
    device.
  coresight: Add coresight slave register driver to support data filter
    function in sysfs mode
  arm64: dts: qcom: Add CSR and ETR nodes for SA8775p

 .../bindings/arm/arm,coresight-tmc.yaml       |   8 +
 .../bindings/arm/qcom,coresight-csr.yaml      |  49 +++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 167 ++++++++++
 drivers/hwtracing/coresight/Kconfig           |   6 +
 drivers/hwtracing/coresight/Makefile          |   1 +
 drivers/hwtracing/coresight/coresight-core.c  |   6 +-
 drivers/hwtracing/coresight/coresight-csr.c   | 315 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-csr.h   |  24 ++
 .../coresight/coresight-etm4x-core.c          |   1 +
 drivers/hwtracing/coresight/coresight-stm.c   |  50 ---
 drivers/hwtracing/coresight/coresight-sysfs.c |  45 ++-
 .../hwtracing/coresight/coresight-tmc-core.c  |   1 +
 drivers/hwtracing/coresight/coresight-tmc.h   |   2 +
 include/linux/coresight-stm.h                 |  44 +++
 14 files changed, 665 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml
 create mode 100644 drivers/hwtracing/coresight/coresight-csr.c
 create mode 100644 drivers/hwtracing/coresight/coresight-csr.h

-- 
2.34.1


