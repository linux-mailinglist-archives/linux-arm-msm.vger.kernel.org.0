Return-Path: <linux-arm-msm+bounces-113565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nhlqFL15Mmom0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113565-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:41:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E7044698988
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:41:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=d7veL7RP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113565-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113565-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 34DC23082287
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322B5472774;
	Wed, 17 Jun 2026 10:36:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9687C43DA4B
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:36:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692592; cv=none; b=ecivQIGx4Ass0bks7vROMdhiMFrvTldwSFjH+yFXk8FEauTnky5f/IxLnyxzu/+Yaz8wZqNn4enUJEU5SMy5rPrYH4r19iBM1K24K3n5X3/5OQ3SXxl7E89uzFyKq2MRWEMyxcxvvBCAojAEqdf9FWWZXoBBqPHMWM5vj/cQcu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692592; c=relaxed/simple;
	bh=PK1w8ixg4eqPxCHAGSl2zZcTbcNUnnrCgmRQCcVJPCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n3KY0rI7sRD0AO8G6Ov3YIElTX9i5lJKZ3Jn+dtcqQm/742vvh4I+RjuRKH+o2G12Zs2jGs/X+OoVcrw8fByfsIcBwkoKD1U1XyoS08obVu/G2aXxnxjr182K5QMwiWBy+fplyK8fLkmvJu1e7VxBtthVFNd19djX8U4TwVFYK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d7veL7RP; arc=none smtp.client-ip=74.125.82.42
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-13986d61b4eso4247230c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692583; x=1782297383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AqD+7rEB0Ri7/GcRAxYA7oAZ3k6z3EUUZL2RMFxj1Uw=;
        b=d7veL7RPWtCVJMm6NCY+xiEt1G/zi+Oezx+BSMpjUiMRZv9lPfJyOBiYcHhk+W9/zc
         T2VJd6CYdtGzJXrNy8W84PR+tg1hZdZM7Mmjr4hmIuSaZyNvdvP5IGf8CrCjZCqaMZQN
         gxoq9oSIpMRolT/8YtY/ctwCwz9e4Xyajybow70j+oqoKZxKUgZYS+oJCs48r7f1zDep
         NNWUC89DEiOPoviVcSA+Xico7ED7RHbLiy4mkEPNsdJNmx8wmawrxhYcxUrM8xs4V0JE
         wew0c0bKE8zv+mRFe+29PDaTW4WBzZDwZDCZ5BoG4LR99eA1jWXFHWefruFheW7YtGcF
         kfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692583; x=1782297383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AqD+7rEB0Ri7/GcRAxYA7oAZ3k6z3EUUZL2RMFxj1Uw=;
        b=LfXD+0Hb2tmqSwbQRm52m7bV29gWFQq0nB1F2SfleMrkMheCO6q20FT/ZoYFhe9xcT
         T1E9PEUdjnYXqX71tKFsNaGNEPENPyzNxzcsqFRX8ZLsBB4U5+8A4sSvelX62NmuRnLu
         0DEoKJIMF/m1UaRmzhobF4WW9CnsuCWCSC9uej2rOgDZoIq0i/nRR64vgrIkF7s/uD9N
         VxT7PX9rL/Zt5L7UQxmEPJKlxdxpOgwPILtJXlyQ9LRDRSRRw9Az7UpOcgavPn1yQHJ1
         dewaRKZXjldyu7eHqSpSuY1B0BR8mE/KzZ2vyjLuq49SEpUd29SbATPc8LWGGL8RyZdc
         vbsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GAg3NXuOvBDXcNLDgea3UeG9gdNVOh2Zd2eHHaQnCUsfM95bEgxq+JJUm9U9xRLhFHQKUMbEuK8AtS9Nd@vger.kernel.org
X-Gm-Message-State: AOJu0YycbXW9c4qBD58285cg0x3FCoUHpcZs7runNZuZUXgvChUzw8c4
	uRCw3ySwgj6WEMl1aFHCUYdwhcfoB7qxI6u/NFlppgyfudb+I0COGKNa
X-Gm-Gg: AfdE7clO+JeO23ETsVXoQCzdcYe7W5M2AF2l9aOxnBZlhaYDRq0GP//eyAOQFSAs1xE
	eaDdAmDM47w+n+lARitrPW1P6SRVshWidv8hL2qDEPlEljDjp5r6DZmDAs0hdS7oJ3qFTpZjjew
	2aZlmdy41IZWvczuVejzG0uRglObCcKq8DK5e78+QTdVu9ZESTgk+zEd4LQVXUhFi1aRh/uFDBf
	0KVWmN9LuaJIyqgltAmtraSoKJsznp9HPCjRbIlq9o5OHSaSwbo835hR5ddPrwnFLK37lYL1S2Y
	2VQsdqE32Y+O/2VjWipawbGdSadwysaW1r6jcl+v1A/geti2lcr1NYeRJmiK9uYdE8gb/+g/kkd
	SebuADZVHut/IAk/K5g8trhQY1C6AOggvGMuMe3QXRtAqQl5Rs+k6LDGAdMXH88VrP9uitGq+is
	y5LzMa3hbTyEZrz+Nko7hpbHJI/3+Pucv5pq5v/fgaaDvW9W8=
X-Received: by 2002:a05:7300:430e:b0:304:188d:d0b0 with SMTP id 5a478bee46e88-30bca0b8c3bmr1984423eec.20.1781692583469;
        Wed, 17 Jun 2026 03:36:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:23 -0700 (PDT)
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
Subject: [PATCH 22/78] ASoC: codecs: cs47l92: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:39 +0700
Message-ID: <20260617103235.449609-23-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-113565-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E7044698988

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l92.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 868237bd6d91..4abc896caab3 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -1892,9 +1892,8 @@ static int cs47l92_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1922,9 +1921,8 @@ static void cs47l92_component_remove(struct snd_soc_component *component)
 	struct cs47l92 *cs47l92 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l92->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l92->core.adsp[0], component);
 }
-- 
2.43.0


