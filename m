Return-Path: <linux-arm-msm+bounces-117012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hMgWJVb4S2pjdwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:47:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB8F714A72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:47:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=UIlPtDE2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C1nQYTdH;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117012-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117012-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E9D1F303430E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA94139A4BA;
	Mon,  6 Jul 2026 18:47:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B527F25FA05
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 18:47:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363649; cv=none; b=g9khal+b8v5hnSdodh31f1klGntYlkbfMIQxuz6ZdtrXHPv0+sps36Saq4eoC1dxwbWKhfW2LRl/sm0hKyywhoebeodEd34MCoB+6pwe9Xlea0A48Qz3BJZTEWS7pxk1RXdnuiQRnaPpcg3hDKpaKIQGISCiKLDa8RhfvaAoF5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363649; c=relaxed/simple;
	bh=DslgyWQhqoS3FgUQ0SixGQYUc2U8QPcs7eGUdXnZmfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dF9Je7+POUo3IBcZOkVFsQPknMLdfQCCeRrMxS59D2fI4T5NBjPiRomkISTe6Zv0So297RpUeQImztcbSsA1vM+DEQtx1OUFjUn9QDpxjZ5w1QqFZZWToh89O5lpA3uXC11VCF9EDTup324/LwpEdVdc3X9TgDApwFk/UwcOQq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIlPtDE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1nQYTdH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF8f1833180
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 18:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mzAnK24B5Og
	zyCTXlJoJUUix70FZiSCDjrespS3gvYI=; b=UIlPtDE2b4OtCjevzArJ+AkWgpk
	7SNhYKWX4SLQiyHvmNPxjo+NXBfaWUOiNnhWFOKGANAw6pHY6lqkjbPVOsjMkp22
	W8dRyw+DeuayeIp+L4vJ6l4+eOqJU1ArLG+CE1rgLDAcvSh8otBl8pKCndxxLhwG
	yFFK3kC5/w5xUc/5On5BGHkZRnyVxa0YIk1vzxDX8jM6UOHFEbyUW/8YmpT4Bc+j
	NZ1T7OqtGp5Hk3AmDhNULODVBOVwOMbIIwxdAGV8ynrjJFPKLxWS53pas+jT2aZA
	A8IraQvZn0QxoLKt4IYDHED5tIGWp1v7n/tvKNhBb62ac8pGDNmWqWwXM/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98jb92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 18:47:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e73fc29bfso480855085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783363638; x=1783968438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=C1nQYTdH3j+TP35XJS22tnqFg7mhBIgNdAu1G0HenjsKJ4D0O8Ztov2qIZRetAp83O
         pyT70HYtEeWH0XNDPo2SjVK4O7IsY+EzXAsMcSyxpGgq4Z5aZft2hoayxcGkL6OqRCcC
         3/SnFAVt3jOmhBG6QX96PnEmNWsgyB22y93+Q2aQ4rJqaLcW3DqBX5GTORTsoOZFIe7I
         42dPXSMeKB199WyYUDM+r6uOqG0EOqetTLnFOxBRf8s5+f7IHwEbKSoYxUSPKjgfXHTL
         f3SJfmhDJHAoopY1isqLDfxOr02yz6V2g5wDSNvrDBsgoe88dRIhl/sTLA+s8VRFB65T
         P80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783363638; x=1783968438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=Rn9SdgZ3tQg/w/GCkC6j2On3LhPbMzvBz+pPuZL7SV21Ol7TQyUlX/F0VCmn4RsrO4
         PAL0m/1F/rhmTJ3sptZPZ3o5AXCC6bigRaQ2SamhXO09rbjkGu3Ih8syGqfvToSJEqyl
         yMn96UXRXvKcZNWcWAX2s39CRV27fbRVCxjiOlqdd6uKrCqoJpStDLEL4e4P1F+h7ykA
         EJeqP/gga8hbdlyiRBXM1/i9ZK4IokYQen1dPzOJWkvxjDnme/inSsuVnJjRy7gtDDOY
         pUbUAoaj2oq6kgpyrvVTd5onYmb4CxVbfTIH1hZE2RjJ8HnMCKhqNGovmCgHtSfy0QAc
         qW2w==
X-Forwarded-Encrypted: i=1; AHgh+RqUNNCS7uNl0wUwzg+bDi8GWcAagpoPMDIJdMqiSIDlwHseUAxNr82YcaBIwxwCalsyvJTTp7VeZhaFXGML@vger.kernel.org
X-Gm-Message-State: AOJu0Yy88ACYDmuibm50tTWxzcac20BNnendztapPHUsTvYr8i9DYgKH
	c8JWRwS1z4qADor1JGSL1ANN3tkmsy3kTBCBd/4a2vAoyM/tT3+5NHjRrYYhmwx8FwI0/4ZOgRZ
	derggucyCDmTsOwkBcEfvMWnv/msTaKjivThtuz0l84HrARPPgrwSlu7MzSEkmsROoOAw
X-Gm-Gg: AfdE7cnxvJDvwLChivXWawrsLqxp85zj36IOofuHD5BCmIKEVYdgIg/RpskR5Mqd569
	p1ixnmnL7kKj/cUQw6JOJ7ynrXbPD9QLMZ7xyHPsS5yiScNWOBYto2JBAmXZEP3healkuplnq/f
	Eff0Ei5r4fdL1Cj/Yefr8OO3NeH9nvMtK9gerBzmHFtTMXAM3jiThCySdyBMm1x8yRBGvPWI9A2
	mpcc6q+LtJ5mcZwBSpk2CTeNJwKEtMYsf/IgTs8OjhWVyg/PG3MrM73yLqZywOxcKD/1FWDMxbs
	3pfeLM/E0vfgI/Z1EAbfRv9k8C/xECJOgr0/9afRILXDu0Shi2reO2C+pBrLk/VoIQmfyQOtKn4
	lKHnXm2kXjkdmetMtfiN0mIZrT1ogBTiRHGOKzfMRytBtfA==
