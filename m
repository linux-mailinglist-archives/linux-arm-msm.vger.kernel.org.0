Return-Path: <linux-arm-msm+bounces-91058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFLbAqw2eml+4gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 17:17:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F6AA562D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 17:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D93AD3107FB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 567B630FC1B;
	Wed, 28 Jan 2026 15:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KRa7ZL4s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A08308F3B
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 15:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615488; cv=none; b=hP3HmmWkViP27khKAjWvRNBLB08rvAFeamSi5TQVnUnt/IaFt9W0qjdlootK0rvXPSNzd+mNGNAd78sIHSk8hNQmh/DAuz0C5pCwk2HRF6vqLstOiVH2wqBUjrWtpL1qomc7brsWkELEdq9hLmJG+fvW0TkU9ucqFTSMcZYAINE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615488; c=relaxed/simple;
	bh=JDOblUMv3CRigfo3XzUT9pA2bSBe1pUX+IfX4UM2YmQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZIh26ZwtASkkuBH4mXiD9Jfkqgz/Wjw6/xGDSdv5mbbxuzHy4F6WljVIwNC9Z45ZXHFT+aYD45n5sFmYtctAsoExE/HulRRongIn4MSYbLP6JgkipKvUJHduscyjJ5LhMpTfn6rQteIyhvSkoI1Bl0Si9sEgPao0Mr3XZb7+KwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KRa7ZL4s; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64b92abe63aso76971a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 07:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769615484; x=1770220284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jy/mJos/LokpB1A73skiAstLSnipJqyWtRQg1NLBe6o=;
        b=KRa7ZL4sIsqGlZ2RPUCqXlsembvEEXhaCRo1UKHJl2Dtv7IBpPa9WnUd0L2QMW0t2L
         9nLHl2bvAJwNC1kFgn9viySVa4tM7bzTJ3K9aCrue+ej4UuLkEkosMNQSuXIl9bu8iyQ
         cUoXVNg0UxAzYEhaZq7ZEFrCXIR3H0awH8nobrteaEPTbmjgSEegB+f2os9dv1ob7dLY
         9Y4xdANncLpgoJ02tbS9xsjUTXkwlWbzGPyTrTHE4Elm7nrr1+VUA6Ma28eDac14P27c
         tellhGD3VzR1eKX5M9QOHbhLdRuJbhF1kNp9aS1AU9c/eAT12Gbv+jfbyAjA+us6UgWW
         8iPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769615484; x=1770220284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jy/mJos/LokpB1A73skiAstLSnipJqyWtRQg1NLBe6o=;
        b=mHEub6DLeMNtdw1h+VxkReJoaIre72BxTux7u5EnEF/HkX6mT19LS+a5Oa3KMopY2Q
         1fFKe7f6RdaJRsi7fImmqZRePmi/jTIB1Uj41lIm5wZw+IMxOoFtW9F4FgeAM2SgcQqy
         c/kmIbL6pm9JUnEPNb1RTXuMVFg44RMT7RELARWY/bAzNdJZnl/CiCQXDA6KcdoAYHcJ
         kZqqnc26wdL4mEd+gxP9TYzWhcC7AVqCyhpFzIFJ/eVJLX5KnmIssqAgJJkTWMRJz6aC
         VcP2KZ7O080ybavnfspVfB9i6gSP3M1a0cetu8ox8csI76BWZY+es7TsP7mcNOzJA/RL
         /z7w==
X-Forwarded-Encrypted: i=1; AJvYcCVDSqdKxTJ3caa3Wy2pYyGBuvXDPICK9aDY3e3Nzj//4d0f2hBq5D6sRvHf2ZEnGl43TFcPOobR3eeJCbdW@vger.kernel.org
X-Gm-Message-State: AOJu0YyRKgweoD6QDJzSzydTUlNghv2hDAd7dsO9wSvtKGimRfN77l1P
	85iFC7gdRFCB3Rflj5E7iPi97lzv+exnP/hCJzIPRi6jkwdeAzmwHL/fcmJ5tRvp0ErdsCipd1i
	C/lKg
