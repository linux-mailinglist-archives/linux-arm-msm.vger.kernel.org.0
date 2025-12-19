Return-Path: <linux-arm-msm+bounces-85847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D86CCF974
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 12:34:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCB42306EF5E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 11:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D119318146;
	Fri, 19 Dec 2025 11:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRgUk0Ba";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="COBF2tCr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72295318156
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766144000; cv=none; b=SCrPyKFGjVot/v0+Y7iyYxlhKeOSPX1JQOeSIgY+T3fAiLjHyMCWlkKKPCkFd8iOQGhF3R+ZOQtZnxId0c/sVPuwVQGF/ACTqTHn/jxXkQsz8iZfj6P9Nc1I3c+xy6kk1wI/bRfM/gZ1Vk5Qs3fpuJXzUmBBJdM3s/U4aox3N9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766144000; c=relaxed/simple;
	bh=rnHU/nRmdO9wlQ7vG9ynN3lPWFYGY9vBOvKwQNU/1Qs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ilZA/rG6x9yp6P2EAidxpgdjPxXQg/GSvolFw1Q53+py/a0MQ7xEbzcnfStd//oPKG+XlLdHChoYouXXAe2J+3fypxsJ6C3ceo4T6Lfqaiv6zEKjkpgC6/d2LZjaMhfhMHWu/KSANnqI/JtnEp4hj4WfwXZD5b5lcZyykFrAopY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRgUk0Ba; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=COBF2tCr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJBUmLf3560349
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3MQ2sjuSEVNzPt4n9bFCfdfNupVB5JynUQIY+wKyIg=; b=IRgUk0BaL98YRHdw
	FEZMn9WbkwO6u+fO6tIPOl4iCjGehponWnnuBx5fjse+IALS2oNo58eQgIxJ6MXh
	3Vxzt8llTx6j4CA/jgDHFwvFAtAEDSEl0VqteGPtNW2V+Tf70Lj4B75xfFQYi8HF
	2HhNq75uxxNPCp27W+ds/UN6WfbdJv6GednuNnkdxifSzvA2Cfpvd3mxHOHKmdyR
	kLTDosjLcYyvU124T5lACu9EM4hDhBlt37EcaYVA2hMu4P2a2KlS4PgKLvYPd6fs
	7Y+f6Qp7APYe+m8xxK+koJyH/wPBiu4z4m9y1zHcF7ZtrMMsqgLH9Tfpd+yjblNi
	TOrI/w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2cagk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 11:33:16 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b94527a3d7so415426b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 03:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766143996; x=1766748796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3MQ2sjuSEVNzPt4n9bFCfdfNupVB5JynUQIY+wKyIg=;
        b=COBF2tCr3y1wnkM/4BOaHG4pITs3XSc2WSQ9lLqgzgSID3dcbF/p7kYvEpRdQc9Bfs
         nL3HajYFh1Q32/wOwamHtS0m+U4t7dbHqsHX2P0KPPlL/455+nYeFoJQ6dTmW5hTy+2M
         PkeEJAVD788P+n0TAyD0O09c6WTVdZLTPRAXBZW6Q1v89p9mDe1EKmlzb0gIkF+XKCTS
         gIp6meiE+8YwnXV+G2i0Qt6wtLoHRH06OCoO8h/Vk/M4Z3m4ffPRuqLQxI2DuEUJnPoM
         Z3FHDnQR4Ou/T4kGEX4Bhjq6hHcyQIYiX74eiWab967YpUdV8qwcwMin1XLU1bELMe9T
         VIEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766143996; x=1766748796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t3MQ2sjuSEVNzPt4n9bFCfdfNupVB5JynUQIY+wKyIg=;
        b=MIvJr7Z9eKyuRpO1omeA9cV6Tb5P4tmU++ETtdvyfpd9lJYFBZOi8/bXucyadfc7TO
         m1goY7li/huZMhQg5koOm1ppjD8qU2x6M5OIke1wVsp6h/0U6InZn+LZdxPQCKCAmuIe
         QEghrz/LDgEW9sJV51jnJOTuiY8Xen8YVQmoIQp1HDWbIx8Atnqja+xJLDJoTw1LGSDc
         rTpD7uWRMIeTcrEQjLcjm7KT0aff1DrnS0vqV/zLlvAnUzTFMOoao6URdrvVhNWMpXH8
         Z0q5BTOA7NK1kGGamB4LXzdwTm7LX1DVda/iqzQgqC8IY250ZjpLjn8RRQjO4y3ESoNQ
         pKHg==
