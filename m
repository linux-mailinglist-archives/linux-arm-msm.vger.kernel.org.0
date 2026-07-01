Return-Path: <linux-arm-msm+bounces-115758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N2H6Muc+RWo49QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:23:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 209E56EFBB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 18:23:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jUKwXRhr;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fA+cAlGS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115758-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115758-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDD1E30607D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 16:16:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EF8C367F40;
	Wed,  1 Jul 2026 16:16:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B36C365A03
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 16:16:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922561; cv=none; b=t/bsSuTAl7pl3ZpgWQp1oS+UTfban4nueAijKJcrWZ8yAjNAYf9QqOKdi8i1Y4mqMAI6z4xEpAfmh0OZ2dP765HjvSsWtf0FT8716Pas16dHoozSairiJ2QIbIYUGzIuqh2nehutds0a5vYa3HN7p6dUrUcf3p5cszCfZY9Xb4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922561; c=relaxed/simple;
	bh=1y47odj+NOJ9z0mS6+ykXCLNXopAlKlTgU+V3x/sXtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vx7yPBKEatT2wIwR7VmyfmU5Tuo6cGC6HEBD2i3O5zTCkNiALerwUn44hWjYda7dgrT1nKQzRK7d6E1kmEhzlJC2ER6+sp9bM9+WhemfOntbh+e0HJ4b5g72/DEi1c5oA5Qp/9YciZ/WcfaEA62AvcXtOvMTZERjNTN5DkDeeMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUKwXRhr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fA+cAlGS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661FoB5e1552836
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 16:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=; b=jUKwXRhrs39O/E34
	cVccw/zQEGmU9bz4i0WYwvlWEavdikbIHibgzbifbVMBdkpPE3IazUhWMgE0DDS9
	uAtLiafhRVk80aKHZwkK/FReGZ48wSNSxDpl25Nuz+t/zApliIIGzG1QNQ7zC/B2
	6LlMsJnjjJDb+VEHqO4q1UCiVe08K6t5cGilfk6e75BtErhqqYTJqNDqRXEfbmh1
	VsEEWKm4HN5qShAfdttFNQYGyl7vqvNWAQrh6q977SFvZxjZPPRkOtv9IcWx7YhY
	gsNW1t220en5gEMQCIBDtjiHtucCp7Iw3jgvMeBIKTker6G05awCvujk8tIUKz8j
	xQF0Pw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f50sd1jcc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 16:15:59 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9693b69c4f4so588916241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 09:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782922558; x=1783527358; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=;
        b=fA+cAlGSlDOkNE8m6Q/duHNhvu8JleS1lRnYG/JpE83AjNheyuh7XjGxi0kxZnWTqa
         FUxESjZL0KGRc88JoXJnH5/w2RUxPEEGjbbrE02Tu/YvR/DMx1rlPFU3J1B7AxNFDqnt
         BeSzfsHSOEuR0r7Encp6QGsDcoJ3AeuxOyRqCrR0mQeZkObZ5zUHDs7AnkH9MUrtOOIi
         KHVZmbvMqTh12t5XK22WvuYWHmx/CcUCD6TOlMcheQ3rKETorPAQHkGWCyzOwgSXQoS6
         08Fvyn5AHUJD/ryqeWavpKYJ7FSyss4sTX+LiGQDRQeksn4HgmuIbOZ/7O96yy5NGfo2
         axjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922558; x=1783527358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUVrlO6McQy7XbenV1MuJ2C4u8WMipkYL6fUtxCmAXk=;
        b=FS+tTpm1UPyt49Ckf07aWevsHwNwz/DS1MZn+Vw5PPYOkuXPW5+3+/bw8Zfntij5Od
         P85/cYvRPX5K8tWDrIXtjOQV8sW/6lW6t07mU1RNXr7K9uMurdf2hVQBzyjfyC7AsTR/
         b8eaN/eAcL8PfJuslGjC43agjS+km/sRfAmFFlIQkyyYYO1yytGDW4o8xwn42ak8urWG
         zqqEk44E+45MmUbswAr6Up8hZ34lVnmgO+npCwQwWi92cHKrI1FrFslcB3Ur3K2ctWH9
         EiZAhe21WyM4WwZSshvw/bNIR6oVzIaUx0LJgpgxL7L+LiHpcxnJKcLGOn32Kl0uupdD
         ZYWA==
