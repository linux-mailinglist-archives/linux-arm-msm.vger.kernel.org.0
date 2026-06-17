Return-Path: <linux-arm-msm+bounces-113560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gVG/DXB5MmoZ0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:39:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DECC169895D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:39:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qGFgkC7U;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113560-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113560-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0AE4D3073C0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57D03F9A08;
	Wed, 17 Jun 2026 10:35:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AECE45BD7A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:35:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692559; cv=none; b=AhOB1bE65SzR4SUpIkTKsg+7FodSHyiSQ088K5lQKJcjm8K8TKpPYHlvuIrz76uA4O1lWtBTg1xIwrR9lpNScC0iFKWa+zI9kIp9XF5dm9MDxxikum8G6jeNBh1KcPC7B1IpXA+VXZvj4MCBFpyw5HKT1W3CqxaJZP6d2N4Btbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692559; c=relaxed/simple;
	bh=HwBnP5jMPzDPf7Fr6DP+mqDNQGTymWfg0eGYV92iBBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HlnhwdMq5A3kdCV+eU5hjFQxjw6Mbl8pIc1ex9RwE7Ib6FsZOt2TZi0Q7KyQrGoqabyALiG2gqeMmfmlQxxk2a6KETWYiWRL3de+t3zOqkRnFj1DckH7wscuhNWaf+owDzA6Jt/kO/Fsu2bXVKRG8QCii11g8Tfs4dZK1sUsXOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGFgkC7U; arc=none smtp.client-ip=74.125.82.179
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30bd445db39so181515eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692547; x=1782297347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3pG1tEFOJl9HudGSqGDOqn89cYK/BAFq0QnLsL5JtM=;
        b=qGFgkC7UrjTo0OhpDSDj39jMysf2WjLwUOzuUEDBMwXJR0W2sFFWeVMA6KQVnzRj3b
         Z+g0KA3t+rHq4C95E2DI8DMnmUBHN3sY7tqqSR0dEOF0OD8/DYkTJYKiF7+R1xxHjpZI
         bJoORAZoRCq/t1SjKX9PCb7oni4ZsPxKE3A45Mp41cO/1RTTVkSeWD3DsYfbS6MTVZmQ
         cLSzhkbbTj/fBq65GMBYEEpXqObayV+vxrQARNwxfWpU8xH59BqyuGCtNDkif0OUYNdV
         fDD9w1aHw/Z/i8PyB0yGBvoolqvAqmYNmBOg6fx/cItr/a7UY28az9M/lwpQTU2IIPdb
         a9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692547; x=1782297347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D3pG1tEFOJl9HudGSqGDOqn89cYK/BAFq0QnLsL5JtM=;
        b=mOpxIpfgNTKvMsT2q024GyB+NMBhgAzENqYeTw5xCT0v+eyBmVLZkmjQS52rfN82vb
         Ix7ISPX0tr3hHFBmHw7UVj0Cq1yFXxldFnwmfaFOqkAJ28v2hp+Y1gOF0bgqXSktS8we
         EaqShoOIds5G4gehCok3aTw8PC52odh+m0VnDMOFvTZfwdBLeuK4npyODhX1Sg4ziIim
         FqRePsXSfqadI2BaZZXYsgxxjN8yTVhNfWEPNjKBG3Quxpq58bNMjWrAD0KIl49eG2A8
         7H/VCrYNWYrAsGgt9ru/UV5ok05W8tWL6uxcIsedIc5wAn29SAmWnvKmN+L/joFobONG
         9PZg==
X-Forwarded-Encrypted: i=1; AFNElJ/vGhi7kDSb34b0aFUnQRiHJTdZVtAUerHcAN8viHZ8cmGQA+Nb2polo+65lQLXWCCoPaMa4mRttbJmH6PZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Z0Ec7XKHHb1KGOMGQ7yqvIg7tNoMt0wnNlyGTK+tqS+mds9O
	8B0g91eTEpjUjkAovfa0ZHFiZZOAuvLC4SQGQ/Bsod5ahzlsl/G/K85D
X-Gm-Gg: AfdE7cly4PHkIZcwaXkam3tiXD4MDDTMe8mKVEFjQpGGlEZlXhb0CTHjHIWYgSy/xHp
	s9uJEllTCdft9OCFDs8ZR/wMXJ2YlvvecPKS76ZAcIEJUQCbDnDBloskpp+e0SVGYm+2s0x0ogZ
	Nu4Yh3HVXXJDD4322x4k9xZwhqYpPe7OT5j/gOA+qWp/uTtxi9Q7ZmvXvMY1ncPiZHEwEv3pdzD
	M7yJacLIfdpUDBGTL8zBiRE9Tsh1x2OZ/kcGquxYobj5qpplG1V18UCaDo6yk0P+oRkDh6JBHUV
	aOHT8DCOTdEJk9Vw0hwfLJLxJHICjejHIPkdjcmhvvBVgiUDcQk8l2jzwJMV+G4Typw/503x8+X
	Lpdj+8k565Qwlb7J/8LWBuSPqaqcuqFVlSDnv6tbd//W9qlrIl6AQFc98oQdQqJyOylO+IrdiGp
	3MgfPuUJB4Zq3E0NVTYPGM5E6AbmVFbslccu13/qvLe5MgfBc=
X-Received: by 2002:a05:7301:6402:b0:30b:d209:dc18 with SMTP id 5a478bee46e88-30bd209ff68mr689839eec.10.1781692547532;
        Wed, 17 Jun 2026 03:35:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:47 -0700 (PDT)
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
Subject: [PATCH 18/78] ASoC: codecs: cs47l15: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:35 +0700
Message-ID: <20260617103235.449609-19-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-113560-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DECC169895D

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l15.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index da64e0a1db28..7a69f79fe496 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -1285,9 +1285,8 @@ static int cs47l15_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1317,9 +1316,8 @@ static void cs47l15_component_remove(struct snd_soc_component *component)
 	struct cs47l15 *cs47l15 = snd_soc_component_get_drvdata(component);
 	struct madera *madera = cs47l15->core.madera;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	wm_adsp2_component_remove(&cs47l15->core.adsp[0], component);
 }
-- 
2.43.0


