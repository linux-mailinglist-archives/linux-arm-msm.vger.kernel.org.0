Return-Path: <linux-arm-msm+bounces-87661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D479CF79A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 10:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE2D4310F8AE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 09:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D586324B10;
	Tue,  6 Jan 2026 09:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mBKbMFk6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lbec037o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3C931CA4A
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 09:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692448; cv=none; b=GqFIcCF17Kv2kTVNWsDMIGP3A9xzhXsIQ4atpC/HJSzIL/xahNcRhwBrE9Ov/SQl0POJgK77vN4UVA2q2m5oE/IWGDMBME5un9iKBjaoU8zuYzRCOgyaFmOxUYy7cMslbCOd3PH9pqlFIkquPUCOMLGH6l3pLhZSXRO9s6g1ahI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692448; c=relaxed/simple;
	bh=qNL03PYuDa7zYQoE2ixEmUSblmXdpnNGEuV5SywZbG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3HRB6OFhUmzYEtcyj1UnJdDEkITMna0+3BKaYjK67Za6CvBfC13/8x9UB9Sz4QtB1SrXjZEbvopqNmMc8+d9reCrZZ4qoEsiyKdIe8jSxWIvKkiHBlKR/h0kF5JNmSxLObdCLimCIKK/vp7pHkIGS66lQYUmEZsD4xGoOxVeE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mBKbMFk6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lbec037o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6063Qe9W2923232
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 09:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50uGPgremaZPgc01PJvtHho9EVHbAkAnUxBw58+hi+o=; b=mBKbMFk6szSfF6dn
	lPoGvIlHufqRWy9ir9rjuRJiJz6xy8Eks7kIshus3YspIfjfq9+pOfMToPCr/9Xp
	QyC2VRG5wtqR1f6jtp/B4ONpC08MIPocIVRY9hWp6eGxg507A38CioS1h7sUNxjO
	/5amBG8RWpp4dWcaRigc+tWj/CuyvEwx7ATsbVcn2yw5mociWZevAamY/9FAP9eC
	aXwTimuemV4f4aaBLdpztNjQo8gwFsfUNiXwNgIUAVtPu08fj6X1NhrKHV+JwJI2
	UEEGjQu8TPPfR1AN/H2j6GxAK1JFWZ1znPABd5Cs/l2LmiouFsYh0seS4TsETg35
	c+8sRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgscy97ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 09:40:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b9fa6f808cso236792985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 01:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767692442; x=1768297242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50uGPgremaZPgc01PJvtHho9EVHbAkAnUxBw58+hi+o=;
        b=Lbec037oqOL/TC1t+NOLjY4MvGj88UfIaL1JGctDZr0njjoa6jr3nvBzv++kQiapCW
         9g4LsRgeOh/OLFX7Wd9fatMK+w+CYZwVpruNoRIqtZD3C8Q3uxw3UpMJmJEj8z6gsg8/
         OHmkVS3Td+yMCsmuutoCoGMYq4XosVsagYXZzljI0iejb2SH3e/0Yz7ZUfEnas8r6VDI
         IdygRszffsGm3EsjPxsZCwFj4iqPcD4LrFxdWuBbxRTZxcRjcSpkSj4VkaEpCvoJ5X7n
         kQMkDnHpBhkZa3gLIKqTEOyqgod01UkkrES5Tm3gNiQG6UwL1FE6nQVua6Tz/QoTZtxG
         VTSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767692442; x=1768297242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=50uGPgremaZPgc01PJvtHho9EVHbAkAnUxBw58+hi+o=;
        b=ZUmJOR8CCr/0WrA9azPgo5q9VzrtRy8lpkagqNIKw4QN+8TNU47Z/3zhFnOEyHXIyS
         iTk7pkW3gJnwFuDsGMz3DcwMRZDaqgQ+TQh64hshYExyE/Xqqg/yTNGdyOS2UvBKt2/5
         e2p6xJRAz2LxS0b8rVxenSLa93gg7bfOkkN1Xtwo9yY2u3JkNTX4GZjl91WxG8UbLtrY
         0U2x9oBspgwDpeAE/pMOra+TwVu3kp1LzN+iZ40EyTi7EkyNY0YxgNMLmDYEgQ5WXXW4
         x05/CrHU5ZX+Vbxh4mE+Tu3Csp6XMIMn/abc7kfofM3f3X5GxaSOw2V5Oeocs1MfoRF2
         qxLA==
X-Forwarded-Encrypted: i=1; AJvYcCV8vqkETpzO3FDDDaoAv+2wpJX7jJ3hhKp0q8cz3/W7K5Wjtxe2E3bxyQVUoPAnGGSwdJ8cj0aSo6w3JUJ9@vger.kernel.org
X-Gm-Message-State: AOJu0YwRUo+wUmrix6k468MS+APulKDX6TAjsg0dc2N9xA1tsiXq5K6S
	aKlWXHwVWWdF0oAIgBlSsvSgfVN3myX6P/CfVyh3HWUjp+t8RgcTbThylo6oKRI77QciLiScA/l
	N1mqN9WFsqnWl1lk8bRVXxVSQY3MvutWT5OkDvCtURJQGnLJEV0Swn9r3dYd8ePblnlv9
