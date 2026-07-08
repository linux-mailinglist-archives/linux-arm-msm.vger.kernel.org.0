Return-Path: <linux-arm-msm+bounces-117664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cA8kGxlfTmrKLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:30:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B87275E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:30:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=s4R5eNlJ;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117664-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117664-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9726C302BCD1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10797478E51;
	Wed,  8 Jul 2026 14:20:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95FF48BD5D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:20:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520418; cv=none; b=ods6wO/Dn+ses0AoYO5YBqCzZIcoKxPz1iyVHZbkjxJh5aWydfBNY1a4EdVpi8W3EAxYVYkW/Mi/j1vkwjWnFUU89HKn2dMXaE8CW0zXSN3u7xyNgXBUXKOLW8h1RXbz4egVjcSUgKDRwGpZY5HwIjZWeylrQSg+TN5Hpe0/308=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520418; c=relaxed/simple;
	bh=jMQz84Fwcrm8C1aXqMkUxF4g3vcEnzFavgi0MTk887k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dpWbWtMBHfZ3xIs7oQW+Y4KNoCUyNW5ecZdARIGiK00FT/pt9XeKuHO37DWsluum+U5aIirk2TVT29bAXM/EHyZ+An4bNaB9HFAd+7KkZY6FH3z8XVkX6fLQS+7VS92u24lZO6rwQoR/RAEoInnoisSOJ7bDItgAlY2GF47pN0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s4R5eNlJ; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ccf2360620so4667585ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520416; x=1784125216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=73JLQAmWuZSnNO0q42K5V2Btd42o1yjgi7/OGpCGXNY=;
        b=s4R5eNlJzNvf3C/JivgNCztzOZpnKa0fxLX+ZSfsvch0ApXSC5yNzxzcZt44R3t7zE
         x8Cv/7qAzmFKHCUC7ayvgiWEe4N4u/sOqkZve/KwvHU4Nl+8rZYU9Wlsfu1wdIoEMDYF
         fVZl2g3WnmT/zjRJpRY8x94X8HnYjLzrZKy/2rlAVJ0LbVpkUIDUArKgZFmMj11pIgzZ
         tPH3BPwubBY4peoDMvmxmf1t7Y9Xwu67P2X88leWpyG5SQeNiWmsZFFRo3hUe47sSTbR
         vwW6UOYgNC/wUY8VBmqcf7+MpMCOrUMw4BBwRCYjgzn0oJkSAkQzPAz5NRZlvNrolOpD
         I55Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520416; x=1784125216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=73JLQAmWuZSnNO0q42K5V2Btd42o1yjgi7/OGpCGXNY=;
        b=EcKoFooQ/glsaMFpPZLTTvYhZoRARrE4XHR2u/LImLXjP40cMjpebZblOzl5kP+0mo
         pYwv4Z93giq2TH+IAxsTlAmXA3mftyvyg1uAJOucBGDwplL2drfF4aEan6KhV0ObA7ti
         ijwoXKjjNSIyO96LgAfpx3sDYgCFbEkb09x+mDUT7l/YyZzGEuv75cS4eYy25J9m9yn0
         R7z+lP00QnnlM2S/1j2KbhVgDwROsFslRDKG8jLwo+JcqZJ69RAeFjKHuX3uTXITUSM9
         sXWw6nAB4n0R5XtvpyQ1rhsDoeASxhvVLNY14ueWIRjRHs1gh+ykQx3mCUo4eZj6l4rc
         aFxg==
X-Forwarded-Encrypted: i=1; AHgh+RoxtUrM83H7ZN/3TdkqQWwQF1RQ1slugPFzwZzZQ6sULM5fd2ZlAxsA9R9QJ3fhpYm88S4gwZoExnhZ6P55@vger.kernel.org
X-Gm-Message-State: AOJu0YyVGMd/9ipohKdkjqt07wl7O2IzHCwy7smPVdQB8I1vxWPvZSqx
	7Bhv8xJNM36pDkRhh9CnjHfF3Ycq69rLHR+uFpuX7i2/DEkyxHl7U3Eq
