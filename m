Return-Path: <linux-arm-msm+bounces-74934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 214EAB9D9AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:31:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 484807B0836
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345462EB87E;
	Thu, 25 Sep 2025 06:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJ0ztLTd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2572EB863
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781775; cv=none; b=pGdWKLIgivCEd2uhNUNDLOjlH0nhwYjBiyq/yMxBNRk9XEUept7uyVcBgEvZUfCHJ699g8cYo0Jytm3y/fdGRrGKcOL5nWmy41ldGkUPgwzQ0JYL/CEawHaF3ow/O2twozBGohygpceS5YVVd4Rap3SQdxg+GNZkm5Xv+kLQCtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781775; c=relaxed/simple;
	bh=sKIpQJiz5n+iJRMJnnf9m2DoIPG33elp5oBZ4OmiH7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o4yX/78/evCds9OZ9OBnzqRDaPmx5I3vuhXcq9ZjFvjRbbgkR1aU/i4Zd0LrAV6lPH8VaEk+QA0yZkaVa6lGFAnPzRC30el1ytIhyMLCUKFVHNzAN0VyT878LstVPHuotE+OQCje5OIkAccaQkxDzsDiwAKCLzolMih8xaLUrK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJ0ztLTd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P0qiHl001992
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LwMildERMeP5s/2LAPgO3c6kJVjWS2uLmJeeFeaZY8A=; b=OJ0ztLTdvBVxbVJH
	+2/eFGdd/yVCjx1JinzfQhfAXebLG/NF/EWili/sKLKOS7yBKgHecaOFsFkAJW/8
	dzDxmblKGVnb5Oye8UjNG1iwWUXsb5uBjbNA/qjCqAXQ7PIlc7ptKemOFSjs5UZD
	QuOtiq6MwCWYI7F70U6DFpRqKA4vmaj+52C6b/DB6qDaB6T9JLxrFdQDGnPyV8Li
	5ZFX6xTvlieXtFv9Qw2gzQAKvf4ySRixNgUMjfj1xTPfRBbsKXupPkuUVx1xWrsI
	CM+e0M8l5OuspfNVLnI0R0HklteyFwkln/zuf4/pQVVkUhYrjV6rwQqRj9iazqY0
	PZ+0/A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98q0f5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-780fdbbdd20so630547b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781770; x=1759386570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwMildERMeP5s/2LAPgO3c6kJVjWS2uLmJeeFeaZY8A=;
        b=RNeCxKLOODXsTCNqhjbAamCO7CZD+VIvAQ2mWyxL5PO00YuntYxHsFGf0sZzpI+CfR
         PR1GwR0MlOONmPaUgCWUNv6AjdOv4caR6nQP2AEtMfwP45pypGct49vX2oiO6hWiEO/K
         qTosmsVptXi0pv2+WYiaS6O9OCPdpnep+URRyqRVf1uftX+Uz096evo0KZ6Gzd6oI9zd
         vj+H0FafvrFth0FEJpP5vutATbsesEhMnKkfsBEekEQcbcO6u6FPrIvKTszn1caOpqs+
         7qeKBTWTB2+uItqUHzW2+lUhJBtKoLuvu0v5oPTnOkv4m261JBcQxK/fU7MUoZz3QAOu
         zGaA==
X-Gm-Message-State: AOJu0Ywqolkmp599RADWoJ2WqlPqm1/poq+eyCgU3bODUJfvuCX0LYoY
	oUpKl9bW49zj5wVZ95AukKMUnu3q1ERusgljtgXLRLfMlpuVvdbZ+BJGCbmHOPZeVJ4i9QdjNld
	L7kHXOCH/V4/h5sx4/FryAsrB7QuPBslnTtbK6EWAI9nss4gCZB8WwGjfSKPnTYVRcQa5APlJHs
	qj
X-Gm-Gg: ASbGncsst8zlBlbjs/Vf6M5Qs/hg9aeASUaS9yry8zaG/vErjaQMyc3AHZQhQnCAA2o
	+FkWvZ//GUApHXcK0eLZnwnNgvvn/OECSZuwgNZOSkLZsAZejbVqDn2ucTqfcR7i4XP/PRkN71g
	VixuCDOewFMg4iTYlxOto22cd9Rylq3HZrU38jnvpo50wLPDIE6aV5LMzYHnq+YWFLPKQ5qYu/f
	H8yb1cWpZyE+jrBRppnLg5KN0tJqIPX9kz3OB8zSJtUCagoYmz09Tf0riqo8XWihWA+u1PBfMCp
	3CSWsg1fkwoYHIweDdsV/mnYF5P7TXfFk+y6bLMT5altswlO8B0XsL16LPv4OVEpNfPerYfQ+CG
	qaqgW1gjONxOJgT+9agMBsjGv6HcBhjFs37eC3CNyqTyxE+ecVcUpQ+F1W4/V
X-Received: by 2002:a05:6a00:92aa:b0:780:7bb:1c1c with SMTP id d2e1a72fcca58-780fcefe433mr2797814b3a.31.1758781769700;
        Wed, 24 Sep 2025 23:29:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSS6IK6n8mJg0t3jzwZnpeW/iAxvGyyHynBSGHvywzCy+qTUTCVekLpU5s1BhtEPlCXGcp/A==
X-Received: by 2002:a05:6a00:92aa:b0:780:7bb:1c1c with SMTP id d2e1a72fcca58-780fcefe433mr2797792b3a.31.1758781769288;
        Wed, 24 Sep 2025 23:29:29 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:29:28 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:16 +0530
Subject: [PATCH v2 10/24] arm64: dts: qcom: glymur: Add SPMI PMIC arbiter
 device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-10-8e1533a58d2d@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v2-0-8e1533a58d2d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: yj1Om1y3vCxpocMvG3HeuCeVc-luNs0G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfXwIeqWjuPztFA
 mgdRqubsq1IwQz2G1gBx+xJ1PKzMndKwsI+FWI38f+xlBwCg4PYwHvgK/R1u2fU431Kgrd+uDIg
 t47XO7FUnbxtrw2ts1hHEzr45lY/OBW2JvSIc8Q/cIlEv+7S5GrP9/wZGNdLIqvDGtbRFGo2q39
 wnYqv1n6aePW89zfh9qD9nSp/G2gZmlagxK1pu67LMgdmWp/Gc2BrunoiaDyb4Mk35RbXr/Szk0
 PZDFyIFV+6wc/rINOZZaOlnmX9jMq5shj29a0NppkgWwhJAbOujzVErDvvjDTb7ED3O5MrefRJv
 OzhewOf7c2xhQ4gAYArGMWcNpfQe/T6RoTvh8cdYLl8fiGgrV1SVinhwjJosP11Z/NI2hFLUSgZ
 v9mIUldR
X-Proofpoint-ORIG-GUID: yj1Om1y3vCxpocMvG3HeuCeVc-luNs0G
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d4e14b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=fj32sBe4WaP-u41FRDUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

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


