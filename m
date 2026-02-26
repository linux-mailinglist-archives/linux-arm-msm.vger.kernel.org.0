Return-Path: <linux-arm-msm+bounces-94223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOnvCoPjn2nCegQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 07:09:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C53711A1368
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 07:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3077D302FE47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 06:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2B4738B7AD;
	Thu, 26 Feb 2026 06:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q5Vn3pfp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZQLtHbwD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7557638B7B1
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772086144; cv=none; b=LDltX/HttCpc32+vqtaXnK3Bty1BHrJaZj/eInGeXpRxcEn4NXTPpV2GJ2JjHZzPMFa0Vr/UgruNvNmDqbY3PtifcIuTqYXGgagzmBnPJhpgI0/owZsP1WXPYhqfqPxPWEe2Gn6A5AMjIc1NJs7bRp3wtIULrRo7A65fMyVHFfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772086144; c=relaxed/simple;
	bh=YDQkfoBdQXcdfPkMAJWKhAgKaXB83PauTBPIGJadt8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LdvCJzrDw+3fZT6RTQcKKlBHbuwaVjPHjjNT3SzhqlD+eH9EL1l+MEBzmXrJYwzEiqqebFZDTv6Z600wIC8TQggTw6Za4rCFhLwOhgALy/d7+8RdLZLq6/fLR1ZeaJntVkFM24vg5LJbsm9gPfoOXNta3JTGbxQBhyDJOz0148w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q5Vn3pfp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZQLtHbwD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4UxUP3776994
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NeVTHLilPj7
	hzd9X8Q2+B8OhjSmUomXAGL0biT0VrmE=; b=Q5Vn3pfp5lvetAiB4JZyMrGVGYM
	4SX68//3otkty6YKbaq9ICerb9mLCw4bQkVI9Mj5iQMk+/A7M1G+yY0WraCajJWT
	7xRaYfGLiwUW3x2rLcHn2EEXH1cjwJMUEICM4JDlZpuE/8ZFYEA2TBCm8EuruBRe
	JGMqEuNSWThFgNr+erraHnCPK39ixLRqJBzgjqJtDao7A5MvlNPk7/0yWL8iGLho
	iMbNjxS8LD3Vft3JphQ62XO+cOv5DfEY1k4JiZgHC4/EEp360BHUra7+d40thUr4
	EEhmn+TqK21l0uGlpsHODM128hrb63haH+oQlGBLNc2HXZFpr/58kkFHO4Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjae0ryq9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:09:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c503d6be76fso1948759a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 22:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772086141; x=1772690941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NeVTHLilPj7hzd9X8Q2+B8OhjSmUomXAGL0biT0VrmE=;
        b=ZQLtHbwD31woQLFfDqGyqn3psyRRYmhtI11ZPB6K+8DM5xGX7054oNtSyYc9f+Zafo
         1yO+VSDoQAXx+vg74/ShtC8J09pHpaBHo1mysH446huqu6KA1+gMi2CppUaz5gS52uia
         2XmOIZ2qkt8tPTPQPJKhy+CEYmqauFmPwiVnGTsNzza0YvSrB5F4Ng7LQNUCYgqntyqv
         kjsgfYgldK3tBn3PFGoTMcWH6pdYZNP/P4L1HunDBoPP7v4fQLnnfR1P/WPLDDowhaVC
         wMtZDx5QLcvDSJxUEk79FlDcqxija2umlBzzPVFdcGDnAf+YtVbOWOpg5VSv+ZlV+tLZ
         gaLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772086141; x=1772690941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NeVTHLilPj7hzd9X8Q2+B8OhjSmUomXAGL0biT0VrmE=;
        b=NQdLEKT1E0Un1+oc9XdCVhBeXV64Qpl1fS/V4ZYaNIc2FCDVIiRvkwfdQwpmY7CFUN
         QqNL/MAM4mlpqXd4RTVTD3f3L+lQfka27Q/RbMLM0y9tWiqEsFoBGbYQsvfauW6bOol5
         ce+xICAVBtRwUNKOBASS0PqrZcKVU4cznp0oLNGqnhWKe/JVFcPK7ZxMMKvwpRdrxEeq
         22yTwELaaOyTK6g1Mz665s9fRzkD7XS+EHzU0sQPRv0ZPbHG6cueD1fkaAVMZ4CqzbBc
         shHybN+tPjCKnyqFx7s+SEVU3ilNte09NZpmkGzcgDv5h1zhQ0hLWV29ke+hEm2HxGEj
         kreg==
