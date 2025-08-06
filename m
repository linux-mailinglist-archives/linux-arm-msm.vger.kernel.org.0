Return-Path: <linux-arm-msm+bounces-67886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6601CB1C442
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 12:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78BC87AC568
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 10:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0E828B4E7;
	Wed,  6 Aug 2025 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H04/9vE+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F28428A40F;
	Wed,  6 Aug 2025 10:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754476044; cv=none; b=rScbWNob63ZxQDEoZvMRTeW7fXGfzQqfrAX9LQaVGE9X8OkUBa2cb1X4QLLPwG7VXoiFxdaRG26iRM22+acTpIQAhadqt9+PExoQXXnpNH0dYbvji+veMnA2mRJ4esKAZqyMEuomlL0iybSNPjMRANuFwCPn3Dvbhtu1zEyE9Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754476044; c=relaxed/simple;
	bh=TlN1HaCL6uk/FnlDEk5L31NC3werVUINEYaa2ZoDE0U=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SMYdjvK/s7iegaesPYYNq4as81SeP0HxpOBT4ZOG3VqC1JklY/67HbKnt3FeWvMap2obYkpOReeOrNSOefqf7Sx41++s/q8yX2gDQS7RhjU3bhcH881WHWx1cToWx2qRM3T7vWv8COk3/NRP2261dAYjQ833+zDx4aE3UHsXBE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H04/9vE+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765ffgG031580;
	Wed, 6 Aug 2025 10:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rBK/XJFxnA4H+qs+vmLEXS
	Ye5OyqDwA6i9lNg270YFs=; b=H04/9vE+u22JMSTTjqz6+cId8V8/dE2/4YhkHf
	3QBzTJTtn6kwQ8lOnbyhIjs83R36jpI8MUxrIubNqLi4ijT80H1/Yhxt+HQF7Eod
	nP6hxR4AOAm4R1VF6bChfVbl3FcBM10xnkrRqrxOtVI05uX+hlKO5WP1O5lcefRQ
	+hL73lAemrLYvuArZxyCUuUc9Wg1/s42I8li8Oq7T7gn7rO0P1ZnjdYhDYdJIEiO
	OTG3JRfXJ2cKIsn4PaRnfFoqHp/1I0upBbSvXdzxJF7UtDsrn+0gO5H4qkzdxWiW
	DqOmZ2hfYG8cYpZOiVrXxlHowCxu11AvzATSXaA6NYEbR0mw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybaetq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 10:27:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 576ARBPe012436
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 10:27:11 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 6 Aug 2025 03:27:11 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v10 0/2] coresight: Add label sysfs node support
Date: Wed, 6 Aug 2025 03:26:56 -0700
Message-ID: <20250806102658.536683-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX+G16V8e7ecj7
 sEOqEpbQ/CCU5eJYMSB1jaApZ2LmE707D2LAJw7nZKHIsuPx4jgqycV0VCr4+BZHFlBaOETA8Hy
 oUgClfvcIep+12mXWnjUHNeSgGPJFIEYeTd3efaKPWTQlndMeydC/xxQ/PadC8pqLDxfRnvFi1r
 X9BdZdnmUxK1ZsyGZUDHWAf2WKqxDie1rtKmPCS6waxUIKCJNKPYeB4GiiS5PnmF9kI7OJvwdO5
 1ad+MawgWdaqryzoHnHiyja50gFzAbUljUesU+o2SWaf+imOFTtjSNZsO1xl8VcmGiKZxwhJKcc
 hXKBgABjlP4VZ6TrYljTTAgJpVJEMbbQg8fxgnj/crmj8ziIFRkz4bo6LCHiHmcI6vdsLq00ZI2
 2AEAWd+W
X-Proofpoint-GUID: XWokKa2HX_RX6fpQLFVOqbp6wZvXW5Ta
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=68932e00 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=2OwXVqhp2XgA:10 a=D19gQVrFAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=C_w9g3tfadNPII6ijWgA:9 a=W4TVW4IDbPiebHqcZpNg:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XWokKa2HX_RX6fpQLFVOqbp6wZvXW5Ta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

