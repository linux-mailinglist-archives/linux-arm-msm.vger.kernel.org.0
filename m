Return-Path: <linux-arm-msm+bounces-117658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VtGqBXlfTmrvLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:32:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BD3727636
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:32:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RHnIz9ik;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117658-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117658-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 54381305E1EF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:20:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C569E478868;
	Wed,  8 Jul 2026 14:19:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72C847A0A1
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:19:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520369; cv=none; b=ifjn0sfcX9RTcd+tThPcwJf7lHyDhzaWpCRhdiaoFB6stbImZ4r0c2q1lP1LbX4qMjVpq1rOiOm9BJEKr8OzjzfP6huWsRNckFIifZUczvNOuJNQYEoJEPVQM0GIM4tVRY+fgap8/EYuOZEkVi60roivmQoNMfVXk+3NYVqqxgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520369; c=relaxed/simple;
	bh=vGG3xbNRD9aTcWhmHrqO23PJ1N/lJS4R0ZsiliefWlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EnOhapmCCMQIp2/qd/Eo5Tv6j5oRbtHiYD1DGuUBSkLIG3MBBHQHHC2QL75lZkhzsqd6SeHqcEW6djNBx+VE7y31ric06jbuUxarZnd0yHM4yRKH3JGU3w4RYohIFJnUHv48mNnGJQpf611mhqyuI10iv72h/eazOOK6RDXkmRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RHnIz9ik; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cace91f112so8237215ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520367; x=1784125167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=;
        b=RHnIz9ikvYpo7/5m3Lv/wD+hLKgADmCSXXATNl/tXz7CK/OfN84PViBiesv4tV3GkK
         Bvd8/m4VotMI1kZ9PR/HQZscBmNBb92y0arzgyJxOjOxGkx2Xux2UN5T8RYINsppp0u8
         FqfFhF84k4VhLfISjtvyzlucP3C4eVtznDWk6x4wlY03evVIyzqu1/QY//z+7+uYB0nS
         iC7Z1ONqDWfPSLXYS0bMCMneEgqzddSGkuqUN9mnja0QRnmkxRojCuvymisfbTHV7r2M
         kr9ZXvB+ubHKh9oHO85bekN3iKvE9SAGtHzzZowQwMfbf0jblou20LWut+eLq/PVZ+Yk
         azeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520367; x=1784125167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RozeYceB4iwycNfbGDK46tH90J5JBru51kfxpqOiyNk=;
        b=mf46UWcF7PEndfnb3gBCiV832u4g7YvZXr2Vvc97n3/yyn7nY6uAkNP6ToJu7ndDcB
         FyxrYPGRTsnhZUVnKbgDHvzu6NsczCGEvjzJZu11w6QneVLZzEQ0GNF8E7wNUgc2qLh0
         t5DfQlEhOVDMgDkJHJai9lktWS8gadWiiM7dVrC7uE5UuYjyFDH5Y5iDbqbdZoickFrh
         t624ZkScmAVuQnyCARkBGNMHGkfd95FVkauM0H0cOMYnI0p+Fw9FWqqNDW/bYyu5WKkU
         d+byfXdsJd44xoOs9KKheq819O/jvQSx/I4oMeJDGBTtdYA13ZozRtXSNC5EB/eC++Fl
         20oQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq71y4PGm0iRU2jwwim6YvgQ+6nLvdXqQWF4tPYjMZn23I7WAUwLIlcrqITf2P7LAgQxuOxj9IjWOW+Xc3O@vger.kernel.org
X-Gm-Message-State: AOJu0Yxidz8myDf1uB6T33DOZMTNatx9JsUe3uh8XULR72sKsXF3KApS
	/mOZvl2yIfmdM7nxYGJ0BCsXvDktHLr3DjD9JokkaHQJvTGBLk/X3KXp
