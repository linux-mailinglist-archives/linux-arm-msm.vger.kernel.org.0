Return-Path: <linux-arm-msm+bounces-73645-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D630B58FC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 09:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C2C9523E76
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 07:58:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF914283153;
	Tue, 16 Sep 2025 07:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfxJ98nq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47155283680
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758009521; cv=none; b=UMkT1qzIbKECLSTWtLcGtgnL6c78SVbFXbrbkAMVi0iCwG8ntNGuJZSXbCY0CytZ0Diz7GTIdxue1rv8eY1iecAlXY9nWG77mYE/ZV/efBSQASBrkxDeLpOg2Hi7q5EA0Z1eb4pOBwzM28nsr3l+eP9ZR8SILAe/puryZX9MqPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758009521; c=relaxed/simple;
	bh=ArXwDIA34+1WfUp8gIHMT40+a9JNYhOA/RMyYMWiy6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o66+IhA0LeCViiGk30Z/9B+rkXMhH1CxmNyq9bxvywOlQ/ZNaosE/CMVTJNMopUWcOsAQcC+SF2EFpyCOfvvLLf6hfWtt0fssb7s6X5WXQJ+BCDJdfn54Glx+QiPwx3xjsuasQKBThQULY144UiXiBDefvYV+KVeDTIk5k2raJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfxJ98nq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3qIkr007954
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3F+avBgCPtVijc/CXlYOC3xqwD3ll2D58Zhdko8e96g=; b=gfxJ98nqc1X9fWDn
	YvZSuEW7G5QpctkTQRxAX+q99O3+o/EqY+Vy+2uMXaCLMLW6ICdBQnw0Xg9dj24q
	NHECqVKHk2Z2aPBW/OIe/J9+Qof4OphRwEW/iSSNEC0MOHjudBG3+9wgDJFQPU8x
	MGktFoAuZSbys/obCOVqGNoyBivo7CtsW0SptiFS1FdcTDuv2CNLMAsfjWY0fGdr
	ddTLEt9JqNElaYIM+PR6SNHCmnaafRII76P4gBuGCVeXSBiAujlsJXuofjf04Kde
	VQ+mGNMmYTzCP6pDBDL/iZKLG4ylL908iTSmW+K99xC6lXJrxOZN02mnpqOLxoHZ
	NA2hiw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n3m3e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 07:58:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-76e6e71f7c6so4992969b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 00:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758009519; x=1758614319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3F+avBgCPtVijc/CXlYOC3xqwD3ll2D58Zhdko8e96g=;
        b=dYFAKY7CwUIIwdYjjD8sgJwLLcKsK3N9qpRODwUccXZnMUlKnfdQhAmlhWqkc5K6Rc
         oROZB0/jvytxlHJpbpBTtskFIQCwXrjXqLkE6suloAmSPp6TNsZugEZv58+G+N7c9mx3
         qfVu/DE2najorkRcSGqFqdmYsPkdQfHtabBGhiuiH12CvUNk2HVBsyVb81rxmZZQg14L
         znU7NXu1/nPa3GAVA6J3ZUSWwB16MBvnvjZ9D5QXRPezj8+uK9JK98AkInXUB+lcj8LK
         Mof/TrJFedCMP7GnbkQuaLgYbNQ01kr5sSuWDNlRmVZtBRmMxXwDGhxg+rIXZ2IasCCp
         3VFA==
X-Gm-Message-State: AOJu0YwTbqfp24QyU9MR1YUH4jDj7icxjLCVTqiwoJkvVVRO7VcE7V5U
	iBCckuV2HVjN8pfpZeDX7QGwggc2ndSn+FQCAlcZbHUh+wE+JEzCOFNT/YlP3Wo2GYd5Vs/gdUX
	5jBOdJ2/iUtYj7lIE2exgp3FSarXtN4vO8rhor12siC6AWl6kHbstmU68QkG+Qcn7/yFq
X-Gm-Gg: ASbGncvehC8/e6LoFFINct5JFKY0ZbaTdpVMHHJjBIBMvrd3zOb99xhRC5jEn4Ooycb
	Zx4NHENRsAwNV0wXfcWT07lJ3iVlcZT59d/w3FwZHmh+SAO4/bLDBiADBfS0rcqZQu6jwSSmdsC
	wm0S+uw/GpgPELE4AzKwPZRyYdRPShMvsWNDAsMkvvPuV01WH4cCfBRQxKbEkYBdjgZbFFCr9l/
	AOeUNPYp8oxVePxjoUFY44JHrZbm5bMwfelZ0zPow4uBSJJr+MWkr4QCvI5a4+udMZCXdGs6Jub
	abuRTjtyzY1pSqdC81Rud/2U4tlUahXCzhQ9ujFPZurId5p1ViU/xUkqlPGxaFdUu3QLhryCgsw
	x14lHMW4TAJARguRucw7CUepRvQ==
X-Received: by 2002:a05:6a00:3c8a:b0:772:306d:a1ed with SMTP id d2e1a72fcca58-7761219fbfbmr20081626b3a.32.1758009518608;
        Tue, 16 Sep 2025 00:58:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaXARsNUr/p/kt1rsM7pNdMTXvhVpM3o7m0bfspEzwuZzKeEjPRx9DfSQD4zl+cl+r9jCK/g==
