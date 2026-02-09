Return-Path: <linux-arm-msm+bounces-92293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCc+JGTaiWlFCgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:00:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FF310F4BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 14:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A866B3006201
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 13:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22FFB372B20;
	Mon,  9 Feb 2026 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1hG/0QwN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C489837881B
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 13:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770642005; cv=none; b=JABAfmKv9CqPkqygKiBhD1wCjtblHfCbI5Cdv02aKmMR2OkiniK6PPgTjYpdsiGQghTc/RxpAR3neci5bBDhNZgfCIdM/9DA/iv+RkR1Bsc+SaKOD7bMMHN9ImG0bHoWzFqg6fstDyUAyVIdCw1iIyofKoWpAr6e3wHgqYO+164=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770642005; c=relaxed/simple;
	bh=2MqgsiRu4SRq1htjq5DiLUsuIvgBT+11Ub0TtpH3sPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lq3G+LGNVzr+jgicZzCfUA3WGBwQrnYfuJMXhCUUX+0I1B7Y8qoURtAMZzAYfZGiV2FfTUh7VlWnzKUCQ2yYeANvm5NNRhF3c7uNnGrgqVa2FY3dLfOixb3xaFfySvy7QMIH7tlXLSykAu5Z7uU0bodDuO2jjhjEVeXTqJA9VYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1hG/0QwN; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-653780e9eb3so5847647a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 05:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770642003; x=1771246803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+yEgGITR3Iw+P+BTT1l9QWyFZSeI02eVwBTOG7R5WJw=;
        b=1hG/0QwN3XEhHIv10ykVGJ9gPNHsnWtdvfw0GMrVd1rEuy5kiBZ/LXtZHhQrDY1yGN
         k25q7f2QiBeKwPrWTCv5v1RTT7Izh1FvKbH1O2n91jUjML+HCcb4rBtOufW0//i60JWc
         WsWwjoz9CxrurHZ33R4Xmyps2Xr76bbDxq0Z0Y+fEKxOg/mmSwIK7SBBppKluaLpI5fU
         i7cbDqWnZWfMWrPcELDIIgCf/8QncMi3fFIblG/Z7kWzzh0faMYcNxHcY6QbVVg9e6mA
         D0jckoJ/C9db4t8QGFipRVHL5ByILIuxlv0yDSsUZ6lRb7L03Qrp1jQKIhiii3BfL5Jt
         JdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770642003; x=1771246803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+yEgGITR3Iw+P+BTT1l9QWyFZSeI02eVwBTOG7R5WJw=;
        b=d3p1H8NuvIvCDskNQ55MUUdD0WpbHurRLVtWeESHu9lSoICeiRIMpGaDXaNZ9OGrjW
         Lf5Oi57I66ufe7bx4/FfLsJ9FonPJYx/hbqOL5sZOt/uRNm4q4Zat8ENTpl3Z3GJiQmr
         Q0Urf+pPlppHUCTxieHVpZdo8SRIWl8jzMqbwcBytRgZXbQ8kh1P9UkWRNwXwqO24rwb
         zH5Wp1F8U73pm98o4sq1Jz4o7thhptOWZeX/jNjUMYfMfB3NDjCWwtWuhHV49Dsgctse
         /miRasVKtbOnoPk9f5jG5gF8DXerXcegPE050cU6gUUcKIfTYFrpjW7BavsnLFfuQYxO
         lECQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoDTpMBLl8M72UgBkzDDr77yiKvJeh8PNvSPidYqzsv0LnTwxvplNQHfp5k7JeXlDFrzXVnU1m5pK55Tvd@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3g6jNk/bm7sVGju1sq+RHfm60jMX4QPaWS4AnClTRlYpUksm0
	0kN4gGAGa0Ta22n3mSIsEaRT3wXBMbNPnM1SDnXLHZqvOUUZE7jxxsfVP0IOKnsfzIE=
