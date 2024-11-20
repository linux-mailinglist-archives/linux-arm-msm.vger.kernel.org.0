Return-Path: <linux-arm-msm+bounces-38440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AE59D37A6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 10:56:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BA54282D94
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 09:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AD771A0BC5;
	Wed, 20 Nov 2024 09:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="c/g3cPCO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8449919E7F8;
	Wed, 20 Nov 2024 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732096512; cv=none; b=HOQtmaO33+KUky3PNoWuuvtuaWP49jz40k7ZolRCadMItbn5hMJF9PB+R2wXgPBXN5zx/6VZTqsfzXpBPzy8VHLbc+KBAp8JK4UFgNv3HvgcM+lpAtelDpEObNUfBANC9rooSzw4eMF6KETAz0042pPE5N1S7D7/QHb8VESrXlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732096512; c=relaxed/simple;
	bh=WUeJIs0mFL7M8XzpJJUNbrJJinwwnmUal4RgzOn7Gcg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gsi/s6bAYe6kSjmQIe0KRKCi/DYq6GAkFvmDEqZE0+rF14+O5a7PbI63Zrqt2ZQXiG+tBY03CF2SByKlWCZ08VRA/9eTq92oiVPed/Fr7XJkQ3y+BDlzFdISCXuvwF7Wj2qew9MMwrc/jfmL6RqB86Upio0UoDcXwV/dsLbdBrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=c/g3cPCO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9GWGU025914;
	Wed, 20 Nov 2024 09:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	koD9v3V22NKdXuygUupV/Kh2VPj6I0Qdh4KVMM+3h78=; b=c/g3cPCO/aqp6TAv
	vvE9UeDWwqi+am7nOPXzxIuuK3RU/W4X32Zw2THqg0HaXpQagFck9oK3v9ulTFI4
	E3TOav1ZFNHSCiD4VrpNIrP5Vb7zcIuAUyTvDkjCfnEzBB03iJUNqIDo6FL4C4rT
	DfVhRQm6AhoxgZIFSnkoXZRHqAbMmdrIu4qV1JccRujshnPBo11a+lb2TIBiSRQt
	0XL1434tHOpY8R/qnTqu6mUJAvdh1IS1ZXa5agAVLx2BI7gPwUmzIAtIGspP2VSp
	+9kbUlCaEUy94vaNAWa84E9wNYmB3frka2YOYtdmPAXFRkormwTTnPQr3aAyN9fQ
	rJ2Fag==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431byjg92b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 09:55:05 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AK9t4s3018946
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 09:55:04 GMT
Received: from chejiang-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 01:55:00 -0800
From: Cheng Jiang <quic_chejiang@quicinc.com>
To: Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz
	<luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Balakrishna
 Godavarthi" <quic_bgodavar@quicinc.com>,
        Rocky Liao
	<quic_rjliao@quicinc.com>, <quic_zijuhu@quicinc.com>
CC: <linux-bluetooth@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_mohamull@quicinc.com>, <quic_chejiang@quicinc.com>
Subject: [PATCH v2 1/4] dt-bindings: bluetooth: add 'qcom,product-variant'
Date: Wed, 20 Nov 2024 17:54:25 +0800
Message-ID: <20241120095428.1122935-2-quic_chejiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
References: <20241120095428.1122935-1-quic_chejiang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 26dU5QNBVlge4OvrK2XWYIvyQxsOm8Hj
X-Proofpoint-ORIG-GUID: 26dU5QNBVlge4OvrK2XWYIvyQxsOm8Hj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200069

Several Qualcomm projects will use the same Bluetooth chip, each
focusing on different features. For instance, consumer projects
prioritize the A2DP SRC feature, while IoT projects focus on the A2DP
SINK feature, which may have more optimizations for coexistence when
acting as a SINK. Due to the patch size, it is not feasible to include
all features in a single firmware.

Therefore, the 'product-variant' devicetree property is used to provide
product information for the Bluetooth driver to load the appropriate
firmware.

If this property is not defined, the default firmware will be loaded,
ensuring there are no backward compatibility issues with older
devicetrees.

The product-variant defines like this:
  0 - 15 (16 bits) are product line specific definitions
  16 - 23 (8 bits) are for the product line.
  24 - 31 (8 bits) are reserved for future use, 0 currently

|---------------------------------------------------------------------|
|                       32 Bits                                       |
|---------------------------------------------------------------------|
|  31 - 24 (bits)   |    23 - 16 (bits)   | 15 - 0 (16 bits)          |
|---------------------------------------------------------------------|
|   Reserved        |    0: default       | 0: default                |
|                   |    1: CE            |                           |
|                   |    2: IoT           |                           |
|                   |    3: Auto          |                           |
|                   |    4: Reserved      |                           |
|---------------------------------------------------------------------|

Signed-off-by: Cheng Jiang <quic_chejiang@quicinc.com>
---
 .../bindings/net/bluetooth/qualcomm-bluetooth.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
index 7bb68311c609..9019fe7bcdc6 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml
@@ -110,6 +110,12 @@ properties:
     description:
       boot firmware is incorrectly passing the address in big-endian order
 
+  qcom,product-variant:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      specify the product information for driver to load the appropriate firmware
+
+
 required:
   - compatible
 
-- 
2.25.1


