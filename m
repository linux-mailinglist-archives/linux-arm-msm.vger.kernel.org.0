Return-Path: <linux-arm-msm+bounces-26875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB07E939E7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 12:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 163BF1C21F8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 10:03:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 832AF14EC5C;
	Tue, 23 Jul 2024 10:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R78yOoFL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0251814EC4B;
	Tue, 23 Jul 2024 10:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721728987; cv=none; b=UpXpgMNgqOamyUD8GMP5HgRtpOvglUzQ3eBckGJ4KAPEr5HgLenE0waTJpzojqcmftKjFeCTlGWHD47yUdfZXT3KaACvNAHuTz5uB7RniXTsRDvrKj0NPvOFvQEefvoHOfWP0uR1ilppqRv/pjRl7WAnu8l85u57sGChYVuipBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721728987; c=relaxed/simple;
	bh=8aEESmh8yyioBGwoYSmfZ5mGPwbwo2nOyDT9OGAYJ3Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ekErvYQS6KSyZ9mnChuNrPWw0PiPdzq3MReDhaZ19l7/enY2+cg5vykakHXt8XlwXenmjQ9Wv8bpVyVkgc1ttQcsjWgdGLbfr8WhpN4CkLAwRe62jqJnRWR7uyiMDnspwFMF+ghaaxBHHeTv8bh0ZiZIAeKYYZnEjtDCtjmdO1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R78yOoFL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MNLuYc019103;
	Tue, 23 Jul 2024 10:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oE1sk5AM2lHjrbDaI7we89e4+IxxZ91Mg19JYEJLcvw=; b=R78yOoFL9P1G4V52
	wYq6yf29MMfUSyqLtfBGPZ5F5rOy6BAo5Dj04u91vzmLqdJgNY5WsYgGXi5wOTuC
	K8nlCI00+qx78NdjkU2n/W2ExRySlFSDmtjG55ZwefgfSU6sNNIRnut2oycF01+4
	TAg7NptTUZmftAF0pTK/xM4Qj4wQBYXDTxKZgczrfWuc3OjNN6rTmIBkUJaNEhwP
	ehtUjTK2IkJAkUxG+HbdN6iGLD6ZZ5CRJHxh1k/PN9SVdvJpY7a66bow4FCzbOY3
	U1y5dy7oWVrT6UMWisl9YSAtODNKkzQSGdf16amU3GSflqKF4D+m3pLmLORLHR1p
	jImRsQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g4jgxc64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 10:03:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46NA307I012140
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 23 Jul 2024 10:03:00 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 23 Jul 2024 03:02:56 -0700
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <gregkh@linuxfoundation.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <quic_wcheng@quicinc.com>,
        <quic_kriskura@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v3 1/2] dt-bindings: usb: qcom,dwc3: Update ipq5332 interrupt info
Date: Tue, 23 Jul 2024 15:31:50 +0530
Message-ID: <20240723100151.402300-2-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723100151.402300-1-quic_varada@quicinc.com>
References: <20240723100151.402300-1-quic_varada@quicinc.com>
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
X-Proofpoint-ORIG-GUID: MK8D4MpYHapAcBzwGcEsdjRtz1X29PgU
X-Proofpoint-GUID: MK8D4MpYHapAcBzwGcEsdjRtz1X29PgU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_18,2024-07-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 mlxlogscore=662
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407230074

IPQ5332 has only three interrupts. Update the constraints
to fix the following dt_binding_check errors.

	interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short

Fixes: 53c6d854be4e ("dt-bindings: usb: dwc3: Clean up hs_phy_irq in binding")
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
v3: In the previous version, the hunk got mixed up while rebasing.
    Fix that

v2: Fix patch version numbering. Incorrectly marked the first version as v0
    Add interrupts and interrupt-names for ipq5332 instead of clubbing it with
    qcom,x1e80100-dwc3
---
 .../devicetree/bindings/usb/qcom,dwc3.yaml        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
index 6c5f962bbcf9..b07d4acc4289 100644
--- a/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
@@ -443,6 +443,21 @@ allOf:
           contains:
             enum:
               - qcom,ipq5332-dwc3
+    then:
+      properties:
+        interrupts:
+          maxItems: 3
+        interrupt-names:
+          items:
+            - const: pwr_event
+            - const: dp_hs_phy_irq
+            - const: dm_hs_phy_irq
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
               - qcom,x1e80100-dwc3
     then:
       properties:
-- 
2.34.1


