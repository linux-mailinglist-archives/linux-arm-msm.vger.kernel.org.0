Return-Path: <linux-arm-msm+bounces-113556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eP41MMN8MmrW0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113556-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:53:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D4741698B02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:53:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=PsFZ2eq+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113556-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113556-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44EA430FDB05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:37:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E91A540FDB6;
	Wed, 17 Jun 2026 10:35:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60660411671
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:35:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692521; cv=none; b=iO4Pa1CjjYXbsbI5rHqztyEG81zsSOBjhIlSN4DxI6NQWKXG8VEqhkPjWO7bSSe1IDH5g3hChCM3pwJsU8lFnUF4E5ykD3x8vX0a+fVw2R0wrCmxyas+RJ0lkNM743+ROhRliOFCGGJjkyelFwWX6S9DCQjrZik4361c3+HqZDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692521; c=relaxed/simple;
	bh=M1AXoaCuL8pjqNql9MYUGjojDAFzwdkOmfsJJ+5uCN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+/2oA0uU2/eYUH6g7OPZPp4DBzGkLKknN72hCI4GkKGrwPmnYDax0g/3t6MabFSbFANPf3ViU9dkZW00j1CSWdISaXzzC9ZO6cVz+DPzmBtb5QC5IdY0XxkzSVwUFePE8eSKPvIFnC+O04XCOWU2l02YoOm3WaRKT14Wf2tBKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsFZ2eq+; arc=none smtp.client-ip=74.125.82.180
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30b6dad2382so6290866eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692520; x=1782297320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtDDrpvFiW9v2e0+BVdUVB419JMabOyntlf8qyBQjjg=;
        b=PsFZ2eq+3pXEoGjElsnP6fBOATbPSIbSrK3hQrQ/7q5OrAqKhDbobuvnVCIyk+IZI9
         QmlFw+qEHCHiarbA+J7uHDc6LWeKcdwgqKZamx82o9zs153KKSoj6x34Yo+R/6nUD7kf
         FWbzXxUfCKuuz12c44obpXYZVtB5F5cOX1DLL2F4cB/jEcGkd34oA7ysGt/8jvFHTQMX
         WO6wGtoL/R54hk6J7j+2UV12QOKlqjfwrMfSY24zhQwtAHQQiljKsbvGxPXGahV2JiXO
         KTkcZkUKSVz6vjCskAqEOTkAe96ffN3rZeXl/4iHJgTUhe+7vsc3bmAu2X/KzlW7cau+
         hHyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692520; x=1782297320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZtDDrpvFiW9v2e0+BVdUVB419JMabOyntlf8qyBQjjg=;
        b=ht9mqzDWC0pMbTRDg19JYOw0WSRKGlesPxJ9OMV4AeZObTAb4H82/rjyN5cvvO9y7a
         EmdGIYaTYi00XPR8bPqEn4wJCHJkFC3zXRklFtHB+DUsxv5iTKdiR7gST7NrTWQ403aX
         xWkow7pojOxO3wtWlAV3kbsQtjlvE2Mn+xUFGuwLxKmaGpLGBvyDrqxjjvZtZHH5eMFw
         2O4i8mbFDMDiyjnTlk8vGP9Mfu4V566vcVw3Y1xMZLOKCFXjMz/DiTfIBa8b4gs6NHTF
         kALQhcCfgZHYpHutRlJ42Dg7dBs3NL6oPA90VVA10ufodZguk3J63w5/OH1msA0LIZ+R
         /MHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/rTg1XPiX0thxKCT8ScfhmKvQ/L1Z91ggzSKYpmAtZsDhpFH7jzgoGfAQp+PsbIShYNT5LuISiIyJnHxtj@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ZTqpT8dBFT5t0NZOK53YKneyTZYNB/kJUS7sH+C53aKVW41V
	2dkxCcxm9K2FArO+aV3RAUFM4Dcddg5FCeFYhSBuk1tuxfmwup/yNRCz
X-Gm-Gg: AfdE7cn2Wwf+RH1rPdceHBLpdwVRLBqb+mJH7vEY/fizYkGZuv8scaic0r46a3W8qjK
	3ZHMpUE9xfPJfJTt1n33HjZLb2DFy8YIysoDO1KBLDLF3LB2XCZeRUjzauaufg4cA+Or0VG2xtt
	P0XpGOZXHZAQ+PpoORO4NGZCs1ddubL0JkOVIpG223WrMF2R96Vr4LVPFQLTg2uVpA1eKoQayei
	gobMg/n+boAg8uX3bOTNtUS264oYMErpm0GChL0NdcPDCUhb25M2c6IwRTWhcIxKSziJcBzakay
	QnbUMgTJslqNgQOnqFZLjlRPMvi6S46vjpl32atbZ6gbJS1/8Afyr9RrH7lgdQnoujxEEyQbMjD
	vdS8y02+1WVIGOagrwwcg0vkTxQAB26++7V4UF8ioHAlY70SW1UUYb0nffCKNIzOQEZUS3vsKFK
	RAN5YpSnR33M03De9aa2JU88WrCMQ4yWMHdErRcHiaUUnkD+c=
X-Received: by 2002:a05:693c:639b:20b0:30b:e4a3:44d2 with SMTP id 5a478bee46e88-30be4a363f6mr103693eec.8.1781692519548;
        Wed, 17 Jun 2026 03:35:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:19 -0700 (PDT)
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
Subject: [PATCH 15/78] ASoC: codecs: cs42l43: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:32 +0700
Message-ID: <20260617103235.449609-16-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-113556-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4741698B02

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l43-jack.c | 57 +++++++++++++--------------------
 sound/soc/codecs/cs42l43.c      | 16 +++------
 2 files changed, 27 insertions(+), 46 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 934666295ee3..d6c0f5139792 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -445,20 +445,18 @@ irqreturn_t cs42l43_button_release(int irq, void *data)
 		return iret;
 	}
 