X-Received: by 2002:a05:6a00:3c8a:b0:772:306d:a1ed with SMTP id d2e1a72fcca58-7761219fbfbmr20081578b3a.32.1758009518112;
        Tue, 16 Sep 2025 00:58:38 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761af2e09dsm11292222b3a.76.2025.09.16.00.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 00:58:37 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 13:28:15 +0530
Subject: [PATCH 1/4] dt-bindings: rpmh-regulator : Add compatibles for
 PMH01XX & PMCX0102
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-glymur-rpmh-regulator-driver-v1-1-bb9b00e93a61@oss.qualcomm.com>
References: <20250916-glymur-rpmh-regulator-driver-v1-0-bb9b00e93a61@oss.qualcomm.com>
In-Reply-To: <20250916-glymur-rpmh-regulator-driver-v1-0-bb9b00e93a61@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758009510; l=3104;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=ArXwDIA34+1WfUp8gIHMT40+a9JNYhOA/RMyYMWiy6U=;
 b=VJZoKeKCzGneNcfP/XfShsAj3Uzq/FRWiiIfMzOKguvIhoBMR7Kjh3uIoXuY4IhfBD3nqDm4o
 Oafp2CZPFbpAar02GR97BuRVAD4i5AZnnkZ1YnrxzpiXMrdjhQscfaR
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-GUID: abT9ggtX9tXrJgAgzLjO9UdNiTJZr0IR
X-Proofpoint-ORIG-GUID: abT9ggtX9tXrJgAgzLjO9UdNiTJZr0IR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfX3423KdKsPnsA
 xwTr6NqoaAsZfzqST+mI2pZkf9DYzum9ONhjn2lza59JZU+m9FqaDQhj5eN3uWJ3zsBILORvzMC
 RdY+AVJ7GkPmb9BO74P0P9AQ+wzxFz85rLsHxld3cTNa6KAfFXTI/ubgYpQgo5GI+5x6Brbu1o4
 8BWyHs9bHFewQPKOrArEmaN8PBRAgsm/nKYwN2OkSZmFqn0qyhI4zp7C0yQh66P5QhBTMtaW30Z
 7pmBauic62jiYEZHXVUUPwqnCuTQi0o89cgMCZsiBMxuqi5uLMYZ91CTGkpZgoYyiSwUxM4wohp
 aV5l1f/DkL9v1Mu3msU1BjsqpROUCGIA81HCSvIOzgvtBYXGxvuX93YeDCFALTpGKPhma7yvCkM
 Ye1kSckX
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c918af cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=lsy0SRZfEzWN0kW82SEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087

Add rpmh-regulator driver compatibles strings for below PMICs:
- PMH0101
- PMH0104
- PMH0110
- PMCX0102

Also add the supply name properties for the regulators
present on these PMICs.

Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 .../bindings/regulator/qcom,rpmh-regulator.yaml    | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
index 4c5b0629aa3e622579b54a226785139a0b986079..40e57b10ebbebeff130871b6d978df64111b6f29 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
@@ -51,8 +51,12 @@ description: |
       For PM8450, smps1 - smps6, ldo1 - ldo4
       For PM8550, smps1 - smps6, ldo1 - ldo17, bob1 - bob2
       For PM8998, smps1 - smps13, ldo1 - ldo28, lvs1 - lvs2
+      For PMH0101, ldo1 - ldo18, bob1 - bob2
+      For PMH0104, smps1 - smps4
+      For PMH0110, smps1 - smps10, ldo1 - ldo4
       For PMI8998, bob
       For PMC8380, smps1 - smps8, ldo1 - lodo3
+      For PMCX0102, smps1 - smps10, ldo1 - ldo4
       For PMR735A, smps1 - smps3, ldo1 - ldo7
       For PMR735B, ldo1 - ldo12
       For PMX55, smps1 - smps7, ldo1 - ldo16
@@ -85,7 +89,11 @@ properties:
       - qcom,pmc8180-rpmh-regulators
       - qcom,pmc8180c-rpmh-regulators
       - qcom,pmc8380-rpmh-regulators
+      - qcom,pmcx0102-rpmh-regulators
       - qcom,pmg1110-rpmh-regulators
+      - qcom,pmh0101-rpmh-regulators
+      - qcom,pmh0104-rpmh-regulators
+      - qcom,pmh0110-rpmh-regulators
       - qcom,pmi8998-rpmh-regulators
       - qcom,pmm8155au-rpmh-regulators
       - qcom,pmm8654au-rpmh-regulators
@@ -246,6 +254,7 @@ allOf:
         compatible:
           enum:
             - qcom,pm8005-rpmh-regulators
+            - qcom,pmh0104-rpmh-regulators
     then:
       patternProperties:
         "^vdd-s[1-4]-supply$": true
@@ -422,6 +431,34 @@ allOf:
       properties:
         vdd-s1-supply: true
 
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pmh0101-rpmh-regulators
+    then:
+      properties:
+        vdd-l1-l4-l10-supply: true
+        vdd-l2-l13-l14-supply: true
+        vdd-l3-l11-supply: true
+        vdd-l5-l16-supply: true
+        vdd-l6-l7-supply: true
+        vdd-l8-l9-supply: true
+      patternProperties:
+        "^vdd-l(1[2578])-supply$": true
+        "^vdd-bob[1-2]-supply$": true
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,pmcx0102-rpmh-regulators
+            - qcom,pmh0110-rpmh-regulators
+    then:
+      patternProperties:
+        "^vdd-l[1-4]-supply$": true
+        "^vdd-s([1-9]|10)-supply$": true
+
   - if:
       properties:
         compatible:

-- 
2.25.1


