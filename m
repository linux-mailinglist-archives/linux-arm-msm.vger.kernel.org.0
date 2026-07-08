Return-Path: <linux-arm-msm+bounces-117654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y3JSDRpeTmqNLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:26:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 932B4727521
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:26:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=dRKZpFZn;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DIn8+kdv;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117654-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117654-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0BE53309D206
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 542B547DD54;
	Wed,  8 Jul 2026 14:19:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA6147B438
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:19:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520352; cv=none; b=ECjbpd7WtX3RVuq63rqHPayjxGAmMepTgOJaW6QaYH3yOoGttlDaFKvdq0TBfDF6Phlv9R4zN0I3OYkEzEweVo+LUTtncFxR6L6rt5nSqJ1IbzFhZ/XBw6V4Zk4LYTa0CFTLhfHvAQahCMoCXIWvUvsYfa0FjeX/FwliDp5lZhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520352; c=relaxed/simple;
	bh=1y47odj+NOJ9z0mS6+ykXCLNXopAlKlTgU+V3x/sXtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TreGi0YlUPsdoCrALGLZBWoassytsHbF0OoYTcrMnLwfZPWUUi/ZmRZDG+LCFXftHnyWUZH+5evs/nKQXTivSIJseNw6RG9UanYnK1xU95nuHkc5NetXlyifM5jhM8el2Q9VO36eZuAlFhwftk0J2jQVmuWNRmWMocmUZtpgukA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRKZpFZn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DIn8+kdv; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C3mIP2715656
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 14:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=; b=dRKZpFZnXQNxXPa9
	c9zZa7ppK4PBFfIcfHvh4OWrTqlbNfAwDO779yGux2XBqxnbYejrUC0lX2korZJ/
	BnTyFcaH/eoJZmsk/mpsJqFgJV5nIMKQTutxkDGoMUQmwkOQj5wkgJ6BmiThX8Q2
	i/grHNPtde0i1gCFwgBlWktqyxahcR6agJgC2UgRUOSMt22HaitrX6uROG2lkdt9
	oIKVSUmQl65zIU7tyBw6/Wns7dx2L6HmC2FJh3IqwY/Bl2m72ywlpYXNrRxJVqrl
	Alml/BIB9gT5YUEjd7ru7Vqt0+X7Ahecd/14w1bW4T6tisubrqbExMjgZZhrJjpq
	qWBt6g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd4ucx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 14:19:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6751db2792dso259035137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783520348; x=1784125148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=;
        b=DIn8+kdvjp0oESVsBs5dt3ODjTpRE4LUp9sNUK9BH0LvyPrewxqvjHfrcxRKZSj0J2
         ZU0y7kwd2TxFreVNeQKltTGyMJMexJcPw7MJu9SYXmikk3Oxknf1S9++a/isVfxyTzw1
         LuIEaPTaPnB7mWfrWreZN/l0H+2/JPIa/XYzrNfRo8MQquWvwZZrFd0HiFEfxuwlNj+1
         VshX+dA77IgsExk8QAzW0kjPVhQuNEps165CrRQlz0vFGlw5CJ94MT8Ql2Pr4dkxYL6D
         G+Uvv6UlHrl0ojSzygFkDnmr6/XpMARJB2rnVXanZUEKSyuzvnwiIGq25O3otWTtskRd
         92Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520348; x=1784125148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=;
        b=Zj3JKmN/ePlJsjpiWqmAO+2QFfs69Kpn4nERW6pf/9UBkKMflH1uF+0x1Dr8Ny2Z2B
         ZjtbIY1Y2p08E3L0lvCryA+pqYEHHEqP/oZ2f3shMWE/faQVyGRse9pGcI36D74BWoLI
         Hat57M/LtMWAlZ92w5EaFxd1QWXFTyS+mIjm8UA/Q2hetpwYkDcbgDBu3/+SCg+3R+HU
         3azb+alvfMqeLjFLKg0nYtonxnw5+cx1fQc8HIMbVQkT3bRtXtom16sfgZgzsFFA4Nls
         fF6B1mC0IUf4SpW+te0FRA7/MfHlirYD8u+n6AZxXe4M2+N1t4ZzuCX87LTD9OdUIQ1M
         ZmLA==
