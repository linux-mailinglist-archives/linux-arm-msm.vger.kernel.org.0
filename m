Return-Path: <linux-arm-msm+bounces-115759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id S2mxCfc+RWpE9QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:23:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B01566EFBD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:23:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dDHhyXK9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ELySaIth;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115759-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115759-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE5963137227
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A89F369D75;
	Wed,  1 Jul 2026 16:16:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B24367F5E
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:16:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922563; cv=none; b=OM8QQOPCaia7XDPKvjlVeztyHSLiAhXwUQxHNMh7CZkvawXAZ599+GXOoz9yNsqe4839HaLWH5kXX+NQn4vuk13ieQqdHOaMfocyhj0RXUOrVaB9dSgWeeBN4B//7lvuFrvlxGimBw5gFyYnYPnwQw/lmlJFkCmrnuSrKrwc/dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922563; c=relaxed/simple;
	bh=Ka3/2OHVRu69bdJbzsEw+il1OYy6CeM/zE+4zTE+Oq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kVHKS6aEUJksSkmAK6v/83sgBNmQHJEtAVEOfYlUW8slGcAgqkYaWxcYS39tjeW6Hk2IHQjmjTB9YWM4DI2u7Ol0S++HyA3KSfUHZQFF96obxpnGsKkhGpWAXxQmKZ955WmwFAUp42KjpinA7kYr+hPyk8igc19i7pxlh6xQpMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDHhyXK9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ELySaIth; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoIoL1550179
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HWGipK49nXtgoFExH/hwT+pS9Iok0V+C34bfYKTHbb0=; b=dDHhyXK9A0tPDieX
	fQo3kEK3FVmfyJtxzuOR24R5YUPxmOSKStZPUw5shvr8mCNWMI2mVVVzRTsjNUgF
	CXGbcpYlsN8TySeVX1dOOGt6pYv6DXBSeRCJ51FpkKHWxB+1QRoqJv1X/BRXqbSy
	eAGadOezovG9mZ1XP2MmUknTyN2OlNXFEtX76P0nZ9DwoYzlB8hzoHDCWFyDbCYt
	XeZXFxd5GPguyEb16uVi/Y8OhPOD80InTZtYgw40U3VKaEzN8k4+46eUkuLgiubP
	o5eE8zqfoP6sZ9rw89jkjsDXISb/uRWXzkR/MA+4N3r4f1p4d758ONfvSnXlqJ/6
	wAFXhw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5541rd8y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:16:00 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7ea80623bfcso1046940a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782922560; x=1783527360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HWGipK49nXtgoFExH/hwT+pS9Iok0V+C34bfYKTHbb0=;
        b=ELySaIthmUH5mV0W9XW+irVokOIMdmI8348+88CRRGy2yBVcnB8og5uCYn2jsXlcap
         rY83EdcLImELejXjbtgcayGINOKUZxWzcsUqMFigBrsH7UnfZET9Pm1Z5UmyIQFkPEoN
         iLlNGRFi4atZ8iQM0IcUOhr/Igqd4NbP/Q7tRL2vropDwfasusGS/7BygkAm+ZLv59qc
         nVtwSrpnDlwhDSmylhyiUwf+nhD/xfiQt5vqMgaGKsRpuXBxR0IlapcVlajDIFNJibuQ
         DTIvTnwywi57VY39I3QCBOeRHLWtr0w6CL3bTeuqvYLDEJ7wLIpC8lYtI1wxDXp3P2K7
         NQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922560; x=1783527360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HWGipK49nXtgoFExH/hwT+pS9Iok0V+C34bfYKTHbb0=;
        b=jBlXt9hYjPadThqRr2VpCBybwJ/atsHpYkyaTqUbvIpGVATvWioqlHA1lGqHEWJLvC
         dUoFtWk1dB32+28P0GWPE4ymBgXcKpIOOJjNgXshRN3cyqzK5jN8XksBy052RKefrY22
         hLmYd6oumk65CTqmgaKIQ1uAZr/12yHbP+rHfP+Du/hxrwOorRNB/juqLVT9UigyR/kg
         jFVtCVvXj0PYzzK/5GPtACK6670aVjImmZjlNVeABA7uP+EgYBb56NXjjNa7TyXs0nYv
         +E3aCEyUjGkTImZKNAgbgra0P97k1J2OAB2I3Mjjty957X2vQsWdgVoeP+T6ZsX+xrpR
         g5Ng==
