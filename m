Return-Path: <linux-arm-msm+bounces-33319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 53AE1992446
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 08:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1591A280DA3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 06:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 676A6163A97;
	Mon,  7 Oct 2024 06:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MybazCiV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A30158D93;
	Mon,  7 Oct 2024 06:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728281465; cv=none; b=qCQrXblZbCCZ68Jy+Z1+/6rN0ht++ndJTQ/E74a4fxRjzfTk/bPDhgN273+ikgWrLRDNTm2JzKgMN9x7Jnm9iAu3mEQYcTsZkQLbvxOVAYkH1RI9wUTe25VoEbscIa4o1toK49cAmRm2zhXpPc/vSYc9pKYtL7sTC8VRlCqJhI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728281465; c=relaxed/simple;
	bh=htqhP1GZ6Zx3qp3QygmX09vIZg3CEizRBd1IGFecMaE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NmF2l7nzPSTd+riK40HcNjqJh+F8+tFFKDS4Ns6CUgWx8BrTdTWJ3p9C6yIWo6i+Zgkc1TbVGQnySW7DU42Cjhzr8PDS6IxoXBp41NEzfHp7vH9NmdgDWFEVHHTQFQizxmidzy2h0M1PFzWsPtm+eRxfXBrqusa5iYgynUBD7CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MybazCiV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974SpSk019629;
	Mon, 7 Oct 2024 06:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tA6jcOHnq57p/t4iqww3OmqaZTdwxA3Ub0lz9Z7ShII=; b=MybazCiV4JgQeKMd
	XIy/HHU32A42kxdTgYU2DPgHP5g82r0HIwcrbShg/bV7r2CrysFFTSn6htmCVqcp
	mkhP5I8GX0ofzCooYKoNVl22hZmgBul3RXTomhRZ5XL/XOtoPvvpGk2Rn1h2w0G/
	j6qTP6tC+YR4T8sYxUCGFK9EsGXARbQAURmgCNw3AlctJMv+rHD/UPsCzd6nQBIz
	DhNEMpXHzh+eeaAQz64I1NBJVGWBzQdprxLRTrVqntv50Cl2gaa3KQNN8tvzDwLV
	Y1dkzzXDY5kJsXJ0UR4Ufrh5IbmWJT8H917IvMFHye+wqaJ7A6mNcDRfW+z+VcXi
	gdMTeQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xsnk5mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 06:10:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4976Aqc4029352
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 06:10:52 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 6 Oct 2024 23:10:47 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <quic_sibis@quicinc.com>, <conor+dt@kernel.org>,
        <arm-scmi@vger.kernel.org>
Subject: [PATCH V4 2/5] firmware: arm_scmi: Add QCOM Generic Vendor Protocol documentation
Date: Mon, 7 Oct 2024 11:40:20 +0530
Message-ID: <20241007061023.1978380-3-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007061023.1978380-1-quic_sibis@quicinc.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nsa8l8YV22eDjLFTeYetAcr4d9TvlTOc
X-Proofpoint-ORIG-GUID: nsa8l8YV22eDjLFTeYetAcr4d9TvlTOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070041

Add QCOM System Control Management Interface (SCMI) Generic Vendor
Extensions Protocol documentation.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 .../arm_scmi/vendors/qcom/qcom_generic.rst    | 210 ++++++++++++++++++
 1 file changed, 210 insertions(+)
 create mode 100644 drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst

