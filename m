Return-Path: <linux-arm-msm+bounces-92508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMxjNo0qi2kvQgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:54:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0320311B0C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E97BF300D554
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 12:54:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB82C328617;
	Tue, 10 Feb 2026 12:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZgE7trv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fN19E6Um"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764A232860B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770728049; cv=none; b=acitub2wtdWX6wToA/9YGbnabO3FuNkpBpEp3cFxFD+u41eCjiro3d6vtEdUxrutQFjcq8DybHPnuINXTTi9QE7Az3/67F/SQu0vnwsdSXpLKug6n3eqKMktxfdCl9AdJC4lWYjbpSKy0mNWo+BMMMJba4T0I+mtOF4svxYnCec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770728049; c=relaxed/simple;
	bh=ltXavvr2a2I71wAkSd+5jIVnkYtUdMsdaeA1sLndDSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G23CKBycPvB/GVyj9Doc4c+FIi7T+PJUlKTzmNosNUjmQBYY6V0P55hnXMO/JK96mjAmDR6KvULkvkxA34j2qSIdAeBOx63FmbB9GVUCgQVU2PLfyj56VFfTnxMrsIYR3NnpWD5vaxUG8ZWCZWvbmajolqrVg6Oz7H1GjKbe/Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZgE7trv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fN19E6Um; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A776Jh1151832
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:54:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UdQdjhfpKfw
	gKPm0+l03FizAMs5/jthW5FxDgd5midk=; b=UZgE7trvIlRsodURc6u3qRSq+z1
	//LNI3YhEJcnfVNpFCD0zObwbbu9Vja3uq2Pm2jou2aLm6Ih0U+ZC3DNExXr9gJ5
	0rLE/4/hmuhjsJxR7ZBMkL23x4XKh1PNDmmDazJeE5hvJPc1B98ulSjEVVMWOSn8
	ZIUlY7KcxvOxsW58ouBGEb+AJExO611GgggwKWHPG9iMboaIC3JyT7z6mcbdROSs
	YkRQN7YmX5UspZT0SikoJiSGr03oUsxvqxYpAEaAdSK4cDp/VEShdkoLnTus6cCU
	GmCTkn6crr8pld7W+HnYaEFw+ITeQIaWFiEi56LC9bMEre1maKRPY6zairw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c800j935k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:54:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a944e6336eso22010115ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770728046; x=1771332846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UdQdjhfpKfwgKPm0+l03FizAMs5/jthW5FxDgd5midk=;
        b=fN19E6Umq8SJmJoe0BWoPQOz1AixSVbANmoHgnziAGMKFGpWYMkCS8JNuP2QC3MdDW
         GpPMDkzYj+vZk4EO7plbKRUKn+w8Td04eKMMe4kmCaaQiOs7GypUnDHdVDUFN5vGnCEm
         r8IYQSlkDOs112TTUa/PNl8gC7hJGoX/gwP4bMTslRZGKVvhAT4xuhLkHsuDbtYErGC+
         a1brSqOMoOTQZBtifh2+nhgmdP4suA3DDVtY+ylWl2G5iSN+LRI2rG3+ctgUOPeBt5oV
         uP/f8QL9ag5x6G7X3wS0dYOfECqLfTbxs9MbdVBsHMFK6eudlfaaO7Ln9nkotpnckLYU
         /Wdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770728046; x=1771332846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UdQdjhfpKfwgKPm0+l03FizAMs5/jthW5FxDgd5midk=;
        b=OqItAlHdTWbvcx+CenT9HYKzCxx6xHSZSUiKhWi8AgApS8TpvjbfGY+cws6bj/soYI
         MX2X73hrnvWS9nl7RUONNg/YI6vynb6j9up4AVtVYDbephpM+EfIwUHyEiFGl3huMJjF
         v6KEdTwdKobPtRgebZOwslS2wi7yRUnSqumsEF205nqYNk1BCipHy7upYV+AsEpnB5RY
         7451w6hDuNDDxl3v8w+lGux2jnW99MLj4zl5kqdlqfbcq1Xa5LTQGLC3mBsrW05hBche
         qFnDNAwun5Jlh4HbbxambOpjKrCcHum/Z47pYxPYPlxJGgL5HlsN2kgC3egFJNakt4wM
         fU1g==
X-Gm-Message-State: AOJu0Ywp9vT0k3L4uFglu3ujDAu6SROZI1VoHn5lD5eqUjNCiCt/9kMk
	7srHWWecUCrIpMlERnw9QAJqGbbLg4LVMIb6zIJy4c3X/OUJeBqWmpW/EeXory/N9izJfNgTz3X
	99JpBeDCVUAugypru0KVY8tie20Qgli0kYbLlrPLERqg8/SwhOuSBLeG9kioiIURmMfBoyImmmN
	zE
