Return-Path: <linux-arm-msm+bounces-113555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yIeHIa98MmrO0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113555-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:53:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B4E698AF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:53:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=btBvaFNq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113555-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113555-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CB2030EC518
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CE13F7873;
	Wed, 17 Jun 2026 10:35:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D7963B8BC6
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:35:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692513; cv=none; b=iRy9acOFAEQw2JJWjt+pLSyZPqxnDuHm8PumkIEyDC70Zhjfxe+grJPgCvOs1Sr74HTT0e+m3SQRl8oWb1NmwYyOka0EumCcHP3u0i+sFMyesZPaIQG8oTcF9myAW5SkUR6Z9ZmcM8wK9QNqYmFX6UVkkrcek0I7SMYjprdCOJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692513; c=relaxed/simple;
	bh=/BUiGZCaFF/I2ZqD3HFWMUHI08rbw50+h7/5RkVF/9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dAIIldWCKX2kkLlpZeiHDmJ4GVBJhVcouk/Ysc9hE+c7uNEOsJAZaYdIgdsqfoSScBlezrNu7vXBlQaomGMnS1KmccZYuX1zDUbiXDZBwqn0OFU4Xt+UFucWzCB3y2ky5tbHx+9dJRTv426dcs181ujHujW7/ej++O9TG6XKqUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btBvaFNq; arc=none smtp.client-ip=74.125.82.177
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bcc877b4cso1623566eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692511; x=1782297311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdzEN4bZnmzSBjv8BhXg4StffmGXntUcdqfeQDcKmZ0=;
        b=btBvaFNq7/luemawJ1HrW87bc7FhKh+hZUQzZFb4hQPGVKRMirfMOnTuQ+VadIBjL9
         srzJKraeav4xlGUj+S22MNO0o77dVCE/dPtHhm5IDw5KLq6346Ff4Kvj5ceqv8HwpyJE
         sHgZ0NygkMocTqWnobgleohqeGVCXk2V9CBQQmHzMhV1BV3YVS0EZOxNKLZH7AIzengh
         BGZDwAuJrJsNAgA/qJH+XXUp0F/I/5JoBJwPKlYF2Uf/lTQxUtnzVzkbDRENF6uFtZfD
         Q78zJcNvYMXmXsbqhxLbXaLnPEC0dgO4r9kszm0G5xtCyNI68vLuXGZD9bA18SM+zyBg
         sLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692511; x=1782297311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RdzEN4bZnmzSBjv8BhXg4StffmGXntUcdqfeQDcKmZ0=;
        b=ssv8lKoAVLm90I9yNZ+/t+DRBhY8cE0oUm6J1y5R53Kjtpfp+Tq+Y1ycn0ala9Ak/F
         8xZp+FxYZSxYBPlXiN1qoZllWyBcFjjWBh2yFf5zsZI0w2hUfehqIR7j/vgSuOxsbJIL
         CIOxksgS2abXwOOIwKcIB9FViqqgQfNIDQvTZdvzwO+whyR82bEwKCQkJahOv2K60WWb
         GDtDgUBuVAG2ibkZ5YE7qQtoTSXTe7Q+A+Kwtf2WzrfIoS5mwU339JN/QqV68xi9GRs6
         6OkQYIlj7h9pmIofqfQc2G2eFbisfwUBg7WtVq9CgV/K0YpCYFfOQfVxXost2XkFujFM
         2HPw==
X-Forwarded-Encrypted: i=1; AFNElJ/vwxVRyIIkrqaU3BLPRE1pYhhF8DQRgfUSBhseTE/wz6Yw3gWBjR5819AoBxulgdsmGWPp8zaEuAxlkFbr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz/R9PS3aZzvSlUc09QtVr7U1WtAsqhDQ1O2j5ynkgqT8JZ/ck
	QILAE9A+/xUoujqXKFvGNUNY/sy5zQq7QKWmYKWOJCrj1q/LlFera/c3
