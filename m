Return-Path: <linux-arm-msm+bounces-92523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sELyAaNUi2k1UAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 16:54:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F85011CC9C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 16:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F889300752E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 15:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAC138171D;
	Tue, 10 Feb 2026 15:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="euD0BvJp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTHseDhI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0B83859EA
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 15:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770738843; cv=none; b=RHE1e8rW2mstGsOGagZR2z9guxQOvwIwqNzIcXX8XsxRu9ifEHIuwjlI/2SloC8c14AanIH3azEkx9xAbcZekH5X6KidVluo2eAyUu40pJ5rHavEAyzI4PFHq3YdY60aDphZGjBk7GApmHdgdzOoW9YuxFJgjq9TIOZ43qFOf8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770738843; c=relaxed/simple;
	bh=uCoMsvrPm+aNWDfirPzzAlVuu1lOu1fK5lzhVyxE404=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jz15ETkecZS4tE+jUokPc3n43RnG7DuYsPNNKMU0QflL7aB/SLoqgcEll+lW7vNLyRwb1fgUV/22WcuhO7FE9xRcD8cT8bYuNzZCDfHiK8Efe1mZ1hztbB1N9Nn5/Vas6b5yrfjQ3ze8dXJwL9/9D2eUimp6Ol6BtI8r0sqEhQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=euD0BvJp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTHseDhI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AAB7eR1940333
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 15:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CSLpaUMtI8F
	GejMzSUIL+0lqhUcZkliLgCOhvcTllcc=; b=euD0BvJpKIG5vCdxrgkJ8EMf4Mw
	WQ7NaMTNDvETJ+k+zCIO22i4lSfuHAH0mP0CrBUxXXTPy7fiAQ8GGRvzL2MAZyBl
	eLbRkSB8MHHvejJ+L5G47JjnN0b4HG5N9GX67g7xsRFe8clE4CslNGr0tAy79P1m
	HSRvlJuLL9M3Pv85YkQUAtUqmJ541eoIkIAnlvBhpgB1rhkkFAGDkzSSvKNrX0p8
	FkzyOe/e8hyxbAbiy/dzv82QqvqSMeii3TKJVH8oJo8WrizrjGzPsa3VWxkQNrW5
	BarwVAbnSvpl9P0rSK/G5VEERK+TDd4P3j0YmOG0rwMSkidiBMZjjuq6l4w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7w1jt640-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 15:54:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-bce224720d8so3894148a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 07:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770738841; x=1771343641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSLpaUMtI8FGejMzSUIL+0lqhUcZkliLgCOhvcTllcc=;
        b=dTHseDhInC19kRKTOpOJAcrPu4mBzCJSw3h8LYiElnzbvwXwgwdL46Vk7QMPDpwMYq
         e/NIi57ZuZIFSLE1E4BOhAy1X2vKp2s5kKHCv7h8fKbCb9X2nybcJ4TahJmDNw+5QdjR
         LahII8EqQY/czLtc4qStv4Tn+akIi7flC7gyHZB3/fvH9ivEZnKDsgNQAE2/r8W4V32+
         PbDe/BGy59I4J4K/VUykjT3xFXZjH+D1L68/bGzY+9YZ7E2qAhCMwuEe7TTOS5yvjXYf
         nbJGesZUL15jPOmWlOUVVO6Dh2s0aJWigEQUud366NLyn0OpUA5kAP3Qw8RiNLurOabE
         oOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770738841; x=1771343641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CSLpaUMtI8FGejMzSUIL+0lqhUcZkliLgCOhvcTllcc=;
        b=UY8isNgzIAIwzXo3wGeig/1qEa235ucN3Ae7KOpwsQVcZ5H596J5BVWa3c3t1GK0Ka
         /BFD1Wn/ubLEpCgCBQu+YLxupd8FajkSY5i0tX8WsnkyfMpVCThPTsR160F0PZ4IqlRA
         MGspaG+nm9sYzWr2pHc7jUMs3HJFBUtx71AVr9ur1BItgW6p3N7yuEEOZnuZ/nO3RQ3S
         GTTI7xs0JjbqOSmIxcA9FWhTytaDCMGKKq1yWH/GeBmHa6P/iUUOh4+7jHz1FkxEIFnH
         xmdlsYoX0KGHdWRPCfUHdVnd8S2LgmBeNKVbRrgp/88hutjb0wFViFlX4l4uHSlDqNLD
         Q/ww==
X-Gm-Message-State: AOJu0YxQBBny8xytXerKufd6gXFeqceswcNR5Ks4DLOKIIrHnlTf+SuC
	lvBcGQXKrlx6d68EpHmfGSbsUJECVK2/sJaG47lG53Jxs80vqzcg4FRUxwRu5KxBTo8AhFbFpUH
	Es9MgM1kauK9tURxiH1uaR1Ochw8DvtGLJ3a4+k9eewq3r42wLUtbXwRYPBm410XWbf1U
