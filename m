Return-Path: <linux-arm-msm+bounces-94221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHvEMJ3jn2nCegQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 07:09:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 263DC1A1384
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 07:09:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 839BA3053B27
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 06:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336FF3806BA;
	Thu, 26 Feb 2026 06:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J5VWY7Aa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LqEBDgec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0789338A706
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772086131; cv=none; b=Cw+3tN2hEiG+yv6Y3r/zmZvfmF6KE4Kwk+PordxPgQ1Fxleluc1COSDaeQh7E1KO+EL5KIuc/IRXdPn8H3kmEeeEq6tg/aAjuT1pfg6H31uc6TisWM1iqHZGM4hoVq1QNcN82hJvOnwsg9pBhXLztaJ0L4VCK3zfiq3jCtfjQc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772086131; c=relaxed/simple;
	bh=uWu9jIBwX829aGDTef07/6Q/TFFzpbhM2ciDeQWkElA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=or6cSH/Gi3XDmeltHPJxHZwSdlpeRWCJMxYvJaLGxTVK5LlSrM8BEtDzpxMYhLqciNLuQG4bGp753qIEdJXFOPlBJiaUaIpXDiONwpphybFMvdFuCol5RXuF+jPAtx+Oq58XHc0lrDARwMbbXYH6UH6zSl4hSkOmk/viEHiFjiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J5VWY7Aa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LqEBDgec; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4VG9m3995286
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hjowCjXGIsH
	C4zVtpmF9MuQz/xIMztOUoGVJOyajdTM=; b=J5VWY7AazZ4scKpFt6U7/axu5Xi
	1f3UQ65bhh4VYpYy//3PW7b/dO+qK14tBdOIDkGj5UzsPi2kjkMQtx+Qi2txvRMD
	IQGbVKvUuNt/nOJKFdS2iZfYEuaKfhGYFX2//IrgqcxACLdqyM3G2pzNgQvcfgvw
	Skok5Vt9ZIOJ6uQNr3pmYq8CG61tNLLxu94Wu9rdA1XhtViG8bseNJPpor8uDWTN
	w0jD+VsK5zBDiB1gSo5wKAX1cyF3BtO/usOHWXmZXbPa7wk6wjsGIt7GVLm1xrlS
	TkzsyHjYv5m1iC2/oMSS9uz86S46OAtOPypeSsjbQ9iAs6yz8PInueFNqsA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj55ssy9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:08:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso2023804a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 22:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772086129; x=1772690929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjowCjXGIsHC4zVtpmF9MuQz/xIMztOUoGVJOyajdTM=;
        b=LqEBDgectQwhrf5RhHdTFsg0IRQJRiZUXCbMf8QGtmtrixanvISPdxGSmz1V9W6A9/
         +c4wfSobQjTA9lwFdUlrbOcJxBma9ipagFQN5lH2giGFSR1Zae2trq0YhzCSopOBng9f
         riUI2k0WZQ8dBg/RchBA7bN4p3vQh86XGQOc4pdKgiI5JrrMYhQ6EsW157Jr/mOVjJbF
         IWbXmOJ9Ji9+5vdXWSBTux0k7QtqyzYpi0nFZ9Zwj6zbUitKyohMwbWpw70S8XC5K40n
         OqfnrgUC0PkUMBjDAEsj9z6sUMOd8/Cbd92LSCEluPLpHf0mGLcl0EAsHJZ/TqRoCrM1
         H79g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772086129; x=1772690929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hjowCjXGIsHC4zVtpmF9MuQz/xIMztOUoGVJOyajdTM=;
        b=cJK9y1ERvOp9UBoeP98JTMfuG3sHX2EMTscf2/IdwRsmaShamQ1FqpyZjkgH+zrhEP
         aqvqLvSPChm0Actt9AgqWpcrwOICwbQ7l9p1FZYZCpZF+fLaGRZxsUIT/fSiO8exIkDv
         Bsb6WBNra4xw2pXFn1d29sjJkusQleLxfOIr3rM0kL8rTOIZdInf1RrcWQDYvPv2JJQf
         PBsXC8DY6w6oqwJMTaIDyBnhgNgOoBzy0xPHF2hA/UTSL9L2ByMlR7Ooix39yjgqzulk
         GYY7Et2LFrOR4K8bFhgzHbldW2RgRdoQLvZV/psG1hyqOrPac7He5mj+B68UdbMf6NtH
         oy1g==
