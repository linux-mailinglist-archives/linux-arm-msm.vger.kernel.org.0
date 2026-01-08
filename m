Return-Path: <linux-arm-msm+bounces-88125-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A4DD0546D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 18:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F2F133AB8AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 17:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCD62882D7;
	Thu,  8 Jan 2026 17:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P42JVFQS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HCo3OcVI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F5228C874
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 17:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891965; cv=none; b=X01ahnpDSkezMVXEvYnN67gC8MVJpkOgWiuRrQOCVmGBg1SU3cw7uJUErtGa1uh1Ph/mYM2Zom3gEwxY+EWzVFbX5n2gPPsdzWRaM/gwb3Hfks19Cttcul+WW8Slv3L+2g374WGyE74EClKlGpREXEzOgw8wVuXgw8SUtiG0fcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891965; c=relaxed/simple;
	bh=+FuAkoT/A+qRScIfZiUxudGNTAwE967gh5qamvKSiIw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SbwfCyH/KKcs4BpEri+/t6C5j+Eby4VnWl2PkK8zyC9aLRj+MChV6OsXoci38R37wfxeNb3MNSWCqKw34bnZQaD12sCMDQMu1AH1OaKQO7aUGxMU4y7FiW6av+xFsVrLJ6pz4MQyQrpRbn9liMwWHpSqryQN8M50XcfmNbrrh7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P42JVFQS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HCo3OcVI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 608FcOFX1422509
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 17:06:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UHmYggVFRTF
	oOqFwOPvTr/lZ9J7uus66Rfo3FPa3PbE=; b=P42JVFQSv4XIkrF4g4/ZDKnqNKR
	fQoIXUiTxydao7ba+RLb/ORuZmrdxcvKEDxyGtBJng+p3N8VejiF6B7S2pFXGKXG
	NnkMPMjhjZGGaeKATJLjoWHPJK3bdrl+b6lBZMGF6am2oN3XCDX+vWMMomJaqKVz
	Aqn3U1VCWVCqt//Y2/yEk+ij3pGOw8T/MZ8fM1syAoe3fdPlU1XtZypHcKPsWFbD
	P75xn5FjVCyS4QA34/sDyN9R16sycJfl4GY7PTVlOLY+6DYb248iCG89SscTKyZg
	WgF1mP7Aq/Qm0qS97aOj8I+Nm0MoU6rcwvAdWO/W5JsDIwt8LDqJkB3jdGw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjfda8af6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 17:06:02 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-55b16794625so2707678e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 09:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767891962; x=1768496762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHmYggVFRTFoOqFwOPvTr/lZ9J7uus66Rfo3FPa3PbE=;
        b=HCo3OcVIIMS5DTyqpx3YqOFRx0F6BcLV82Nk8FICpGjmzLgFFPGZWgennJC/TwHErk
         w/H97QSm18Cd8MoKAPm1pl7ojkP62W7RhWHwkLcsmqzPK60irTh/EuJoiTWapUkJO3nl
         T2nJgQZ3c1YkTCG/NugK9KDmbHSzEysV3L719SiyXcRtsCNHA+uTWjhSnczCQLAf7Crc
         HPPFoHXIzncYO2MdpJzRk3I6R9TRlarxCu01D3VUehekpMJlYqw1kFs1KGu2LTBGFIL3
         frkPRCDHwqW2gNtfhaZiXS6apb/pniFN1jFFDzQsHG6wjUbVmXt1pZy7i7x0m+DJkEAO
         NL4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767891962; x=1768496762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UHmYggVFRTFoOqFwOPvTr/lZ9J7uus66Rfo3FPa3PbE=;
        b=cE+U5KTxFypby1pFC8cwk5M+H6Ulwibpx0Ql+2Mn4CLtzJjzFimXzukBJqu279mpAC
         uGCOVfkc1On1ZK3S02rCOEu/zm2kWd3GYOnDRL47P7yLxGZHxfRE2pV7hjLSmCCNYG0K
         Ok/HMPrV1c9JK2WhdJZh7s329bRTBQY2PLvUI4DZ0s1OktXSeyxSopY7q4lTIQ07dCYO
         srsp3KLLvqW7NjJnzqdw1Bt4JmNsFK+L3oZ4i6QHUNFfIlx/Bkuoc+wSwGwxGquR5rpD
         i8OtN76qyHcuxTJmmt2UKHJTMWA6QxOicNKqXWKmrnvCZCutuvMQOIGI+79JbT58Hw7J
         9RQg==
X-Forwarded-Encrypted: i=1; AJvYcCXASv247ARKR+dk7UJYcwz4kTH1lu3A7B4dDf4YVeM63Ww7JRM6Lu8jEo5TuiC6VlnWycS+PnWpoXvITHr+@vger.kernel.org
X-Gm-Message-State: AOJu0YxP5R/N+eMSHO3BTa6xAG7oBSZ5VHKf/fxvMJsReZA4mGfjOr0q
	lf/uGftDeZQVohSzD+9PemFD/cX4SAaQtr0eV6FmNA69PKJJFF4Q0Pc9Ag6pYAfw3IYSvO4HIYD
	amSkrxwLyFgp1gC8ojtrRFuAlgvpqgSk+CnC87KaSK7W4vEgwvGb2G9pNUwRs5VjNkGM6