X-Gm-Gg: AZuq6aIh7VtKsGe9EZoYK3qC26S4tTz7zUH5JbJeVt1R2ME0h0bkJeKuC6lQAkajGJp
	iVuC2z0HFLcYXzfGHYeqW8EsSUd3R+bh8/DQ9QUD3UMW6Snb8eBB6Z8tjV9LOtAgvQVRBdArz66
	O1cHBThG/O3K/x17EBiN8WkYKLmtlePp0jMY9hK86nbLccIJXCtRlqEB83lpRAuFeU/4Rwvcv39
	HMt4SoASalPIhllZ0PDzVJLVj5cuonm9/0RqkCZTX3SowbUhl9hy8Yn79rOynpZrDS+EnTs+hrN
	O8XSA388S0pJ+QwkLAXDgFP57LCi3GgTRqc/CeDJ5g+RV9AESX7kWfLmpksUqO03pjOhIfqfpXr
	UK3R2Pu3tREqn/h9wM8EuKyjdlyiYBHkIPavLJ3ioXq2fSGSvf6y9QGGWDLDWWEkOoxfDeRANql
	P2mtSxSoxai338ew9oss7MMrIJiOGoKrVBypGMLjAV9kGEfEf+vfBo8EtocyAkgOB9XyaCTQ==
X-Received: by 2002:a05:6402:1e89:b0:658:cb40:6701 with SMTP id 4fb4d7f45d1cf-659841192eemr5828339a12.7.1770642000378;
        Mon, 09 Feb 2026 05:00:00 -0800 (PST)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65983ec70fdsm2803040a12.15.2026.02.09.04.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 05:00:00 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Mon, 09 Feb 2026 13:59:46 +0100
Subject: [PATCH v3 2/3] Input: aw86938 - add driver for Awinic AW86938
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-aw86938-driver-v3-2-5c79cff30492@fairphone.com>
References: <20260209-aw86938-driver-v3-0-5c79cff30492@fairphone.com>
In-Reply-To: <20260209-aw86938-driver-v3-0-5c79cff30492@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770641998; l=3891;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=2MqgsiRu4SRq1htjq5DiLUsuIvgBT+11Ub0TtpH3sPE=;
 b=evzCf87pr98l/d97pYvX4ouuFjxeOCODD+LjbBZaspFprJPW13NKrek5EZ7d9yFILvRclPidi
 1CDfGB6AxKFCxGjemeGUjOn38YttuuU59mh9vA05xe8h9GUBhocUQwo
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92293-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,fairphone.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[griffin.kroah@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fairphone.com:mid,fairphone.com:dkim,fairphone.com:email]
X-Rspamd-Queue-Id: E4FF310F4BB
X-Rspamd-Action: no action

Add support for the I2C-connected Awinic AW86938 LRA haptic driver.

The AW86938 has a similar but slightly different register layout. In
particular, the boost mode register values.
The AW86938 also has some extra features that aren't implemented
in this driver yet.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 drivers/input/misc/aw86927.c | 54 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 9 deletions(-)

diff --git a/drivers/input/misc/aw86927.c b/drivers/input/misc/aw86927.c
index 8ad361239cfe3a888628b15e4dbdeed0c9ca3d1a..678526ef2bb7da654734e8f53ad8442c556f209b 100644
--- a/drivers/input/misc/aw86927.c
+++ b/drivers/input/misc/aw86927.c
@@ -43,6 +43,12 @@
 #define AW86927_PLAYCFG1_BST_VOUT_VREFSET_MASK	GENMASK(6, 0)
 #define AW86927_PLAYCFG1_BST_8500MV		0x50
 
+#define AW86938_PLAYCFG1_REG			0x06
+#define AW86938_PLAYCFG1_BST_MODE_MASK		GENMASK(5, 5)
+#define AW86938_PLAYCFG1_BST_MODE_BYPASS	0
+#define AW86938_PLAYCFG1_BST_VOUT_VREFSET_MASK	GENMASK(4, 0)
+#define AW86938_PLAYCFG1_BST_7000MV		0x11
+
 #define AW86927_PLAYCFG2_REG			0x07
 
 #define AW86927_PLAYCFG3_REG			0x08