X-Gm-Message-State: AOJu0YwSlxxtjIi+EPkUhI+sUxcZVGD63HtrVQDFvOLIZbJr5yDYEgk4
	Zm9aeQqmviabRPY4m0TdFx2Fhyng/0M1Hzj45YLus8odOXSEeVAHiJcPGvJo33xKcGALX52HF3R
	tfvR5aV10askglxmRSqEsJ2I3JvvVDZeKSI2mRumzJRTKDUrhoEB2+QpQT+SxFCXVCJKY
X-Gm-Gg: AY/fxX6crSOPImhieHZToAoKp97murL8pccbvyNGN4mCG9qQVIawEjqTfQ4evk8EWsR
	0zQpOXCIMWkQmwTaV3UcPrj7L2Ia2Yc5OXoWGoIZxpsM4BK3i7F+7TjbZafq/9B/kVZOYQ3vDx8
	rF3l+n9w7tU3mvS65kducNsrXHLzVr8NKs7vIWDY/xDYacmgoUoIkTg1AD4aqRem+G4ai76hr2w
	rTC0eaxptw+5YbQvhpuo0zII8JZRjshJXThJtUKbMvmbZNsDtqVrAxvJJyGSIcCVZ7r751xT0Tw
	odv7uINN3/ovCJbm/DE9A8ynNW5mg69tqbTKRC/rADjPiVgosShMJaLaz1lfm1lvLn3YDtlxGN1
	aVl9CTjKIyUqvP3HaXMRezW/s8O0NDj3/WXEvlkBSzobUg1YGmS5secMOelBTOiQmbQs91YcyoI
	uUWU7WDGC5HqRw7dRA/etrRbxgsjnajw==
X-Received: by 2002:a05:6a00:2e26:b0:7a2:6ad5:a4eb with SMTP id d2e1a72fcca58-7ff66484282mr1813070b3a.4.1766143996095;
        Fri, 19 Dec 2025 03:33:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkHU9/mt8BYffC+HXaReSby5YQ0/QJfVZttHFrhz0DrTLrbsytSeUBma+Xp/N6vZjtoWspDQ==
X-Received: by 2002:a05:6a00:2e26:b0:7a2:6ad5:a4eb with SMTP id d2e1a72fcca58-7ff66484282mr1813046b3a.4.1766143995540;
        Fri, 19 Dec 2025 03:33:15 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b423d86sm2181867b3a.26.2025.12.19.03.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 03:33:15 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 17:02:10 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-lt8713sx-bridge-linux-for-next-v2-1-2e53f5490eb9@oss.qualcomm.com>
References: <20251219-lt8713sx-bridge-linux-for-next-v2-0-2e53f5490eb9@oss.qualcomm.com>
In-Reply-To: <20251219-lt8713sx-bridge-linux-for-next-v2-0-2e53f5490eb9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        prahlad.valluru@oss.qualcomm.com,
        Prahlad Valluru <vvalluru@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766143989; l=3938;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=rnHU/nRmdO9wlQ7vG9ynN3lPWFYGY9vBOvKwQNU/1Qs=;
 b=JdTQLjkH5e1Ls27aJcWOyBhVZB6MKY88VjCUM6KGQrqRXEAGWewUq2ezThj+ERlaXRBSkrUwp
 +H0mhpPBHuPDEVV2SxxBh2xAtVXHWg+s8EnzwD47dinU/XDD9RcMYWO
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=694537fc cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ov8SyQ6_pS9HVYgZQC4A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA5NSBTYWx0ZWRfX6ElaIrcXbOuk
 iHMEPy9JqGUWd3tz+MW3BoDRwgtRkaV1j7hWM/spgoia1f1YN01QAc7LwGMGGYWn2Ye8t6EFUAM
 IQp3uDBdyd6r19QKXyV+SKVnDJyp5E+xBM4MtWugTMA3pUYrMS1MJguMQJnZuAr63PCbkywVh/E
 AW/boFbZ7l9Hj6yjWnAvi5cmAcmbSOFn5ny29FsRV0GhYLbzZYZgGNXGS2FJr+ZhXR46ZLXAER4
 axkifozVEAcPNQJ9ZaXdIxRZTj/rmERxQ4jIsGIUQxKUeLkBIG69tcPoee5/iTDn3IolEnGkfEO
 dw3RSuXv+LiVGkwiItjfhSP1IXTBH304NhTDbspvEMMbh+DVkyNWWQMVgUTtf7HNFcqTP5AifIe
 FwBTLHIOchcDyXAwN9KUcNhk4jv8mEsBmstkYrTN/PeJacU1/RFL2DtuVtSbF6zNVFUlL10zE5y
 7tQQnSWTWcy/bVSZXxg==
