Return-Path: <linux-arm-msm+bounces-74937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A94D3B9D9CF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 08:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EDC8A7B1F4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 06:30:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8B092EC540;
	Thu, 25 Sep 2025 06:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EgReldz6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFBC2EC0A0
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758781782; cv=none; b=MlfxUPdV/vZ+Av8Yg8GfTIX0cYfTjmg+g96lt7gtM7nC5fs/C7dXbarV8HepBgAQEsEYd6ieplKzodQw4CZZrBPyT3+DNKlhK5LUXdc8XkYwZXrsoTBGqbkkX9QF6wGYzLYzRdYyPJzdKVCWKJOVsddMijOyx0hcCj3708JKSfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758781782; c=relaxed/simple;
	bh=RDdBDErVPYkb7kQ40hn7vPiyirE4liN5DKCLZ9h9OKY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csROPJwPW89OoTsMWkxrVlP5MsV3SrFRJeIYZvkpXIkGqAzDpWMtvdwWcERax17wTrEDq41cBbKLcS1gDQJmIqmuLZLs6YHCFqPww3zLbG5kT15TR8aCf5golcCJ3L+f8UI7OD6aC4am7uEdSbTcLgU99Xhqi+yOO2HepvQhCMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EgReldz6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1XKvj017430
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KPvdBTUqrNUETXTQBR3pTDVkd6wGbjn3B7OmL+KStu4=; b=EgReldz6efcWMask
	ym6ijDwS+Ja2+W+m9UBlsdcfQlxv3c91T/9AftNLKmI6eHuT8aAAQGI4rGk17inT
	C37YScNy0bwZUQkqxDZ9uq0y41scW6ei8YPEh9SnrmD42RLEfz0jijgTVanFug8/
	PuYTUkIWzTvHwmDeUTmGC/EAq7BS+4xBU52JUZDrcPUrDr93KvX/yD+5pYKWsc6j
	ieJO5amSXe6rAF5R7NIFP/DF+AKkGzGtV6JY5l7MUPyORqo3rWEuUHPE9NSa8E1h
	nf5JhjgRtdFQu1auPV7PQ9Qd4PRXYfS/PPvSY1tYZ7IG++y/Pt2ynXRdXlBSR0uf
	BAzafg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bhvk0brk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 06:29:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-780f9cc532bso589906b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758781779; x=1759386579;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KPvdBTUqrNUETXTQBR3pTDVkd6wGbjn3B7OmL+KStu4=;
        b=qgem0Ce9korIFzEf2mEocZNjj1eC8MskXd6STgFMIc2gntBl07Mj9Wq5jM34twAXtP
         SeW0vq7ZOfc/rJ4WvQe8ASC29g2pwrgXNRdSbsT+ctTWTCNFUDLxszx5BATeXkdKJ6Cp
         r6fYR458AD+Bg0LRtjtjPuZQr1Qlg4DD9gCBbhz8PJz7DtSSb4SkhfnnzlSQge1yx/QZ
         NroIhYXxT7Aw/8zYTVbYlSiIUADwamp3QBxZY4bQMw3r+IWTjOOnuna5uhTQe0tfB3gf
         j2+j5DndgrNhZmlXMo4aDmAT92SKeTLrcycIKBPauP5JDiLZa152acNqgnm+6kajSY6p
         kbBQ==
X-Gm-Message-State: AOJu0YyEaRusZeIHfx9Cbq1i9Mv16ZFOdobyELPXGIiZMjvK6cDvBQB3
	i1N6MvZlfpl/C3mkoDCgzsBfWsLOArFI0nDjBf3hUp6LK5v68RUxykO8pJRvSu80CZ5mLR8uLU3
	951dbYhnLGxvaQyyGA77NMpOVJYF6PEPry97irnWV4AR4JUvKIilj5TfizfMKmGS9i80QqfIk95
	X/
X-Gm-Gg: ASbGnctUlMJ9Z/iHiU0o3PmCva0TYDBw9S+Nl80UKBR9B8ra4T48dpnBcPsvBs5rzpT
	ZLXCDGW9t+PEeUimVxgfR+K2z6YBLL0j+h9xV0uVnHb1TSMYXqboGqvl1IYPpi8XvSF6ol6jU1w
	PzoL703gTWMNCQ3s/i+uQRuSvK3YcT8+FeycR1aNy7fL/G/S3IrNKXATxLF5hDkOOyNHCbELJ3v
	62W27+XoeWkF+LvECgNOzoE5t5L03zQngXGh2FUs7OMw7OsT+e5Lf8EYAk9AJr4wxdhYQ0F40nU
	sHcbVh2JhbsWv5QN4i4+6Evvde+nR3HgKW6ZOBJm3qNv+sqfH44OxgW10afse8Gi+JNtzSp5znY
	OZ9+b7lp+3uJNBD+k6VzjlFEESI1D8KAgkI1CBDrao5PFX13sf/Y++JczYe0c