X-Forwarded-Encrypted: i=1; AHgh+RozJCg9fxJSt8+cDUE+9vGpPZ7dgIZ4ZAu5j9cPskhm3KZQg4aAv22YaERVT0N33skkBj/9vuYARTGKi041@vger.kernel.org
X-Gm-Message-State: AOJu0YxyePTbJD2Oo7eDA8OZ/mW6jBX5EvzCLGJo+EEBEkwtIGN+wYtx
	4SbvGH66cXcwIjfmidIhHTmKlExHr0GxIWKns8hV8WrnWR9cRq/kAd+oSlpkDpKjtcoHHAlHORK
	OQxoa4dSWilsqR8PC+7jOQP+6/K2+UtdBkO32eIrF/ahO0QQvTuOh4wnE5dVo2b31nkjy
X-Gm-Gg: AfdE7clTa9Fe7yrFYOmDEdy/vUA7S7/jOT051QjKpKIiEj4wvDaUokOYfF3cnwkupTB
	6/np4sIgTovehuvN1zSc7Wap55+M0ALirxW7iC6vMTPnOW1IKponGvpRKMkVY95of1+7G745Gr7
	STrjYmiQ86DoIWedxRQbBg/czBrwvQP5VF+T8g1oXf3KRm1hQ9mxtkAxeEjS7UUupfW9kcVpvvh
	iu5qz1mv5HH+ckO4FUGDygSC8VQDVEpxoeReBzIfS2JBUjhSA5fwlFpm+lOEiB/dubYkX3YGFOr
	EWk5cSc4GEZ59/tAwO4KVQ7mze/RziPBxX8R3BgMvg3FpjS333UauK3pAk88yp9Tk5Jh0SB78br
	iw5teUvXGcbgOe2Dc8AgSTdWwpbjvlHJ3hZarfRX+gXFe5JK0lwIuI283qimf1MLzP+OEA2FLG5
	ijzcQX2Pn5UqD2DOlZU4rmu6rECDT6TVKYM8+K0/gjgXZL4ie0z7Kp654lEwptmkcCxoVLKgWsP
	qrrRfrbXyfBfAIyO9SG
X-Received: by 2002:a05:6102:3753:b0:604:f849:462e with SMTP id ada2fe7eead31-744dff2d5e5mr1341428137.25.1783520348349;
        Wed, 08 Jul 2026 07:19:08 -0700 (PDT)
X-Received: by 2002:a05:6102:3753:b0:604:f849:462e with SMTP id ada2fe7eead31-744dff2d5e5mr1341396137.25.1783520347888;
        Wed, 08 Jul 2026 07:19:07 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a9c4a4027sm3080829a12.29.2026.07.08.07.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:07 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:19:02 +0200
Subject: [PATCH v4 3/4] leds: pca963x: add multicolor LED class support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-monza-leds-v4-3-a7acfc524c0b@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX4HlUPgoKwOqm
 MThsHA/Qs6R1fg+LL+pbwU5B3gxVHnelab3RryRGZlo7eruVneRGZmAW6/oQkibiWP1DEYvzqu1
 5B4f6FF6FjFGkgzwbqt20bPxq11J94wIP15BoE6XZy11Bt7MfoN+eB1hC2sAHy2kGNZRjkdg8RE
 fPnkxgaME4hqO4auRwcnRHs6MP1XwpRhiUZg1hRSzr30V34MdW2OgF3mTI1IrdTclRM62h69j/p
 aCKt2hN7PRgI303St4lyXXaenGUYrveExn8xyUsRcO5pUjGTsRgViPQcrbpvF4DeeThfw6sjKaH
 umIJjzrx2gz9sqIXNIRdtI4ig9i/f1KhcAx3Rtne+3Xl2pJfykeiMA2ap8ukqvMelJQd8fTxfWW
 2VYhDfW0rhstluPGpF9NlOUn75m+dCamYwdFyym4zfhlLqCMNDH/vGsDHfAVR0CfLNJOs7byeg7
 6evwWutSoF9x9nTQ/VQ==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4e5c5d cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TXsEHxuGAXnH8Ii1pS8A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: yepGIx-ILngchQJE-BNkInUOFC7xOENV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0MCBTYWx0ZWRfX8UNTjfJS70gX
 19HumbV/4VPnVpTh4969dm2/J51lRorMqK0EnAk2Ii87yqDBb73/ic18+t+GsHm9mGG0SJH4H3N
 AW3ZGC1a5fy1m/n00FiiigXrDmSJt1s=
