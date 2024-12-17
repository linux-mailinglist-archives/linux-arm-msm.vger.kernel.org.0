Return-Path: <linux-arm-msm+bounces-42465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93ECD9F43C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 07:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A654E188D06D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 06:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A440158A13;
	Tue, 17 Dec 2024 06:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B7ywPHSG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B280E14A60C;
	Tue, 17 Dec 2024 06:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734417237; cv=none; b=rXNH1apy9OiZNahMo1akejLq0upQ3w2AY45WyGiLeBe1edZ01sV9PxJqQZi6XPMYJ214hKhbFzAWj6qHRZGblZXlQP2rvRs/cNF0JPzpiJ4Y4bQrIgsWMeZDm9cj8ebCE9yejd3DfyeLANgq7J1bwTYOp9rMfAKqptQfOwYlguo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734417237; c=relaxed/simple;
	bh=YTcGdzooQlDOQRgu20Taw2G5uaOX+r/RRexvQUoBW1g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ejN1Qpm4Ga98akpLlrf2O70Nedp6KuDzExkN+XAVbabiToUAg4qKF6x2afRsOvzRLud1wh6Xh/2bnFrm6ZTR1/8w9P26RlNINtuaDgEmkKF0g2suUvO8AY38b8g9KTH1ldmEvRkWb9wFWYGJuC4CltgduZRmkyDMJJyYk/WRQIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B7ywPHSG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH4m0QX013866;
	Tue, 17 Dec 2024 06:33:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=fx1wB5s5T5yhaqayYVxUV1hUw3r0kdSqMRPBEsnKCGc=; b=B7
	ywPHSGVj5Ri0jBjcAzdwhSX3p7LHf47gSTBoKDNRT2w+eTvmFfNQsvTZWGhKctHb
	4BoAWhj9KC6oVk5anX47OUadEYPGDSXxUHVZQlwCJW8kTRXCMGDwNZ6FJTSInRdk
	rScTAmdNqbrUiEAzmJ0RvcAXi73VqbNRa8CutDifua+o64MvHxgiSEAZkFb1cPMa
	GPkUdelow4XntU3W65ZI3wVoCHv+BaOJG0/wGw2poKJVb5BETX5DjEF/QlUvbOYu
	N7GKwxt/AdNM1GWFkvl26Aj4GoACEUzQqQwUScCCa4XVw1tWu9U0rN4C/9Rj2iHX
	lTrXBlT48Qu0HlcRUXuA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k2k7g7bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:33:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH6XiJD009240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:33:44 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 22:33:40 -0800
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
Subject: [PATCH v6 0/2] coresight: Add label sysfs node support
Date: Tue, 17 Dec 2024 14:33:22 +0800
Message-ID: <20241217063324.33781-1-quic_jinlmao@quicinc.com>
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
X-Proofpoint-ORIG-GUID: tIJ4xEuUFkUkHkryK8APbcatYO4Drgv6
X-Proofpoint-GUID: tIJ4xEuUFkUkHkryK8APbcatYO4Drgv6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412170052

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
2.17.1


