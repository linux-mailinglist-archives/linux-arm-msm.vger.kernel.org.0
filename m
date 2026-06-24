Return-Path: <linux-arm-msm+bounces-114427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KXrFJH1HPGpumAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 23:09:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F76B6C15D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 23:09:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JVursoEo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=P4LlfEho;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114427-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114427-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AC5AA3030F4C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2026 21:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526863E5EE7;
	Wed, 24 Jun 2026 21:08:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53333E5A05
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 21:08:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335333; cv=none; b=T5fLyLZZSn8twsQEnYnpT2blJ63WJc8ntWR2hZFH9qeDQTq6lG94bJXu0StED1gB1O2ZRneePxht+4Jxg6R66zK327EoGXKV4fHqYJXE/GiFYajxNLaHciPpwploTtymacUuXEa6Q4PIekBLVIDu9j4AGFrZfJZWzXNMPoLg5b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335333; c=relaxed/simple;
	bh=WLYdUaTWVpBtZwNr3HlNaZyWKT1SmuJRkQxVpfGW8Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VqfN+mC1LKiLeg30aMJbCXoHVzjxIpn3KlKA4lzVWelHgR/xJbhdVTq2i1HYJUakx+0vV3E+EXbAqqrAwXKYciLE7sBaPS3COq57hkYSd0M0AOVLB0AEfdyrIWecuvSoNKPKY98lXCTIIlBcgzX4w5r0vodEB0UmMsFf5gTz6PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JVursoEo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4LlfEho; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJjEFP3746370
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 21:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/4mZazLNplc
	RI7UA2lzg985hqmjiwniHBuU0w4DnhHw=; b=JVursoEorsmNtXPLcrRyPc320K6
	YuCsFBeCRo5KNYdCnDR/YCHW8JIj9IOQV8ABEkfyHoPYJTN/2mc5yovMBAKQ4twC
	C/t3s0MVIVaum3yytrsaxYXdxdvJLroIe5h8j8Ie5oaR7Oyv6W0tcGBmsPbxPqsS
	bh8Il40tqvDFD6WLWGxpwtc8NZO+EI+EVs3PDfDda9fQd5DsPW93P46Nuygob5ce
	gDFHazQQv8taF2VIkYfXXbYeRMeIrudFxGA7ykzSbWn8CBscWNHXfb5sy33umXLT
	uqk52F5V3CWS568yEbEwhc9R2C7Vx0cHCR2ZV1GgTW6R7WNcCcMpI0Eebhg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0d452mty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 21:08:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9158e75cbc0so187617585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jun 2026 14:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782335328; x=1782940128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4mZazLNplcRI7UA2lzg985hqmjiwniHBuU0w4DnhHw=;
        b=P4LlfEhoWqRZFS/UTJqrZnR7yd09R/6WchfUxV7PCiBHOBLNRPlXWaOohjkfYMqYcd
         gET+7h7Z+wX8NUli+w+fKFJH4pmCVGcJBX/lfZAqSX0Xn3mtKAQ/w69nNaUzQ2JDDjua
         dHs+P/xgAwnjWrIf2xL/uaDbnBTDq5Mfki46zIdgXSTZO8XbUZeusszW6Ms3+mEDC+JS
         Hyc3Qf+kOFQ6+M2gvJxOVtPLXDm4HmoJIWOqK2i7NmXV4Eo9DCZ9uxMN4AezTWcsaGnD
         oTIcYzqcODbL5i1cgBXAJN59Uin1JXSfL9lBimpVaAPg3ELn1E7ZNn44eVTknmkVXijC
         zUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335328; x=1782940128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/4mZazLNplcRI7UA2lzg985hqmjiwniHBuU0w4DnhHw=;
        b=BbXCzBlLBIqnN6FOB1P5+ZpXUc919LgUR2C38y9ETP/34VuEFb27uGZ6Z9oWmIxFUq
         sDpFN4Fv3PTD70N5ljbER4weFde6SUGU7FGhtdhYqsStZkHMpYY8sgZZKCsvsuzyJpQg
         QExhZEo43rNkL+pW3KUzcm3Erhx1Png2qy+MRxFWRTx2P3msjis2AoYm5EgzX8NG/zdq
         RuCfy/VyD+8NRt4BOcvTKhGCx8GU0Z14mWCfItP5h06W8UYP/4BrsEV/XI107kJf/4So
         dFQjzmcKdvoBU8/j4a9p+vkZOvsjjGb08v0E0B1MHxi3f4q2JUskm67GB/USeskE0yZv
         snRg==
X-Forwarded-Encrypted: i=1; AFNElJ/8D1ifjGtIrD5v2r9GTkbfEy2erTu9xTAdzp27CDYlp30t35K6dDEK0I6oxSzs/ol/CRkP3bFYlcND3fSh@vger.kernel.org
X-Gm-Message-State: AOJu0YxbnhRuqwi+nSU5LjzjFQVXydnVPC+w0seZgfSpOMtNIt7u2dir
	KGQF52XGVPYCXSFGIDtL/wFECwDJSamc6vhSwZxaY8bjVXGZszLF/hDdYCfYVwib81EWaTMsxCM
	IGm4b6mlYIXlMzBrTDwCHL0194DoSs1p3fxV83G925HVTOJt//b2UTga4qVQY4+XR91pr