X-Gm-Message-State: AOJu0Yzbx/IPbL7kBF6wZS8PuosBOz/Ol4Sh2CxblV5slFlWWoHQmdXc
	MbN1eT4RfUvuxSi0kg2Y2XPkD6nPVUp3xqcd7nkokY33P5eagUKBY9mFskGvcOWJsN4+ca8V6qi
	A8+A2DJlFCXffSd1fXtsqeJHg1gGe3cjTiBTn/GMo0Xy3FhrkAu4Fj3X3kfP/UKjEE4Is
X-Gm-Gg: ATEYQzzeH3IflCjretsGqtBp4rU1T1tTb8lSry2mrnUZKSTNuy3lnoaom7nWx+1sWbF
	BhitSVAQTer2AtrsQZ7LS996iVnlL0ogCM6xVq8CHDOcKPGbQVGoUCzDD+ZbRoUVUwqgNEazcXl
	a6M3zuxWSIC3zxuLXAtBHyPsloPubXS0wNumiBN6wliQGGG6eIvbmmwinm/zymKZlY/rtIqXg4h
	MayLRq3mdBLIR2ymDG/T1mmGXJXhbn8QC1C2aX37vbly6tlcYRCy48yHqrPlqADKTNFoEmoxIOc
	/H/6QG6Uju/naey57CwW223ygADMiiQNJR6DTDP0YmfHbR6thntFhHjyt/wsljkTAMERXRwoI+c
	bPWtUnrikWmNtMTMBL59RPhGcc/VqnzomAlGVgZl7U0S5Lz12WmNYrHc=
X-Received: by 2002:a05:6a20:6a08:b0:394:5ae0:2921 with SMTP id adf61e73a8af0-395ad23d47fmr2804847637.62.1772086141200;
        Wed, 25 Feb 2026 22:09:01 -0800 (PST)
X-Received: by 2002:a05:6a20:6a08:b0:394:5ae0:2921 with SMTP id adf61e73a8af0-395ad23d47fmr2804826637.62.1772086140676;
        Wed, 25 Feb 2026 22:09:00 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912fbc363sm2754421a91.2.2026.02.25.22.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 22:09:00 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 3/3] arm64: dts: qcom: lemans-evk: Enable the tertiary USB controller
Date: Thu, 26 Feb 2026 11:38:35 +0530
Message-Id: <20260226060835.608239-4-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226060835.608239-1-swati.agarwal@oss.qualcomm.com>
References: <20260226060835.608239-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1MiBTYWx0ZWRfX4oH+h6dWN6pD
 VJW3nonl4RE9UxVKPpYq4bC6W1E/1C4DEZUrlwDSCZ8jeoDXQ1+uty4Y2R28NtUu1fOPXOpYlp4
 OjysPk/JWOrzaaXs1A38B5y1H03cUBfdbCHPiP+CK06YRQFw8RcV22mNDW/iC7DTdNylSr0rzjX
 lonoT+MmVoHcOFVoWzOzsexxf7NIituCEbQMRVmedxp36Y3c8g/1g8p8iMWGbrpYNjjNE+gSeXm
 vmmmXv6Tn8KVhmI+jpQ6UreMXT+yZr66sMCwlNSOVXTb4nMW0+Q8MNotPcrjve6M45D+bXSmmci
 tt4iwo/DhtK1mu9vWUdqsnJyc5IdqU13XbAl8l/0lEGwr2GJxYL6IDay9FusuHoXNpv4Qw5KFPS
 9zkKnjzxOqfg36kT0ConLqfJTrfn1kZ2hNNfWq2IIkQouWzXmKG/Ec04VEoheYLJfvIAX1sC1sd
 yOLpr8BGYeyJTY8k+Gg==
X-Authority-Analysis: v=2.4 cv=O7Q0fR9W c=1 sm=1 tr=0 ts=699fe37e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=WNaE9oMJOCZktHJ47CMA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: fSljEgppYT_Dn4i02M-cD4us3WCPryhu
X-Proofpoint-GUID: fSljEgppYT_Dn4i02M-cD4us3WCPryhu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260052
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94223-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C53711A1368
X-Rspamd-Action: no action

Enable the tertiary usb controller connected to micro usb port in OTG mode
on Lemans EVK platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 397052394930..2203967c7d51 100644
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
+		vbus-supply = <&usb2_vbus>;
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
@@ -132,6 +151,15 @@ platform {
 		};
 	};
 
+	usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2_vbus";
+		gpio = <&pmm8654au_1_gpios 9 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
+
 	vbus_supply_regulator_0: regulator-vbus-supply-0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vbus_supply_0";
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


