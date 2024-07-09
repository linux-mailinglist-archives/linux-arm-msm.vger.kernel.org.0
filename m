Return-Path: <linux-arm-msm+bounces-25679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 320E992BD67
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:48:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC4341F23FA5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 14:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72AD19D068;
	Tue,  9 Jul 2024 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ojQiPc0A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EF71E864;
	Tue,  9 Jul 2024 14:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720536504; cv=none; b=aktEq0IreOVapz9NzaAHVW171MLFxuiQfEELl4N/mqOl5xXg++Ki7bByrwiT54UdGvXpPtAEiQrtUgA5qvo3jbiB9/b5bR1QTX2Daf4d+LsjkCOCDrfkzTT//BbDZbyW+w8AcWb/93n+aJSTL1HNP3D65HryL1j9iY/VoDSYL+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720536504; c=relaxed/simple;
	bh=Gp6Ml9iH9+0KugxU5b0QRroNdx0uMCtC9bBGXPslBT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sJyhF55AX0BUTNDTc5IkxBHnaEvtVREMBBVZ77tKBqTGhl2fzE77nKl2xlMiTc3pRVC2dbrPbgfDPiS4S6tvDmrHyPpRa1AYlnP/qMFTu12gzt4C9Clz6hvfB9Pm9zKo40+LinmSQABxUs3c+54dh7+Vsie5czX+KNdF9VwebMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ojQiPc0A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469BjthX003930;
	Tue, 9 Jul 2024 14:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eCWsr2hCAxvkZjfu5Lagq6zlOeLfd+MnIhefbSsDv2s=; b=ojQiPc0AYMPbLoEi
	fN6gIWSCu4fXGtmIt4a3GXvh1GkExmFIVY+OEFSXhsR69u35pxLyZtunjMDVs747
	Q9tMByoOaIl4GbyRLsZde3ed33dxs0AS6nVibbGWiOLEHkqkBT3amh6MkmzylaSU
	8j+QgGzaqQvE5Qqzg2zQF+ILcOARwlo9n8ss6ryxGg7olxXHEXY4D5EbePRmlhUD
	chPBvoaIujAfBqGSGAGWiDnO1z+WIWJg9ph8gAgl9WUP4SuJkkjpmKOqI47XPQve
	R7gck44QjC84KMkXk2s5A4tw+COzAEmklA/+BHNjAqEw3kf6kEMEcCBG5uqqDbBZ
	3zBmkQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 408w0r9kt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 14:48:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469EmAml009764
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 14:48:10 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 07:48:05 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 22:47:54 +0800
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom,qmp: Add qcs9100 QMP PCIe
 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_pcie_phy_compatible-v2-1-c68f1e38560b@quicinc.com>
References: <20240709-add_qcs9100_pcie_phy_compatible-v2-0-c68f1e38560b@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_pcie_phy_compatible-v2-0-c68f1e38560b@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720536482; l=1575;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=Gp6Ml9iH9+0KugxU5b0QRroNdx0uMCtC9bBGXPslBT4=;
 b=tUZDe2jsbcobXq8ZHD/3dO+gSEkBsMl22ReV2tPVpP1nblTqZBD9+KiihcDWvyxqDg6xoT+ku
 jnlXqsoVCzNBoMSEL1ZHFx+ko/Zf+LxLA6MlSrZqdDvnF9qdMvensa1
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0sZTYijUSKp7jw7L0fnDucElPvpGFLMK
X-Proofpoint-GUID: 0sZTYijUSKp7jw7L0fnDucElPvpGFLMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=728
 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090096

Add devicetree YAML binding for Qualcomm QMP PCIe PHY for QCS9100
platform.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-qmp-gen4x2-pcie-phy" and
"qcom,qcs9100-qmp-gen4x4-pcie-phy" to describe non-SCMI based PCIe PHY.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 03dbd02cf9e7..d128ac8cb583 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -16,6 +16,8 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,qcs9100-qmp-gen4x2-pcie-phy
+      - qcom,qcs9100-qmp-gen4x4-pcie-phy
       - qcom,sa8775p-qmp-gen4x2-pcie-phy
       - qcom,sa8775p-qmp-gen4x4-pcie-phy
       - qcom,sc8180x-qmp-pcie-phy
@@ -181,6 +183,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs9100-qmp-gen4x2-pcie-phy
+              - qcom,qcs9100-qmp-gen4x4-pcie-phy
               - qcom,sa8775p-qmp-gen4x2-pcie-phy
               - qcom,sa8775p-qmp-gen4x4-pcie-phy
     then:

-- 
2.25.1