X-Proofpoint-GUID: yepGIx-ILngchQJE-BNkInUOFC7xOENV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080140
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117654-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 932B4727521

Allow grouping of individual PCA963x PWM channels into a single
multicolor LED device by adding support for the LED multicolor class.

A child node with sub-children is treated as a multicolor group,
others are treated as single leds, keeping full backwards compatibility.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/leds/Kconfig        |   1 +
 drivers/leds/leds-pca963x.c | 126 ++++++++++++++++++++++++++++++++++++++------
 2 files changed, 110 insertions(+), 17 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index f4a0a3c8c8705e0f10ba26584277dbb2d5eac5b5..14df88f92b12bbe43908b67f9480cf23056e27e2 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -596,6 +596,7 @@ config LEDS_PCA963X
 	tristate "LED support for PCA963x I2C chip"
 	depends on LEDS_CLASS
 	depends on I2C
+	select LEDS_CLASS_MULTICOLOR
 	help
 	  This option enables support for LEDs connected to the PCA963x
 	  LED driver chip accessed via the I2C bus. Supported
diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index e3a81c60ee27c96e5050a829523dfd43e1f0663f..f6f6bafcc2bd5bad51a3184c4cb08fc50693a0a5 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -27,6 +27,7 @@
 #include <linux/string.h>
 #include <linux/ctype.h>
 #include <linux/leds.h>
+#include <linux/led-class-multicolor.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/property.h>
@@ -101,8 +102,11 @@ struct pca963x;
 struct pca963x_led {
 	struct pca963x *chip;
 	struct led_classdev led_cdev;
+	struct led_classdev_mc mc_cdev;
+	struct mc_subled subleds[4];
 	int led_num; /* 0 .. 15 potentially */
 	bool blinking;
+	bool is_mc;
 	u8 gdc;
 	u8 gfrq;
 };
@@ -205,7 +209,7 @@ static int pca963x_power_state(struct pca963x_led *led)
 	unsigned long *leds_on = &led->chip->leds_on;
 	unsigned long cached_leds = *leds_on;
 
-	if (led->led_cdev.brightness)
+	if (led->is_mc ? led->mc_cdev.led_cdev.brightness : led->led_cdev.brightness)
 		set_bit(led->led_num, leds_on);
 	else
 		clear_bit(led->led_num, leds_on);
@@ -237,6 +241,28 @@ static int pca963x_led_set(struct led_classdev *led_cdev,
 	return ret;
 }
 
