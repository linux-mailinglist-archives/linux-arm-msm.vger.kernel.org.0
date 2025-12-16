Return-Path: <linux-arm-msm+bounces-85398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C304CC472D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 17:54:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F252B30C8C52
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Dec 2025 16:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2C8325706;
	Tue, 16 Dec 2025 16:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VRCHH/Jb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALVEyekB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755DB3246F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 16:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765903704; cv=none; b=MrGIJmZHiMOM22GMdf3e5rtLqY7UA/+4sZuwz4JUyPsJtV6suQ5foiYNtL3Kv7aFbGvoHENS3YE+4M7v4NmAx5soixzQkI0v3dE5UN/ELWC4cd700qZhoJzobrNE07MzH1OuwMA6EZbbVV9pGCiJ6MLHkid5IfAlxf1gBW0CGwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765903704; c=relaxed/simple;
	bh=mL4IQb9dFswIX336sK4owGasw+V9+cJpYS11uO8Jzv0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CmYramx34A6Djdeapo0UMLQJPgoRTdg28ZZ4Ry9KnBgNIuy5RrQ/Ud4Xy2Mh7urPAEK+jnxInb2MZXWJV6ZEXXFgbWLk+9knJcKp4EjeWBOm17Z1Q+9J0b6rvV9vVBQCY5/iQJ/55K76VuSKb7nVupFNL8QtUEwPNBwcAFsqxzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VRCHH/Jb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALVEyekB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BGGjDGO3494634
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 16:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gHjZnw8bjj2frEE/PY/bXQThs22sAouN+uut1HXGM2c=; b=VRCHH/Jb/43FKoo7
	bler8OYNZ4OAOt/RMm0AGIKIM5nmE5/ruj99p9zYMxk7cIKTzDb7wvPhp28cVAND
	JO/lU6h17BjdZi4p6zsmyMEMO9SWoBoWT39ojmEpLVK0OzJP7bJMPKGkICNKSGaR
	6pFiA3MS0rif3Vy7UTs66wnV+ltUEZHn+643vcVSh9HFD5OwvCSoGJAYTQg4Hdo7
	0hU+5+i9vxIvzio51Wk63wDQmQ0PGGjR/fHRQej9UbTMKJqwOgNHP6LNoomY7Ajp
	t6TH0xmbZJR/QvU3rHPsC0IUnMEnvEqA7FEI/6kHFrfIrr7ym8yfVW8cGkk+Rciy
	/YMmDA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3b7d80ae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 16:48:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88a2d8b7ea5so39688246d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Dec 2025 08:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765903694; x=1766508494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHjZnw8bjj2frEE/PY/bXQThs22sAouN+uut1HXGM2c=;
        b=ALVEyekBk6p4v3stxClLTw/RbztM99iB7rq677lrg7M0fwbYxesQvSiVxSbsDIKJ4Q
         6Bd37EGls9Kb9cim6MJ50nVuHeIGKeFfiJCrhfZiLHhj3OxDcX4+EviGLuecxjId5lIG
         aRz6iDyAVe4DqsyAwDRQaqy2KyEHdmNI/c9FIwq4Q4nxbHtyrw2V3dNp5OGnGseieXRs
         gCwn7giwBLR1AJLhhL3q2pYOunlSu9AzZZPEqOmm+qZ4V6dxZLkssjLQ/eUwREysdD4+
         XL1gubdsampDZVo7dLrMPU3CyR8Ce++guaKmctnBHsglN3XnvT38JNvHalp9kjkiV9x+
         TZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765903694; x=1766508494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gHjZnw8bjj2frEE/PY/bXQThs22sAouN+uut1HXGM2c=;
        b=gjIfVFsQMzH9LfRGtB1OchihqtCwkk0BxNm+h1QpzTYtt+WQMPYrKU6BLi0zqTivfE
         hWibTaTrGmFYQXQ3aDXD5pfLBf6xiZTVWc724yEMEvShwu09a9+LrUPPGlu+Wsuxvl8i
         +q/fn9HiLPHrZ22l0jy+ayzz6lKPgnBsEdCHRPr3fpjH0jhAt6kUUohZMNNpIkpq7co8
         pC0SFlg3Z4ZuR/B/k0GRQvP/uRkWjknMFDboI8JuRwkZlRYrXz9ZAb5I6nlDHzbu6yWB
         NXJkCjLcfAClXNX/Z10fxdUcWW91zDONb7WA9u7CxS6w5I3FE1jS+QslSF/xbRW+QJDP
         zdKA==
