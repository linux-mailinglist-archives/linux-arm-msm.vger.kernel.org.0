Return-Path: <linux-arm-msm+bounces-113033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id t6DxAgBhLmrmugQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:06:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6419D6809A4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 10:06:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dY8lWqd7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UmNOCR4x;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113033-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113033-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2197F302C6EE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jun 2026 08:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1CE83246EF;
	Sun, 14 Jun 2026 08:05:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C60311C15
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:05:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781424339; cv=none; b=kh0UBmWHz0pWM+WZkEwv85NPlR+0zCx4j92Kku3folcCrW8r4cH9TYGOM9jNcmcmKfUFRsLxXxyQ83FXUNLqFJQq+kQlYu3sNKfpVNrKeRCx423Ny/yt0i/zJ1zer9rZsg3wcv48ZnqkIEtLv7sToWCtjWnrGOW1jZaXKb3yiMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781424339; c=relaxed/simple;
	bh=lFu4IuT+IKrrc4jReWmTy3bMVs11TEshA6L6oqNRmmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pq4HPKQ/UBOm51058r/hsLBDFcjteYIpO6+LGhrWwXywYt+mhV2RPTWfvtSCynskpL/qr3waRmCAjtGbMuhRCYdMF2CHfEXYqeugmVHmUIFjRwRJUM+8AzuNrlp06J73RpBTgM5ZxdTMHEOenjaEn5xRgS8pi0On0CIKWI5KYig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dY8lWqd7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UmNOCR4x; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E6ZQhc950132
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5rsDNvilbkWSuGFB5Vz1up8VosXQ3v31uCBXifvutb8=; b=dY8lWqd7bRgIQkI2
	HwbAb7r5idJ7e0h7wkTvxKGIffMZfGnRAwh/SId28RBSDHzlgnc7U/OiGVTmB7AJ
	TQctdTKcdn1yf7xA2YPb3nYzE2Ub2rMaLmc1VF4KqIweLbqwgjFO6lL+nwj+NKKp
	ydw4uZhzfWhFtdDQfNxymR+YjC+4j1aXeZf6ZhvTAOfmHHZiZ5WkOe5NwyEIVlTs
	+LbT5SNUXvn78OwcOo7bEhD7zPfkYMoy8OjX5SeJZjX6xdSJIgRRj8viGeRDbf/O
	FwnylusWVJMgGdhIzKK3nStiTM5PnYEAhaK1Cdq1KqlIYgWiw9yo2m7XkN4TzwoK
	plQB0Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wu1eh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 08:05:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c8514f8ed5dso1162629a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 01:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781424336; x=1782029136; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rsDNvilbkWSuGFB5Vz1up8VosXQ3v31uCBXifvutb8=;
        b=UmNOCR4xhx648jDBkQR3y49IUf7LPJbFClx9TvjHNjafdYbhDwKE8+xtY2Y6sPwCKS
         SIMDjLDVqAjlWzI+iVnqjF9CJwQKyhmfcfb0tv9Kn2K4lcRvPurzuAPn1gE6MdiBhr3r
         hnoqTklcPGWZDhD+yghRuehDuMFYvq6vlJG1u/kVygR1DpvawKjc9aJth87Tc6PGxUP2
         hzyu27OPnk+sJHxZMrgaXoAbulWCLcAhRnSNQph/zT5ILAVNyx8Ag0Hv5JvD8dsAu3f1
         WEuaeN/w5G+ZlOLirwape9s3Uj+39Ht2xaoVcq36z4qZUVEo/pC3C4Lzsu04I0HlBvVw
         u1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424336; x=1782029136;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5rsDNvilbkWSuGFB5Vz1up8VosXQ3v31uCBXifvutb8=;
        b=JFTpYDwVhXKOGGozGS/aXI0PZL5WvbfJxqdWP79liJXQiAGNz33sgbIGjvY2qwcodP
         6E8Ih86upZvlo0weU5Ollti17DTGyMtCrnUZQo7uXxooWHY379xNELJhVgf/SekT1rHD
         yY4R4su9R67J8w3xbpZME1INuQqTtPbze6yQkJrdBrs9agZZaK/tFoBVu0H7DEkkgZyB
         i0HYezuG34Tunt8M5LkjCE8qUF2fpx3vKdRlkmaprq6ltFjWjqYLvj0YB1x71t7t1IGY
         sH5VI4HmwjS03iD58BYtP2y0AUh2zJ6A46SU3FB/V8TpfrV5u3IJP0klVLAjo58nehQb
         K2JA==
