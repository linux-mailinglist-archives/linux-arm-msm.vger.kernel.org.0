Return-Path: <linux-arm-msm+bounces-92507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LhBG30qi2kvQgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:54:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F03611B0AF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 13:54:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 21E1B300E5CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 12:54:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7091231B104;
	Tue, 10 Feb 2026 12:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHwddbiZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="izqGlYBk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7FD30F531
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770728044; cv=none; b=k64RQNL1iH6G+mRUirVH2zm+Pdc26oeHSOlVSq4pA9j/k6/Fo9Ct1ynLU6XaALERSzWhnBpZBqG4bcaUqpzLPDjy8knb3mDbOLuXqfhsMXi+zvWpSBD1U+ManwtBf8J1eLbybSsCjmIjYXYW79GS7eKjbRMUnwOhONirV97e/O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770728044; c=relaxed/simple;
	bh=3YJ5lBbI7AU6e8k6jAQqkM4H+bbZMvDHIz2mGafMwCk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OOlo6oCy4QHHJs24NlQBKCIdJMoEE2CD81Qz7Ayju4oMrAP/f6LTLrLoAxr34RSakm8yC4ZbO8E7+g2504SXqf/21mk+UikBCWxZsBAC5tFOUaM+GtYTxCUu99UJ56NVlwi3Uki4WPA7e33PktuuKPoq1SPBJE89ju/2A7rmu/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHwddbiZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=izqGlYBk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7G2QG1419398
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:54:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N7ls7eGdUGl
	jdE//ela5kpppPXcOcXHgU6NIRQaXmhw=; b=AHwddbiZ0sbG7KN+L0B42nJ72vT
	KHqk5cW6vxf7+LtxWarEXojAEO4oqwMgjoxh5n7711qbZTvhLWFMBHC1mzqz8Uan
	rt0cF/xYBP0UA1I0ti4cxyXlmLg7QgNkZFcecMlbwUW2DKKCsUbGoC5LlbOyMPvR
	ZCRTZdgt/aQXRxkgmVqwbzSQ/sNbq9bHywjC77zXEveHQ2C7h8GTQeGPbVSvQaD6
	YQ1WGlNg/pQvT3mJdeFd/DQGYkM0zLyLZZk43bMt9BAG5CUii0b1FAUsz6Rsk4xn
	lchBrx/NsyfxNAHMFeU66kXTu2L3kYvuRSFpP8haen3WDNzlHVQxCy96WFQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7rpvtf36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 12:54:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a784b2234dso24039235ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 04:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770728041; x=1771332841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N7ls7eGdUGljdE//ela5kpppPXcOcXHgU6NIRQaXmhw=;
        b=izqGlYBk+3t+NMFudpavNjHOBH3FVLD0RL+r87ECrS5ysWgMHpWMQOGROCN4UZ7L3B
         x1osUARZOUp4hl5gu6eS79NbcAf5bdfiZx22sHs+asE1ZkUcButuo1BkJnVwh96AaNB1
         UHw3agmeuI+/4Ws8JdIt8f5mBR+71/XjqrsEQGkPrF+F752gYPYNW2YG5Cvo6+Sir5IH
         o9vwZjr9BLkmkTl5VPBRFKxUJpGjOYrDkPCKaa6IrpOlTt5ip7jtpgVGOc6s2qFNLY68
         z8so/ozISqFdUUHhw3YaTVbx25rAXBw4VzEU3tooV1dfhz1TNyXP4SsnMEVGkRUl6fPh
         8GMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770728041; x=1771332841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N7ls7eGdUGljdE//ela5kpppPXcOcXHgU6NIRQaXmhw=;
        b=kSKM/xiNA6okr1WWsZ0LcHlzVLLlvWJvoSNsOVk2NAWFwWi0Fxv29X3O31SZ1KaSte
         R0k5G2LhvOzgDYtAA4qvrVUaXpHrJ3OCa5uSby41K6D2BaVRGFR7dVMV6ysMYusDYgME
         ufzHpej420Qv3OCHs3m90w9p9WOGGlCvC643KVSyNuzoLbLFhtWxHnxHddff0ohdRxAP
         KYP2VeyLdPpFrxFrbZLw/b16TGcaUhp9zRr48f3QaINoc0sh4+gtDpGviKNc/a33BLv8
         D1qrK2gmtREsX1aQX+zLmqoc1D5TDKvBpWaF4SW7ChuUZp88X9oEP2Q3xObuOrR7Kng2
         ohBA==
X-Gm-Message-State: AOJu0YwvJRoeWzIulmi8mSzsRuZpdFBk972HkT6ymFWvzKd+JlPu1cU9
	qM42gLuPceyHTB7v91ziqly2Pi44dt7C4vSHSZ+QWRkutEusoxzvwDddBreWke2qeu5nIzT68Np
	I387cOXtXMPLCUavC0kcOf7n16mR7ymDwLQi0qFqWVDYhFbIppDej/sUHziEpq7cd+WmbjPRB5Y
	UN