X-Gm-Message-State: AOJu0Yy9pACD8VZH0wgqBJTg6g47COddBhwzpYmdgl9tzv5aYr5KnxM5
	WkZF3JXT69xaVY/cQ8UBo6H1mBHaOhE8YwVhpYGA/Je2352tBRRCA4eyBQJkB4i4YNPMz8ZSdq3
	BMYZyH96ECLBLDx+54aqwLtq3RoxLLKN2e+TCB6zb51TDKVefLK2vjZ7qWbAFaZX+ildB
X-Gm-Gg: ATEYQzwHvSuRoeUvM6XPV5jB/ipJQ813R8hPc81IhlHKmENfx2Yrpi539Cw+W6f/C99
	flSmRhu3fseq2GMoalAbBPW5GEoTaFavoUOOxjOjYYXHmNl08LphwSJHuvrOEsJAHWU3S2+dr5B
	edCt3OczxurmhWIaMTrhk0IZsHMSjyhhcTisRH4o9gKY6iFt6jNheRMGBg1esqWEPHGPLL7/3Tn
	viEwLAnffXpPSKb6Gig5lCqo7DGs7H7n5O3Ctc7dc5tUMxp1uRASBez4IDB4zTDhcVKoaYNH6TP
	3VXnAsE6y96pnFLPBEnRAlFMs2vMnfUgZpuGd0s+Pjujj+c7pFWjFNpBjwgDVQ2QbfZ9AIu6Lcd
	g1ghyKJNEHNNeJ6CPRZWwqWebm8C4wm2BsSPafdmDACzNG9ka01HiT9w=
X-Received: by 2002:a17:90b:55c5:b0:356:41c2:897d with SMTP id 98e67ed59e1d1-3593daa4032mr1163370a91.8.1772086128775;
        Wed, 25 Feb 2026 22:08:48 -0800 (PST)
X-Received: by 2002:a17:90b:55c5:b0:356:41c2:897d with SMTP id 98e67ed59e1d1-3593daa4032mr1163355a91.8.1772086128345;
        Wed, 25 Feb 2026 22:08:48 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912fbc363sm2754421a91.2.2026.02.25.22.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 22:08:47 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 1/3] arm64: dts: qcom: lemans-evk: Enable GPIO expander interrupt for Lemans EVK
Date: Thu, 26 Feb 2026 11:38:33 +0530
Message-Id: <20260226060835.608239-2-swati.agarwal@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA1MSBTYWx0ZWRfX2w7LU/SiefXl
 sBr5tk78balA9gxpyqoJdI48aNQ4EhbQRrxCmlDSxRdC2eQjPoVrEKm2cdToteORwySiyN2Mq4t
 v2BiFG6o1MTxRajGKtJF6PJE0vhwDcG2FxDIMxgFbwT1cJDtWjP0fmwkPy3Y5CcqIey3mbc7HHv
 lSfSqHC/qXMK/j+aIw8JwwpdrBU0Vd+3b3LMdvnvQHrVC/OJN8yCzCXAN1Cc6KvXZd7ouMIaYj4
 YUlblhkoXxtC791l4WFJPUzrsLb/3O8aUVr67fYYSrDyW7ieVDLXo/dxKeZhBjaO/sRUHuzb2sV
 n4CHNkzyVl/O6HP+PSrr+UKkCSn4mpOXA28cGJdoVL/72a9+c/JIygQ89TUuWDoVCUvZ+zDQZR/
 0RrOLPT9ylfsd3di4zd216EhACpgBgaU8w/6CMKqp4C44PUJ5lIhYE9uUaudNaSPDm2CXu2ZQe+
 e6kwnF4qFwzc3N4JiTg==
X-Proofpoint-GUID: W5cwGqmE-BGWmW8stJ0l0xGnoXy-e8OX
X-Authority-Analysis: v=2.4 cv=JfGxbEKV c=1 sm=1 tr=0 ts=699fe371 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=bqNqw6pGn9JH-5OicrIA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: W5cwGqmE-BGWmW8stJ0l0xGnoXy-e8OX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260051
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94221-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.38:email,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,3b:email];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.39:email,0.0.0.50:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 263DC1A1384
X-Rspamd-Action: no action

Enable PCA9538 expander as interrupt controller on Lemans EVK and configure
the corresponding TLMM pins via pinctrl to operate as GPIO inputs with
internal pull-ups.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 44 +++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 90fce947ca7e..397052394930 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -546,6 +546,11 @@ expander0: gpio@38 {
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
@@ -553,6 +558,11 @@ expander1: gpio@39 {
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
@@ -560,6 +570,11 @@ expander2: gpio@3a {
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
@@ -567,6 +582,11 @@ expander3: gpio@3b {
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
@@ -804,6 +824,30 @@ ethernet0_mdio: ethernet0-mdio-pins {
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


