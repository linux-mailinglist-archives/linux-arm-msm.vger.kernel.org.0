Return-Path: <linux-arm-msm+bounces-95067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WG9EHAKcpmnfRgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:29:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7C91EACC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:29:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E313A30CA26A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 08:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7048138C2B5;
	Tue,  3 Mar 2026 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K1gjfRnN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fGrRe4ye"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FBC388E71
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 08:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772526147; cv=none; b=f5jrqKo6QPL7Y0iR8kGZHlQZNV3UyhToQUyuJrfzMR3NiicISkqX8QRa1HeulxDUs7CVfTm5OKHYHsU1432WUL/46pdMY/BFtO/4tDU52mSU31cQ2MPvsBI9duMkaWac4WsfT436/UpnlAcReZw1nd37dn9yKpnsq4ARofTVdZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772526147; c=relaxed/simple;
	bh=VrBuHSgeoLm9jagCwTLLRdn+9yMDaRhBJQZW4qBGh1w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tLL7lD5lvcROVp3eKyWnfylhKO13ng068kKkI0kfYvu1FbU6fvvpjGlDbZ0+4KNw1V6BlbPHs57AD+AZI5bSlyXylRbu/XvkIOzfL2hT7y0REnrqP9QZD9Yu0FeOoVxyKEjRaVgaAAhYDY6PaMy21kO6L5kL8sJSaCfzSabQhOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K1gjfRnN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fGrRe4ye; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6237xBGe2855593
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 08:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Qlei+jbjmBH
	LL4r2FvlwOsnaUTwcOPNPy8Z9qbYfIwc=; b=K1gjfRnNEyxovWyG/Q2XtRAvtra
	EyYaxtFGGKX4TDKPU/YG85eMNM5N8ANmRdrP2Ejql0r3H2ro8mNgEqjMKunCjyIU
	6zhfUhTw9qls13JKm3dDi+bLffABVzH69y1lR14O9hIZgkXCwxDTs0FlDBxslZgv
	WiHkaO77FeZvE26iYs+XRTyJjvPvQqVrZvF2HHCQRGDPd4mVLATDRMXFKQncxyJC
	5Vur/Jloo78SDNah6I64GWoJe5tS/UUwfgKIM9FezYwYcONL1RqsGKsjcQ5pvImo
	qKDeRfPXddZmW/h/TFqlm3eoUIyy7V3BQZNQUZtaz7myS4BEjR8b9dP6t9Q==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnuqu02yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 08:22:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3568090851aso31831241a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 00:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772526142; x=1773130942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qlei+jbjmBHLL4r2FvlwOsnaUTwcOPNPy8Z9qbYfIwc=;
        b=fGrRe4yet0xmQSln7kr5kSqQQ4KE/ufaco7zAJHDc7H3GGzbBEZD3aWb32M+MPWiD6
         UfwMmFc+Fdf0Jm0elDMvh1vxAp4mLQb+FXXu877RBs+ey483I5eKjKDxm50ZAsDtQScG
         Z2iSweCdY6+Sv6Nh5Q4kAI75tB7sltXQBD3vc0DKoxXE6/xbDaCHsu/r5bBDt1IbwuyE
         vahxJYQJNlYAWbZu4G7r9rpL1kkhqU8mvXXMj9ply46CUunalrTV4dwkoZzEA7iC/Guy
         O/iPcdln0up4FXpDw4ARPPL5S2uTdNdSKefmvqjQq9kCSUqP7eV1YylaDd0ofEv9mFCA
         qzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772526142; x=1773130942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qlei+jbjmBHLL4r2FvlwOsnaUTwcOPNPy8Z9qbYfIwc=;
        b=jeOGzS1KhLnaSynM2B1mszAhSKF5rmbz8uvZ6oMP25vL4OodlYMFtu2F0fKExhO7vR
         laHgglPy2QRH9DhqxXMz4bR2DglTr7gkLYHeQY4H31i2IjG8wFgK6//UPvLHJoU0Dcz+
         SAzayhPB8uY7E6gUJ1je2EC90JK32Qs1IyQBEuOfDTic0SZiqqVeVzBmaDYJghQPVFGM
         tKNo8CkKQPpsVmpJ31PuHI0/vx3NKgw6rcnVtMDKdhkZS2fGnKJyZOdUw6Hyxt1fpZUA
         E8RWUZZKMkXLtx2whqks+wYQ9SB3GN4r+tnzK6FNOIbQFWEmCL28LTTI8dgbZWjqQNV0
         HCQg==
