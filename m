Return-Path: <linux-arm-msm+bounces-114724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9l7fIeKfP2q1VAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 12:03:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C8B6D1B61
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 12:03:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KIk2bPFV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WULIgRY0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114724-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114724-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A5993048F28
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Jun 2026 10:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6048939E9DE;
	Sat, 27 Jun 2026 10:02:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1413339E6FD
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554532; cv=none; b=iEQ37QbAS6uzxuyMYZGsCDsVqoehaQQOxDqLEualMFTvOirL/X/S3FppKbBngomTuKI65JO42i0ZqupgzVegwUBfRRrxYpBMTjuSOyd3PvjfVxquLS+4+zjfS7MJJPZWoUQdd0Wqr3nflgdfSKH5OgHnzrX+L9hvi+SErDIQ98Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554532; c=relaxed/simple;
	bh=Xs7/bXTsqIFp9AFWFL1TG6MMp0Qbod3zdENvP42or/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ek19rcMWXREWoHMocSoVtjJQqKDUoiCFMIv55vR7TH8tAR0bc2RO8wy8f76UxQMFC7bI1HEI/EhLU4t63ffLZvMLYxVcdgAjzmcORbK+p46SmiE80Q7+1YQ6wOCAa0rwxV7HmGMCqRzxjbva0MVIMUi4OwgLSdNugpV6AWOCscY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KIk2bPFV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WULIgRY0; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65R9ZbHK724985
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bxovym1ll2PDsH9394AsS4KfV8o3y5jCIyIeSCGZdnc=; b=KIk2bPFVRbaMdX4Y
	060K0ZF0JrK6WDr22I2Ay/wtQYeAjCNJINM+DCjYXnv6kfbTeJaxcHrRc2gskeMt
	agmqpMkoSuJu+1cpH83nPomxFdCBbFHWJQ/N8VSbHypxfDwN27aMY04HpxhJm4i8
	xoAJUO0vx+nQ9HqoV6MNKsE4FnTERDcmVgCNsmRiEK6X5umV8TqVPPNojja9mBkL
	W5ElxHmoG0j1nOVitZOTAsbCNM2HMp9OVPy1Iirbp4BZNPnxG4DIFZ2/RMXupnzP
	o+X5KZosbarQFWPw3X20XGeDd6UCP5Y2Df7scln1TD+Js/ka4gtshyF0A34wXVPX
	zMZ2/Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26w6gjt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 10:02:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c42d96713so1356027eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Jun 2026 03:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782554529; x=1783159329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxovym1ll2PDsH9394AsS4KfV8o3y5jCIyIeSCGZdnc=;
        b=WULIgRY0DD6PwI3VU5/nZ2OLYPhv/xp0b1iV6Li1o0ZynqHmUsrumGzUKCD1XEm9t9
         axkiYlJNCJb5xTR8bcvFquvlQGu1GPTGWiTgoId1EJFJq6vVvNhKL10UCyW6hviqOsm7
         LHu9EhSTZDswCeMADcReO+JfRWD3g/umQ7QORS8IyHHhjn8AWb2AGr/esNDpjArRR6K6
         00UwEfmK6kCkOUorxEbXgDOieWtYkEaWGdsFwBjfydO8Z03455YKEwDSgRQCtl7kRtHH
         FAdrpQqZ0bz5DT89fda9KDhnxI2joamLdSSBMcxJRFBndUwFzHsBLiyciSoJ3k0Id0xb
         7Pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554529; x=1783159329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxovym1ll2PDsH9394AsS4KfV8o3y5jCIyIeSCGZdnc=;
        b=b4YzeY9vqQEPIQkW5LoVxanweiqzUJZ+nrTF1NNQjJlEwRgaKYGJBfk0WygH+CsirM
         QfYdzpjpqDqRE0lRm+Hn7EYsM/bKdnFKEBpcYxNIaJugV+aejAJSIh414LDgGDQ0QxYQ
         yf5smfuw8PcDtnLrF7EmLeYYyLsUSHoSQKH7m0FiZ9yc6LpfSBec3QYMn03h5DlneVxh
         dWlZ3PtkyqJn5C+HRWoMX/o1lA8+kQdJi7YBVdMVDZfQU9yc5B80/qGlOv5jsAAdvTAR
         1q1yeGi2WED01lhSomyUmzHcPgJmajEbo6XsjQlkl1cAk0ed6OwvMOMSo8/InqgCuT1v
         nc4A==
X-Gm-Message-State: AOJu0YwDT5QEyvlpRJVRpSxdcfQuhiSo9UyrquYixub1fMxCczmtg/pK
	tRFS43IGmNqmf9tmzfGp329EqMsAveF9B3p83J5vqOydEmA025llxly3p2D7+UW/MTCIqClLPVO
	HGkXIucan/9MMl9/hS01ZPrx53tUn6BUQnlO+WC3bVkxaVwbQDzZLaVzhmQBZ4W4Y2boY