Change since V9:
1. Replace scnprintf with sysfs_emit.
2. Update date in ABI files.
V9 link: https://lkml.org/lkml/2025/7/17/832

Change since V8:
1. Add label in all documentations of coresight components.
2. Add control of the visibility of the label sysfs attribute.
V8 link: https://lkml.org/lkml/2025/7/3/985

Change since V7:
1. Update the conflict when apply to coresight next.
2. Update the Date and version in ABI file.
V7 link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250226121926.2687497-3-quic_jinlmao@quicinc.com/

Change since V6:
1. Update the date and version in ABI file.

Change since V5:
1. Update the kernel version of ABI files.
2. Add link of different patch versions.
V5 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20241210122253.31926-1-quic_jinlmao@quicinc.com/

Change since V4:
1. Add label in DT and add label sysfs node for each coresight device.
V4 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20240703122340.26864-1-quic_jinlmao@quicinc.com/

Change since V3:
1. Change device-name to arm,cs-dev-name.
2. Add arm,cs-dev-name to only CTI and sources' dt-binding.
V3 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20240131082628.6288-1-quic_jinlmao@quicinc.com/

Change since V2:
1. Fix the error in coresight core.
drivers/hwtracing/coresight/coresight-core.c:1775:7: error: assigning to 'char *' from 'const char *' discards qualifiers

2. Fix the warning when run dtbinding check.
Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml: device-name: missing type definition
V2 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20240115164252.26510-1-quic_jinlmao@quicinc.com/

Change since V1:
1. Change coresight-name to device name.
2. Add the device-name in coresight dt bindings.
V1 link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230208110716.18321-1-quic_jinlmao@quicinc.com/#25231737

Mao Jinlong (2):
  dt-bindings: arm: Add label in the coresight components
  coresight: Add label sysfs node support

 .../testing/sysfs-bus-coresight-devices-cti   |  6 ++
 .../sysfs-bus-coresight-devices-dummy-source  |  6 ++
 .../testing/sysfs-bus-coresight-devices-etb10 |  6 ++
 .../testing/sysfs-bus-coresight-devices-etm3x |  6 ++
 .../testing/sysfs-bus-coresight-devices-etm4x |  6 ++
 .../sysfs-bus-coresight-devices-funnel        |  6 ++
 .../testing/sysfs-bus-coresight-devices-stm   |  6 ++
 .../testing/sysfs-bus-coresight-devices-tmc   |  6 ++
 .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++
 .../testing/sysfs-bus-coresight-devices-trbe  |  6 ++
 .../bindings/arm/arm,coresight-cti.yaml       |  4 ++
 .../arm/arm,coresight-dummy-sink.yaml         |  4 ++
 .../arm/arm,coresight-dummy-source.yaml       |  4 ++
 .../arm/arm,coresight-dynamic-funnel.yaml     |  4 ++
 .../arm/arm,coresight-dynamic-replicator.yaml |  4 ++
 .../bindings/arm/arm,coresight-etb10.yaml     |  4 ++
 .../bindings/arm/arm,coresight-etm.yaml       |  4 ++
 .../arm/arm,coresight-static-funnel.yaml      |  4 ++
 .../arm/arm,coresight-static-replicator.yaml  |  4 ++
 .../bindings/arm/arm,coresight-tmc.yaml       |  4 ++
 .../bindings/arm/arm,coresight-tpiu.yaml      |  4 ++
 .../bindings/arm/qcom,coresight-ctcu.yaml     |  4 ++
 .../arm/qcom,coresight-remote-etm.yaml        |  4 ++
 .../bindings/arm/qcom,coresight-tpda.yaml     |  4 ++
 .../bindings/arm/qcom,coresight-tpdm.yaml     |  4 ++
 drivers/hwtracing/coresight/coresight-sysfs.c | 71 ++++++++++++++++++-
 26 files changed, 189 insertions(+), 2 deletions(-)

-- 
2.25.1


