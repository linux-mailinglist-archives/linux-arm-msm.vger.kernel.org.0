Return-Path: <linux-arm-msm+bounces-119168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0Nq5EuwyV2oJHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:12:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2146D75B529
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 09:12:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FMeSQb+y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=LCHXLWPO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119168-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119168-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4699F302FEBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 07:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B251384CF5;
	Wed, 15 Jul 2026 07:12:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE7F37A4B8
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:12:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784099546; cv=none; b=CvloePmREI9IozDPxvnQGOdIlnnY0LEr3YLfQc3MOE8sLtjFTb5UWr4lofsoVRuhtdixZM62ThVkfFshNX2rQ8mW8A6eE5qs3Pv0y0j4Hb3QpHx75N+WQlAB8MkCNbCQ1odJyljf1Cwkpapo2znkCBHAN2/DJcK9ERpoNtkTlqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784099546; c=relaxed/simple;
	bh=JQA+v1EfIB+ku2V2nhFxmDsNU3E92/C24KpbpGghiOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hg7dhwvZOmp/kztkbvY0CKIGhuHyfhxJCwa/mkaL9TrUyr0OOxVcR0OWxZWibyIZJFFdkIpBg4lU4EUdMjeIgV9kF0qB7kW6mowZcWpHVbE/pdaVts4IZux0sizrKl62LLCuu1rffo0SIX21akTt+joJq+2X2SBurRCHRUwDtGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FMeSQb+y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LCHXLWPO; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F3l42e2405722
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e+PSBYPp/RJaUxjZ5jI84ayrvMfLsmrCAZoVtTNRHBo=; b=FMeSQb+y5QtC9p/d
	tw7bDmmkTe9S8wbN1mkXAV8s7bWcvxvlnFBuaVbD9xPTeeWAI5QCmAXcD2aPX7Kf
	cBFKmZq7sVYiGkPofR+Cgtw8neCcFHuZLS0qfywvUg/aPIgneiTvvGRT3vp5v7+Y
	QZxe7YYj/LPAAgvadCMzpADXyNkhgUrWLf0hk3WOLJ2IFMTfXyvRMnfiTUjgx/D0
	5+sXqy2s4PRniQXmYTVG/gwZmQK0yOBXcjydG8xxdHIPIjD1A7ZO4BnR7vJOODeU
	WrN3VN02+h/7iyZKoTsaMyk54KTTB+M/ka0xOXi8ZMCQv4Erc6EruVwwWwGw79Ih
	hAjuYw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9g2esv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 07:12:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dc101287aso5758752a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 00:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784099543; x=1784704343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+PSBYPp/RJaUxjZ5jI84ayrvMfLsmrCAZoVtTNRHBo=;
        b=LCHXLWPOEi29SidzCIyPS+1POZFz0Tb+jR9vfvm+JWjG+dnmOGQKeoWruRNEKjWu/X
         aS60G6//w4QwIz2s/rymFxssrIvsKakja3fLS1+64h7o6QOFeP1TuMkW8za+O5Qe6TJi
         NEBxnTMRS6m1J5gP/tpimPuBgYkKHNPw/SyMz2QZinNzr8kb1xtCD3PXq9odt1N8Y+ZC
         gAimsZHQOVlTMwoPSJ5CNH8GySkYpeWUSoxNzeh2Rf7GCx00WamQrHznrar64OJADAVE
         +jLEll/zdKhGs5Za4a5NOAm9+CQE1TOCtwhZ0wIto1VYkT3hfFUI1G1OwmMiajoFjIdD
         UR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784099543; x=1784704343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e+PSBYPp/RJaUxjZ5jI84ayrvMfLsmrCAZoVtTNRHBo=;
        b=VU5F84pcPtOp+e9ZqsM2qDW/B16xo0SGTUf9V55A9hLo34MOjrlyhyZaqEfH3wOXL9
         JMwO1TSWlT/bNj8uZZ4jsWMJCl9i1lrcHARWGClQERyJE7/lfh/C4bpy159CfrzI0i6z
         KMyfVccqPu2qzcXryea6GwLlLhJnMz//xJwW6FKU6ZF8Aj3/2YhpIyPzaS2YKC8M+rgS
         FHiJbLthLz/ztcA/kWS9LMibzm4KNJVqlpmq//sMyw4Ge2P5clbt8cJKzNi8EUa7VrFj
         TbtnMzXAgcv5ay5264IgaLpIcaLJ3R4ubzepmab9I3Nc3Q9/lS71mYCJHs4X7O90sU3N
         4A7Q==
X-Gm-Message-State: AOJu0YwoH6y9tX2PsUC90byYXYa7rv8k/w/RtW5S/gy91lYhBSDYlyK6
	Xj0hJAuA84QP3Xb2uO/Y5vfqO/r3x+S1I1TUTZsViBSFvujpwaDgOxGzIrU9EJGamAlwvul6Tnr
	AQbfWC21UhP+noIoAvEoee0/T6tj/La5Aux4EYEbwawJsE6WBT/V0t2ILV6XVzA/W8j5TPSQgoZ
	h5
