Return-Path: <linux-arm-msm+bounces-25628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F5E392B9DD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 331A11C21E4D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 12:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC57E15B10D;
	Tue,  9 Jul 2024 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j/Sed078"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4D815ADB2;
	Tue,  9 Jul 2024 12:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720529205; cv=none; b=TqEYy3FXgifDBfJpxRPqlcWoq8C5eKSS6BRs92zMqu1iF6POsx6HYk2dsS1x8y0zUxKKC6by2LpZOgiwyVTOH7L0GQEoEYNeVYES8uRl5Jic8DyqhycESmxxiPzK7VjeVrxUFr2kO9H5iB1d/daY8ZOzJSbPlK0qHTM5p0NqEYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720529205; c=relaxed/simple;
	bh=JGyPpjmrhsfqcLhBLrd1A38OzaoCKd0tq/wkHGWp57M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=J3/ECn+RjwobtQAlObR2iPb3YV3nzKwNseBWMNVrdxsgcgSvi+V2s2P5fkH81qc0SQWqmsbh8TBw5cA6Fo4h2Xxq4Z+L43UwV3+jZt18AgDeH4HmTgz0JOC44Ch4WrmPNJ7qtmx2ZTTtYprE88tryRfz1DEbtXshiOgdr0JjRIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j/Sed078; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469C1Sb8016208;
	Tue, 9 Jul 2024 12:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B75fg+7MGETPksCZcZVLPi
	Vl5b+K7TaIT1sCh9FBYPo=; b=j/Sed078igS0+u1pqnRyuB5mDS3DIIw/kDhzd7
	LFU42yDurpcDzc3YIdxWBQkr3s6Qh4EJmdFO/mCs5F/znWfzGq7nNwxlVtY/0Ijk
	F7Kqfd3yDjbp2UGS7HoITcej+KhQlmnJyRspKgMyTqaOR4UNRNENXioOWdPfgnsX
	Qx/17uIj8IdddjZAE7SeVuLNUH0HV4Ad4tE0321IXJpatZgCHb6eDv7Ciz1vSbac
	yaCa9DFEL8IZGPx4Y8HnnYHVs6hhu3LcaDKt+uQBQG7tVvpmMzgb56iZJYgPGzgV
	MmRnqIGQteOekh2CGggFF3Bp1gmus/QP7fMAiF3V1y9hA59A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406x516kn9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 12:46:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469CkdZg011255
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 12:46:39 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 05:46:33 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 20:46:19 +0800
Subject: [PATCH v2] dt-bindings: phy: qcom,usb-snps-femto-v2: Add bindings
 for QCS9100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-document_qcs9100_usb_hs_phy_compatible-v2-1-c84fbbafa9d6@quicinc.com>
X-B4-Tracking: v=1; b=H4sIABoxjWYC/5WOQQ6CMBBFr2K6tmQ6UAVX3sOYhpZRJtGCFIiEc
 HcLiQuXLt9fvPdnEahjCuK0m0VHIwdufATc74SrS38nyVVkgYAZHKGQVeOGJ/nevFwoFIAZgjV
 1MG09Gdc827Jn+yCZ29QWzh50mpOIsrajG7+30OUauebQN920dUdc128iBdS5hgTVEQFyqeRrY
 Gd68vdb6c8rsHdJbK3ef3+NGIUOldapzgpU8CO8LsvyAWCRRdETAQAA
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720529193; l=2460;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=JGyPpjmrhsfqcLhBLrd1A38OzaoCKd0tq/wkHGWp57M=;
 b=7qjR3zuvGxwujGiBpy2UQ1NPZVX7GQG+Feb3Fouh9sZrsQTIjt6N3VxUam51jyDohkno6Tz1W
 6U3fwqwUCgXAzYFMYWPK/k0qIBw112eh02MYkYC587FWTaDVnbCA2Gy
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1RErOJMKbgO4QvJLX4zq1LZ7NA1vRNMu
X-Proofpoint-ORIG-GUID: 1RErOJMKbgO4QvJLX4zq1LZ7NA1vRNMu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_02,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=837 mlxscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090081

Document the compatible string for USB phy found in Qualcomm QCS9100
SoC.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-usb-hs-phy" to describe
non-SCMI based USB phy.

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
 Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
index 519c2b403f66..cd0a723590f0 100644
--- a/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,usb-snps-femto-v2.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,qcs9100-usb-hs-phy
               - qcom,sa8775p-usb-hs-phy
               - qcom,sc8280xp-usb-hs-phy
           - const: qcom,usb-snps-hs-5nm-phy

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240709-document_qcs9100_usb_hs_phy_compatible-8b3b9cb6538e

Best regards,
-- 
Tengfei Fan <quic_tengfan@quicinc.com>