-	mutex_lock(&priv->jack_lock);
-
-	if (priv->button_detect_running) {
-		dev_dbg(priv->dev, "Button release IRQ\n");
+	scoped_guard(mutex, &priv->jack_lock) {
+		if (priv->button_detect_running) {
+			dev_dbg(priv->dev, "Button release IRQ\n");
 
-		snd_soc_jack_report(priv->jack_hp, 0, CS42L43_JACK_BUTTONS);
+			snd_soc_jack_report(priv->jack_hp, 0, CS42L43_JACK_BUTTONS);
 
-		iret = IRQ_HANDLED;
-	} else {
-		dev_dbg(priv->dev, "Spurious button release IRQ\n");
+			iret = IRQ_HANDLED;
+		} else {
+			dev_dbg(priv->dev, "Spurious button release IRQ\n");
+		}
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
 	pm_runtime_put_autosuspend(priv->dev);
 
 	return iret;
@@ -477,22 +475,20 @@ void cs42l43_bias_sense_timeout(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&priv->jack_lock);
-
-	if (cs42l43_jack_present(priv) && priv->button_detect_running) {
-		dev_dbg(priv->dev, "Bias sense timeout out, restore bias\n");
+	scoped_guard(mutex, &priv->jack_lock) {
+		if (cs42l43_jack_present(priv) && priv->button_detect_running) {
+			dev_dbg(priv->dev, "Bias sense timeout out, restore bias\n");
 
-		regmap_update_bits(cs42l43->regmap,
-				   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
-				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK, 0);
-		regmap_update_bits(cs42l43->regmap,
-				   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
-				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK,
-				   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK);
+			regmap_update_bits(cs42l43->regmap,
+					   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
+					   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK, 0);
+			regmap_update_bits(cs42l43->regmap,
+					   CS42L43_HS_BIAS_SENSE_AND_CLAMP_AUTOCONTROL,
+					   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK,
+					   CS42L43_AUTO_HSBIAS_CLAMP_EN_MASK);
+		}
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
 	pm_runtime_put_autosuspend(priv->dev);
 }
 
@@ -895,9 +891,8 @@ int cs42l43_jack_get(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 	ucontrol->value.integer.value[0] = priv->jack_override;
-	mutex_unlock(&priv->jack_lock);
 
 	return 0;
 }
@@ -913,17 +908,13 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 	if (override >= e->items)
 		return -EINVAL;
 
-	mutex_lock(&priv->jack_lock);
+	guard(mutex)(&priv->jack_lock);
 
-	if (!cs42l43_jack_present(priv)) {
-		mutex_unlock(&priv->jack_lock);
+	if (!cs42l43_jack_present(priv))
 		return -EBUSY;
-	}
 
-	if (override == priv->jack_override) {
-		mutex_unlock(&priv->jack_lock);
+	if (override == priv->jack_override)
 		return 0;
-	}
 
 	priv->jack_override = override;
 
@@ -983,7 +974,5 @@ int cs42l43_jack_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_value *u
 				    cs42l43_jack_override_modes[override].report);
 	}
 
-	mutex_unlock(&priv->jack_lock);
-
 	return 1;
 }
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index f0d6ff0b2976..72c5c0340c48 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -1208,14 +1208,12 @@ static void cs42l43_spk_vu_sync(struct cs42l43_codec *priv)
 {
 	struct cs42l43 *cs42l43 = priv->core;
 
-	mutex_lock(&priv->spk_vu_lock);
+	guard(mutex)(&priv->spk_vu_lock);
 
 	regmap_update_bits(cs42l43->regmap, CS42L43_INTP_VOLUME_CTRL1,
 			   CS42L43_AMP1_2_VU_MASK, CS42L43_AMP1_2_VU_MASK);
 	regmap_update_bits(cs42l43->regmap, CS42L43_INTP_VOLUME_CTRL1,
 			   CS42L43_AMP1_2_VU_MASK, 0);
-
-	mutex_unlock(&priv->spk_vu_lock);
 }
 
 static int cs42l43_shutter_get(struct cs42l43_codec *priv, unsigned int shift)
@@ -1602,7 +1600,7 @@ static int cs42l43_pll_ev(struct snd_soc_dapm_widget *w,
 	struct cs42l43 *cs42l43 = priv->core;
 	int ret;
 
-	mutex_lock(&cs42l43->pll_lock);
+	guard(mutex)(&cs42l43->pll_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1627,8 +1625,6 @@ static int cs42l43_pll_ev(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&cs42l43->pll_lock);
-
 	return ret;
 }
 
@@ -2566,13 +2562,9 @@ static int cs42l43_set_sysclk(struct snd_soc_component *component, int clk_id,
 {
 	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
 	struct cs42l43 *cs42l43 = priv->core;
-	int ret;
 
-	mutex_lock(&cs42l43->pll_lock);
-	ret = cs42l43_set_pll(priv, src, freq);
-	mutex_unlock(&cs42l43->pll_lock);
-
-	return ret;
+	guard(mutex)(&cs42l43->pll_lock);
+	return cs42l43_set_pll(priv, src, freq);
 }
 
 static int cs42l43_component_probe(struct snd_soc_component *component)
-- 
2.43.0