X-Proofpoint-GUID: m3lMDLMxy5pjBdVXnBlEwSlOH5dqaDaj
X-Proofpoint-ORIG-GUID: m3lMDLMxy5pjBdVXnBlEwSlOH5dqaDaj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190095

Monaco-evk has LT8713sx which act as DP to 3 DP output
converter. Edp PHY from monaco soc is connected to lt8713sx
as input and output of lt8713sx is connected to 3 mini DP ports.

Two ports are available in mainboard and one port
is available on Mezz board.

lt8713sx is connected to soc over i2c0 and with reset gpio
connected to pin6 of ioexpander5.

Enable the edp nodes from monaco and enable lontium lt8713sx
bridge node.

Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 94 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
 2 files changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index bb35893da73d..eb321867f1de 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -32,6 +32,30 @@ dmic: audio-codec-0 {
 		num-channels = <1>;
 	};
 
+	dp-connector0 {
+		compatible = "dp-connector";
+		label = "DP";
+		type = "mini";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&lt8713sx_dp0_out>;
+			};
+		};
+	};
+
+	dp-connector1 {
+		compatible = "dp-connector";
+		label = "DP";
+		type = "mini";
+
+		port {
+			dp1_connector_in: endpoint {
+				remote-endpoint = <&lt8713sx_dp1_out>;
+			};
+		};
+	};
+
 	max98357a: audio-codec-1 {
 		compatible = "maxim,max98357a";
 		#sound-dai-cells = <0>;
@@ -317,6 +341,45 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs8300/a623_zap.mbn";
 };
 
+&i2c0 {
+	pinctrl-0 = <&qup_i2c0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	bridge@4f {
+		compatible = "lontium,lt8713sx";
+		reg = <0x4f>;
+		reset-gpios = <&expander5 6 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lt8713sx_dp_in: endpoint {
+					remote-endpoint = <&mdss_dp0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				lt8713sx_dp0_out: endpoint {
+					remote-endpoint = <&dp0_connector_in>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				lt8713sx_dp1_out: endpoint {
+					remote-endpoint = <&dp1_connector_in>;
+				};
+			};
+		};
+	};
+};
+
 &i2c1 {
 	pinctrl-0 = <&qup_i2c1_default>;
 	pinctrl-names = "default";
@@ -396,6 +459,30 @@ expander6: gpio@3e {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	pinctrl-0 = <&dp_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&lt8713sx_dp_in>;
+};
+
+&mdss_dp0_phy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
 &iris {
 	status = "okay";
 };
@@ -451,6 +538,13 @@ ethernet0_mdio: ethernet0-mdio-pins {
 		};
 	};
 
+	qup_i2c0_default: qup-i2c0-state {
+		pins = "gpio17", "gpio18";
+		function = "qup0_se0";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	qup_i2c1_default: qup-i2c1-state {
 		pins = "gpio19", "gpio20";
 		function = "qup0_se1";
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index e44fd5c33816..7f6c681fb1b4 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5117,6 +5117,12 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			dp_hot_plug_det: dp-hot-plug-det-state {
+				pins = "gpio94";
+				function = "edp0_hot";
+				bias-disable;
+			};
+
 			hs0_mi2s_active: hs0-mi2s-active-state {
 				pins = "gpio106", "gpio107", "gpio108", "gpio109";
 				function = "hs0_mi2s";

-- 
2.34.1


