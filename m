Return-Path: <linux-arm-msm+bounces-113562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wgoHJZF5Mmof0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:40:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F71F69896C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:40:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=srmhtQTI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113562-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113562-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6AE7305BC0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C36BC44D01E;
	Wed, 17 Jun 2026 10:36:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823B045090A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:36:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692570; cv=none; b=Ke1xLrWZU7VvtRVUB6qBnMHLKupiELj+/MURu4WhKMS5/IctOeMXJZuX+vs6vp65/nLT0nruqxH0LdLAVPgTIhDqCpyh6jOsWqcA+DFWL9MpPg9Mn1PT1tqy4cKYJiDeXwKybabjb4/I3iAugA3TRiERkQ2qWogj2+XvDssQtZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692570; c=relaxed/simple;
	bh=1Ss+Jdqrla/9eoL2y7H5bMd8/rEKPHfX+5UCiREXhpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRTtNeAgbPNZInSGEB3LOSWbm8cpm7Vd2R2vCz+9VY5qdxVw5QuJeHrrgoQ8jpEZnaH4dHsfi5mIngi0Tpz2nZ8YFKhe4Cs/9wMfs99kNvHygBwo2yReksTtU6G2AqBW9KQfTGRqx0Qqh81f22BEiK30m+9tSr0AWa03FzUNlk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srmhtQTI; arc=none smtp.client-ip=74.125.82.180
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-30bbb1bc064so3544091eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692565; x=1782297365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6VSn4nv3y3oiuNER1JMoThzHaGP2UaouCr3/wB0SXE=;
        b=srmhtQTIYBRVo1nNy6w6rWCBi6Hy07AHG2aq8xA7TqnxQZtFyDZAejiqR2wX1GRl8A
         tt2QCBnYeTXBpn8f4M3y0QdBUop0oBbXrYYRC6ZQCi3cqVWNnlhu50oEZ92n6DmHPNcy
         TiXI0hOWR6QpA4CO0LpMMFoNLBlta3HVQu1V0rsDtU2LXvoCDJzSdj+rZnqKvaW1Izkd
         rZ0Z0XOs2eVmSPfTMZQC4UPW/Xx6ryhrJWgRTQvvZ5NjNmBbTY/LvLeGKhjyF5n46zDC
         mcV/xVPATPsKuJAMxwgepWhp8wbZEXOa2MB6YBKvrXK2t/0YMxJwEur7vXyakPQFZ7Bw
         FP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692565; x=1782297365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z6VSn4nv3y3oiuNER1JMoThzHaGP2UaouCr3/wB0SXE=;
        b=MsgPfshISquZ7up+9iY17gWR+wyu7ylS7IUR1RoVVoGnAssoP9XI9y3/B5c9qx5MKp
         ULSrgKr4kDEx+C9wRJ/Py/InTKf7ldfuOUfUn8JQGUYf4U5Qc9QrfsOIHzo3W7uIwxRz
         v/pQnhMCvOQRFQtfDlGt17oQBOZ1EXT54yAdT+7km/3l5vDiv3s+UBjqlwzpvh00G73z
         BMSm97Tmktsv1/5KOBuDH7IcncxV4SuIFOPVyoFarrC16P88aUH+66oATEQZdgv9F9I8
         RE5rVRD0Q/+B8DQyjBOQbLh9tn04TJ9l3TfyMIs0w2cx8fmR7el4u5xcfA0IvtTrubl1
         jKLg==
X-Forwarded-Encrypted: i=1; AFNElJ90RGo5f9/GxaStlN/OkXt/1T88xl9bKMWluTMUc/g5mR2HW+EONH08IzpNRvKtz8ZR8sQfBRO+W7KNAuqA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5tWTqd9XaognRMi7+r7nsahNrJM8xgn/edYhyQSax1KUlo+AZ
	iBMzcv7wgELYfXR7bMhRHR6kF48vgtrtNpn/B/PrI1q8b8fVvDk+f7xN
X-Gm-Gg: AfdE7cnA+zXE3JkdwCkSb3x7D4ixBXC2mqNSstEE6mm9j3vlyTQ2K5zQRx4zgxsSgIp
	IFiWZmrFVDFH3r2MbGfRRYviPx9L9YX3ospf+n2XCUJgspCL7vCuCymzFilp/yi3h/I6yRXSmEL
	LwrIBagPbVheXf7Tm38g1Wg8Z5Mub6AKw8l0JxWCnkh3iS5+ANbHegC5Q6HirFxPjkhDtYbh9Z8
	Qdc2TS06gz8UxsnYVzV4TQGpqgZ4M4UjfKZLNgFFRy1pSjlbXWr7p9OCF/iSKaoRjLZ7v0w1RSz
	Fl9q49TSfaelKZpOqDcW/nMOKeF8pAnf9377fdN5oxXQKjSty8egOqiZV8ALbj2bSrzmPl/ggtN
	f+LEJtcuUB+rL9eOwOsHTQ62EDFN+gGb6JcTeO7wCC7svuh51qdyW+gl87K8etXAD2WfoQ2Y71c
	iUDPtYRi5oqbILNZ7JWtkZaXzbcEr6Wv8GkUWPL4xy4nfe/ENPcJhs/YEO/w==
X-Received: by 2002:a05:7300:2211:b0:2dd:c066:bf7 with SMTP id 5a478bee46e88-30bc9ab88femr1691948eec.11.1781692565454;
        Wed, 17 Jun 2026 03:36:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:05 -0700 (PDT)
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
Subject: [PATCH 20/78] ASoC: codecs: cs47l85: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:37 +0700
Message-ID: <20260617103235.449609-21-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-113562-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F71F69896C

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l85.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 42fafb0b392c..9c0eaf24bd54 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2504,9 +2504,8 @@ static int cs47l85_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -2537,9 +2536,8 @@ static void cs47l85_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l85->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L85_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l85->core.adsp[i], component);
-- 
2.43.0


