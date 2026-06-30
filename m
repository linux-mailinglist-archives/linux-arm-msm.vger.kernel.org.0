Return-Path: <linux-arm-msm+bounces-115284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7irBFIVlQ2pwXwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:43:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E986E0D95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:43:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lA6fCbos;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115284-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115284-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4D0F30379B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 06:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FB33E7BC3;
	Tue, 30 Jun 2026 06:37:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2FE282F21
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:37:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801438; cv=none; b=AuWt9GXJpQw6o7XuOK6PFsm3i6nb17Se81B4tK4BwqExR8zDTPzA8DtBlE915cuKsJvE+8hE71IHB+NPiDa3/GuilbvQ2peNtpiqSdkJHGrerqrXNXABV4StlXbvZpWPKSTNZ7QJhLziFqqzxxi8Ori+FuEuKMV/ylZiII/yJ0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801438; c=relaxed/simple;
	bh=irEDa3n0ohK3TQxzcb1dCcz25OmFm3UBow1veHYd1Gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SBvBlYl5hk4KVEIfafvw6yw/x4pNVorV08LVZ7aDSLCqYee14fZyHpux/IURHOySj0HnJ1d5SMveLFtjogB87DoyQakfTSC+tdBg8LGJcNqim+fpD2U/yjmyhMg/7s5WzQ529uzQpTpI+UL+kIMeX3xDYDack+Zhqi8eu+j0J6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lA6fCbos; arc=none smtp.client-ip=209.85.215.170
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c85c531d4a9so1611473a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 23:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801433; x=1783406233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdURt4n+DcvB8vUuDlvqMqiJ0G2B0zktNvndjJF0Ruw=;
        b=lA6fCbosrWOssoj5CvhuuuF2exAuxVszyJHaFfxM4Z4kWBQimdvpEqOpGAeYLdZ3sR
         OpXPdW/I8xDeHsbshNXoWUKKHMGvwv3b20enP7jqeDbgQp7sNJ3ke0q1711IuHLReExO
         0DNQdfFN+TFCo0FxIyRmycN9c0LsBPl0RSlZaP17i5VMUNsekcK9yzk91zhoYopf5AX/
         8pRKvtvM9u7lWgYBTUHIenF66ZSnyhcqBrP3dad4c1W/TB/76b1pqe02pYhl5pzQ5W7w
         083yRs34/e+tslOvsGe9oU2Ux1mZZEAWmZvZHFgMqsUyhMcuZhy3aXwbbq/6hr4W3bXn
         wVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801433; x=1783406233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tdURt4n+DcvB8vUuDlvqMqiJ0G2B0zktNvndjJF0Ruw=;
        b=CprO8XnlYiyCr/9+kAfqxlbEsGqiTFxkJ/mMVBbqtUHB5fztJnFtEIxuIQ1IUAL+ed
         ZFJQc8pkMpVNJ4t0XJRqNtTosIC7R5fBRhZuAWF9fiAMi8RiZff4SYxIE0giBtv3Ynf4
         iarBELBsVVQTnXh5UUqXuDeCMkyQ6KLmLZgcGpTYvszc0vrkvIUfAZF8dKFWOFm+Iizi
         wZYOoTeNzF4Og1WUoY8J++MWX9w0VtS8UQs7t44F00GOxTj5N/4s2DkQhZLp/Z+AkQCl
         jATiop5lcDgHQsBGjsVaJahkaRxURsDqK9suTltzN5xC2kzdwvPVAUYIIAdjqlvWHMIw
         UGgA==
X-Forwarded-Encrypted: i=1; AHgh+Rr63sDxF58d55Uq9O3oIKLJm2pIqCb2n7PJuaGtG7tIlXOetpEP9Tjs65f7y1jIEhMEdHiWutuMxx4CB9Cy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1lDyXpyy57WbrjXIWzf5zPkxMKpnaPex6zjL1REQtMTfEDFAV
	bPoT3UsJKUSR4GZu09NJ4IPNNFXAwR+ftzIBYFJI9VcYtvCYTkesvuS+
X-Gm-Gg: AfdE7cnktacvlE7QYG2gjS4kwXPPy2gcBqyjsLPMPD+DM5mitaIUGSZyyzpucgnS5rS
	wW8MypWNafdxgc6eKPCdOSEKCrUYzvBtb3uf3WR4IgNvD72kMMsrcwMWJZ7pO9OvMKTma7CN0ZH
	TogCEdOgJNr6M3iNay2j+WN4+Bl8x/IB4L1Bx+u6a+d757xrD/KgrkP4EuQ0/kYuc5IYWspL8ap
	yRnCge3f7otE+GqH0/apjaXs86d2Nc4YQX+9K6TuwnBTb9BbQlawWrcyW4BZUXL+GYt623HjEcy
	M4V6C0xx0AfHBlRdx6s1D5ZLyaMT+obCA/FVhcbZxh8M6TCAmzielLK6tEL04Xd+9jcrWk0Xm/v
	pzKRX1Am7IliecV7bUJnHyRWEUOuykQIU9q6BzBUoLqLXeTgSlkmppHIEFsut2i/zff+ZKWMv2s
	5A2DV5YH4rZj0n6ssRwLOyCcwfnMDepengMhg4/eLdOJCdmQT1xi86fS2oRQ==
X-Received: by 2002:a05:6a00:3e12:b0:845:e9ff:5d97 with SMTP id d2e1a72fcca58-8479f105f11mr1877705b3a.12.1782801433517;
        Mon, 29 Jun 2026 23:37:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:13 -0700 (PDT)
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
Subject: [PATCH 14/27] ASoC: codecs: pcm512x: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:36 +0700
Message-ID: <20260630063449.503996-15-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-115284-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97E986E0D95

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/pcm512x.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index fdef98ce52f1..bc777a53dff3 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -6,7 +6,7 @@
  *		Copyright 2014 Linaro Ltd
  */
 
-
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/clk.h>
@@ -399,10 +399,9 @@ static int pcm512x_digital_playback_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 	ucontrol->value.integer.value[0] = !(pcm512x->mute & 0x4);
 	ucontrol->value.integer.value[1] = !(pcm512x->mute & 0x2);
-	mutex_unlock(&pcm512x->mutex);
 
 	return 0;
 }
@@ -414,7 +413,7 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 	int ret, changed = 0;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if ((pcm512x->mute & 0x4) == (ucontrol->value.integer.value[0] << 2)) {
 		pcm512x->mute ^= 0x4;
@@ -430,13 +429,10 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			mutex_unlock(&pcm512x->mutex);
 			return ret;
 		}
 	}
 
-	mutex_unlock(&pcm512x->mutex);
-
 	return changed;
 }
 
@@ -1465,7 +1461,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 	int ret;
 	unsigned int mute_det;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if (mute) {
 		pcm512x->mute |= 0x1;
@@ -1475,7 +1471,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to set digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1488,7 +1484,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1499,9 +1495,6 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 					 200, 10000);
 	}
 
-unlock:
-	mutex_unlock(&pcm512x->mutex);
-
 	return ret;
 }
 
-- 
2.43.0


