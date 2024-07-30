Return-Path: <linux-arm-msm+bounces-27441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2CC9422C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 00:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 25BDF1F2348F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 22:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E62501917F3;
	Tue, 30 Jul 2024 22:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IRA0gCiV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA7C190489;
	Tue, 30 Jul 2024 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722378290; cv=none; b=WSJB92yfaNEhzlqvleEU2GCtW8j4GZTY/Hpsjs2uYxHMeGzXl6GaTuORuOycL8j2HzVhx4jOPh05qXpMOasAXwbtxPSqz4T9lnzsLksI43O+iwLGMxQxEnFxbhn8aNF8Wm3XOQlBv9pTyNCKACPpgf2G5bDsQMT39OV5nlJrJHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722378290; c=relaxed/simple;
	bh=UNSUU0OqDdWHYYuRPn8zkcIvKtJ5ereHihl6/sTlPh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=NBcDPtH3diL4e1Irbz64vxmTAOpw9/Pxf+8v9WPRNQOzPHs7gO+P0yKZcHFSS1dRtYM/DJ9YTQVjmPZ8jvINHVnnE+hH63hGRukqOEf2RWRaxIHGhu1Ra41ScouZJXifaX70LcrYBjO1VAHzGxJz3o7cLf9TZTAkIhFO9FiLeZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IRA0gCiV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UGCIG0029471;
	Tue, 30 Jul 2024 22:24:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=6gVL9PRTVMSB2IrXO0E/KtP4O6Mu4fe6eX+Tq1OGeJ4=; b=IR
	A0gCiVe6tmFBBLM/VmKAQTzWNHRmTYzVP8fVVq6JNGd558juKT55iDSlfp83yvxR
	xKx82ILcr3j/uJRtvfMBjHoh4mlUEX/Upv8kJt0eW97ymLkyujr2lVjUb3CoFgz+
	rG0U26EKdSOinMxBfLm3NdTAHV1f7UCymRYValxXCk7ygGP5iB8BVdyKrggkcx0/
	gA8i9ie8J6730WltevJzdFePV/h/9voVqPeLKCZDiUAJ9nAg5APrKBoS7cZlLyG0
	K43xQs0GOeu+rxT2WfvIE39wKa/71j2cHPw15jd8+3dayd2sUhHqAMcs+Mq/bP7r
	9YTR6HPMNRNQ09F7d78Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw442bm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 22:24:43 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTP id 46UMOg1G002457;
	Tue, 30 Jul 2024 22:24:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 40q4qs9w7p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 30 Jul 2024 22:24:42 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 46UMOf3p002449;
	Tue, 30 Jul 2024 22:24:41 GMT
Received: from hu-devc-lv-u18-c.qualcomm.com (hu-eserrao-lv.qualcomm.com [10.47.235.27])
	by NALASPPMTA05.qualcomm.com (PPS) with ESMTP id 46UMOf6E002445;
	Tue, 30 Jul 2024 22:24:41 +0000
Received: by hu-devc-lv-u18-c.qualcomm.com (Postfix, from userid 464172)
	id AB988500188; Tue, 30 Jul 2024 15:24:41 -0700 (PDT)
From: Elson Roy Serrao <quic_eserrao@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Roy Serrao <quic_eserrao@quicinc.com>
Subject: [PATCH 1/8] dt-bindings: soc: qcom: eud: Add phy related bindings
Date: Tue, 30 Jul 2024 15:24:32 -0700
Message-Id: <20240730222439.3469-2-quic_eserrao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240730222439.3469-1-quic_eserrao@quicinc.com>
References: <20240730222439.3469-1-quic_eserrao@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 27TQEd7jelb51tbnaoctfVZeQf5F33V4
X-Proofpoint-ORIG-GUID: 27TQEd7jelb51tbnaoctfVZeQf5F33V4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_18,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=961 clxscore=1011
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300154
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Embedded USB Debugger(EUD) being a High-Speed USB  hub needs
HS-Phy support for it's operation. Hence document phy bindings
to support this.

Signed-off-by: Elson Roy Serrao <quic_eserrao@quicinc.com>
---
 .../devicetree/bindings/soc/qcom/qcom,eud.yaml       | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index f2c5ec7e6437..fca5b608ec63 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -29,6 +29,14 @@ properties:
     description: EUD interrupt
     maxItems: 1
 
+  phys:
+    items:
+      - description: USB2/HS PHY needed for EUD functionality
+
+  phy-names:
+    items:
+      - const: usb2-phy
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
     description:
@@ -48,6 +56,8 @@ properties:
 required:
   - compatible
   - reg
+  - phys
+  - phy-names
   - ports
 
 additionalProperties: false
@@ -58,6 +68,8 @@ examples:
            compatible = "qcom,sc7280-eud", "qcom,eud";
            reg = <0x88e0000 0x2000>,
                  <0x88e2000 0x1000>;
+           phys = <&usb_2_hsphy>;
+           phy-names = "usb2-phy";
 
            ports {
                    #address-cells = <1>;
-- 
2.17.1