X-Forwarded-Encrypted: i=1; AHgh+RrvPIK9U9f8pIS7Usin+7Dr6FVfrNfwDSKan8lKUzkrCHEVL8B9SyO0rCCllhp5GkUI1nfmhkrt/wwI2wpK@vger.kernel.org
X-Gm-Message-State: AOJu0YyR/ASmW/mRO3jamnUtKjKO6ww1P4GczuRFvW7RumzkQZ813ZI7
	s1yTk0XoCI4Kq3yZPResPFdSr/UjiLrYlLXNHe6V0iVgkvM1VcxbEXm3fvZflgdKYk0ESvY+cdH
	4C7qS4n6BdoySUDqEpYSTk/V7gXJuAX8nliGgRj5tYKQuc6HYG+dsHO5kYBSyWdEMGNwt
X-Gm-Gg: AfdE7cm+E15DHwnzK+ntj1ZiYCYtL3PZ7CcDe19VIV8pFbSuAjgSfTTkBf7269KwbRP
	FhcY8n38T+x0sz/8nwmA/Gw/8bnkdVc5RmeO8NCvATMRu6p0EAyRc+r01RpKvd5jDDt8fLz+0HO
	y7syQeT9118If8Nrfet3lAc8rAMKNm2ESrIPofWOCy2oVpmCTh1DuDgu8p8YaYUe/FV7kX7/bmX
	zSXAolMbJC8lGEbcUgz05p8Slpsqu1wJ1/GzexTR1goMlsUjgEbwDpm2riSu9+k6VN0DT0EU808
	S/gOLz4wta8p1udUgvy49p007tRFedkUTFq8Orh0QdHHa8Aw3siXsdsWAIDK37q9XVUiYXBfrWq
	+kXMihe0dKV35e8V0aBu+vUgzSWVTI8myUEcZbmB3QaCLomNA5LMLARW1X2Yq8OT0PoDvym+ffd
	6Zj8/AoqZELMQX6RLHyVickCIKSxIvjV+/5Z6/LFd+XIHFTnpByGJjSkp9MKNq9f0=
X-Received: by 2002:a67:f74f:0:b0:729:3df2:1aa0 with SMTP id ada2fe7eead31-73da95b0f95mr954414137.17.1782922558129;
        Wed, 01 Jul 2026 09:15:58 -0700 (PDT)
X-Received: by 2002:a67:f74f:0:b0:729:3df2:1aa0 with SMTP id ada2fe7eead31-73da95b0f95mr954348137.17.1782922557510;
        Wed, 01 Jul 2026 09:15:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:809d:5d56:19d9:ff8b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288d1ea70sm299570266b.3.2026.07.01.09.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:15:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 18:15:52 +0200
Subject: [PATCH v2 2/3] leds: pca963x: add multicolor LED class support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-monza-leds-v2-2-c1be0b472926@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Z+3c2nRA c=1 sm=1 tr=0 ts=6a453d3f cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=TXsEHxuGAXnH8Ii1pS8A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: LIpqIRMWHjESNDBDteKkA6jUSIM88Yjg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfX32BJ4/vp3BPd
 EHm9dhr3VY4G6y2EZPFwl4Nxp88S2P9t4uJbl18eQAFixUBfdHPPq6VGe1SOawmgDJeK3sMHiA9
 /RKIiK4qkOxUVMCTtxbDh7ALPnmpPSA=
X-Proofpoint-GUID: LIpqIRMWHjESNDBDteKkA6jUSIM88Yjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE3MiBTYWx0ZWRfX5xWNv/mMcNlv
 rbUgt/F9sIKM3mH//8DTlSIwEquwS8nseHIPWbzv4xD/LWx9ieBoNAXgU7aznZKuRkd3+pNTETE
 sE4GjbjHLLrLt8FBgdNBhPgGneoHMTm+lpEmY3Jpo0W8a4dB2LUhV8YNAniso+kpJ02spQSB0it
 FgzuyGY75/lOaf0UDchvNrl6THL+2MeZejCcfTQUOscy+ngQ2HYy2ULfMBGcv3pKt8C0LOPE7yJ
 udVIvC/6E4YfWecPUC0X6EsbvHMaSrKfW2YyK08pKg3r4NPntwItaajqiMD8w/FX8S88uK7yos7
 Tbhofy3sBLENoNjy7S49+L+9DTJU3mPOL6MWkMqbhCXTEKyKESw4ZkQEyzw7YT/WGRXv0HJPvst
 NeZJtrA3RSzm1qwiVac+2qlCA2q+vdFr1tiIRvnI0RkSYzvo/nxCPSnizJOyTPtPCB63qObKCuE
 G/70hI3y4Kq/Zy5GATg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010172
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115758-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 209E56EFBB9

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


