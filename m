Return-Path: <linux-arm-msm+bounces-86105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F144CD4C55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 07:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09777304FFF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 06:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B2B328B42;
	Mon, 22 Dec 2025 06:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f0Fbjb66";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SXYSBrjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882A73271E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766383433; cv=none; b=DUEBQ/ofMNbsZjWaM2//FQJDmN89Nimmt36jQWi5NdhP1W3hXF5k+C3gMZQRYPmX6R7RCZiYiv7hCY0ddgTUe7iq+Ah9kw/udqMbmYZX6am3tcY75bxGpqeXnnaRqVnFPQExjfvw/5WH319sDeEKfI/AkLNQWIpdF1EuY9eAcRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766383433; c=relaxed/simple;
	bh=mQv4+Bd79zv4noswzg8vtNCZBOYQlBkKhK9Swo1fO8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=poXPqYlduN4edDct8b+9JjRTd27E8IGbYCZdB6bctNbfdtDTJpBaR8ZxCmargINSeX63i4d+kODcgOg+s500hMSRzUkav4PC9HqFOyHm1yXNUcPmZndmsPhvDA9WMnrSuVevWbtSX39vxYWFLUy0LeuXKrKjNgy0240Xp9CMWcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f0Fbjb66; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SXYSBrjB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM5gEQP2189759
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O6g0TtHCzpC
	CjfO+Zl1o4E9vNSzGGitZeUErMTiBp70=; b=f0Fbjb66axkrOFel78g9Pg+YQO7
	w6sCGNozl1UpRr30q2zEWw0Qz0PZ/TETm7ZcnSrKxSdvqQDh/p2cgH8PQOFZPkHr
	93RrG4T0/WWeb6D4W9BzmcPU5FSAts5b6w0k9j53XQAtiwTFOsNAB5cXctKlshXx
	87iXDhAG47WuW99hG5IdhKe9zWGtNULk/Mmw4HNeWzc6b+ZG7ph2rRnUFNcTK4uk
	NBfbG3UoUbXE7rhYlsmtWx8/kwG/g2dVefXW2fuFHbDhq9AdOImttofJUJz7du8N
	goA49UTLJ1VJwZqzJy8zyTN+m8D0xgTW4A5UWZb+/6PRJHp/CUR2TJK2klw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b702t81vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 06:03:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b89c1ce9cfso4446851b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 22:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766383426; x=1766988226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6g0TtHCzpCCjfO+Zl1o4E9vNSzGGitZeUErMTiBp70=;
        b=SXYSBrjBs84cIzui6FR3ovFz7MtfJubg6IyRF4AwyvQknFF3hTbNzSBBS73+N213iO
         L99BWPC+Yr/QItrSJUiaCbM9GgM1oS0inTmiEWidu6NGHB6/KMB/FR+mfGSZCeASTlYX
         T3Aii6va1/dqVl7WekrmK5IJT8Xr9e6KZEuykigmCdqedJRDJwR5tuG6RrFyFXc9Adzq
         MJB59QFfNMp8v4uguu0RVYRh1ii3qusj+9doMnPTs8obqKTP+MBAppWGhC67xetmAojj
         AI50g2YoCeI29ctBFyOxyYZlTHw6FNncpUNbEJFkedN7q6xnJYtAnfD9zQNGXtW7ERmG
         4zqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766383426; x=1766988226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O6g0TtHCzpCCjfO+Zl1o4E9vNSzGGitZeUErMTiBp70=;
        b=PZkEuWj0o7cuRvx13uG4kM8pJ5Xj6uTMBL2g03wTL4uwf2UeXg9OlrF7YoBxnAD3QK
         WgXLozhJkHgLUqg11ME4ZS03IoYnG9pbjsk9CBUGtbqRTbBXH6mM9Qa7g8dhqNxMkl7k
         VHC9bGtRKRqACMDSvZAX/4ijb8PyklbUukFKeYjsqJ43zRttH49fCfyc2L+4Hl0vwINe
         rStm8WFEVnjLEUoyVD93fQn2lABtGjwdyTKH77OnHz0AHojNSZ2NiW6CasFErRMeFrPs
         MAq4uPcVOzOe8fngVqurWm4gjO7AeRJ38sZGwFol0m5YrsRCOp34/9WESbNqVFCvqZz4
         jzEw==
X-Gm-Message-State: AOJu0YxXnBt6Ud1QoQquxe3OwR8ztt1C5zgU9l32yXivhPRVNxIz5TcW
	+QWakwwhhDcA2Yk0iQaGtohhNNKi6fS6qysqqCRtPNe3HlxPqgYBm3qLOBnhBZU6umVibc4nStC
	ktu3PESnuvX25X6sa9koVvHaF4I0Rifb8sRfN4zqahupWBYf8NOeNj2qfMp35gA4/dNIi
X-Gm-Gg: AY/fxX5LK0+Se/TADXihPR1qN493vdPlW7ctSJ0C89u3NogfYejollbblthLlB2Ns9n
	2QaOA6F712xzrdyq6ycweHqswokByVcGI3jb2hh1C32SsOiRnwNvINSI+T2nKNyRDMUQ62fxMzV
	Ilm5qrD3yF3BzozSnvx+50fNxbDEBzX3LD8B4OWlHqyo1oj8XAdw7ersXIf5aksAmn8QQhZ2qcq
	+Tqh21DhtHQGeRHWAJjy8XAjxPfX35pFxjsamlG0xyTqRHF0d5nvhouULlhq4ljE1kPSwa1Grh5
	elnGjP7eZNF+SpZcISdZ1D6AwrOLwsWnbbCqtsQyRkVIaxr28O/RKK2tTETCOuM4HLiMsL1fUAg
	WgoeumbrHrcqYRvATGOMKYVDeM8r+nhW3WnV4us8JET1KnxPD2kIVXbb6+i9BaxeqVWI8NixqG8
	Q=
X-Received: by 2002:a05:6a21:6d98:b0:364:86a:46b2 with SMTP id adf61e73a8af0-376a9ccbb0bmr10044091637.57.1766383425358;
        Sun, 21 Dec 2025 22:03:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWvfKrfzLP0IBlY81E1BWEZS0633wnqfCZRadnc90GqjG/vFRsrC6I1scd4mq741qUMVhbXw==
X-Received: by 2002:a05:6a21:6d98:b0:364:86a:46b2 with SMTP id adf61e73a8af0-376a9ccbb0bmr10044052637.57.1766383424476;
        Sun, 21 Dec 2025 22:03:44 -0800 (PST)
