Return-Path: <linux-arm-msm+bounces-71110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC60B39C63
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 14:11:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 430591C813DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 12:11:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B6230FC1B;
	Thu, 28 Aug 2025 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AwrcEOBW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB99730F95C
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756383020; cv=none; b=EiFJz3jA6sU5brp4dqTO6incxtMDQVNnn/oObb+yXQwM0XTl4dStJOOqkLR9yEDS5F8rq5dfrs4OySIXP9M2CXya+TUgf6ACmp317IAz4LYL56C+HzTqxNpaSY6faSuXkkZMeDQQI43zCyR/uqrLJ/yeen8oiPafgZCqwpNtdqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756383020; c=relaxed/simple;
	bh=n8CibSDGW6LOAsbVMBvzXuiN9JBP2yv07nnGPm97ghY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jAf4/QXcBu7qiHuBx9dZoQ/1JB5nkAWflMKoeOKjT3BSCNXcQEHuZwEnAVKxzOe2iidJb1eWgJDK0NKtg0/2tJ3//CavYdHsR9XKbiaKG0FoOqH66RfUt33mAeNJgfDSzGaep16fjMiuCNY9LwuY6h3Iv0Kp5Q/eZneVN1EA9pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AwrcEOBW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S61g53008302
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:10:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QD2A9FXdBy8jgphnzP4Dp1Qnf+lFGk8RL2fW6YxOKeo=; b=AwrcEOBWI3psTFQH
	N34qF8P4UKb0GSAtBTOkzzoXlCkmIrfFRLCJ5+C5lOv6SLFRYkDZt0xy0E0lB7Xn
	fFRCZGO3/8B/509YpwWTesZTO3bE5Srt1Qc/jU+AZfJS8mYSLf+PQlE98/nLXfKA
	38fUi3AtnRXg14ZfGaY0dUyvjCvNNACRqYeK9jcg9x9MBoIdS6BTGtM8AgVsKasl
	rZyXrxFG9NKZNxJy+zalmDo11nJgHBenWLUrG90QJFXfXoByc6vlDJKtPdJ4j+Ok
	2ELVj972r3nzB+42H4BtLcgMjuyJdOFKpdaiq0nMoX8YjP+iEX+f3gwrh9OWV4dt
	1Jo0TQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48sh8apdm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 12:10:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-325ce9b32baso1127321a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 05:10:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756383017; x=1756987817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QD2A9FXdBy8jgphnzP4Dp1Qnf+lFGk8RL2fW6YxOKeo=;
        b=geBPeleb0fzeliaDk1BIlrBBjkmA14wcVc0TIoTCx09ygZrzjIy7za0KWno+6Vqqyn
         WgFN3/I9GWLqOmssh4FxQbh45HPUxWA0jC9lw2Nv1HiPh/OhIgjkGAU9Czuqw564X9Ow
         C9jfnopENd87EtFq3cvNpmXiU2aJNVIfKF8sjqY8Wizb78EB3ew/B90ovvR9kLXEUymn
         eyh3Us4v2SFhicEQd3PY0Eq6frwRbIfb2wlp2Ho3gP0ihyIbaAP0+WkQUViSNukXrGLw
         AiBxqrX9t1rvvP2fWwKTSVbqjTY2IYLa9aqfYyuiN3yTSpBHzgChekrVMCT1krMklpjs
         9Azw==
X-Forwarded-Encrypted: i=1; AJvYcCXBRU+uWASrzY6Wi799qXinSV4iHuWWJMMhwhlgrY+wwl8Pk6VBDYS5XIlOiVDeR78WUrMU8wcMpwTR1r7v@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk5I5j39YbEsmscih4lzGa7AluqfxpecBd3mQ6nCIpiG2XqDnF
	znCbBxPrIQCugIDRnNe6wk2SjbtlrgGHNeck3XnaFlGA3kPXCiIE+D6eO/b2K4DrAH9Cnd9dQxV
	HQbamlyqxnf542dcbph+hTknUYI0ULG1/sVmTFHkxM/AWlfQFhHOx45tflPkh2EoK/nrM
X-Gm-Gg: ASbGnctigQnTeEEPBcPAXfath5bKkxzmnPuINAzuMScwm/p9dmTxGcvV0AUHXRVslZp
	tHjy7R1+60kbKlqgWKSX0Ai/s4wBGqUVtu/9hmE7K1qQDN04wFXCqJk+2zksVdCcxAIcx4rzChO
	9oudxIcwWS0cVUPzOGaDfAGLUPaI+8dV11lFWQlcU+A8NY9+tF0SgbYy3LrX+aFl/VfghDNsoX1
	6srF0nSy3ZQ92JU/BVoSxZUt7FzboikQ+pK1sz5KPla7yMzeYYBpp5RWM9x6c4CMenBUWkZw8cw
	CN3EQVf4FtwwCuZTB161Y5odhoZTmPiMWuWz/aeTSXknLsuvt9zWy36e2ouqvuls+8DhPe24zQM
	=
X-Received: by 2002:a17:90b:2ec7:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-32517b2f78dmr28934728a91.26.1756383016791;
        Thu, 28 Aug 2025 05:10:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMU0B8A5NXSc4XW6YWiuMgcNVOratxHDn2mKFqdBmgUSXAIgy8tSO3FCpdWkWDpp9LMEmetw==
X-Received: by 2002:a17:90b:2ec7:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-32517b2f78dmr28934664a91.26.1756383016208;
        Thu, 28 Aug 2025 05:10:16 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32741503367sm4019070a91.0.2025.08.28.05.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 05:10:15 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 28 Aug 2025 17:38:59 +0530