X-Gm-Gg: AZuq6aL+DbLkZcV2F7CIMEH9l8C4+EL3k96kr+wHbCa4Z5ZIzdASOpyynz55p5y3JI7
	x1O8wso7xbFnXUO00oDKdj9T+s3TKQSB287DaedVPieMup7pmnzA7pJBYXaUZ4geFCF/qj3h5I7
	nzecUvQCZGkztjYARgoywngF9A7E6HBO/bj3Ew1e1fwdcekwxvRYt/6ml9RACSSyuvc1c1INR03
	a45atLPLb36/7O45JWTjkBnYdRAXIW/9QEnrxEXDnQgW+7nu3oDEbCUrl55dxD7JX/bnYSgs5RD
	60HjHbmCsvZJLzAVJqHdbLCKY1Fk1wllaaH1Ny2/69lt5780dC4KGtFkL8n+yUzVz+WLl60IQkA
	MMJCM/Fzb77JxhCXrr70td41YH7y2y4ATjneC+SbhacQa8OybVoPbaWDIEEGYgtajo5lS7mONHE
	rwc4xF2WBH9ZGVFVg+HJOzdG1Wvzn2kb1h3sV7O/bylV2pHoPA35jjJbRrl9ID2hAXot9L
X-Received: by 2002:a05:6402:51cb:b0:64b:3225:b771 with SMTP id 4fb4d7f45d1cf-658a6018e43mr3846931a12.6.1769615484396;
        Wed, 28 Jan 2026 07:51:24 -0800 (PST)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469eb9fsm1727223a12.28.2026.01.28.07.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 07:51:23 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Wed, 28 Jan 2026 16:51:14 +0100
Subject: [PATCH v2 2/3] Input: aw86938 - add driver for Awinic AW86938
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-aw86938-driver-v2-2-b51ee086aaf5@fairphone.com>
References: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
In-Reply-To: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769615481; l=4691;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=JDOblUMv3CRigfo3XzUT9pA2bSBe1pUX+IfX4UM2YmQ=;
 b=et6GkIyi92KWoO/S/6DS/Hfau2CUkKGZJ27uF0md++Mep35qYbak3CGWu/+wZv+bAGxYGHu6C
 oc3J2ZgvRkbALztNnXMctfqhvGhlQY79UhWlQzfTOLAEMwx1Lewgql0
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91058-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[griffin.kroah@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,fairphone.com:dkim,fairphone.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 32F6AA562D
X-Rspamd-Action: no action

Add support for the I2C-connected Awinic AW86938 LRA haptic driver.

The AW86938 has a similar but slightly different register layout. In
particular, the boost mode register values.
The AW86938 also has some extra features that aren't implemented
in this driver yet.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 drivers/input/misc/aw86927.c | 65 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 53 insertions(+), 12 deletions(-)

diff --git a/drivers/input/misc/aw86927.c b/drivers/input/misc/aw86927.c
index 8ad361239cfe3a888628b15e4dbdeed0c9ca3d1a..28ec6e42fd452a0edf1e1b9a9614e2723c6d9f93 100644
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
@@ -717,9 +746,19 @@ static int aw86927_detect(struct aw86927_data *haptics)
 
 	chip_id = be16_to_cpu(read_buf);
 
-	if (chip_id != AW86927_CHIPID) {
-		dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
-		return -ENODEV;
+	switch (haptics->model) {
+	case AW86927:
+		if (chip_id != AW86927_CHIPID) {
+			dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
+			return -ENODEV;
+		}
+		break;
+	case AW86938:
+		if (chip_id != AW86938_CHIPID) {
+			dev_err(haptics->dev, "Unexpected CHIPID value 0x%x\n", chip_id);
+			return -ENODEV;
+		}
+		break;
 	}
 
 	return 0;
@@ -736,6 +775,7 @@ static int aw86927_probe(struct i2c_client *client)
 
 	haptics->dev = &client->dev;
 	haptics->client = client;
+	haptics->model = (enum aw86927_model)device_get_match_data(&client->dev);
 
 	i2c_set_clientdata(client, haptics);
 
@@ -825,7 +865,8 @@ static int aw86927_probe(struct i2c_client *client)
 }
 
 static const struct of_device_id aw86927_of_id[] = {
-	{ .compatible = "awinic,aw86927" },
+	{ .compatible = "awinic,aw86927", .data = (void *)AW86927 },
+	{ .compatible = "awinic,aw86938", .data = (void *)AW86938 },
 	{ /* sentinel */ }
 };
 

-- 
2.43.0


