Return-Path: <linux-arm-msm+bounces-69472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 614DDB29882
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 06:42:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF9B6175BBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 04:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E81A26A0AF;
	Mon, 18 Aug 2025 04:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gfpVkfDo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972ED2690E7
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755492004; cv=none; b=RpxrXOGTq4txfgWvgVP6w3kvwVuASZvBD+I6rtJsG+D7gDH06WUZ0n7aN5cwHDt10xT3XNHof+Pzwb0Mw7K2Ac86zfaORItNdpK5QLCpC9illss5AUG0mEyArzovVMbJzPbGflINXg2Eb5lYVo7eLkaAzxdc8jOYQXNs8oQPIiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755492004; c=relaxed/simple;
	bh=D2wxpNOkh8P+/dDr4zmc5hSzvPPH2FY1N+a5W4cf6Xc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RHC9BOrnmSnscCzpylq+5kIjdcyej/oXCF0v/qPr+Z/M/0wWcNzs4I7v2UhNFm6vFRvK7D3dN3KyYE6CU0ofE4bsmFwFG9VybuIAW/CC+q2PDPBXfKM8/G7Bxz1Mz0YhVe/r/a6b0yAHFSXHBl+TNJK3dCpViBkdYuCfTDiEeeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gfpVkfDo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HKivSE021053
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXlqit4Iv+Zcn3eir7kWBslf37Rzezf8/0Jec137fcU=; b=gfpVkfDoR4Rl0c63
	8pmToNOCKlWrxj31SCg1qEupjmiNjay504LfkRfN63ZeCrt/2R7o6wcmJlwDAOtm
	YyJUshfeMGHBbZe0RzHcWvuoUTAjYD8ORDkkh8NAA47vZ+W0f0GZZTvuEcfJ/abP
	TSXWdw2lz0MY+XPXAfRXmMqGxab1KoCt8rJl29dyrbOv1P2qe/egzraVN7vLMCu4
	Eg0T0kDqCzE2lwYeptD0Ew31CMe1y4V6s2mdIyYcgp8guyDAGDYKTX84Y5utbbH5
	xAqj/OtXbozmiJKJmfuAr2PlmhCUQFOk1rOszqJST2BD8z8YbEoKQiaQsbanexfM
	ZkpVuw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jfpf3g2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:40:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445827ab71so31125995ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Aug 2025 21:40:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755492001; x=1756096801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXlqit4Iv+Zcn3eir7kWBslf37Rzezf8/0Jec137fcU=;
        b=MeZnPSeXe1Vyj83hWEghRk+Jx+rkc0RxuLKrhTi/NJCdVM1NF/Wl4NssLy9RaXjPyC
         zkn9k96bnST5+6n2IVeRiL327F/gv9lywmZ/Z/HOV0r0Zw7PFlmkDNA45k9zCUoaxJen
         mRH7XqddHgXG/T146O2Jqm90ClnwjENt+LCWGC+R5TO197dSAqBq567zy/wpDvy8hS0Q
         E0H2lrD7fKHujGY9Uks8Z0FB+qbmfxZkWyhk8E3gl2DPlRPrUTmsA5XELe4E2mPYI4Xk
         MhrSZ+P3wT8pjVCJCBhBwS/9HFduSuGOmuC0f/FYfvJYCLj1wUMDS7U/xQgVr2vIooIy
         nazQ==
X-Gm-Message-State: AOJu0Yy+rW+e1DaRzU7MGyBbS5WwWhkFKMYN0iH8scHanjPO7dw3uO7x
	/qqrkuezSpby9djrbTYvPhhPG5OGU84h383MrhH6BYa8bnqZ74nW8XJhhP0tzbYFMg/DGoHiAiF
	ZbM95ZxBtJMKv8y2yfp80YjhDKwdC5xJklOOiox33QZI95ALAEVODP85qu2geDVlUknML
X-Gm-Gg: ASbGncs9wNkWzRWHMnwgE33U7oOM8xBvHInLGPlTghe7Tk0tYdybbT+7CnqOdKNRL2F
	/6wm7kMV2WYrGEr+faoBm2FfQryvockaYrG0bvcBlJM9VbD9TFy+4zfSqqPDM/Ga6smGO14Kfeg
	Ck3mm2/Cms3ikEcexkB//YPu7w9jhxRiDOGYlUiMKzWYA4gUDBbGPWo/H56uR8jXTyXXhJNguOi
	l7prwauAl13MBeCaUuG4TlTWrmfrrm3TPABjJAP9pwU8IxYll9yF6q3IujZtpTdGyQ37mO3GD66
	bQoLfzqQKdRkmeybEkqdTUMPLL2GFZE0hzCLOa2j6HYbY4dfpxvPK/H5QG+Bq4S80/VI+4pBm2c
	lNHx6VM+UHVEQ4w9CwkxdxyRyS562ybEGldWsQKa+tnjjfJdNhd0h48sy
