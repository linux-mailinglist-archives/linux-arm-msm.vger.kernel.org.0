Return-Path: <linux-arm-msm+bounces-74938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3850B9D9DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B99101BC3CCF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E5AF2EC57D;
	Thu, 25 Sep 2025 06:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSBLA5FV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B3D2EC55E
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781785; cv=none; b=raJRJfInZqjMy+Ts76UeKcMN4fmuv/HGv0Liq8KTWE4biZ20k7GvI5QfG8IHV595r7aQDV2Rt8mF4ARRXNqpp+SDje14QD85DnzD6716rB+C7yq2bViwF2NYV8IINv8VImwbTsm9PhtnWQAeBD34idTtlzLXiI2RVtv75/tp/Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781785; c=relaxed/simple;
	bh=OV/aaJzgqGLB3+eDxXdtVetaq7X7QyfyLBw2k9nuYD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oKmVg6Aoo5nUdmndiONYjBH5zZeKHb4vani9/ohTWvEiSUpxWSp+veweKleb9nVtkRYfRN/bMMpL6xLDBk9dXIFc9Fb7ODelJPHl/wrh+kptb58FrJhNBvc4tyVyDdF89eH/+W2jCcNwHrLaVKBgdmrKnLumlVDeNMMyCWwGkZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSBLA5FV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P4aNto027602
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k69QmMaDJytSlpNex0Fnt5aK4VFtTpI8VjRIFrBY1m4=; b=aSBLA5FV3TyJ4zm9
	OfX7C/kXrhMdfiSrhOoExIkF3KseaFR9db5egXYQNXxoFHpGkyyvZy9N5L+zf6Pc
	GFVpe2HpQnFWXPZRgSCACZSdgJKBm4+tfSZsJLAJxo5R83dtiEJKyrRBgQq8GJMx
	O+WtKYXVs//QZeRtGWcOU/GBCKZHrz9SHwlzaAZN61cHFiwbxQ5OIMupm7cTCLsM
	btWpJOZNEWw+LdaClJWf1d3d9oP87InXC8g1snlL4O5NmOtk2qpVq30N6s7Hvkxo
	ZJRXrXeb5k10TqDckI2fjsvt7g7f1bFli/a/nDJwgsdErA1elsHK1bn0flcJn4iS
	AGUjnw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49cxup08bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:43 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b5516e33800so830025a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781782; x=1759386582;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k69QmMaDJytSlpNex0Fnt5aK4VFtTpI8VjRIFrBY1m4=;
        b=tE7hHV1SCc/hqoW8RTA2dHop9+7XolaUh+GsGtJu9jqlkjouyWEKYY0dAMMiGr5cGL
         vNa5cRPOjqgf14M6CpTeUS9PfBpBRqfSkNcicUh9FME85XyAGoKCnXeENMR3OuQa41ve
         XyxPQwAEnSYxPXUehwM69myCn4E7fzazde8mIU6BwNmLiIqlYzU9zBTwqXxhbxZ7IqK+
         U6sr9oDKTSQpqA5w4qnj9j8+u+gIWSgTVO8fTlcOx5HDuJpMkRfU/tECkYSuKUkRGTpu
         Laf51lvliqxtxIIyEoCGYwCwUDSSiThkE0WM576VczrgqGczmnTNuS9C0sdvIwm6o1JF
         Ul5w==
X-Gm-Message-State: AOJu0YyXmlJ6OLD3p70eBPvHyPRSrSkCzDhTy5aD9DlqfnAz88iuhmQT
	z2sJzCRuZVqlevFlLnolgSSe8mmQxMzWLkJcR/u2WvLG+bBcQ8NHYpnTxbZf3QwBLaS/ub6n1VR
	9hdpikSUbZ4dpzGqHsyP9k79NYP143GfnkjH4LWHB+l1BxOtKdOw2qE+CSnMbrY0VRNc56Y7y/6
	q7
X-Gm-Gg: ASbGnctBBLQznJufKshliN2TrHNc/seH68c/DmjFsgyLiFHVQHpA61v41hlOpXz4nOp
	DNCNfl5fLQXh4yzSokdAGSCxY84+yGVLxm/I855u8uxQoITLNO9oN8ektG1U7UxM40KHdZ3/UcL
	MbOTDr5fQjD7BKsEkAe44HiROZBEDZKRl8zE0VwJGFh56zWkdCiihCRvWQ35WrXjb+vEcHEN7//
	PO0oJyXSbxLdMbnPtu2LsqHpDW4LFtu2qNIZgD1yJNbwrAvLiOUhErJtwYDCirnba+m8FCAgGR0
	kD8Gh34NjlmsyXeN0yMboKiwzjAHBgQGIQ2YhwwC9CmCoj05Mi3we44PlPfk1GjOMBnf130+wzv
	qSj3fHcRV6zYxkhN27nNuEWR0y927dJKZJYnEviksOHjjpTasK8NdDfK0ivAJ
X-Received: by 2002:a05:6a20:7347:b0:2b7:949d:63da with SMTP id adf61e73a8af0-2e7c79c5b05mr2873388637.18.1758781782104;
        Wed, 24 Sep 2025 23:29:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEm9E38Wgj5S9u3TjDbt+GZyj5st0rxcpU/9nw8YpZ3MxL8wwmeQznljBNiTQAgW5yYm4HrQ==