X-Gm-Gg: AfdE7cmm9/lRvUk6a8u5pCmmJl4qkGlo6MPbKirmsZ7z45+SNW5lkuMQqrZmEwQTRqU
	jwGF/Y94GLWPGrIHSzrKJZg6i5n3xRYgwLUfQWtGtJUCMCXeh244z+L8r1UkEPCI50BXCoEd2A+
	LTzeuffZD/nsTQju0NRpOR5OaQagyyvE2ElYm4mm/SNOJqK5wtPr3YBKSGYPf2Ueq7mmMIlSGhB
	l6fMm88c2PvoVxhKh0F2oUScYN2+v4vS+cuB9fhx+GZFzEJhC/Bv0VQRD4LUrVdeNmSH6+apHm1
	ODyhtpge2ksGxO0q2wna6Z/hDyaTgM6wH0mA+m9KxIe/d7bn4eDm4tpLW5RyRlwOduLt1VxC1O5
	gJEeD5rCbzssnc6AAg4dmieRUHxHZrwa7mF3qj4n3Z1Q2qw==
X-Received: by 2002:a05:620a:4808:b0:915:aad5:e961 with SMTP id af79cd13be357-92644cf4c21mr1431682585a.19.1782335328460;
        Wed, 24 Jun 2026 14:08:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4808:b0:915:aad5:e961 with SMTP id af79cd13be357-92644cf4c21mr1431676085a.19.1782335327986;
        Wed, 24 Jun 2026 14:08:47 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:91ef:5c1f:e854:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840efdsm9455767f8f.5.2026.06.24.14.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:08:47 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Wed, 24 Jun 2026 23:08:25 +0200
Message-ID: <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX/QRV2WnFTMIW
 AkcB4yGCms7pI/ITGqHcXsP1Ymu7fwCbK4m4VSJ8nwZt23RckNaDdCq89sek16jpgK6qfLj9N6I
 r7yTuF58YZ2lzIRISzsPpQPWwL1Y8XGMuOVohqACzAf5m2xLiLmvWQPXArL6knk5UsemH4boM2g
 x6vQUiccSNrtReuuOOhugV/QOuPjBBp4qC1Hs3XMBJd4pAt9soVidBV7btlfLXwJuDCaIPnTlj+
 SkpUpfmbyzdSdqU3KKQ+K2Q26kZ34EETqO90CELV84Go5kzwQL3iIcYo8rHdBQwrFSwkz7EThx5
 oMYkvShFdS6WAMPgzFvO4Ak0sdlzS3iLYSKWSSla1PWHXEvrSpfM/MFGhmS03A/idXT9IYmYdow
 BMlOmqYFuswArix8eadHLlt5KzJQYp8jjJ0AP2koQQLpDE4CILkki7fyBlnuIIX1OW1EB32tFi8
 kDFZhmP62rjz7leRb2A==
X-Proofpoint-GUID: BAnMVVBKxsMa2YEEb_QlVDfO5BWH2wxq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfXyR+wG5etvVXF
 tBNy4i9PmsVZVLVwodFcjqmOdMIckn6OqpVVrhnsbQ9+hVzFdoumKBr8QOh3M6agdr6F+Sc90XG
 naTgJT2MPKHZkEL3Cn21p5+jBHJuMRM=
X-Authority-Analysis: v=2.4 cv=Ar7eGu9P c=1 sm=1 tr=0 ts=6a3c4761 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=MYPoBHUstc7QsOuohHEA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: BAnMVVBKxsMa2YEEb_QlVDfO5BWH2wxq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240177
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114427-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3F76B6C15D4

Add thermal zone descriptions for the keyboard skin temperature and
battery charging circuitry sensors exposed by the embedded controller.

Expose the EC as a thermal sensor provider and define two thermal zones
using the temperatures reported by the EC:

  - a keyboard skin temperature zone with passive and hot trip points,
  - a charging circuitry temperature zone with multiple passive trip
    points and CPU frequency mitigation levels.

The charging thermal zone progressively throttles the different CPU
clusters as the charging circuitry temperature rises and triggers a hot
condition at the highest trip point.

This provides thermal framework integration for the EC temperature
sensors and enables platform thermal management through standard thermal
zone definitions.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 68 ++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..e27533665c8d 100644
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
+		polling-delay = <5000>;
+		polling-delay-passive = <2000>;
+
+		thermal-sensors = <&ec 3>;
+
+		trips {
+			psv0: trip-point0 {
+				temperature = <55000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			alert0: trip-point1 {
+				temperature = <63000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+
+		cooling-maps {
+			map0 {
+				trip = <&psv0>;
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
+
+			};
+		};
+
+	};
+};
-- 
2.53.0