+static int pca963x_led_mc_set(struct led_classdev *led_cdev,
+			      enum led_brightness value)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
+	struct pca963x_led *led = container_of(mc_cdev, struct pca963x_led, mc_cdev);
+	unsigned int i;
+	int ret;
+
+	led_mc_calc_color_components(mc_cdev, value);
+
+	guard(mutex)(&led->chip->mutex);
+
+	for (i = 0; i < mc_cdev->num_colors; i++) {
+		led->led_num = mc_cdev->subled_info[i].channel;
+		ret = pca963x_brightness(led, mc_cdev->subled_info[i].brightness);
+		if (ret < 0)
+			return ret;
+	}
+
+	return pca963x_power_state(led);
+}
+
 static unsigned int pca963x_period_scale(struct pca963x_led *led,
 					 unsigned int val)
 {
@@ -300,6 +326,84 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
+static int pca963x_register_single_led(struct device *dev,
+					struct pca963x_led *led, u32 reg,
+					struct fwnode_handle *fwnode,
+					bool hw_blink)
+{
+	struct led_init_data init_data = {};
+	char default_label[32];
+	struct i2c_client *client = led->chip->client;
+
+	led->led_num = reg;
+	led->is_mc = false;
+	led->led_cdev.brightness_set_blocking = pca963x_led_set;
+	if (hw_blink)
+		led->led_cdev.blink_set = pca963x_blink_set;
+
+	init_data.fwnode = fwnode;
+	init_data.devicename = "pca963x";
+	snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
+		 client->adapter->nr, client->addr, reg);
+	init_data.default_label = default_label;
+
+	return devm_led_classdev_register_ext(dev, &led->led_cdev, &init_data);
+}
+
+static int pca963x_register_mc_led(struct device *dev,
+				   struct pca963x_led *led, u32 reg,
+				   struct fwnode_handle *fwnode,
+				   const struct pca963x_chipdef *chipdef)
+{
+	struct mc_subled *subleds = led->subleds;
+	unsigned int num_colors = 0;
+	struct led_init_data init_data = {};
+	char default_label[32];
+	struct i2c_client *client = led->chip->client;
+	int ret;
+
+	fwnode_for_each_child_node_scoped(fwnode, sub) {
+		u32 color, subreg;
+
+		if (num_colors >= ARRAY_SIZE(led->subleds)) {
+			dev_err(dev, "Too many sub-LEDs for node %pfw\n", fwnode);
+			return -EINVAL;
+		}
+
+		ret = fwnode_property_read_u32(sub, "reg", &subreg);
+		if (ret || subreg >= chipdef->n_leds) {
+			dev_err(dev, "Invalid 'reg' for sub-LED %pfw\n", sub);
+			return -EINVAL;
+		}
+
+		ret = fwnode_property_read_u32(sub, "color", &color);
+		if (ret) {
+			dev_err(dev, "Missing 'color' for sub-LED %pfw\n", sub);
+			return ret;
+		}
+
+		subleds[num_colors].channel = subreg;
+		subleds[num_colors].color_index = color;
+		subleds[num_colors].intensity = LED_FULL;
+		num_colors++;
+	}
+
+	led->led_num = reg;
+	led->is_mc = true;
+	led->mc_cdev.subled_info = subleds;
+	led->mc_cdev.num_colors = num_colors;
+	led->mc_cdev.led_cdev.max_brightness = LED_FULL;
+	led->mc_cdev.led_cdev.brightness_set_blocking = pca963x_led_mc_set;
+
+	init_data.fwnode = fwnode;
+	init_data.devicename = "pca963x";
+	snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
+		 client->adapter->nr, client->addr, reg);
+	init_data.default_label = default_label;
+
+	return devm_led_classdev_multicolor_register_ext(dev, &led->mc_cdev, &init_data);
+}
+
 static int pca963x_register_leds(struct i2c_client *client,
 				 struct pca963x *chip)
 {
@@ -338,9 +442,6 @@ static int pca963x_register_leds(struct i2c_client *client,
 		return ret;
 
 	device_for_each_child_node_scoped(dev, child) {
-		struct led_init_data init_data = {};
-		char default_label[32];
-
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret || reg >= chipdef->n_leds) {
 			dev_err(dev, "Invalid 'reg' property for node %pfw\n",
@@ -348,22 +449,13 @@ static int pca963x_register_leds(struct i2c_client *client,
 			return -EINVAL;
 		}
 
-		led->led_num = reg;
 		led->chip = chip;
-		led->led_cdev.brightness_set_blocking = pca963x_led_set;
-		if (hw_blink)
-			led->led_cdev.blink_set = pca963x_blink_set;
 		led->blinking = false;
 
-		init_data.fwnode = child;
-		/* for backwards compatibility */
-		init_data.devicename = "pca963x";
-		snprintf(default_label, sizeof(default_label), "%d:%.2x:%u",
-			 client->adapter->nr, client->addr, reg);
-		init_data.default_label = default_label;
-
-		ret = devm_led_classdev_register_ext(dev, &led->led_cdev,
-						     &init_data);
+		if (fwnode_get_child_node_count(child) > 0)
+			ret = pca963x_register_mc_led(dev, led, reg, child, chipdef);
+		else
+			ret = pca963x_register_single_led(dev, led, reg, child, hw_blink);
 		if (ret) {
 			dev_err(dev, "Failed to register LED for node %pfw\n",
 				child);

-- 
2.34.1


