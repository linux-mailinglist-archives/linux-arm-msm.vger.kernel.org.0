Return-Path: <linux-arm-msm+bounces-117656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HZV/IQdfTmrILQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:30:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4197275D6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:30:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="jiAx/El8";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=JkTqNqD3;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117656-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117656-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0111930505F4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A813947DF8F;
	Wed,  8 Jul 2026 14:19:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C7247B438
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:19:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520354; cv=none; b=Ah5Zm4p/WtQjpqyvgOPU7Pj6tYMF8YvL2mmPjtqg+MZJ9ejx/Q5o9Oe08alUcMbDJyYlA7LrPU3QwezCxKOe7/FeEyqGxAV9MB6TvRb+gG+MUgkMfI8MfKJfoOYx9SNjO81dsNTiIPReRGQryD91tMgjM3dTxp1UcgG4PH5uwkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520354; c=relaxed/simple;
	bh=+NBAVrPIo7sHJ7MgnZXaHhnNEpFD2cpSnzyBi8ZsiQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iToYkwuXlL5X4/4xRLEED8yjHjNDGAYvJzOoDjVJgFXtYZ9vtJzFTFk7kpxP3iBSqBnQaPxJbucMUdR3qU3gLIunFZZQAsw7viXCDbaMQU+UrwIOc6diJ7nrMy5U8jsY4EozCFyjC/kHFdkO/1k1+Y8hLA+VI0NG37iNraROq+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jiAx/El8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JkTqNqD3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3ge52758970
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 14:19:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=; b=jiAx/El8MFkuvlra
	XpDo8Ubre+ptbaxkbdfzFWMgAkQmo1ao1VB8UIry8FI4J6x4stk5MK98WKpw1Wqi
	QXgDLMN4vuCaXjEV5Ju90sU/n56n0DUKkasrrvkQUut6x+x8XUzLEeESEdO467mS
	wneYWDsPKhg08NVfWK1C0/0AjTylTfm8TltjJYKVhTnWK/suX9a1Exxo99YkhkGa
	x5PtUnKrWc2cuq+OueuukwPDLUqMRMHChQU0B0IPyn1gIyvtpRXC/fTaK7NbWAk+
	iEoSoMzb+UiDGPQK2b6IdeD1GIcq4XxGRZHf8mYNpHTdu3hQ4XQU7GfeFahDPiKT
	6/Kuog==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5vtkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 14:19:11 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-967973f71fcso233153241.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783520351; x=1784125151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=JkTqNqD3YThRN8+dkjYD3vV51EdObLS494579V1vqwYvnTRsAFyYVrtILLX2N1mKtM
         pBUEUi+2042jEBqSCOptGsgOmL+I2W+2UtSBFbSa2Pon7VNrbm7Gnh5kDX3i6F6XCbCT
         a6v6eeqgDI56awYNQyY5Ehht8Hg2VOw3Zd2RWPYE9iAJUUNjg0g2dJQ1vKJH7FaBjGLq
         mMKXKe38IXPskuo9FqIU5mAusrSlYFxoH8eDP3O6RKN78UE0/OaKN/BAS0zzVPRca8lO
         OfAWnkiIlOcfwyPSp41t9AVSJr0zKo914nFrjOcAPIPaW2vx/RtMWDB4IMRpVTfoENC7
         ILEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520351; x=1784125151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/hI2Z5d+V7iRiB8SiYtwd77BV05jUQxuFx+qxsaBDo=;
        b=VXpZS2bD7/06jAaEUICuChveJr5Kiq83V+R0p0UrXH38rLDf675Qub58Of/Tm+ZocE
         SVCz/vRVvH0BMvTX7r38rvfrsDSmGnV7IuZqgFOJ+foSCKgBQYRzSz3aRTNCGx8P+gfA
         FfNzxCvQ9WfClUhUq5/EiO+X4Xalt1ahWBozY4ime8wrPjcCD5avtm6tZOPhOASPDPoB
         0+xf8RXkueUbGXEUDF8bS45DlgvA3/g7xx+hKIMqX3EkJfEOMlpzIJXtJg2HSgv6lC+A
         oq1XJWpt35bX3i44X1vcGZ6fL0K4iAH5K5mSTFNDaAQ8QRR3krvqV89RrxgFgiH31MgC
         O02g==
X-Forwarded-Encrypted: i=1; AHgh+RpR4e9DMoVYl5djepGWjevulztk+m8NAIe2KL9s1agZ1bqQg8Miwh5qY/APk/QQ+JJHMNnvrMAsbccDfEVB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8YE1pfuoIWgKE3FPfCE4sm6aJC8bGDhj5LPuG3ebnMLfGzuFR
	WZNFIhWCxUlvnyTDFi92Rrq5xY2Z24wcG/LI/xGNFLblTKO96g2P6t1RPvDdrL9gzNbJ9gzlVUc
	t1Hbjy4yzQFlQ5iKZl4+ucJ80tUWZjv+wTdifVMKc7uGIhxRgk/G32jP9q2j+uLzWY0V3
