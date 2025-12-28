Return-Path: <linux-arm-msm+bounces-86714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA99CE50C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 14:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B09B3019B90
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 13:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A1A2641E3;
	Sun, 28 Dec 2025 13:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJLnQWfo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VH6E9/y9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EA72673B7
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766929254; cv=none; b=dw5ghwZO636tB70Qg4837eezNu/1u00/TxAok6hBMIUt+Kjalrc3lzOIQVp9HvkAsRKyZvW5vZ4bAtZ7aWPqeCopdyh9wmRoKC94r3tqiZYIOdZoHHapNeMYqGeUeshgS7bA8n1hfWCuGPWDaOh4wBLCwgnL95jnY9DIfaWvZnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766929254; c=relaxed/simple;
	bh=k/Njpnze+nuPh5icPHVzKpQj6jHIxAHjt/lh9sETAFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ih/4dKNMaG7WJ694qS/D/TPar+ghh1nG9hSAi2fNsW1AlxYmjlBXiFEsllElxkqwcLej1NzFCbKbT2OUMg9UjZQoU4LiNm9CCUoDB6qgO7Nrm4+ho0y3XsENN/psDgKr2JvOocWd8BCF4W3KtwFMjtN5RZ8SPC6QLawHBAGeE1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJLnQWfo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VH6E9/y9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSAOtMS4107093
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 13:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	duQBS9ohOlFNm6IRwEMoGkwoQ+1zip/dwqR8/8pxt2o=; b=QJLnQWfou/82bkfm
	l20YR2hxdJ1a8cEKKrfKONeTqVJL8S1j1t8gs0MM7IyzFkch4h/CSf9usZwavyuS
	s+rwpZ7GigAII3YZkygGD9YODw7vk/cGB33l/S6badbNRoB3ksLrXGcp7LGsJYps
	2/EQ5tQfJiPFsDY074yF+1G+PmTtvX210XWEsuW0djZC7iaSrl5zJ7ca+1+Nl6w1
	hHPs7OhLQ27JAzYl5j8raE4C10hVlxp2QxZ64gS/AC/wfqC80BVo+NFC+LzDGjhU
	r1Lj5jJ3qzaKyIFICmj5XnUBpJW0hN9NX8EJY6D9w64JKCRwvL+qrND5PuotL/d0
	ZNRhPQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bavrj0mmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 13:40:52 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-34b3f876290so2834513a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 05:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766929251; x=1767534051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duQBS9ohOlFNm6IRwEMoGkwoQ+1zip/dwqR8/8pxt2o=;
        b=VH6E9/y9CufXcU2HwloVqfudd4E/b/u9KiwMRqocw81Q+IhzHoXfRlh4KqO4bPyqSd
         Xzq/3qEMWLzkwIiHVjLbCy/M3tlachKjWigM3F/7TxnI0LGUqvq/whMnontQElipspZY
         RIR+RJDl5m1zRh2ZvRER8Or549tG2wBQ7l8NYmKnnto+jgHkUpuQQfZ52Q07lUW9Tg7j
         bKXhDoCrsl5HDqNSqrrY0oF6MDXgp78weNJWaPAT+L8+YZzMfGOy3iWs03BItMU98Yax
         PWGSai5OmmnLabmhz6GoG1j23NHahDgTcQFCcIR1Fp8Bv3DUgfrlWbHyOKrtwIvo07Rh
         5FPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766929251; x=1767534051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=duQBS9ohOlFNm6IRwEMoGkwoQ+1zip/dwqR8/8pxt2o=;
        b=Q537w7h6KpK9RCQMCy2qLSUT3joaV08DZw4fztpydBYmqsta+m/YsYvXVR1Bbul+n9
         JYW0Ox0cv7QNtQIROuxIEnMPs8jQM/SxXwT9UeJg42YOOQ+AFtb1TTUoTd4Z9BxWJO8J
         G1boWceDGeu/NCZsfZG1o42XzNhFPNZkyCX+j3ZhKUjL0ua33mGsK0IyrdBLIfAel2xV
         xsm79biAkWrAVbHLGdUFhbYddGULlwLpGMxSi3z+XMTG6NJIy+T3xl9L5W/tLKiHui9t
         a57PpqRc6yoRNHu0uGBR95Sb63L4RNsu9cIG3ACYv1U9GsjKgQbk/kmoLg4No9wpbf8i
         LC7g==
X-Gm-Message-State: AOJu0YxvDknU4GiL//8GGVGbhowxLMdQgYBn0YeNETiIx1ANKllK438G
	e5XhdtIy+R99mAgLdmzXuHQ67d/fJogY5jwstg8TiJkGQTqkwWKLZYOpFg04PJGehEWLCEHSuCc
	W0/I1/NzK+uRQ8ZsPfJz++Dm+0H0npLPmDOTHcP/BifILnW6jQjaHNZWjpw5sozdbmwgh