X-Gm-Gg: AZuq6aLM94/wCTAD8eA6QoxQ3a2hBY6GPq6Da9NoDsmaspW3G0h58QGTTiK1epKb5p3
	c2ZtD601+hnOuDNuVdvcX/wAfaT5t4HwYoK7kxJlfsi/EC/XkxNFMfLYGA1Y+T6vX2zlC/Psb6T
	vWsxpkkiMYU8p/eIiXJzDfB/XGOYpvzlHKw4mP4W/UHOVN76X5yXe9MCMhN2pWxSreSWReppbL4
	JbZz8+RfJnZ06rJbbinbY7CB33Uz2lrZoCfkvgVZ6VMhBjyaP791kl2VOpQ67SFTHfhOVb9LhTj
	SIoxyzFaniiYbnw5PNsFP2twAT+Ghn1RqI+WkgftvUqPs6aeEHSOGD+45anvxwz/BLcLeJqH5sw
	imgHGTUKruYblAFtiM7fpGAwSEkxPEhKfOND0u5cOxuA5yfwlzEhxYGc=
X-Received: by 2002:a17:903:1207:b0:29e:e642:95d6 with SMTP id d9443c01a7336-2ab10d722ccmr25542685ad.59.1770738840710;
        Tue, 10 Feb 2026 07:54:00 -0800 (PST)
X-Received: by 2002:a17:903:1207:b0:29e:e642:95d6 with SMTP id d9443c01a7336-2ab10d722ccmr25542425ad.59.1770738840235;
        Tue, 10 Feb 2026 07:54:00 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a952221b4csm149305465ad.89.2026.02.10.07.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 07:53:59 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Enable the tertiary USB controller
Date: Tue, 10 Feb 2026 21:23:29 +0530
Message-Id: <20260210155329.3044455-3-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210155329.3044455-1-swati.agarwal@oss.qualcomm.com>
References: <20260210155329.3044455-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3tTfn29qCgA5EoPwtbfl_7F8kNg7ZYUe
X-Proofpoint-ORIG-GUID: 3tTfn29qCgA5EoPwtbfl_7F8kNg7ZYUe
X-Authority-Analysis: v=2.4 cv=YrIChoYX c=1 sm=1 tr=0 ts=698b5499 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=DSDS7fUqx7ACsPcU-5IA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEzMiBTYWx0ZWRfXz6YYUY8yF5WN
 iAIuS8uTb5zSTOVN2auElSwRbC8gsbhuWYi0on5EnHHGIC7tIEIEWhUEOmawA3t7B8+w4VJXVM8
 rI79dwzNUUDxMGOZNsXPqG8BNBGmDKCbCjsP9HVeCj26No838XG8PyWxWAIyweuJUdVmVOFy217
 xQyrc7xklkF4Qlpi72Y4AJv26qdsZMHoKNEs8a+WhRZGeIkiEDpKI+igqkurPYci4BEPXLPxqaK
 50egDJinqcgz5zz7nz/5PxQDM48JD2R3PCv90fJ1TTqGdf5L2cSm0Uyuf0ew5qtcr79+ltLuD+T
 +akoHMIeUZx8zDYHzWOdshqtamj/EGue/XolFpQQZa1w6L9AreQ9aheVFbKPX30ThwuEcK1oKvO
 pHfEqOb9my8YBTMh/eZzemxswfdk/fUUw8Wg4Miq6Vt7GELbNelj6th0R/eB5UqSRzkHf8MTGTX
 Qe4UF83Ylm8l5RqEARg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100132
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92523-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F85011CC9C
X-Rspamd-Action: no action

Enable the tertiary usb controller connected to micro usb port in OTG mode
on Monaco EVK platform.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 53 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi    |  7 ++++
 2 files changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 03af9bbcacc9..e6fc6f6a52e1 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -27,6 +27,25 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector-2 {
+		compatible = "gpio-usb-b-connector", "usb-b-connector";
+		label = "micro-USB";
+		type = "micro";
+
+		id-gpios = <&pmm8620au_0_gpios 9 GPIO_ACTIVE_HIGH>;
+		vbus-gpios = <&expander6 7 GPIO_ACTIVE_HIGH>;
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
 	dmic: audio-codec-0 {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -77,6 +96,15 @@ platform {
 			};
 		};
 	};
+
+	vbus_supply_regulator_2: vbus-supply-regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus_supply_2";
+		gpio = <&pmm8650au_1_gpios 7 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
 };
 
 &apps_rsc {
@@ -484,6 +512,16 @@ &pcieport1 {
 	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
 };
 
+&pmm8620au_0_gpios {
+	usb2_id: usb2-id-state {
+		pins = "gpio9";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
 &qupv3_id_0 {
 	firmware-name = "qcom/qcs8300/qupv3fw.elf";
 	status = "okay";
@@ -690,3 +728,18 @@ &usb_qmpphy {
 
 	status = "okay";
 };
+
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
+	vdda18-supply = <&vreg_l7c>;
+	vdda33-supply = <&vreg_l9a>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 5d2df4305d1c..59dfacbae4f6 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5232,7 +5232,14 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,select-utmi-as-pipe-clk;
 			wakeup-source;
 
+			usb-role-switch;
+
 			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
 		};
 
 		iris: video-codec@aa00000 {
-- 
2.34.1


