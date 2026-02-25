Return-Path: <linux-arm-msm+bounces-94070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8L2hBdbCnmnsXAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:37:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AB43C1951CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 10:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EDD37307FC95
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 09:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F1838E5FE;
	Wed, 25 Feb 2026 09:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fhHK1h1G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JldQ5dja"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F61A38F222
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772011940; cv=none; b=NI10oqa046JdHDA1X7PmItxSSIR6w64+LJqkVjx3jZFAr1AK0q0ss5bvEohJDQNjY3nlskk85c2Y2Ss2VbA3QnIxsc2CtFu1Iqd3QQK9/JSXElWMWc53NA8pVWi8KJP15BJLYhoaxZeIkzVLfq6TDIM6QBtvfvcBNVFyb9jKvIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772011940; c=relaxed/simple;
	bh=ebFYIFeSzM/tDvbCf29r5DFYUKXZH0Ps2d39zHr4esY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BGZ5uxowwTWMzd7hz5O7qN2NN07gjEJst0hAtE6zn0JqRgs4PzbXMzSNHtgtEyatPidBBUGc0Dxu9sjUhCrkdRdLUHFDAisBBiI4PWcShiWan+h8LI3X4yrQf48RxdCaGHPavWqJy5S1C++itC9S6x2e+SYXpxvPJAEKEMckePw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fhHK1h1G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JldQ5dja; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9TBMX1579490
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GiwxvzFBFTk
	sxSlV6xngcgAvRDm7LfcSPmtx8XQCJhg=; b=fhHK1h1GPrd4JjQ6xkU9j2xzhp7
	F6JsJE110TBCeFXpuG8O5aT1A33LTCNS3C06qWxuCr7GbLfhYiiJNcKPhvLH/bWW
	hV2/9TlPnXFwvfYb+Gn13UffcUuyWEvPm/t2fxMF+WyCPOHPgNlCk/et7Qk8IlOx
	QbOhzoOtUqeE0fwTL0TunC4S7496wr0/MDkAfSCHF0t8+qC8lpViK/wqLoCxng+c
	52Vs3qR5cdG1ZSH8DMtqGo8/O3Q3fyyU327mBLv0NWdXXt4V2G2gxrPWjKH7PB57
	1/WppRPqhpKbh5/Oxm/TCvHdExnC+UXHt5i4Uv9YaFkYONIxlgodfN4ICOA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg1sar6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 09:32:18 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-824b6a68bc5so2545244b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 01:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772011938; x=1772616738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GiwxvzFBFTksxSlV6xngcgAvRDm7LfcSPmtx8XQCJhg=;
        b=JldQ5djay/epQO7lY1rAIklkcWkZ9dYojmipoH2Wj1b6if1QKt6Sox9UeRhf5bTcdf
         87UP3ngbMEpuO48dMXpD9QgCfVy0IgXK9vjLJxZSZuo3mTbYriOCdBNzWpXNdWn0Fznn
         blrRUWoP2mRnMnSNzOOjgSHlNrRF0taMtBVj7xZGOuPgSnvjgK7ddkGnzImCqNQn/n05
         VFrlmJFRgMngOYGUp2N9/CKLZ+xvfmBTYeNQD+0TY5gmSpp7DQ06SAbfUmZMCNaTtBRv
         2p8MmQmRhkRbDRQEVY+g3VWPrOAEmSGeQSvGd993Otn4gUWxLcsMUbUnjDCQUWZshPlg
         aKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772011938; x=1772616738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GiwxvzFBFTksxSlV6xngcgAvRDm7LfcSPmtx8XQCJhg=;
        b=b+ylcHuArxdfdnqnjBT/Xhr9d7Nys2R1rVuFfsgH1/NbF+PvSQTpeB+338RpocqsCp
         HQMyD4oCKpCACl68XacESD1JbMn+uuXc8csLFint2jwfO3IYICtVs9Pwyb/V2FfmllOj
         gfVjalK4oMyW5E0aaflbeNYzykdRGF5B79b19xb22V9jWK80xAUcqHQ119Amm+vnrEHf
         AW1+rq76JsiMk4wBLuR3su0rnDRwoco+ufog/DuJAhBdOkVSbjft1Yx30tCvhJejo3zf
         6luVpGN6tp5ueGzlku3FHx8OIE2slduCRE1NVV/rfSk+U15Ucrp7QLXv+ql2ahHTSM7F
         QtSg==
X-Gm-Message-State: AOJu0YzB/92d3ZHFXC0O+ZNXFtb8+MYnbqv6L2UrpZlCK1/cd8SDlsvv
	nQgW4dm9lWpOC/5z2/j5wJUGqLLpPaxKWyrIcr0KLDOJIGD/6JAZooTekSfKKqa69UFRROUvJRB
	4En7At325YMRZmvqgPDY5pX+e60igcXcTeh2al7hugc+McfKxShnfx8gaRHPJR5nxbpaj
