Return-Path: <linux-arm-msm+bounces-117757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aKnnBQZuTmpJMgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:34:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED2B72816F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:34:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KKQOtHgt;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fIItZw5w;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117757-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117757-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 160CF300C038
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580C33839A8;
	Wed,  8 Jul 2026 15:34:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1A936B048
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 15:34:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524866; cv=none; b=jpxgRcFTpH5JI8wibbxgKogBIEhqEUKa/qW3y3FUEb8YqnG0WgpScVFkDc8AdrlwqZwA23FjLAW0bdWqbz/AE4VhPDUGhwaqB7Jwfpf8HRwN7dUQbO0iGC8kFwLfoetRVAQnaqfsP9yDUyv6Bcqgq4Ey7MCL4u/JXjX4xdrUo0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524866; c=relaxed/simple;
	bh=1aU5rl/DZoeNB1kalHh4r28Mbus6zXBZW8ufrRmXANk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vu4XNRoBeLy6q9ctGcco5zQSAwl/7vvRwvufgXfnM48yWotCLZoxXQ01Idbg+z/XS7YT1w4Iacu0Vqm2D0+hjsAJjQuwTUMX6Xx7Fhj8J2hXpr4om91Dx5f6h+uXOLFPUvVCtqGICctmsbUkgjCMYL/5PhwQ4skCmKWMwxW6dl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKQOtHgt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fIItZw5w; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3BjB2751092
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 15:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I254CLogHhLoGGno/xy1XO
	lBa511Yl81T69kJWHEPTo=; b=KKQOtHgtQCvLqluuFabTTzxr5HksGu4F6TcvcH
	Dmm67lZidD1wETZ0CjInylzR7JFf3fHsXT2swWlgztveTL8MDRAwps0kUPVKvHlm
	7qIezMbNCvDYdtzgZipgjyhpv1b0ONLdz8CMSTUQPZ7jvuGMyqtiSl+uqiNnhnUx
	QD+fmz+4rCqpwSIn9ht05FCsrWR1YMMNpB/fglR0DwWe3dAeyi/WJiiFg5wulPyD
	/wWMckH3WPpbB8ONmJZ3WexGjQHFS1qRhfkZLhEdEfp5j+QLSDzltbqrCXmpUHIC
	4hHQkHX6rgYCs8FFlqjSx67WBisw+WNqOOPPp0z5Lx+bN1yw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9g7hjfwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 15:34:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c20762d21so9400731cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783524863; x=1784129663; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=I254CLogHhLoGGno/xy1XOlBa511Yl81T69kJWHEPTo=;
        b=fIItZw5wby4uGWLS7Ku8HLsrUZ7Bn395yRVopvFLHuTzir2ssqbLFOaY0Z0tjHTINC
         da99766wOCp5kD18TawePZHqZ7+6Fj3Zw4KNCy+gbOrtXufGjY5/Q4a2+6V94zsGILii
         sJi6Q9Gkadat94rbdFJtLHa1vdyWD/gLuOeBbvG48843awBgLymU+4aMn+M+H3YkxQg8
         73deFdeXW3TvAwCmRpjcGBMJuriFqG3Z29Hgri5Lk2uD7qxnBjt5T5NZhWGbh4VJfeu5
         JNvJYBvvQ611pKNHMyGlAv3J7eLfMFIJWzpebq4x0Wibcq22AKOQLHX3lLMl/88qeaB6
         +HCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524863; x=1784129663;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=I254CLogHhLoGGno/xy1XOlBa511Yl81T69kJWHEPTo=;
        b=MoTXOKhi3CnO82bGEgYmCE1ahjcaN8Jz7m4DJ/rZaM94kB11HYrAoDcN8Fc2821e+o
         NRjb4jfQFewd1EP4whSnSbjzeiLm1EMm3PvrggkiV3M+kkVAaA1Ty39RPrQUSe88rKlU
         a0QX65zzp/KFl5/HOKgp2IuokTG0v4OEoyG8wlMb62TwKHkMVDfxZKwBQCLZjWODSY7+
         EEUjD8GvoF+DqnenSijFR4RyLqTr7IbLTwwIf7D203lwB34y/XEAAGenf8PDa4h3Clgr
         RRWEoDMM62ExOarx/GwcMYEKxeacLk83rQCZEUhvzgxqIH53dHLFo5pYH3xUG/YbyuBm
         ryog==
