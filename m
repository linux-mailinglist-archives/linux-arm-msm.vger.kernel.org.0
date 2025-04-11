Return-Path: <linux-arm-msm+bounces-53959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B4CA8571A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 10:58:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FF464A16DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 08:58:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E15296162;
	Fri, 11 Apr 2025 08:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OncjWFiW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B26915D5B6;
	Fri, 11 Apr 2025 08:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744361917; cv=none; b=RL9PuFpYIKDZBhn76RklvxD2cnmdaSST/Qf2K86eDqlb9ttp5tYUsj7VTKEkezti1Xs6ypqGgyLoBhmjFI+AeS3zlIlkyO+r+YNp/fhkEzMq1SvUUits4spbfy6AX8zNhhRa6QqQf5FNLQgAUbrkxPKuDPq96HCU5PrRkxhcxOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744361917; c=relaxed/simple;
	bh=8tyCaTWug517PKAYLddHpfQRQdW6eTM6uBSoFYSVyTg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=nW4P2MnGeqhBlfElj3XuahVA9byPkZUZ4No2tq4cTYWR/A9/R5JDuWY/31KG1wPmJTVSnmu4Ca+gm1TGbmhIxlZxtnt2xw6nNvIw678IXvH5/HQGIrP6Oj3AY/DEmHJwtNuPr1qGVAHXWQk66tb1CHXB6Gll9XImbuZCQVPfh2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OncjWFiW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5cqW1030704;
	Fri, 11 Apr 2025 08:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QMGKGJwnUU/BmYAEVJZo86
	5KM3L5x0YXjOOHMWjz33U=; b=OncjWFiWiubIEU+8GkUHXOc/KAYThqHVCF+9mD
	HGLBkGZVvx7vO0IikgivCZ2uKekgulKgcbg/h8ImIc0XB4bhMSNmJB0cb9n8/ywZ
	ZuX8Dw8YzQs6vDameB29gXgh4C6VkZ3W0smUZ0g+XCN4RjBL//VzHHhM32xxtI75
	oqaZZ9QwwxGZdND+UaJnfGDcLE4Am6CI7tLOO0BPMXGa3Hp66SEhuzIBNxWwAzOD
	r2CLQ5ez4rcRjjtQ4KQ8y5H7VGLyQRMYBYBHHxtLsmOBluyou/OAbHUoYTN9AvIH
	iowWdKum0Vjdn343se9dhh883zgO14rZ8gEm/cwZsfV6gO2g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftskpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 08:58:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53B8wNkg016304
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 08:58:23 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Apr 2025 01:58:19 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH v3 0/2] coresight: Add Coresight Trace Network On Chip
 driver
Date: Fri, 11 Apr 2025 16:57:51 +0800
Message-ID: <20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI/Z+GcC/3XOQW7DIBAF0KtErEuFYYBxV71HlQUMTMOidotTK
 1XkuxdbXbiysvyjeV//LqZcS57Ey+kuap7LVMahBfN0EnQJw3uWJbUstNJWgTLyWgNlOYwkGTW
 6aNoVs2j/nzVzuW1db+eWL2W6jvVnq5679SrAOTAKexkRk4Q+kYxZWekjqxh1xwj+9eu7UBnom
 cYPsfbMZrN/C/xuwWykkhZiz0mHFLg/WnhoodkeHQQmAz7i0dqH1jZrPHvTEUOO+Wjd3uLeunW
 zduS6oJVn998uy/ILwAg4qZQBAAA=
X-Change-ID: 20250403-trace-noc-f8286b30408e
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
CC: <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744361899; l=1455;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=8tyCaTWug517PKAYLddHpfQRQdW6eTM6uBSoFYSVyTg=;
 b=Ugfqgzz58f49RGI4dYnAu4OU83/PzhqWVbGbCSLwq49PT1Sw3NlnkJYYH/dY0y0+CWWe+RF37
 2AAG57SfehJBn6enizDVj5fxvyk5IjDkXTFc1U/6lna9txQwXo3j45g
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f8d9b0 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=wQFbxXTkjMarF-hqfQ4A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cudZtBDQHd0apwwr1n8jfbI_NXhgY2CN
X-Proofpoint-ORIG-GUID: cudZtBDQHd0apwwr1n8jfbI_NXhgY2CN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110049

The Trace Network On Chip (TNOC) is an integration hierarchy which is a
hardware component that integrates the functionalities of TPDA and
funnels. It collects trace form subsystems and transfers to coresight
sink.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
Changes in v3:
- Remove unnecessary sysfs nodes.
- update commit messages.
- Use 'writel' instead of 'write_relaxed' when writing to the register for the last time.
- Add trace_id ops.
- Link to v2: https://lore.kernel.org/r/20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com

Changes in v2:
- Modified the format of DT binging file.
- Fix compile warnings.
- Link to v1: https://lore.kernel.org/r/46643089-b88d-49dc-be05-7bf0bb21f847@quicinc.com

---
Yuanfang Zhang (2):
      dt-bindings: arm: Add device Trace Network On Chip definition
      coresight: add coresight Trace Network On Chip driver

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 111 ++++++++++++
 drivers/hwtracing/coresight/Kconfig                |  13 ++
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 186 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.h       |  34 ++++
 5 files changed, 345 insertions(+)
---
base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
change-id: 20250403-trace-noc-f8286b30408e

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


