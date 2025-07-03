Return-Path: <linux-arm-msm+bounces-63534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16565AF74F5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 15:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BF131C82E61
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 13:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4954528B516;
	Thu,  3 Jul 2025 13:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BEPjVVzG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E592AF19;
	Thu,  3 Jul 2025 13:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751547932; cv=none; b=jMACQYpKwFgSoBjmrpAWKjnPthhJN7SHy3Ig4kFp/5wVns+YXRurlumchom4EFg/+vKpv9ViiyKCiSOxSD2It0V8jOZSkVBoWRC5yqxknbZW2AtBzqc/Fu7xDkTnH/BPTjHGLsiyi3mXFhoAJvBuNRIKFknH7PUUGW4MiI4MV+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751547932; c=relaxed/simple;
	bh=sm3m+p6kC3+00ejw98SpOUZjuVAOus0moJ9LDsSFris=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WLZt3ai33kAsoJPz8V2ZrEZ0dCuJttvt1jTANAfJJ3gN4bKDrHjGSjRRHQdGTIKja1oq2uG5a5Bl1pQX1d9NVKjTg7KDBRw6WiAXQ1+8J+xDT4yzQRuB5GcvwcNs+EHg87O7oXcTDe7PVSpQ6ikzHL+jH1WpZRCwbIncaUqaU7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BEPjVVzG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563CxU8R022911;
	Thu, 3 Jul 2025 13:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=yZXE37DVoxiXxny10g4j6TmPnRi4VrKuMBShdSrCbIo=; b=BE
	PjVVzGAibofbtMKs+bP5oKZURF9V5i0L05Dq+BvheVrfeAKmevbig0jRFLs8Z66M
	DuqqPFXJqacCRj2lJVvGfAphia4B9knp9C+DmnwPhxK00wZRAe9nQt+fu27FQjC9
	3Spm20w1NexHJE7ps/u1ElLQuXm9i9Pj+6tcicgmwcEYo5LUrRQGiw0JpYdzBr8D
	c6y7ivve0uIAzDb6elZx6rKMk9cspypRf+smZWUaB3Z8aJT53yjW9YxX7NAY8aHy
	nDyNgsva8geo+I1hWP+Wb+qN13nVTcO5S1qCOsVgi3aFfZlE3esZauGWcctEZMoy
	g98XuBqNcqGZnPvDuSpw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mhxn77hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 13:05:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563D5DwC014391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 13:05:13 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 06:05:09 -0700
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
Subject: [PATCH v8 0/2] coresight: Add label sysfs node support
Date: Thu, 3 Jul 2025 21:04:51 +0800
Message-ID: <20250703130453.4265-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDExMCBTYWx0ZWRfX1U+HfRhzbHIA
 3sbfWc71VoOW2b7fN/Exd84W5kQUfgo8/+kMhE6JmGcWWuH1w5QIWQRe2aocMNhLRUoa+SxtHuh
 5Ty9wZl+2VHkQBdg0L1cCIo0AjZ1DAxoWA28wu5SK8LNXff8cAxVgd6RPCSYa80ILnbqZLyC0lE
 HzyuSOTFy2pI7/jh+FFo7PlfadO04Vkj/SkaYj8uvvmfD1P0hnOvqtLxS51L3Vvd5kibHZxSpSz
 /LyWrAEnzdPBVA6WkpBzERT+OrI0ejCvW4ua8/NT6PtOraFYkr7vE2qV7+2QGVP0MjiyT9q542R
 ilERgGNkpBRfYn8VndftXuzu7ilHCJfq88i4IOKcBEU0/5HF8VeAMtLn1oQdGORUq3tJoC3+1Sp
 tBMcRVsEi6TE3RC2uj7qpCuiPuDu1SibOTQ4ZAXu+WWfTktH1MeBLoFYL//KQZsrK0v0KwfZ
X-Authority-Analysis: v=2.4 cv=EbvIQOmC c=1 sm=1 tr=0 ts=68668010 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=3Jbm9Zxj_fdaoH2CIgQA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: hlxxP5mOk5OJ1bvOh0o7duiDq9Ddq3xv
X-Proofpoint-GUID: hlxxP5mOk5OJ1bvOh0o7duiDq9Ddq3xv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030110

Change since V7:
1. Update the conflict when apply to coresight next.
2. Update the Date and version in ABI file.
V7 link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250226121926.2687497-3-quic_jinlmao@quicinc.com/

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


