Return-Path: <linux-arm-msm+bounces-74928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BACF7B9D984
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:30:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC7531882759
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E232C2EA16A;
	Thu, 25 Sep 2025 06:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Snp8mKSv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA65A2EA15C
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781758; cv=none; b=cUb/dKe3WCmWAgMydES6XSLSbYfG3kfjHcYxzpOEGmoMb705394KRyyFWHGx1iqV9AaIXhLPf2dAJrNDVlgxtvyTHc0UoiSEzvFPvT+/JwtCznCYsjZklN2Oa0INNrdK0W+rRNydmkDKPtLyF2Tb57BJcyYPxuj/eiXx57RT9yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781758; c=relaxed/simple;
	bh=0ByBaAtNUicSKEoYgTLZP7f79bhHaD+AnUFmHZjk2hM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aBgI/yHKNkPXWINSwiJTX0nsMciaBBMKqk/oTbnXn2Ze7Txn1j0epGSOCAVmHc3VOdMyUVGynFVUEcIoxESnOndET0IH84EZecrQiN0IyLfTj31Zj2HMgJkMsxgaOA5+ZFOUZjsVqe8gfBVs3/GM0aIqaC4msZe7zur3GmAAaLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Snp8mKSv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0Kf9Q024042
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y85dl0qhn/qWZkruGbGchDHEq8jegQjlHb886r0PTP8=; b=Snp8mKSvZc0Sn0Yt
	APTZjZz03aCzoT+bBZFlEhwVUvuKsabdBV8o1tPkR6/kRHJ9CALdPPWRmWkR27qP
	D3xo+Ywb0WHqz+JogloCa7PWF9V6zDybVrgxBaHBWFYCltH1rBFMtEhSqiwkbpZs
	L2CtZ0hazPpUvR8hxf4prtgF4FclxrxlF4YEeU7H4nhhxh++SFkth4qVmtZR+J5d
	JtR385ZG1zVpFaAtvg9uGzf47QqussUx7rXUbiL+TcBC/AX5Wp1Cejy408bQKMkJ
	xMSWeYKsAr5xZNIyNykFupaA9+4+pHZ6Bgyb8RvC0qX1yNu8DzlopEiLIaUZv+Sl
	ZqL6Rw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0e1tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b5535902495so540991a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781754; x=1759386554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y85dl0qhn/qWZkruGbGchDHEq8jegQjlHb886r0PTP8=;
        b=oAefJzsIMITueHo5Yp55YF3N2bchKJ6k7y9qtwOB6jZxVsmEpYn2FMc3GAYtIMsri+
         +sF4Izp0tgBX3l36EIy5p16oC02ooiHlqu3NVZIJLX8jSkKL0Rh7lA/C6p7BzQIP5mAG
         9k3s2xBeF/fxjMBWGmN6+fBXKo8/Ol0wyxL8lcv/z9j4SsM+ertZ9Bwc8+xq7y/Q6Ah4
         L3gBOoCCmMBLCy4VUrGkZnkiGPqF+7RO6Dgg9VDcsevklH7Fd4N/b/nW9FhhTfQhh3IS
         sXmkbQDNLAwhNszXOPxTCT0ELP49QCd30sIm/A0pJkF0S967h2ULWND10rvRFYJDgRMW
         0YkQ==
X-Gm-Message-State: AOJu0Yy9en4rSRCdet0ut0uRkDUOFy/kLFAxbC2y3o5RR/maM/r2zBIn
	J9OiBr6bn4vHzx+MDGEfy0zXkOju7UbHJupKlKKCBqw8l/pvXSuq2/3HjvQydhxWUA7kQ20ITOk
	FKl3fSt9tdA9Q7eNhF3UxPzvnLT4aDDS0INgPSAauZO1k4cUKWYPrCg0KqUI/or3KSeWQ+Kbc+S
	iP