Received: from yijiyang-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e769c347asm5846668a91.0.2025.12.21.22.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 22:03:44 -0800 (PST)
From: YijieYang <yijie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: qcom: Commonize IQ-X-IOT DTSI
Date: Mon, 22 Dec 2025 14:03:28 +0800
Message-Id: <20251222060335.3485729-3-yijie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
References: <20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SIhPlevH c=1 sm=1 tr=0 ts=6948df43 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NDxcHBdl3gnZmD__7mcA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: z6l5YzpUGWNX6VGQywT5qFfPvDORquGC
X-Proofpoint-GUID: z6l5YzpUGWNX6VGQywT5qFfPvDORquGC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA1MiBTYWx0ZWRfXyYN306y9Oo8J
 w1k+bPeOT7w9YDsiFGn2EtN369m28Nd/xMPtisbJXWbmOCVQafH5uskAp8OdkbmZfMfquqOOnyc
 UIgkybQ6SdFYKvDoyiCGi+VW2L/n0Hsl+I73eS7oGuFih8cWfsINZfVC7OZufHmg2QuzFBh9rWn
 x/rbeTeRHTtlNF7Riii8rGl4EEsaHCIye991EBemaV0GeZWErt0GVpAeZQWJnB27Pzq0PRZP0Re
 FpTPqtP1w6J4fPI0Bsp1qZJW1H0clFEdNBbXZ02NVtv2TgYDE+XZJsycbJ69fGiX/nkLngsz31+
 TOtN/MsY9EUt9nmESqW6LTMeuw6HW3KGi9z6TgLVs8VD+LQ2yYeonpURy8S0XHAewnMGdERrhzP
 GCO9pv4XAbZe8B+Ml4XsiBkXEAFiXGdB+cRFB2W87RK+m0Zvc9zalnBZV58KwCvsg3XRzVuuKXu
 DPj0/fDptiqUCm6VADA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220052

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

HAMOA-IOT-EVK and PURWA-IOT-EVK share a similar board design. Extract
the common components into separate files for better maintainability.

PURWA-IOT-EVK shares almost the same hardware design with HAMOA-IOT-EVK,
except for differences in the BOM. The differences between the two boards
include the following:
- USB0 on Purwa uses the PS8833 as a retimer, while on Hamoa it uses the
  FSUSB42 as an SBU mode selector.
- Purwa has only one camera, whereas Hamoa includes two.
- Purwa provides a 4-lane PCIe3 interface, while Hamoa offers an 8-lane
  configuration.
- The videos on Purwa and Hamoa differ because their clocks and frequencies
  are not aligned.

Purwa and Hamoa are IoT variants of x1p42100 and x1e80100, both based on
the IQ-X SoC series. Consequently, the two common files in this series are
prefixed with 'iq-x-iot' to reflect this relationship.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts    | 1328 ++---------------
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi   |  633 +-------
 .../{hamoa-iot-evk.dts => iq-x-iot-evk.dtsi}  |   74 +-
 .../{hamoa-iot-som.dtsi => iq-x-iot-som.dtsi} |    9 -
 4 files changed, 104 insertions(+), 1940 deletions(-)
 rewrite arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts (95%)
 rewrite arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi (98%)
 copy arch/arm64/boot/dts/qcom/{hamoa-iot-evk.dts => iq-x-iot-evk.dtsi} (94%)
 copy arch/arm64/boot/dts/qcom/{hamoa-iot-som.dtsi => iq-x-iot-som.dtsi} (99%)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
