Return-Path: <linux-arm-msm+bounces-37127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3719BE32B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 10:53:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB7C01C219DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 09:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61531DDC33;
	Wed,  6 Nov 2024 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zotktv2S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E751DDC1F;
	Wed,  6 Nov 2024 09:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730886766; cv=none; b=VOSkffZtgXdcLYCDebORVBCd5ATYrYqH4LC0Yx+Isd7quUhcLB6lrIsO9R0g1sL/TRlAFKx2GZcjZDjrXtv8MymLLmVOa3XFWkQiNoiPW5WtwtJGX9QQgmlsF+/te1PgLN5RtxDjI7RKaOq8I/EfzBLd81Odk7d3M+ThguTjTd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730886766; c=relaxed/simple;
	bh=w0jcu+0al0v6yz1e9PwzwCWYv6ZNaZ+vHjWxxxynKuo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=J1vr51DUiKnmtBVNV7+N9vQp+gZ1VBQ/wkU2/vTuNvKhs9ZQxW1TVUhJ96uPAm4941W9kCXS3w6KCcLzEFNQk56L++cdm1RWLJ3d2LAMv/GAsSlciqE0PwjOr7zKjTi8TXCgSONPX9c10t63AynV1nhNawT4r0c8b/2noN74Ve8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zotktv2S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A69Ms1X015777;
	Wed, 6 Nov 2024 09:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sd66SbPdNT5lpYSh0xB7eKYxuFrxFR9NQWNLrPWKV9U=; b=Zotktv2SdZt4tNet
	4x2QWhaYrfEZoS85tzY2RYg2/jg3nGXLD5B2xuJ/dcBc5NINRNQxH8iAgvxZTM/I
	0BwDIvE64gesLMhnknUdtwi1LirXXMi+XIvN+/G5eakr0QRPETdnxKwXafiQYfz+
	/GhF5TGrvxG3wwPK/pWokoRLy1O7rtB6eECBcl9N3F/h4YgAqGwSdg+OSF1muKbH
	V3SRG2kFOrkyi5aaJdtW2ntmxwukGLHWOVlLdnKlJ7lO9pYn+pMZgwv9WA9p7mo5
	Sw1koMbPXWrkZT3Jg8E+b34C6oIPXX3CENiJsdcPzSCRdmfPPK+KCn2zFh/hfCMW
	0c/ZdQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42q5n8n5dm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 09:52:41 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A69qePV030777
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 09:52:41 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 6 Nov 2024 01:52:36 -0800
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Wed, 6 Nov 2024 15:22:00 +0530
Subject: [PATCH v3 5/6] dt-bindings: clock: qcom: Add QCS8300 video clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241106-qcs8300-mm-patches-v3-5-f611a8f87f15@quicinc.com>
References: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
In-Reply-To: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XTHKgeNjRQdX8a19As8r6qeG3XePaUYm
X-Proofpoint-ORIG-GUID: XTHKgeNjRQdX8a19As8r6qeG3XePaUYm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060080

The QCS8300 video clock controller is mostly identical to SA8775P, but
QCS8300 has minor difference. Hence, reuse the SA8775P videocc bindings
for QCS8300 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
index 928131bff4c1..07e5d811d816 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
@@ -18,6 +18,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,qcs8300-videocc
       - qcom,sa8775p-videocc
 
   clocks:

-- 
2.25.1


