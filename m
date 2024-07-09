Return-Path: <linux-arm-msm+bounces-25668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD5A92BCEC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20EED282159
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7513715749F;
	Tue,  9 Jul 2024 14:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nHVm98GK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C486B18F2C4;
	Tue,  9 Jul 2024 14:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720535389; cv=none; b=X4wX+4AVuMVimBPEKUUA4l2nmk9T4FpG/QlDdVT0Pp71C9SlF7bJf0ObMRHXi3z7ofoAfWXZRxuQeWwp/zmHGOB6nKw+wOsWilTX6pkAhyxZM4OB24I6cb+IYUZYKT724IVoh5htRZTlIswX/U26ORRoZlUrLqwo7JshhmbFelw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720535389; c=relaxed/simple;
	bh=5BjyhZV02d2tbrvm7gqmnb4aGBKJXqRfEaZGN3mThCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=C3avqCxIl8lQAhKYuSi323O2Eo8JGpNojbd7EhtNRbdd6oAg/V0is9rsKmNcd+WsM2Js6Gk+Cp+hsrlnfazO8eyn9lPLjd3MKulHi3Eh+PWa2rrG38B8BGdZdHAebfmCU8OBDY39AylxAyfYBVBqBQlXFecFeL8iN0RHtW6uFnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nHVm98GK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469BL5N6001714;
	Tue, 9 Jul 2024 14:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+pmI3EKFnJzBVxlP2XqcGM
	q96RC6uy6/UN/4wJwTjPA=; b=nHVm98GK1q85deaYwBk70ypPzZ8mOxNAomiwKa
	i0hCJSJnhEvkc8Et++9dV5QSHDiAa8tnR1tyRoFkpzTp9/UrWoyCPwOaic3XW4fM
	Nb3XHAMAyE+Ca5rywcYEbuNJvsdhPxZaPB97fywQ1T7SOXXYIyP0g3+8B9sUjgL7
	eZBzT4t4B7CcY/FY8PvxcClQkBw/fRxVonq52x2Jic8Zj4xo5FFX8h46Q5PDiSwq
	kE4vNfUL1+wMvCptYXnsmQ1NulP6Jl5+rrc/80cMRET6e71aFPEeUSYNedpKnQGN
	PorODswow/E+M7nrwN4Uve+rLpRDhOMXgtnI9l4R92sK9SWw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406xa66mh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:29:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469ETgeo014085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:29:42 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:29:36 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 22:29:27 +0800
Subject: [PATCH v2] dt-bindings: firmware: qcom,scm: document SCM on
 QCS9100 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-document_qcs9100_scm_compatible-v2-1-d2e9d4860964@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEZJjWYC/zXNSwqDMBSF4a1Ixo3cxHdH3UeRYOONXqjxkSgt4
 t4bhQ6/Mzj/zhwuhI7do50tuJGj0QbIW8R039gOObXBTIJMoYCKt6NeB7RezdpVAkA5PSg9DlP
 j6fVGnqSIeWlMjkXGwsu0oKHPVXjWwT05Py7fK7iJc/1/JyCzMoNYikIClFzweSWtPNrONPZxg
 qyOQ4vVx3H8ACKw0pq7AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Robert
 Marko" <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720535376; l=2356;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=5BjyhZV02d2tbrvm7gqmnb4aGBKJXqRfEaZGN3mThCY=;
 b=PADXtHLc62FCE98GcHUm7OcGHfbH02/sYBZkOBJEyb9ak/36nsVI7zEn+EOCsAa9GHO8zQDaA
 ruKOW6+8gH5AOKMI7XNFI8FmiRzeDE3FLjWkDOLyPGaqv2PHdbjorwD
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WroU9uObZgOqpuR9iVdMctxS8YCQM7rH
X-Proofpoint-ORIG-GUID: WroU9uObZgOqpuR9iVdMctxS8YCQM7rH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090094

Document scm compatible for QCS9100 SoC.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,scm-qcs9100" to describe non-SCMI
based SCM.

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
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 2cc83771d8e7..3596ae0e0610 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -42,6 +42,7 @@ properties:
           - qcom,scm-msm8996
           - qcom,scm-msm8998
           - qcom,scm-qcm2290
+          - qcom,scm-qcs9100
           - qcom,scm-qdu1000
           - qcom,scm-sa8775p
           - qcom,scm-sc7180

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-document_qcs9100_scm_compatible-34ee68ff6e75

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


