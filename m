Return-Path: <linux-arm-msm+bounces-25912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBB992E064
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 08:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52616B216FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 06:57:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD0A12E1F9;
	Thu, 11 Jul 2024 06:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B8PtdSML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D56912C54A;
	Thu, 11 Jul 2024 06:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720681064; cv=none; b=N53WA4ZljcAOLtEKp1uNJTqywUlu7LaeIEiTQr8l1jlkZ4PDE0N1Tymcm18vxTTeC/aVaT4TencjByVEm/MTS4sCwjYJ57am5iOX1jTUxHSey8akKV6fiXUr7GwDO4PEalCpnEcuH6QpoSKgO7Tvsyzs//BGnq89moHNgaYv24A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720681064; c=relaxed/simple;
	bh=rvFokjMcH2Ex/2sqj6Lvfn5GGs0uXi19tWJfPrxNctY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Esif2zSRlRAehyDvCMe6uI8qJFqshjJ3PaoVZ3GuznOi74Mh3s9rXCWgT2NOaEXazyfcVkRheYLGqvqnDAzbTDQEHdQmsoQHtlGo0KUszbavL2JEY50kvRQbKlb2zGl5C47L+NKHMNO+PzWZ83ednYkzQPhePRRaH2El99aqNyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B8PtdSML; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46B4mjeQ014562;
	Thu, 11 Jul 2024 06:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jJQbWE0IuygwAYsyxFdL5S
	xbT/d7/I46uvXwI+FP9GA=; b=B8PtdSMLSpRyI1T7HVRy/jV5srooMnHRrIRqB7
	yuhTkppTtZGF7w/lr/OreXaT4FqNzD2kdHEhU5/aHeA2TyrK+Gtb2yybhTN4q9CW
	qusiVkm6wIU+ofFm59Qpv9LrXVPf856rPoEzXJas6kptUkYHqiZpdV6FifCNevXH
	SUfQ4eL2Fte7hWZbFjX+zQbakdH1hQNYeYuPaTWqwX9PHKczaIMe3RCpxXkUFRF/
	UJnqiO+2yVoSA/qJCKrTPkatlRJz4eG9Yl/X2u08GC5EpmZljzlDK6NaP9kIi8Sl
	I/Pvhymmwwj8I1AUsXBgvoi/tlJ+g4eYKR/9befh1ZrWYR+A==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 409kdtka78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 06:57:38 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46B6vbOS022133
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jul 2024 06:57:37 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 10 Jul 2024 23:57:32 -0700
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <quic_wcheng@quicinc.com>,
        <johan+linaro@kernel.org>, <quic_kriskura@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v0 1/2] dt-bindings: usb: qcom,dwc3: Add minItems for interrupt info
Date: Thu, 11 Jul 2024 12:26:14 +0530
Message-ID: <20240711065615.2720367-1-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dHsWOK36fNf4snaCrKKEbTTV3Dj2YW_C
X-Proofpoint-GUID: dHsWOK36fNf4snaCrKKEbTTV3Dj2YW_C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-11_03,2024-07-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 impostorscore=0 mlxlogscore=610 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407110046

IPQ5332 has only three interrupts. Update min items
accordingly for interrupt names to fix the following
dt_binding_check errors.

	interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short

Fixes: a5c7592366af ("dt-bindings: usb: qcom,dwc3: add SC8280XP binding")
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index efde47a5b145..283bac1efba9 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -432,8 +432,11 @@ allOf:
     then:
       properties:
         interrupts:
+          minItems: 3
           maxItems: 4
         interrupt-names:
+          minItems: 3
+          maxItems: 4
           items:
             - const: pwr_event
             - const: dp_hs_phy_irq
-- 
2.34.1


