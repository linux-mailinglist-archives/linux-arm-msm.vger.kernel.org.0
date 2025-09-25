Return-Path: <linux-arm-msm+bounces-74959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61814B9DAD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D53A3BA80F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB1A2EFDB0;
	Thu, 25 Sep 2025 06:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Od/8hjz1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05AB52EF65B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758782035; cv=none; b=C6cf1ZlJiLj/xDRDLAbjDTgavcBq/4q3kfLnl3gdrNyq2r6Mj9vQ0rZclTIhwqtouf7R94yJ0LLNkJZ1cDjRLquS21/k0wgr1EYbP/fn1dp2/PngYg0XckxLiDKy3hMezVJJt0di435FgKPqcYitB1Tz94bAScMRUl3GBYrwVVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758782035; c=relaxed/simple;
	bh=sKIpQJiz5n+iJRMJnnf9m2DoIPG33elp5oBZ4OmiH7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=arw/vwL6eZwnxlqbH12QHRlZOUn+fy7bD+FG2iBniaD8wVyr8/y6lGrKALLZitpJH772tYetMd+Dkgyuret6CZPgSInrrtxIlgzyAQ3EZqkMwcCs7BcTmvZnF52HJtU24ZxbXsGL4Nfyfk+FNoMY+i6NYdxELappeT8GGB7TRnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Od/8hjz1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1T9B8029974
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LwMildERMeP5s/2LAPgO3c6kJVjWS2uLmJeeFeaZY8A=; b=Od/8hjz1gNy5qM5s
	fVdjsJFiDN3PPHSyTxFxolsoMNlcKxn8e5QJWDlMuZjJzsRulsRLFRDVS04cSvE3
	GrUdIRfwGAYktS1pAQ44/vzH1sCqCynKnrpXn+QZZCtAGHLXifEppCYl95mQiBlC
	p62Z6fV9U3GW4WNuVHPIw1YTY/bme4xnt19qxYQrbHr6NWaNfhidflIHN7bpbqtf
	Oxduj1GDvoJ1rlsGfv6u1VrV3vxE5QS3lvKtgyQ1ieRHMsNBuVAtramnsIYZqhvD
	p3symyND3YQQDkqv0qpCVg+1TzfJGXBfBKnLVrujIjGvxWPPy+45OPAgZxxpPuCT
	1O2Y4w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fpwum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:33:53 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-25bdf8126ceso10391655ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758782032; x=1759386832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwMildERMeP5s/2LAPgO3c6kJVjWS2uLmJeeFeaZY8A=;
        b=TRs/+/EY/U1eUwjgI/VnGosmdKbAa2C3KANbLkh3BHxtFQ9R2IXoXlhq6kwsBmp6pF
         F/jeTYZY6Bn4fZJASKw95Q2Xlf0/0ghRSYapNJ5VF5p6osy0r6dI4/hLTA7/lJ5JhFJ6
         JfCPIe8ejWsnuCV9SWqfkBux0Sx3EuJekkj9tJtQjxeWUbYye3EINCdNXRZ1PIO9++a6
         bE/pTE4kBdzuY4Rs0TLzgvKtnw78kiCDTZRPfvKqC1gJQ16l7mwbzfYp3GaDhIL1BjzO
         7VakOiB9odB3G719hZTx2+tUR5bgTNAStxc99WO7/yCbZ1XTzwq799bVCES2/tHozmLZ
         0pJg==
X-Gm-Message-State: AOJu0YyDtpkLbYcIXWz15b1AANbm+KRIAtd8SpDWcWt3nZ3b3jIc/5FU
	uUxkKxdg9EUZggf/C4TNgBHL8tCXdfSmBmOueczBGViHtOhP/QGiLolF/nmmlwasGkY91Wk1yGa
	Q8h+YvZW8OnqBx3VWSmFa31RivFUOgj41fOCrbVv+mbO8kG7G5PmP7NhcOla8Mjh9Wn2/
X-Gm-Gg: ASbGncun64yKScl7PT1k4W6t0976BUg+20cW24YDK3KsxvXq4GhL63+H5vYKq6z0qTs
	i95ZcfWLhKNUJKJNEVw5djF2lHQM8U3jAtBcfv2bQcSdbN7OT2pbL8kwfAaoL4tokLyNo95CnBs
	K4ku/AIcYHQKnEcmU6tY7hp2mIf2fZBXnF6xBYgFVTXoHtGlPMNEPkHPcnx44V4j+8dx46TwWFX
	9mCXsH3f3NLE3ROzJjsEVunFslmoceIeLjGaKMGZkfm0LwgOpRc3YD6NYWxw4RItgHigui1gErs
	+dMRvfdEX3z3PiIcwUGOKjVbM1JB5JEbgs50cMBt3zZjp/J8hH1ETD3NEMe/9IHLUyroLIUIiJ7
	r9TFRLm3Q0286TrZLwFDrcXrmScum5kNcy+aFewAhOlVC7fTW9a/YzchABZ8J
