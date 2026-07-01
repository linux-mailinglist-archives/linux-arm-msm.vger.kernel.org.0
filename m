Return-Path: <linux-arm-msm+bounces-115646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8Rr4GYnuRGrS3QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:40:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B37BE6EC461
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 12:40:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Tb8Dtrb6;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eZhLaOnu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115646-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115646-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44E9E30DDB34
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 10:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EDA3425CF7;
	Wed,  1 Jul 2026 10:37:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F119D3F23B5
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 10:37:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782902246; cv=none; b=ZRltLFnANyx6enVKR+YUmvo2KphqIdaywk5O1nqdbTfJwH4imFq7Z73scvPdYkzILIUJAanMQ7lSZ4O2KRiB+3/l4rbl3PY5Bl+B6jde/PtmgxIvmCGwbNdRsfIjyS5gHgpqDmtiVDr46czWEpuAGsTQPZMD72wU8l6l7/HR1rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782902246; c=relaxed/simple;
	bh=C8blcHMIMkUn8SxjVlVqBB/iskindoTdj+2JO6WJc0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aGjsegCeeCOBTb3v2eexWO9s9vDdNczLkns2wUog/Ad1jFnCA/bAqHGWfuz84UQuatsAplyZwR/ZlH0eQwJi0zV/pQTq2SA849v7s1lllzp8Lcp5z4E5+lRHkMHpRIi4JO2Fw8EhuadaikSuen3+4eg9IzitrBXHew5CPoib/nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tb8Dtrb6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZhLaOnu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8aDt721241
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 10:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kPPkjSCNo09
	SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=; b=Tb8Dtrb6mHmHsu/O4P7ZHbfvIfv
	3H6oPUX9iYO1v+C0s4Qilq1y0kw9OWhssBP1mCJak52VPfUv/2WPmkrhOn8wFdjF
	TclKgtcw2qIsGGHPQYox7ip5gBik9tV1Ewyr/7Yo3Mdb4G9uRdiNLKcK6zfbty82
	fQV3bABk94a3Nc4STZPBuGdA2rlCOBYrkdXQ73MpYEtu3Oq7UbzBLqz66aahoRg0
	4SJOzmECF6wr2JcD53JClb1x55yw8ibYSyynFNMhTu19ZVFqzao+MQ6PYXZhj+jq
	tOw/LqEDBULu2250ICK1X7TLr+/JKZRfXn40Itx4LjJ2mL6QbnE/Nh6t1+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4jvwbjsu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 10:37:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915c364ae3bso58369385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782902241; x=1783507041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPPkjSCNo09SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=;
        b=eZhLaOnuiXAUZY/x51WXGglACkjKJdbbjqri6Z70RhHi45zUcwaZgNH64Z4bY5cOol
         +y/VRmCfViRRlk/VyicEqjEO2bs0bqVdMsBP4EXJSikA6fwz13g5dq8bNBGClAJFHWch
         HokZD9EQskrJr5Q5aD6kGJQBs9o3aRll65pepvGNgWb4EcYS2/ZrEoaljQrjWcI08Ou/
         NNi0V4bdmUcarkrqGt9nyhP/Q+znDjwwSHq49UNlQ43hOysmoPqZuhFpRGs7mtMul/pz
         58QGx/3S1qXNAEBXiPQ3Ai8ojgoTlzQ1WmqHYDiQPWVr2AF8M7I4E6cUUh2cK50CSDcm
         GGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782902241; x=1783507041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kPPkjSCNo09SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=;
        b=JbjQMt/DE0gf5ZPUdK8iV0n7v2M2/ojVaXDSQlKoGLlYPuEzCn+VOPqikVeb73rgDG
         yR1bBLQ7Eag3wkp7uIR9bWZAmPXmGCh4fJE/MZUboiTgT81EldS4U6pN1EauWmXzMU1W
         aPbIV9xeNnzAq7Nxp/3qy8cFQFXL0Zp7H0RfOGYH6T7/VYsKKQOPieyObN31Un3duJ7x
         d8xP3EQ8924fL6aDtBOin0u62Z/TjHjNEz4zB1rs4RYxJuCIDJXjYsrt9ZgFRrW7HBrb
         rkwQsf63yrwr1X0ZHCfm4HHT6t/zHzDDVwKfgDccRieiEjzlceFIzm51MbMnD5P1xQZO
         JcWg==
