Return-Path: <linux-arm-msm+bounces-76117-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 876F1BBFA8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 00:20:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 184973A2BD3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 22:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5801F4191;
	Mon,  6 Oct 2025 22:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CClnthBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6961E1DC1AB
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 22:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759789213; cv=none; b=k99SRSU5RGcma0UOohZZT95sOxtiVB25oKk91R+3b0eyfzmeH3hC+6Uo6b2ySA6+A/2fAcsBTVa/HDbvSYCNQU2J/3j5WHYTj7sCsE8CeKKhhUlK///7iT62emoMQbMf5OgSCpKXjrVa/1pCCM68VKro8dmXB836tIXIoEl8gkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759789213; c=relaxed/simple;
	bh=MCbqnX73P4uJn/n4jiAlTVZO9e/LGJ1yW50aiT4ZX9Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eklKR9tAmVRXpduyuWCgukfbGujhV9fyPEzS4nMsp2nGCJOAXF166TgKm8nP9czKL98j1kaAgPNIQx5i1C7nYnBHhRSp7AdALWOXUPxkxZ9ahZFg+s1SHW5bOAd94rqTvditmLVg7scpVhd2L7UpcB8iYHOjQOBX4J8TT0U3c7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CClnthBI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FnlqK014386
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Oct 2025 22:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YYQJM1FZM3o
	3DDgyVmJ5oX4Xtvn4+xxewRNc42qivew=; b=CClnthBIO3iEJu2ARKji9JHH1mZ
	oYZrU5EOAG++sJKc75hxLdQoFQQybFbSMEDTxbrn1f7xdz0+o3/pAqWmmbjwx7/D
	fH9JtGQp2BRLB/y6qnFnV9FVqdv0k854dRr/2Ie50gOF7GAR+PA2yyumMvYOYPuB
	BXGtAe89GTUGxI2RWWGj4MZXi05BiNxLeanXdvZWPjT2TCV2mgnnHfmliN1f5Syf
	gZzT6YxVH/EvOTlMGKBLJ2Q6XBVq47rGFY1yQH7/06OTdF4TIBBf2B0rlAWHDKRF
	LRi8JioD+LSEIcgM/LYdgFkIPLiGrWLNG0q9+EfuYAV4bR+cl42hYV/Fkkg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn5mde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 22:20:10 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780d26fb6b4so3779814b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 15:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759789210; x=1760394010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYQJM1FZM3o3DDgyVmJ5oX4Xtvn4+xxewRNc42qivew=;
        b=vPDEejfcl3GIvkhy1+MlMlc1P18UlyyXvYPG9qiTvqrvZlVa5etifmMBh70s9j6b2j
         Ruot2uAGGqXmonEEOyzAuqWr1xZgWe3gvRZmseJvsXjYLYus88A16/311OQ/5ofC84pg
         aTPAVU6WXHiPl+JRTq1YzSm1TCpTERnebpyn5X8snkYVp2Ujt4LmdIgfQObayWO6gg/j
         rAF/DQIUKAeMv/F1ESlQhAUQGOQ+gcIM7zTe4RJH74pgPw3jUgtVXStqQ50GEtpNfnk3
         +ErNiiqYIRrEuE9sBTcA89uOS4SnIlpxUkkkh+G15mRjDBAOLpfsogeej9QCza//5LyR
         SBWQ==
X-Gm-Message-State: AOJu0Yx0ao+uVZDXHEwjwUUxrgOm6++RDRWdWEE8FKe3SnmUCGM/Ukrv
	GvD9HXl1otw06mFsGIXnSrA0JWLB5wtv22mECLDS6YNKtT4E0Q8K/IiVCD+2x0wLPoTWNqZerSf
	Xpp73t9CZyBaXJZJYLNYnVn8//0RMPFF6vxa3f8/fvSYH2FfsANoWy0SWo9Z6Tddh0/GM