X-Received: by 2002:a17:902:e88d:b0:272:f9c3:31f7 with SMTP id d9443c01a7336-27ed4a5e907mr21538025ad.50.1758782032516;
        Wed, 24 Sep 2025 23:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy9xf+4ZfODJwxxZSZfr51YdmBTrmJhyNT7pD8G9hsp0frJmhp6gtCuPlJmDRkAV6whVx4pw==
X-Received: by 2002:a17:902:e88d:b0:272:f9c3:31f7 with SMTP id d9443c01a7336-27ed4a5e907mr21537815ad.50.1758782032097;
        Wed, 24 Sep 2025 23:33:52 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed671732asm13793515ad.49.2025.09.24.23.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:33:51 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:02:18 +0530
Subject: [PATCH 10/24] arm64: dts: qcom: glymur: Add SPMI PMIC arbiter
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v1-10-24b601bbecc0@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: U4Y9B8dibmgao-CZVQ7hCinvGaIzyqfZ
X-Proofpoint-GUID: U4Y9B8dibmgao-CZVQ7hCinvGaIzyqfZ
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d4e251 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=fj32sBe4WaP-u41FRDUA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfXzvlYI1SBjRYl
 wOZZXffivzEDw8zHv/kdYaqoGOhlw2DjjK+WVeq6NFi28xvI20MXD2ZwnRDchN1/mmxHXKRtPrq
 827O4JQasDmL8SwmJQozB4aYK4BFwzTdAg8khrOZgH4IsxxncWX22w7EkL4m96GTYIGIPsjfIVJ
 PhXXDwr5WKO8AMcc0CbAF+sknhgg3JPW8ZD0Qp3L7Y0DtP6+OZPSneMusCpNfrqE0plVdpXcBDu
 3ZbQ68N0vEyBWe8N6BxyOCADev8dDlo34chA1sAJ2E1WerqHAid2rpEAtIFHkGU+VVzS30y6Agu
 NIalixp0EpPzFlhsU0uMAonvoyDCwQgbVQNbUs+i26ODqjw/4mFGfpmf5fLH9X55Si5QV32GCl4
 5GZWpyLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Add spmi-pmic-arb device for the SPMI PMIC arbiter found on
Glymur. It has three subnodes corresponding to the SPMI0,
SPMI1 & SPMI2 bus controllers.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 62 ++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 2632ef381687c2392f8fad0294901e33887ac4d3..e6e001485747785fd29c606773cba7793bbd2a5c 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2600,6 +2600,68 @@ sram@c30f000 {
 			reg = <0x0 0x0c30f000 0x0 0x400>;
 		};
 
+		pmic_arbiter: arbiter@c400000 {
+			compatible = "qcom,glymur-spmi-pmic-arb";
+			reg = <0x0 0x0c400000 0x0 0x00003000>,
+			      <0x0 0x0c900000 0x0 0x00400000>,
+			      <0x0 0x0c4c0000 0x0 0x00400000>,
+			      <0x0 0x0c403000 0x0 0x00008000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "chnl_map";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+
+			spmi_bus0: spmi@c426000 {
+				reg = <0x0 0x0c426000 0x0 0x00004000>,
+				      <0x0 0x0c8c0000 0x0 0x00010000>,
+				      <0x0 0x0c42a000 0x0 0x00008000>;
+				reg-names = "cnfg",
+					    "intr",
+					    "chnl_owner";
+				interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "periph_irq";
+				interrupt-controller;
+				#interrupt-cells = <4>;
+				#address-cells = <2>;
+				#size-cells = <0>;
+			};
+
+			spmi_bus1: spmi@c437000 {
+				reg = <0x0 0x0c437000 0x0 0x00004000>,
+				      <0x0 0x0c8d0000 0x0 0x00010000>,
+				      <0x0 0x0c43b000 0x0 0x00008000>;
+				reg-names = "cnfg",
+					    "intr",
+					    "chnl_owner";
+				interrupts-extended = <&pdc 3 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "periph_irq";
+				interrupt-controller;
+				#interrupt-cells = <4>;
+				#address-cells = <2>;
+				#size-cells = <0>;
+			};
+
+			spmi_bus2: spmi@c48000 {
+				reg = <0x0 0x0c448000 0x0 0x00004000>,
+				      <0x0 0x0c8e0000 0x0 0x00010000>,
+				      <0x0 0x0c44c000 0x0 0x00008000>;
+				reg-names = "cnfg",
+					    "intr",
+					    "chnl_owner";
+				interrupts-extended = <&pdc 72 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-names = "periph_irq";
+				interrupt-controller;
+				#interrupt-cells = <4>;
+				#address-cells = <2>;
+				#size-cells = <0>;
+			};
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,glymur-tlmm";
 			reg = <0x0 0x0f100000 0x0 0xf00000>;

-- 
2.34.1


