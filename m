Return-Path: <linux-arm-msm+bounces-74931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F09B9D996
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:30:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C10DF3B72FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 244EF2EAB6E;
	Thu, 25 Sep 2025 06:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVsECrKJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC5E62EA498
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781765; cv=none; b=I83rsPe08Jk3aDCoTTjv6xDl2WATfIEzcY1gcV6oIO+JDZa/1WJQHZgf3fX7t5NDdeVWc6TgjSXYgQr91rTtHI6XNM/kAou+zrZh0U2PkzwoT8eFxkmNOpASxolZAyB7M7297RnKpWwOuGnqkewB0XZ/kMIJlAUOmRtzVmpddYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781765; c=relaxed/simple;
	bh=fElO3EF9R19NDeX+BG2YF39Vf8D4oJXDjBMGCwiMl4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kGHU8Oeig6vLuOuhlPEQCVbjFlfCwapjKto18v6OkM05m4+dwv3M4Vs657iC7G29Tlqt9ZPd3azT3N3+zAJyb6LAhxTXie4nMJomZe94EPgyHUN/sx7E64zfWJHVlZv8iPlqHJsvEiiFjjH/Fe4AVAcO7JvCluTccYQrBYYfXLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVsECrKJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P02A3f025120
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3WpjX+QZdNG8Jvf4TjOewFLRT3V458PXcjB0O7zeIxY=; b=fVsECrKJeUwDnTsA
	57yLADlO2NmTEj0smvoh9Kz1K1sQFYknZ6kuajqNINEpYyCTNp0/EUbg/wFZB/5j
	hK4C5xqQAXcGcyUfl9icU/UgNAPvbvQXUVwTcb3K0Frj86H87Dbqpg3/v3kvcplG
	EIc/E7lCkcbWh0WxQps1XG59vkd6EJD9O7ihuzUwuL4o6XHpqAiMHTWjne2dn8AI
	4iEAQpCew0yXmMzVqxD3GoyqFPHfirHxzr8z7wf6QduDyMPgW9ZGVlng9YG6CiEQ
	BqmYxN6bx3+olPRrqUm+Tc/XlYhhWQgKOVG1pQ6oK7R3FIIbgbIO27/RpFTWL2El
	VMgogw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv171m5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:21 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-78038ed99d9so987926b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781760; x=1759386560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WpjX+QZdNG8Jvf4TjOewFLRT3V458PXcjB0O7zeIxY=;
        b=eLzQ+PpH1AZieg3ktVmaKkoQxpnuGq3+3/BWihfRoKA9ClaI/2E3mD0mZqoAMlct5t
         GV7/LY6aR/MruEBZiNMg82iCZdBMv9MFzYrle2fLoM6HUhYeCY+bD2Ee8JyLz0JzIpdC
         e0AgP398g//exeYkRmc6b2MW81+/AHdbwjALb9btBjkd8ecm12ZtfHWgVW92tfWImNB0
         gTNWffXPjfVTgitxMZFRcAzmmVpKJqv5xdDXKRpiURDqoFhgE4bJNsT954vgAsUGx0WP
         VrZQrCxrrurtxfCD4ePR93AtNGaRb599cQWkT6t5rvD3eivZzgBKG8lvCYUwxBDQlVDT
         vcBA==
X-Gm-Message-State: AOJu0YwyqrALUFafTeRxlL1SCJlfXvaacPdecViIeBcgZYFsXq8nxqCd
	/IkPgxsEsuV2I7daCnswmIGws87bzwNw8zf9MGj0FOUxZCXLNVeJYKQ7yor7vhg+1a7uGlC4XPC
	cYUv2T1X0QXDEixybxpM/cuzZcfFbRA3twKo4SDR58V+bta70LUD8GwgbHbO3xl+ADyYe
X-Gm-Gg: ASbGncu1NciUC8UxVEzAWHWDwQh5OfqFnnN3yq5uv3Ay0P7htX36gCLezadidgAn6Yr
	88WwOqyX7a9bmwmPq7b5l8vQowx1P+w08A15qb2ycmMlZoQidh5rq+YozUGQI7Wwtkwz58SAVyu
	1Lq5VeMuyexqYYcVnGYkw1G0BNwrHw5b0vhJL+pZWG2WmRvSK9WntPFB3GTHN/rjKdTvp8zZlmp
	wWb6984NxZlg10okfFSTqEqiOe0wQ94pzABF3RxBOk/j4iPMb39zDzCAft907Ob2RQLx/cWuWKa
	CWAsUvljNl0L19jj6vhJmYeYkAEz3/6E9Hbk83csjqeru8lRPDNc8wTru65V4E6yeV64nBCI/vu
	j5ALV/Zj9uQuU2WswVzv8D+6YQtwRdNE+JfhQaw67XuixSwbRoCny3ro6tjF0
X-Received: by 2002:a05:6a00:2e25:b0:77f:198b:d75c with SMTP id d2e1a72fcca58-780fcf07764mr3061983b3a.32.1758781760488;
        Wed, 24 Sep 2025 23:29:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyElfdfkAf7s+ncJO8otX6yCn48jW9yWrHe+rR9dTDTpi2t2TPrSzoZ52Ve3iSpSj6MEIg9g==
X-Received: by 2002:a05:6a00:2e25:b0:77f:198b:d75c with SMTP id d2e1a72fcca58-780fcf07764mr3061942b3a.32.1758781759988;
        Wed, 24 Sep 2025 23:29:19 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:29:19 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:13 +0530
Subject: [PATCH v2 07/24] arm64: dts: qcom: glymur: Enable cpu dvfs for CPU
 scaling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-7-8e1533a58d2d@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Taniya Das <taniya.das@qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: 2PzHK3DsSJduen8jqu_ZWSOGlNT8tnwG
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d4e141 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gdhpWjMKO13w-baniFsA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfXyIRQMZVY8IkK
 EUPsx0YkZjCFYeXpUtiRhfBslPKE3aNeNjOP9tZ5nUKYNQun4FhUoT/xktjqd5AASOC4Y6ywqaD
 Hxnyt64OjQDwVb+eLZLmgo4BbTQ4C7uimlhi6tP97NW2AbmOjn1dm+MAFC7Xrkn81LY4XiDb+5m
 3h623eu4XpAkmhuHkYmll3cWJijgvLtDny8KmsgK6U22Z8/xq5eh4cfiF+j7eDxzIfg6riX0BaX
 zSoIsvId39AVJ5PX4Y9EeQV0BH0Gp7hjqUYNyPF2qotM/skWSCKFYVnHgmBMfiTXw6Qhxv0CMDB
 YFvwfhGDE0FI6NihTpXp1n9YiER6rDYjiPCoEnFKcYjeMFY87VlHOGHw5nCTmNvkZqKsd+MeDJp
 Q/xZMpjy
X-Proofpoint-ORIG-GUID: 2PzHK3DsSJduen8jqu_ZWSOGlNT8tnwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add sram and scmi nodes required to have a functional cpu dvfs
on Glymur SoCs.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 87 +++++++++++++++++++++---------------
 1 file changed, 51 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index ae013c64e096b7c90c0aa4cfc50f078a85518acb..d924b4778fd37af8fe7b0bceca466dee73269481 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -46,8 +46,8 @@ cpu0: cpu0@0 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD0>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD0>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER0_C4>;
 			next-level-cache = <&l2_0>;
 
@@ -63,8 +63,8 @@ cpu1: cpu1@100 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD1>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD1>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER0_C4>;
 			next-level-cache = <&l2_0>;
 		};
@@ -74,8 +74,8 @@ cpu2: cpu2@200 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD2>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD2>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER0_C4>;
 			next-level-cache = <&l2_0>;
 		};
@@ -85,8 +85,8 @@ cpu3: cpu3@300 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD3>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD3>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER0_C4>;
 			next-level-cache = <&l2_0>;
 		};
@@ -96,8 +96,8 @@ cpu4: cpu4@400 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD4>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD4>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER0_C4>;
 			next-level-cache = <&l2_0>;
 		};
@@ -107,8 +107,8 @@ cpu5: cpu5@500 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD5>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD5>, <&scmi_perf 0>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER0_C4>;
 			next-level-cache = <&l2_0>;
 		};
@@ -118,8 +118,8 @@ cpu6: cpu6@10000 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD6>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD6>, <&scmi_perf 1>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER1_C4>;
 			next-level-cache = <&l2_1>;
 
@@ -135,8 +135,8 @@ cpu7: cpu7@10100 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD7>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD7>, <&scmi_perf 1>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER1_C4>;
 			next-level-cache = <&l2_1>;
 		};
@@ -146,8 +146,8 @@ cpu8: cpu8@10200 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10200>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD8>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD8>, <&scmi_perf 1>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER1_C4>;
 			next-level-cache = <&l2_1>;
 		};
@@ -157,8 +157,8 @@ cpu9: cpu9@10300 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10300>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD9>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD9>, <&scmi_perf 1>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER1_C4>;
 			next-level-cache = <&l2_1>;
 		};
@@ -168,8 +168,8 @@ cpu10: cpu10@10400 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10400>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD10>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD10>, <&scmi_perf 1>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER1_C4>;
 			next-level-cache = <&l2_1>;
 		};
@@ -179,8 +179,8 @@ cpu11: cpu11@10500 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10500>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD11>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD11>, <&scmi_perf 1>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER1_C4>;
 			next-level-cache = <&l2_1>;
 		};
@@ -190,8 +190,8 @@ cpu12: cpu12@20000 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20000>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD12>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD12>, <&scmi_perf 2>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER2_C4>;
 			next-level-cache = <&l2_2>;
 
@@ -207,8 +207,8 @@ cpu13: cpu13@20100 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20100>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD13>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD13>, <&scmi_perf 2>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER2_C4>;
 			next-level-cache = <&l2_2>;
 		};
@@ -218,8 +218,8 @@ cpu14: cpu14@20200 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20200>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD14>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD14>, <&scmi_perf 2>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER2_C4>;
 			next-level-cache = <&l2_2>;
 		};
@@ -229,8 +229,8 @@ cpu15: cpu15@20300 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20300>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD15>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD15>, <&scmi_perf 2>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER2_C4>;
 			next-level-cache = <&l2_2>;
 		};
@@ -240,8 +240,8 @@ cpu16: cpu16@20400 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20400>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD16>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD16>, <&scmi_perf 2>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER2_C4>;
 			next-level-cache = <&l2_2>;
 		};
@@ -251,8 +251,8 @@ cpu17: cpu17@20500 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20500>;
 			enable-method = "psci";
-			power-domains = <&CPU_PD17>;
-			power-domain-names = "psci";
+			power-domains = <&CPU_PD17>, <&scmi_perf 2>;
+			power-domain-names = "psci", "perf";
 			cpu-idle-states = <&CLUSTER2_C4>;
 			next-level-cache = <&l2_2>;
 		};
@@ -397,6 +397,21 @@ scm: scm {
 			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
+
+		scmi {
+			compatible = "arm,scmi";
+			mboxes = <&pdp0_mbox 0>, <&pdp0_mbox 1>;
+			mbox-names = "tx", "rx";
+			shmem = <&cpu_scp_lpri1>, <&cpu_scp_lpri0>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_perf: protocol@13 {
+				reg = <0x13>;
+				#power-domain-cells = <1>;
+			};
+		};
 	};
 
 	reserved-memory {

-- 
2.34.1