X-Gm-Message-State: AOJu0Yyla5ZEVFVstTY+1TMysGk0SspcgwEFH8jx1sAAfdStszjYOWy9
	T+nOwg87vr4Y5rIg9FWdfKzNKLS2mkjqfqPZ5bhIjT2jVWBiVhZJdTH8/rbf6Igh9lwl64KjtVJ
	aCBuMnXJIwTc/Zss24nOlbLYIjwak/S+rMr391qtpHY/rMlzjbYR95uKonHwvPQKrOOUf
X-Gm-Gg: ATEYQzz7/FaZs3XmisAv1Zv8TorPzGQLy/sm4Fao4ly2xq1UW4jc/AfFDebIY7lPR0v
	eHfQELYPRrRVlG7v5yOn5/cY9INcaAzwRarCZHvUgWmhrZsvb7StI24oywdgdQnnPu4RwSoktQF
	9l71jJ6oj9eAfTaWqhDVFpzW9mW5Q+LhLcSiVHyUFRrvqWboqQJOjeq4hwMeMIDu1kmngvzlyob
	HfWlEBmfpDQ7+wnkbXsdCpPRU1uUfpS7yaxXY0EgL0/jL4tU+e+yaM1UOe9/6CrVZ8AnpXyAgKC
	LuStx7JRwJ4eMmaUoovp70ndegMHc5i9wJk9JfDO6J9db19RaW4PKY2Ek71rl+BrPl5K66WSePY
	2BA5Ts5dqnEDIcxaXfVMWJNCJTblFdxPTlWCI2pZjynDnpmGJivye7y4=
X-Received: by 2002:a17:90a:d2cf:b0:359:9224:6c24 with SMTP id 98e67ed59e1d1-35992246de8mr4156225a91.2.1772526142213;
        Tue, 03 Mar 2026 00:22:22 -0800 (PST)
X-Received: by 2002:a17:90a:d2cf:b0:359:9224:6c24 with SMTP id 98e67ed59e1d1-35992246de8mr4156201a91.2.1772526141728;
        Tue, 03 Mar 2026 00:22:21 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4e2f85sm1797214a91.17.2026.03.03.00.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:22:21 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 3/3] arm64: dts: qcom: monaco-evk: Enable the secondary USB controller
Date: Tue,  3 Mar 2026 13:51:57 +0530
Message-Id: <20260303082157.523847-4-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303082157.523847-1-swati.agarwal@oss.qualcomm.com>
References: <20260303082157.523847-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69a69a3f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=DSDS7fUqx7ACsPcU-5IA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: uiAKWWmtyrC_udEALIKKipW3UaHH3LKd
X-Proofpoint-ORIG-GUID: uiAKWWmtyrC_udEALIKKipW3UaHH3LKd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA2MCBTYWx0ZWRfX/G/Oyn/Tj4Yz
 cHhqwkxCHAERU4/8s5RlMdSHLW/gPmyVMUoA6ilWrUjLr5ie0bxAB4HferVbkVNA97zMK+Llm8T
 o7NjpJpJT7tW7LDyBooFN5HhBpovuN3Jl0Y1prbDkVqJl9JvM5Ri/XsSpAzYU5pW1W3O4V9dWXs
 68/mr7Rnbuknpgo6eIoUW1J3GTGlBqur2kueLDhcVzA/w0efPfguWxO5/b/WuyT/mmp6r7n0p07
 pPk2V4tQsKVpNq67nRYiTbnxHas/+1BOKiN+PBBHT/YmivpqF/wnLLZxC2dOVXWK8thsCvTKoLp
 a9tv2hmr7Ube8PCox4qXDiHJ0pTVq+4nONgZwfnj+1zwdQQxxv14hQPneOdbWyiV56giQJ0YGGw
 p+7yfsnMbaSSNzbbqtCohmCy5vYfY7uH/u1Aaqf6n83MjObircZIkhwxnZ0FkcLbZHGMviT7QdD
 9LDbgnQnZcj8liqQxgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030060
X-Rspamd-Queue-Id: DC7C91EACC0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95067-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable the secondary USB controller connected to micro usb port in OTG mode
on Monaco EVK platform.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 54 +++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 03af9bbcacc9..bc75bdd1281b 100644
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
 	dmic: audio-codec-0 {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -77,6 +96,15 @@ platform {
 			};
 		};
 	};
+
+	usb2_vbus: regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb2_vbus";
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
@@ -690,3 +728,19 @@ &usb_qmpphy {
 
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
+
+	status = "okay";
+};
-- 
2.34.1


