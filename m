Return-Path: <linux-arm-msm+bounces-115290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3X1eCKlmQ2qdXwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:48:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 743696E0DF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:48:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ofFHTDYo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115290-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115290-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 813BF306A34F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 06:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B11BF351C35;
	Tue, 30 Jun 2026 06:38:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC4A3EBF04
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:38:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801487; cv=none; b=ao8qSW2BwZDxF+xetikrYLGtXPvbuCIEm15w17HOPLafLzw6ATseaqLcngpjLcthAo/Pbk7VdOciZb3PGLIeoNRC5CBRyEkMlKqlFgjNflgThq2i3/MgqctRmoV+qpH2GPvrKuCdBbsTNTo3bmpDCIgn7Z9JwjQ01FA0Mi+jIGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801487; c=relaxed/simple;
	bh=j1KzWxhp75swdsTYPJvVoYjcP8hTRieKELlWe5iEq2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h1AiHJmCQTHvumB0WAhGLY1ID1epmLxfHkQGJPWKMA4QjK6t/ZQyxBkMdO0Pg78Zuv5k9LO40pjVdU4RcCDQ0ZtSTUlcIxuoKKZCviMl6+JK3U8I9kZFNkDYQaXxC33WO3nfdNopDh74dq3NApVuf7ZYqnGcxfyr7xxDykgJa8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ofFHTDYo; arc=none smtp.client-ip=209.85.210.170
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-842358aaf36so1780054b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 23:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801479; x=1783406279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=ofFHTDYo/ZZUNmZI0K4HMH/2xZdjWuI9Ui0mYUF4wg80tGPQivlJXf/uhryGjh/fAe
         +42PQNVxQ+4HwF1AF4gc7j+JfOcUdFspWxzKZAtZ6Rb0fUmZGblvsoezuU5O6D3Py4To
         VpXj3DvPzKQvIjvaSMky+epKeAMfXbMrWuif+HfLZOZSs2XZqv9oPB6HBJVS9PD6xm/q
         l+7WAMvIQsWGMKEY8HZjD1Mg7w683DSun5wT9cnHe+JjdkzIe3DFEqYYFwBZJtZ8ZUG7
         wXFDzOt5KijxuMY/UTYwMSwvtsx2bs1UbvuF9nrO+N8zp8J4kKUDLHzu1TQWd2dLvxHf
         V9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801479; x=1783406279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=phajMEQQIreLHYYHmYWj4CxzsyjOxGvAHJAo662qBCOgtpwdSPEjHAsUUzS51mJx8z
         xcjMaEVDW6f2Ay/xMx4IN/IzLo0PtluJUm/InSVznqQm602uCosGm5eEqzrE/Zrm/LWj
         fpgDd8QdXkS++ooWDvfKMcmck5JRBU1W9+QN+u/uFmKZ8JNIsh6Jf/VzVRPOeHPf9nWe
         Qo+G2r/2AtN37yhV+jJZIDuPj5fIGBDJWihcF3nRosdEcQ7h8fxuCh2wgpEXgkdQkWfJ
         t24GAQPeC20YK6AZUKz/SrrUoThhthgqhXrKeOA/CT55XnoMUot37zVeN+bDGLLXg32o
         uIiA==
X-Forwarded-Encrypted: i=1; AHgh+RolzUWx/Ih3cIEjAK10eZkPD10tjZ6/0r3R8kGcXe85VO+QZwGHmSa6JW19EcaYfpkBO+yEKhAiFHahILsj@vger.kernel.org
X-Gm-Message-State: AOJu0YwTk63h6aBFmE0BpY+Qy6Uz3D8oMvNRPXz9nSswb+a/LgYPuvK/
	zsjkxTg4aRbe8yK7J3+tY9Ve9TL0avOxacbAhEiD07Z6oFEDSMCOFxW0
X-Gm-Gg: AfdE7cnRLy1SN1tGtqx4dSTStMtm8yBidBJtVioNruZjmYAmBopBS+gggpBte8ZEn1y
	OBZw43g6XJSANQFoZJnGHPYK6pRttvLnW4TPnZ+REFpEKwPH4RpxVQsuvLckuVmWN2X45MxPVET
	PUoohhvUpwooJE/AUj7DCPSnfSaAPMLgpzZbe0Mz+rRLKqzV4jtTFbr0vZ3VIi6CY2tLrDkXYkT
	dXPtb+TI+VVpaHx7jt8iptRSUr6xOZqrjxS1RoMoqiDwopcoZxwuMBdImvYR3BpymKE51F24li0
	E5eeT8nFgDTDSWot29owWZbeOiVhMZ8qSfhuHYY8BCsotV14QvlKmuRg/ksIwjt+f6VoTWQdtwx
	99th1zYeerDOTHndEejZJHyjRVl+eiPI7KlimVlOBg9it+v9ot68T71j6S7kgneoHGh8vbgUIX+
	RnMJgPI4awa3jaeujC9YKEZBmbDdAAPEGl+wgFNJpQiGFRzq0=
X-Received: by 2002:a05:6a00:94c3:b0:842:77ab:35c8 with SMTP id d2e1a72fcca58-8479f3fe486mr1817309b3a.44.1782801479404;
        Mon, 29 Jun 2026 23:37:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:59 -0700 (PDT)
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
Subject: [PATCH 20/27] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:42 +0700
Message-ID: <20260630063449.503996-21-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[33];
	TAGGED_FROM(0.00)[bounces-115290-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,realtek.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 743696E0DF0

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt5668.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index fed6de40b8c8..4154bad27610 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -986,7 +987,7 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5668->component, RT5668_AJD1_CTRL)
 		& RT5668_JDH_RS_MASK;
@@ -1053,8 +1054,6 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5668->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5668->jd_check_work);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
 }
 
 static const struct snd_kcontrol_new rt5668_snd_controls[] = {
@@ -2356,7 +2355,7 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 {
 	int value, count;
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	rt5668_reset(rt5668->regmap);
 	regmap_write(rt5668->regmap, RT5668_PWR_ANLG_1, 0xa2bf);
@@ -2400,9 +2399,6 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 	/* restore settings */
 	regmap_write(rt5668->regmap, RT5668_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5668->regmap, RT5668_PWR_DIG_1, 0x0000);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
-
 }
 
 static int rt5668_i2c_probe(struct i2c_client *i2c)
-- 
2.43.0