diff --git a/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
new file mode 100644
index 000000000000..1ee6dabaac23
--- /dev/null
+++ b/drivers/firmware/arm_scmi/vendors/qcom/qcom_generic.rst
@@ -0,0 +1,210 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: <isonum.txt>
+
+===============================================================================
+QCOM System Control and Management Interface(SCMI) Vendor Protocols Extension
+===============================================================================
+
+:Copyright: |copy| 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+
+:Author: Sibi Sankar <quic_sibis@quicinc.com>
+
+SCMI_GENERIC: System Control and Management Interface QCOM Generic Vendor Protocol
+==================================================================================
+
+This protocol is intended as a generic way of exposing a number of Qualcomm
+SoC specific features through a mixture of pre-determined algorithm string and
+param_id pairs hosted on the SCMI controller. It implements an interface compliant
+with the Arm SCMI Specification with additional vendor specific commands as
+detailed below.
+
+Commands:
+_________
+
+PROTOCOL_VERSION
+~~~~~~~~~~~~~~~~
+
+message_id: 0x0
+protocol_id: 0x80
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++---------------+--------------------------------------------------------------+
+|Name           |Description                                                   |
++---------------+--------------------------------------------------------------+
+|int32 status   |See ARM SCMI Specification for status code definitions.       |
++---------------+--------------------------------------------------------------+
+|uint32 version |For this revision of the specification, this value must be    |
+|               |0x10000.                                                      |
++---------------+--------------------------------------------------------------+
+
+PROTOCOL_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x1
+protocol_id: 0x80
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |See ARM SCMI Specification for status code definitions.    |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |Bits[8] Set to 1.                                          |
+|                  |Bits[0] Set to 1.                                          |
++------------------+-----------------------------------------------------------+
+
+PROTOCOL_MESSAGE_ATTRIBUTES
+~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x2
+protocol_id: 0x80
+
++---------------+--------------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |See ARM SCMI Specification for status code definitions.    |
++------------------+-----------------------------------------------------------+
+|uint32 attributes |For all message id's the parameter has a value of 0.       |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_SET_PARAM
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x10
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string    |
+|                  |and is used to set various parameters supported by it.     |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload for the specified param_id and       |
+|                  |algorithm string pair.                                     |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
+|                  |by the chosen algorithm string.                            |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
+|                  |matches.                                                   |
+|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
+|                  |is rejected by the algorithm string.                       |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_GET_PARAM
+~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x11
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string.   |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload and store of value for the specified |
+|                  |param_id and algorithm string pair.                        |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the param_id and buf[] is parsed successfully  |
+|                  |by the chosen algorithm string and the result is copied    |
+|                  |into buf[].                                                |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
+|                  |matches.                                                   |
+|                  |INVALID_PARAMETERS: if the param_id and the buf[] passed   |
+|                  |is rejected by the algorithm string.                       |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_START_ACTIVITY
+~~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x12
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string    |
+|                  |and is generally used to start the activity performed by   |
+|                  |the algorithm string.                                      |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload for the specified param_id and       |
+|                  |algorithm string pair.                                     |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the activity performed by the algorithm string |
+|                  |starts successfully.                                       |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any.  |
+|                  |matches or if the activity is already running.             |
++------------------+-----------------------------------------------------------+
+
+QCOM_SCMI_STOP_ACTIVITY
+~~~~~~~~~~~~~~~~~~~~~~~
+
+message_id: 0x13
+protocol_id: 0x80
+
++------------------+-----------------------------------------------------------+
+|Parameters                                                                    |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|uint32 ext_id     |Reserved, must be zero.                                    |
++------------------+-----------------------------------------------------------+
+|uint32 algo_low   |Lower 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 algo_high  |Upper 32-bit value of the algorithm string.                |
++------------------+-----------------------------------------------------------+
+|uint32 param_id   |Serves as the token message id for the algorithm string    |
+|                  |and is generally used to stop the activity performed by    |
+|                  |the algorithm string.                                      |
++------------------+-----------------------------------------------------------+
+|uint32 buf[]      |Serves as the payload for the specified param_id and       |
+|                  |algorithm string pair.                                     |
++------------------+-----------------------------------------------------------+
+|Return values                                                                 |
++------------------+-----------------------------------------------------------+
+|Name              |Description                                                |
++------------------+-----------------------------------------------------------+
+|int32 status      |SUCCESS: if the activity performed by the algorithm string |
+|                  |stops successfully.                                        |
+|                  |NOT_SUPPORTED: if the algorithm string does not have any   |
+|                  |matches or if the activity isn't running.                  |
++------------------+-----------------------------------------------------------+
-- 
2.34.1


