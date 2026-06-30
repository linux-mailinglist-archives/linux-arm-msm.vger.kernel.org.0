Return-Path: <linux-arm-msm+bounces-115479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l/TbCUDZQ2qXkAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:57:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9426E5A48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 16:57:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ndNCcwjH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WrKZVce5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115479-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115479-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8AD1030CFD45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:54:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A853B43E48B;
	Tue, 30 Jun 2026 14:53:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3178443CEFC
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:53:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782831219; cv=none; b=QOoGFN9LM6k3FY0gQ0xAFGumTCU2gRQ8NUQ9NjVqYpk32Lb3ZCPBBxeJgVC75cbw7Wg3EGQLpK0Q5Lfd5nvc3+R9GfY8cSh4JRGICRO8kgrNWbNCOveqV1fDL3Q1VV4ouofN3688v13ErJo+/mMg68JD4OUvrHn5P/WSN1qWixM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782831219; c=relaxed/simple;
	bh=C8blcHMIMkUn8SxjVlVqBB/iskindoTdj+2JO6WJc0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4W+mm7ZLiXtGTGSV7UQpMUH/FCseY76BMFwxazl93OOYXs2BFiCh58XybmlZGnYIr2cVdT/dW+gBm7dK2dW4UhEu8zyQ16DdVAWGi9VsFMhc/cVMSHg8lmIcqPD43ZtzCnRVKUm7AM+rS40eDJwhsJUOhTnLDZ040q/DRvYqMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ndNCcwjH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WrKZVce5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDEdj2185853
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kPPkjSCNo09
	SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=; b=ndNCcwjHg7Teba2kMIrd7YLPjER
	SLcRRQAhlHXRxXlm+8+/ClO00MCeGLopp26Mpn9ApnMH0jpgwU2lD/x+SWVLgBFE
	kYnaT2PBdDOC684WY9zpj5NUSu4CbcAlf5ws7T/p/Fh6sI+0CRjLHJBO2u7NuRsN
	u0ZNfDj2ximNGT9aCRN1+83dVZ1XncY47IHjCOECCT8epqO2lNQaq8/5UNQ6nZRx
	iHpsBL6123UFk3k0shETgMTFhh/a0fFoplz4jfaUq0OqxD3ipi/BGG4fMHoQb+8z
	25YwrVJxBq85F378lhdmNdnRsSU3sPE2CdODnNvkqijQmFf+YXbI8Bm0SQw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f46862tjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 14:53:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915c364ae3bso773723785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 07:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782831213; x=1783436013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kPPkjSCNo09SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=;
        b=WrKZVce5erS8+zUyI8F2VTRvVarJdBNpHG9uVXdm8K2QrRDVc9wjnWdC1dKACGXYkM
         CtKa3CWihpoHQlrlMkHDFNNNIuYCGseDTorLrPojSrSrbVMma5ki3tZw4T9ZtYtGg5Oz
         3ZK8iEerFrdQgFgc1ALa5rzpBvSmEQSiBo7HijlaFc2JaH3Au0d9rD2nLk9j7yPWYOps
         Q5fSctSlOGxiAU352J8C0UD5MQb7dBPwkSqiTCYbOpkBDujdlMqzdBKMbOXfRIKtLPIh
         sNiz1MdZagBeRJ6KF17ZtZJsS3+ZOZAwDoLIOg36hN3FWcW+zeePOnkn3sPM6lpxU/4J
         xp+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782831213; x=1783436013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kPPkjSCNo09SDo/Pz7px6sAVk8X5RZ6B8/0fd1li7qE=;
        b=IR3Y0pNRdSv0XLDP5Uoi8LsqGDXqqFZr4r5VOO0WWWnVdDt30plEWGhkQgN3PzdCMS
         HYrMDkWxrYmj0Wv/qIymKZnAzKkzt7nSGJMHzabMy4fJVQ8n9Pe+BOHgADVepvoEDfCA
         Y2hw8OfBIEhcUxWwdzPSpd2tbKqCFRL8FHAaAzi6BoHZbQe8sp/rR76KcUJWGiSSEUz3
         +dm6m+kHzmEN/PnjuaxRYS4OPh3YH9uhESVkElmNtuh657AULUrd+Oer8dRQU0KIjAFf
         MUsSP3GT5anlAV5rXxRzoiNvnV45QgZ4or3STtVZH5gXuuDe5z1ZXvpj7Gfv1dd7Onyz
         M99w==
