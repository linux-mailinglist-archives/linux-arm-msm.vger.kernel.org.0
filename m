Return-Path: <linux-arm-msm+bounces-109680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJ6WDs5hFGrsMwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 16:50:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 858AA5CBF0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 16:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA73A3037DD0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C9F23EDE44;
	Mon, 25 May 2026 14:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHrBesYQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EB53B47CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 14:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779720454; cv=none; b=Kjl/OydlPSDJxvgMAEhPiJzGacbjFrgglkYW+eWVb0TAdGt1yVXH5Q8qA5CBb9KfLc+Sh0dDaxvOp8qShV2BSX10s/NH3DSc2Ev9U1JJq+WVLjxX2gdX0dIAqWx3qDyBBYHVtHIgXcp9zmLRTGXAJ51JY+vBEdHsJUPV40BLJUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779720454; c=relaxed/simple;
	bh=J1/LbVdtBZ+LOAFAQJmwliG2jdxMbt8JaagyM4ndmvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vEAQI3ildlrFyc/JVp/DuwdNpezs3VefV+pqCg8RrRis/XOZVkTfcLbwEmwhnLGS2etZGks2hSWB3lm0uEbx/oX52/4WbMvWiYN012f/6akPQEZbjTTQ1e6IVYg428F1QAqbOQkaxN9z4JPGwIByL0M+OWpusiykqt7eYTqbt30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHrBesYQ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36a35e4eefeso3075757a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 07:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720452; x=1780325252; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCToqKFCbrUX7FSNvgPMJdWqTINioLrARjrzWOT0nyY=;
        b=JHrBesYQRaI5e4WC2b9ogmODLsFEjp7JtJD5RtSokDayoX/n6TfDtV9wLkQHob6eYK
         EQsDldfFFXOWxZo8mJOEvYmKJzWy502c1rC0l9s+dcOf0xLcVU5tphZg9IhgfxQ1xoR3
         OuuBYDFfJe3z6b/FId/yHfJn0CZ1KcPsGJ05AeclJPrgZqzdEY/7zYlNPVZr363Q0mEi
         6ABSPEY6N2wgGNj+oYphiyGSPu47u4IyzG8dslqRcS7cb2bJDS+k40r1DiiUU2/Rm286
         Ma4rpn++bP2t1eEVW6ogN1Vx9x/jo8g5HdG6P7D5uzf28WyYMLOOW94GfVwMnDzwUG+y
         pLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720452; x=1780325252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wCToqKFCbrUX7FSNvgPMJdWqTINioLrARjrzWOT0nyY=;
        b=Zu4WKEuUHCSIwzadBAafAWh/vxU/ZHBppQ/twovflGAHRr2c/72HUYhpPzeKw7UgmH
         6vW8IKAXP5TmIT/tfn0aiU8Yhn8ikAQEz/6bKlrmvs/eGmDSP7yi4IYLRlfD6jL7ckGS
         PMLSbFhhfSiRKUceiekbcRpjOz7uMBTlvOMKj40U615xbtlcBlyi2M1Ywdkms3rQuGQ9
         VK1TJ97N3J9lSZTdT/7i5dn5+X6/ANc2TYanpGy7SH6+/6aLz+3DuJ7GOMifNtnA2skQ
         flmlcVX9wJL6a47GLnnduwQg8jTjBUVL6Hztv9kW8EvzUp1uuVzMoZJFMQfc9wHIG8M2
         TTAw==
X-Forwarded-Encrypted: i=1; AFNElJ9wRpjkKJwM0a/UE8nt/lJqP0upLXTjGOJFtc+uwknI8ScMrnlMYUcFXohTqUKLloJ/iA8ovBVEMD1DREpD@vger.kernel.org
X-Gm-Message-State: AOJu0YwqtJnWhWtyPvCReMWipMO1GcRRltg2qn38S4FXQHQRA3m/k/9s
	46F72mMFU88uN+2YbKU3+X+9uZ2sP4UcuCXmnJisAkRaHzkYQb9HBXBq