X-Gm-Gg: AfdE7ckqLkSeAurdegLOD76Vp2c3/brqqijy8RBpLZRyQB8qovHV7xqSnRO74JEnqVk
	kYxclP5PGHTUqNK+CsGVSo1Lw8tH/UTnAbF2fBjp58xitEiGRT5s1WAJJV8XC59yFl/YAGBJ44r
	yBRfJYzRqHsQzdil+eja8+atu5ODWm1zpaVrkrOJp71WIC5a+6mSO0v7IBJMIwSnQpMmFvZgBar
	WRGRCffCU8Fxv+Q0YCPINYjP/l8X2q+02m2OEC9UNcyk5kvbzXjbjxcLQdayBbGc4xrqjM0LUAG
	XBCEg1L17EaFep5LsTHLzuMnWigsB9zJYnML2hRifJ3fR1sq5bCC5FLo2IkV3HzQ3DJzHkSjncS
	n8dD5yLKYcZthk2yCFWStdmiNlGIq2Uj2H1dMWA==
X-Received: by 2002:a05:7300:5341:b0:307:d4e7:b177 with SMTP id 5a478bee46e88-30c84f3cb8emr11223166eec.16.1782554528811;
        Sat, 27 Jun 2026 03:02:08 -0700 (PDT)
X-Received: by 2002:a05:7300:5341:b0:307:d4e7:b177 with SMTP id 5a478bee46e88-30c84f3cb8emr11223123eec.16.1782554528287;
        Sat, 27 Jun 2026 03:02:08 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d90e95c6sm38446568c88.11.2026.06.27.03.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 03:02:07 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Sat, 27 Jun 2026 15:31:36 +0530
Subject: [PATCH 2/5] arm64: dts: qcom: shikra-cqm-evk: Enable display and
 add ili7807s panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-shikra-dt-changes-v1-2-449a402673d0@oss.qualcomm.com>
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
In-Reply-To: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782554515; l=3142;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=QS9vkZA2e/SmU/TDdRgL29DC7Wbjw1RsgyTSuX9Yoy0=;
 b=ZnN7m2YVKfivMnJ7iBGuybX2HzBysI/RHJ6a45kuG0HS0ET1vcvdQxuBdc1NG40DVem6BVeo2
 IF5C2bhbULQBeDC4baLVyEbouZIPR0IIJnKA74LN7n4TxoUxPiluOyI
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: bqJdM6w9J9YErXgVF2FyYSPd5yAJN2Te
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfXwTZ90QCCsZcW
 VSbMC7jqEsF0b2bYC+AH1a5m9oYvlOXwe57b67R5obhUkf39QddVLbfjoV99FHl40zlxjFRvFBU
 2JqTs+u34vp9zFtz+NOFMB50OY2olns=
X-Proofpoint-GUID: bqJdM6w9J9YErXgVF2FyYSPd5yAJN2Te
X-Authority-Analysis: v=2.4 cv=SuugLvO0 c=1 sm=1 tr=0 ts=6a3f9fa1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ur-NXv3_5bdptA1sOiEA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI3MDA4NiBTYWx0ZWRfXzj1jvU8O+Y9f
 epspuS5JBWeRLuIZqxNWfXH7G+78qUfHi3m/TkM4Md3kcqeUvHSy8zKKiYzqnLKT9RBPWyrQoM8
 TMky0Zf7kzZw+ycZwfURW+g5IG6W9F66mwzxi7dxLNVTpaI2Rboquza3FyVzghTjfgP9Rg95VvR
 g/JSeMAQ/kaE1turNezmNcaQ7NRjv/2KSWDnu77hyBBIwLFIaWx1QEwrcr++UnKkzutCliHBfuS
 TyZKMB7drMS67Ch08SeGqNTzLCJg0jbFiQ0O0IWd20G2f5aYidfG1z5mA+K5jrEzTQIoXipXtiC
 cg4UDAZtKSk9Q+TmIfdM+/sxvpJLeOXNeej0eL//SXAn7C6fN7SkzgbBauod3b1NefMNERQv1JT
 6+75fGjP+SpZ7hQXYQjwSlPDdPdVGHQr4Bvk5FeBTWtksk5T0IWia126rICMJN0pRkGMHdC9R9Q
 wt+Tycg1diPK5yaaKBg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-27_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606270086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114724-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:nabige.aala@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nabige.aala@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E9C8B6D1B61

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Shikra CQM EVK
board and add the DLC0697 MIPI DSI display panel node.
Pin pm4125_l5 to 1.232V with regulator-allow-set-load
for DSI PHY PLL stability.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 104 ++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 683b5245923b..c9ea093cd8ca 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,18 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	lcd_bias: regulator-lcd-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bias";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&pm4125_l17>;
+		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
 	wcn3988-pmu {
 		compatible = "qcom,wcn3988-pmu";
 
@@ -60,6 +72,52 @@ vreg_pmu_ch1: ldo4 {
 	};
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&pm4125_l15>;
+		avdd-supply = <&lcd_bias>;
+		avee-supply = <&lcd_bias>;
+
+		pinctrl-0 = <&panel_bl_en &panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_bl_en_suspend &panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm4125_l5 {
+	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
+};
+
 &remoteproc_cdsp {
 	firmware-name = "qcom/shikra/cdsp.mbn";
 
@@ -116,3 +174,49 @@ &wifi {
 
 	status = "okay";
 };
+
+&tlmm {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio151";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	panel_bl_en: panel-bl-en-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	panel_bl_en_suspend: panel-bl-en-suspend-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+		output-low;
+	};
+
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio86";
+		function = "mdp_vsync_p";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+};

-- 
2.34.1


