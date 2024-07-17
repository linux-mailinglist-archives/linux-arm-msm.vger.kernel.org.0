Return-Path: <linux-arm-msm+bounces-26427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 765E3933A49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 11:49:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 201A81F22640
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 09:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53DBF17F365;
	Wed, 17 Jul 2024 09:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HGIijW84"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1A817E8F9;
	Wed, 17 Jul 2024 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721209768; cv=none; b=ZDEbcUAPSDNcIAAywWgT1nYUdKhFBghJ0xgD/wqP8FgmgKkg/ahhH3AaOzUi6uN510idzSSpKbzYIYBZ/eHkvuJes+Ieoz6eSXt0fiiRLWTLTlN8LjeRr0aEBAG/CiOi40lmWPW2+e77wzDbFeODx8uKCJzpj3q4/Fc/4mse4MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721209768; c=relaxed/simple;
	bh=26CUJ3fTo1PVxcLPtvOiRCqkB2bx1YYQ/UoSpcFrCNg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oYtnY6bcAmDaqJf7md+6G+l5+T8uWEUGrL1BGrqj6yKNexcwdK5v3GVQf/oIK5RNCW83WK4nX0q/dRcQVzGvhTLPDJapgfpzhmw+gKkAabsPx8Ie/jki7dS8+3N5O38Urf3xuJa6cWDsNL1zcPz0LH1HWSx04TR22Pdhqj+QUL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HGIijW84; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46H79vco029055;
	Wed, 17 Jul 2024 09:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5E9h2/RoTdgVUBIiWmCHLa
	lzQuAZA0+NEPCzWP40ZBE=; b=HGIijW84kKA5XcRZYA3adU9htYYBu95d/NtyX8
	Qd5JEA0XRCDV08sr5CCA4jd6wdG5EUqaR3ZnDBimQSAZt6h1SuS/brQfdW0NFNCV
	4FmMMBhFEP6TUd7aQzamKJET1dD586NqGgZrarEZK7+h76Htjbicn4yPC0yA6zK/
	tq5gYXcWS1w4yETgmSv4cM3GA0HGzYob58nUIw2lCe9SWze7bKLdz8+kpocgYVfy
	4KqNyIZ3cCV0JKU2hpxS6Ba1Zrl13HE+wzRXU2/x0nAEKgZtYf0k7Gi0T/M363Fi
	fplLJKCsPVIQhYJcmX7HuC6udQ+CbIpGbQiy+/BsIxL0h1lg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwj1hwcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 09:49:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46H9nAvw005358
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jul 2024 09:49:10 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 17 Jul 2024 02:49:06 -0700
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <quic_wcheng@quicinc.com>,
        <quic_kriskura@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v2 1/2] dt-bindings: usb: qcom,dwc3: Update ipq5332 interrupt info
Date: Wed, 17 Jul 2024 15:18:47 +0530
Message-ID: <20240717094848.3536239-1-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pZ7zxeHShegCEf0BTIljOtaSWOGPivB6
X-Proofpoint-ORIG-GUID: pZ7zxeHShegCEf0BTIljOtaSWOGPivB6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-17_06,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=815 phishscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407170075

IPQ5332 has only three interrupts. Update the constraints
to fix the following dt_binding_check errors.

	interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short

Fixes: 53c6d854be4e ("dt-bindings: usb: dwc3: Clean up hs_phy_irq in binding")
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
v2: Fix patch version numbering. Incorrectly marked the first version as v0
    Add interrupts and interrupt-names for ipq5332 instead of clubbing it with
    qcom,x1e80100-dwc3
---
 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 6c5f962bbcf9..5e5cc2175526 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -235,6 +235,13 @@ allOf:
             - const: core
             - const: sleep
             - const: mock_utmi
+        interrupts:
+          maxItems: 3
+        interrupt-names:
+          items:
+            - const: pwr_event
+            - const: dp_hs_phy_irq
+            - const: dm_hs_phy_irq
 
   - if:
       properties:
@@ -442,7 +449,6 @@ allOf:
         compatible:
           contains:
             enum:
-              - qcom,ipq5332-dwc3
               - qcom,x1e80100-dwc3
     then:
       properties:
-- 
2.34.1