X-Received: by 2002:a05:6a00:6ca3:b0:77f:1016:d47f with SMTP id d2e1a72fcca58-78100f3fbc6mr1594639b3a.8.1758781779069;
        Wed, 24 Sep 2025 23:29:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiJcVY8mgUCKJGRQ/chGcdmsCd6koRn194ynJqMHtAe0w2xw7zVi2y6zjFcHPP2JwBNE6LgQ==
X-Received: by 2002:a05:6a00:6ca3:b0:77f:1016:d47f with SMTP id d2e1a72fcca58-78100f3fbc6mr1594603b3a.8.1758781778616;
        Wed, 24 Sep 2025 23:29:38 -0700 (PDT)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810239136dsm952962b3a.5.2025.09.24.23.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 23:29:38 -0700 (PDT)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 11:58:19 +0530
Subject: [PATCH v2 13/24] arm64: dts: qcom: Update pmh0104 dtsi for Glymur
 CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-v3_glymur_introduction-v2-13-8e1533a58d2d@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: elCl94yzHO9ebSI63vjdJB_vDTRzFkrO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAxMSBTYWx0ZWRfX/J1/B+xFTgqI
 2o734N1YoDwc/HJEmt5GlqIf89sduMwo6tL5wqOH0k7eab+zC5sFU6NcZw4vMy5nTJmLl8gICVA
 G0jsAh3t9DsRiRh8k1PpBz+2cfkyPqiLbXzT+D6pyrbSvkivRIVfKvEk7NYUovVsqdmvAZ5WUAC
 8S1vxCaBi9GW5Np1ohq2Mtiv+4iIg/vy1mNKHBOhdxqE/dG/Xpa94Dlio8bPsOd05X7QbqobQEH
 SIZNDOFSw4GBxiOLyx6n6DRCSUYxy/iHKFdA2ZvnO91ESpSzKJ4SrgX7Gk9dA8NE4vv33FABgLX
 /DjwU3oenJ4kWI/ymwDDQs+y9OWoNaPYv29WgNEWuepIgDMcA+Pj+ASr7nMYi33ZRhHFiuJkZyf
 IcPBKr7p
X-Proofpoint-GUID: elCl94yzHO9ebSI63vjdJB_vDTRzFkrO
X-Authority-Analysis: v=2.4 cv=Csq/cm4D c=1 sm=1 tr=0 ts=68d4e154 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Bl1eJC4Zh2N44W0__HIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509230011

From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Update the pmh0104.dtsi to include multiple instances of PMH0104
DT nodes, one for each SID assigned to this PMIC on the spmi_bus0
and spmi_bus1 in Glymur CRD board.

Take care to avoid compilation issue with the existing nodes by
gaurding each PMH0104 nodes with `#ifdef` for its corresponding
SID macro. So that only the nodes which have the their SID macro
defined are the only ones picked for compilation.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0104.dtsi | 84 +++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0104.dtsi b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
index f5393fdebe957ea0caf4bbc16117374b4759bda3..d3ea7486d842ec813a79268fc1466e1513426d78 100644
--- a/arch/arm64/boot/dts/qcom/pmh0104.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0104.dtsi
@@ -6,7 +6,63 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/spmi/spmi.h>
 
+&spmi_bus0 {
+#ifdef PMH0104_I_E0_SID
+	pmh0104_i_e0: pmic@PMH0104_I_E0_SID {
+		compatible = "qcom,pmh0104", "qcom,spmi-pmic";
+		reg = <PMH0104_I_E0_SID SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+
+		pmh0104_i_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <PMH0104_I_E0_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0104_i_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmh0104-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0104_i_e0_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+#endif
+
+#ifdef PMH0104_J_E0_SID
+	pmh0104_j_e0: pmic@PMH0104_J_E0_SID {
+		compatible = "qcom,pmh0104", "qcom,spmi-pmic";
+		reg = <PMH0104_J_E0_SID SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmh0104_j_e0_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <PMH0104_J_E0_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0104_j_e0_gpios: gpio@8800 {
+			compatible = "qcom,pmh0104-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0104_j_e0_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+#endif
+};
+
 &spmi_bus1 {
+#ifdef PMH0104_J_E1_SID
 	pmh0104_j_e1: pmic@PMH0104_J_E1_SID {
 		compatible = "qcom,pmh0104", "qcom,spmi-pmic";
 		reg = <PMH0104_J_E1_SID SPMI_USID>;
@@ -30,4 +86,32 @@ pmh0104_j_e1_gpios: gpio@8800 {
 			#interrupt-cells = <2>;
 		};
 	};
+#endif
+
+#ifdef PMH0104_L_E1_SID
+	pmh0104_l_e1: pmic@PMH0104_L_E1_SID {
+		compatible = "qcom,pmh0104", "qcom,spmi-pmic";
+		reg = <PMH0104_L_E1_SID SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+
+		pmh0104_l_e1_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <PMH0104_L_E1_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmh0104_l_e1_gpios: gpio@8800 {
+			compatible = "qcom,pmh0104-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmh0104_l_e1_gpios 0 0 8>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+#endif
 };

-- 
2.34.1