@@ -140,6 +146,7 @@
 #define AW86927_CHIPIDH_REG			0x57
 #define AW86927_CHIPIDL_REG			0x58
 #define AW86927_CHIPID				0x9270
+#define AW86938_CHIPID				0x9380
 
 #define AW86927_TMCFG_REG			0x5b
 #define AW86927_TMCFG_UNLOCK			0x7d
@@ -173,7 +180,13 @@ enum aw86927_work_mode {
 	AW86927_RAM_MODE,
 };
 
+enum aw86927_model {
+	AW86927,
+	AW86938,
+};
+
 struct aw86927_data {
+	enum aw86927_model model;
 	struct work_struct play_work;
 	struct device *dev;
 	struct input_dev *input_dev;
@@ -377,7 +390,7 @@ static int aw86927_play_sine(struct aw86927_data *haptics)
 		return err;
 
 	/* set gain to value lower than 0x80 to avoid distorted playback */
-	err = regmap_write(haptics->regmap, AW86927_PLAYCFG2_REG, 0x7c);
+	err = regmap_write(haptics->regmap, AW86927_PLAYCFG2_REG, 0x45);
 	if (err)
 		return err;
 
@@ -565,13 +578,26 @@ static int aw86927_haptic_init(struct aw86927_data *haptics)
 	if (err)
 		return err;
 
-	err = regmap_update_bits(haptics->regmap,
-				 AW86927_PLAYCFG1_REG,
-				 AW86927_PLAYCFG1_BST_VOUT_VREFSET_MASK,
-				 FIELD_PREP(AW86927_PLAYCFG1_BST_VOUT_VREFSET_MASK,
-					    AW86927_PLAYCFG1_BST_8500MV));
-	if (err)
-		return err;
+	switch (haptics->model) {
+	case AW86927:
+		err = regmap_update_bits(haptics->regmap,
+				AW86927_PLAYCFG1_REG,
+				AW86927_PLAYCFG1_BST_VOUT_VREFSET_MASK,
+				FIELD_PREP(AW86927_PLAYCFG1_BST_VOUT_VREFSET_MASK,
+					AW86927_PLAYCFG1_BST_8500MV));
+		if (err)
+			return err;
+		break;
+	case AW86938:
+		err = regmap_update_bits(haptics->regmap,
+				AW86938_PLAYCFG1_REG,
+				AW86938_PLAYCFG1_BST_VOUT_VREFSET_MASK,
+				FIELD_PREP(AW86938_PLAYCFG1_BST_VOUT_VREFSET_MASK,
+					AW86938_PLAYCFG1_BST_7000MV));
+		if (err)
+			return err;
+		break;
+	}
 
 	err = regmap_update_bits(haptics->regmap,
 				 AW86927_PLAYCFG3_REG,
@@ -599,6 +625,9 @@ static int aw86927_ram_init(struct aw86927_data *haptics)
 				 FIELD_PREP(AW86927_SYSCTRL3_EN_RAMINIT_MASK,
 					    AW86927_SYSCTRL3_EN_RAMINIT_ON));
 
+	/* AW86938 wants a 1ms delay here */
+	usleep_range(1000, 1500);
+
 	/* Set base address for the start of the SRAM waveforms */
 	err = regmap_write(haptics->regmap,
 			   AW86927_BASEADDRH_REG, AW86927_BASEADDRH_VAL);
@@ -717,7 +746,14 @@ static int aw86927_detect(struct aw86927_data *haptics)
 
 	chip_id = be16_to_cpu(read_buf);
 
-	if (chip_id != AW86927_CHIPID) {
+	switch (chip_id) {
+	case AW86927_CHIPID:
+		haptics->model = AW86927;
+		break;
+	case AW86938_CHIPID:
+		haptics->model = AW86938;
+		break;
+	default:
 		dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
 		return -ENODEV;
 	}

-- 
2.43.0


