Return-Path: <linux-arm-msm+bounces-25153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE55926034
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 14:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31253283A13
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:24:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4F817625B;
	Wed,  3 Jul 2024 12:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nSWoPaq6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8AC85298;
	Wed,  3 Jul 2024 12:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720009449; cv=none; b=G+ipQYFjWu8TM0NLDmCjI1gnLHN1podl2gGQYO9HJ0qp/x6DeNc2L3eS4l2zimnMX24CL/wsFv7nQo1jvb8WnfpjvzUuePBNNbYgHXM8Ru61Q+DtQy2RbuA+0mKsnIp+lqZEPW5O9p62dwidzVSwfXGiibjbWxycnJgKLH1X1to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720009449; c=relaxed/simple;
	bh=1/8i7wVHAZjipRxLeMo6uNdTLOGoWe9clEghtFGvLg8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t5kHE/pUdhoK5YxNmI/A5LGxLw/ctfLgFU2vVAnON0fzgUjqPJscekqgxGgcOi6ToNVXwUkHe4gYrez6c5tvvboIjwxJvAIEboj4/bboI3+4NMqBSkHaQkrIJzpaMKxAP1rShjFH1d17gt6UD1mt4vXRk4DlI2Wyau5eQUujQR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nSWoPaq6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4635J12h023274;
	Wed, 3 Jul 2024 12:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=F3XF1sezdc/oiQITX1PAeF
	9EGD8pO5m8W3s5qu3Kanw=; b=nSWoPaq6tnAjOg+f7Us7lKqPG9K0TC/1NXkGzZ
	fkugoBNCHTGNLAbDJ7NeFECwF81oequn1CBJJYRjASP4DCknEF7/YRcf0BkGC8JJ
	R81w2fhtFiD15AwJDg+H6sWbOmDDvuU3T1lk6uETz5ysnEmYnoSS6bhozVi5d6GF
	gLzETVHsrlylRcdbShBFFM0nBGcKZ83cbphBqkI58D0pmwI/gQQQnx+yYGcJ0H+G
	6r8NUD/RXWoy/sUOWZ2HNy5MbcW4ixbAyNTVjiD4pHr/Cz5JUSGuMOciFw5JSpXF
	u8xpbrwZ8Yxsc3L2uGspYER9MGwgALwMzPz4JJPKNBYD53Fg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4050cy90ub-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 12:23:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 463CNsLH014157
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jul 2024 12:23:54 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 3 Jul 2024 05:23:54 -0700
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
        <linux-arm-msm@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        songchai <quic_songchai@quicinc.com>,
        Jie Gan
	<quic_jiegan@quicinc.com>
Subject: [PATCH v4 0/2] coresight: core: Add device name support
Date: Wed, 3 Jul 2024 05:23:36 -0700
Message-ID: <20240703122340.26864-1-quic_jinlmao@quicinc.com>
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
X-Proofpoint-GUID: kghyHclw4VYBb65rxkDt2pjlyOhSlax9
X-Proofpoint-ORIG-GUID: kghyHclw4VYBb65rxkDt2pjlyOhSlax9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-03_08,2024-07-03_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 mlxscore=0 impostorscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407030090

With current design, the name of the non-cpu bounded coresight
component is the device type with the number. And with 'ls' command
we can get the register address of the component. But from these
information, we can't know what the HW or system the component belongs
to. Add device-name in DT to support it.

cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1
tpdm0 -> ../../../devices/platform/soc@0/10b0d000.tpdm/tpdm0
tpdm1 -> ../../../devices/platform/soc@0/10c28000.tpdm/tpdm1
tpdm2 -> ../../../devices/platform/soc@0/10c29000.tpdm/tpdm2

Change since V3:
1. Change device-name to arm,cs-dev-name.
2. Add arm,cs-dev-name to only CTI and sources' dt-binding.

Change since V2:
1. Fix the error in coresight core.
drivers/hwtracing/coresight/coresight-core.c:1775:7: error: assigning to 'char *' from 'const char *' discards qualifiers

2. Fix the warning when run dtbinding check.
Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml: device-name: missing type definition

Change since V1:
1. Change coresight-name to device name.
2. Add the device-name in coresight dt bindings.


Mao Jinlong (2):
  coresight: core: Add device name support
  dt-bindings: arm: Add device-name in the coresight components

 .../bindings/arm/arm,coresight-catu.yaml      |  6 +++
 .../bindings/arm/arm,coresight-cpu-debug.yaml |  6 +++
 .../bindings/arm/arm,coresight-cti.yaml       |  6 +++
 .../arm/arm,coresight-dummy-sink.yaml         |  6 +++
 .../arm/arm,coresight-dummy-source.yaml       |  6 +++
 .../arm/arm,coresight-dynamic-funnel.yaml     |  6 +++
 .../arm/arm,coresight-dynamic-replicator.yaml |  6 +++
 .../bindings/arm/arm,coresight-etb10.yaml     |  6 +++
 .../bindings/arm/arm,coresight-etm.yaml       |  6 +++
 .../arm/arm,coresight-static-funnel.yaml      |  6 +++
 .../arm/arm,coresight-static-replicator.yaml  |  6 +++
 .../bindings/arm/arm,coresight-stm.yaml       |  6 +++
 .../bindings/arm/arm,coresight-tmc.yaml       |  6 +++
 .../bindings/arm/arm,coresight-tpiu.yaml      |  6 +++
 .../bindings/arm/qcom,coresight-tpda.yaml     |  6 +++
 .../bindings/arm/qcom,coresight-tpdm.yaml     |  6 +++
 drivers/hwtracing/coresight/coresight-core.c  | 37 ++++++++++---------
 .../hwtracing/coresight/coresight-platform.c  | 31 ++++++++++++++++
 include/linux/coresight.h                     |  3 +-
 19 files changed, 149 insertions(+), 18 deletions(-)

Mao Jinlong (2):
  dt-bindings: arm: Add device-name in the coresight components
  coresight: core: Add device name support

 .../bindings/arm/arm,coresight-cti.yaml       |  6 +++
 .../arm/arm,coresight-dummy-source.yaml       |  6 +++
 .../bindings/arm/arm,coresight-stm.yaml       |  6 +++
 .../bindings/arm/qcom,coresight-tpdm.yaml     |  6 +++
 drivers/hwtracing/coresight/coresight-core.c  | 37 ++++++++++---------
 .../hwtracing/coresight/coresight-platform.c  | 30 +++++++++++++++
 include/linux/coresight.h                     |  3 +-
 7 files changed, 76 insertions(+), 18 deletions(-)

-- 
2.41.0