X-Forwarded-Encrypted: i=1; AFNElJ/GZ4axtfbx3DyjUkijYYOV8jnK2Mu2nMUjXVwbpv1S3sq02SsDEi5vkilf8IsbMi5xwgipPsJQPqk060aE@vger.kernel.org
X-Gm-Message-State: AOJu0YwGhsK/SuI8+icM01EbdLqrI2Fr4ujTB0ia+zVqDFodxY8oBQNf
	RgXsuMkErqsv4J+8fbLGCDQPv8xz4z93thg1piV9gH9AVwP9xPUDMsqsvZbrQXZesnyxnGBdk9C
	BK2NCGP7fGqK9zWCzerh9bG2MgDkSyq1OdG/oVM6SZzdKV34CK/jhv1S9lPyiBlZfpoBh
X-Gm-Gg: AfdE7cljTSAqTD5xPQt1OGdpqY6lnjNWUyWCLYSiQz8FP0V+pyp15NsUMjKo79mPuov
	zxB8D3Zg/0KbFfR0YelHNNA+skY/KHYGFe1AMNnqDeNb8sO8T8OVSs61DGm6O6CTVdh9GH96veB
	k8iD9VFD8At0C9OMoyWACA9VpSOnr+qA+CZntJf2dfSKgablJ9Hty3oNUg5kzo96YJr3Nl5tJ0H
	5xzs8ccqEORIakvh4TttC0tuZxxp1DHiq8Q5R/FR7V23ua5Zlf+bDkf14UrFMnpGoGJyzqnBpYG
	nwrfCp8SHLoYbKQKOgLZLqw8sX72bRmccSYayOUfKPo4gwPz0DVwAe9uZAOr9Wn4R995jFlxxjO
	vhOI2Kswy7nyFqYV2fKKWPJnclJFdKz/sizWx8GmBeqPP2hu/3RUPFdI4xa9PzMSrKqOE/Abuhp
	U3fpvgzLyCpV8zBj6FMhuIyXCIaKFYC5IOrKHQkHr0aoECKTHjFBuWHYcFm656fZQ=
X-Received: by 2002:a05:6820:150c:b0:69d:f8c2:387 with SMTP id 006d021491bc7-6a309a11c20mr1267448eaf.17.1782922559983;
        Wed, 01 Jul 2026 09:15:59 -0700 (PDT)
X-Received: by 2002:a05:6820:150c:b0:69d:f8c2:387 with SMTP id 006d021491bc7-6a309a11c20mr1267384eaf.17.1782922559258;
        Wed, 01 Jul 2026 09:15:59 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ea70sm299570266b.3.2026.07.01.09.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:15:58 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:15:53 +0200
Subject: [PATCH v2 3/3] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-monza-leds-v2-3-c1be0b472926@oss.qualcomm.com>
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
In-Reply-To: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: EXyIS1J2ZdOA5tJZP2oCj4gy2-aPsJYm
X-Proofpoint-ORIG-GUID: EXyIS1J2ZdOA5tJZP2oCj4gy2-aPsJYm
X-Authority-Analysis: v=2.4 cv=Xbm5Co55 c=1 sm=1 tr=0 ts=6a453d40 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfX5EmYQix0uF9L
 xa6HkGBzKSJwRPrhN/NMEPSCcfxFFT/2etAuOo50IJoQBrVWPpYLL+JqHa41Vwx0dvKY/fOcdE+
 AxMO53s2nRT7lroVFgfy6KCdcYYTzgdq48L4AQDkHdQOKOGBHW5aooy0b4kBjIRvKwuR+jO7yBc
 3hHm1F8UJiYoLnlY8Z0IytkGu/cOMPsOo3BQT+xQGLrUGMi2G+/Wxa0z1U1aK9A/nhHl69qFbxB
 ND5S8F8vqlviiOtNZt5ruxXhM7D76zsQGryPJjGdS0PRHx9LgQhl6tupEpX7hTBFLN9orblRHI/
 tvFOg3BaZ+gWpbMEQX1jydaYGkHKiIDBl/S+J2uMepGIdYLVaAcUiKZ4NXqgxcQsRQX2QTwQKhK
 T2JXkj7wQZKuFJlIZbAk6hzBg5CMQ3bvCGOFWJyc0x4LzdAWLzdyysDXfpuOfPQLvm41DPTs83r
 yGpxGuNko8ZJfJetNnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfX3ImyL3m+eHo6
 yZ7+nKomevcNQw/FTCCmsqSMy5XGE0syP/+u00bddto5na2nk2GUxpzPVRF1MJHoaQLbXhUp/KQ
 Kn5rulH4C7Mzzh07R2FJIXJL7VT/cDI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010172
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115759-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B01566EFBD1

Onboard MCU/STM32 implements a led controller compatible with PCA9635.
There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