X-Gm-Gg: AfdE7cnS2AgG0TcjdbfR1KP7BqIrBjOuFFKbSREaIIKGg18ABwhncIpJHtkt7rQQ0qP
	Ydcnn6HOJ9EssqJl7ezvj8H/6mZXU7Ei7s1i/eNXTTOZaIYJs7PdfEusilvg//AL7vpSMlP8Bay
	++UpbrIqXa0i1xd+ba1TrwaAYssy5UxIuwzZ2c/efHe9YRLDPoAJi72fyuAsgk4tMnWVk5vkmtK
	KHp1ClP+olHhFxBhU4xkijaYE0w5hPfR5KK4/g4I1IHMKReImYjPMQdqjC6JJKJrkS1dhqpCss7
	niSkRKLlDZlOjfp5vM3fu5Vub14GsnDw7XJDEttqlmdh0FtkiXB3gSxeQqK1XGgU+8H1IRNI9G+
	yFYOWF7vWYM7negPJkNMN025gGaNgc9qpLazteW6mPwjQhSogjjmhXg5CLw/eCykxdRJo5SaT4/
	zAlWst6gWSAT3BwnlCS4Bl7ZIAFIB16a7qLIgo1uLCEUapYfM=
X-Received: by 2002:a17:902:fc8e:b0:2ca:ddbd:a19b with SMTP id d9443c01a7336-2ccea40b65emr28248675ad.28.1783520415954;
        Wed, 08 Jul 2026 07:20:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 09/27] ASoC: codecs: idt821034: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:16 +0700