X-Gm-Gg: AY/fxX5p9D8NBPIiMvSfDucOWP5Us6JYjlStxoQ7Fa/jodJsUwUTmPdmA/7nehAmh9x
	FmgicvKrn/dO+zRyKCs1YX9dke69KTmrYlHhfXRnm8brikWNdNtdCRVc7ekCBqH0+aVE5uhWABQ
	zz3BF0Md99wAmgtGY/pHPy07KPUCgLkZoxE1LOe4As4z/GiLgRzB10hGJQMuATKG+5gD4KOAKrq
	uXOp8i1Bx06oHpyXRNGXJAxpym/xdpQjqWJ5mP6ACbfGKA4D1AfKyH/ihT63U//u6+U3Fn0QLME
	qADzDCeJNe7VeFlAUgTJAzUz9IHh81bgXvBS5MLWPouRIGjldqWBT0quG/6/K4FMoMtAXVIFBXI
	bv7snrXEsdDzSwGNDF1nTwnLnn1MFzCzfKFEPqWW2JU0RWvMTVyOWZg9RdWA7Kdz4aMnUtLSN0V
	lCN/z2xyT4tI6RHgqi9Q+ymJ2aDrIgng==
X-Received: by 2002:a05:6a20:2443:b0:35d:fce2:cb28 with SMTP id adf61e73a8af0-376aacfc080mr20160683637.8.1766929251550;
        Sun, 28 Dec 2025 05:40:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWBl2/iVTYcL4cfKwWO2mEURuD4SYkiw+XZEZa0EvXxOeG4sQ88pn0lTKI8UK2xr3YqCZfow==
X-Received: by 2002:a05:6a20:2443:b0:35d:fce2:cb28 with SMTP id adf61e73a8af0-376aacfc080mr20160670637.8.1766929251125;
        Sun, 28 Dec 2025 05:40:51 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c14747csm22981950a12.27.2025.12.28.05.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 05:40:50 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 19:10:38 +0530
Subject: [PATCH v3 1/2] arm64: dts: qcom: monaco: add lt8713sx bridge with
 displayport
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-lt8713sx-bridge-linux-for-next-v3-1-3f77ad84d7d1@oss.qualcomm.com>
References: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
In-Reply-To: <20251228-lt8713sx-bridge-linux-for-next-v3-0-3f77ad84d7d1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766929244; l=3707;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=k/Njpnze+nuPh5icPHVzKpQj6jHIxAHjt/lh9sETAFE=;
 b=LM6+QhctANW1EUfU3fVQMuqrt/kwFFFzx8uHt3NulFQctPBniN85dOwrrEVot2nfDqPGMdXhA
 vgHJI3R/1wGDsGW2ag5K5Azfte7E1kJSU5Rsh9P8GuiFEWfBHJiqD77
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-ORIG-GUID: cWZkJ0fviBYEIudRaY7995ufqMAWH5gm
X-Proofpoint-GUID: cWZkJ0fviBYEIudRaY7995ufqMAWH5gm
X-Authority-Analysis: v=2.4 cv=coiWUl4i c=1 sm=1 tr=0 ts=69513364 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ov8SyQ6_pS9HVYgZQC4A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDEyNiBTYWx0ZWRfX+aNOyLwZEe1c
 ljtdMD6F47CMGUFK89u6u7z0T6dv76f0A9sAj1Cq6xg0ebyJAGyAPUzL5uyjJTsGVxhEtCOdEGY
 FBSOf2RyXROXA3dNI18pHTKCsyHlrTHqPzfqiFYSKZZMDXqQbFTGqmLLOppiAUIXFMRk0RWdtMP
 yTW5R8gxpYXul2mpME8OUwoMLwgVossS8I+SnfzxKh5VaWw+9Ok051ksI86rI/SUDDUtHIi5Gai
 XCo3/p9a+DmJ2gATcttN/viLLYRS7m9ZegXazx1zKI1OMyAyLy1UvYJ/2zeFmoIPvRa1FDAJsfV
 furW1Bs41uGVaPNrO/ckeDY/A2i+BBBl+ytGGnBHG7HXrvT4K8PFgjB4M+Jyfu9oR6M52IlaX/F
 QKtHCLFRtdaosPxrtcfCMaPx9HMu0C7hqspRFVNgaFTWLxp026S/6lZPTxK6VK1pdjSZlMosESf
 zegP5+VyUWbW9V+8jVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280126

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
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 89 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    |  6 +++
 2 files changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index bb35893da73d..262e7403f81a 100644
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
@@ -317,6 +341,42 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs8300/a623_zap.mbn";
 };
 
+&i2c0 {
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
@@ -396,10 +456,39 @@ expander6: gpio@3e {
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
 
+&qup_i2c0_data_clk {
+	drive-strength = <2>;
+	bias-pull-up;
+};
+
 &qupv3_id_0 {
 	firmware-name = "qcom/qcs8300/qupv3fw.elf";
 	status = "okay";
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


