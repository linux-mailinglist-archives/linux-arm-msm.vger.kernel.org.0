Return-Path: <linux-arm-msm+bounces-25660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A87A92BC65
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC5341F2181C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39975199E8C;
	Tue,  9 Jul 2024 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Npgnq2Hu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06E519939B;
	Tue,  9 Jul 2024 14:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720533735; cv=none; b=plhHpi4HPGQPOmS3VsBAHy4zsbkNT6xb93tOWIEsJIvW4VxVNDOntLONmCxWg7OPV7LE2Gp8qCk4Ge7Maf08Z0/eXn7ftJS3l1oT0CKdJPt/hDX6H17i3qa0RAYk43Ww7YYbr5zOtZoWYy38jSa95ykgRtDs0juF2kxmBQpx7LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720533735; c=relaxed/simple;
	bh=3fSj0y2jXQbuWqt4S1+LIvS+/ArVG4NLKrkB7yI352w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=SNVkow7GQPh77ThWKyFHWD8zPYd8USMVRAB1S8vlj2e9Lkn4yXKGtNOyOhg7rv4L+T6MNQtW6PvfyoTmhcRw3m1VwT0O5ZIjAF65wo7ySKR7nPmd3bGXaZyAqDO+KqnvwaS1yMONG2DWQt4tvM/J+vVz1cyUxVSZNiRqenI2+ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Npgnq2Hu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469AaFwN003666;
	Tue, 9 Jul 2024 14:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hfbVdoM187pV4i/DYrKvdF
	915mLLy9E4bOKezzFXXWM=; b=Npgnq2Hum34AeBUHztwyQAN0oAfRUN3IQq5KDg
	iTDmS7bOPbal1X16hWknqgSZTKVGrNpc8Pbva3wS1AErd45TZ2GoFjNNPpKu8yt9
	RAS16GUoKf2NiFm9HnTA9IqyIZ+A7rYOwxSMTm4ZgUmcbFMCDpIuiRYAHhncFqmq
	AdnE44Ln0YOeUMmDsNKdMwmhTrRBO2f5B5qLKMOl61WQfimoVzU49vLnHVpzanTR
	NWPyxwYwSpe3oJbvOeMzJotP2TUmkiTpvTK3KYSpxyL392OTfNyRS+M2zMnB+7BH
	MSb78MGBQoeidqL5agCpMmuUa0jA++4KYkB6YtjiLYyOT/ZA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wgwpkn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:02:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469E27tN014470
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:02:07 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:02:01 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 22:01:47 +0800
Subject: [PATCH v2] dt-bindings: mailbox: qcom-ipcc: Document the QCS9100
 IPCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-document_qcs9100_ipcc_compatible-v2-1-0fd67000e6b1@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAMtCjWYC/zWNwQqDMBAFf0VybmSNFU1P/Y8iwa6JLrSJJlFax
 H9vFHqcx2NmY0F70oHdso15vVIgZxOIS8Zw7OygOfWJmQBxhRok7x0ub22jmjHIAkDRhKjQvac
 u0vOluamMLMs+3WXDkmby2tDnTDzaxCOF6Pz3LK7Fsf7lJYiqqSAXRS0AGl7weSFUUdvBdPZ+A
 FnMU4u1+77/AKBmAky8AAAA
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jassi Brar
	<jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720533721; l=2354;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=3fSj0y2jXQbuWqt4S1+LIvS+/ArVG4NLKrkB7yI352w=;
 b=w5Alz2E3vARVhA3DHBqIML2C4xPSsIwf2QU6ZvuwXwfy3L1ScztY2PwW2mcyJ6od/TJs0aXC2
 4vbkX2tiWM0BH+ObiW1/52CL/WI7BDN8gpxBnBis8kCM5HGFVcXbOoE
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: M7drvkJ3Qa8xJ2sog4wsg-6CkPjWmoNe
X-Proofpoint-ORIG-GUID: M7drvkJ3Qa8xJ2sog4wsg-6CkPjWmoNe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=760 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090090

Document the Inter-Processor Communication Controller on the QCS9100
Platform.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-ipcc" to describe non-SCMI
based IPCC.

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
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index 05e4e1d51713..916c47fbc238 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -24,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,qcs9100-ipcc
           - qcom,qdu1000-ipcc
           - qcom,sa8775p-ipcc
           - qcom,sc7280-ipcc

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-document_qcs9100_ipcc_compatible-f5f933d24098

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