X-Received: by 2002:a17:903:2291:b0:240:5549:708e with SMTP id d9443c01a7336-2447905d6c5mr121604515ad.46.1755492000805;
        Sun, 17 Aug 2025 21:40:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzflTxBS20Vsh71p4pvKOUel+e+ym2bRtBtzbsonsZUta31BcIBS4BWNuzb+egO0KEMHe7Aw==
X-Received: by 2002:a17:903:2291:b0:240:5549:708e with SMTP id d9443c01a7336-2447905d6c5mr121604285ad.46.1755492000368;
        Sun, 17 Aug 2025 21:40:00 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9cffdsm67505765ad.5.2025.08.17.21.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:40:00 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 12:39:21 +0800
Subject: [PATCH v6 2/2] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-add-display-support-for-qcs615-platform-v6-2-62aad5138a78@oss.qualcomm.com>
References: <20250818-add-display-support-for-qcs615-platform-v6-0-62aad5138a78@oss.qualcomm.com>
In-Reply-To: <20250818-add-display-support-for-qcs615-platform-v6-0-62aad5138a78@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Li Liu <quic_lliu6@quicinc.com>,
        Fange Zhang <fange.zhang@oss.qualcomm.com>,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755491988; l=2780;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=Uhf3pCMvh2O5TroEbSoOdeJOJk/Am8Y7U0jj7j2dFhM=;
 b=GuhRimwzw/dI5bIhQZRw/gvFbHbSz9WhzsZicnCG5AjH16nX1PZdF4+DNSStskrwBL/U2ORiW
 nTNwy3l4HuTCmuhDCZi/0tZC2MXAhUcwd6l6cO4U4MlM71nhxmvJz/d
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Proofpoint-ORIG-GUID: Blxf7A8llGPfwCJEoY21IqX9JRMpoCsP
X-Proofpoint-GUID: Blxf7A8llGPfwCJEoY21IqX9JRMpoCsP
X-Authority-Analysis: v=2.4 cv=X9tSKHTe c=1 sm=1 tr=0 ts=68a2aea1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=cjmIRqugeGUkMfCPaF0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwNSBTYWx0ZWRfX4220eE/qH12k
 OwbGedHG0EVxe4nm9l3gt6h2nG/1ST50isCXBO2TEAKFaZHvCVjZ1e8l3Tk7Espn1aRUaxRch0r
 x0F+R1bbb7yYNCfEcZW6yFTO8QkWFSZ0fyPBqHV5rGmQ6DtqXMuZXY0RIJ9RTxMIBdlrRPN1rHR
 2IbtREtRmU5vPDeeDuoXsLoSvZBlifejiuN28MXOBX/P2ixO1dyGmjkf5t1iKHyt3frUJCabypy
 mgQpa1hl7xEp+GKOawtKvXQtQtYw3cXK6tsIwrmy5nD9ORX6NOCVLR7RM2RmW/3i9usk1pI3ShK
 DCAvOQn8MY3EIhwhYW1MS6MwdHC8klqkyvngNL1oTwGGLwjpeVVG9CWjJN5s/lo4FuSlmTsXg74
 /lxs7gNB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160005

From: Li Liu <quic_lliu6@quicinc.com>

Add display MDSS and DSI configuration for QCS615 RIDE board.
QCS615 has a DP port, and DP support will be added in a later patch.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 90 ++++++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 59582d3dc4c49828ef4a0d22a1cbaba715c7ce8c..39c757b66f47579d9bc7cc5c4d703f7af4434df4 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -39,6 +39,18 @@ xo_board_clk: xo-board-clk {
 		};
 	};
 
+	dp-dsi0-connector {
+		compatible = "dp-connector";
+		label = "DSI0";
+		type = "mini";
+
+		port {
+			dp_dsi0_connector_in: endpoint {
+				remote-endpoint = <&dsi2dp_bridge_out>;
+			};
+		};
+	};
+
 	vreg_conn_1p8: regulator-conn-1p8 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_conn_1p8";
@@ -294,6 +306,84 @@ &gcc {
 		 <&sleep_clk>;
 };
 
+&i2c2 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	io_expander: gpio@3e {
+		compatible = "semtech,sx1509q";
+		reg = <0x3e>;
+		interrupts-extended = <&tlmm 58 IRQ_TYPE_EDGE_FALLING>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		semtech,probe-reset;
+	};
+
+	i2c-mux@77 {
+		compatible = "nxp,pca9542";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			bridge@58 {
+				compatible = "analogix,anx7625";
+				reg = <0x58>;
+				interrupts-extended = <&io_expander 0 IRQ_TYPE_EDGE_FALLING>;
+				enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
+				reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+				wakeup-source;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dsi2dp_bridge_in: endpoint {
+							remote-endpoint = <&mdss_dsi0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dsi2dp_bridge_out: endpoint {
+							remote-endpoint = <&dp_dsi0_connector_in>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l11a>;
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&dsi2dp_bridge_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a>;
+	status = "okay";
+};
+
 &pcie {
 	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;

-- 
2.34.1


