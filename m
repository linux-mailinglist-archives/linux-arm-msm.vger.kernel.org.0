Return-Path: <linux-arm-msm+bounces-1152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A77607F149F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 14:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EBE31F24709
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 13:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8331D1B279;
	Mon, 20 Nov 2023 13:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YSgOuz4Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8444131;
	Mon, 20 Nov 2023 05:48:33 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKDUSHS022083;
	Mon, 20 Nov 2023 13:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=x4YrQBxlgo74+8dfHQMB7xkk9dQGsKXRq+NiTEsXrhM=;
 b=YSgOuz4Yw2Rb6BFwtout3Zs8aFWUNKr/98DoIuaINNzi314BNABe+S1SIgRDDOCvwd5y
 xiD0t5M2jQGPcHBU2trC0/3nOrBhz+Efn/qw6jA7fIR18mxfp3ybof79MtrDfdjUmHtv
 DTy2cZmTiR+3bkStm/4C/J+IIp+66oa6LnXn98SaPK0I3OlCAvcTk7+YRuce6Wo2C8jq
 2mzPivzhf16IrKM5fK8jGHDRUV+qi8rAKgbVE89/1QXSp6Aq9Qucz7D+gwdMESkfOzbg
 TVH6jyYZAHWtI600RWT+AOyvsk5Xn9JAL7OS9VUBgwq7NfjOV1ikHhwKRatVtDo/fZn1 /g== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug30mgu6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 13:48:29 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKDmRrg020597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 13:48:27 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 20 Nov 2023 05:48:23 -0800
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Komal Bajaj <quic_kbajaj@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: arm: qcom: Add QCM6490 IDP and QCS6490 RB3Gen2 board
Date: Mon, 20 Nov 2023 19:17:52 +0530
Message-ID: <20231120134754.9526-2-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231120134754.9526-1-quic_kbajaj@quicinc.com>
References: <20231120134754.9526-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: z_FTwqJf7Ygd9E3NeFqJncMzQIbUQ1ny
X-Proofpoint-ORIG-GUID: z_FTwqJf7Ygd9E3NeFqJncMzQIbUQ1ny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_13,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=811 priorityscore=1501 lowpriorityscore=0
 spamscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200095

Document the qcom,qcm6490-idp and qcs6490-rb3gen2 boards.
qcm6490-idp based off qcm6490 SoC derived from sc7280 meant for
various form factor including IoT and qcs6490-rb3gen2 based off
qcs6490 SoC derivative of qcm6490 without internal modem.

Co-developed by: Naina Mehta <quic_nainmeht@quicinc.com>
Signed-off by: Naina Mehta <quic_nainmeht@quicinc.com>
Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 7f80f48a0954..d384182ce3cd 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -397,6 +397,8 @@ properties:
       - items:
           - enum:
               - fairphone,fp5
+              - qcom,qcm6490-idp
+              - qcom,qcs6490-rb3gen2
           - const: qcom,qcm6490

       - description: Qualcomm Technologies, Inc. Distributed Unit 1000 platform
--
2.42.0