X-Gm-Message-State: AOJu0YxWLjrVO0uoti9hrGAnEOFAijSw8/mXIih8hg98JhcG9w1f3903
	VRwHNrXzkQmyenR56UM+p3B3CphA0wPE2yfOhw/ZQTRbmTKi5EXhN3t41T/PkN3fTUF0w6E45ZU
	DTmFX66YIJohSSobo/FaGLZIob7FaFeh24oTy8qBfDzWoKnxjQDtdZzBE3gR87isUaxQs
X-Gm-Gg: AfdE7cmmciGs/+JctXmzJSG5hzqODY+wAVL55Y070H7uE6MaeejrBCK/jsChpr1fi/d
	y+C3W3Beoe22ojsSTpebKlXb9eDTtPGnoLElEEZJpxojHjzOiNf9Q5B5Q2tinpSIZe7Prfr9nWJ
	H5JxOqRp2nn1nOnQSDUM72mMOSXzss5L+TASu/yTBkIRue0sRqeANtHljppQRdSjwMLnWZ15jzH
	EJyuBomoJ3xSVzqjo2BYqvoWCiW24DuAI3jobIHDWPJeQY/E2vE4rqXUBPC7/Ngr+AmWlYSbAwF
	Z7Lu/mGWtfI6ng7Y6wQeffXRpl5iReI//sAu1PljyZN0o3YKeGt8jt1x5wZVXYsWvEL13UOv+vH
	2vXe2CMVUkzIyigQwyrNCpguJ9nIBaxKHLFKWRzyTL47iJfGbp6B5cE9OcKZ+ma4btaqxvm6jAm
	LAyWQ+hcJCkVm9tuRRFjlTvWrLn4B3xnKG63A/JmEOQXmvMhz5WDx1uwKYT0to4ZgWQItHnFlfL
	67a82HWYc9Y26ZAj33R
X-Received: by 2002:a05:622a:1804:b0:51c:555:7dea with SMTP id d75a77b69052e-51c8b30323amr34858791cf.30.1783524863134;
        Wed, 08 Jul 2026 08:34:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1804:b0:51c:555:7dea with SMTP id d75a77b69052e-51c8b30323amr34858191cf.30.1783524862553;
        Wed, 08 Jul 2026 08:34:22 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d4bffdbesm111607166b.45.2026.07.08.08.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:34:21 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 17:34:21 +0200
Subject: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add GPIO line
 names
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-gpio-names-v1-1-9162105b9971@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPxtTmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwML3fSCzHzdvMTc1GJdU4PUJONEkzRDsxRzJaCGgqLUtMwKsGHRsbW
 1AMldCT5cAAAA
X-Change-ID: 20260708-gpio-names-50eb3a4f16d7
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE1MyBTYWx0ZWRfXwejbW2SXeTix
 VCphEFSboyLe3udoJyrXMxM6dIgDGStgu2xBGL1z2L7LKyQqJZ4KVdUcchtCQEZ2rkxDawKBCy5
 aQ/SmSPGE9zVExSlP3VbcD8PUCuPvTP8uQJPsGEExHGitOHo8lcKofzGjkHJ1pD4SlzFf+f1vFx
 XL7qrrd/5XHpuDNX7MXbhanQfwOC2dZHKanNv/NJMLPDFFA8nlmN6zlkl3r8/RJc/48f3980m+6
 jBJIP2zf1cTA8MmT3ji44rNwAmfNEb3W7lPJlCaxEo8NmzLz8ORxrIxDtjQ2jq96jP8x/6bMvde
 1BWtnRqGgyUR/2HCOMCvCGQxK2eHYAb/VsCjcWQX6T+wblEBIKTnV9jU8CYHQzkGPyUfQBlmJZk
 mBUQ3/Dwwlex7G3OUx3XhmHoc+RsxIfX/gKgR3AsMxyL8RFO42b/71dEmF0vseTZbSuZoimn47i
 OXBcLAJ9R+O9RqTnf4A==
X-Proofpoint-GUID: bd0wzZdUWYnUif_47V-OUsE3rBHb3fS3
X-Authority-Analysis: v=2.4 cv=TMp1jVla c=1 sm=1 tr=0 ts=6a4e6e00 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE1MyBTYWx0ZWRfX82YbtiYQ7KU+
 tsmsFenVa7W6MHd43xH1sVBg5MulANqwFFr4S2EzyXonQgrUuKD43f8I63OTCISdVRRLHgNKSz1
 V0GLjjlNwFVYzXOc3mK9jFgZJ1XYXpk=
