Return-Path: <linux-arm-msm+bounces-25658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A1992BC40
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:58:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1FCD1F23484
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 13:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16AF818C352;
	Tue,  9 Jul 2024 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MWJNPbo/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9570E1850A2;
	Tue,  9 Jul 2024 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720533442; cv=none; b=qWHgOJ20lR+W/Nu4MQD8xeyTsRcMUwe6Pqcy8WlIFSXCTND830PJ7cAT9mSEFyZdRbi5S8Bn7LJVzPxzDmSdfQuwjXZyLEMh9PqehoJYW3OdWkkrGOl6Atb1iI0TmCshsaRh5VIzdxXjefZDEdx3XUpxwUu3LD4WK3mj71d/uwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720533442; c=relaxed/simple;
	bh=HEr0HPxjelqJ3oX82GEVZTV5xdIMPqGPD+jcTVomdDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=B9hGEmNGHzgqKigw6yBDudxH+dVxqlkN5H4ay8CfMSVYWeI5JE4QBrqlATwdeGQIYcAMezM9KKhdhs5NuNYaKYpig4dwrOcKWI0rt6sxgC/fZ0AAIXhvSvE7nMjXe0/MSXi6cRFv7mLXSkkfAWPDzGJkpg9Q8CfhQeft6jKgc6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MWJNPbo/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469Bm52g015976;
	Tue, 9 Jul 2024 13:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pSoKKJd+KGOwGbP1EvBI7g
	R5LzyKw21ySidDByFY1eI=; b=MWJNPbo/1M6ihvrCOQlFu7uT6uCL6joPdH8l1Y
	/83W4SvabTPz+xMY8HinRdFawXEi3YAxdzg9hTJtGOliXfT3G2O7PGChTAUdqPwy
	Q85lVfrs1g3smu7KQnf7q6nKyklXLQTiG72QzuhQiWQ/45+GhSF3WrtSa+UOfC5h
	rFmPC6rbMEn95sPbVO4F/ii141pp70ZYHSBymw4VWA1a1h/Y3yuh7Xt4Y/iEJ9Oe
	3MnrrgQ5bvgdJEVrctS416roBZxVdRY56L9H/3HlJwTKmkZ42mncWxE0l0LCqyzY
	zmBvEuZp1KaIXONNPGyOvFgVl8qTtb6FwzSdg/fsCXAsrZGg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406y3hebn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 13:57:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469Dv6eL008307
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 13:57:06 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 06:57:01 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 21:56:45 +0800
Subject: [PATCH v2] dt-bindings: interrupt-controller: qcom,pdc: document
 pdc on QCS9100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-document_qcs9100_pdc_compatible-v2-1-83619dcd2658@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJ1BjWYC/zWNWwqDMBQFtyL5buQm9dmv7qOIaLzqhZpoEqVF3
 Huj0M85cGZ25tASOvaIdmZxI0dGB5C3iKmx0QNy6gIzCTKBHEreGbVOqH29KFcKgHruVK3MNDe
 e2jfyLMUEsqwVuSxYsMwWe/pchVcVeCTnjf1ewU2c6999B5kWKcQyXAEKLviykqo96qFv9PME0
 ioOLVYdx/EDjQQdWbsAAAA=
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720533420; l=2372;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=HEr0HPxjelqJ3oX82GEVZTV5xdIMPqGPD+jcTVomdDY=;
 b=sZX0BRLqszm6V6A4pIeEj+L+LBXW9bIwgkLDp81HJiUBSXTCSUAzV2tYVgVnZIegsz4ANovZc
 +DmrWB1Cj4GBolw6iPzR3Py0BTOPNkLCFpfAGdLeZBayyt6c+2J7pe9
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9wpC2PsmCgA261EYisKVb3HL2jBcoBie
X-Proofpoint-GUID: 9wpC2PsmCgA261EYisKVb3HL2jBcoBie
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=835 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090090

The QCS9100 SoC includes a PDC, document it.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-pdc" to describe non-SCMI
based pdc.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
Introduce support for the QCS9100 SoC device tree (DTSI) and the
QCS9100 RIDE board DTS. The QCS9100 is a variant of the SA8775p.
While the QCS9100 platform is still in the early design stage, the
QCS9100 RIDE board is identical to the SA8775p RIDE board, except it
mounts the QCS9100 SoC instead of the SA8775p SoC.

The QCS9100 SoC DTSI is directly renamed from the SA8775p SoC DTSI, and
all the compatible strings will be updated from "SA8775p" to "QCS9100".
The QCS9100 device tree patches will be pushed after all the device tree
bindings and device driver patches are reviewed.

The final dtsi will like:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-3-quic_tengfan@quicinc.com/

The detailed cover letter reference:
https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
---
Changes in v2:
  - Split huge patch series into different patch series according to
    subsytems
  - Update patch commit message

prevous disscussion here:
[1] v1: https://lore.kernel.org/linux-arm-msm/20240703025850.2172008-1-quic_tengfan@quicinc.com/
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index 985fa10abb99..41fbfce838fa 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -26,6 +26,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs9100-pdc
           - qcom,qdu1000-pdc
           - qcom,sa8775p-pdc
           - qcom,sc7180-pdc

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-document_qcs9100_pdc_compatible-65e4066b1728

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


