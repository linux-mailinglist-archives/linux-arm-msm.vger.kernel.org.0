Return-Path: <linux-arm-msm+bounces-113567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EjS1Mpt9Mmr+0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:57:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B6A698BAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:57:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="AEN/Iyd8";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113567-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113567-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 12D413130E89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B09AC3F8EDC;
	Wed, 17 Jun 2026 10:36:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F48843DA24
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:36:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692606; cv=none; b=j07dTFmaJWAKkjGotf1vriTC57P169pecL3s4Br4QTjm0Zl/kVCXmdqaqR98Irwi/H+cpCkKqDBVe/BN+4rw6inZNaapHkPZ2Wa5fYLRVWlJA6Ox6+nazGY+uKCQPthxeMwJIVckAv4ndDJYroqfwWoQaX7k9xP6BFdpgNsaRJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692606; c=relaxed/simple;
	bh=aVdb6b0m2JyHDBBXnuACsuL9yrvdbLrDAn8rXRP7U1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K2uZssEK6YX6w5/EROmqQR5L08SRyNPptHq43yr6L9NZ6lZwACiOk5gWz1F3HdZvJRO/7aU2KkM9bxD9+kcSEIJDZ/sHNMeH0NW6Xv6vga9bQ8QSoV3jZxpwLi71/T1X4lgozY6yW1HqLstOHnnVqoHIZKDHrSzzwyuj9sjNTUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AEN/Iyd8; arc=none smtp.client-ip=74.125.82.171
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-30bc871ecdfso1196263eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692601; x=1782297401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNurP/9D2C90fingnCx+/RnV4Jx+m6H05P+75zIDvK8=;
        b=AEN/Iyd8WRo3yq14ID4ONzPiTUFyunwUAPi45oQJg2rWpxluqzD3vvkKjIB+Ftfbx/
         ozQKg99We7dE4GS5TNkww2JcNtEK9TezxgMG+S647uk7ip07obdo86fGHD3ubUtUGxOA
         84LixiwptTlFvWCh0fnFTa9ir2Xlq+RXKdJEqCCOmRYfGAt9yO+JEVsQOR49XEdz78bx
         GB+Ji5fmW0+EeKy1/30NJ+8bZoNwzD//Ft6ILHFqw8982yqX6EE7pmXJNNKWjKs7PRIn
         e3gONKqTZtFLDgQXFHSp5S3l5dNW/MyifOrT3qX9DhLorxBhHIKhMY0a1Kvhosj9Uddr
         RBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692601; x=1782297401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PNurP/9D2C90fingnCx+/RnV4Jx+m6H05P+75zIDvK8=;
        b=ExCb8+UWzxf0RsKNby8QuMMlUvYOb9phSwXvEsQX+6PFm7cLJdUXeqXUFpIYOpz+Yh
         9zXDXOg6sYlBajYOSPnMi22ghL6qxSZmrjTYJFey5tP0bs7M9iHOfF1VnXdIfV/0L7n2
         M+yvR8eoDUeH9nchvzdd9ghPes+2835Z13KhOy5SjnH9DYKQnDEVdtdlDXndAiQnYmVA
         hwhgBVNOmBIXlk5NvY+8oVLtz1Sm/+Y3qhgfG6RMCo1tiARzmaE2N5rXaAEUgg2OEvDb
         feCN12W80GmDL5KVsYe8wg7lusj6iwMgtJOiKt/bxbmAp1TNZjBfGRPPAIbyNTvJ7IhR
         +SEg==
X-Forwarded-Encrypted: i=1; AFNElJ9u0D6hUsCU97ddtrYgxFT2TmsjL4JcjeGDVotFhVo/5o4OsnTW4XnmwEUYEUe4TgGEuO8wKCuChVzBhNli@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt4ODj7VwRnWppUgzXaOE8aOC2LmE4njvkni1fyAxrfDuq9Cty
	TfyQytJ6pArkYk73y4Fd1+6MwkppfijkJ4+4vmSydBRCfwsPqobD+/Uq
X-Gm-Gg: AfdE7cmSkATAg6j2K473AOi5/8qxmcm6vF2iiJJmkWFhPXN1NMyWsclMocQUbCdG0IF
	x3InK7cyglmrHF0K7nwOPeNqqoHKGg5KqfYZSG6MVLdat6kXK8arFHm5sWeR4R5ObVDhlL7ts5U
	XbRMRj6CW+5f6ehBQEh8+dZPJoqRFMC/BAA8lHKfIxssImnTzKm1/Lma0Jaeley5drMH2I3+hs7
	aFva0F9vpKG+walQcUPI9O0VRoleu19ce4LpX55iUzru6rqoDE0N5a11Vvq4lLMsJg97ronaxrH
	znSmjV2GSsuTtYwg9aR1l0nooIYJWxS59Jp9ElCHyMhOYVIXg+Hk+E85rHSfOWaTXuVYPfy1MYZ
	YHCYK97jmebhJyfhsnD+URW9ZSfu4ipkrxFMAj7d5l/idvalxjSactz5ouoejBGT6n7wYj8+qlW
	NE3Tx3VCKJYfWD/YzBUQ4SKXgSZY6Zi9Onbmsb3xBUe7RCGKk=
X-Received: by 2002:a05:7300:72d5:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-30bc992dbe8mr1692072eec.3.1781692601209;
        Wed, 17 Jun 2026 03:36:41 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:40 -0700 (PDT)
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
Subject: [PATCH 24/78] ASoC: codecs: cs2072x: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:41 +0700
Message-ID: <20260617103235.449609-25-phucduc.bui@gmail.com>
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
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113567-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2B6A698BAA

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cx2072x.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 83c6cbd40804..93fbd21dc51c 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1408,7 +1408,7 @@ static int cx2072x_jack_status_check(void *data)
 	unsigned int type = 0;
 	int state = 0;
 
-	mutex_lock(&cx2072x->lock);
+	guard(mutex)(&cx2072x->lock);
 
 	regmap_read(cx2072x->regmap, CX2072X_PORTA_PIN_SENSE, &jack);
 	jack = jack >> 24;
@@ -1434,8 +1434,6 @@ static int cx2072x_jack_status_check(void *data)
 	/* clear interrupt */
 	regmap_write(cx2072x->regmap, CX2072X_UM_INTERRUPT_CRTL_E, 0x12 << 24);
 
-	mutex_unlock(&cx2072x->lock);
-
 	dev_dbg(codec->dev, "CX2072X_HSDETECT type=0x%X,Jack state = %x\n",
 		type, state);
 	return state;
-- 
2.43.0


