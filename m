Return-Path: <linux-arm-msm+bounces-49492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A7EA45EA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 13:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6837A7AB2CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:21:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35FB22192E1;
	Wed, 26 Feb 2025 12:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J0qqBsNl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71197218AC8;
	Wed, 26 Feb 2025 12:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740572409; cv=none; b=K/NNtrUifedBFEI0QRL760Cb6XdTZdqlCLuoz0EoHZg9w/vOpxvBhBvef7Hue2818nAhJy4bCJXua4I2rqarSSl/oqeD/i5K5yq2gn6Zgs1Y+aK4N1jYoa/cscpci5q6M77clIgOowAHA49wQ3Rxym7hsIY0s9LBzEogJ1vsKWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740572409; c=relaxed/simple;
	bh=lUHM1QlF632MFcohMSa0GsHtVg9gcLinYVU3B5boxVI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QmZ3EQQnlCHlWJ4L5acpacwNFLiN6jzH77ODD1de8aUjCC61fqmE41+W7lzJNjPvL7jLM5CGe9oUsaDBauZhEmBwTg59Jm1HuokAwV/kf9uH0VYDWB1ZAE0stIRsgYy00uk+aXeKcsrwvxmldC/n6jD3UT43Lu7llaDrs05H3XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J0qqBsNl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QAF7vE017829;
	Wed, 26 Feb 2025 12:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=shRb1CkTuPvW+P3MW8llJi
	RD/Wd0i7+TlVAiYFwRRSI=; b=J0qqBsNlUsur5TAX2071R5p+xn3lAdm8U2JWUf
	bo84+EvkY0htPqRa4WN9RJPS24fROTe8l8TUUzrMNmSSEiqOFpfdMORml/KF2AMI
	uhaxCTNLLCKYDyPcfYhzXyvVCdk3+SIa6S08eJWHgUhEwmEEjq2Zrwfa2MGhUWq6
	3tQQuuNDO9/vCzVpFuGLhOB4Q459IsfQaZRBJ/Annywzh1ca5ultEcGlGaW9b8Fs
	koTzdjZmgo6XG3beJzfDiGB/XFQu6Yky+n8OdkA/mJGF6tIgpJfbEf2ZXNZObUz9
	qW1t+vi4KUetbJU5greoNsMLxtvYklkzA2q94uYrrsuen6Nw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prn1xru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 12:19:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51QCJt0q017405
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 12:19:55 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Feb 2025 04:19:54 -0800
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
Subject: [PATCH v7 0/2] coresight: Add label sysfs node support
Date: Wed, 26 Feb 2025 04:19:24 -0800
Message-ID: <20250226121926.2687497-1-quic_jinlmao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: Q6FnnBR141W73Ia0oWQDyeKbWnGNQbdG
X-Proofpoint-GUID: Q6FnnBR141W73Ia0oWQDyeKbWnGNQbdG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-26_02,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1011 mlxscore=0 adultscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260098

With current design, the name of the non-cpu bounded coresight
component is the device type with the number. And with 'ls' command
we can get the register address of the component. But from these
information, we can't know what the HW or system the component belongs
to. Add label in DT and show the hw information by reading label sysfs
node.

cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
tpdm0 -> ../../../devices/platform/soc@0/10b0d000.tpdm/tpdm0
tpdm1 -> ../../../devices/platform/soc@0/10c28000.tpdm/tpdm1
tpdm2 -> ../../../devices/platform/soc@0/10c29000.tpdm/tpdm2

/sys/bus/coresight/devices # cat cti*/label
cti_dlct_0
cti_dlct_1
cti_apss_0
cti_apss_1
cti_apss_2

Change since V6:
1. Update the date and verison in ABI file.

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
  dt-bindings: arm: Add label in the coresight  components
  coresight: Add label sysfs node support

 .../testing/sysfs-bus-coresight-devices-cti   |  6 ++++
 .../sysfs-bus-coresight-devices-funnel        |  6 ++++
 .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++++
 .../bindings/arm/arm,coresight-cti.yaml       |  6 ++++
 .../arm/arm,coresight-dummy-sink.yaml         |  6 ++++
 .../arm/arm,coresight-dummy-source.yaml       |  6 ++++
 .../arm/arm,coresight-dynamic-funnel.yaml     |  6 ++++
 .../arm/arm,coresight-dynamic-replicator.yaml |  6 ++++
 .../arm/arm,coresight-static-funnel.yaml      |  6 ++++
 .../arm/arm,coresight-static-replicator.yaml  |  6 ++++
 .../bindings/arm/arm,coresight-tmc.yaml       |  6 ++++
 .../bindings/arm/qcom,coresight-tpda.yaml     |  6 ++++
 .../bindings/arm/qcom,coresight-tpdm.yaml     |  6 ++++
 drivers/hwtracing/coresight/coresight-sysfs.c | 32 +++++++++++++++++++
 14 files changed, 110 insertions(+)

-- 
2.25.1


