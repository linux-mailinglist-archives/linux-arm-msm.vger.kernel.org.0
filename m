Return-Path: <linux-arm-msm+bounces-25667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A8C92BCD4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDA461F22415
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADA7F18FC6E;
	Tue,  9 Jul 2024 14:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OAgDNPGh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C8017B425;
	Tue,  9 Jul 2024 14:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720535111; cv=none; b=RuS/9qix9s+2KxY3K5PJ1okZBZMfopIStW5Zh4kToPhJX21gdPJKCofUPrTh9RDg1T3GrlJ8n0eKy9JHCISk7ApEjz68XfkVoO7L76DQqRlu22W+Bc0d7bbRgVAzbWAs6Oc/y3XXbTOOUQCXPwz63zSHO//fB9NwwekepYWVJgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720535111; c=relaxed/simple;
	bh=rTVreeQeeUehrzS18D5D4yWwP0iHYjdMpTwvSeZlFSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=keP4d5fCLII+7xJkxDcwezuxSGqrFNTsCxjuvAm1JtEgm3koP94z1Ul3xSsEEor4vxCedhuMcEm6lz/nNCM6zRTzrmR6QV+qsmCUfhIIPiQu5CP0XdWDyBvexRGBzj8McwDbT15q4+6d0ujHJ/aW6Rco9QuvkpZpR3RRIWUGU84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OAgDNPGh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469BC6qa008024;
	Tue, 9 Jul 2024 14:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4B5NeufGiHXUSU6+BPK+St
	lGv3+aN4n4S9qxonIxJvU=; b=OAgDNPGh+JwetCVpy+I8i/JcQBmM2SsHNWX3AA
	7UDLrhD4RVHptSMqy5Pb+/Ep7r2edz9L1HIUFFmtIaF96t0UKHSchWbiZx1ADjDC
	bvRmUC7zdDaCXJEMus5A5VuXDH2/m4fgIhpLcAmss1T1aWD8YUvMxGMgdSC2P9bY
	kZN3cogffgXyFINAFJSFM7GsE27IJTVkdK7vKoXaf/sCN6T1upMQfQSWbbFcJwQb
	Vd78FtYq6p6Ww8hp+Ku4VoV+hIvhQA2kJmXs+X4Zz9tFvrVJrTT5DPSPbr/+GFx2
	yI9UfCyGdq4+53phsP2KdkPV0qGEEuzC0gobbx6IgygaauPg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406we8xk83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:25:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469EP4va011882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:25:04 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:24:59 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 22:24:49 +0800
Subject: [PATCH v2] dt-bindings: soc: qcom,aoss-qmp: Document the QCS9100
 AOSS channel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-document_qcs9100_aoss_qmp_compatible-v2-1-6c7f35bc9ec3@quicinc.com>
X-B4-Tracking: v=1; b=H4sIADFIjWYC/zXNQQ6DIBCF4as0rIsZsIp21Xs0hlAcdZIKKmraG
 O9eNOnyf4v3bSzgRBjY/bKxCVcK5F0Meb0w2xnXIqc6NpMgb6Cg5LW3S49u1qMNpQDQxoegx37
 Q1veDmen1Rm5UqvJclmhyy+LVMGFDn5N5VrE7CrOfvqe6imP9AynIrMggkUJJgIILPi5k9Yyub
 Yx7HEHOJtFi1b7vPwVBk6PAAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720535099; l=2402;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=rTVreeQeeUehrzS18D5D4yWwP0iHYjdMpTwvSeZlFSU=;
 b=0d1I8qXPr9zZfrPXTkSD1Gd7931U+HDJOlQa9tuDne465ZXXhbhU8sfJA9y0vBrb8Nmbtgj0u
 7wZyMbVwbs2DsqARgLA5Axe6SAjT7ZkKFtmyuWYutJIbrEna04264Ci
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zi7J8I_QDlNN7-oSQZHY8e8ts0apC4FJ
X-Proofpoint-GUID: zi7J8I_QDlNN7-oSQZHY8e8ts0apC4FJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407090093

Document the Always-On Subsystem side channel on the QCS9100 Platform.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-aoss-qmp" to describe
non-SCMI based AOSS channel.

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
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 7afdb60edb22..80e1a8b43586 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -25,6 +25,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs9100-aoss-qmp
           - qcom,qdu1000-aoss-qmp
           - qcom,sa8775p-aoss-qmp
           - qcom,sc7180-aoss-qmp

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-document_qcs9100_aoss_qmp_compatible-a7376629ea6c

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