X-Gm-Message-State: AOJu0YwbWE3zXU2loTGTlGh+4w1EnQTZepNCJvygyJzKyORyAN7z+2FD
	SM1LavgQ19ExpcbYbLdqDlGzjQvMaLdCpVq/dIXsIYGOqtKUdlSu6pVzpqc1Ewd+968JJBaJ168
	lsHJVyauu2+S3zBIIDeos4dQSH5I2Ng/tgqZjUHSiDrLsZ4x4VWHd7nEy+CGZ5tqwH3Vk
X-Gm-Gg: AY/fxX6bCuH0ylsLs1PLNz61g0GZHMqPYPNJXiBkcim+FlBx7P8JSVLj1kZpoklmZUq
	7+S2ngJPPsc72FccRNlhmMoXaJ/DgHYT3jp9thIX5KxJWsS9/60S4OoaNwUR8ccZckhsNDSxElr
	NtuZhuLCpgmFyeOY+4wjYka4QojcDerVjyNlJJ6gWhFGSW90eZNLyfYOUh0xU+AXohUMt/OEbg+
	8GPmSWth+u0Zgw+Ii0KzQUSogtimEuVZK0/yCjjMcQ6TWhNmXEMSWvhDX9z7L8RQPhpJYsCILm9
	YIFk5dc8TN1tW+OQlvFuZTHoYF2ObrqyAsnNucgUoLqO+Wk7p1giELIHaqbqIEkNESYBg35e802
	LpffDip6WMnpfkmCp+WI84h3HxO0AbGNy
X-Received: by 2002:ac8:5ccf:0:b0:4ec:eea3:41fa with SMTP id d75a77b69052e-4f1d06621bamr200290961cf.77.1765903694164;
        Tue, 16 Dec 2025 08:48:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdA3HunDHwkh5QKrlNrSIfzOwP7TpX63Xq5q84dAeZdbQUyfuUdwBrKAZ3/WXsx/g0C6g5Vg==
X-Received: by 2002:ac8:5ccf:0:b0:4ec:eea3:41fa with SMTP id d75a77b69052e-4f1d06621bamr200290451cf.77.1765903693670;
        Tue, 16 Dec 2025 08:48:13 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa2ea57csm1730719066b.22.2025.12.16.08.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 08:48:13 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 16 Dec 2025 17:47:33 +0100
Subject: [PATCH v3 3/4] arm64: dts: qcom: sm8750-mtp: Enable USB headset
 and Type-C altmode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-sm8750-display-dts-v3-3-3889ace2ff0b@oss.qualcomm.com>