X-Gm-Gg: Acq92OER1Zx+V2NWLVeMN4SZSTm6UQRhL1u7JGaYmxUEqp2CfZ8MT/X4ksTUpv4c3yv
	HQDKt3nVSjFtYB4d8xxSiwX1auAXS4vnKapmCIKKq2hFfbnzOqrHQucVC76ihZSmBG0/vCLM7/9
	vAI+bnW/qiZX/gU8+DXkmGgdj5P+aNO5kfM29t1yaEGIp/FzYgRygVsHwLAFw8RLBBPgonuVS/k
	Dnld6DEoiqJOyet/jvuXIsneijflWxAfFz/sfW768OXQtSsn3G2VBkyXnKDNQ0ijWTFAPQZU1XD
	jJUhIrMIkKygEMUWcVbsTLjQSZ8sze6rmC4KQk9DBpkNKoJIQp/M9ZFJvfkVKHfSeH+Xi7tDsaF
	016Z9x/0FFDtf5/f3Pct4/Q1/ANAKIzppxZKS//1LxRxQtGl7QO8ZwP9f1hs3wrVZ2Fqoafp3g0
	4GFEmDijaAt+QvHm/SvrIRIg7HfGR83+XKRmk03ss=
X-Received: by 2002:a17:90b:2f88:b0:369:a962:8cd7 with SMTP id 98e67ed59e1d1-36a6749afa1mr15044923a91.12.1779720452269;
        Mon, 25 May 2026 07:47:32 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:31 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 2/6] leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant startup pulse
Date: Mon, 25 May 2026 22:46:08 +0800
Message-ID: <20260525144629.498630-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,ucw.cz,kernel.org,amd.com,sntech.de,vger.kernel.org,lists.infradead.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-109680-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,lunn.ch,bootlin.com,gmail.com,mailoo.org,163.com,arm.com,glider.be,linaro.org,sartura.hr];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jerrysteve1101@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	NEURAL_HAM(-0.00)[-0.996];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,lumissil.com:url]
X-Rspamd-Queue-Id: 858AA5CBF0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

1. Per IS31FL319x datasheet [1], the hardware shutdown pin (SDB) is
active-low.

Fix incorrect initial GPIO level to properly release the chip from shutdown
state.

2. According to datasheet [1] definition:
  Shutdown mode can either be used as a means of
  reducing power consumption or generating a flashing
  display (repeatedly entering and leaving shutdown
  mode). During shutdown mode all registers retain their
  data.
shutdown mode does NOT perform chip reset.A dedicated software reset is
already implemented in driver by writing 0 to reset chip.

Remove redundant unnecessary toggling of the shutdown GPIO.

[1] https://lumissil.com/assets/pdf/core/IS31FL3193_DS.pdf

Fixes: dddb4e38c6ba ("leds: is31fl319x: Add shutdown pin and generate a 5ms low pulse when startup")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 drivers/leds/leds-is31fl319x.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-is31fl319x.c b/drivers/leds/leds-is31fl319x.c
index e411cee06dab..41087ed262cb 100644
--- a/drivers/leds/leds-is31fl319x.c
+++ b/drivers/leds/leds-is31fl319x.c
@@ -396,7 +396,10 @@ static int is31fl319x_parse_fw(struct device *dev, struct is31fl319x_chip *is31)
 	int count;
 	int ret;
 
-	is31->shutdown_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_HIGH);
+	/* Driving this GPIO line low (in fact high) takes the chip out of shutdown,
+	 * as it is flagged as GPIO_ACTIVE_LOW in provider (such as the device tree).
+	 */
+	is31->shutdown_gpio = devm_gpiod_get_optional(dev, "shutdown", GPIOD_OUT_LOW);
 	if (IS_ERR(is31->shutdown_gpio))
 		return dev_err_probe(dev, PTR_ERR(is31->shutdown_gpio),
 				     "Failed to get shutdown gpio\n");
@@ -506,12 +509,6 @@ static int is31fl319x_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
-	if (is31->shutdown_gpio) {
-		gpiod_direction_output(is31->shutdown_gpio, 0);
-		mdelay(5);
-		gpiod_direction_output(is31->shutdown_gpio, 1);
-	}
-
 	is31->client = client;
 	is31->regmap = devm_regmap_init_i2c(client, is31->cdef->is31fl319x_regmap_config);
 	if (IS_ERR(is31->regmap))
-- 
2.54.0