X-Forwarded-Encrypted: i=1; AFNElJ8S9Hy4CXiz4K11+tNCk/vLXW/DjVoXFFH3frUZi8waFTPbqmeyYnPHttC7rksHxvZJWNVQL1v7KabpZVuD@vger.kernel.org
X-Gm-Message-State: AOJu0YwedokQ/SZwh8fhEPyIWhhqC1vo24K+6AiLwsxo1+HJyt32+UGa
	6P38hxwroFXqzQZxFOKh+FRab2TqePcz54lYCPeKsdOOYL5DOrJDFnYwMInKsW/V8Dk+trAbSuR
	0UmRlXqUUa8Ir7q9JAin3/1PXuRoTFmLDBL4P6MByQT9OvFBsYAZDhnyLWxOMagjxIHlL
X-Gm-Gg: AfdE7ckcE57iBkPc3oVe2j7GeMXl2WDUK4mOMc546bte3qvkzqx8df2Kd8+8kxkXksx
	qh2j2Pl83V903WAO10vpn2Srn3GozCs23gi82Gpp6u7Qk3LPZI0xuqKU2mPaNl+tXNheSKUuaXs
	G/3J4BRiby8cSFNIRHQJZ2Ai4RZWLl9+/Pt+/ev+Nze/SvoYjGDs8CQdqsBKSG+Ww1b54OULjCs
	eFvVlAAPT4rZ1vcs2nb/rv8K3cQmOnWVkyf99Xo8hkOf0Ul+0+rDmUq2VrmCHU9ixv3D4LWgNAY
	2dpXB+ZlBUgwUkf5QRy5mw0Nn5+j2B8SbvBAMUTlThoF7A4w9wBzghdMuQiZ/uVP0W0lZpiGXQ3
	OIr1X8RTumtrwxkRhzJx9SUUOgLDANQjoJZNh5reglH8=
X-Received: by 2002:a05:620a:448b:b0:92e:74a5:c70a with SMTP id af79cd13be357-92e7827188emr126748685a.33.1782902241410;
        Wed, 01 Jul 2026 03:37:21 -0700 (PDT)
X-Received: by 2002:a05:620a:448b:b0:92e:74a5:c70a with SMTP id af79cd13be357-92e7827188emr126743585a.33.1782902240831;
        Wed, 01 Jul 2026 03:37:20 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:cab:bdb4:a76b:614])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d2bc5sm69130655e9.5.2026.07.01.03.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 03:37:19 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Wed,  1 Jul 2026 12:37:11 +0200
Message-ID: <20260701103714.22583-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
References: <20260701103714.22583-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: t5YzEg671bRgShsmNZHuS4Su7GqRRweI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX5lx+dmkL7ml7
 HhB4pFR9o89DMzTHjZ5KrfO1aCJO9jLZFk5SIx9U3nqUxDM0YtSxJlYccbfD2ct+xM/RaF41KWw
 Z7InnGxVZFA4gw5/itMTgX6ioq7aobo=
X-Authority-Analysis: v=2.4 cv=JKgLdcKb c=1 sm=1 tr=0 ts=6a44ede2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=8S540zSUgs8tgqG0LUMA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: t5YzEg671bRgShsmNZHuS4Su7GqRRweI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDExMCBTYWx0ZWRfX5x8uBpl1PqOD
 uYyKbYS4H02GGEx83e8D6vvL//OdDjiQRCaNItiExZToWPU0BBpf0316Big+kEHGnuWS2IuOCPf
 Cptf+24gfEmRGIm9lhO8eMAL3/WtMWpd5a2IVJfVUwhRY3phvpVy5JqlNV47FC+W1eovpYXMmNf
 cvmsKtObAhESXH6JXKa55Z2EoiGdyHCQAeN9LbhzJX2F26uO3/szJktByxMqIe27Z5DuSGRz67u
 fVqQr0o0Oske4e6vQ9h8+9Y4CLDpcGx7kCpijWRtI/zX4+jIBEHBXY0aruhZ00AbTEmSmo0paJh
 D/Udrgfyk0Tg8OG0jHG2H2InIoUYpu7l8aqzSVt0U0k31gs6aWlWbo7TP0bHyKwq+KzzZGrStiy
 jhW3LmYjS54NGoBbPYol0IKCEgRfliuFHDg3TU6vUfqsUnKRLrrUXWLqKVDXqtQA3C5ynBIfRIX
 2UJGbC/AJ4Pr8msTpig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607010110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115646-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sre@kernel.org,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:linux@roeck-us.net,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:bryan.odonoghue@linaro.org,m:platform-driver-x86@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-hwmon@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B37BE6EC461

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

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 68 ++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..a19a363da9ed 100644
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
@@ -1729,3 +1731,67 @@ &usb_mp_qmpphy1 {
 
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
+
+	};
+};
-- 
2.53.0


