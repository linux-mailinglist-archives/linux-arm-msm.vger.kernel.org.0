Return-Path: <linux-arm-msm+bounces-116953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5JkRN9PcS2p+bgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:50:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D560271382B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 18:50:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=luuWWHrD;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ml7Gv8+C;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116953-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116953-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 905A130D04CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 16:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C004314AE;
	Mon,  6 Jul 2026 16:08:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F2B430CC6
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 16:08:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354124; cv=none; b=tCk2zwNwI5TLM4uDmyV5S+dzxSR5ExdtWdJaEfPWRxcTp6PQOAwhWW85qUBrqG9AssyFRmBfY+MtgYepEonjI0ffZFw/R5yZnaEkpglmzoHOe4QkI6AdfRnvFJG9ls0zoKnC548SYPOnPCwgYmoB+eb4vekxZmBMGW/ZHCg8AnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354124; c=relaxed/simple;
	bh=DslgyWQhqoS3FgUQ0SixGQYUc2U8QPcs7eGUdXnZmfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EBnZOOT0uJnNrCYncZYO4yXmHG52kZKmbHOzgwViiABiDEVaPhIcrSWBiLioCYASIT5QCM0YlRGRiY5G0SkMP800Ve/sbnHtxmbDhHzDImWwi0JuWjqS+dRuY+nK0x/cVIXbPB0hje2HedTGd89M/6w6UC3f5dtmnUs+OGF2sRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=luuWWHrD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ml7Gv8+C; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFKLi901129
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 16:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mzAnK24B5Og
	zyCTXlJoJUUix70FZiSCDjrespS3gvYI=; b=luuWWHrDauXffYrXZz+3PTl5Oo5
	b7BJjiZC0nvv9fiRSF1FWrI0sQAQMxpaVwjcFNDhAKnEgPTDwB/x+IHoNioOLxao
	m4zN/K/QSoEhVrVLheLEfCXx8epxa7zOngYk67ZNIn6b4KRJDRFrXyjH6icqVfli
	z8/msNB6vD3qotRRIkX3GOa6NTa15IqUlC9jOo99cOrE+aka1E9J1sPGImQWpVFm
	+j2lBB6kXozaFD5Iz2V23mBfiqzkhj2XXiPd7t94L3UbIrpmHuLmxFe2C7Erwrk1
	/iRRavwKzSor+H9REBO4dST4JQ6c+6EiUz8ZIpuzmghDUiK35Lku55+6swg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7jbp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 16:08:42 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9692bdab0c2so5650217241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783354121; x=1783958921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=Ml7Gv8+CpZb5sFBXAp/sa9VVQmRaovchYJKBImtGZNga39DVqNxwiGAXkvpeZB0aPh
         OD40DixdEOcGGKmhvdpJfXDFfVemPwbNgbj2/PUcQMSigmOsvAcdWSl1lqH040161x0q
         JJn1dyNuToXUbHzZNzgFmnmyFb4u+oRyygODydYjm+5ZLQCXK/uPN+ihrR7ZVD0UOSRH
         ah4wGYN81ttk4dmnsN9jZUxNMw8g61RkDMS5fhG4IgUbsxs9BggMbLot0HA1yywoje3J
         TKBmhPtEAEf9V09D3NlNex3qDV8k+l9ipkBpLaKsTpnMjdLXua84+LAyHmsVylTkH36n
         ISCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354121; x=1783958921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=g9sCvC1lgT9V9FB3uTbBalx5sKOe2xfWL6mRUIc/Jyiupe+RsBTs9YW+BTQcc3IV2/
         qTP7ci3gZzbmi5KoyEVEHDH/b2bbl88eZfyzlU4Oe28PU5mqWvsmUNteidDTtE4+b0ZC
         AS+QBKzuA+JD5wktLHfWeGDCayLxvrFZRR1QaLZ1wo0WaIXw9sEHyt9e54I1cGxZ64Ya
         xEIZFbfTovpeCkFg57FkK264yshidyPs6cfn0kq/JPEDYQuU9xoB1jt4j2QRejzIh0dD
         yQqccdo1m+5r50BcZpIZRUVbtlTw1CdoxxuHu6xisBqWUOy7hN/Fj6QXtPMIitqGjvGF
         R1YA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4gk9H/JNYD+foWMmN56UKNq34IWsCqRZJW3uWw9gifTYMun5P1uxTPAc0WGhUQiSXp1+tJqASwNt2CRaY@vger.kernel.org