X-Gm-Gg: AfdE7cnltZb2WlXn/65Go6xXm57zT26YZYtKPqhkJkgicykw8J2FkpJvCxZGyDyNni+
	bYo4erOulaCXmn1/dcWLNRD131GOMrphpTJnvPWgTXrVsqYQ9pUi62O4MRtzGqYAwxyAib8O7x3
	cTmwSgYIC7AoOdVT86Z/ccQsxDPyuLDbCAnrh3Av+695wySSox3rwmM/1gb2Jy7XWgllFT5Kqah
	23IvtE+rjZYLIWrdryP+IvZRBsDqgonW4goyh3QMcdDWfJJ+RtxrD8qnmwKvnRgAxuB2b5MeFwD
	8YhppCUPKuBGXbUG4V2kaHH6wEoMk5LEtjKD+Ft5RvI+k6nZbKjJJPF9fDBhmOo+3bDDV9AhXoz
	bJP6HFfQiD3WmHpeneAqqUI8pfjNwyZT/FH9hmaL381T/B1VFTdaSIHNyzTfUFWVHN5Mu0SjYKY
	j6bLQiyi38sBvf+TP3TqcniBPszIO4y02Gxhz1yMBrGpJi3tw=
X-Received: by 2002:a17:903:2984:b0:2cb:ea0b:9164 with SMTP id d9443c01a7336-2ccea3849d2mr28129135ad.6.1783520367125;
        Wed, 08 Jul 2026 07:19:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:26 -0700 (PDT)
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
Subject: [PATCH v2 03/27] ASoC: codecs: es8316: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:10 +0700
Message-ID: <20260708141734.578926-4-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[diasemi.com,gmail.com,perex.cz,kernel.org,opensource.cirrus.com,collabora.com,ti.com,realtek.com,renesas.com,baylibre.com,everest-semi.com,suse.com,arndb.de,vivo.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117658-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07BD3727636

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/es8316.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 6a428387e496..e83dab0b7083 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -9,6 +9,7 @@
 
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -621,15 +622,15 @@ static irqreturn_t es8316_irq(int irq, void *data)
 	struct snd_soc_component *comp = es8316->component;
 	unsigned int flags;
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	regmap_read(es8316->regmap, ES8316_GPIO_FLAG, &flags);
 	if (flags == 0x00)
-		goto out; /* Powered-down / reset */
+		return IRQ_HANDLED; /* Powered-down / reset */
 
 	/* Catch spurious IRQ before set_jack is called */
 	if (!es8316->jack)
-		goto out;
+		return IRQ_HANDLED;
 
 	if (es8316->jd_inverted)
 		flags ^= ES8316_GPIO_FLAG_HP_NOT_INSERTED;
@@ -682,8 +683,6 @@ static irqreturn_t es8316_irq(int irq, void *data)
 		}
 	}
 
-out:
-	mutex_unlock(&es8316->lock);
 	return IRQ_HANDLED;
 }
 
@@ -700,18 +699,16 @@ static void es8316_enable_jack_detect(struct snd_soc_component *component,
 	es8316->jd_inverted = device_property_read_bool(component->dev,
 							"everest,jack-detect-inverted");
 
-	mutex_lock(&es8316->lock);
+	scoped_guard(mutex, &es8316->lock) {
+		es8316->jack = jack;
 
-	es8316->jack = jack;
-
-	if (es8316->jack->status & SND_JACK_MICROPHONE)
-		es8316_enable_micbias_for_mic_gnd_short_detect(component);
-
-	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
-				      ES8316_GPIO_ENABLE_INTERRUPT,
-				      ES8316_GPIO_ENABLE_INTERRUPT);
+		if (es8316->jack->status & SND_JACK_MICROPHONE)
+			es8316_enable_micbias_for_mic_gnd_short_detect(component);
 
-	mutex_unlock(&es8316->lock);
+		snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
+					      ES8316_GPIO_ENABLE_INTERRUPT,
+					      ES8316_GPIO_ENABLE_INTERRUPT);
+	}
 
 	/* Enable irq and sync initial jack state */
 	enable_irq(es8316->irq);
@@ -727,7 +724,7 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 
 	disable_irq(es8316->irq);
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
 				      ES8316_GPIO_ENABLE_INTERRUPT, 0);
@@ -738,8 +735,6 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 	}
 
 	es8316->jack = NULL;
-
-	mutex_unlock(&es8316->lock);
 }
 
 static int es8316_set_jack(struct snd_soc_component *component,
-- 
2.43.0