Subject: [PATCH v6 2/9] arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe
 switch node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-qps615_v4_1-v6-2-985f90a7dd03@oss.qualcomm.com>
References: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
In-Reply-To: <20250828-qps615_v4_1-v6-0-985f90a7dd03@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: quic_vbadigan@quicnic.com, amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        linux-arm-kernel@lists.infradead.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756382994; l=4925;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=n8CibSDGW6LOAsbVMBvzXuiN9JBP2yv07nnGPm97ghY=;
 b=U2c9vFnZy5/c1yfkChdy65ugAsH2zjxUx3I6kV/ChW2PovrY+W+IZJuZ4D10SvAyAPCjD5a60
 SELE5P96AiVB+6sziwPSWmlXNVny9jm3ltfp0jjoGFqBdZMPfU/eMzx
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=cLDgskeN c=1 sm=1 tr=0 ts=68b04729 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=UN7QK-OhvXrGNVVRcS8A:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDE1MyBTYWx0ZWRfX4ZOGLok7UFOp
 xZeCANPN9lZNf7UGGnesikxSr8TT1wtnpbD0tNPW9UWwfd61pM4IydtmULQCjQPO6+MQSyJjzTa
 1tVhHWSath5m9GocVCvRNZlUuoeYoVXFsttZ0wUpndf/ta6fxzT1mqiT8xoIyNYZpgOE3XD3F+I
 /khs8bpHTyL+NUVQ8ODS5rEZpFRjZLYJLGiWFB2cLnO5Nw0mp9CGvexGBV1unRhTOsSY9+dUo/0
 TmNyDrUOKqrd/Xr46OBcTb0QJ3ZDeZbBRlPjRg4jMVlHSFZOzBjjUisI4PW6ZerhnDF+50eIyNx
 qdXmoO1QXpVvxPHn2/aFZoFxc+SMK7PnX+Wv9zi1dRkk0gRnlYPXX/52RZDWh2cDy5tVDi+/gLk
 do12DFdn
X-Proofpoint-GUID: mInFmUZtxZNw0yK7FrqtkznDFBLdlZzA
X-Proofpoint-ORIG-GUID: mInFmUZtxZNw0yK7FrqtkznDFBLdlZzA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260153

Add a node for the TC9563 PCIe switch, which has three downstream ports.
Two embedded Ethernet devices are present on one of the downstream ports.
As all these ports are present in the node represent the downstream
ports and embedded endpoints.

Power to the TC9563 is supplied through two LDO regulators, controlled by
two GPIOs, which are added as fixed regulators. Configure the TC9563
through I2C.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 128 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi         |   2 +-
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 5fbcd48f2e2d839835fa464a8d5682f00557f82e..1dc4b498d39565398f83f9bfecbde19e68a61030 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -261,6 +261,30 @@ vph_pwr: vph-pwr-regulator {
 		regulator-max-microvolt = <3700000>;
 	};
 
+	vdd_ntn_0p9: regulator-vdd-ntn-0p9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_NTN_0P9";
+		gpio = <&pm8350c_gpios 2 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <899400>;
+		regulator-max-microvolt = <899400>;
+		enable-active-high;
+		pinctrl-0 = <&ntn_0p9_en>;
+		pinctrl-names = "default";
+		regulator-enable-ramp-delay = <4300>;
+	};
+
+	vdd_ntn_1p8: regulator-vdd-ntn-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDD_NTN_1P8";
+		gpio = <&pm8350c_gpios 3 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		enable-active-high;
+		pinctrl-0 = <&ntn_1p8_en>;
+		pinctrl-names = "default";
+		regulator-enable-ramp-delay = <10000>;
+	};
+
 	wcn6750-pmu {
 		compatible = "qcom,wcn6750-pmu";
 		pinctrl-0 = <&bt_en>;
@@ -834,6 +858,78 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vdd_ntn_0p9>;
+		vdd18-supply = <&vdd_ntn_1p8>;
+		vdd09-supply = <&vdd_ntn_0p9>;
+		vddio1-supply = <&vdd_ntn_1p8>;
+		vddio2-supply = <&vdd_ntn_1p8>;
+		vddio18-supply = <&vdd_ntn_1p8>;
+
+		i2c-parent = <&i2c0 0x77>;
+
+		reset-gpios = <&pm8350c_gpios 1 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&tc9563_rsex_n>;
+		pinctrl-names = "default";
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pci@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pci@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
 &pm7325_gpios {
 	kypd_vol_up_n: kypd-vol-up-n-state {
 		pins = "gpio6";
@@ -1039,6 +1135,38 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&pm8350c_gpios {
+	ntn_0p9_en: ntn-0p9-en-state {
+		pins = "gpio2";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+
+	ntn_1p8_en: ntn-1p8-en-state {
+		pins = "gpio3";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+
+	tc9563_rsex_n: tc9563-resx-state {
+		pins = "gpio1";
+		function = "normal";
+
+		bias-disable;
+		input-disable;
+		output-enable;
+		power-source = <0>;
+	};
+};
+
 &tlmm {
 	gpio-reserved-ranges = <32 2>, /* ADSP */
 			       <48 4>; /* NFC */
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 64a2abd3010018e94eb50c534a509d6b4cf2473b..7a840c90505e83b3c233ab13c53be818824c9b8d 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2294,7 +2294,7 @@ pcie1: pcie@1c08000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1


