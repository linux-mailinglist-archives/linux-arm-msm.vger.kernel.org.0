Return-Path: <linux-arm-msm+bounces-31491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 535F2975081
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:11:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11ED51F2307E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 11:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7BF185B74;
	Wed, 11 Sep 2024 11:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RePk/WTU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7597C48CDD;
	Wed, 11 Sep 2024 11:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726053079; cv=none; b=GLjeX9QUG4kAvr6je4fT837wuGs0qWLM3RB7XimGVCgFOF0AI+0fD4/ellMKJzpQFKjYJZCEy9O3Nv5X0CG/eo9SyVwYD4pjNBLdDlJaWO9e34LqYU49zhDXOc2Z8GRFq3Xokqf7v89h9issNzUz9gQDgVaWdPsTCWsSrGZqS+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726053079; c=relaxed/simple;
	bh=J0gev3CYKRztCisnV506oU4MaW4EbCTK6q8A47W8BUA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=qB3vdMyE8Vjm2tfEqAwh1cNiYxVLve1lmW3zRbRf/LMDy0Md/0jQXyc+YX6QrioYKFjXyZUJ6NsI3q3yyKJgQbQsoNjLR4GpOjms2FyyR0O7gpomtjINY2XSKXjoVqpDJE88VffNrpyg2XaSll/xnI+qaAMpTAm2RNIGACHovis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RePk/WTU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48B3sQ2f000751;
	Wed, 11 Sep 2024 11:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=b1YT7DCV9sq4+ABCae2mH7
	YH6JeNm2pa2lC8q3O5VOU=; b=RePk/WTUDdZACNblcYsNSObcrV0R/fWDeVMP6c
	U40rzh39Z874GiUhNVMDXbsCAoHBSKmQMdUjvMaRM+htIVpKglp9xqGwIB5R0G4l
	ZpFYKNwOFidQJIltej9DTsohkvLMDri9njcQoO8+lmU0gOnoIoTfgFAARCjZP4cj
	C6Y68eN3LqPXnG0x+hbsm8COLemrPhsVq5kYX1Ej5Nap/rr/NDuPmSwbp2PwcxzH
	JSjhxa75F5I9pZyX7zu6go/DEW/LkT/7w6NOSluPaRw7ZIpcSMc3n8ZJZiiFmX8U
	/TxoVEEonknoE033c/BzipLpHeUEVgnK9SaRvW7PmZ21mdww==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5197sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 11:11:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48BBBBdC017523
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Sep 2024 11:11:11 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 04:11:06 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Subject: [PATCH v2 0/4] arm64: dts: qcom: Add support for the QCS9100 SoC
 and board
Date: Wed, 11 Sep 2024 19:10:54 +0800
Message-ID: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL964WYC/1WNwQ6CMBBEf8Xs2ZrdWhU8+R+GEOgW2YMUWiAaw
 r9b8eTxTWbeLBBdEBfhulsguFmi+C6B3u/AtlX3cEo4MWjUBnMiVTGXg405IZZx6nsfRsV1rTV
 zVpvLCdKyD66R12a9F4lbiaMP7+1kpm/682V4/vd5WwqrmRQqNEypQc0RzW2YxEpnD9Y/oVjX9
 QNsKwXltwAAAA==
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726053065; l=1348;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=J0gev3CYKRztCisnV506oU4MaW4EbCTK6q8A47W8BUA=;
 b=610Iy+LSY3UYrA4NE1luZjxIA6PdGwpzr710izynEwMm8PwyUTyUKKCOJ42mNYwxpV3LWAOcq
 qmErOV/QyPqBOtmSKAg6DDUPZHGXpPCDOCddOgaP4llbsb0gQmItX06
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6bpOXd7TsM0HxjzUWR0tLIAhvbFPpqQ_
X-Proofpoint-GUID: 6bpOXd7TsM0HxjzUWR0tLIAhvbFPpqQ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=733 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1011 phishscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409110083

Add QCS9100 SoC ID and board device trees support.
QCS9100 is a variant of SA8775p, and they are fully compatible with each
other.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
Changes in v2:
- Add SoC binding for add QCS9100 Ride and QCS9100 Ride Rev3
- Update SoC binding patch commit message
- Add QCS9100 Ride and Ride Rev3 board device tree patches
- Link to v1: https://lore.kernel.org/r/20240806-add_qcs9100_soc_id-v1-0-04d14081f304@quicinc.com

---
Tengfei Fan (4):
      dt-bindings: arm: qcom,ids: add SoC ID for QCS9100
      soc: qcom: socinfo: add QCS9100 ID
      dt-bindings: arm: qcom: Document qcs9100-ride and qcs9100-ride Rev3
      arm64: dts: qcom: qcs9100: Add support for the QCS9100 Ride and Ride Rev3 boards

 Documentation/devicetree/bindings/arm/qcom.yaml |  8 ++++++++
 arch/arm64/boot/dts/qcom/Makefile               |  2 ++
 arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts    | 11 +++++++++++
 arch/arm64/boot/dts/qcom/qcs9100-ride.dts       | 11 +++++++++++
 drivers/soc/qcom/socinfo.c                      |  1 +
 include/dt-bindings/arm/qcom,ids.h              |  1 +
 6 files changed, 34 insertions(+)
---
base-commit: 6708132e80a2ced620bde9b9c36e426183544a23
change-id: 20240911-add_qcs9100_support-dbb22dd8b475

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


