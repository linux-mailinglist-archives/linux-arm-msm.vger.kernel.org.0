Return-Path: <linux-arm-msm+bounces-25661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CEC92BC78
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 020F01C20398
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F05198831;
	Tue,  9 Jul 2024 14:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UGY5H2Yj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7BC154BF0;
	Tue,  9 Jul 2024 14:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720533974; cv=none; b=HLuFtytdd0LijKPgbFkv+jlzbJtUbQxUTwgxSXtdurAM3NpYmU4w69TX0RiCRFywoO34d/VHH7keKBYxpWpOrUdRAizxdxsDuXhcF6S02XTLubS5oWpHQR4WHq8pWIqMYHrTvacMj/cMTzTa6vB8m1QE4vjvTW5UpXiDPO6TWv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720533974; c=relaxed/simple;
	bh=bsQMMNGvSWxwbenIZOgEAoW7NZqDNT6e1zhBpq/+Kp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=LOqESKhMr/cDbVvMsvebXtMVG91VugPqn1LosNkLllylG8CNRfi59cIUKz8NG9INtWMM43sBgVoQIWHTxo9c3gHPSXphpQ80zL+HzOebWGu8IuJuCsrU0Lij3Ucb1nkUFdSvl4TCyltjYCsc4qXKKXMXLnRXLp038MxNpkzG/ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UGY5H2Yj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469BDMFS012016;
	Tue, 9 Jul 2024 14:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KVAwLXJ6GLQTtRpPDFWqce
	I8vVCrPRzOmPqggpRbT/U=; b=UGY5H2YjmC90OJq+PTd4bPPPUL2ckP+69EtuCr
	YUngS+ITu1LRNdqseKrCv97NmiIyD5A+IEq1Rrb1Nofzz4MYhEudws3HCEvp0pJG
	bWcXkLzAjewTnMrihjWTWPsLNcxg6bbmrjILoXMsu/8lQ+XIJvFRYLphTz3gYHmK
	QGrA2NTJ9cnaOsaNlh71k0UjZ52/2YQN3XxyNc5rP6b4v5YIrApxvmyUzKTgBkAD
	zwKW7m/MwVJvNSWzxuwHdvad9ZwdLASFYH38eIc1DffHfJe4hmMxPTwWOemiQhBF
	tveSA7b8rocH+CyTfkm5UgoJ4ZWpFQurlTHuZPYhk2PJRCqg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wgwpm17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:06:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469E69vt018942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:06:09 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:06:04 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 22:05:52 +0800
Subject: [PATCH v2] dt-bindings: soc: qcom: add qcom,qcs9100-imem
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-document_qcs9100_imem_compatible-v2-1-de2a8712d788@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAL9DjWYC/zXNQQqDMBCF4auUrBuZREXtqvcoEjQZdaBJ1Ki0i
 HdvFLr83uL9Ows4Ewb2uO1sxo0CeRch7zemh8b1yMlEMwkygwIqbrxeLbpFTTpUAkCRRau0t2O
 zUPtGbjIwbVZUUKbI4s04Y0efK/GqowcKi5+/V3ET5/o/T0HmZQ6JFIUEKLng00paLej6rnHPE
 +R0ElusPo7jB7PvfOq8AAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Tengfei Fan
	<quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720533964; l=2356;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=bsQMMNGvSWxwbenIZOgEAoW7NZqDNT6e1zhBpq/+Kp8=;
 b=5nL3h0xENbIU4xwuwRne3Hhj3wfhPqJvh5RnDxtMv/qvJ0pGF96c1MhrP5l+0zl5u3sxSM29l
 hMmkwswuKtNC3+HXuVXuXZOoeHft33ZB5XRv3u54wK5tIl0Oezog10V
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KSWDwWKgvrulGkqBKFkREKUreMFGRBpc
X-Proofpoint-ORIG-GUID: KSWDwWKgvrulGkqBKFkREKUreMFGRBpc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=865 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090091

Add qcom,qcs9100-imem compatible name support.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-imem" to describe non-SCMI
based imem.

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
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index faef3d6e0a94..e45337a21232 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,qcs404-imem
+          - qcom,qcs9100-imem
           - qcom,qdu1000-imem
           - qcom,sa8775p-imem
           - qcom,sc7180-imem

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-document_qcs9100_imem_compatible-d40db479083e

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


