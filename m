Return-Path: <linux-arm-msm+bounces-113583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0M6UN017Mmpt0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:47:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E40698A47
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:47:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SWU82R5o;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113583-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113583-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 020F33037C32
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559C646AED1;
	Wed, 17 Jun 2026 10:39:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB9E425CEF
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:39:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692759; cv=none; b=Hocax5iTPaKJjUf4NisPjaukPVezSTAf92js/Ej/4S/+PoR+eKxzrqjcYTMOdtCzp9NupkrjOrJRz4sC5gx0wwLNieZKB5dUIM8sw8KK7V9MQpbQh2Jf3POF1ESM0oN9vN+KkWOnOq6KFQ9VscdLvdXQkTQhn87Q3Cul21HW9gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692759; c=relaxed/simple;
	bh=jWPckIT7yObRKkib/4Fk7XwIGevaSZ223c7tQ+YT1gc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFlknz3pjRz6IvJNMIxChi23Ip6VN9yS7ovKTo7VpN4NSL+H6rvucvKpakXDcVgu6CyLzyAghu8T1+yNmdTLsLeKKd/N0Il9aV7q1qHb5qvuU6dGZ9zlhHJ4XsUbKtb/K6l2yj5U1RoL7oAECwEzhsnSshGq3JAnPoELRwCyqjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SWU82R5o; arc=none smtp.client-ip=74.125.82.173
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3042a388168so431419eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692757; x=1782297557; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsmBJqYRQESRitBdQqnrMXS0bILtgBW4brP7nxaBGqg=;
        b=SWU82R5okPHD22uboaHD/9kSihbyll9eIf8FqqesycStMR1vuyAyv1A2y65pQnz3qM
         Y0vBFPSHt4CuJus0oKqbjk61bF9EeGhmHNoC8NKqVzWMboKF0glWgWowu3yJuDuSyVQl
         guktXipPF0orS3rxw9mofklDOgV6tcMavgkVDh0Jab3r6SwpShpUN7nc2ZgfoshckEtl
         MCfF1NAiYiGiBa43CHWtTnrFZXTSjrPcOzfAq4It13h1MBq2K7VnoCFy7AcKkziNkVkf
         eKtxhnmrAmiBRytJWYO1Bdv6XWFyc9DvV1O45k3tLIpSKhKARmHAQZVGAVwDsz88FXYH
         zCfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692757; x=1782297557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VsmBJqYRQESRitBdQqnrMXS0bILtgBW4brP7nxaBGqg=;
        b=JXKPGFSTYiunAAlEpyYNo64t4OgG0rX5RIz90ZL6bVYyyiWedfpoKeucRpJAUAFlEs
         gWGGd3BvRO9QrmruNvNkn7GFcl0pAE+XRug2nl4IyhDZr5eHj7kO6nl6gImX/Z3uIxwa
         /hQ335NoZlvNuS4IEKtXFBBjDx5HU5lMv+n/9QOOV1RCB936Des1FNMEakKBYNlrHs+j
         MWMTklaOyFda3SnT65MH7O9nwy0/QHGqrHXU5Qb0ywLxIFk33GfXgpPwg7bZaJ8aXYTf
         Rli/J8Iiyb5xCNSSC9p4w5iHtSngDIIHILHTwk1uKfo3gqTSBolkxkhAvkw3YxzDhq3K
         Ag0Q==
X-Forwarded-Encrypted: i=1; AFNElJ89pzYDOSpjUZYdSc3gYOhsyigN5Ni9GFvN0gnnsSEOjW8Tz4W/EVHqMKDub1hsxd9dBVLeXwXxri7CISNZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzxYXR5x4qENQyWmlsAFHYJnzzc2HrUDW5zmrci1+F0qxaE1ODW
	FYT2nWr/B6E50IxyGBw4VtcdEdXHMXIUIKdm6N6kRG46mWTQalX6fZuv
X-Gm-Gg: AfdE7cklA9UZHY3CQnjk2fL7aTn/vuxVrmxPs5Gia2z6JGWmRnqVX2PukfpRmK48FpQ
	Lu047+ScK76ixXIlBZtkl/FRK/qLAaI2z+2Tuth2m5xtqBZHBf2nDWnC0l+bUVFFTQGQgLRAYJR
	w4q7OVB4x1oSHavMLcxn+eE46yGwhWW68aw9n6wdUIw/4ZxRKaxdBe0DCM7Fu7XrKKh7qPSp49L
	PuREOi2WhORMutkpA81xt1p48uQwPoRja7qmt6r8K03X4uIklJkrBaJf/3vFodPAakjbPkzOzwW
	KFekiZfSqGSrAgdYiyjjLijJEsGAfbgKZXX0p3U432Kvttlrq+OGYJGmfp+PttrtMghA4hoO2AH
	zp2A7+iY4TMs+Ko4b5LYsJGkOzhMEFntasdrLk0Qiwo0CGXE93xEnLte40zMFIWTgF1clxzPMJr
	cpcCLbFf1rjbwbFJWOZplbNYe+8FsDtbvorVUND9t+6pTH7/M=
X-Received: by 2002:a05:7300:50fa:b0:30b:bf84:18f8 with SMTP id 5a478bee46e88-30bcf08d54emr885755eec.8.1781692757235;
        Wed, 17 Jun 2026 03:39:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:16 -0700 (PDT)
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
Subject: [PATCH 40/78] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:57 +0700
Message-ID: <20260617103235.449609-41-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113583-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 84E40698A47

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/peb2466.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d71d204d8fa..ddbc5f34b08a 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -1704,13 +1704,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 	 * So, a specific cache value is used.
 	 */
 
-	mutex_lock(&peb2466->gpio.lock);
+	guard(mutex)(&peb2466->gpio.lock);
 
 	cache = peb2466_chip_gpio_get_cache(peb2466, xr_reg);
-	if (!cache) {
-		ret = -EINVAL;
-		goto end;
-	}
+	if (!cache)
+		return -EINVAL;
 
 	tmp = *cache;
 	tmp &= ~mask;
@@ -1718,14 +1716,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 
 	ret = regmap_write(peb2466->regmap, xr_reg, tmp);
 	if (ret)
-		goto end;
+		return ret;
 
 	*cache = tmp;
-	ret = 0;
 
-end:
-	mutex_unlock(&peb2466->gpio.lock);
-	return ret;
+	return 0;
 }
 
 static int peb2466_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
-- 
2.43.0