References: <20251216-sm8750-display-dts-v3-0-3889ace2ff0b@oss.qualcomm.com>
In-Reply-To: <20251216-sm8750-display-dts-v3-0-3889ace2ff0b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2279;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mL4IQb9dFswIX336sK4owGasw+V9+cJpYS11uO8Jzv0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQY1Fz4WzhfTRDpMlksWeGLOiCS54klmvX780o
 QLLDEKk/miJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUGNRQAKCRDBN2bmhouD
 1wDKEACDvVDR7c52Gvm+WFuM6qUtH4QljSpSPGpdZIk5ZbSrCuY8QuTk8YKZLUZ2o8Tq5K7qyXv
 CddkkymyAP2Upg5ZuzqZqx2+wX37BWiw74bg3xMgyGyOjTzyN0g3vVDSqk27g8vMQ91vOiTfO1h
 HIl6ljT1kASwzruXt4niFcMCngJ/daEzrkk3xn8jmTXcYPCQxi1RMVt2/bkm0KBSrEXFpESw3AP
 ijYf5cC2Ktc53Vh+Qhhty3OYVq1YE2ue24ePI6hFUTXMnkunvBKLharMx+yCl6MMJ8RrPtSrGca
 tu1tdIE0pIyhuV8AWciUMKBaC2d2RwDilzRbs58Vs7d5eu3Ie+7hNChcb4Wv08wBDr6aBJkTlNo
 s5PERF8oxBn66u7dpaSDe6lGmh/F90WMiwt4juEseRYOauZDGxPS2apxo5Sug7BICTE9/W/kH6v
 VxMyhwA061OU58xIHIaeaMftJLAMxQj2PxrGGvPOmMPn6ei4xLkq3yvEV8xS7YGkkRnZQGDab6E
 6fXQn6EvkKTKYq5A41N2NQqmruj7+V0xSWlnLlkIxg22BtLjtFjD1rLnLm/TwjywAsTR4D1Cse4
 9Cp8NVOUUjqbSzxTZL/koDNJJA3wOFtnlojPyeyWG4BeqRbJWMx51lDUAYq62/GUKrczh97X2Mh
 Z/BnxsqyYZLANCQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=B6+0EetM c=1 sm=1 tr=0 ts=69418d4f cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=XOJNJb2f72dwbY1LfMsA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: k-8sv9BGouSS1eyGlJd2lqfRPbzSdDbK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDE0MyBTYWx0ZWRfX0qVxh0sB3Ydt
 tzLnBTtPMjoTu0YNpqsZKCE6g1D/EbGaQb0MIfGttKuSa1ZZ7oyPUfbZSXqjt+QmDE+y3UeWd2s
 m6HeCFokMbYA5JvaLNuHy/Svywp3dbzc0PJm8ZXxVGPYaNRFmrbHEkyWWohGeQ4YRDPsaCE2h3U
 s0kaSK3Uowm4k8UUW5pGEy0nqljBSfweaBhTCA9Dv1O9cI8h2OGVMn3V8Npsz70PP5ZogabNRSL
 IoAyQiwEsmeYzMESR2Hg1bcKVBOF1pR5cENeajqkwxr/st3DJnWyFqUIMFcqVEVw+6GL9H+d8f3
 9WN/g/cdlzj6osI9pz6lcQy6le17UymSQ3E/eb5ggWUkif1YMVgALOQFrg/yKf0WsjBxwUnGrW8
 lPJ/kyBM3rgNV560I5uLUkXDCsrNbg==
X-Proofpoint-ORIG-GUID: k-8sv9BGouSS1eyGlJd2lqfRPbzSdDbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_02,2025-12-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160143

MTP8750 does not have audio jack connected and relies on USB mux
(WCD9395).  Add necessary nodes for proper audio headset support along
with USB Type-C altmode and orientation.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 51 +++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 68644eccdbff..a08bedd2987e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -54,6 +54,15 @@ wcd939x: audio-codec {
 		vdd-px-supply = <&vreg_l2i_1p2>;
 
 		#sound-dai-cells = <1>;
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			wcd_codec_headset_in: endpoint {
+				remote-endpoint = <&wcd_usbss_headset_out>;
+			};
+		};
 	};
 
 	chosen {
@@ -230,6 +239,7 @@ port@2 {
 					reg = <2>;
 
 					pmic_glink_sbu: endpoint {
+						remote-endpoint = <&wcd_usbss_sbu_mux>;
 					};
 				};
 			};
@@ -925,6 +935,42 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&i2c3 {
+	status = "okay";
+
+	wcd_usbss: typec-mux@e {
+		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
+		reg = <0xe>;
+
+		vdd-supply = <&vreg_l15b_1p8>;
+		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
+
+		mode-switch;
+		orientation-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				wcd_usbss_sbu_mux: endpoint {
+					remote-endpoint = <&pmic_glink_sbu>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				wcd_usbss_headset_out: endpoint {
+					remote-endpoint = <&wcd_codec_headset_in>;
+				};
+			};
+		};
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
 	pinctrl-names = "default";
@@ -1087,6 +1133,11 @@ &pmih0108_eusb2_repeater {
 	vdd3-supply = <&vreg_l5b_3p1>;
 };
 
+&qup_i2c3_data_clk {
+	/* Use internal I2C pull-up */
+	bias-pull-up = <2200>;
+};
+
 &qupv3_1 {
 	status = "okay";
 };

-- 
2.51.0


