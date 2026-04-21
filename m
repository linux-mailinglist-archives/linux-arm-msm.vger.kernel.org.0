Return-Path: <linux-arm-msm+bounces-103917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yI8tKhxS52mn6gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:31:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 236F3439915
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 12:31:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BE744301A504
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC52C2BD59C;
	Tue, 21 Apr 2026 10:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFa0jQ9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hVXxV9Ob"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252A12D7D3A
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776766802; cv=none; b=ARhmYZEZpjiWb2aDN9867nWxv3zR4g4QWCl7QkapOaG5cEMsYO6CNoKq3d3Ok3GD0B1PgykFjc1kLRd5j3SccOxq0+V5L4Hqp/FbWOgkHTGX7UUpA7Z6s4rov7kvWw6tp2U3uwnczPZPCowxosg3gXPC6dydsjUWMPxREnPEN3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776766802; c=relaxed/simple;
	bh=f2d31fKICaRc7eSILNMa+qfIwIjktWJHAPS1tLqZR54=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s1SAjGsVmtFLHBNcKtndls4dYesr0QSbwhldqT2lCgyBLP5JTPDt9B49dVl8L3qsgal6ohCx7vjtPhl6j5pG8z03jOj+n5OZwOykXfnA5om4n8aIdPMfY5kgp7tGkPm7epqFy4BjqwWvJ1IkNjxNHoF6XcpjZ8sIfUSavcnKX9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFa0jQ9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hVXxV9Ob; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L6qBXN1127490
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lpMC6OOA7fewd0kPfM6zC/yqwiUooS/N1/w
	2gqDkMuo=; b=BFa0jQ9WqnZ0nazUStHoFzKC8WJbdv++49r253XK2s9+Xm1AA+S
	t0WllF6stiY+JW2l3/VPmk+Vb6WdcXajwWX3BJkrxLM/mUYE8lOrh6dvB6kxCK4q
	kqbqiS6/h96IlZMOU41To+1mft/yX2EdDkEFvd/eLH+9Ouv9YLq62ILQtSBg6tWu
	VVG10LfgYqgYB467GXY+RDdMYeSIFZ8VT5b16kjhQSM5vZhuvqDqpijBKdGnGjpo
	R60EU/xryks1ISTPkf/al4zxRaHqVpah2FxcR6n6sIEs/1X0/KaxCVTW0MiI1Cdh
	G/Bu946XP3ZTJF+hQUS141ZWf71OEURILxg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnw68t5tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 10:19:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb007bc36so28700871cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Apr 2026 03:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776766798; x=1777371598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lpMC6OOA7fewd0kPfM6zC/yqwiUooS/N1/w2gqDkMuo=;
        b=hVXxV9ObAmAUJkNEn+PxU3rdnutA/F7T/P/iE+1bQNQoQGPgpbncKIqeZGW8R8A+Za
         tFvn34uNQYCZGT6TlRVkRwSw2WhtbH945rKoN0OZWD3Du0TfgBsGOJm5ADZENV9tmjpC
         TcMypWOr85AroU8Xbi8j9bmIPuEKTI/0h1MzMAgCluBiHL2Qg63XtjGPB6+rY1MswyL9
         xw3JLiMmuSfjfxhyVuknjG256xBu3vxmCcGXZa9rnJdEbKH/3q64vH+Hc/vw5GF/9p1a
         sC/r0Vq6afsJtef8cKHfY3vfxaqOe5rizPwAFJJYn71Whbi+OpFpl+2XwLyw/mgU66UZ
         6SPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776766798; x=1777371598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lpMC6OOA7fewd0kPfM6zC/yqwiUooS/N1/w2gqDkMuo=;
        b=R+TBUGJVODT8JqR/tNMkW7LwHZpz7AiYlrxCh71ShwCf9N7n46qoEcUVuyVFu4NVEo
         Ty0TsBBEHTq1D5/q2YMZdCmg/xvLEzsWz8zijLfCDwsibLh6p0Dnlarb1zlC9zAoGnzp
         gkfCUL+VJEJcxMwsVKRRCs3aXxJMmL/7lVBdfF16qbLl3R1xjA7/wiyjjaxkSgvIwrT3
         qxKuF7++QSpNHUY+cGFvVoD2tpwfBDZkREFvWcPGgm23KA93I+p/yMIHIyVLljP+kcn7
         SNnr9zzjK80rs5j1g1bxgwUgNZXgcreNoRjoV0dMIaxYfZGzAhfEr10Etuqe/dhIF3wk
         q+zQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Td9RJLAFqdpWvdym2BchP5AcOOhHz/HHVuWj8D3Gr8ZrWKf/YDouR0P1qU6kXMY74GJWwfR6d1U1g/o1N@vger.kernel.org
X-Gm-Message-State: AOJu0YzrI5Oax/w7/OVRMx+pLpBnqN4xF4qq1B85JRQLV9Bj5E8te4ba
	nVzwYVbipiXMn1pQP4uhmKOUb47ernHm1+2vbOhiwknOh1CchcwTnaWlJLGnCAk6v+I7pd8qzyX
	p9WPOglaqB0vXRYfUH/jxTjKwW0Y1klHmlmf/qObNpQjz+JhTLWvvblcjjBIoIzzTt3u1
