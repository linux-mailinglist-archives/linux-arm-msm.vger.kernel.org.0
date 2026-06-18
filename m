Return-Path: <linux-arm-msm+bounces-113748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I+U+NMLSM2p2GwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113748-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:13:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D91C769FA7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:13:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=aUBwEjBs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113748-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113748-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 199123047967
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90AC3F0AAC;
	Thu, 18 Jun 2026 11:10:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442CC3F0A87
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:10:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781056; cv=none; b=YBv80hB5Lg/hzeR0n2r5SAQWU7BhFv4NqsNuSd/0/jCJMKLXH1/mPHOnxuvbktDZb5z10fdTWISnQKYLUOBY8Gac+oVXQp2+6F0awZmmsPvi/MchYS3q+z7wuCKBU40jagx0dUbY3wAa9dMx6jbHmZ7O3yGeJ+u+/AeL5MTtcUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781056; c=relaxed/simple;
	bh=Ua4hB6ZB7yjJO3B4WNFzsP6vzs4xxjJPlgY4HlGomMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+hd/wDUUhTkUzKtL73SUBPOzyjXvyTJTTs6NrXbeIAsrmuHpxKhPIJmgiH6JPF9LTegQH8P+pjWXz3VXrz7TZhCcHADnPKy+W1gkxy/3Fxy15fdF6PhevAWZTLRaLlTDeuhS0M1nZQbLvSve7VGARHEwEctdb4VCT3eqH3XTJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aUBwEjBs; arc=none smtp.client-ip=209.85.214.175
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c6bb8a5980so5702255ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781055; x=1782385855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCcNg450A5ExAdoklD+/H48BhvI0tIIxQXlFkv59V9c=;
        b=aUBwEjBsEnOnOWx0R5JlmNmEbZEwpiBinKf7c44ozPUBTcx7X538+Y2GQYY4tAKg7Q
         X5gmc7rHIpegNhgpDauDp0RYebVOtZ55+r3F3HoU1bIcdw1vY+J+xCYdAOR8OEE2L12n
         HM2BYwngkGPCKxLG0CZ9JSC1uTTu7KT4JyvbdmTZR5n+WH3RdY6O7CAyzuBAlWbPUtJF
         5Dxzj36Lpz6FB3edChVVVh5lskC3ECcqVenA6JmekRwkQEdE6snzk0y43loVWoGPxXBL
         slBe05WnL3ka3TgqZeNWRu+t5Hk0JM+kyRcaPwCQCShme12xjDVf6uEwr8uUCDxwz7sP
         veBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781055; x=1782385855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MCcNg450A5ExAdoklD+/H48BhvI0tIIxQXlFkv59V9c=;
        b=WzDP3q94CZxi5PMJEBKYukFgMaOAvUef6DVaR3TWFWXriW6Lb/Z9o7H4IJjYkSa7eG
         VLB+Rxb5sP/86pvgiCBKkR/HMPe1C9KsU40xjjqYYNp8XHUoIXepSxcpvflLzjhMpT61
         P3eZhbVP/O5/dzgTPAFQLZqj7Go0DiiYQceRiUKl1/T3aH/uev4yky2/2KLXDoRxn9+K
         k1adUrAEQGNhSN4vzNqUa7LvFV18BRQe1BnAi6cWeryJfPCm1RQfXUaYCY1R4+9xIkY3
         AV3lfjgF8avOakDq8xryWNUdPVStQ7EyZA1xlvZASQHl7NQR8V8vHi9KiUn5FJjNjuMr
         FitQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lxkMt/lfs9Z5rj420iLXhcVj6YuJhhxFYgc1LLn6qt3eaFrTaZUzSe4etj1/kc/rNh0/jb1KeNeVBvk4S@vger.kernel.org
X-Gm-Message-State: AOJu0YxBfgtCeUdxHDdz+4ACXEoSk07J/BDGCizj+af+w/V2eMMJOYxY
	82xOAp5yPpj65/Cy8LVY31qRJp4PkQkTUmGcgZN6XTAN22mUC/5xD4jj
X-Gm-Gg: AfdE7cmPDp3KwjyBp765dK1kA/Wco+dVr523YypItncPnG7UQAm4bJou2x2TPXw08dG
	A0RXhOrDjkkpLhAQWavYhyrh4o8vk36g+BtDH3G+nl+VhCboNiiWOynBgZqRToSsBJfEMspSU+I
	BlFGfpnpWiRPj+t/3m03u5PDytQa7KfmsxtN6YMpsJvPu2aOVVJhnIHlAzVYmViV59r5Qjma12m
	mkwylefpsu5qsDAGu1X18luKrynSA7blzLTSw9GoEVNIbVlIR3z9Kl5nxLRcTSh5RzFh25JnicS
	Xpd9oElfeWGsb1mXw8uvLmwMgDgqdd7ssor5KdtXhdNIqDju4jRRWb9e+AdoQythFJa/ibLEd7W
	4s8DPLyfEb+imns2QwyEbb13GR9+fkz7Bec0Ats69tlMYxWTAnZUu/JkYztd90HpJP1ZdT7w/bo
	I72oEmeuAHrJQMK0rvDOEt7WJt4sUJR3uhiMuGj8pCdI+m9sE=
X-Received: by 2002:a17:903:178b:b0:2c6:a487:f431 with SMTP id d9443c01a7336-2c6e5276170mr34746725ad.23.1781781054643;
        Thu, 18 Jun 2026 04:10:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:54 -0700 (PDT)
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
Subject: [PATCH 71/78] ASoC: codecs: wm8731: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:20 +0700
Message-ID: <20260618110827.232983-15-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618110827.232983-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
 <20260618110827.232983-1-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-113748-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: D91C769FA7F

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8731.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index a2f0e2f5c407..ff004c9e01fb 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -115,7 +115,7 @@ static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8731->lock);
+	guard(mutex)(&wm8731->lock);
 	if (wm8731->deemph != deemph) {
 		wm8731->deemph = deemph;
 
@@ -123,7 +123,6 @@ static int wm8731_put_deemph(struct snd_kcontrol *kcontrol,
 
 		ret = 1;
 	}
-	mutex_unlock(&wm8731->lock);
 
 	return ret;
 }
-- 
2.43.0


