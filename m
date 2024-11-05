Return-Path: <linux-arm-msm+bounces-37040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE0F9BCA59
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 11:23:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FFB81C227CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 10:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFDCA1D2B2A;
	Tue,  5 Nov 2024 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UuqVasVf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B741D27AD;
	Tue,  5 Nov 2024 10:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730802170; cv=none; b=sYwj7kKuWpNdLEg9KJyAkxUjB544t2Erv3WQ7EO40HyeS4Gw0NQnO8IekgktSdYY9kSSICzSpixi4GxY7/esEdOr14e48boBca+8dcw0dN7z9U2BNrbUotO/jcG4rogt5lle7uxY3jdcd81aIzWid3SdyqkxLxto36Kwa2rKvnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730802170; c=relaxed/simple;
	bh=ajLTnWap11hSowj5013aFC1Fy6aMYyofhLuaY6gPxZw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kPxeOJXUE3GMKwBusTRIt+rTkcyIrgwq7fhgRTFU69q5tUykQtQ6jKLI61D2mQbp/4uwFVHXil9VkEsMv1KB0OECRgNrraR3iOrH2V/iQf2/IvkR5qOWPy1mb5pEuJiHf8qYEz/pEImdorgwKj2mW1RR9FkpfrM/almJTVtoBlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UuqVasVf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A57ug2l003803;
	Tue, 5 Nov 2024 10:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kck3P5Bet2uVWgnfBXq4aXViMO74GqXyxo1CK95Zd6U=; b=UuqVasVfHE5gwRkr
	6Y64AlNhR9md7IC2aM/w1IMdla9Vr22AbgqQp71T+KYfRtI7mgPMUyrelSIodYhX
	jWUGaHTX4xWlt6LXemG7OBGVYCDGulCTnVkPwCEd+Nt8sYmOpJJAU6HKlZ44KGaH
	RSPDepfqgLnmrHA2DNBVOapw/PUZbsTXRlHpBNwDIun47mPzRh1Ql8balwdqFa+Y
	neiAUddDymjcFHNiEhT1Zav3btG0YBCt8DtS2c335Wzibz3mATlbqHs8SbpgbgbM
	IsaWqKgJspIkl0E4zBjZMIqzIBH1LH+P8K/emONpAFarGS1lLCnOpz8vv+RGBqei
	54A8ag==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qfdx0d16-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 10:22:46 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5AMjwC016701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 10:22:46 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 02:22:42 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <conor@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v2 1/3] dt-bindings: cache: qcom,llcc: Add IPQ5424 compatible
Date: Tue, 5 Nov 2024 15:52:08 +0530
Message-ID: <20241105102210.510025-2-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105102210.510025-1-quic_varada@quicinc.com>
References: <20241105102210.510025-1-quic_varada@quicinc.com>
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
X-Proofpoint-GUID: ctg8REFnlIcaA8U9mFBw8MH58vaXT7Mf
X-Proofpoint-ORIG-GUID: ctg8REFnlIcaA8U9mFBw8MH58vaXT7Mf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050078

Document the Last Level Cache Controller on IPQ5424. The
'broadcast' register space is present only in chipsets that have
multiple instances of LLCC IP. Since IPQ5424 has only one
instance, both the LLCC and LLCC_BROADCAST points to the same
register space.

Hence, allow only '1' reg & reg-names entry for IPQ5424.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
v2: Add Reviewed-by
---
 .../devicetree/bindings/cache/qcom,llcc.yaml  | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index ee7edc6f60e2..1a0021676e59 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -21,6 +21,7 @@ properties:
   compatible:
     enum:
       - qcom,qdu1000-llcc
+      - qcom,ipq5424-llcc
       - qcom,sa8775p-llcc
       - qcom,sc7180-llcc
       - qcom,sc7280-llcc
@@ -38,11 +39,11 @@ properties:
       - qcom,x1e80100-llcc
 
   reg:
-    minItems: 2
+    minItems: 1
     maxItems: 10
 
   reg-names:
-    minItems: 2
+    minItems: 1
     maxItems: 10
 
   interrupts:
@@ -62,6 +63,21 @@ required:
   - reg-names
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,ipq5424-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+        reg-names:
+          items:
+            - const: llcc0_base
+
   - if:
       properties:
         compatible:
-- 
2.34.1