X-Received: by 2002:a05:6a20:7347:b0:2b7:949d:63da with SMTP id adf61e73a8af0-2e7c79c5b05mr2873352637.18.1758781781689;
        Wed, 24 Sep 2025 23:29:41 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:29:41 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:20 +0530
Subject: [PATCH v2 14/24] arm64: dts: qcom: Update the pmh0110.dtsi for
 Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-14-8e1533a58d2d@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=B4a50PtM c=1 sm=1 tr=0 ts=68d4e157 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EOUZnPL1Ke5HISHMaDUA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDA0MiBTYWx0ZWRfX8HGed4GXpbNl
 hALm9qyEHE3UcTNii7KOpOihOWP4OGi90NV8Uyty6ghK2TPrnPnyfw+isSm9jRqoihxz16Hkrml
 XXnuoKOYqrfFobxCmr+OuQLcvDgkVGQvljy5gjO02FfMko3kPXr0EcHUNZ30Gb3TP6wMO0J0wrT
 VOdgdnQ6BoLBbISzi0F248SjGZWe+NHdG4F6DMUJ0MaVTWOKOhcZEywXt6G27vIXjdwqYUEBV+E
 IsU4x1qcbydsgHa3ZO9rTzdY/WEj/7TCdYmQf4y3AvdEMhWd3Bh0vsldoDSxLA8zkfcT5p4seZU
 sfYqPURVDHNUE1vqyr61XWCvYYWUQFc5w3wMjpOfzua2yAj1WeYPeGJE6O6eWc1AzAlX90QyXVF
 wse6n4CI
X-Proofpoint-GUID: 71SB9RG9_OID3z1mqEwv3X8F1vHP5zyn
X-Proofpoint-ORIG-GUID: 71SB9RG9_OID3z1mqEwv3X8F1vHP5zyn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509250042

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Add multiple instance of PMH0110 DT node, one for each assigned
SID for this PMIC on the spmi_bus0 and spmi_bus1 on the Glymur
CRD.

Take care to avoid compilation issue with the existing nodes by
gaurding each PMH0110 nodes with `#ifdef` for its corresponding
SID macro. So that only the nodes which have the their SID macro
defined are the only ones picked for compilation.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0110.dtsi | 66 ++++++++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmh0110.dtsi b/arch/arm64/boot/dts/qcom/pmh0110.dtsi
index b99c33cba8860f1852231db33a127646c08c1e23..4a5c66e5c9fbc35cedb67601f4568844dc41fbea 100644
--- a/arch/arm64/boot/dts/qcom/pmh0110.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0110.dtsi
@@ -7,6 +7,8 @@
 #include <dt-bindings/spmi/spmi.h>
 
 &spmi_bus0 {
+
+#ifdef PMH0110_D_E0_SID
 	pmh0110_d_e0: pmic@PMH0110_D_E0_SID {
 		compatible = "qcom,pmh0110", "qcom,spmi-pmic";
 		reg = <PMH0110_D_E0_SID SPMI_USID>;
@@ -31,13 +33,14 @@ pmh0110_d_e0_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 	};
+#endif
 
+#ifdef PMH0110_F_E0_SID
 	pmh0110_f_e0: pmic@PMH0110_F_E0_SID {
 		compatible = "qcom,pmh0110", "qcom,spmi-pmic";
 		reg = <PMH0110_F_E0_SID SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		status = "disabled";
 
 		pmh0110_f_e0_temp_alarm: temp-alarm@a00 {
 			compatible = "qcom,spmi-temp-alarm";
@@ -56,7 +59,9 @@ pmh0110_f_e0_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 	};
+#endif
 
+#ifdef PMH0110_G_E0_SID
 	pmh0110_g_e0: pmic@PMH0110_G_E0_SID {
 		compatible = "qcom,pmh0110", "qcom,spmi-pmic";
 		reg = <PMH0110_G_E0_SID SPMI_USID>;
@@ -81,7 +86,36 @@ pmh0110_g_e0_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 	};
+#endif
+
+#ifdef PMH0110_H_E0_SID
+	pmh0110_h_e0: pmic@PMH0110_H_E0_SID {
+		compatible = "qcom,pmh0110", "qcom,spmi-pmic";
+		reg = <PMH0110_H_E0_SID SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+
+		pmh0110_h_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <PMH0110_H_E0_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0110_h_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmh0110-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0110_h_e0_gpios 0 0 14>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+#endif
 
+#ifdef PMH0110_I_E0_SID
 	pmh0110_i_e0: pmic@PMH0110_I_E0_SID {
 		compatible = "qcom,pmh0110", "qcom,spmi-pmic";
 		reg = <PMH0110_I_E0_SID SPMI_USID>;
@@ -106,4 +140,34 @@ pmh0110_i_e0_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 	};
+#endif
+};
+
+&spmi_bus1 {
+#ifdef PMH0110_F_E1_SID
+	pmh0110_f_e1: pmic@PMH0110_F_E1_SID {
+		compatible = "qcom,pmh0110", "qcom,spmi-pmic";
+		reg = <PMH0110_F_E1_SID SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+
+		pmh0110_f_e1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <PMH0110_F_E1_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0110_f_e1_gpios: gpio@8800 {
+			compatible = "qcom,pmh0110-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0110_f_e1_gpios 0 0 14>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+#endif
 };

-- 
2.34.1