X-Gm-Gg: ASbGncubDod8kU4+pjMpUuhtNAHtD9qO/vyC+wentqCqbNUz5tlDPMjPPt6PQfgNM/u
	ewxdOauDtqFkExlCkaKLRji66ixtjxJ1KuCKclKmzNbe1RqB6R8WSqNnt+dc+xFYqb/1JKg75VD
	dRMF71aqRxYUyzNSKKvg7UGKjUXEaCkrw8lBZIwlB1X7cdhmw1m5n3LHa+NQcw5t3uxu9ARViyB
	URIBkxtsNQMaJ5DdABl5+kfgkQ8rZaiCN17f2vxADMd+K8F/O/5QxYM6Qnl8JhASvojGLXP5FJd
	EtaOO+7puFnU/yBHvhwQ/5Wa3cb83IK+obrjhscRGBEZGWZKh6Lhu0UpmP0BPyB7LNPuXEHcr+a
	+8AF6udCt3XnNSn9M6narWKu+Vi+kh1ashSrWaonf6sck2xX1ghe4sN1CVs29
X-Received: by 2002:a05:6a20:158d:b0:2bd:2798:7ae7 with SMTP id adf61e73a8af0-2e7cdda05e1mr2585812637.31.1758781753866;
        Wed, 24 Sep 2025 23:29:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHX/ccJ7YWOrNdd9EFOtAWca/CkmiRBUYeVcZ/2QlVZ57BWXQoAaqP3D02wLFLmKoyfyuWuw==
X-Received: by 2002:a05:6a20:158d:b0:2bd:2798:7ae7 with SMTP id adf61e73a8af0-2e7cdda05e1mr2585775637.31.1758781753385;
        Wed, 24 Sep 2025 23:29:13 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:29:13 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:11 +0530
Subject: [PATCH v2 05/24] arm64: dts: qcom: glymur: Add cpu idle states
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-5-8e1533a58d2d@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4e13b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=ITxuB3Ybzs-vxhr1UFYA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: JaKfQ0s3IqdOk15xEaNMpn6e9c_gYpz3
X-Proofpoint-ORIG-GUID: JaKfQ0s3IqdOk15xEaNMpn6e9c_gYpz3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfX7AdwWwl5N2/7
 CfG5oAY9FEsK1oiXX6g/9gdlys+TomvC5LXRlbhS11ccD3NqpB7MvfYZ63PUqepJlGHoaS91UPV
 f0lUQxGrkZQJfVI7lOoZEeKkphIZv0l9oNcxdtozaMPvWPwoQnIJva3AR6yv26NvsVLZHJYcOES
 /2T1xNNsow760SB7leIDmfRzyG6oSAq/OsvmrRCdyX2Px2kGIItkdSM1p7fpxqJU/SaveQd/LeL
 xwd3RcTkFM2zdY6Ba0nLHGBBThfHGuPy/yd4X0bvv6H5nMcjQBY+kClR7gue8Qbqttny7IkcGsf
 BKi7DyxY70Zx47zAs14ereNhG5KA2O8Zp0Ws8zEA0QyiYISf7y6g/CDahLdo+Z5E/WdFoAtqdvJ
 0XIKmewn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

Add CPU power domains

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 235 +++++++++++++++++++++++++++++++++++
 1 file changed, 235 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 8674465b22707207523caa8ad635d95a3396497a..66a548400c720474cde8a8b82ee686be507a795f 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -46,6 +46,9 @@ cpu0: cpu0@0 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD0>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER0_C4>;
 			next-level-cache = <&l2_0>;
 
 			l2_0: l2-cache {
@@ -60,6 +63,9 @@ cpu1: cpu1@100 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD1>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER0_C4>;
 			next-level-cache = <&l2_0>;
 		};
 
@@ -68,6 +74,9 @@ cpu2: cpu2@200 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD2>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER0_C4>;
 			next-level-cache = <&l2_0>;
 		};
 