dissimilarity index 95%
index 36dd6599402b..418d8a6c573b 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -1,1242 +1,86 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
- */
-
-/dts-v1/;
-
-#include "hamoa-iot-som.dtsi"
-
-/ {
-	model = "Qualcomm Technologies, Inc. Hamoa IoT EVK";
-	compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";
-	chassis-type = "embedded";
-
-	aliases {
-		serial0 = &uart21;
-		serial1 = &uart14;
-	};
-
-	wcd938x: audio-codec {
-		compatible = "qcom,wcd9385-codec";
-
-		pinctrl-0 = <&wcd_default>;
-		pinctrl-names = "default";
-
-		reset-gpios = <&tlmm 191 GPIO_ACTIVE_LOW>;
-
-		qcom,micbias1-microvolt = <1800000>;
-		qcom,micbias2-microvolt = <1800000>;
-		qcom,micbias3-microvolt = <1800000>;
-		qcom,micbias4-microvolt = <1800000>;
-		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000
-							 500000 500000 500000 500000>;
-		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
-		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
-		qcom,rx-device = <&wcd_rx>;
-		qcom,tx-device = <&wcd_tx>;
-
-		vdd-buck-supply = <&vreg_l15b_1p8>;
-		vdd-rxtx-supply = <&vreg_l15b_1p8>;
-		vdd-io-supply = <&vreg_l15b_1p8>;
-		vdd-mic-bias-supply = <&vreg_bob1>;
-
-		#sound-dai-cells = <1>;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	pmic-glink {
-		compatible = "qcom,x1e80100-pmic-glink",
-			     "qcom,sm8550-pmic-glink",
-			     "qcom,pmic-glink";
-		#address-cells = <1>;
-		#size-cells = <0>;
-		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
-				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
-				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
-
-		connector@0 {
-			compatible = "usb-c-connector";
-			reg = <0>;
-			power-role = "dual";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_ss0_hs_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss0_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
-					};
-				};
-
-				port@2 {
-					reg = <2>;
-
-					pmic_glink_ss0_sbu: endpoint {
-						remote-endpoint = <&usb_1_ss0_sbu_mux>;
-					};
-				};
-			};
-		};
-
-		connector@1 {
-			compatible = "usb-c-connector";
-			reg = <1>;
-			power-role = "dual";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_ss1_hs_in: endpoint {
-						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss1_ss_in: endpoint {
-						remote-endpoint = <&retimer_ss1_ss_out>;
-					};
-				};
-
-				port@2 {
-					reg = <2>;
-
-					pmic_glink_ss1_con_sbu_in: endpoint {
-						remote-endpoint = <&retimer_ss1_con_sbu_out>;
-					};
-				};
-			};
-		};
-
-		connector@2 {
-			compatible = "usb-c-connector";
-			reg = <2>;
-			power-role = "dual";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_ss2_hs_in: endpoint {
-						remote-endpoint = <&usb_1_ss2_dwc3_hs>;
-					};
-				};
-
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss2_ss_in: endpoint {
-						remote-endpoint = <&retimer_ss2_ss_out>;
-					};
-				};
-
-				port@2 {
-					reg = <2>;
-
-					pmic_glink_ss2_con_sbu_in: endpoint {
-						remote-endpoint = <&retimer_ss2_con_sbu_out>;
-					};
-				};
-			};
-		};
-	};
-
-	vreg_edp_3p3: regulator-edp-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_EDP_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_nvme: regulator-nvme {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_NVME_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&nvme_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	/* Left unused as the retimer is not used on this board. */
-	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR0_1P15";
-		regulator-min-microvolt = <1150000>;
-		regulator-max-microvolt = <1150000>;
-
-		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb0_pwr_1p15_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR0_1P8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-
-		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb0_1p8_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR0_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb0_3p3_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR1_1P15";
-		regulator-min-microvolt = <1150000>;
-		regulator-max-microvolt = <1150000>;
-
-		gpio = <&tlmm 188 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb1_pwr_1p15_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR1_1P8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-
-		gpio = <&tlmm 175 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb1_pwr_1p8_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR1_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 186 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb1_pwr_3p3_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr2_1p15: regulator-rtmr2-1p15 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR2_1P15";
-		regulator-min-microvolt = <1150000>;
-		regulator-max-microvolt = <1150000>;
-
-		gpio = <&tlmm 189 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb2_pwr_1p15_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr2_1p8: regulator-rtmr2-1p8 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR2_1P8";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-
-		gpio = <&tlmm 126 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb2_pwr_1p8_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_rtmr2_3p3: regulator-rtmr2-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_RTMR2_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 187 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&usb2_pwr_3p3_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vph_pwr: regulator-vph-pwr {
-		compatible = "regulator-fixed";
-
-		regulator-name = "vph_pwr";
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
-
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	/*
-	 * TODO: These two regulators are actually part of the removable M.2
-	 * card and not the EVK mainboard. Need to describe this differently.
-	 * Functionally it works correctly, because all we need to do is to
-	 * turn on the actual 3.3V supply above.
-	 */
-	vreg_wcn_0p95: regulator-wcn-0p95 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_0P95";
-		regulator-min-microvolt = <950000>;
-		regulator-max-microvolt = <950000>;
-
-		vin-supply = <&vreg_wcn_3p3>;
-	};
-
-	vreg_wcn_1p9: regulator-wcn-1p9 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_1P9";
-		regulator-min-microvolt = <1900000>;
-		regulator-max-microvolt = <1900000>;
-
-		vin-supply = <&vreg_wcn_3p3>;
-	};
-
-	vreg_wcn_3p3: regulator-wcn-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&wcn_sw_en>;
-		pinctrl-names = "default";
-
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	vreg_wwan: regulator-wwan {
-		compatible = "regulator-fixed";
-
-		regulator-name = "SDX_VPH_PWR";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 221 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&wwan_sw_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	sound {
-		compatible = "qcom,x1e80100-sndcard";
-		model = "X1E80100-EVK";
-		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
-				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
-				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
-				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
-				"IN1_HPHL", "HPHL_OUT",
-				"IN2_HPHR", "HPHR_OUT",
-				"AMIC2", "MIC BIAS2",
-				"VA DMIC0", "MIC BIAS3",
-				"VA DMIC1", "MIC BIAS3",
-				"VA DMIC2", "MIC BIAS1",
-				"VA DMIC3", "MIC BIAS1",
-				"TX SWR_INPUT1", "ADC2_OUTPUT";
-
-		wcd-playback-dai-link {
-			link-name = "WCD Playback";
-
-			codec {
-				sound-dai = <&wcd938x 0>, <&swr1 0>, <&lpass_rxmacro 0>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		wcd-capture-dai-link {
-			link-name = "WCD Capture";
-
-			codec {
-				sound-dai = <&wcd938x 1>, <&swr2 1>, <&lpass_txmacro 0>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		wsa-dai-link {
-			link-name = "WSA Playback";
-
-			codec {
-				sound-dai = <&left_woofer>,
-					    <&left_tweeter>,
-					    <&swr0 0>,
-					    <&lpass_wsamacro 0>,
-					    <&right_woofer>,
-					    <&right_tweeter>,
-					    <&swr3 0>,
-					    <&lpass_wsa2macro 0>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-
-		va-dai-link {
-			link-name = "VA Capture";
-
-			codec {
-				sound-dai = <&lpass_vamacro 0>;
-			};
-
-			cpu {
-				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
-			};
-
-			platform {
-				sound-dai = <&q6apm>;
-			};
-		};
-	};
-
-	usb-1-ss0-sbu-mux {
-		compatible = "onnn,fsusb42", "gpio-sbu-mux";
-
-		enable-gpios = <&tlmm 168 GPIO_ACTIVE_LOW>;
-		select-gpios = <&tlmm 167 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&usb_1_ss0_sbu_default>;
-		pinctrl-names = "default";
-
-		mode-switch;
-		orientation-switch;
-
-		port {
-			usb_1_ss0_sbu_mux: endpoint {
-				remote-endpoint = <&pmic_glink_ss0_sbu>;
-			};
-		};
-	};
-
-	wcn7850-pmu {
-		compatible = "qcom,wcn7850-pmu";
-
-		vdd-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_l15b_1p8>;
-		vddaon-supply = <&vreg_wcn_0p95>;
-		vdddig-supply = <&vreg_wcn_0p95>;
-		vddrfa1p2-supply = <&vreg_wcn_1p9>;
-		vddrfa1p8-supply = <&vreg_wcn_1p9>;
-
-		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
-		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&wcn_bt_en>;
-		pinctrl-names = "default";
-
-		regulators {
-			vreg_pmu_rfa_cmn: ldo0 {
-				regulator-name = "vreg_pmu_rfa_cmn";
-			};
-
-			vreg_pmu_aon_0p59: ldo1 {
-				regulator-name = "vreg_pmu_aon_0p59";
-			};
-
-			vreg_pmu_wlcx_0p8: ldo2 {
-				regulator-name = "vreg_pmu_wlcx_0p8";
-			};
-
-			vreg_pmu_wlmx_0p85: ldo3 {
-				regulator-name = "vreg_pmu_wlmx_0p85";
-			};
-
-			vreg_pmu_btcmx_0p85: ldo4 {
-				regulator-name = "vreg_pmu_btcmx_0p85";
-			};
-
-			vreg_pmu_rfa_0p8: ldo5 {
-				regulator-name = "vreg_pmu_rfa_0p8";
-			};
-
-			vreg_pmu_rfa_1p2: ldo6 {
-				regulator-name = "vreg_pmu_rfa_1p2";
-			};
-
-			vreg_pmu_rfa_1p8: ldo7 {
-				regulator-name = "vreg_pmu_rfa_1p8";
-			};
-
-			vreg_pmu_pcie_0p9: ldo8 {
-				regulator-name = "vreg_pmu_pcie_0p9";
-			};
-
-			vreg_pmu_pcie_1p8: ldo9 {
-				regulator-name = "vreg_pmu_pcie_1p8";
-			};
-		};
-	};
-};
-
-&i2c1 {
-	clock-frequency = <400000>;
-	status = "okay";
-
-	typec-mux@8 {
-		compatible = "parade,ps8830";
-		reg = <0x08>;
-
-		clocks = <&rpmhcc RPMH_RF_CLK5>;
-
-		vdd-supply = <&vreg_rtmr2_1p15>;
-		vdd33-supply = <&vreg_rtmr2_3p3>;
-		vdd33-cap-supply = <&vreg_rtmr2_3p3>;
-		vddar-supply = <&vreg_rtmr2_1p15>;
-		vddat-supply = <&vreg_rtmr2_1p15>;
-		vddio-supply = <&vreg_rtmr2_1p8>;
-
-		reset-gpios = <&tlmm 185 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&rtmr2_default>;
-		pinctrl-names = "default";
-
-		orientation-switch;
-		retimer-switch;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				retimer_ss2_ss_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss2_ss_in>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				retimer_ss2_ss_in: endpoint {
-					remote-endpoint = <&usb_1_ss2_qmpphy_out>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-
-				retimer_ss2_con_sbu_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss2_con_sbu_in>;
-				};
-			};
-		};
-	};
-};
-
-&i2c5 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	eusb3_repeater: redriver@47 {
-		compatible = "nxp,ptn3222";
-		reg = <0x47>;
-		#phy-cells = <0>;
-
-		vdd3v3-supply = <&vreg_l13b_3p0>;
-		vdd1v8-supply = <&vreg_l4b_1p8>;
-
-		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&eusb3_reset_n>;
-		pinctrl-names = "default";
-	};
-
-	eusb5_repeater: redriver@43 {
-		compatible = "nxp,ptn3222";
-		reg = <0x43>;
-		#phy-cells = <0>;
-
-		vdd3v3-supply = <&vreg_l13b_3p0>;
-		vdd1v8-supply = <&vreg_l4b_1p8>;
-
-		reset-gpios = <&tlmm 7 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&eusb5_reset_n>;
-		pinctrl-names = "default";
-	};
-
-	eusb6_repeater: redriver@4f {
-		compatible = "nxp,ptn3222";
-		reg = <0x4f>;
-		#phy-cells = <0>;
-
-		vdd3v3-supply = <&vreg_l13b_3p0>;
-		vdd1v8-supply = <&vreg_l4b_1p8>;
-
-		reset-gpios = <&tlmm 184 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&eusb6_reset_n>;
-		pinctrl-names = "default";
-	};
-};
-
-&i2c7 {
-	clock-frequency = <400000>;
-
-	status = "okay";
-
-	typec-mux@8 {
-		compatible = "parade,ps8830";
-		reg = <0x8>;
-
-		clocks = <&rpmhcc RPMH_RF_CLK4>;
-
-		vdd-supply = <&vreg_rtmr1_1p15>;
-		vdd33-supply = <&vreg_rtmr1_3p3>;
-		vdd33-cap-supply = <&vreg_rtmr1_3p3>;
-		vddar-supply = <&vreg_rtmr1_1p15>;
-		vddat-supply = <&vreg_rtmr1_1p15>;
-		vddio-supply = <&vreg_rtmr1_1p8>;
-
-		reset-gpios = <&tlmm 176 GPIO_ACTIVE_LOW>;
-
-		pinctrl-0 = <&rtmr1_default>;
-		pinctrl-names = "default";
-
-		retimer-switch;
-		orientation-switch;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				retimer_ss1_ss_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss1_ss_in>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				retimer_ss1_ss_in: endpoint {
-					remote-endpoint = <&usb_1_ss1_qmpphy_out>;
-				};
-			};
-
-			port@2 {
-				reg = <2>;
-
-				retimer_ss1_con_sbu_out: endpoint {
-					remote-endpoint = <&pmic_glink_ss1_con_sbu_in>;
-				};
-			};
-		};
-	};
-};
-
-&lpass_tlmm {
-	spkr_0_sd_n_active: spkr-0-sd-n-active-state {
-		pins = "gpio12";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
-		pins = "gpio13";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	spkr_2_sd_n_active: spkr-2-sd-n-active-state {
-		pins = "gpio17";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	spkr_3_sd_n_active: spkr-3-sd-n-active-state {
-		pins = "gpio18";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-};
-
-&lpass_vamacro {
-	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
-	pinctrl-names = "default";
-
-	vdd-micb-supply = <&vreg_l1b_1p8>;
-	qcom,dmic-sample-rate = <4800000>;
-};
-
-&mdss {
-	status = "okay";
-};
-
-&mdss_dp0 {
-	status = "okay";
-};
-
-&mdss_dp0_out {
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-};
-
-&mdss_dp1 {
-	status = "okay";
-};
-
-&mdss_dp1_out {
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-};
-
-&mdss_dp2 {
-	status = "okay";
-};
-
-&mdss_dp2_out {
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-};
-
-&mdss_dp3 {
-	/delete-property/ #sound-dai-cells;
-
-	pinctrl-0 = <&edp0_hpd_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	aux-bus {
-		panel {
-			compatible = "edp-panel";
-			power-supply = <&vreg_edp_3p3>;
-
-			port {
-				edp_panel_in: endpoint {
-					remote-endpoint = <&mdss_dp3_out>;
-				};
-			};
-		};
-	};
-};
-
-&mdss_dp3_out {
-	data-lanes = <0 1 2 3>;
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-
-	remote-endpoint = <&edp_panel_in>;
-};
-
-&mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
-	vdda-pll-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
-};
-
-&pcie6a {
-	vddpe-3v3-supply = <&vreg_nvme>;
-};
-
-&pm8550_gpios {
-	rtmr0_default: rtmr0-reset-n-active-state {
-		pins = "gpio10";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
-
-	usb0_3p3_reg_en: usb0-3p3-reg-en-state {
-		pins = "gpio11";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
-};
-
-&pm8550ve_9_gpios {
-	usb0_1p8_reg_en: usb0-1p8-reg-en-state {
-		pins = "gpio8";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
-};
-
-&pmc8380_5_gpios {
-	usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
-		pins = "gpio8";
-		function = "normal";
-		power-source = <1>; /* 1.8V */
-		bias-disable;
-		input-disable;
-		output-enable;
-	};
-};
-
-&smb2360_0 {
-	status = "okay";
-};
-
-&smb2360_0_eusb2_repeater {
-	vdd18-supply = <&vreg_l3d_1p8>;
-	vdd3-supply = <&vreg_l2b_3p0>;
-};
-
-&smb2360_1 {
-	status = "okay";
-};
-
-&smb2360_1_eusb2_repeater {
-	vdd18-supply = <&vreg_l3d_1p8>;
-	vdd3-supply = <&vreg_l14b_3p0>;
-};
-
-&smb2360_2 {
-	status = "okay";
-};
-
-&smb2360_2_eusb2_repeater {
-	vdd18-supply = <&vreg_l3d_1p8>;
-	vdd3-supply = <&vreg_l8b_3p0>;
-};
-
-&swr0 {
-	status = "okay";
-
-	pinctrl-0 = <&wsa_swr_active>;
-	pinctrl-names = "default";
-
-	/* WSA8845, Left Woofer */
-	left_woofer: speaker@0,0 {
-		compatible = "sdw20217020400";
-		pinctrl-0 = <&spkr_0_sd_n_active>;
-		pinctrl-names = "default";
-		reg = <0 0>;
-		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "WooferLeft";
-		vdd-1p8-supply = <&vreg_l15b_1p8>;
-		vdd-io-supply = <&vreg_l12b_1p2>;
-		qcom,port-mapping = <1 2 3 7 10 13>;
-	};
-
-	/* WSA8845, Left Tweeter */
-	left_tweeter: speaker@0,1 {
-		compatible = "sdw20217020400";
-		pinctrl-0 = <&spkr_1_sd_n_active>;
-		pinctrl-names = "default";
-		reg = <0 1>;
-		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "TweeterLeft";
-		vdd-1p8-supply = <&vreg_l15b_1p8>;
-		vdd-io-supply = <&vreg_l12b_1p2>;
-		qcom,port-mapping = <4 5 6 7 11 13>;
-	};
-};
-
-&swr1 {
-	status = "okay";
-
-	/* WCD9385 RX */
-	wcd_rx: codec@0,4 {
-		compatible = "sdw20217010d00";
-		reg = <0 4>;
-		qcom,rx-port-mapping = <1 2 3 4 5>;
-	};
-};
-
-&swr2 {
-	status = "okay";
-
-	/* WCD9385 TX */
-	wcd_tx: codec@0,3 {
-		compatible = "sdw20217010d00";
-		reg = <0 3>;
-		qcom,tx-port-mapping = <2 2 3 4>;
-	};
-};
-
-&swr3 {
-	status = "okay";
-
-	pinctrl-0 = <&wsa2_swr_active>;
-	pinctrl-names = "default";
-
-	/* WSA8845, Right Woofer */
-	right_woofer: speaker@0,0 {
-		compatible = "sdw20217020400";
-		pinctrl-0 = <&spkr_2_sd_n_active>;
-		pinctrl-names = "default";
-		reg = <0 0>;
-		reset-gpios = <&lpass_tlmm 17 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "WooferRight";
-		vdd-1p8-supply = <&vreg_l15b_1p8>;
-		vdd-io-supply = <&vreg_l12b_1p2>;
-		qcom,port-mapping = <1 2 3 7 10 13>;
-	};
-
-	/* WSA8845, Right Tweeter */
-	right_tweeter: speaker@0,1 {
-		compatible = "sdw20217020400";
-		pinctrl-0 = <&spkr_3_sd_n_active>;
-		pinctrl-names = "default";
-		reg = <0 1>;
-		reset-gpios = <&lpass_tlmm 18 GPIO_ACTIVE_LOW>;
-		#sound-dai-cells = <0>;
-		sound-name-prefix = "TweeterRight";
-		vdd-1p8-supply = <&vreg_l15b_1p8>;
-		vdd-io-supply = <&vreg_l12b_1p2>;
-		qcom,port-mapping = <4 5 6 7 11 13>;
-	};
-};
-
-&tlmm {
-	edp_reg_en: edp-reg-en-state {
-		pins = "gpio70";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
-	eusb3_reset_n: eusb3-reset-n-state {
-		pins = "gpio6";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-		output-low;
-	};
-
-	eusb5_reset_n: eusb5-reset-n-state {
-		pins = "gpio7";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-		output-low;
-	};
-
-	eusb6_reset_n: eusb6-reset-n-state {
-		pins = "gpio184";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-		output-low;
-	};
-
-	nvme_reg_en: nvme-reg-en-state {
-		pins = "gpio18";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	rtmr1_default: rtmr1-reset-n-active-state {
-		pins = "gpio176";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	rtmr2_default: rtmr2-reset-n-active-state {
-		pins = "gpio185";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
-		pins = "gpio188";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	usb1_pwr_1p8_reg_en: usb1-pwr-1p8-reg-en-state {
-		pins = "gpio175";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	usb1_pwr_3p3_reg_en: usb1-pwr-3p3-reg-en-state {
-		pins = "gpio186";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	usb2_pwr_1p15_reg_en: usb2-pwr-1p15-reg-en-state {
-		pins = "gpio189";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	usb2_pwr_1p8_reg_en: usb2-pwr-1p8-reg-en-state {
-		pins = "gpio126";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	usb2_pwr_3p3_reg_en: usb2-pwr-3p3-reg-en-state {
-		pins = "gpio187";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
-		mode-pins {
-			pins = "gpio166";
-			function = "gpio";
-			bias-disable;
-			drive-strength = <2>;
-			output-high;
-		};
-
-		oe-n-pins {
-			pins = "gpio168";
-			function = "gpio";
-			bias-disable;
-			drive-strength = <2>;
-		};
-
-		sel-pins {
-			pins = "gpio167";
-			function = "gpio";
-			bias-disable;
-			drive-strength = <2>;
-		};
-	};
-
-	wcd_default: wcd-reset-n-active-state {
-		pins = "gpio191";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-		output-low;
-	};
-
-	wcn_bt_en: wcn-bt-en-state {
-		pins = "gpio116";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	wwan_sw_en: wwan-sw-en-state {
-		pins = "gpio221";
-		function = "gpio";
-		drive-strength = <4>;
-		bias-disable;
-	};
-
-	wcn_sw_en: wcn-sw-en-state {
-		pins = "gpio214";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	/* Switches USB signal routing between the USB connector and the Wi-Fi card. */
-	wcn_usb_sw_n: wcn-usb-sw-n-state {
-		pins = "gpio225";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-		output-high;
-	};
-};
-
-&uart14 {
-	status = "okay";
-
-	bluetooth {
-		compatible = "qcom,wcn7850-bt";
-		max-speed = <3200000>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
-	};
-};
-
-&uart21 {
-	compatible = "qcom,geni-debug-uart";
-
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3_hs {
-	remote-endpoint = <&pmic_glink_ss0_hs_in>;
-};
-
-&usb_1_ss0_hsphy {
-	phys = <&smb2360_0_eusb2_repeater>;
-};
-
-&usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
-};
-
-&usb_1_ss1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_ss1_hs_in>;
-};
-
-&usb_1_ss1_hsphy {
-	phys = <&smb2360_1_eusb2_repeater>;
-};
-
-&usb_1_ss1_qmpphy_out {
-	remote-endpoint = <&retimer_ss1_ss_in>;
-};
-
-&usb_1_ss2_dwc3_hs {
-	remote-endpoint = <&pmic_glink_ss2_hs_in>;
-};
-
-&usb_1_ss2_hsphy {
-	phys = <&smb2360_2_eusb2_repeater>;
-};
-
-&usb_1_ss2_qmpphy_out {
-	remote-endpoint = <&retimer_ss2_ss_in>;
-};
-
-&usb_2_hsphy {
-	phys = <&eusb5_repeater>;
-
-	pinctrl-0 = <&wcn_usb_sw_n>;
-	pinctrl-names = "default";
-};
-
-&usb_mp_hsphy0 {
-	phys = <&eusb3_repeater>;
-};
-
-&usb_mp_hsphy1 {
-	phys = <&eusb6_repeater>;
-};
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "hamoa-iot-som.dtsi"
+#include "iq-x-iot-evk.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. Hamoa IoT EVK";
+	compatible = "qcom,hamoa-iot-evk",
+		     "qcom,hamoa-iot-som",
+		     "qcom,x1e80100";
+
+	usb-1-ss0-sbu-mux {
+		compatible = "onnn,fsusb42", "gpio-sbu-mux";
+
+		enable-gpios = <&tlmm 168 GPIO_ACTIVE_LOW>;
+		select-gpios = <&tlmm 167 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb_1_ss0_sbu_default>;
+		pinctrl-names = "default";
+
+		mode-switch;
+		orientation-switch;
+
+		port {
+			usb_1_ss0_sbu_mux: endpoint {
+				remote-endpoint = <&pmic_glink_ss0_sbu>;
+			};
+		};
+	};
+};
+
+
+&pmic_glink_port0 {
+	reg = <0>;
+	pmic_glink_ss0_hs_in: endpoint {
+		remote-endpoint = <&usb_1_ss0_dwc3_hs>;
+	};
+};
+&pmic_glink_port1 {
+	reg = <1>;
+	pmic_glink_ss0_ss_in: endpoint {
+		remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+	};
+};
+&pmic_glink_port2 {
+	reg = <2>;
+	pmic_glink_ss0_sbu: endpoint {
+		remote-endpoint = <&usb_1_ss0_sbu_mux>;
+	};
+};
+
+&tlmm {
+	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
+		mode-pins {
+			pins = "gpio166";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+			output-high;
+		};
+
+		oe-n-pins {
+			pins = "gpio168";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		sel-pins {
+			pins = "gpio167";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
+};
+
+
+&usb_1_ss0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
dissimilarity index 98%
index 4a69852e9176..983b144047bc 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -1,618 +1,15 @@
-// SPDX-License-Identifier: BSD-3-Clause
-/*
- * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
- */
-
-#include "hamoa.dtsi"
-#include "hamoa-pmics.dtsi"
-#include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
-
-/ {
-	reserved-memory {
-		linux,cma {
-			compatible = "shared-dma-pool";
-			size = <0x0 0x8000000>;
-			reusable;
-			linux,cma-default;
-		};
-	};
-};
-
-&apps_rsc {
-	/* PMC8380C_B */
-	regulators-0 {
-		compatible = "qcom,pm8550-rpmh-regulators";
-		qcom,pmic-id = "b";
-
-		vdd-bob1-supply = <&vph_pwr>;
-		vdd-bob2-supply = <&vph_pwr>;
-		vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
-		vdd-l2-l13-l14-supply = <&vreg_bob1>;
-		vdd-l5-l16-supply = <&vreg_bob1>;
-		vdd-l6-l7-supply = <&vreg_bob2>;
-		vdd-l8-l9-supply = <&vreg_bob1>;
-		vdd-l12-supply = <&vreg_s5j_1p2>;
-		vdd-l15-supply = <&vreg_s4c_1p8>;
-		vdd-l17-supply = <&vreg_bob2>;
-
-		vreg_bob1: bob1 {
-			regulator-name = "vreg_bob1";
-			regulator-min-microvolt = <3008000>;
-			regulator-max-microvolt = <3960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_bob2: bob2 {
-			regulator-name = "vreg_bob2";
-			regulator-min-microvolt = <2504000>;
-			regulator-max-microvolt = <3008000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1b_1p8: ldo1 {
-			regulator-name = "vreg_l1b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2b_3p0: ldo2 {
-			regulator-name = "vreg_l2b_3p0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l4b_1p8: ldo4 {
-			regulator-name = "vreg_l4b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l5b_3p0: ldo5 {
-			regulator-name = "vreg_l5b_3p0";
-			regulator-min-microvolt = <3000000>;
-			regulator-max-microvolt = <3000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l6b_1p8: ldo6 {
-			regulator-name = "vreg_l6b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l7b_2p8: ldo7 {
-			regulator-name = "vreg_l7b_2p8";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l8b_3p0: ldo8 {
-			regulator-name = "vreg_l8b_3p0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3072000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l9b_2p9: ldo9 {
-			regulator-name = "vreg_l9b_2p9";
-			regulator-min-microvolt = <2960000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l10b_1p8: ldo10 {
-			regulator-name = "vreg_l10b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l12b_1p2: ldo12 {
-			regulator-name = "vreg_l12b_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
-		};
-
-		vreg_l13b_3p0: ldo13 {
-			regulator-name = "vreg_l13b_3p0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l14b_3p0: ldo14 {
-			regulator-name = "vreg_l14b_3p0";
-			regulator-min-microvolt = <3072000>;
-			regulator-max-microvolt = <3072000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l15b_1p8: ldo15 {
-			regulator-name = "vreg_l15b_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-			regulator-always-on;
-		};
-
-		vreg_l16b_2p9: ldo16 {
-			regulator-name = "vreg_l16b_2p9";
-			regulator-min-microvolt = <2912000>;
-			regulator-max-microvolt = <2912000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l17b_2p5: ldo17 {
-			regulator-name = "vreg_l17b_2p5";
-			regulator-min-microvolt = <2504000>;
-			regulator-max-microvolt = <2504000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	/* PMC8380VE_C */
-	regulators-1 {
-		compatible = "qcom,pm8550ve-rpmh-regulators";
-		qcom,pmic-id = "c";
-
-		vdd-l1-supply = <&vreg_s5j_1p2>;
-		vdd-l2-supply = <&vreg_s1f_0p7>;
-		vdd-l3-supply = <&vreg_s1f_0p7>;
-		vdd-s4-supply = <&vph_pwr>;
-
-		vreg_s4c_1p8: smps4 {
-			regulator-name = "vreg_s4c_1p8";
-			regulator-min-microvolt = <1856000>;
-			regulator-max-microvolt = <2000000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1c_1p2: ldo1 {
-			regulator-name = "vreg_l1c_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2c_0p8: ldo2 {
-			regulator-name = "vreg_l2c_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3c_0p8: ldo3 {
-			regulator-name = "vreg_l3c_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	/* PMC8380_D */
-	regulators-2 {
-		compatible = "qcom,pmc8380-rpmh-regulators";
-		qcom,pmic-id = "d";
-
-		vdd-l1-supply = <&vreg_s1f_0p7>;
-		vdd-l2-supply = <&vreg_s1f_0p7>;
-		vdd-l3-supply = <&vreg_s4c_1p8>;
-		vdd-s1-supply = <&vph_pwr>;
-
-		vreg_l1d_0p8: ldo1 {
-			regulator-name = "vreg_l1d_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2d_0p9: ldo2 {
-			regulator-name = "vreg_l2d_0p9";
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3d_1p8: ldo3 {
-			regulator-name = "vreg_l3d_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	/* PMC8380_E */
-	regulators-3 {
-		compatible = "qcom,pmc8380-rpmh-regulators";
-		qcom,pmic-id = "e";
-
-		vdd-l2-supply = <&vreg_s1f_0p7>;
-		vdd-l3-supply = <&vreg_s5j_1p2>;
-
-		vreg_l2e_0p8: ldo2 {
-			regulator-name = "vreg_l2e_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3e_1p2: ldo3 {
-			regulator-name = "vreg_l3e_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	/* PMC8380_F */
-	regulators-4 {
-		compatible = "qcom,pmc8380-rpmh-regulators";
-		qcom,pmic-id = "f";
-
-		vdd-l1-supply = <&vreg_s5j_1p2>;
-		vdd-l2-supply = <&vreg_s5j_1p2>;
-		vdd-l3-supply = <&vreg_s5j_1p2>;
-		vdd-s1-supply = <&vph_pwr>;
-
-		vreg_s1f_0p7: smps1 {
-			regulator-name = "vreg_s1f_0p7";
-			regulator-min-microvolt = <700000>;
-			regulator-max-microvolt = <1100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1f_1p0: ldo1 {
-			regulator-name = "vreg_l1f_1p0";
-			regulator-min-microvolt = <1024000>;
-			regulator-max-microvolt = <1024000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2f_1p0: ldo2 {
-			regulator-name = "vreg_l2f_1p0";
-			regulator-min-microvolt = <1024000>;
-			regulator-max-microvolt = <1024000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3f_1p0: ldo3 {
-			regulator-name = "vreg_l3f_1p0";
-			regulator-min-microvolt = <1024000>;
-			regulator-max-microvolt = <1024000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	/* PMC8380VE_I */
-	regulators-6 {
-		compatible = "qcom,pm8550ve-rpmh-regulators";
-		qcom,pmic-id = "i";
-
-		vdd-l1-supply = <&vreg_s4c_1p8>;
-		vdd-l2-supply = <&vreg_s5j_1p2>;
-		vdd-l3-supply = <&vreg_s1f_0p7>;
-		vdd-s1-supply = <&vph_pwr>;
-		vdd-s2-supply = <&vph_pwr>;
-
-		vreg_s1i_0p9: smps1 {
-			regulator-name = "vreg_s1i_0p9";
-			regulator-min-microvolt = <900000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_s2i_1p0: smps2 {
-			regulator-name = "vreg_s2i_1p0";
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1100000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1i_1p8: ldo1 {
-			regulator-name = "vreg_l1i_1p8";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2i_1p2: ldo2 {
-			regulator-name = "vreg_l2i_1p2";
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3i_0p8: ldo3 {
-			regulator-name = "vreg_l3i_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-
-	/* PMC8380VE_J */
-	regulators-7 {
-		compatible = "qcom,pm8550ve-rpmh-regulators";
-		qcom,pmic-id = "j";
-
-		vdd-l1-supply = <&vreg_s1f_0p7>;
-		vdd-l2-supply = <&vreg_s5j_1p2>;
-		vdd-l3-supply = <&vreg_s1f_0p7>;
-		vdd-s5-supply = <&vph_pwr>;
-
-		vreg_s5j_1p2: smps5 {
-			regulator-name = "vreg_s5j_1p2";
-			regulator-min-microvolt = <1256000>;
-			regulator-max-microvolt = <1304000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l1j_0p8: ldo1 {
-			regulator-name = "vreg_l1j_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l2j_1p2: ldo2 {
-			regulator-name = "vreg_l2j_1p2";
-			regulator-min-microvolt = <1256000>;
-			regulator-max-microvolt = <1256000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-
-		vreg_l3j_0p8: ldo3 {
-			regulator-name = "vreg_l3j_0p8";
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <920000>;
-			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
-		};
-	};
-};
-
-&iris {
-	status = "okay";
-};
-
-&gpu {
-	status = "okay";
-};
-
-&gpu_zap_shader {
-	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
-};
-
-&pcie4 {
-	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-
-	pinctrl-0 = <&pcie4_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie4_phy {
-	vdda-phy-supply = <&vreg_l3i_0p8>;
-	vdda-pll-supply = <&vreg_l3e_1p2>;
-
-	status = "okay";
-};
-
-&pcie6a {
-	perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
-
-	pinctrl-0 = <&pcie6a_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie6a_phy {
-	vdda-phy-supply = <&vreg_l1d_0p8>;
-	vdda-pll-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
-};
-
-&qupv3_0 {
-	status = "okay";
-};
-
-&qupv3_1 {
-	status = "okay";
-};
-
-&qupv3_2 {
-	status = "okay";
-};
-
-&remoteproc_adsp {
-	firmware-name = "qcom/x1e80100/adsp.mbn",
-			"qcom/x1e80100/adsp_dtb.mbn";
-
-	status = "okay";
-};
-
-&remoteproc_cdsp {
-	firmware-name = "qcom/x1e80100/cdsp.mbn",
-			"qcom/x1e80100/cdsp_dtb.mbn";
-
-	status = "okay";
-};
-
-&tlmm {
-	gpio-reserved-ranges = <34 2>; /* TPM LP & INT */
-
-	pcie4_default: pcie4-default-state {
-		clkreq-n-pins {
-			pins = "gpio147";
-			function = "pcie4_clk";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio146";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio148";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie6a_default: pcie6a-default-state {
-		clkreq-n-pins {
-			pins = "gpio153";
-			function = "pcie6a_clk";
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio152";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		wake-n-pins {
-			pins = "gpio154";
-			function = "gpio";
-			drive-strength = <2>;
-			bias-pull-up;
-
-		};
-	};
-};
-
-&usb_1_ss0 {
-	status = "okay";
-};
-
-&usb_1_ss0_dwc3 {
-	dr_mode = "otg";
-	usb-role-switch;
-};
-
-&usb_1_ss0_hsphy {
-	vdd-supply = <&vreg_l3j_0p8>;
-	vdda12-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
-};
-
-&usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p8>;
-
-	status = "okay";
-};
-
-&usb_1_ss1 {
-	status = "okay";
-};
-
-&usb_1_ss1_dwc3 {
-	dr_mode = "otg";
-	usb-role-switch;
-};
-
-&usb_1_ss1_hsphy {
-	vdd-supply = <&vreg_l3j_0p8>;
-	vdda12-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
-};
-
-&usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
-
-	status = "okay";
-};
-
-&usb_1_ss2 {
-	status = "okay";
-};
-
-&usb_1_ss2_dwc3 {
-	dr_mode = "otg";
-	usb-role-switch;
-};
-
-&usb_1_ss2_hsphy {
-	vdd-supply = <&vreg_l3j_0p8>;
-	vdda12-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
-};
-
-&usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
-
-	status = "okay";
-};
-
-&usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
-	dr_mode = "host";
-};
-
-&usb_2_hsphy {
-	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
-
-	status = "okay";
-};
-
-&usb_mp {
-	status = "okay";
-};
-
-&usb_mp_hsphy0 {
-	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
-
-	status = "okay";
-};
-
-&usb_mp_hsphy1 {
-	vdd-supply = <&vreg_l2e_0p8>;
-	vdda12-supply = <&vreg_l3e_1p2>;
-
-	status = "okay";
-};
-
-&usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
-
-	status = "okay";
-};
-
-&usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
-
-	status = "okay";
-};
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "hamoa.dtsi"
+#include "iq-x-iot-som.dtsi"
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
+};
+
+&iris {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/iq-x-iot-evk.dtsi
similarity index 94%
copy from arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
copy to arch/arm64/boot/dts/qcom/iq-x-iot-evk.dtsi
index 36dd6599402b..7d6dbe9a0885 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/iq-x-iot-evk.dtsi
@@ -3,13 +3,7 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-/dts-v1/;
-
-#include "hamoa-iot-som.dtsi"
-
 / {
-	model = "Qualcomm Technologies, Inc. Hamoa IoT EVK";
-	compatible = "qcom,hamoa-iot-evk", "qcom,hamoa-iot-som", "qcom,x1e80100";
 	chassis-type = "embedded";
 
 	aliases {
@@ -68,28 +62,13 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
-					reg = <0>;
-
-					pmic_glink_ss0_hs_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
-					};
+				pmic_glink_port0: port@0 {
 				};
 
-				port@1 {
-					reg = <1>;
-
-					pmic_glink_ss0_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
-					};
+				pmic_glink_port1: port@1 {
 				};
 
-				port@2 {
-					reg = <2>;
-
-					pmic_glink_ss0_sbu: endpoint {
-						remote-endpoint = <&usb_1_ss0_sbu_mux>;
-					};
+				pmic_glink_port2: port@2 {
 				};
 			};
 		};
@@ -502,25 +481,6 @@ platform {
 		};
 	};
 
-	usb-1-ss0-sbu-mux {
-		compatible = "onnn,fsusb42", "gpio-sbu-mux";
-
-		enable-gpios = <&tlmm 168 GPIO_ACTIVE_LOW>;
-		select-gpios = <&tlmm 167 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&usb_1_ss0_sbu_default>;
-		pinctrl-names = "default";
-
-		mode-switch;
-		orientation-switch;
-
-		port {
-			usb_1_ss0_sbu_mux: endpoint {
-				remote-endpoint = <&pmic_glink_ss0_sbu>;
-			};
-		};
-	};
-
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -1104,30 +1064,6 @@ usb2_pwr_3p3_reg_en: usb2-pwr-3p3-reg-en-state {
 		bias-disable;
 	};
 
-	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
-		mode-pins {
-			pins = "gpio166";
-			function = "gpio";
-			bias-disable;
-			drive-strength = <2>;
-			output-high;
-		};
-
-		oe-n-pins {
-			pins = "gpio168";
-			function = "gpio";
-			bias-disable;
-			drive-strength = <2>;
-		};
-
-		sel-pins {
-			pins = "gpio167";
-			function = "gpio";
-			bias-disable;
-			drive-strength = <2>;
-		};
-	};
-
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio191";
 		function = "gpio";
@@ -1198,10 +1134,6 @@ &usb_1_ss0_hsphy {
 	phys = <&smb2360_0_eusb2_repeater>;
 };
 
-&usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
-};
-
 &usb_1_ss1_dwc3_hs {
 	remote-endpoint = <&pmic_glink_ss1_hs_in>;
 };
diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/iq-x-iot-som.dtsi
similarity index 99%
copy from arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
copy to arch/arm64/boot/dts/qcom/iq-x-iot-som.dtsi
index 4a69852e9176..051df8ecaf94 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/iq-x-iot-som.dtsi
@@ -3,7 +3,6 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-#include "hamoa.dtsi"
 #include "hamoa-pmics.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -378,18 +377,10 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
-&iris {
-	status = "okay";
-};
-
 &gpu {
 	status = "okay";
 };
 
-&gpu_zap_shader {
-	firmware-name = "qcom/x1e80100/gen70500_zap.mbn";
-};
-
 &pcie4 {
 	perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
-- 
2.34.1


