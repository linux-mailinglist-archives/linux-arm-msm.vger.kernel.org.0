Return-Path: <linux-arm-msm+bounces-40398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B089E47D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9D6A281E3F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 22:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6EEB1C3C06;
	Wed,  4 Dec 2024 22:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d587a/xC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C824D18FC75;
	Wed,  4 Dec 2024 22:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733351278; cv=none; b=dls8AwCPyEyyTA5Zf9rSGrzhQqYGhswbQQoPYAnMdB6UeykYY8EGjHyVe446uRHwKtdIBRAWohlaA8i6QUoi+7JdJrZIYGWKMa9Gg5sHdzkbn7qmZw+GVG8oZrDqEhPOoC5Wjyr1lAMTInSn6hqHU2m+YZHUZZYH+iBnoo89Ar0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733351278; c=relaxed/simple;
	bh=V0EjKFyoMiFzOVSQ2/2Apzaa49TPf9F5tzWQ/pgCq8s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=srqNuBx51IZJbQJ26niA1kV2OzQzX7MUeRn8823CjZnemClXp6qdLGZMB+KNPm+WJAhUoZVcRmBRkG1Gs8MnkyZG79g84rKzqzwm1qmgr0uAllqpc0n08OF6nybixbaROhd//E8stRGVY/8Q38M493JKylEhhda4WXM4SaPw6vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d587a/xC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4Ffhtp023308;
	Wed, 4 Dec 2024 22:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KRjpFeJFwblmAtEAARVx5E
	6IoRyDcUDcuisAWgu+n+g=; b=d587a/xCCUV1xlZVo1Dl/5L+of2hPGKT5zxEOH
	thyRn+cQD2qZfs5Ofjma1eiGH0MFDBSbFIodivsMW824TDF/8ozzr1LvX2GUeI91
	qPTMgGUCVddolZSgSQ5I4TJLiWr0uvF0XqgU7RLr7m6LNjT77FVWQ/BupgkZh68/
	wxD8aAF9gHw2kM3cd48H7W87NBYX8trgtXDOj1mXlXK0ysCEM3I6VTzZV/fNcaH8
	Sma2aP8594N1NallT5AzxdUGX/FNtrTDT3RyFiCG08N6y1SDzayX8ddl/kLkYRjX
	6EkzfZ7Xmg5hmM0oKZdzi+qiJLKPEOgFrRA2SjP/WTdqh6XA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43aj42ab51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 22:27:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4MRgJw026652
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 22:27:42 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 14:27:42 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Wed, 4 Dec 2024 14:27:25 -0800
Subject: [PATCH RESEND v2] dt-bindings: arm-smmu: Document SM8750 SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-sm8750_master_smmu-v2-1-9e73e3fc15f2@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEzXUGcC/0XMsQ6CMBSF4Vchd7akLbQUJwdZHXQ0htR6kSaWa
 gvEhPDuVhfH/yTnWyBisBhhmy0QcLbR+iEF32Rgej3ckdhbauCUl4zTkkSnKkFbp+OIoY3OTYQ
 qWelrXdRSSUjHZ8DOvn/oGY7NqTns4ZL2LnhHxj6g/pMsobTgrMq5olIISRh5Tda0zj9mDHr3D
 TuY3HgH6/oBfVqR27AAAAA=
X-Change-ID: 20241204-sm8750_master_smmu-0867ab939686
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg
 Roedel" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <iommu@lists.linux.dev>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733351262; l=2153;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=V0EjKFyoMiFzOVSQ2/2Apzaa49TPf9F5tzWQ/pgCq8s=;
 b=b77X0mjGkOducpwujz+ZTFigyyl4sxFcRudE/3M71yfrHCMXSz3OvnqXB2KCIKYweMCE4YVkf
 WXjsjpTpNhFAIaUO5T6SQ6zhQUHGzyi9zCJ+z22B+qZ+5N/wZZApIBi
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YXbxqXhYN0xtRyb2g79QR4yAhObGnCo9
X-Proofpoint-ORIG-GUID: YXbxqXhYN0xtRyb2g79QR4yAhObGnCo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=972 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040172

Document the SM8750 SMMU block.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
Resending since I forgot to include linux-arm-msm.

Changes in V2:
- added additional documentation for gpu and clocks
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index c1e11bc6b7a054e6e839b4cff356231170d95093..e4e067a2b778e3b9ed30bbb973b50b2b86ddd2f1 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -61,6 +61,7 @@ properties:
               - qcom,sm8450-smmu-500
               - qcom,sm8550-smmu-500
               - qcom,sm8650-smmu-500
+              - qcom,sm8750-smmu-500
               - qcom,x1e80100-smmu-500
           - const: qcom,smmu-500
           - const: arm,mmu-500
@@ -102,6 +103,7 @@ properties:
               - qcom,sm8450-smmu-500
               - qcom,sm8550-smmu-500
               - qcom,sm8650-smmu-500
+              - qcom,sm8750-smmu-500
               - qcom,x1e80100-smmu-500
           - const: qcom,adreno-smmu
           - const: qcom,smmu-500
@@ -550,6 +552,23 @@ allOf:
             - description: GPU SNoC bus clock
             - description: GPU AHB clock
 
+  - if:
+      properties:
+        compatible:
+          items:
+            - const: qcom,sm8750-smmu-500
+            - const: qcom,adreno-smmu
+            - const: qcom,smmu-500
+            - const: arm,mmu-500
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: hlos
+        clocks:
+          items:
+            - description: HLOS vote clock
+
   # Disallow clocks for all other platforms with specific compatibles
   - if:
       properties:

---
base-commit: bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7
change-id: 20241204-sm8750_master_smmu-0867ab939686

Best regards,
-- 
Melody Olvera <quic_molvera@quicinc.com>