@@ -76,6 +85,9 @@ cpu3: cpu3@300 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD3>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER0_C4>;
 			next-level-cache = <&l2_0>;
 		};
 
@@ -84,6 +96,9 @@ cpu4: cpu4@400 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x400>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD4>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER0_C4>;
 			next-level-cache = <&l2_0>;
 		};
 
@@ -92,6 +107,9 @@ cpu5: cpu5@500 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x500>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD5>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER0_C4>;
 			next-level-cache = <&l2_0>;
 		};
 
@@ -100,6 +118,9 @@ cpu6: cpu6@10000 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10000>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD6>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER1_C4>;
 			next-level-cache = <&l2_1>;
 
 			l2_1: l2-cache {
@@ -114,6 +135,9 @@ cpu7: cpu7@10100 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10100>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD7>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER1_C4>;
 			next-level-cache = <&l2_1>;
 		};
 
@@ -122,6 +146,9 @@ cpu8: cpu8@10200 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10200>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD8>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER1_C4>;
 			next-level-cache = <&l2_1>;
 		};
 
@@ -130,6 +157,9 @@ cpu9: cpu9@10300 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10300>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD9>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER1_C4>;
 			next-level-cache = <&l2_1>;
 		};
 
@@ -138,6 +168,9 @@ cpu10: cpu10@10400 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10400>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD10>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER1_C4>;
 			next-level-cache = <&l2_1>;
 		};
 
@@ -146,6 +179,9 @@ cpu11: cpu11@10500 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x10500>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD11>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER1_C4>;
 			next-level-cache = <&l2_1>;
 		};
 
@@ -154,6 +190,9 @@ cpu12: cpu12@20000 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20000>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD12>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER2_C4>;
 			next-level-cache = <&l2_2>;
 
 			l2_2: l2-cache {
@@ -168,6 +207,9 @@ cpu13: cpu13@20100 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20100>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD13>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER2_C4>;
 			next-level-cache = <&l2_2>;
 		};
 
@@ -176,6 +218,9 @@ cpu14: cpu14@20200 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20200>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD14>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER2_C4>;
 			next-level-cache = <&l2_2>;
 		};
 
@@ -184,6 +229,9 @@ cpu15: cpu15@20300 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20300>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD15>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER2_C4>;
 			next-level-cache = <&l2_2>;
 		};
 
@@ -192,6 +240,9 @@ cpu16: cpu16@20400 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20400>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD16>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER2_C4>;
 			next-level-cache = <&l2_2>;
 		};
 
@@ -200,8 +251,78 @@ cpu17: cpu17@20500 {
 			compatible = "qcom,oryon";
 			reg = <0x0 0x20500>;
 			enable-method = "psci";
+			power-domains = <&CPU_PD17>;
+			power-domain-names = "psci";
+			cpu-idle-states = <&CLUSTER2_C4>;
 			next-level-cache = <&l2_2>;
 		};
