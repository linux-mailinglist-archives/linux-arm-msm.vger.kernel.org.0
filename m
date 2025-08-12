Return-Path: <linux-arm-msm+bounces-68697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0ADB221B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66FDD6E6D11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 08:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E39F2E5B3B;
	Tue, 12 Aug 2025 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IN8uN/Dt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61CC2E5B32
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987896; cv=none; b=kxEzDn+S7sAZaXtyPPKMUfYOPKWdLzkntdBfp0I38T5jXrWO/8gMvHM5XzRHAkUzkjtlvKd+vC8z0PRD1SYsM4iq/rXzYYhaAtr4Yu4G7UJz1GgBhMZxtSMA3SosXHVooruZRWSFDHYvbefl/451tWJtKcsnFd49Z7eT8n2syJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987896; c=relaxed/simple;
	bh=/g0/ZP4wHtHkgn87d1qyuSHaHZRS6iAOtiw3E5bQBKQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YL1voH7vI3giqGsV582sZ/cELOuAAuqYLNV/z/tAd6DoBMLZT5JmL3bbY5mDzRlELOB1EqOamEWp9Rhz7ZF6CtiOIDiS9vYv6mj+WI35jp0d4CFxh1BtQYxBLxieIq+Rd51d9MKvQOWqJqWL84hwP9gpKw0zYwGSLaCDjquFfOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IN8uN/Dt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5ZMwS022388
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:38:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0SmpNFp+B8v
	w9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=; b=IN8uN/DtQg/dumPK03u2KI7sh2W
	MDnlx8MgYFxExuf6GYBInpzJaU2cNtvwytNgVdcwgrE2QMrm3m2AeLm66R8g9YyE
	ANAwosSIErq20mnpnYjKB0uGBI8sPtIxEw8lh6Vxfj+c3Ile7sGrAFHPkOjukhqn
	IeOMhcNWPVKGuDil8jqGmKd9xtdcz4IzVP0Mb89ImdGnK4L1C2jPoZ2JVHRio3xG
	daxFPfFxfzKbC/jQ3GmsfiHpUZ5kxLIBwNEcl3PkJM/zmhrknBPAUYcq8KgPubwl
	5xS/Q7HxYv32s4EDFH+IlC5OddYsIBAaHCP05lJW+K/zbUL77e+vfTJLqcw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vja99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:38:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-242ffe6d0afso4967195ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 01:38:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987892; x=1755592692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SmpNFp+B8vw9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=;
        b=MYF7wjVGtXvs8pAoWaVBPySWjE9A5QD7o3liKIY45W3zl0fn+X6yTb0D1dJKOpkESs
         rTM0b9Rryr3bFKwMh5oY4keHVY8vwCWozY79A0BSzzdgapHwYD1GlVtpJszqDjQwYKse
         qnsJC8S4mY9H+CyUlecb8GKLME3aKS9SS+ck26CPggE7h/GMKf5Rg97eCSoXenaw5tLx
         qt4wD5M/blpjxm/o4Vt/qnfyD0J52ZYnau8u/hBRwsPVAaOH425SK82caY4BiJ64snYc
         04xhTfbXzPrJs9NaSlBTl4oZhHyvt0aKpEAWBgllZIJfYY1DyUCkTeIBiiHxINBrw6Z/
         T4Zw==
X-Forwarded-Encrypted: i=1; AJvYcCXeV9k6c6boip0+MG5hAeskg+CTiZXhJ+kOJ+uaJ5WFViLyk6PGck44yhsDyg1/dOw81gimmyjyIoAr9TWB@vger.kernel.org
X-Gm-Message-State: AOJu0YzYL/fD2ApGAH2T3nwHbrLKswbRthXRzjoJVflWphzof78YLyAl
	9PuUanf2SLWRlXDYMgK++feZqbCp0PB5st7q5Y7I/rGnYo7/2YVBUTMN9QM+z84uAF5Uiq/qb02
	CFtJXaN8nEeIOSiiDiQpOKytWOAN/5b2QwxVz+rpSGr6s1YDUfGSv7RhCofnwgwSvZylm
X-Gm-Gg: ASbGncvKQHY0uziKbTeBymW6B0spMjSA4ZdeKHjJHwy1z0zKvjvx+MG4KXgTcj71BFc
	YkPTqt6yx21nyhckNLcpsfZxptBCQmc4thyPUejrWjnCVjRO2BEKdF45A/BCifq/8KPmX1CjMDV
	20pmNmK5HwC7EmmeKLDHDrDNu9p3QJ7IK5vysuJEuPx/fdiRT4//ACdKOid6ldLRjKcmTUePHZi
	xeCQnzebaoCirnVUHupAfi1R6fwm8a03GLqsB0vaXF0y11nE090NRAfisr/zfXlYvLCAjIWlORK
	iva5n49ULyAC/6B/NidWt+I4F5eRN8UZfe8mTN+QNxHeI/2IPCsTF/9fGuRUmYtoJMA+w9dhWMJ
	6K/U3/c8jAHV8Mb4OWgc=
X-Received: by 2002:a17:903:1249:b0:240:3db8:9adc with SMTP id d9443c01a7336-242c1ffb202mr221272705ad.4.1754987892031;
        Tue, 12 Aug 2025 01:38:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsrejQyQPUM/qvKCFw2RaISG2UWmCC1pkXJPCzFHH/tzSURwaSjJEvjHXBGqe+x2dQbAv5zA==
X-Received: by 2002:a17:903:1249:b0:240:3db8:9adc with SMTP id d9443c01a7336-242c1ffb202mr221272155ad.4.1754987891561;
        Tue, 12 Aug 2025 01:38:11 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243086849b3sm1915345ad.175.2025.08.12.01.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:38:11 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 6/9] dt-bindings: arm: add an interrupt property for Coresight CTCU
Date: Tue, 12 Aug 2025 16:37:28 +0800
Message-Id: <20250812083731.549-7-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
References: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX3rzB0FjXaEgF
 3mqEjijEUOn8P88bNiDuFnQ40/msFkj9dNI0EiMXdPvOqLG99b3LPZBvSwPSQ3IUF92g3RccK7N
 RHJPxofZ3pbrg1eYtMHZQxy4TOQ9Jne5B4QK1UoB9Idl1AMpiYkX8Ziopl/32mpGZzkuqINocOK
 WJGhkRQuebSpQ/v9aO1EcqrVJ0W2Rqa311ISAEwv/pdyLm3ANowS1yZzkllwBWjZg9jVze1Aaeu
 g66s98XJ5kpix7/B0SmjG5mPZrpmOSzEIdGsFdhW5sQ1lpshNK9NZ95rG30gmMjlQY2WB9TMpdD
 bGibDRG+JXAcL3kSoaL0CmFB9C+5um+zZ5TwLkU1/NucTIWuUnXJrxwZ3APQpAeToyGaQiNh03F
 QaCWkYdf
X-Proofpoint-GUID: WCFWI7GJJOMKhL5wMuAKChABEQ98S8Ty
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689afd75 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WCFWI7GJJOMKhL5wMuAKChABEQ98S8Ty
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-ctcu.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..ea05ad8f3dd3 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,16 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Byte cntr interrupt for etr0
+      - description: Byte cntr interrupt for etr1
+
+  interrupt-names:
+    items:
+      - const: etr0
+      - const: etr1
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -56,6 +66,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -63,6 +75,11 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "etr0",
+                          "etr1";
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.34.1