X-Gm-Gg: AY/fxX4sQ2XxsMlbnwxvoEN6zGCqnL79owHqVDvq3kG7wr0Uq/hD51eHoMllQSPncTT
	+fjdYLnDsny5gNXVLnL2zwUm2k2pe4Hu9uj1UxIBE/87F/nUcVg/Gr4esYbfuEI/1qkwk8oYY2z
	PKOsdONn+JPRMVCqEKT5Wqqg+YS+/HO2b40BuTA0VbGKM5FHlmX80mYl5CSVfa92ZgfyHTZnW2A
	uSNbbh159EKF/POjdO0+vHF09tD7p3G4ojwST84v+t6qqf722QOUExYlDXHEuckR2mT5BnbPdAQ
	AzL7VLosmdbQxqN8Y7JQplN1HGjhE1zehsV1W8ICFfDkaqzNAAX7V6zBxlN62GM8iEE6AevbUfT
	ZUXvw+M7LOh4AZgyGYuHaA7yKfUQuVmNXnszhfjzp9nymtoLIGMsbjquqvFDYQ6D+Kr7UzWsRyJ
	xG
X-Received: by 2002:a05:620a:468f:b0:8b2:745c:f770 with SMTP id af79cd13be357-8c37ebee205mr311804685a.77.1767692441643;
        Tue, 06 Jan 2026 01:40:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzmqr0sIU1T8rAjETrwYmJaA2AIPD9Ca4WO/R2S3Ug8BRQeR5VlDtRUVT3CC3A9ZxOK/1M+A==
X-Received: by 2002:a05:620a:468f:b0:8b2:745c:f770 with SMTP id af79cd13be357-8c37ebee205mr311802185a.77.1767692441248;
        Tue, 06 Jan 2026 01:40:41 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cf95sm135397885a.33.2026.01.06.01.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 01:40:40 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 17:39:56 +0800
Subject: [PATCH v2 4/4] arm64: dts: qcom: talos-evk-camera: Add DT overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-sm6150_evk-v2-4-bb112cb83d74@oss.qualcomm.com>
References: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
In-Reply-To: <20260106-sm6150_evk-v2-0-bb112cb83d74@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767692409; l=2970;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=qNL03PYuDa7zYQoE2ixEmUSblmXdpnNGEuV5SywZbG0=;
 b=S9vvds46ZDgLtaIcAVjt1Lxuu4uhj7iF6n3cTOb3r/LJ2S4HF3CO0cF8KG2SVtXT3cyJReZ8c
 zpV691CX8yQAkbAZkg0OuV8vWOHrmKIUpuKcNFqIoe+0otyhMRLVDzw
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: uCvH1qRQdIRhfKICgNeEWusrlxsOFsK4
X-Authority-Analysis: v=2.4 cv=fOw0HJae c=1 sm=1 tr=0 ts=695cd89a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ASysW7YtxmCszPwO3C4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: uCvH1qRQdIRhfKICgNeEWusrlxsOFsK4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA4MiBTYWx0ZWRfX2jqb67n7cNQ+
 Csle7gYZzdu4MMqm5PRr/lPlHh9Q1a2iLfkKdEqVpZqs6FSsfCgkv8e6p3+zwdAcLamA8INb2cc
 kK93y2xzXMKBziEvkB4ZUSKGJPpSuPGzLPh9IF+ekohbRW+4hleW+IfAVjCBYrfUmPENWGHh3Ts
 lztA+jnU3OaBIaUTzro3s27/sxxmJp7+1c6GHrbdn4l/x+/bGeojeM2qW6NbnnyJ1KjmhB+dwBN
 pgA6SOjVoGYhhMHuFr35RQ3hek9Bzg7DjZb4bFrRK7bitRJTpiJoKJF2VjMGUSkDWMUfVE51XmQ
 1ix4Rd64zZ/jww6iH1RX5JM+yjiPMJi84QW3Xad+i2jDLKxLXMVVQN/iuIiLPrRZXE5ojuT8S2C
 G+suANvQlTg3+abk/Nf20cU2sbEBzqyJrzm1yd+4mbZITzwR30VFIXn7rHykClPiNLnOk6oNCl0
 lbPYTw6h5v5L4e+u6Pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060082

Enable IMX577 via CCI on Taloss EVK Core Kit.

The Talos EVK board does not include a camera sensor
by default, this overlay reflects the possibility of
attaching an optional camera sensor.
For this reason, the camera sensor configuration is
placed in talos-evk-camera.dtso, rather than
modifying the base talos-evk.dts.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile              |  2 +
 arch/arm64/boot/dts/qcom/talos-evk-camera.dtso | 63 ++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4258776b71bdba351de8cefa33eb29a0fe3ec6f3..bfaa0b47ab5cabc9aa1c6fba29faa3e6fd18f913 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -333,8 +333,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+talos-evk-camera-dtbs	:= talos-evk.dtb talos-evk-camera.dtbo
 talos-evk-lvds-auo,g133han01-dtbs	:= \
 	talos-evk.dtb talos-evk-lvds-auo,g133han01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..53006a861878f9112673b9a0ad954bed7a5fdca5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-evk-camera.dtso
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,qcs615-camcc.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&camss {
+	vdd-csiphy-1p2-supply = <&vreg_l11a>;
+	vdd-csiphy-1p8-supply = <&vreg_l12a>;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&imx577_ep1>;
+			};
+		};
+	};
+};
+
+&cci {
+	status = "okay";
+};
+
+&cci_i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	camera@1a {
+		compatible = "sony,imx577";
+		reg = <0x1a>;
+
+		reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam2_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_s4a>;
+
+		port {
+			imx577_ep1: endpoint {
+				link-frequencies = /bits/ 64 <600000000>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+};

-- 
2.34.1