X-Forwarded-Encrypted: i=1; AFNElJ+9iipOPzsiv892hCRfZ6bgg+oz+FvxV7GkFlk7PIbX0f+VmWVWCnMLavUWozsi7hQTDS8ZGGErwEYOD51o@vger.kernel.org
X-Gm-Message-State: AOJu0YycnlQeNOEz+OamVEe06RSOOhX5b31gaKlBm2yVde/gytZrZj+D
	MCZ6N9sT4HdYY8XHR3oInzWTlNYs4KEKyziqu7gv41DE7bv9dP7faya8TkobogAJE03W7iDnGru
	lMrVh9ZCPQLDKtrK+XQsi0Wyq0hKyBPEFlScqB+5X8Z3EbYFGGpGrjUPKkDhYLRR+mpaf
X-Gm-Gg: AfdE7cm6000Ftz1x6cCFZ1T/f2lUDaqS874kupqpJZYOGk4AyNz3Y+gvK9eMc97TycZ
	CjP94mQN/pvxUsX75pNqqOVRNxAWsj6grfbFHX1ANoUXD4xGkjuyaARHUy4Y+7VLYTAa6bdhjM4
	6DWnRzb22oL4aFOAX3cgKUh8ywFnuEdlklHi13J56Us+BYjWawP9Mq3JI+VPtSzJPNPyOYy4O7V
	Ft1Kg1X4WFxuFXBehESpGQXRDVT8q1xgp+NeG0YaMMD5niXukOe+Hpqwf+KNXT3uBLhTqxKEFPm
	6pAl6b9uz1o3NXo4rc/aHSdQvlBEvmo8XQ9r9eh2pBLtIFt6/k4129KQcKITmjgTpjfdDAzgHrK
	bTGfgtin4X2cvti5X0N7j2odJWAIoiARVj87v3ZTDjoSp8A==
X-Received: by 2002:a05:620a:489b:b0:92b:8a7c:f72a with SMTP id af79cd13be357-92e6279dfa2mr679863085a.47.1782831213398;
        Tue, 30 Jun 2026 07:53:33 -0700 (PDT)
X-Received: by 2002:a05:620a:489b:b0:92b:8a7c:f72a with SMTP id af79cd13be357-92e6279dfa2mr679857685a.47.1782831212865;
        Tue, 30 Jun 2026 07:53:32 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:5c75:21f9:a642:c358])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d15ddsm720295e9.6.2026.06.30.07.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:53:31 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Tue, 30 Jun 2026 16:53:07 +0200
Message-ID: <20260630145307.10745-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
References: <20260630145307.10745-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Bdm01Gmn0csWhifisv4El5mATIvujcNN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX5gTqkeCqehDS
 U0/i0zESQS83trZ7QV6kKgTRSxm2GpPxEz0s1kJiXqfRjuyusT53Rvok7FcbnQ5qAh7Y9Z/eHWx
 qDiHSup8AeG8oaW0He70U3wamY6VbRuFO70HKe8Cs4Kq8tMZndqK4qOLeyLsSNVNFpM8Q5Z2Ejr
 9QNQyrjbH/Yjq7AWOiFfAVPnZW3mOt7Yqvpm4fu4jeF/ePIt/SgzyI/hntwaBAtzoYCoQmNr3tu
 6oLRdBsR1I/hEsQHCYQJv5VDkYrmYt5iVzz7VI+uLBtuxFQu1W8PHtvyDNyS+IIt9mtKpsyN/im
 +WzryRHsdBAvGXOh1tYwzGmQlDTkZ6SLHJ4YSyl1TGldENsf/VElcZo7TK6OY/drM3LT7kkw4DP
 8Ce4e9okyzpvZsTdK7RMSDzsUfMX8I3DZQ9han7Yba4Sl8Mb5lJAS9VXO4GKjk6E2PZgX5uham2
 sZubKC4sWUkENc7mnJg==
X-Proofpoint-GUID: Bdm01Gmn0csWhifisv4El5mATIvujcNN
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43d86e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=8S540zSUgs8tgqG0LUMA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDE0MCBTYWx0ZWRfX+kWZpgh89K8s
 MHK38kml3KSvFMu0jY07oc/3WwaOolnxAbvYgb7AUQMRMaIMH0DtmdazOd3QtjGhTIGfyq6Xo8D
 XNpxhIA2BTOHKPezus2OA+LF/UWxzwE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300140
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
	TAGGED_FROM(0.00)[bounces-115479-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BD9426E5A48

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