X-Gm-Gg: AeBDietpiVZAi7jnpgAZbckpdH9QRQp0Wan51UMuiDGObwH+w+mhoDQPeZBX20W38ms
	OOVgCu6lHQG8i0UNfjZB2Gu9Oz4i6Nbt+0NPUMPdbsma4sOb5QqWNFeB+9fRVTX/i6M2Odn4z+S
	TQH2PrIwkdMADi5oPeYtMaEQsZBq9mkXKSeTFr/GlQntQ40aXHXNJX1i0F0T0lVHtjkPJO7ZAWZ
	fSSYwzcPw8q7xXBLUOfIj6gnEIjkBgeDhCK/B/UQHerbY5GY2uT++JMJhY+3qw5DTo5UjtI3Fkj
	LK/Br6eVi3mfhANDIHOxBPPa3LLfTsUPdZz9maGGSKcPOOJUkbIOrkyltaw5A6dsIr0CQCUUdtk
	jHOZzoowEKlVcjARTXsi/Tn4v+2EyJS7jtlsGBffP5bSn+J8skqhM1BQoE6kQlR3OQD/NrrG6kT
	i9nkyT6tDMEboJwljQMbM=
X-Received: by 2002:a05:622a:98e:b0:50d:7fe9:aa8a with SMTP id d75a77b69052e-50e36e9c3c8mr268988931cf.31.1776766798401;
        Tue, 21 Apr 2026 03:19:58 -0700 (PDT)
X-Received: by 2002:a05:622a:98e:b0:50d:7fe9:aa8a with SMTP id d75a77b69052e-50e36e9c3c8mr268988611cf.31.1776766797990;
        Tue, 21 Apr 2026 03:19:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:34a4:17b9:744:69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba4512115d6sm440017166b.7.2026.04.21.03.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:19:57 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add fan controller and thermal cooling
Date: Tue, 21 Apr 2026 12:19:54 +0200
Message-Id: <20260421101954.411698-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: m07U3oh2tEDD516fBeezjLeOtC_H19vT
X-Authority-Analysis: v=2.4 cv=apyCzyZV c=1 sm=1 tr=0 ts=69e74f4f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=CL9vroWOvsCo93LnfqYA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwMSBTYWx0ZWRfX7yvPymyPD1uG
 QO+O8A/7IQWlJVY55nAe8Ex+YZKgy/ug8vjgS5xFU7pzB584bEVDVuSkKnkl8BTSFkEFCCraShp
 iK0Z2F15l5hQfVNLw28R4GHdBAGC+wKtX0VGdCt6eIJnfjfiKrrM2GQFqP8dzl4DgmwIxnuMepC
 m6sjZrZ/1twEbO7PlcsKY40IjqLS/DRg7KikAmmFswwa8GcBxGnznuBd+C6fwtAM29TvFrnWYdE
 70XyXhv7awLz+1a8jN53N9zylyZ46HP9XWOqMqxTFa966UvjTqSxZZgvXX5rCRctngtx+VnIwhc
 MmcLFhUVEVTqbO8fbAV7C4egCgkCnn3pCHvMSQthE3aqJv3Y/9Ioph3QBZQDNOXI1U7nrzljGod
 hrxhnb/9vJ3cw9UZ4qOfHM6vhymFsXaYW/c+XKsZV/C4ikZD9WnJQWi65x+kgK/ZYiOlU5C5/X6
 Jn8I/HG2HyxnLas183Q==
X-Proofpoint-GUID: m07U3oh2tEDD516fBeezjLeOtC_H19vT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210101
X-Spamd-Result: default: False [4.84 / 15.00];
	SEM_URIBL(3.50)[0.0.0.0:email];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-103917-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	R_DKIM_ALLOW(0.00)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_SPAM(0.00)[0.397];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,2f:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 236F3439915
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable the CCI1 bus and add support for the Microchip EMC2305 fan
controller on the Monaco Arduino Monza board. The controller is
virtually implemented by the onboard MCU.

Add a new active trip point to the cpuss0 thermal zone and
associate it with onboard fan cooling. The CPU subsystem sensor is
used as the thermal reference until support for a more appropriate
onboard/skin sensor becomes available (via spmi-adc5-gen3).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-arduino-monza.dts    | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index ca14f0ea4dae..2d790f726d56 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/pwm/pwm.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #include "monaco.dtsi"
@@ -155,6 +156,26 @@ vreg_nvme: regulator-3p3-m2 {
 	};
 };
 
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	fan_controller: fan-controller@2f {
+		compatible = "microchip,emc2305";
+		reg = <0x2f>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		#pwm-cells = <3>;
+
+		fan: fan@0 {
+			reg = <0x0>;
+			pwms = <&fan_controller 26000 PWM_POLARITY_INVERTED 1>;
+			#cooling-cells = <2>;
+		};
+	};
+};
+
 &ethernet0 {
 	phy-mode = "2500base-x";
 	phy-handle = <&hsgmii_phy0>;
@@ -368,6 +389,25 @@ &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
 };
 
+&thermal_zones {
+	cpuss-0-0-thermal {
+		trips {
+			cpuss0_active: cpuss-active {
+				temperature = <32000>;
+				hysteresis = <2000>;
+				type = "active";
+			};
+		};
+
+		cooling-maps {
+			map-active {
+				trip = <&cpuss0_active>;
+				cooling-device = <&fan 0 THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
+
 &tlmm {
 	pcie0_default_state: pcie0-default-state {
 		wake-pins {
-- 
2.34.1