X-Gm-Gg: AfdE7cmFA1cIFuJErcJacwTCPLIk/h71xNGSZfixq1+KiLHKrf3pJK8oc72XaVT0c86
	R88RxoAF275gCc0N2IHR2080jN1F7LdjBB08rAIsj62hx+5a1tWpa6GDsjELE4T94rNkJT78aK5
	D4Ecs3yVxBB4MnropSMYimTibNsUJQ1zGNdRYwGBew3kJFUfOgMTk0hojFDMjHGEqUl9LEwow8n
	rVZjMqTQ7X7GpszPRlyPo2arZi9ncCiU9c7UEsNCx/Yonf6FK9AXWzA8rO8Qlq28I91RCv5QbYY
	SrjiwW7cp/GoIiKuVlso8GnYWpQk4g1mL4WNY6cDd216pe0KDOTmmfZg+4Q4EXSGhaXJ9FsQRPc
	RpjoIaIwO1uIaDHG1ENwQkY6wpKKC6p7T058oBZojlGrbGnhH+k+XoD+66iWKSV4R8+x3xvP6iV
	RBZtTH4nscZSa8q/XtPOkSeYLi4ibZW5lDK5cxZzAR
X-Received: by 2002:a17:90b:3c83:b0:389:42e7:991c with SMTP id 98e67ed59e1d1-38e17dc80d5mr5305212a91.17.1784099542621;
        Wed, 15 Jul 2026 00:12:22 -0700 (PDT)
X-Received: by 2002:a17:90b:3c83:b0:389:42e7:991c with SMTP id 98e67ed59e1d1-38e17dc80d5mr5305194a91.17.1784099542143;
        Wed, 15 Jul 2026 00:12:22 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31189cd8234sm80216146eec.9.2026.07.15.00.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 00:12:21 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:41:40 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: ipq5210: Enable USB and PCIe on
 RDP504
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-08-dts-v2-2-b060b68e0256@oss.qualcomm.com>
References: <20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com>
In-Reply-To: <20260715-08-dts-v2-0-b060b68e0256@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA2NyBTYWx0ZWRfX/hExmh17WzRN
 BB+E5ZsTdWLHDpNg69xVqpfucR1Sdfg24hVgUp1j4mLC0bCGOesvBerFfyEQ3LfyquzHl8MaO8i
 l/nubG9E6fQN50r79vA5bkRzGoVSrrg=
X-Proofpoint-ORIG-GUID: 7BZcdulDDxSC6xik4e4lW9BcRenN6k7k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA2NyBTYWx0ZWRfX7JVLOoYwIeLY
 MXM4TaWKKWLq16vYoorFbFXg1Ct1LuQL1XMuBEZ3vYQ6ME9UMX3XDTjS1IP57ZISbE9lToJFWzJ
 tb1QiILi8Z1aRshJZszkIGYKizlrkJVAQG/DWjTc80AXneTTB9hpriu9LX4w9itND4kETvKLTC6
 KqTsorGeCYhjwGsnkgzVRyAl5+3Ml1M6fVTTi9RD2+ZxFwjkRkng/LMHfDrZYrmPPSUmIugBHMs
 /5cj3pjYO5MNuvIz6a1tM7Yok96/lBztbiJM1exsgCgaJq58WVizvDEVYNrOUOmiZlIuGC6rXYv
 unP9W+1W1qACqFJBMMhkX255AjwBkuOcg87jGekD8U+IW99kn3L4EwTGK1PISjNjwPNw6GfbDF2
 lsEdXqpuIzv5473jjaDxcv/zDZWJvc6EAYwrN5/K7Jcte2Y/+vQy+BRAo0FTF/A5Iw3y0meNkCl
 9aQo/3QHfMSj2GGj/Fg==
X-Proofpoint-GUID: 7BZcdulDDxSC6xik4e4lW9BcRenN6k7k
X-Authority-Analysis: v=2.4 cv=VoATxe2n c=1 sm=1 tr=0 ts=6a5732d7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WPSE4gBbNDprgx3kWUIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-119168-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2146D75B529

RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
share the GPIOs. The board has to be reworked to change from EMMC
to NAND variant. Hence add the NAND node but do not enable it.

Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 131 ++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 941f866ecfe9..c47e18eabc98 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "ipq5210.dtsi"
 
 / {
@@ -18,6 +19,88 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
 	};
+
+	vreg_misc_3p3: regulator-usb-3p3 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "usb_hs_vdda_3p3";
+	};
+
+	vreg_misc_1p8: regulator-usb-1p8 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdda_1p8_usb";
+	};
+
+	vreg_misc_0p925: regulator-usb-0p925 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <925000>;
+		regulator-max-microvolt = <925000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdd_core_usb";
+	};
+};
+
+&pcie0_phy {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&qpic_bam {
+	status = "okay";
+};
+
+&qpic_nand {
+	pinctrl-0 = <&qpic_snand_default_state>;
+	pinctrl-names = "default";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-ecc-engine = <&qpic_nand>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+	};
+};
+
+&qusb_phy_0 {
+	vdd-supply = <&vreg_misc_0p925>;
+	vdda-pll-supply = <&vreg_misc_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_misc_3p3>;
+
+	status = "okay";
 };
 
 &sdhc {
@@ -35,7 +118,51 @@ &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+&ssphy_0 {
+	vdda-pll-supply = <&vreg_misc_1p8>;
+	vdda-phy-supply = <&vreg_misc_0p925>;
+
+	status = "okay";
+};
+
 &tlmm {
+	pcie1_default_state: pcie1-default-state {
+		pins = "gpio29";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	pcie0_default_state: pcie0-default-state {
+		pins = "gpio32";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	qpic_snand_default_state: qpic-snand-default-state {
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "qspi_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio4";
+			function = "qspi_cs_n";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		clock-pins {
+			pins = "gpio5";
+			function = "qspi_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio38", "gpio39";
 		function = "qup_se1";
@@ -74,6 +201,10 @@ &uart1 {
 	status = "okay";
 };
 
+&usb3 {
+	status = "okay";
+};
+
 &xo_board {
 	clock-frequency = <24000000>;
 };

-- 
2.34.1