+
+		idle-states {
+			entry-method = "psci";
+
+			CLUSTER0_C4: cpu-sleep-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "ret";
+				arm,psci-suspend-param = <0x00000004>;
+				entry-latency-us = <180>;
+				exit-latency-us = <320>;
+				min-residency-us = <1000>;
+			};
+
+			CLUSTER1_C4: cpu-sleep-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "ret";
+				arm,psci-suspend-param = <0x00000004>;
+				entry-latency-us = <180>;
+				exit-latency-us = <320>;
+				min-residency-us = <1000>;
+			};
+
+			CLUSTER2_C4: cpu-sleep-2 {
+				compatible = "arm,idle-state";
+				idle-state-name = "ret";
+				arm,psci-suspend-param = <0x00000004>;
+				entry-latency-us = <180>;
+				exit-latency-us = <320>;
+				min-residency-us = <1000>;
+			};
+
+			cluster0_cl5: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				idle-state-name = "ret";
+				arm,psci-suspend-param = <0x01000054>;
+				entry-latency-us = <2000>;
+				exit-latency-us = <2000>;
+				min-residency-us = <9000>;
+			};
+
+			cluster1_cl5: cluster-sleep-1 {
+				compatible = "domain-idle-state";
+				idle-state-name = "ret";
+				arm,psci-suspend-param = <0x01000054>;
+				entry-latency-us = <2000>;
+				exit-latency-us = <2000>;
+				min-residency-us = <9000>;
+			};
+
+			cluster2_cl5: cluster-sleep-2 {
+				compatible = "domain-idle-state";
+				idle-state-name = "ret";
+				arm,psci-suspend-param = <0x01000054>;
+				entry-latency-us = <2000>;
+				exit-latency-us = <2000>;
+				min-residency-us = <9000>;
+			};
+
+			APSS_OFF: cluster-ss3 {
+				compatible = "domain-idle-state";
+				idle-state-name = "apps-pc";
+				entry-latency-us = <2800>;
+				exit-latency-us = <4400>;
+				min-residency-us = <10150>;
+				arm,psci-suspend-param = <0x0200C354>;
+			};
+		};
 	};
 
 	cpu-map {
@@ -669,6 +790,119 @@ pmu {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+
+		CPU_PD0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER0_PD>;
+		};
+
+		CPU_PD1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER0_PD>;
+		};
+
+		CPU_PD2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER0_PD>;
+		};
+
+		CPU_PD3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER0_PD>;
+		};
+
+		CPU_PD4: power-domain-cpu4 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER0_PD>;
+		};
+
+		CPU_PD5: power-domain-cpu5 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER0_PD>;
+		};
+
+		CPU_PD6: power-domain-cpu6 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER1_PD>;
+		};
+
+		CPU_PD7: power-domain-cpu7 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER1_PD>;
+		};
+
+		CPU_PD8: power-domain-cpu8 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER1_PD>;
+		};
+
+		CPU_PD9: power-domain-cpu9 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER1_PD>;
+		};
+
+		CPU_PD10: power-domain-cpu10 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER1_PD>;
+		};
+
+		CPU_PD11: power-domain-cpu11 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER1_PD>;
+		};
+
+		CPU_PD12: power-domain-cpu12 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER2_PD>;
+		};
+
+		CPU_PD13: power-domain-cpu13 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER2_PD>;
+		};
+
+		CPU_PD14: power-domain-cpu14 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER2_PD>;
+		};
+
+		CPU_PD15: power-domain-cpu15 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER2_PD>;
+		};
+
+		CPU_PD16: power-domain-cpu16 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER2_PD>;
+		};
+
+		CPU_PD17: power-domain-cpu17 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER2_PD>;
+		};
+
+		CLUSTER0_PD: power-domain-cpu-cluster0 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER3_PD>;
+			domain-idle-states = <&cluster0_cl5>;
+		};
+
+		CLUSTER1_PD: power-domain-cpu-cluster1 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER3_PD>;
+			domain-idle-states = <&cluster1_cl5>;
+		};
+
+		CLUSTER2_PD: power-domain-cpu-cluster2 {
+			#power-domain-cells = <0>;
+			power-domains = <&CLUSTER3_PD>;
+			domain-idle-states = <&cluster2_cl5>;
+		};
+
+		CLUSTER3_PD: power-domain-cpu-cluster3 {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&APSS_OFF>;
+		};
 	};
 
 	soc: soc@0 {
@@ -3927,6 +4161,7 @@ apps_rsc: rsc@18900000  {
 					  <SLEEP_TCS 3>,
 					  <WAKE_TCS 3>,
 					  <CONTROL_TCS 0>;
+			power-domains = <&CLUSTER3_PD>;
 
 			apps_bcm_voter: bcm-voter {
 				compatible = "qcom,bcm-voter";

-- 
2.34.1