Message-ID: <20260708141734.578926-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[diasemi.com,gmail.com,perex.cz,kernel.org,opensource.cirrus.com,collabora.com,ti.com,realtek.com,renesas.com,baylibre.com,everest-semi.com,suse.com,arndb.de,vivo.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117664-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:tiwai@suse.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:support.opensource@diasemi.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:srini@kernel.org,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:linusw@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:u.kleine-koenig@baylibre.com,m:zhangyi@everest-semi.com,m:marco.crivellari@suse.com,m:kees@kernel.org,m:sammiee5311@gmail.com,m:arnd@arndb.de,m:rongqianfeng@vivo.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:phucduc.bui@gmail.com,m:matthiasbgg@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C42B87275E0

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 - Remove temporary variables and return directly 
   from the functions.

 sound/soc/codecs/idt821034.c | 144 ++++++++++++++---------------------
 1 file changed, 57 insertions(+), 87 deletions(-)

diff --git a/sound/soc/codecs/idt821034.c b/sound/soc/codecs/idt821034.c
index 084090ccef77..387f17b5f7b3 100644
--- a/sound/soc/codecs/idt821034.c
+++ b/sound/soc/codecs/idt821034.c
@@ -7,6 +7,7 @@
 // Author: Herve Codina <herve.codina@bootlin.com>
 
 #include <linux/bitrev.h>
+#include <linux/cleanup.h>
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/slab.h>
@@ -413,12 +414,12 @@ static int idt821034_kctrl_gain_get(struct snd_kcontrol *kcontrol,
 
 	ch = IDT821034_ID_GET_CHAN(mc->reg);
 
-	mutex_lock(&idt821034->mutex);
-	if (IDT821034_ID_IS_OUT(mc->reg))
-		val = idt821034->amps.ch[ch].amp_out.gain;
-	else
-		val = idt821034->amps.ch[ch].amp_in.gain;
-	mutex_unlock(&idt821034->mutex);
+	scoped_guard(mutex, &idt821034->mutex) {
+		if (IDT821034_ID_IS_OUT(mc->reg))
+			val = idt821034->amps.ch[ch].amp_out.gain;
+		else
+			val = idt821034->amps.ch[ch].amp_in.gain;
+	}
 
 	ucontrol->value.integer.value[0] = val & mask;
 	if (invert)
@@ -456,7 +457,7 @@ static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
 
 	ch = IDT821034_ID_GET_CHAN(mc->reg);
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	if (IDT821034_ID_IS_OUT(mc->reg)) {
 		amp = &idt821034->amps.ch[ch].amp_out;
@@ -466,22 +467,18 @@ static int idt821034_kctrl_gain_put(struct snd_kcontrol *kcontrol,
 		gain_type = IDT821034_GAIN_TX;
 	}
 
-	if (amp->gain == val) {
-		ret = 0;
-		goto end;
-	}
+	if (amp->gain == val)
+		return 0;
 
 	if (!amp->is_muted) {
 		ret = idt821034_set_gain_channel(idt821034, ch, gain_type, val);
 		if (ret)
-			goto end;
+			return ret;
 	}
 
 	amp->gain = val;
-	ret = 1; /* The value changed */
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+
+	return 1;
 }
 
 static int idt821034_kctrl_mute_get(struct snd_kcontrol *kcontrol,
@@ -495,11 +492,11 @@ static int idt821034_kctrl_mute_get(struct snd_kcontrol *kcontrol,
 
 	ch = IDT821034_ID_GET_CHAN(id);
 
-	mutex_lock(&idt821034->mutex);
-	is_muted = IDT821034_ID_IS_OUT(id) ?
-			idt821034->amps.ch[ch].amp_out.is_muted :
-			idt821034->amps.ch[ch].amp_in.is_muted;
-	mutex_unlock(&idt821034->mutex);
+	scoped_guard(mutex, &idt821034->mutex) {
+		is_muted = IDT821034_ID_IS_OUT(id) ?
+				idt821034->amps.ch[ch].amp_out.is_muted :
+				idt821034->amps.ch[ch].amp_in.is_muted;
+	}
 
 	ucontrol->value.integer.value[0] = !is_muted;
 
@@ -521,7 +518,7 @@ static int idt821034_kctrl_mute_put(struct snd_kcontrol *kcontrol,
 	ch = IDT821034_ID_GET_CHAN(id);
 	is_mute = !ucontrol->value.integer.value[0];
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	if (IDT821034_ID_IS_OUT(id)) {
 		amp = &idt821034->amps.ch[ch].amp_out;
@@ -531,21 +528,17 @@ static int idt821034_kctrl_mute_put(struct snd_kcontrol *kcontrol,
 		gain_type = IDT821034_GAIN_TX;
 	}
 
-	if (amp->is_muted == is_mute) {
-		ret = 0;
-		goto end;
-	}
+	if (amp->is_muted == is_mute)
+		return 0;
 
 	ret = idt821034_set_gain_channel(idt821034, ch, gain_type,
 					 is_mute ? 0 : amp->gain);
 	if (ret)
-		goto end;
+		return ret;
 
 	amp->is_muted = is_mute;
-	ret = 1; /* The value changed */
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+
+	return 1;
 }
 
 static const DECLARE_TLV_DB_LINEAR(idt821034_gain_in, -300, 1300);
@@ -623,24 +616,20 @@ static int idt821034_power_event(struct snd_soc_dapm_widget *w,
 	struct idt821034 *idt821034 = snd_soc_component_get_drvdata(component);
 	unsigned int id = w->shift;
 	u8 power, mask;
-	int ret;
 	u8 ch;
 
 	ch = IDT821034_ID_GET_CHAN(id);
 	mask = IDT821034_ID_IS_OUT(id) ? IDT821034_CONF_PWRUP_RX : IDT821034_CONF_PWRUP_TX;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	power = idt821034_get_channel_power(idt821034, ch);
 	if (SND_SOC_DAPM_EVENT_ON(event))
 		power |= mask;
 	else
 		power &= ~mask;
-	ret = idt821034_set_channel_power(idt821034, ch, power);
-
-	mutex_unlock(&idt821034->mutex);
 
-	return ret;
+	return idt821034_set_channel_power(idt821034, ch, power);
 }
 
 static const struct snd_soc_dapm_widget idt821034_dapm_widgets[] = {
@@ -717,9 +706,9 @@ static int idt821034_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	ch = 0;
 	while (mask && ch < IDT821034_NB_CHANNEL) {
 		if (mask & 0x1) {
-			mutex_lock(&idt821034->mutex);
-			ret = idt821034_set_channel_ts(idt821034, ch, IDT821034_CH_RX, slot);
-			mutex_unlock(&idt821034->mutex);
+			scoped_guard(mutex, &idt821034->mutex)
+				ret = idt821034_set_channel_ts(idt821034, ch,
+							       IDT821034_CH_RX, slot);
 			if (ret) {
 				dev_err(dai->dev, "ch%u set tx tdm slot failed (%d)\n",
 					ch, ret);
@@ -742,9 +731,9 @@ static int idt821034_dai_set_tdm_slot(struct snd_soc_dai *dai,
 	ch = 0;
 	while (mask && ch < IDT821034_NB_CHANNEL) {
 		if (mask & 0x1) {
-			mutex_lock(&idt821034->mutex);
-			ret = idt821034_set_channel_ts(idt821034, ch, IDT821034_CH_TX, slot);
-			mutex_unlock(&idt821034->mutex);
+			scoped_guard(mutex, &idt821034->mutex)
+				ret = idt821034_set_channel_ts(idt821034, ch,
+							       IDT821034_CH_TX, slot);
 			if (ret) {
 				dev_err(dai->dev, "ch%u set rx tdm slot failed (%d)\n",
 					ch, ret);
@@ -769,9 +758,8 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct idt821034 *idt821034 = snd_soc_component_get_drvdata(dai->component);
 	u8 conf;
-	int ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	conf = idt821034_get_codec_conf(idt821034);
 
@@ -785,13 +773,10 @@ static int idt821034_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	default:
 		dev_err(dai->dev, "Unsupported DAI format 0x%x\n",
 			fmt & SND_SOC_DAIFMT_FORMAT_MASK);
-		ret = -EINVAL;
-		goto end;
+		return -EINVAL;
 	}
-	ret = idt821034_set_codec_conf(idt821034, conf);
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+
+	return idt821034_set_codec_conf(idt821034, conf);
 }
 
 static int idt821034_dai_hw_params(struct snd_pcm_substream *substream,
@@ -800,9 +785,8 @@ static int idt821034_dai_hw_params(struct snd_pcm_substream *substream,
 {
 	struct idt821034 *idt821034 = snd_soc_component_get_drvdata(dai->component);
 	u8 conf;
-	int ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	conf = idt821034_get_codec_conf(idt821034);
 
@@ -816,13 +800,10 @@ static int idt821034_dai_hw_params(struct snd_pcm_substream *substream,
 	default:
 		dev_err(dai->dev, "Unsupported PCM format 0x%x\n",
 			params_format(params));
-		ret = -EINVAL;
-		goto end;
+		return -EINVAL;
 	}
-	ret = idt821034_set_codec_conf(idt821034, conf);
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+
+	return idt821034_set_codec_conf(idt821034, conf);
 }
 
 static const unsigned int idt821034_sample_bits[] = {8};
@@ -897,11 +878,11 @@ static int idt821034_reset_audio(struct idt821034 *idt821034)
 	int ret;
 	u8 i;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	ret = idt821034_set_codec_conf(idt821034, 0);
 	if (ret)
-		goto end;
+		return ret;
 
 	for (i = 0; i < IDT821034_NB_CHANNEL; i++) {
 		idt821034->amps.ch[i].amp_out.gain = IDT821034_GAIN_OUT_INIT_RAW;
@@ -909,24 +890,21 @@ static int idt821034_reset_audio(struct idt821034 *idt821034)
 		ret = idt821034_set_gain_channel(idt821034, i, IDT821034_GAIN_RX,
 						 idt821034->amps.ch[i].amp_out.gain);
 		if (ret)
-			goto end;
+			return ret;
 
 		idt821034->amps.ch[i].amp_in.gain = IDT821034_GAIN_IN_INIT_RAW;
 		idt821034->amps.ch[i].amp_in.is_muted = false;
 		ret = idt821034_set_gain_channel(idt821034, i, IDT821034_GAIN_TX,
 						 idt821034->amps.ch[i].amp_in.gain);
 		if (ret)
-			goto end;
+			return ret;
 
 		ret = idt821034_set_channel_power(idt821034, i, 0);
 		if (ret)
-			goto end;
+			return ret;
 	}
 
-	ret = 0;
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+	return 0;
 }
 
 static int idt821034_component_probe(struct snd_soc_component *component)
@@ -965,7 +943,7 @@ static int idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
 	u8 slic_raw;
 	int ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	slic_raw = idt821034_get_written_slic_raw(idt821034, ch);
 	if (val)
@@ -974,8 +952,6 @@ static int idt821034_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
 		slic_raw &= ~mask;
 	ret = idt821034_write_slic_raw(idt821034, ch, slic_raw);
 
-	mutex_unlock(&idt821034->mutex);
-
 	if (ret)
 		dev_err(&idt821034->spi->dev, "set gpio %d (%u, 0x%x) failed (%d)\n",
 			offset, ch, mask, ret);
@@ -991,9 +967,8 @@ static int idt821034_chip_gpio_get(struct gpio_chip *c, unsigned int offset)
 	u8 slic_raw;
 	int ret;
 
-	mutex_lock(&idt821034->mutex);
-	ret = idt821034_read_slic_raw(idt821034, ch, &slic_raw);
-	mutex_unlock(&idt821034->mutex);
+	scoped_guard(mutex, &idt821034->mutex)
+		ret = idt821034_read_slic_raw(idt821034, ch, &slic_raw);
 	if (ret) {
 		dev_err(&idt821034->spi->dev, "get gpio %d (%u, 0x%x) failed (%d)\n",
 			offset, ch, mask, ret);
@@ -1015,9 +990,8 @@ static int idt821034_chip_get_direction(struct gpio_chip *c, unsigned int offset
 	struct idt821034 *idt821034 = gpiochip_get_data(c);
 	u8 slic_dir;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 	slic_dir = idt821034_get_slic_conf(idt821034, ch);
-	mutex_unlock(&idt821034->mutex);
 
 	return slic_dir & mask ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
 }
@@ -1034,7 +1008,7 @@ static int idt821034_chip_direction_input(struct gpio_chip *c, unsigned int offs
 	if (mask & ~(IDT821034_SLIC_IO1_IN | IDT821034_SLIC_IO0_IN))
 		return -EPERM;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	slic_conf = idt821034_get_slic_conf(idt821034, ch) | mask;
 
@@ -1044,7 +1018,6 @@ static int idt821034_chip_direction_input(struct gpio_chip *c, unsigned int offs
 			offset, ch, mask, ret);
 	}
 
-	mutex_unlock(&idt821034->mutex);
 	return ret;
 }
 
@@ -1060,7 +1033,7 @@ static int idt821034_chip_direction_output(struct gpio_chip *c, unsigned int off
 	if (ret)
 		return ret;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	slic_conf = idt821034_get_slic_conf(idt821034, ch) & ~mask;
 
@@ -1070,7 +1043,6 @@ static int idt821034_chip_direction_output(struct gpio_chip *c, unsigned int off
 			offset, ch, mask, ret);
 	}
 
-	mutex_unlock(&idt821034->mutex);
 	return ret;
 }
 
@@ -1079,24 +1051,22 @@ static int idt821034_reset_gpio(struct idt821034 *idt821034)
 	int ret;
 	u8 i;
 
-	mutex_lock(&idt821034->mutex);
+	guard(mutex)(&idt821034->mutex);
 
 	/* IO0 and IO1 as input for all channels and output IO set to 0 */
 	for (i = 0; i < IDT821034_NB_CHANNEL; i++) {
 		ret = idt821034_set_slic_conf(idt821034, i,
 					      IDT821034_SLIC_IO1_IN | IDT821034_SLIC_IO0_IN);
 		if (ret)
-			goto end;
+			return ret;
 
 		ret = idt821034_write_slic_raw(idt821034, i, 0);
 		if (ret)
-			goto end;
+			return ret;
 
 	}
-	ret = 0;
-end:
-	mutex_unlock(&idt821034->mutex);
-	return ret;
+
+	return 0;
 }
 
 static int idt821034_gpio_init(struct idt821034 *idt821034)
-- 
2.43.0