X-Gm-Gg: AZuq6aILxbMuxYJPjMy7x50td7NqNPGNZ7Pc+d8HF4GuyDwkvsX+5dTq4JdsTbb4Q9l
	xAOnEqyzqOIPhiZCIvrgPHaOcokImizx2L3GIMsvubceEoaHOBYRI+Vef0tZBmaLEH+3dX/sU1P
	jc75ZzW6U1eI7cfZQA6a8tfGzJCRJdBwsaeijawzvJEZf62IfJaYKU/SXZ5Bd7unXYA896OJt/I
	C9VuLk95VGjfRvvrDmc0ijKUwoyKf+f1XemQfKPNxa9o/tX7G0Zif54M6X9/V8wbNsKfAhDTags
	n5ECRszK3E+E4ui6/hfkyRHLlitT8NVH1d620IicAT/TlE3Fl1lqiNg/+GH+TnDgnfEggn3pgcE
	MhRQOT6BIzLnim+9IsfMHGSOOXTeuU8brH2g/Ngk8Ltvq3NznW2siU4I=
X-Received: by 2002:a17:903:2286:b0:2aa:e0bd:1c7 with SMTP id d9443c01a7336-2aae0bd03cbmr84857045ad.12.1770728046348;
        Tue, 10 Feb 2026 04:54:06 -0800 (PST)
X-Received: by 2002:a17:903:2286:b0:2aa:e0bd:1c7 with SMTP id d9443c01a7336-2aae0bd03cbmr84856735ad.12.1770728045866;
        Tue, 10 Feb 2026 04:54:05 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a64990sm185356375ad.13.2026.02.10.04.54.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:54:05 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller
Date: Tue, 10 Feb 2026 18:23:48 +0530
Message-Id: <20260210125348.2800846-3-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210125348.2800846-1-swati.agarwal@oss.qualcomm.com>
References: <20260210125348.2800846-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwOCBTYWx0ZWRfX9L6Nz1ZyoDMz
 Ull6/cdAXpir38c68AZhUD1aQwC4VA2rGZSqbgS2U8Dk8NMG8ADqzLhbrJ6jSDhWD5dwPU+REtr
 bhs6F1reK4x5iXFCtDbzhLSrVxrncd38ohr+6ZZd81y2X+P3+FI/sgtvLJ9G7NU/TNwlw6F4dhI
 Velq0C3xzOI79kyLk1/PTwS7yAKUha3XnxqC4wquDdR9mLCHkVNEeyi0ypG6WNyYpjcG/KelJRz
 XrgAXht3YVJI73znXMC06g7uKEKs/L/8nGSXCo06p+tTYM1LPPSb3/qitbY0rkcxieoNBSPnDwt
 mej0CTHehX0ura/a/drZAsCe6njgm6B+Q+i9LWIL4Q5DO9pfG8ef1UGRGaS61US6FgtZRWdeeaw
 WGKzSLjKnWgSMuASA2fNnDDs0L+Wyxw41l4tcUMk+5t6lu/2KHru9d/PHVGCbqELWefiWGujaF/
 oxUAaJSnG/b72Rpr0hw==
X-Proofpoint-GUID: ySq501Ar_AalyASQH-It2-_G0s3FVT2z
X-Proofpoint-ORIG-GUID: ySq501Ar_AalyASQH-It2-_G0s3FVT2z
X-Authority-Analysis: v=2.4 cv=b9u/I9Gx c=1 sm=1 tr=0 ts=698b2a6f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=K8I2XD3YpgONH663DNkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100108
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92508-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,1f40000:email,a400000:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0320311B0C4
X-Rspamd-Action: no action

Enable the tertiary usb controller connected to micro usb port in OTG mode
on Lemans EVK platform.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi    |  7 ++++
 2 files changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 265bdad10ae4..6f8b0d067256 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -107,6 +107,25 @@ usb1_ss_in: endpoint {
 		};
 	};
 
+	connector-2 {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+
+		id-gpios = <&pmm8654au_2_gpios 11 GPIO_ACTIVE_HIGH>;
+		vbus-gpios = <&expander3 3 GPIO_ACTIVE_HIGH>;
+		vbus-supply = <&vbus_supply_regulator_2>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb2_id>;
+
+		port {
+			usb2_con_hs_ep: endpoint {
+				remote-endpoint = <&usb_2_dwc3_hs>;
+			};
+		};
+	};
+
 	edp0-connector {
 		compatible = "dp-connector";
 		label = "EDP0";
@@ -190,6 +209,15 @@ vbus_supply_regulator_1: regulator-vbus-supply-1 {
 		enable-active-high;
 	};
 
+	vbus_supply_regulator_2: vbus-supply-regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_supply_2";
+		gpio = <&pmm8654au_1_gpios 9 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
+
 	vmmc_sdc: regulator-vmmc-sdc {
 		compatible = "regulator-fixed";
 
@@ -809,6 +837,14 @@ usb1_intr: usb1-intr-state {
 		bias-pull-up;
 		power-source = <0>;
 	};
+
+	usb2_id: usb2-id-state {
+		pins = "gpio11";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
 };
 
 &qup_i2c19_default {
@@ -1174,6 +1210,22 @@ &usb_1_qmpphy {
 	status = "okay";
 };
 
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3_hs {
+	remote-endpoint = <&usb2_con_hs_ep>;
+};
+
+&usb_2_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
 &xo_board_clk {
 	clock-frequency = <38400000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 808827b83553..d0e63336be6b 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4270,7 +4270,14 @@ usb_2: usb@a400000 {
 			snps,dis-u1-entry-quirk;
 			snps,dis-u2-entry-quirk;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
 		};
 
 		tcsr_mutex: hwlock@1f40000 {
-- 
2.34.1