X-Gm-Message-State: AOJu0Yx5E/aKe+CRfgJwZ7+eb7OJjyXlYOQaF9TI9CDiEYwSkC98rvdG
	7iPKaCX4aJw5F56Jwhu7CtD8tXt5s3SseIzAXj9Lil/7K+5bWWvqzurNeSrVNC1DPjlngV6MmL6
	AjWhjlMPkzhQBfi9+LU7qitzpB+aOEfDu7E4PQTD+/rDHWw1axjHOzSj8VT1nPSy04pcR
X-Gm-Gg: Acq92OHWkQZWIAyytRV2UB8+kCTE2bgfA/ryxV1akzq5yM06OFvPzYYnq89ve/uBYmB
	Kf7+XWmCWJIGD4+RkbzXCbYbkYNXK03AkZkRIInOT3w3HwNopiSfwV8Hc2yov5c6PR78qRIuNKH
	gL4GptFhqY5jswxYn00tiRWLbGYcIRGWvAxqGXDILV9pFJSBG7jYsJcLai9iCrX34UBdD+kVrfq
	2yucvPU5c6s0iyJWndNYGIra2yKNtl7ReWzXjBnoxaFbAZLCBMteDeFmvKi525iwxwbXw16YcmL
	JW0+r6PpnGBM2C0d+Sw0XtvXsX7Hp7IjfpT0UYlQtqOKPGNEnwmYtj/h8KUJLUKzA3eHSMM9wmH
	beEO3kr3XHODQL+YSSNeTZAzQFooFSY63vT7s5fnR
X-Received: by 2002:a17:903:4407:b0:2bf:305a:310d with SMTP id d9443c01a7336-2c6641e9417mr64638285ad.24.1781424336392;
        Sun, 14 Jun 2026 01:05:36 -0700 (PDT)
X-Received: by 2002:a17:903:4407:b0:2bf:305a:310d with SMTP id d9443c01a7336-2c6641e9417mr64637995ad.24.1781424335975;
        Sun, 14 Jun 2026 01:05:35 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ca31sm67309225ad.55.2026.06.14.01.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:05:35 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sun, 14 Jun 2026 13:35:09 +0530
Subject: [PATCH v2 2/4] arm64: dts: qcom: lemans-pmics: Add ADC support for
 PMM8654au
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260614-adc5_gen3_dt-v2-2-32ec576c5865@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
In-Reply-To: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781424323; l=4659;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=UveLLaFbt4LGcQy2FaHPB6oYAGE6xjTtc+YtJb8zYHk=;
 b=Io0epmYefdADI2VdcCRCt1uo6ovWUkhTS90y/SUbCxD3lS/YmNsewmRzXLmTU7t0NE3J6l8vV
 Rj369uvWYUIBXYmFiaRuoeQOgdOujTPxPUa5FSQfEyQDcN/FjXOjDbQ
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-ORIG-GUID: bt5N9veu6-9D7bRKVPizwshHspDBCs3v
X-Proofpoint-GUID: bt5N9veu6-9D7bRKVPizwshHspDBCs3v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfX0waP/VaBsjje
 ld0zYLsspdpyyqSw94yGKp80DMGytY5awjihkK0xM0K5ZvBt3kPrhXjzYI/FlGzjvFHixcAZ+bQ
 BcbMznRe7hL65NEQBs11d7DXcfAWgQE=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2e60d1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=hbj8Sl73EW6utw1LywsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfXwUb8HTIsZH5o
 pEc8KNVj5Ia6/Y+J94GsgPDRCa+JD52G1Qhr9QA6SdC+trB/Uq4Ml7YyQoimcSBw3J5xfadSeGK
 xOqBIoJEKoVVM+g6/akVlKcaZ/E/9ne3YGHkrtDbjBporYSuXfIp8D4CRiK45q9GaLGB+lvEygg
 jS6Ch+dxUxShfDdRN/TiS5vG+hw5DNbLKiTg9br+7v7BpnUvJ0BA+t6zzS0rjv4uE3+Vw43wr19
 zE2KFLyPNwqb7NIBAVl3dONxs2ammUyZM4h7APDA0M3E+elyKPHy5gtMKAw9jRCEdDg2RiJ4o13
 AMdyvlzV3O/iXos+J8kk/mBxVKxkNq0xsHqaYZcDit3lTFe9JZH2xnn9qmeqy7AxohS0EFc+XMQ
 maon553bSb7nA2uxA3HpCVXvKdb87xKGDYT+AUorWTHwC7tuo+V1TbMZyvwvPbbFL2jmZUaHXl6
 oo34ntJOJ3SsVpN/rMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140079
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-113033-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aushasre@qti.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:jishnu.prakash@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jishnu.prakash@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6419D6809A4