X-Gm-Gg: ASbGncuYmArwxCiknbusonurQetlBPo9Wvf0Qxj7Dzf7GViH39cQR11Hy3sMmyA+UsV
	L72wnJJIwwmq2aKAIaYt0EF1ckdCcAR0XvcJOGFXzwTziRpAkv0LCdZcHI/cXn80cesOMQAGGPr
	9fNfamUHXWATvxyT/5p3uOqPhSsmQCaDrq27DPJy7Cz3m7is34KI2iqbSaIGsrOeEcmYyM8IhuL
	FCqNzQM/Lpbd9525+7MZ/aO5E0+Rj7RMshhPrTvc3DBceUxpoSHDmZ5Qe/LxpV4wEKFmln0IHyS
	67beUfBMlMgVEhmNvVj5OvFTK0X2oZm7LORzBKcO+jiLZ7TsPk1UewLeIdRA5eVa0GoK752JfYC
	XDHibji/MdvKQMpxFBRfzUg==
X-Received: by 2002:a05:6a00:17a7:b0:77f:2b7d:edf1 with SMTP id d2e1a72fcca58-78c98dc4de8mr14323540b3a.16.1759789209675;
        Mon, 06 Oct 2025 15:20:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXaDx8BsYyj47bbtSutFI7Rk0z0Yzk+5Yo1y2hw0obgjXnbc1IezB2I/5mfA3p0GATJPUQIw==
X-Received: by 2002:a05:6a00:17a7:b0:77f:2b7d:edf1 with SMTP id d2e1a72fcca58-78c98dc4de8mr14323509b3a.16.1759789209163;
        Mon, 06 Oct 2025 15:20:09 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01fb281bsm13734968b3a.37.2025.10.06.15.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 15:20:08 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v5 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB UNI PHY compatible
Date: Mon,  6 Oct 2025 15:19:54 -0700
Message-Id: <20251006222002.2182777-3-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX2UvSxrkJ9hoP
 DYzznC1gjnCdY4tfl3R1NOwIPaYSXisX5YkQnbAfvVmjIcZ0HzyiBo1t3q0cAYv1fI8pM+D9oGZ
 yN+FIblomofsZKw4ZwOv+xRwmFs7euIkxT6wYA0i35cnkbMnn35knnsHSnOIrE+q7Ipv6xQ22tk
 Bo0tHR2cQd2RUXDaQT2ruayGps//JhdA+dDlxtixAw/sj+34n7lekTizVTHC900Y9kzlcv57iTe
 R86nJqUYzKtwy91eFL/3IFsBPQREYrdAVsdvlmSmsuTMN3J+LvALTJu93QNAVv55osHjGJMpkjC
 YHKneuyeG73VcMyUEjsdXCkistoqySzjk0CLazvDearTdMcwhF0eD02sSMX8LxMksUgXYPrXPKW
 3VkN+7YZK1Es59C1RxXAX6tuqdu8Og==
X-Proofpoint-GUID: TLFJ_f2JKBfspyommb6mUSh_p95PoTL2
X-Proofpoint-ORIG-GUID: TLFJ_f2JKBfspyommb6mUSh_p95PoTL2
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e4409b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=e4LYGitkWRZSOGXTHbEA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_06,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

The Glymur USB subsystem contains a multiport controller, which utilizes
two QMP UNI PHYs.  Add the proper compatible string for the Glymur SoC, and
the required clkref clock name.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
index a1b55168e050..b0ce803d2b49 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
@@ -16,6 +16,7 @@ description:
 properties:
   compatible:
     enum:
+      - qcom,glymur-qmp-usb3-uni-phy
       - qcom,ipq5424-qmp-usb3-phy
       - qcom,ipq6018-qmp-usb3-phy
       - qcom,ipq8074-qmp-usb3-phy
@@ -62,6 +63,8 @@ properties:
 
   vdda-pll-supply: true
 
+  refgen-supply: true
+
   "#clock-cells":
     const: 0
 
@@ -157,6 +160,25 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-qmp-usb3-uni-phy
+    then:
+      properties:
+        clocks:
+          maxItems: 5
+        clock-names:
+          items:
+            - const: aux
+            - const: clkref
+            - const: ref
+            - const: com_aux
+            - const: pipe
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-usb3-uni-phy
               - qcom,sa8775p-qmp-usb3-uni-phy
               - qcom,sc8180x-qmp-usb3-uni-phy
               - qcom,sc8280xp-qmp-usb3-uni-phy
@@ -165,6 +187,19 @@ allOf:
       required:
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-qmp-usb3-uni-phy
+    then:
+      required:
+        - refgen-supply
+    else:
+      properties:
+        refgen-supply: false
+
 additionalProperties: false
 
 examples:

