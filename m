Return-Path: <linux-arm-msm+bounces-74956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8D5B9DAC5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84C4317FAE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22CE62EBDE0;
	Thu, 25 Sep 2025 06:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CP5MHwAs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64782E8E08
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782027; cv=none; b=CEs2E8MIB9VMewGNZEahy/LpOBWPHBZklGDNOUU29wa+e/mA3R0tlFJzPzGqsl7M98hsfeE/H1dD5fUE4mJ/3YImTcrP21VYqPLv4Vx/GPaigUPuxlZH6xTw+YayouV7RSP83fhm/PPiPrLz7I40Lw37XfpX/aTB/QxVAyLTxB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782027; c=relaxed/simple;
	bh=fElO3EF9R19NDeX+BG2YF39Vf8D4oJXDjBMGCwiMl4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MXRk2FYgV/TC6/iXp+cUq+ut4s2qwDJ05DAx7pJXfFL/5cVhqjXnVyLS6c27yJ0owp05px6UCrqP7JTRB6Ol0Zl9yGj2uk+3CNG4XdLRx5CALwAwWBx1SjpVdEuYF79MaTY2OBxqTY9Fl84PSADbThaeRLnaw6VZE8gJlvo0V7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CP5MHwAs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0JoLZ017470
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3WpjX+QZdNG8Jvf4TjOewFLRT3V458PXcjB0O7zeIxY=; b=CP5MHwAs+Khkwx0Q
	cexV0XhC+MbenEekz++KjV2yYi8RB5ZE4vf8zJjbn9ZexVQw1qHs5AuNroM0DeUx
	d3BNuXum+TUoh7pDJt1NwIs8LgByDsqNvS5TUxn7yxSRlvCcnL8U/YeoYl/Nwpxj
	DpdkYGiEoRLPGf5cVU9by04qnJhkdYuGqYuDGsARCyoVjRU4awIsuBq1KRSvpDxC
	L7PSDHQXZxF/lhKjwRsuNvRPAdSKGvYZB5w4mCGV0EPp9AnaZJU0250C0OZ4cAox
	qINTEPEYGaC8y3yQUYpQv7SRtMsacb69Tb+qReZpUc5q1qE3R3ogM8QP3bQdoVSK
	8V5+CQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk0c6e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-272ed8c106eso4390715ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782023; x=1759386823;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3WpjX+QZdNG8Jvf4TjOewFLRT3V458PXcjB0O7zeIxY=;
        b=SGYstC1D8oaVvq7ajPHM9aH/cgT/sKYUhh2udZadw3BkEmgh3rF7uilYi0khm4n3hd
         lZ+U5+opsPgDlKll9pW9E0Flj3iwPcuRTIs/pSf8aqdD70FAfDZlERm0bGAF4T2vMAzO
         z0okv23m7mivPbQlmJfr3D1qPeH985hTIdBU+EF0sUXzJpCrMdLrT0QSKjk0xj4dE9uz
         iLLmCryBGVP8joJPeEp3wNOx9XtyeEYSZ3pXiTKjeWXZByYR5DPJV8fZnxlGN059ao5x
         1zfzro0BA6IvUOYA3uYL+LiV/k1F81nxy27TcR9FndNQ+2qxIwpvzUVOGBV8R3byTOom
         USIw==
X-Gm-Message-State: AOJu0YxWVdPgmTxjGAQjZrH/1w6RgdQnFjq+5qLdAmZyEWFKHsfLiX/O
	OsfjIoVRwJ3FZP0cihgKETzZLOqNOMUUytDD+6ifxh8W5nSQDx7IcoxiE8MieyGG6Zh8nU25Liu
	n475kTaazOGb9U+9mk4ks+HWznrpLQctX2Ont/yeVc6mF8Em0Lq1xDnHQaXuHJgBj+NCM
X-Gm-Gg: ASbGnctRkADlFy1RAUXUXW0cHLUPOda9QYJQlSP5nIZjWejoRHfQn9ZyF+lAG5N99jw
	ZyUt6OFD1rKfSpamLK4ncUr/njMSXnC6XWuX7tyGiUidi0aRTAmcfG7BZ/TWYhCwRRwKlOWzTtQ
	meqp86HRJWMogHhyFfzb54LO+gkR9xCe5MwKZcGs9aqzQOmqSmzbNixGUVoj5xc4dNdyyCvLXu8
	NOJXPX6+RTE6zOIjQP9xScjVnz37UCJNKjHp/jcwLLtiSEZz0jLchhpvdZkal0phs2iLLLv1tCy
	gKsABKOu9lkDCGfSU/PY8ACrEIOk8nWmU1YDMa1PgbRauTYM1eEMDcx+g96wezjHqnWC87vEBSZ
	DO66xIjFZx/B3jbxLgzzXYQEMz2YiGNNFu7QrsqrwAuStlaoyHQagFecZSYpH
X-Received: by 2002:a17:903:3847:b0:269:a75f:e9d5 with SMTP id d9443c01a7336-27ed4a96168mr32118955ad.42.1758782023119;
        Wed, 24 Sep 2025 23:33:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/rLnV166PB2nfOvkNzUURdaTx9x00dPd2J0KV43WuHEDm+FLOXC1UQ3gr41Q1F+zAb6X4nw==
X-Received: by 2002:a17:903:3847:b0:269:a75f:e9d5 with SMTP id d9443c01a7336-27ed4a96168mr32118715ad.42.1758782022658;
        Wed, 24 Sep 2025 23:33:42 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:33:42 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:15 +0530
Subject: [PATCH 07/24] arm64: dts: qcom: glymur: Enable cpu dvfs for CPU
 scaling
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-7-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: ss02K--q9diXPRLTODRpBT72FX4MH7Hz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfXwKBQaDiWA9a9
 iW6mKn8D3B/mmv4kpY1To3dmFNZgerRQqgNm72B1ov3epGJW0xCaG8fhlFLY4OogqO6eeD4cIwR
 kOhPCth1nBooPMM2yz6ISb1klZ0UlL/+8j5BP67X6iZGZW+e1Z4YNAf5jjhn+w3yOLRJVWxxwwy
 idcDb9YmQ/Chwys366JofNNq8PwJuwiiWsWn1rYx3EaoXVWqh4cbeqDv+pWvlcV8M45ES3Cdw1L
 00Qh+Ez7/mqpPxi18N9GTL/LDOv9JoYEM8dYLmy6qxiwK0HupYFazvBkmr4+3bKLTayLVdIfwH2
 4XALUh8la/8LVhvi5y5ARMsUDL3Us1N5CdBEUGiQhxBYxcr3iudijQx5Sf7wQsucYVZcjH+0UMR
 lGXNiAZv
X-Proofpoint-GUID: ss02K--q9diXPRLTODRpBT72FX4MH7Hz
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4e248 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gdhpWjMKO13w-baniFsA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

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


