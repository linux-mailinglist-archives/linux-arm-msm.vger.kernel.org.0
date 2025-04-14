Return-Path: <linux-arm-msm+bounces-54243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6489A8813A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 15:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E478B1756FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Apr 2025 13:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC5F46447;
	Mon, 14 Apr 2025 13:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SEkpCEj1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0AA268FDE
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744636284; cv=none; b=qjqT5KVRQ8nJUxouM7BnyK9URe5JvjV5pWqpxlc/s+JmHtgHRxrxH0Jfd7SUwgJ7HycBUA5AMUGnG4ZWuQB4wDB2krBCixwyBNruwcNaWXs4YzU60ByalUVZnIZUmZG3PVQ48EIVorjwsKY/mPw7Yo/6ZzN6VTRRZI6m6Y4Fnig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744636284; c=relaxed/simple;
	bh=UmbP4wp+Oma3vrXIEVUZhv6OrvqorApn7ysegG0UWU4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pw4wg91NuJm+kb3ciHcqKemHUPOZyb2M3QhiJ7616sqyif9pXhlLmiBEqwC/PMzoDzuYy4yrGV8STLG/GVgxLMS7mlJAg7JtnsYxcqIYhKGja/LvSNPyxm+6R2/i9kSwBT0wpPIbD07LLznsaQFBou6xBHvk0S4Iv7ZWkp0+Ngc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SEkpCEj1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qfk013716
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qY7gfOjasEp41TDXI1+FzfRevMJlQIF5bTl
	mRUcv0HE=; b=SEkpCEj1BvVog6DqS0sqbvj3ScGc6366lQIQaBhYgueKo2mRZCQ
	m/fsg3rflKDFIsoKvt1ac+ZH2b0DQWNoNKhw4XxmwY+Rcy1gZ2LbkqusPybr5YhV
	EQ+lI4WQK1oRhaIkAjGDIPD7c0FMBLOKmtfOURS2yx7AcMg2yqsmULcmB8Ksu751
	AzHJOcbrl4KCA61sEKwDef3LT+0IuVTectdJe116AVK/wxnK8LFGMG/L7xQ+b0+Z
	EzkLsst9/0kCya+D+xaynjEkSqA3C42LFYQAIT2kFzVIEHvEQCGPYftu6oOjFcA+
	CtoJvGAddteKku9qlh1pYDYYil/AoeOTb2g==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfcvhbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 13:11:22 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-72b8343a031so3717008a34.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Apr 2025 06:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744636281; x=1745241081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qY7gfOjasEp41TDXI1+FzfRevMJlQIF5bTlmRUcv0HE=;
        b=ixRSlrkc7JUCCjJw1ogEpnqCpjCjBpEJaCAkG6TOzPtdx3m+6er/T1n5Rs59pSbNZJ
         3h7FrN+BMQ5Evc2nCxTC/mayRK5puP87zPlhC0ZcbzcAuCoCC8/f0Rzzo5sUPkOEfQi/
         NpPNqLndLyEMO4T5AavOmUkJdqiMc2qZnxwk9W/KOfiZB86gZCMS2nP9oXkDaLx1RWtk
         5jdi/MA6o7Sgm1AyyvtfJhj3qkryZbKOWgVQIGWEGfvFkKv3nXGskb+P1YK/nlI26Ngz
         DcBSgy5kYhiGpYSixJxV58+rinMfoKadzOQtgXqCYO9v7JceEgpq50mB6RtvndUE3/ob
         PM1g==
X-Gm-Message-State: AOJu0YxqZQ13I3OwKN5GSkHoiToQ2Vc9i/U++re5boN5hg+gupyqP1og
	q5mgCxOHrJ1HEwP9j83aVgdNjvpyyI33qYhdyBK+LNyXXy2HZtcgIfcNB/Xhaf1HLbsfLnYCqu7
	nIBbo5f2nqZR1kyH0Q10beaU/AjAQOAgAivfTj8tAXlbKJ0pK3s+6rhMSWrWCxQV9
X-Gm-Gg: ASbGncsUyyHPNL0Kgog5th1OwwoJdXtLC5SX3oHlL47Tsh5oLonoeYVYZQwME9Ip/+Z
	CPjsQCh+nSj8At/QgiNyuPyNVUIpzlRW/MnktnWs+NhEkOH6QKsk/1PNvObk9Dc+DPWSXQf053i
	9cZvqe8ti/pN6qVx2C4iZabSBxccp1evO5I+ERoFi4yXUyLps9afc5ueoMCrz6lPD2pi+9FgL1l
	MA/KM5brmUqKI2w+9rvq88jln8j+RuIIkUe/s24o+xBOEBof6ZcLf+jeNnD9fCEKmterXJsKS5w
	4/Ww+NJ3aLeyf6TkNNVIVZTfy2jVCGLiadUEAq7bgSt5fck8ZBWON8JaA93h+4nvn2yKlhKb9pl
	U
X-Received: by 2002:a05:6830:6405:b0:72a:1494:481e with SMTP id 46e09a7af769-72e8616c478mr7820278a34.0.1744636281303;
        Mon, 14 Apr 2025 06:11:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGXgfXq8mSGXy4BvFvnwneWAFeueikAudN2aGSLDGwPKM9/oASxUL676cF1xryK0AvIz0ZIA==
X-Received: by 2002:a05:6830:6405:b0:72a:1494:481e with SMTP id 46e09a7af769-72e8616c478mr7820251a34.0.1744636280837;
        Mon, 14 Apr 2025 06:11:20 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f206264a1sm181921375e9.9.2025.04.14.06.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 06:11:20 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        krzk+dt@kernel.org, robh@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/2] dt-bindings: i2c: qcom-cci: Document QCM2290 compatible
Date: Mon, 14 Apr 2025 15:11:14 +0200
Message-Id: <20250414131115.2968232-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67fd097a cx=c_pps a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=MDeckJw97qnk8wCBExTehA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=NlPZ1nVzr820ScHG1asA:9 a=EXS-LbY8YePsIyqnH6vw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: jhNv6M9WRXgoWsZQ10xfLW3uDy1nssDL
X-Proofpoint-ORIG-GUID: jhNv6M9WRXgoWsZQ10xfLW3uDy1nssDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140097

The CCI on QCM2290 is the interface for controlling camera sensor over I2C.
It requires only two clocks.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 v2: Reorder commits and Fix binding testing syntax
 v3: Add clocks minItems for msm8974 as top-level minItems changed
 v4: change AHB clock name from camss_top_ahb to ahb 

 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 22 +++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 73144473b9b2..83b13370ff6c 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -25,6 +25,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,qcm2290-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
               - qcom,sdm670-cci
@@ -44,11 +45,11 @@ properties:
     const: 0
 
   clocks:
-    minItems: 3
+    minItems: 2
     maxItems: 6
 
   clock-names:
-    minItems: 3
+    minItems: 2
     maxItems: 6
 
   interrupts:
@@ -113,6 +114,7 @@ allOf:
     then:
       properties:
         clocks:
+          minItems: 3
           maxItems: 3
         clock-names:
           items:
@@ -120,6 +122,22 @@ allOf:
             - const: cci_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcm2290-cci
+    then:
+      properties:
+        clocks:
+          minItems: 2
+          maxItems: 2
+        clock-names:
+          items:
+            - const: ahb
+            - const: cci
+
   - if:
       properties:
         compatible:
-- 
2.34.1


