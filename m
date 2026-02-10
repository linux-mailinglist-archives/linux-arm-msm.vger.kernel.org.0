Return-Path: <linux-arm-msm+bounces-92516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGhvN0ZDi2mfRwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 15:40:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6AC11BFC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 15:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAE6A30515CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 14:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA733803C4;
	Tue, 10 Feb 2026 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QRG5IozK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hnVKZLYv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC71037FF55
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770734383; cv=none; b=YmUsm3Muoc0wStslOBBg6uad4lT7DXRPLlNAjoBbEN1r3eB+2OhEPiwo541h6uIvrB8wpMFTR9H70t0+gei+A+C5CdAowIlrHL5/xrCYj/qNmq8bo3cP50dSdRZPDwc8EKTDWb31obbMLzDC5jvfheO6bAkdnuzka7WSgmE7L/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770734383; c=relaxed/simple;
	bh=FDQeQ9WisaxkObANUnG/O4WPbixKOxhrfhMkTcDTNvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oyaBAbgqM35bRw9izqgnjfswAp/LR5iI41RqnGWP0V+fszEjocxFfP8ZFt8vPL6TAF0P0DJDQ/qtJEhxJ952Z+FiAB/bS6kfsd/iLL9cLfWZ3Xn/dwyNxnehYh6+qh2Tt4v0qPFr87lf5C274HQBRAbKigCrzWtnekkaow1BZDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QRG5IozK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hnVKZLYv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AERjNP1419228
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 14:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=fWOSmsmobLjsdZNFxDY70HSsDuyWa+G+hpu
	szEf82Eg=; b=QRG5IozK1LMk65XxtIke9b0qfNqPnq29sw53ALNziLlGYgFS+Ae
	wT6xbKw0l8GB57EqGXXWcM4KeIVDvNJCTr9PZjh2TiW9snv0droq91uwcn1s4Ss2
	Zt/K20IdhPG1+8ROKosIju2ELQShYKsXraTuPlERO30mv39fTul3PPYACOa+A8k5
	tcH28f0irQLX5nM8Rz/sJbGDt7Qom+sv9AJrMdW0b9uxvwDmRCyEUXvKiBNnmRIR
	hdYyaQQuoBuk6cJ6Xx/s9KSwbvnvdYPHruztVo4fOYcbjn7zf68pZ3nhoKv7jCGI
	fqp9oz2fHQiza7kN4qmRMbIaRPeA1eLOO8g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7rpvts76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 14:39:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c65f69edso1116525a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 06:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770734379; x=1771339179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fWOSmsmobLjsdZNFxDY70HSsDuyWa+G+hpuszEf82Eg=;
        b=hnVKZLYvPx3uY4rzID5m6DzLajewYCpS5s8sDfPs+R0CvfFKqvgnQhh9htKVU5W6hJ
         dZoBq/c/ACKs8z6g9LAFLl7u1UONJ9MuLLs67jKgKkk+5x7gb0GnRw02u0ll4M/1u/dY
         4sQ+Lh/eeM6FzYhhwvX5i0OiPXC9yrKy2y8AqkUb4Y3MEU5k+S5MCXN1xEUzIeCeYAWh
         sNUv3dJUXHunSVFSispX7JOaPn9nk+s4Ek+RwbDcKvU0KOVuUFP8J+S4dXXCMdtsmmZo
         2/MTxMJVqbNkIgN0FOTb3VRYbXQAT02CL9BeUzEHOS/YIRfUA/y5OkQxF1NluW6csMUj
         3Xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770734379; x=1771339179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWOSmsmobLjsdZNFxDY70HSsDuyWa+G+hpuszEf82Eg=;
        b=s8PN72h1ZZFGXkCY/289nVBYoJJe+MVjcjaXkR1NS+MxGzZhcddbvC0Givbm6A6IAK
         NYJrt9B6vVVYWPVqZpDRtGNqSe6kqWe3dDJu3QOOEfGPWVENGyYG5dt0lz3NKjf/pdRT
         P+FC/Qwc8RJxZgsm+x5cwEfr4EWreuz3fx6R/PBQkMlDlD7qGXUnzeV8GOf5RIagwYjk
         7I3o0M55Y2FETuHg9HaRgaYGUK++q5t4mA7+KCffO1uv8jgEKQQOzg2ApXwGpp3RHZWy
         Rdm9kw//h2PfLPBSxlbiE642IGm5cExBEPqTL4VS13IruGvnhNGWJaOps/zlcVtvnBoh
         usew==