X-Received: by 2002:a05:620a:31a3:b0:923:8612:f15 with SMTP id af79cd13be357-92ebb4e39damr248195285a.18.1783363637901;
        Mon, 06 Jul 2026 11:47:17 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:923:8612:f15 with SMTP id af79cd13be357-92ebb4e39damr248191485a.18.1783363637451;
        Mon, 06 Jul 2026 11:47:17 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b077:843a:5587:be05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d56sm3858625e9.8.2026.07.06.11.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:47:15 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v5 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Mon,  6 Jul 2026 20:46:48 +0200
Message-ID: <20260706184648.35613-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4bf836 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=8S540zSUgs8tgqG0LUMA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX4dlLhuz5vo5T
 IuQAq0m4EujLiUdEo5Hp8fQ/y6aXYyxxsKRtuXO4PraCsaHBtNGDpmXb72pTS9AM5bupJpQkDFT
 jbhJx3/hqcRHpD4wjp+kKZZGuVswfjjV8PImkqqrfPZmCcg3Mr+FMQ1fQ/CatElmrqGtb2rkU1T
 tYip2x/9ogM0HNaibPMTpdYL4qwmyduPAJ1pXe+5LTEDpzUXhB0ZjkUqIy7wK9nXtfNJomHJKY5
 uFKkEfxhT6qBoI5p/C8hWkwto1BaW0zK5mrg0/C1ecup1zSSHiq31Y6WXWocgqEnXNvJKHdhusv
 Q5zkeZ+eORIipxK0uQSYO2QvMrXtNuS/YgLmTp9fWwBfH8fYCmasCzu3xcZwWmguXhwO29kpcGg
 ASPnllWeLPGhv+uf+4Js3eo17edHht7vg3YGHeIRdiMwpa/usfbk8YLl8/9j9kEDoIe5l9vMi0U
 P68p5ST5Isk6UjBrmMg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfXzdVndv1kfD4f
 emshK6q96uhqxoOUh93m0MZa6NJD80cyN56JfIF3Pigieca4+tZvETU5uVN1BzstlX+c2rbHSTP
 9f3rL2Z3zL9jmka93BqaS+Uk+8GJRqA=
X-Proofpoint-GUID: 215XHNHznQfvLAOZfKjm1DRr7b2uNfnf
X-Proofpoint-ORIG-GUID: 215XHNHznQfvLAOZfKjm1DRr7b2uNfnf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060189
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117012-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:neil.armstrong@linaro.org,m:gaurav.kohli@oss.qualcomm.com,m:manaf.pallikunhi@oss.qualcomm.com,m:priyansh.jain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4BB8F714A72

The Lenovo ThinkPad T14s embedded controller exposes several platform
temperature sensors that are already used by the firmware for thermal
management.

Expose the EC as a thermal sensor provider and describe the keyboard
skin and charging circuitry sensors as thermal zones in the device
tree.

The keyboard thermal zone defines passive and hot trip points, while
the charging thermal zone also associates a cooling map with the CPU
clusters, allowing the generic thermal framework to apply CPU
throttling when the charging circuitry temperature exceeds the passive
threshold.

This integrates the EC temperature sensors with the Linux thermal
framework and enables platform thermal management using standard
thermal zone definitions.

The EC protocol currently does not provide a mechanism to program trip
points from Linux. Consequently, the thermal zones rely on periodic
polling to detect threshold crossings.

Using the charging circuitry temperature for thermal mitigation provides
a conservative approximation of the platform thermal state and prevents
the platform from reaching critical temperatures under sustained heavy
CPU load.

Without this change the platform reaches a critical thermal condition
and resets under heavy load.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 67 ++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..ed5ba3a428a8 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -979,7 +979,7 @@ &i2c6 {
 
 	status = "okay";
 
-	embedded-controller@28 {
+	ec: embedded-controller@28 {
 		compatible = "lenovo,thinkpad-t14s-ec";
 		reg = <0x28>;
 
@@ -988,6 +988,8 @@ embedded-controller@28 {
 		pinctrl-0 = <&ec_int_n_default>;
 		pinctrl-names = "default";
 
+		#thermal-sensor-cells = <1>;
+
 		wakeup-source;
 	};
 };
@@ -1729,3 +1731,66 @@ &usb_mp_qmpphy1 {
 
 	status = "okay";
 };
+
+&thermal_zones {
+	ec-keyboard-thermal {
+		polling-delay = <5000>;
+		polling-delay-passive = <1000>;
+
+		thermal-sensors = <&ec 1>;
+
+		trips {
+			trip-point0 {
+				temperature = <55000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			trip-point1 {
+				temperature = <62000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+	};
+
+	ec-charging-thermal {
+		/* EC trip points cannot yet be programmed. */
+		polling-delay = <5000>;
+		polling-delay-passive = <2000>;
+
+		thermal-sensors = <&ec 3>;
+
+		trips {
+			ec_charging_psv0: trip-point0 {
+				temperature = <55000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			ec_charging_alrt0: trip-point1 {
+				temperature = <63000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+
+		cooling-maps {
+			map0 {
+				trip = <&ec_charging_psv0>;
+				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+			};
+		};
+	};
+};
-- 
2.53.0