X-Gm-Gg: ATEYQzw/doyZSmQvPNEoq/aJYvxSkxWIM5WyRKtz2gK2rhacH4GLJ54sxFfvwufEEmb
	FPsArBHBE2vloeLt4grj5XDA8PHSeflD7W54XMwfJG8/ZTtGA0whzxA+cGR9c60mPy9SJ6fTMbL
	Nx0PdZEm/jB0fxbjaZs1/2CH22z/8CrjFgcNQLqv5rd4sSmWRsR9V+Fe5O+Q/1D8J2/hfLJyTIt
	4BMpA39U9NQNQAaUWcvUmY/p1WAjDuJJYOPopcCTCslTYX+wfx62TPczhonyl1HX9oYMXMezV6t
	emYYilm88WwRvbcSNbvD4lQOHxtQFgtcthIfp2QL2ZFFR51W1HE88bwhFvKjbb0v+r28opVVfuU
	6hGRzDlQQ3VZdw5ahUe9MSsZvyDcEsFH+nfvfjsHFRjQ20DbzFWCykW0=
X-Received: by 2002:a05:6a00:1a91:b0:81e:372c:b02e with SMTP id d2e1a72fcca58-826daa6ef14mr12431384b3a.47.1772011937748;
        Wed, 25 Feb 2026 01:32:17 -0800 (PST)
X-Received: by 2002:a05:6a00:1a91:b0:81e:372c:b02e with SMTP id d2e1a72fcca58-826daa6ef14mr12431344b3a.47.1772011937210;
        Wed, 25 Feb 2026 01:32:17 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd688aa7sm13628098b3a.14.2026.02.25.01.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 01:32:16 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v3 3/3] arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller
Date: Wed, 25 Feb 2026 15:01:55 +0530
Message-Id: <20260225093155.4162177-4-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260225093155.4162177-1-swati.agarwal@oss.qualcomm.com>
References: <20260225093155.4162177-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ZKvaWH7b c=1 sm=1 tr=0 ts=699ec1a2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=K8I2XD3YpgONH663DNkA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: oZwNxsn-0P4tGrgmdvfcx92Fm7DxESwY
X-Proofpoint-ORIG-GUID: oZwNxsn-0P4tGrgmdvfcx92Fm7DxESwY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA5MiBTYWx0ZWRfX6b19TJgE+GDP
 Z8V0JaifaRGK+Ffn5NmZ9smEm5fC3SrVl9Z8gB2BcvvKd5h1DqQZxGg7yClyFypCvwbBoU4g9Og
 XeM0f1pgD3YRceYcxX50fVgEW28Dr53H5JncdayoF9c+5ue4ZNbI4BIUmeZuEWLSyuMgzDtWoic
 oFa2MH7CpxgofwgKqp9Acg47y1d/LSZcXB07B/eNWlBZJmBY1CBo09Mu2Rwv2eZSsVpxzfTX7We
 C4cOk88S4kWhZG5RITe0tAF00QG3m52weFmJlUcsYIhUGwbH1Fn+kkOW6GiplJK/DGrCmTcBNt2
 LxzQH/tTBgiqORLmCXiqyzIYYmqKWh6TFEjcjqfQFZbxVK46AVuZnAnTrg67g51ovkNIZEGzsg0
 L9Se1Xu1Appby4ym2yQNkkdNGzEIvq479/CM15nSa9wlL+z+hGzIxqMqbjMPAIAhBKKeHCScAQy
 smUgBvDnqYYrgOy3l9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250092
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94070-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AB43C1951CE
X-Rspamd-Action: no action

Enable the tertiary usb controller connected to micro usb port in OTG mode
on Lemans EVK platform.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 397052394930..9e1e8b6f13dc 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -68,6 +68,25 @@ usb0_con_ss_ep: endpoint {
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
+		pinctrl-0 = <&usb2_id>;
+		pinctrl-names = "default";
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
@@ -141,6 +160,15 @@ vbus_supply_regulator_0: regulator-vbus-supply-0 {
 		enable-active-high;
 	};
 
+	vbus_supply_regulator_2: vbus-supply-regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "USB2_VBUS";
+		gpio = <&pmm8654au_1_gpios 9 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
+
 	vmmc_sdc: regulator-vmmc-sdc {
 		compatible = "regulator-fixed";
 
@@ -719,6 +747,14 @@ usb0_intr_state: usb0-intr-state {
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
@@ -966,6 +1002,22 @@ &usb_0_qmpphy {
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
-- 
2.34.1