X-Forwarded-Encrypted: i=1; AJvYcCWKCSttaX6A6in5NiKXmVhSVsv9/qKCgYHa1zr8TB4khW16y0iFVM6Uz6ISUySobvqCDSupn5Y10kcGk0l1@vger.kernel.org
X-Gm-Message-State: AOJu0YxUMcH5dmmqq8y8spth1DHzkmkrsa4GZNUeA69cxykWg7LO7f9g
	+3sWAu49eiIQkupl9g6V2iz22xv0GWWrI4GgDxzqa804VeiKOak3gyNhisahWIb+/iwx99mzFrV
	3ItAuQVXJ2xJL/NNY7fw0d/ihMdUUgShYLnqa2frwAgSqJ/SCTqORoK9+Mg0zOQluSG4Q
X-Gm-Gg: AZuq6aLcOCH7DfXOyNV0m8r0yqprNOmvN4gowMpVr7vEyQWAd3gZBeTXF5P3/2dCIbb
	eVaSKjxK9D11ze8ey4Vrq+fVRFzM5VbfWOZ/125kf7/1H2hS+Tiea2cSN5EnR+M7qZ1gFO7Ppph
	Ocb1QPkM7+lkpPNKfiS4bABc5NFgTPTAx+3Xz+KoAZH8nE+2RNzkvAJVz/wPyQM06wc+bSfSHCr
	v8u5T6SHOMDk33Ih3hGSLkoyiapPniF5yPLra3kbgNzl6yJXd2S/RSUm8CJ3aBbTQrPlLnlWhrt
	WGL6kRuZ1m3h/eprRjuiT/5f0cUiBMM48eeCpfGyHkEGlK36lmcEjndaG3viAZC2MOrdagQVsFf
	MV4mSrUyJ5TIYcGyrdA7Zn3UNfNDStuerU73eX8s1KmilKeUEfw==
X-Received: by 2002:a17:90b:2e90:b0:356:4ea0:e9e2 with SMTP id 98e67ed59e1d1-3564ea0fcb0mr4687521a91.34.1770734378631;
        Tue, 10 Feb 2026 06:39:38 -0800 (PST)
X-Received: by 2002:a17:90b:2e90:b0:356:4ea0:e9e2 with SMTP id 98e67ed59e1d1-3564ea0fcb0mr4687486a91.34.1770734378154;
        Tue, 10 Feb 2026 06:39:38 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662e531desm3153057a91.2.2026.02.10.06.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 06:39:37 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable USB2 controller Micro-USB OTG
Date: Tue, 10 Feb 2026 20:09:26 +0530
Message-ID: <20260210143931.3324647-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEyMyBTYWx0ZWRfX7uaUbSHAbagk
 4nNYzyJAGcBa+1EwTLBZ28V96j1HxwkifKCSpwPJuOVZe7HSZjGPUjIYkIXPW81f97wyMse9f5S
 NS7YByItoNmE2qtp7mq6s30QAZGnLp7SW6x1haTmV2DrU2todgbLSnbvgyUCCUaH3DYkvN/srqq
 tmktcce+BbXj7kQ0r621U0XwDE3qnTozf6LeSHzd9GxICxpymlwpPje1g+MMj+xWqfDspYOh68S
 Xy+aZi6AzlHSeUClQtmMQiM0mLCiIVATsBYMi+3n7nXLs4oI47+RU46MOiUU0ukox7I8ZNX4MmB
 GmBgJ1nYH8d/y5esxxWaD1EwiaGRWx1fO6jBSOfKNgCa8c01qWTBtkuH+PE+X69s3FfW9YDUrnl
 qeewjjFiGfUywqK2/vQUK2BlyoM3ARnY/pAFgEVu6XuJXHAcXfx3PE11MJHspe8TBeQrezUFKvC
 H5pszH3LuENgMbsJ1/A==
X-Authority-Analysis: v=2.4 cv=KKZXzVFo c=1 sm=1 tr=0 ts=698b432b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=nDjxtR87dJjKcGfwTHQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: AtUAYpCzRZbjjN8Ke1XltCHswk0fSs4X
X-Proofpoint-GUID: AtUAYpCzRZbjjN8Ke1XltCHswk0fSs4X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100123
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[akash.kumar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92516-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7E6AC11BFC1
X-Rspamd-Action: no action

Enable the secondary USB controller (USB2) and its High-Speed PHY to
support OTG functionality via a Micro-USB connector.

Define a dedicated 'usb2-connector' node using the 'gpio-usb-b-connector'
compatible to handle ID and VBUS detection. Link this connector to the
DWC3 controller via OF graph ports to satisfy schema requirements and
enable role switching.

Specific hardware configuration:
- ID pin: TLMM 61
- VBUS detection: PM7325 GPIO 9
- VBUS supply: Fixed regulator controlled by TLMM 63
- Configure &usb_2 in OTG mode with role switching enabled.
- Define a gpio-usb-b-connector node for Micro-USB support, mapping the
  ID pin to TLMM 61 and VBUS detection to PM7325 GPIO 9.
- Add the 'vdd_micro_usb_vbus' fixed regulator (controlled by TLMM 63) to
  supply VBUS to the connector.
- Add the 'usb2_id_detect' pinctrl state to configure GPIO 61 for ID
  detection.
- Enable &usb_2_hsphy and populate necessary voltage supplies (VDDA PLL,
  VDDA 1.8V, VDDA 3.3V).

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 68 ++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index f29a352b0288..ee472d8b2db1 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -217,6 +217,16 @@ pmic_glink_sbu_in: endpoint {
 		};
 	};
 
+	vdd_micro_usb_vbus: regulator-micro-usb-vbus {
+	       compatible = "regulator-fixed";
+	       regulator-name = "MICRO_USB_VBUS";
+	       gpio = <&tlmm 63 GPIO_ACTIVE_HIGH>;
+	       regulator-min-microvolt = <5000000>;
+	       regulator-max-microvolt = <5000000>;
+	       regulator-boot-on;
+	       enable-active-high;
+	};
+
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -262,6 +272,30 @@ active-config0 {
 		};
 	};
 
+	usb2-connector {
+		compatible = "gpio-usb-b-connector",
+			     "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+		id-gpios = <&tlmm 61 GPIO_ACTIVE_HIGH>;
+		vbus-gpios = <&pm7325_gpios 9 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&vdd_micro_usb_vbus>;
+		pinctrl-0 = <&usb2_id_detect>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				usb2_connector_ep: endpoint {
+					remote-endpoint = <&usb2_controller_ep>;
+				};
+			};
+		};
+	};
+
 	wcn6750-pmu {
 		compatible = "qcom,wcn6750-pmu";
 		pinctrl-0 = <&bt_en>;
@@ -606,6 +640,7 @@ vreg_bob_3p296: bob {
 			regulator-max-microvolt = <3960000>;
 		};
 	};
+
 };
 
 &gcc {
@@ -1137,6 +1172,12 @@ qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
 		 */
 		bias-pull-up;
 	};
+
+	usb2_id_detect: usb2-id-detect-state {
+		pins = "gpio61";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart5 {
@@ -1200,6 +1241,33 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&usb_2 {
+	dr_mode = "otg";
+	usb-role-switch;
+
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			usb2_controller_ep: endpoint {
+				remote-endpoint = <&usb2_connector_ep>;
+			};
+		};
+	};
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l10c_0p88>;
+	vdda18-supply = <&vreg_l1c_1p8>;
+	vdda33-supply = <&vreg_l2b_3p072>;
+
+	status = "okay";
+};
+
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&redriver_phy_con_ss>;
 };
-- 
2.43.0