From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>

Add ADC nodes for the four PMM8654au PMICs (pmm8654au_0 through
pmm8654au_3) on the Lemans platform.

Each ADC node exposes the following ADC channels:
- DIE_TEMP: PMIC die temperature channel
- VPH_PWR: Battery/supply voltage channel

Also add the io-channels and io-channel-names properties under
the temp-alarm nodes so that they can get temperature reading
from the ADC die_temp channels.

Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-pmics.dtsi | 93 ++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
index 341119fc8244..6caec3e4df4b 100644
--- a/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-pmics.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/spmi/spmi.h>
+#include "qcom-adc5-gen3.h"
 
 / {
 	thermal-zones {
@@ -110,6 +111,8 @@ pmm8654au_0_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x0 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_0_adc ADC5_GEN3_DIE_TEMP(0)>;
+			io-channel-names = "thermal";
 		};
 
 		pmm8654au_0_pon: pon@1200 {
@@ -141,6 +144,27 @@ pmm8654au_0_rtc: rtc@6100 {
 			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
 		};
 
+		pmm8654au_0_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@3 {
+				reg = <ADC5_GEN3_DIE_TEMP(0)>;
+				label = "pmm8654au_0_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@8e {
+				reg = <ADC5_GEN3_VPH_PWR(0)>;
+				label = "pmm8654au_0_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
+		};
+
 		pmm8654au_0_gpios: gpio@8800 {
 			compatible = "qcom,pmm8654au-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -176,6 +200,29 @@ pmm8654au_1_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_1_adc ADC5_GEN3_DIE_TEMP(2)>;
+			io-channel-names = "thermal";
+		};
+
+		pmm8654au_1_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x2 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@203 {
+				reg = <ADC5_GEN3_DIE_TEMP(2)>;
+				label = "pmm8654au_1_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@28e {
+				reg = <ADC5_GEN3_VPH_PWR(2)>;
+				label = "pmm8654au_1_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
 		};
 
 		pmm8654au_1_gpios: gpio@8800 {
@@ -200,6 +247,29 @@ pmm8654au_2_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_2_adc ADC5_GEN3_DIE_TEMP(4)>;
+			io-channel-names = "thermal";
+		};
+
+		pmm8654au_2_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x4 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@403 {
+				reg = <ADC5_GEN3_DIE_TEMP(4)>;
+				label = "pmm8654au_2_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@48e {
+				reg = <ADC5_GEN3_VPH_PWR(4)>;
+				label = "pmm8654au_2_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
 		};
 
 		pmm8654au_2_gpios: gpio@8800 {
@@ -224,6 +294,29 @@ pmm8654au_3_temp_alarm: temp-alarm@a00 {
 			reg = <0xa00>;
 			interrupts-extended = <&spmi_bus 0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
 			#thermal-sensor-cells = <0>;
+			io-channels = <&pmm8654au_3_adc ADC5_GEN3_DIE_TEMP(6)>;
+			io-channel-names = "thermal";
+		};
+
+		pmm8654au_3_adc: adc@8000 {
+			compatible = "qcom,spmi-adc5-gen3";
+			reg = <0x8000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x6 0x80 0x1 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+
+			channel@603 {
+				reg = <ADC5_GEN3_DIE_TEMP(6)>;
+				label = "pmm8654au_3_die_temp";
+				qcom,pre-scaling = <1 1>;
+			};
+
+			channel@68e {
+				reg = <ADC5_GEN3_VPH_PWR(6)>;
+				label = "pmm8654au_3_vph_pwr";
+				qcom,pre-scaling = <1 3>;
+			};
 		};
 
 		pmm8654au_3_gpios: gpio@8800 {

-- 
2.43.0