X-Gm-Message-State: AOJu0YxHpZ8oE1oG+6lZi4TCjDH35tABSEFGWDKLtLmbTkKqUoRbvof+
	Btjw0hBy1S/X+VFP+wX9mfBMnfIreQCmrpbxEaMd6B4YaGvwJHzootYGPC9iX7TT/jvkJFlbnsG
	dDTbl5Sv/iw3yynn2HYaIIHtjiuWJVg9o+A9Fdv4R2Vm7QQW7Z35kZIZAN3iEeaSnZZNs
X-Gm-Gg: AfdE7cmfTKBL1Zt0uu2dvmyAn9gAK8xlO/Tamwwhn99XhuNe2Wg2xIjiX1WgytgNdk2
	nS8zGdWPBzv22GYNJnkA3Jtr4H1br/GIyD0P1wR6AJvsBl4MkyfuNra9JmTkKplon6QmPPb81yT
	bcMtNsI31EDCh8DsSP1B+GwSKALTV7Xiy8o4ZcbQ2jgfrDwcp5Xwo22cGOH9+HlPvjTGiPGVjye
	hXs7ApHjfkcBdOmCjfw4fgvw/4l3/vsxIv1IsKgoyI6t0LENenQTdcihGK+DcyTupmJpDJHB231
	HjmdTGqafGfI9MBUYy1SdFi/AymSnwFAhsIyh6IpwEkAR75dAqK/pNq275bx0kHYgioXPIbGRyi
	QuwAuJOUBBS/tkM4boHc1EuW6H3eIN31kEtQ/sxNmKKhrYw==
X-Received: by 2002:a05:6122:d15:b0:5bd:8dd8:146e with SMTP id 71dfb90a1353d-5be908f8d78mr583404e0c.4.1783354121434;
        Mon, 06 Jul 2026 09:08:41 -0700 (PDT)
X-Received: by 2002:a05:6122:d15:b0:5bd:8dd8:146e with SMTP id 71dfb90a1353d-5be908f8d78mr583381e0c.4.1783354120941;
        Mon, 06 Jul 2026 09:08:40 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8405:4a9c:95fc:4b8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e3e2702sm26071966f8f.9.2026.07.06.09.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:08:40 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v4 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Mon,  6 Jul 2026 18:08:29 +0200
Message-ID: <20260706160830.17698-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
References: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX2SeZ+SpT69k7
 QguoiDdGCdYfdUO52/cXwUMxbh46joBh2K+cmz7QZE0TV5L2JsVIdYa4E1r36qr11mlHNjD7bYi
 wjP3wj/jZn6PuIOkYlpyPODUR0qbZBuM+TMZSA8PS00S9GjII1eJb3HXDAWT5b1znMpCqyTauyL
 4w5xHtVpbpQjIZCP/nk9qIyBCWIrvpMG79peQK/+qTH5T3u4rN0T4Gsd+Pl2cqYrXxx8I83tWYt
 VvB5gM5M00qs1NUD5kZ3rnGECzgodFZh9akc5MAQhmEdEgsL4F7lGpmGA7Ig/+/ag19OD6ObsTR
 +RBj2parfLICnWEPryAGhnDzFFgcHevBIjMGk93AYgSFM9/IFIJru4Dtqtr6/bvi1reO57R0mQe
 OGQ49spasRfzZqnnWeJH5ZlX2lTeY3TY0B/CPLrpF+0dVH389i46vQUtjTA4MNt2dxQYqDSlzg3
 0gLWDBbb7+Ki0EGrwgw==
X-Proofpoint-ORIG-GUID: Prp0anfHsP06lMrm0HBcU2EBEJIqwbw6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX7JWkjyNBt/fn
 89g0zIvsEXv6uqzvydkK1CDQmD9YSlraQpIYWiuEEejWn0hz3yr+v6rtY9VnL4EHNBqde4L1ryX
 B4G16wZRdosHSlc8boZ7VW6bXcoPgCA=
X-Proofpoint-GUID: Prp0anfHsP06lMrm0HBcU2EBEJIqwbw6
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bd30a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=8S540zSUgs8tgqG0LUMA:9 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060164
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116953-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,linaro.org:email];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D560271382B

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


