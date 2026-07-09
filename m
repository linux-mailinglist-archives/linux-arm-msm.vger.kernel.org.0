Return-Path: <linux-arm-msm+bounces-117835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +PlxB8wqT2oWbgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 06:59:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 848A172CAA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 06:59:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=EK3O2pxa;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117835-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117835-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E08D301F598
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 04:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8165737F725;
	Thu,  9 Jul 2026 04:59:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AF437B415
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 04:59:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783573192; cv=none; b=LdotSCVk5Q0pabF5rqH11lZm2V/6KRwLshxLS1tScMbNW0c1zrs2+hqEQlhfYa+wQUU/VuikYZlvIdQr8etlyk807F8M2KdzuR/6ubzmH7UOlUq2Wmxxfe0HNN1B/6vHd4jekeVTfMvGPdY/SQJZkeba0mz6oljsv+OfZHTJgrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783573192; c=relaxed/simple;
	bh=WOalQFBHar3NvkPew2YrsEq8h801FlbaMFuTGotQNTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSqKrbHX438kFhEECep0MTAR+swjNoUwxwBkSFbYBuAa4qWqai/lNMjfqQ2hbfgsSVkpnLhF6yfvk1BK/fpPeCvh5O6Bfb7CG9JCCkxEe+3X5y93NQ0Cb5RUoQT5K6DSzyLHUVzlFKkiAWyzP0Hl45db1RCZ2L790RYvlZXjuv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EK3O2pxa; arc=none smtp.client-ip=209.85.216.43
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-388b404ea89so540908a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 21:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783573191; x=1784177991; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=EK3O2pxaQpcJzg2dxGFTknKXK7v3foJVIHn3XNQc0SMKt9tx34orugL4SzM/VQnsZ4
         tQEOMUoH20jHMD77N+6jPA7BkJldHa9S5wh5P6yuUj0tuSDSjF4CSi06XcFa666rmzjw
         gn1t71glOUWtw9gt1KXtT/M4nuxMAXyr81vVkH1Q+bjuCNt+IwaTYxw38mAZLxtTHTNe
         Iz/MEV1rSm1unPiksIMcLGDyYbt0Y9q7NfSRRxEok+FiPQO9Avr2gEUJTyJ6oBa6PgbR
         6nqU9J2SNLkiNGbzoRNGij8/KV3ZRhBrDyTGrFEx0EADviqkgsyp0RhaMBJc14JT2cRl
         u8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783573191; x=1784177991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=HqvcoMz4cKMJLtljtgpAfw/Q0d14GyWHF5VuuPCOx9/nYsxMnZ0if+inhkVKzPxbnP
         t7pwTK4lSZv/6I6jVdrBq6ZjWzO5RCviVX3ha58mA2C1LIa00eeEheJWwW3+J4yabQbk
         1RiuwkLdH5ai4I2ZfNPUurZKLrZhCJIkbal6ZBiUIgYoGu/OUf7fwfJIXCJR3HMV1ktZ
         w1KzA5HyRSSbUqeVj6Mnq47Rt+yDaDhYDJgj1M2HQUzlwHbB1y8hZVxlcAUvsNV0bbxa
         WgjAk0z5xZ5J7a9EKFt/aGXe/epf0Zouo7qPMQLUOyUHEckjUgYSGCHXmGwgQYb1G/qa
         ueMQ==
X-Forwarded-Encrypted: i=1; AHgh+RqshsyxuEPjciPeOr+FdGE7YYz5QZT/jEOuPNnvARoKVZ4P4vWO1aUcMk/93e9TjDnY7+KLL0FAgtmL4xm2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyepo9xLuxTqzxXnsNbi6oWyADmvd5egYFoiJrRi016mHf4mTvi
	ctGxVRwkhxq8ao8ut2sh+UpGgd2kW4f1ZAHsksrwBuluLP6tsPcsv0E8
X-Gm-Gg: AfdE7clcOprrT6ngPWb9tFQBmqpCefiw2MZVsy4Tr4ANkPEzNVRYUIYQzZmUKsdxhCi
	SdigqRKzsFrGHhzWqdO9iZmzJuqBKY9fqiuWGSQBrfMxeCua2UZ0WIYbAwxSW1w7NNkhDxUZKNv
	WlHUINRjqEmvg/9l2xpAE1+LD4FO5eIIozMSjhRTw3NyJjaMem95lbvgqhLuekbIqOw3NWRSNPF
	IYoMd6cHJquQqaZcfWxG5EO8LkNj5TkwN+IhKrD7yNCE5+/4pJC3ufJapuF2pOy06ljWEdxb7i7
	yLbXqrUz9WZTY53ucuUFpo4gOEi8P3QC4DL/o0FVCOUME0DGLtcuVhFpfWgaifr6n1IWfINAYPi
	KMC+yOzOQjgMhTAEsH435Z046/CiBnOTV1q7yA1AodLnOmQeypSlKkbJN7OSWrW8Lcjpw/R1qxk
	g1WT4JwQjAWr1hp6wokZ5Rk8XBLjNNnzYh0LQ4xWiwwbNaCFs=
X-Received: by 2002:a17:90b:274d:b0:385:39ac:fe4b with SMTP id 98e67ed59e1d1-38b75528c91mr1355508a91.17.1783573190664;
        Wed, 08 Jul 2026 21:59:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b47esm490481a91.3.2026.07.08.21.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:59:50 -0700 (PDT)
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
Subject: [PATCH v3 01/27] ASoC: codecs: da7213: Use guard() for mutex locks
Date: Thu,  9 Jul 2026 11:58:36 +0700
Message-ID: <20260709045902.498848-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709045902.498848-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[33];
	TAGGED_FROM(0.00)[bounces-117835-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:tiwai@suse.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:support.opensource@diasemi.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:srini@kernel.org,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:linusw@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:u.kleine-koenig@baylibre.com,m:zhangyi@everest-semi.com,m:marco.crivellari@suse.com,m:kees@kernel.org,m:sammiee5311@gmail.com,m:arnd@arndb.de,m:rongqianfeng@vivo.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:phucduc.bui@gmail.com,m:matthiasbgg@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[diasemi.com,gmail.com,perex.cz,kernel.org,opensource.cirrus.com,collabora.com,ti.com,realtek.com,renesas.com,baylibre.com,everest-semi.com,suse.com,arndb.de,vivo.com,vger.kernel.org,lists.infradead.org];
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
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 848A172CAA8

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/da7213.c | 37 ++++++++++++-------------------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 4bf91ab2553a..923b997efbc4 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -11,6 +11,7 @@
 #include <linux/acpi.h>
 #include <linux/of.h>
 #include <linux/property.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -216,13 +217,10 @@ static int da7213_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -230,13 +228,10 @@ static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -244,13 +239,10 @@ static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -258,13 +250,10 @@ static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -465,9 +454,8 @@ static int da7213_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7213->ctrl_lock);
+	scoped_guard(mutex, &da7213->ctrl_lock)
+		ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -499,12 +487,11 @@ static int da7213_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 	ret = regmap_raw_read(da7213->regmap, reg, &val_old, sizeof(val_old));
 	if (ret == 0 && (val_old != val_new))
 		ret = regmap_raw_write(da7213->regmap, reg,
 				&val_new, sizeof(val_new));
-	mutex_unlock(&da7213->ctrl_lock);
 
 	if (ret < 0)
 		return ret;
-- 
2.43.0


