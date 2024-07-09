Return-Path: <linux-arm-msm+bounces-25665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C85B392BCAE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4948A1F22153
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6AB2188CB7;
	Tue,  9 Jul 2024 14:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OhbneQZ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6177F15B980;
	Tue,  9 Jul 2024 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720534650; cv=none; b=SsujSP7mV3yduTa9E51DSebRoI34QZIZqUphduxBN5TFsZF8vVf8XJG0sAy9C2u8kzjBWxzLy4ZZLawqOxgSCdxNzC2KVSifV++oS28CKaVg6EwgTpz2zxxrZxeTaJdYLVDJLK7PmJ7bH7w05LLGib6hHJAG7r87UuSXd/06T88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720534650; c=relaxed/simple;
	bh=tjILeo76FHcfSaOIMoDBHiWlSrPwZ2Isv+c/sTP1zMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=GNCC2dliKu+X/ie5wxIbF6Wg7F34bP/x9kqO8bMfpuRSRO06z1WTbjy+dyL2RZ5nuvTWEAhSVSoJQPpfHl5oqcvjzNRn1KDk1k/gFwrjs1HYszzxo2+jcUhbMApo4jUNpJ1oEBte+ZHFDqXULPAw/qKZUFG+HqNrkNuStsNRBEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OhbneQZ+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469AIKD9016998;
	Tue, 9 Jul 2024 14:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lBOWCVqQmDJo0O/MI5XdKb
	EslB7uhsU2+0kvIMfOXfw=; b=OhbneQZ+PmEAqr8H3YxqdgIN0+afLh1K+VthAU
	q4Zhp7gBGNjiSvs+EgR/gt+SK33o4LGmUILkTB3zoQgQ8E2DDNOj33zbgC9HyGle
	8wbE8dHYf9Y2nTcRNi3nZjnl26UDBaIzagXmfqHO9Pz3JTJ4zm3qe0XhbE+S/ehf
	hpNl6bfTxJR7AKUyI5TF1NmKUEE0XtS8akS5uttN8b/oYQYkjc55H/ViTg+U+HcG
	IQvpBOQtNLNKjU0cEvVbgegvP2wAu3FY11RFJcs7Xh0xlTBEB69tyHTs2EPu3oke
	oWNsgv5evwH4x3sgXU+PbfP1qsBjGhiyrwCg5PQKPKpOwVaA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xa66kqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:17:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469EHO5B029487
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:17:24 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:17:19 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 22:17:09 +0800
Subject: [PATCH v2] dt-bindings: usb: dwc3: Add QCS9100 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-document_qcs9100_dwc3_compatible-v2-1-ed543ae02117@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAGRGjWYC/zXNQQ6CMBCF4auYri2ZFrHgynsY0tQywCTSAgXUE
 O5uIXH5vcX7VxZwJAzsdlrZiAsF8i5Cnk/MtsY1yKmKZhLkBRQUvPJ27tBNerChEAC6ettUW9/
 1ZqLnC7lRV6XSHEVqCxZv+hFr+hyJRxndUpj8+D2Ki9jX/3kKMsszSKRQEiDngg8zWT2ha2rj7
 jvI2SS2WLlt2w8o06YJvAAAAA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720534639; l=2902;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=tjILeo76FHcfSaOIMoDBHiWlSrPwZ2Isv+c/sTP1zMQ=;
 b=h8EJVfXo6dhkJHfLMfvOyyWtwE4y40GOuuB742DhRXomjmBJSdksplsEaa0P+/SrtlkxrHsOw
 jDq2dVxMR8IDt2Eh+lgLSptcer7/56I2KtKckz8wUWWlHtayBIVChvk
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OFGKl6FiqQLFYiosgGonJBRtvy6dyBvU
X-Proofpoint-ORIG-GUID: OFGKl6FiqQLFYiosgGonJBRtvy6dyBvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=617
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090092

Document the QCS9100 dwc3 compatible.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-dwc3" to describe non-SCMI
based DWC3.

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
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index efde47a5b145..07b0b6530b78 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -26,6 +26,7 @@ properties:
           - qcom,msm8998-dwc3
           - qcom,qcm2290-dwc3
           - qcom,qcs404-dwc3
+          - qcom,qcs9100-dwc3
           - qcom,qdu1000-dwc3
           - qcom,sa8775p-dwc3
           - qcom,sc7180-dwc3
@@ -199,6 +200,7 @@ allOf:
               - qcom,msm8953-dwc3
               - qcom,msm8996-dwc3
               - qcom,msm8998-dwc3
+              - qcom,qcs9100-dwc3
               - qcom,sa8775p-dwc3
               - qcom,sc7180-dwc3
               - qcom,sc7280-dwc3
@@ -448,6 +450,7 @@ allOf:
               - qcom,ipq4019-dwc3
               - qcom,ipq8064-dwc3
               - qcom,msm8994-dwc3
+              - qcom,qcs9100-dwc3
               - qcom,qdu1000-dwc3
               - qcom,sa8775p-dwc3
               - qcom,sc7180-dwc3

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-document_qcs9100_dwc3_compatible-a767738e13c9

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