X-Gm-Gg: AZuq6aJMyrH+nmIcaxmHLrIPzsGDjIID/aE1kuLBTig7gY4D6SMfTCr3Ff3k8X2P+gM
	M6HSGTwpvDHYVaCcDaDrtCTf56h43hPb/jBHMax5+Mj6HVLrgG1jzDhFpwh2g1qNLtYz+fQV8Gg
	zzudNd0UAxGNtSYQ/xqX1jRe2JlaocAb+v6ixfhjNPRtkla9mn7tXMIbiyCh/+bdOHaGEaXFl0P
	9qexwR/zH5jQST2HGbulGqJeuxvHrv16MQTlj0kVtlRplhubP+LXKomvtMx+naHY/WWED94OLCf
	Qxo+QVA9EAnIqOppWrw6iSsL7gc2I3uXzM0aaOWlOOoJ8cqjEO3N4+muczwSn6ii7nHYLFlEA5F
	h8pYY41vKWhBfWEISbR0/T735FZfyeZTeoy62iddlei+T9EqRSluwh3I=
X-Received: by 2002:a17:903:19c6:b0:2a0:8be7:e3db with SMTP id d9443c01a7336-2a9516a70f9mr162440565ad.15.1770728041175;
        Tue, 10 Feb 2026 04:54:01 -0800 (PST)
X-Received: by 2002:a17:903:19c6:b0:2a0:8be7:e3db with SMTP id d9443c01a7336-2a9516a70f9mr162440285ad.15.1770728040693;
        Tue, 10 Feb 2026 04:54:00 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951a64990sm185356375ad.13.2026.02.10.04.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 04:54:00 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: lemans-evk: Enable GPIO expander interrupt for Lemans EVK
Date: Tue, 10 Feb 2026 18:23:47 +0530
Message-Id: <20260210125348.2800846-2-swati.agarwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwOCBTYWx0ZWRfX2juyAvGT61Kt
 vVVwve2tg1cwAtFAsGecXPoB7ug5vL2HML27w7FVcjkv9GxVH735CtwiNQSokUPi9R3Y6S5kozE
 xzuOynT5aB3bBwYMrhRjWdpkyu7ICwHEsMZbN/SpCZW8Wvs5v+hlkQYWfBgMXPwb+Q1AHvWmARb
 +rLBXHfR/0p6QFwXWZs+nYg3Dz8vc5Bbe9vtPwL7TZOYUycPq2xdAg58fwAg49td7gDgAm9jT3F
 th0isu5OSMgt7UYZTkc/yZs39O62EXnVtrtCquAmi8urzCyFNZGZnGtsNRxIhz4igbt7gEJiQtR
 hrLkX8IVzXDoFrGdxpwD+tUKPTFv2AM3pg81ICHiJdirwtzatSzjGHUB0ULdAvfn1q1MKPE+dyg
 VakfBpPdBdRlQz4sX9Gh+Ks//OewDskyAzMNLMa9VU5KsCKKcU/bji0UWZrGPc0EHP0hjarQINf
 h9hRV+hxQAutPcoWhMw==
X-Authority-Analysis: v=2.4 cv=KKZXzVFo c=1 sm=1 tr=0 ts=698b2a6a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=0TxLVs8cyrv-jLPu79IA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: C69_aGqEzxZ0xg5rgr7E0--Wbs_Nr3s0
X-Proofpoint-GUID: C69_aGqEzxZ0xg5rgr7E0--Wbs_Nr3s0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100108
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92507-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,0.0.0.38:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.50:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_PROHIBIT(0.00)[0.0.0.39:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F03611B0AF
X-Rspamd-Action: no action

Enable PCA9538 expander as interrupt controller on Lemans EVK and configure
the corresponding TLMM pins via pinctrl to operate as GPIO inputs with
internal pull-ups.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 44 +++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a549f7fe53a1..265bdad10ae4 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -628,6 +628,11 @@ expander0: gpio@38 {
 		reg = <0x38>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 138 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander0_int>;
+		pinctrl-names = "default";
 	};
 
 	expander1: gpio@39 {
@@ -635,6 +640,11 @@ expander1: gpio@39 {
 		reg = <0x39>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 19 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander1_int>;
+		pinctrl-names = "default";
 	};
 
 	expander2: gpio@3a {
@@ -642,6 +652,11 @@ expander2: gpio@3a {
 		reg = <0x3a>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 139 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander2_int>;
+		pinctrl-names = "default";
 	};
 
 	expander3: gpio@3b {
@@ -649,6 +664,11 @@ expander3: gpio@3b {
 		reg = <0x3b>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander3_int>;
+		pinctrl-names = "default";
 	};
 
 	eeprom@50 {
@@ -894,6 +914,30 @@ ethernet0_mdio: ethernet0-mdio-pins {
 		};
 	};
 
+	expander0_int: expander0-int-state {
+		pins = "gpio138";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander1_int: expander1-int-state {
+		pins = "gpio19";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander2_int: expander2-int-state {
+		pins = "gpio139";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander3_int: expander3-int-state {
+		pins = "gpio39";
+		function = "gpio";
+		bias-pull-up;
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		clkreq-pins {
 			pins = "gpio1";
-- 
2.34.1