X-Gm-Gg: AfdE7cnAW16zq6R9nMPMjSIBKm//0uZvr7AbCXtPTLS0N81YHuYOU8R83/xoq1yosuv
	K9PakQHytucAtbR577NHHWD6mYx41ofTq3huCgbk6ZHLdO05RTkgodl+wxtRAEpuFa/GfIJK3uM
	FoX/HtMOFtTw3OYT/z2Ex5AX8bP9R28/49nWyAZP+GctTQwZ+SqziZD76jpEQgIn9AVLM/4LKuS
	4LXkQbOjBfmaxuOVqF+7bxKbPzEE02000Rcga/iMSGMwo1PvuyFKqjl+VY9aDui7wY1obeBWhts
	OWaW9dY0A/16Sih3C8uueq6JO4JTQs/Wf+oo2GF7oacfKNj3QYSm2kXn/oxhSxD+eGy4xHMJMxR
	5o8E/wLqZYPF3uCnr7WW2m4J/o1E1arzWAbcJmHFAhb/uY3q683xI2A4tcRVVn+nkcA4+ef9CKo
	zNje8f3x0RqHWuMtRqORiA8Hj4k0F1j4ftXdsePVtO/tYrnVU=
X-Received: by 2002:a05:7300:80d2:b0:2f1:496c:94bf with SMTP id 5a478bee46e88-30bca066cccmr1800405eec.16.1781692510527;
        Wed, 17 Jun 2026 03:35:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:10 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 14/78] ASoC: codecs: cs42l42: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:31 +0700
Message-ID: <20260617103235.449609-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-113555-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:lgirdwood@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:cychiang@chromium.org,m:tzungbi@kernel.org,m:groeck@chromium.org,m:bleung@chromium.org,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:povik+lin@cutebit.org,m:ckeepax@opensource.cirrus.com,m:support.opensource@diasemi.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:srini@kernel.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:lars@metafoo.de,m:nuno.sa@analog.com,m:steven.eckhoff.opensource@gmail.com,m:patches@opensource.cirrus.com,m:chrome-platform@lists.linux.dev,m:asahi@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:phucduc.bui@gmail.com,m:povik@cutebit.org,m:matthiasbgg@gmail.com,m:steveneckhoffopensource@g
 mail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,chromium.org,kernel.org,cirrus.com,opensource.cirrus.com,cutebit.org,diasemi.com,foursemi.com,bootlin.com,collabora.com,ti.com,realtek.com,metafoo.de,analog.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lin];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 81B4E698AF0

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l42.c | 222 ++++++++++++++++++-------------------
 1 file changed, 111 insertions(+), 111 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 2652a639a79a..f9e02cc4e9f1 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -565,7 +565,7 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l42_private *cs42l42 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l42->irq_lock);
+	guard(mutex)(&cs42l42->irq_lock);
 	cs42l42->jack = jk;
 
 	if (jk) {
@@ -581,7 +581,6 @@ static int cs42l42_set_jack(struct snd_soc_component *component, struct snd_soc_
 			break;
 		}
 	}
-	mutex_unlock(&cs42l42->irq_lock);
 
 	return 0;
 }
@@ -1667,117 +1666,118 @@ irqreturn_t cs42l42_irq_thread(int irq, void *data)
 	unsigned int current_plug_status;
 	unsigned int current_button_status;
 	unsigned int i;
+	irqreturn_t ret = IRQ_HANDLED;
 
 	pm_runtime_get_sync(cs42l42->dev);
-	mutex_lock(&cs42l42->irq_lock);
-	if (cs42l42->suspended || !cs42l42->init_done) {
-		mutex_unlock(&cs42l42->irq_lock);
-		pm_runtime_put_autosuspend(cs42l42->dev);
-		return IRQ_NONE;
-	}
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		if (cs42l42->suspended || !cs42l42->init_done) {
+			ret = IRQ_NONE;
+			break;
+		}
 
-	/* Read sticky registers to clear interurpt */
-	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
-		regmap_read(cs42l42->regmap, irq_params_table[i].status_addr,
-				&(stickies[i]));
-		regmap_read(cs42l42->regmap, irq_params_table[i].mask_addr,
-				&(masks[i]));
-		stickies[i] = stickies[i] & (~masks[i]) &
-				irq_params_table[i].mask;
-	}
+		/* Read sticky registers to clear interrupt */
+		for (i = 0; i < ARRAY_SIZE(stickies); i++) {
+			regmap_read(cs42l42->regmap, irq_params_table[i].status_addr,
+					&(stickies[i]));
+			regmap_read(cs42l42->regmap, irq_params_table[i].mask_addr,
+					&(masks[i]));
+			stickies[i] = stickies[i] & (~masks[i]) &
+					irq_params_table[i].mask;
+		}
 
-	/* Read tip sense status before handling type detect */
-	current_plug_status = (stickies[11] &
-		(CS42L42_TS_PLUG_MASK | CS42L42_TS_UNPLUG_MASK)) >>
-		CS42L42_TS_PLUG_SHIFT;
+		/* Read tip sense status before handling type detect */
+		current_plug_status = (stickies[11] &
+			(CS42L42_TS_PLUG_MASK | CS42L42_TS_UNPLUG_MASK)) >>
+			CS42L42_TS_PLUG_SHIFT;
 