X-Proofpoint-ORIG-GUID: bd0wzZdUWYnUif_47V-OUsE3rBHb3fS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080153
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117757-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9ED2B72816F

Add gpio-line-names to the tlmm node to document the PIN functions on
on the VENTUNO Q board. This covers the different headers (JMISC, JHAT,
JOMEGA and JCTL), the flat connectors, and the SoC-to-MCU interface.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index 8b3ed73feb6eca6578382beca588baf42b8c9bb6..24d27046667450bf3aea7646d352fe27f0a64867 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -426,6 +426,34 @@ &pcieport1 {
 };
 
 &tlmm {
+	gpio-line-names = "", "", "", "", "",
+			  "", "", "", "", "",
+			  "JMISC_SPI_MISO", "JMISC_SPI_MOSI", "JMISC_SPI_SCK", "JMISC_SPI_CS0", "JMISC_SPI_CS1",
+			  "JMISC_CS2", "", "JHAT_P03_I2C_SDA", "JHAT_P05_I2C_SCL", "JHAT_P27_EEPROM_SDA",
+			  "JHAT_P28_EEPROM_SDL", "", "", "", "",
+			  "JHAT_P21_SPI_MISO", "JHAT_P19_SPI_MOSI", "JHAT_P23_SPI_SCLK", "JHAT_P24_SPI_CE0", "",
+			  "", "MCU_I2C1_SDA", "MCU_I2C1_SDL", "", "",
+			  "", "", "JOMEGA_SPI_SCK", "JOMEGA_SPI_CS", "JOMEGA_SPI_MISO",
+			  "JOMEGA_SPI_MOSI", "", "MCU_PG11", "JCTL_UART_DBG_TX", "JCTL_UART_DBG_RX",
+			  "", "", "MCU_BOOT0", "CYPD_SWCLK", "",
+			  "", "", "FORCE_USB_BOOT", "", "",
+			  "", "", "JMEDIA_SOC_CC0_SDA", "JMEDIA_SOC_CC0_SCL", "JMEDIA_SOC_CC1_SDA",
+			  "JMEDIA_SOC_CC1_SCL", "", "", "MCU_PG12", "",
+			  "FLAT0_P17_GPIO", "", "JMEDIA_SOC_CAM_MCLK0", "JMEDIA_SOC_CAM_MCLK1", "MCU_PG9",
+			  "MCU_PA13_SWDIO", "MCU_PA14_SWCLK", "", "JMISC_SOC_GPIO_0", "JMISC_SOC_GPIO_1",
+			  "FLAT1_P17_GPIO", "", "JHAT_P32_PWM0", "MCU_NRST", "USER_BUTTON",
+			  "JHAT_P31_GPIO", "JHAT_P33_GPIO",  "FLAT2_P17_GPIO", "JHAT_P07_GPCLK0", "JHAT_P36_UART_CTS",
+			  "JHAT_P11_UART_RFR", "JHAT_P08_UART_TX", "JHAT_P10_UART_RX", "JHAT_P26_SPI_CE1", "JHAT_P29_GPIO",
+			  "JHAT_P15_GPIO", "", "MCU_PG10", "", "CYPD_SWDIO",
+			  "MCU_PG13", "MCU_PG14", "", "", "",
+			  "", "", "", "", "CYPD_NRES",
+			  "JHAT_P16_GPIO", "JHAT_P18_GPIO", "JHAT_P22_GPIO", "JHAT_P37_GPIO", "JHAT_P13_GPIO",
+			  "", "", "", "", "",
+			  "", "JHAT_P12_PCM_CLK", "JHAT_P35_PCM_FS", "JHAT_P38_PCM_DIN", "JHAT_P40_PCM_DOUT",
+			  "", "", "", "", "",
+			  "", "", "", "", "",
+			  "", "", "";
+
 	pcie0_default_state: pcie0-default-state {
 		wake-pins {
 			pins = "gpio0";

---
base-commit: f86573e68e56a7df7d54eb58101ac413ba731996
change-id: 20260708-gpio-names-50eb3a4f16d7

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