X-Gm-Gg: AY/fxX5GFnpFg6SKk3us7axc5/O98Hk6GSp08DZgMOokzrOpI0TcbwIwwTSZPb4rTBE
	emtzd/xZoc5iVE+hAptKUvpxTOYYqCPZxi7q+v89ZX3f7sIhEG1UKTmw3va6VrxtadA4uevnM8P
	K+JQH0cN+JOf2gvep62qDGyGX3GHpa1TZXPzPKPcInhxbHuIeXLmNAabepUlBMBY/lLB7mk2gsS
	z2TeFv6fSDEhWOc+yZU3TNP1G2KqrzD8s4lvCBKXNH9MchuKbWrqOpOLypLTydhu2ChSHBV4cu9
	SBMC/9+KHW0KIJKzGVm39O78zVnAnlcb0iFwX3kp0w9vq7DsEQz5a5kdjrpWn+wqD67JvWFEHn2
	biM84hsRYwwC+Cu0H0Y89UhJPx1qD78CKa/8rLGGThyQMzwewhIDiIMW3ovHy4IjL0NPjB80W6r
	xN
X-Received: by 2002:a05:6122:9003:b0:55b:113f:7e08 with SMTP id 71dfb90a1353d-56347d53d43mr2220957e0c.2.1767891962306;
        Thu, 08 Jan 2026 09:06:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGua9ejuzLdBptsa2pdgON74/BmwcpnFp+U6KFss0UUpjDN8ifed0yCtfxi6LkeGUqXbl3Ypg==
X-Received: by 2002:a05:6122:9003:b0:55b:113f:7e08 with SMTP id 71dfb90a1353d-56347d53d43mr2220905e0c.2.1767891961816;
        Thu, 08 Jan 2026 09:06:01 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:211d:6051:c853:ae97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a2cffb3sm856373466b.31.2026.01.08.09.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 09:06:01 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mchehab@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: [PATCH v4 3/3] arm64: dts: qcom: qrb2210-rb1: Add overlay for vision mezzanine
Date: Thu,  8 Jan 2026 18:05:50 +0100
Message-Id: <20260108170550.359968-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108170550.359968-1-loic.poulain@oss.qualcomm.com>
References: <20260108170550.359968-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ue1ciaSN c=1 sm=1 tr=0 ts=695fe3fa cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=RMWakvN5gFyazINGlFsA:9 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7xC8VMwT9PJP_3OPZKjGsiuXOBdv5tr1
X-Proofpoint-GUID: 7xC8VMwT9PJP_3OPZKjGsiuXOBdv5tr1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDEyNiBTYWx0ZWRfX0qRwusf81QYP
 ZpiKniLB+S+tTcobLddjCCyyY3M2zGlGu4z8ecthS0xgm63lg7hwbxP5EYd/+HaB1zQhCHo2kbT
 K4Qmkz5bXKCb7+n1AOcq/cioWaDB4rmArvxVws47Mu7bOYyr0+KfTFGG42u/mog4zwbnX4hqO8r
 UW4X7V8LYRDMDZFLzgUbW8/XpcQvcA42nRAfEmG7ktXFMH40dH4efhpkT5Emv06+8gKFmoTDJKf
 WHcNC5Ne4YNfHLpNqYdp7zvscRBqo5+OK3Hcl3zA54G7rf9q+Wvm8+vmGxHwHMGNjCBn2vfvtVZ
 sxkQ14Vn7nno4hMO9oNh7wMSp56nDw4ro8RN9K8EHM4+V1NJt2dfPiQoAIN5XAVkuyAoNgTGhM0
 9IiRFGprYIGHGW0/vbU9dv9Yo/9ixqlE/gyCEvhmKoPMdHEMD+OcF6M5TIMEmE34sRrY8wBKyKv
 qZjZfCVqKLS0UWWP+Cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_03,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080126

This initial version includes support for OV9282 camera sensor.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |  5 ++
 .../qcom/qrb2210-rb1-vision-mezzanine.dtso    | 66 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0ccd6ec16dfb..a5d6f451f85c 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -149,6 +149,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-arduino-imola.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1.dtb
+
+qrb2210-rb1-vision-mezzanine-dtbs	:= qrb2210-rb1.dtb qrb2210-rb1-vision-mezzanine.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qrb2210-rb1-vision-mezzanine.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb4210-rb2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
new file mode 100644
index 000000000000..c314cd6dd484
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1-vision-mezzanine.dtso
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/qcom,gcc-qcm2290.h>
+#include <dt-bindings/gpio/gpio.h>
+
+&pm8008 {
+	status = "okay";
+};
+
+&camss {
+	status = "okay";
+
+	vdd-csiphy-1p2-supply = <&pm4125_l5>;
+	vdd-csiphy-1p8-supply = <&pm4125_l13>;
+
+	ports {
+		port@0 {
+			csiphy0_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov9282_ep>;
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
+	/* Vision Mezzanine DIP3-1 must be ON (Selects camera CAM0A&B) */
+	camera@60 {
+		compatible = "ovti,ov9282";
+		reg = <0x60>;
+
+		/* Reset is active-low, but driver applies inverted reset logic */
+		reset-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&mclk3_default>;
+		pinctrl-names = "default";
+
+		clocks = <&gcc GCC_CAMSS_MCLK3_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK3_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		avdd-supply = <&vreg_l3p>;
+		dvdd-supply = <&vreg_l1p>;
+		dovdd-supply = <&vreg_l7p>;
+
+		port {
+			ov9282_ep: endpoint {
+				link-frequencies = /bits/ 64 <400000000>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&csiphy0_ep>;
+                        };
+                };
+	};
+};
-- 
2.34.1