-	/* Read button sense status */
-	current_button_status = stickies[7] &
-		(CS42L42_M_DETECT_TF_MASK |
-		CS42L42_M_DETECT_FT_MASK |
-		CS42L42_M_HSBIAS_HIZ_MASK);
+		/* Read button sense status */
+		current_button_status = stickies[7] &
+			(CS42L42_M_DETECT_TF_MASK |
+			CS42L42_M_DETECT_FT_MASK |
+			CS42L42_M_HSBIAS_HIZ_MASK);
 
-	/*
-	 * Check auto-detect status. Don't assume a previous unplug event has
-	 * cleared the flags. If the jack is unplugged and plugged during
-	 * system suspend there won't have been an unplug event.
-	 */
-	if ((~masks[5]) & irq_params_table[5].mask) {
-		if (stickies[5] & CS42L42_HSDET_AUTO_DONE_MASK) {
-			cs42l42_process_hs_type_detect(cs42l42);
-			switch (cs42l42->hs_type) {
-			case CS42L42_PLUG_CTIA:
-			case CS42L42_PLUG_OMTP:
-				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADSET,
-						    SND_JACK_HEADSET |
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
-				break;
-			case CS42L42_PLUG_HEADPHONE:
-				snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADPHONE,
-						    SND_JACK_HEADSET |
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
-				break;
-			default:
-				break;
+		/*
+		 * Check auto-detect status. Don't assume a previous unplug event has
+		 * cleared the flags. If the jack is unplugged and plugged during
+		 * system suspend there won't have been an unplug event.
+		 */
+		if ((~masks[5]) & irq_params_table[5].mask) {
+			if (stickies[5] & CS42L42_HSDET_AUTO_DONE_MASK) {
+				cs42l42_process_hs_type_detect(cs42l42);
+				switch (cs42l42->hs_type) {
+				case CS42L42_PLUG_CTIA:
+				case CS42L42_PLUG_OMTP:
+					snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADSET,
+							    SND_JACK_HEADSET |
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+					break;
+				case CS42L42_PLUG_HEADPHONE:
+					snd_soc_jack_report(cs42l42->jack, SND_JACK_HEADPHONE,
+							    SND_JACK_HEADSET |
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+					break;
+				default:
+					break;
+				}
+				dev_dbg(cs42l42->dev, "Auto detect done (%d)\n", cs42l42->hs_type);
 			}
-			dev_dbg(cs42l42->dev, "Auto detect done (%d)\n", cs42l42->hs_type);
 		}
-	}
 
-	/* Check tip sense status */
-	if ((~masks[11]) & irq_params_table[11].mask) {
-		switch (current_plug_status) {
-		case CS42L42_TS_PLUG:
-			if (cs42l42->plug_state != CS42L42_TS_PLUG) {
-				cs42l42->plug_state = CS42L42_TS_PLUG;
-				cs42l42_init_hs_type_detect(cs42l42);
-			}
-			break;
+		/* Check tip sense status */
+		if ((~masks[11]) & irq_params_table[11].mask) {
+			switch (current_plug_status) {
+			case CS42L42_TS_PLUG:
+				if (cs42l42->plug_state != CS42L42_TS_PLUG) {
+					cs42l42->plug_state = CS42L42_TS_PLUG;
+					cs42l42_init_hs_type_detect(cs42l42);
+				}
+				break;
 
-		case CS42L42_TS_UNPLUG:
-			if (cs42l42->plug_state != CS42L42_TS_UNPLUG) {
-				cs42l42->plug_state = CS42L42_TS_UNPLUG;
-				cs42l42_cancel_hs_type_detect(cs42l42);
+			case CS42L42_TS_UNPLUG:
+				if (cs42l42->plug_state != CS42L42_TS_UNPLUG) {
+					cs42l42->plug_state = CS42L42_TS_UNPLUG;
+					cs42l42_cancel_hs_type_detect(cs42l42);
 
-				snd_soc_jack_report(cs42l42->jack, 0,
-						    SND_JACK_HEADSET |
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+					snd_soc_jack_report(cs42l42->jack, 0,
+							    SND_JACK_HEADSET |
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
 
-				dev_dbg(cs42l42->dev, "Unplug event\n");
-			}
-			break;
+					dev_dbg(cs42l42->dev, "Unplug event\n");
+				}
+				break;
 
-		default:
-			cs42l42->plug_state = CS42L42_TS_TRANS;
+			default:
+				cs42l42->plug_state = CS42L42_TS_TRANS;
+			}
 		}
-	}
 
-	/* Check button detect status */
-	if (cs42l42->plug_state == CS42L42_TS_PLUG && ((~masks[7]) & irq_params_table[7].mask)) {
-		if (!(current_button_status &
-			CS42L42_M_HSBIAS_HIZ_MASK)) {
-
-			if (current_button_status & CS42L42_M_DETECT_TF_MASK) {
-				dev_dbg(cs42l42->dev, "Button released\n");
-				snd_soc_jack_report(cs42l42->jack, 0,
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
-			} else if (current_button_status & CS42L42_M_DETECT_FT_MASK) {
-				snd_soc_jack_report(cs42l42->jack,
-						    cs42l42_handle_button_press(cs42l42),
-						    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-						    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+		/* Check button detect status */
+		if (cs42l42->plug_state == CS42L42_TS_PLUG &&
+			((~masks[7]) & irq_params_table[7].mask)) {
+			if (!(current_button_status &
+				CS42L42_M_HSBIAS_HIZ_MASK)) {
+
+				if (current_button_status & CS42L42_M_DETECT_TF_MASK) {
+					dev_dbg(cs42l42->dev, "Button released\n");
+					snd_soc_jack_report(cs42l42->jack, 0,
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+				} else if (current_button_status & CS42L42_M_DETECT_FT_MASK) {
+					snd_soc_jack_report(cs42l42->jack,
+							    cs42l42_handle_button_press(cs42l42),
+							    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+							    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+				}
 			}
 		}
 	}
 
-	mutex_unlock(&cs42l42->irq_lock);
 	pm_runtime_put_autosuspend(cs42l42->dev);
 
-	return IRQ_HANDLED;
+	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(cs42l42_irq_thread, "SND_SOC_CS42L42_CORE");
 
@@ -2163,22 +2163,22 @@ int cs42l42_suspend(struct device *dev)
 	 * future interrupts. This ensures a safe disable if the interrupt
 	 * is shared.
 	 */
-	mutex_lock(&cs42l42->irq_lock);
-	cs42l42->suspended = true;
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		cs42l42->suspended = true;
 
-	/* Save register values that will be overwritten by shutdown sequence */
-	for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i) {
-		regmap_read(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, &reg);
-		save_regs[i] = (u8)reg;
-	}
+		/* Save register values that will be overwritten by shutdown sequence */
+		for (i = 0; i < ARRAY_SIZE(cs42l42_shutdown_seq); ++i) {
+			regmap_read(cs42l42->regmap, cs42l42_shutdown_seq[i].reg, &reg);
+			save_regs[i] = (u8)reg;
+		}
 
-	/* Shutdown codec */
-	regmap_multi_reg_write(cs42l42->regmap,
-			       cs42l42_shutdown_seq,
-			       ARRAY_SIZE(cs42l42_shutdown_seq));
+		/* Shutdown codec */
+		regmap_multi_reg_write(cs42l42->regmap,
+				       cs42l42_shutdown_seq,
+				       ARRAY_SIZE(cs42l42_shutdown_seq));
 
-	/* All interrupt sources are now disabled */
-	mutex_unlock(&cs42l42->irq_lock);
+		/* All interrupt sources are now disabled */
+	}
 
 	/* Wait for power-down complete */
 	msleep(CS42L42_PDN_DONE_TIME_MS);
@@ -2250,13 +2250,13 @@ void cs42l42_resume_restore(struct device *dev)
 	regcache_cache_only(cs42l42->regmap, false);
 	regcache_mark_dirty(cs42l42->regmap);
 
-	mutex_lock(&cs42l42->irq_lock);
-	/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
-	regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
-	regcache_sync(cs42l42->regmap);
+	scoped_guard(mutex, &cs42l42->irq_lock) {
+		/* Sync LATCH_TO_VP first so the VP domain registers sync correctly */
+		regcache_sync_region(cs42l42->regmap, CS42L42_MIC_DET_CTL1, CS42L42_MIC_DET_CTL1);
+		regcache_sync(cs42l42->regmap);
 
-	cs42l42->suspended = false;
-	mutex_unlock(&cs42l42->irq_lock);
+		cs42l42->suspended = false;
+	}
 
 	dev_dbg(dev, "System resumed\n");
 }
-- 
2.43.0