X-Gm-Gg: AfdE7ckKEJMadYVbbWdlW1r0Fbju2dCQySWnSI0LJBwB3GZwLNwo6MXewfWldUd35f9
	fjhRlQE9x14kTCJ7Q7ykak7AGZJ4h0PTHmjKh2hHENVb094zo1l3KEO3eLBgpzpt3JkS+317/Gu
	D3tZ6JWPcCfLC/ceg0kOj7u72rm7b4NL0zZXuCigdLT8LTpk9lBhIAFURao5BHijqc11TBLzSnV
	ER06fh93hhs/ntgCHFPBy7L16w0hmqWOxrX2XLb5gcau0KfD9b5W5p/wbafpfPD4wvj1O0KAdBy
	TOgR/5RUUNlNApA8jY1kXyrCiQJ0Wuaoa4yQKPXHWePjNoGp4gklGRLDkjdypm2xODEUfJD1QFf
	wDnfL8VL5GW+eV0o/uGCyZFVl2teZDgFo7o4ezvGznhSo3hjML1t7m5jm7aQPA4LKTmANo6mZj+
	fDAgk57eYxJAemwOJ2A0dF6sKtcBqPopVxzuu/nk/L1OppBoxekKu4tlhKZL+hq7pVZF7NrfVf7
	D+KkCqvB51nBFNCvP0V
X-Received: by 2002:a05:6102:5e8c:b0:633:f2bf:7de4 with SMTP id ada2fe7eead31-744dffb3680mr1400935137.10.1783520351156;
        Wed, 08 Jul 2026 07:19:11 -0700 (PDT)
X-Received: by 2002:a05:6102:5e8c:b0:633:f2bf:7de4 with SMTP id ada2fe7eead31-744dffb3680mr1400884137.10.1783520350378;
        Wed, 08 Jul 2026 07:19:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a9c4a4027sm3080829a12.29.2026.07.08.07.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:08 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:19:03 +0200
Subject: [PATCH v4 4/4] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-monza-leds-v4-4-a7acfc524c0b@oss.qualcomm.com>
References: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
In-Reply-To: <20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: pqHxPADQuDgg6DwZiLijm1IIyLyltOg0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfXxKGP7zUAoSAy
 WtqDYsz13RAj1+eRZa7r0/GQ4C5olD2yL02agZjDki3bZ1OIs9UlXYxTE1DFUlGAOqMWCSjiFYw
 Usk0/GZOarQKf5XF49C49Z6wLeFcKTA=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4e5c5f cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: pqHxPADQuDgg6DwZiLijm1IIyLyltOg0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfXzx9ew47TXz6h
 JhHemUAfvzlf/cHYn6KX84PMsF7bCdb0XAFOWdQKMp9MEczzMZsLkk1gA94fNm03WKo/1JZ68Q6
 sgljjgpJKZcW5a1gh9wPMqhg8VbidR0MLa50G9eXQDKzj5fs1Bu4B7c0yOz2i0kH9Ogn4wbET8R
 NCF5XwTcmjzFJrkffIspDeuTEF7hrIgxN6fAFHZhR+nK81V5/aog6+aCnQ0j66HIXxVk6nCzbU4
 NXo+icVGrmg7uM/CwdF59uQMR9Df6L9QnOMUtOErdLpGfp4PxCWF5iE+friHOaYF2Hg75Xe4pOu
 m2n6FdEEulTQOa0cAcz3KEBS0uFb1ArtrJASSHWtJmkFE+3ahR7hKr4ZxcBnwBEeV6Wam2B+8uK
 TDEV5KQqdjkovceoh1bWFgkKZDwwmgLEHpmQ63PNaw2APrqHmqtoSToqqax0VRjtVEsjiKqpRc7
 /wLqErZAfF9jt7DnY6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117656-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C4197275D6

Onboard MCU/STM32 implements a led controller compatible with PCA9635.
There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 379b796f261f4c8f6b7712c5d340b20be1b9217c..83ccc4eec342328c78be37d4642b772d74a8ed37 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #include "monaco.dtsi"
@@ -156,6 +157,115 @@ vreg_nvme: regulator-3p3-m2 {
 	};
 };
 
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	led-controller@22 {
+		compatible = "nxp,pca9635";
+		reg = <0x22>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		multi-led@0 {
+			reg = <0>;
+			label = "stm-led-1";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@0 {
+				reg = <0>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@1 {
+				reg = <1>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@2 {
+				reg = <2>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@1 {
+			reg = <1>;
+			label = "stm-led-2";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@3 {
+				reg = <3>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@4 {
+				reg = <4>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@5 {
+				reg = <5>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@2 {
+			reg = <2>;
+			label = "stm-led-3";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@6 {
+				reg = <6>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@7 {
+				reg = <7>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@8 {
+				reg = <8>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+
+		multi-led@3 {
+			reg = <3>;
+			label = "stm-led-4";
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			led@9 {
+				reg = <9>;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led@a {
+				reg = <10>;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led@b {
+				reg = <11>;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+	};
+};
+
 &ethernet0 {
 	phy-mode = "2500base-x";
 	phy-handle = <&hsgmii_phy0>;

-- 
2.34.1


