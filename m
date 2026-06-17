Return-Path: <linux-arm-msm+bounces-113575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +6KYKsd6MmpX0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:45:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B346698A00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:45:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="e/AN1+eQ";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113575-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113575-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 671083004601
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F9244A730;
	Wed, 17 Jun 2026 10:38:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DE7481223
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:37:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692683; cv=none; b=Qb25YyBCxqyMrVqftVETgsDNA9TMlK7m45mj1PK40raXqUlTroS/LiYUvKnX14zV6mjy1inR2t9iRNG2qdwWRiEA4M8jJl8Frnbgl8XTKkUFqxyFb2OAhC934jYhkaEsq7xg98K45YA735tUUHvvX1ttpU8K8FakeAsGbcyzu+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692683; c=relaxed/simple;
	bh=PkNTUMrO9A90ORm5UpNrg9J+YT1OSjZKeeLipJ8J31Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LgeBqMkLTmsvK88Qqv+t6M66coBZwtgHUNgSBU0tNhtF8q0YYcJwrudIHvzyh07rfmWc3UDcK3BNFW9dG5xxl56UNCTItWOGI5MIF/XO66LZ1956IrYpmfG7s3TNv5EUANfQ9AalVAioUladMSA66hR4ky+pc3nRO1eFHvpkciU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/AN1+eQ; arc=none smtp.client-ip=74.125.82.54
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1384eb94d20so733992c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692675; x=1782297475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuqScYUKoMaDIJwvBkBq3N/KCW5JjgD2Z+JNqaDN030=;
        b=e/AN1+eQjAmUhgaCOVXIVXBNE1Cgn1bBZ7xsPghEWabDbtD1P09z+ffY/9Ivb9s5+R
         VOx39WIclWZ1tOGcI1PGR+I3vG5bcbyFHoQx/XGksCedcKOHuiAm/1ItfqUlOVuHqzW9
         orHn1pGNwOjcl7EJq9XwOT5s00gTlAhMLIMvlwKON2ec3fNubNoTwQlWoywZVbA2nhIp
         cgPf1YFAiUZzaPcYqrq992hiJtQjSkymJ1vzfuLWtIlpoudknGJoULYn9L+amZsLqqcI
         nzrWPe3weGAuFU6cHPRfIkr/p0fyY89imitNMjhEa/NQ6zJ5W8tmHdM/L8kVngxOE53K
         dNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692675; x=1782297475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DuqScYUKoMaDIJwvBkBq3N/KCW5JjgD2Z+JNqaDN030=;
        b=lhZnLDkJPwmGjnHoDqOGF2Yw+27HgZ9SiFsDMSY57kK52rZExh0xQVyOwI4xEWFdU+
         p0hM10t+dKhAxbLGIzj0djDmi/VrGVMDN+JR8OY+ckFDYLI49N9nyKH1rw2i59sLUZGw
         PwD2VYOb6DjL5Jd645Q0saVcEbgh1m+S/fpLSxNbp3HALbLdh5lROlQ1WFeKuoygZSa9
         PBi0FecOrMgU7PedhV8ALYhu9LuaDmrbdzdk9OKNwZuj4Zchs7A70docHhGJIVer0u3E
         aZDs+tC9wtnzisTdCiT46mAt1rO8spY1IJkpvJ/xL/Qbf0PWJ1E8f3lcTHQ2U0/LOe+X
         +aWw==
X-Forwarded-Encrypted: i=1; AFNElJ/sn3Q40tU7A3yLJnQAmneV8AzxdG9PLbV+3xkzvlrMb/aPvyIBgnbl5zg/uvvN7tTvORk9yV1CqVsce5Yy@vger.kernel.org
X-Gm-Message-State: AOJu0YwX6KkbNXAL/pgq1IL2RMyXfQeKMugYgSmFjUlCPX06Bnc8X17T
	TQXn23SwtOaJwS9BJYjdgN55UJ1u1/dC2BZXxYKyTAIM2T8qPF/8DZ5j
X-Gm-Gg: AfdE7cmMkxgRRT6gdatAl3rMkH0ReI20fP0EQ6fyEHWrH7M+vz/gP/mqDFDiFmkAOu2
	Yl8+3Q02vAYWsWh44u5qT9D2+/6WCA5RaRc2C43fw7DbLBIfsLzmTT2N51kZ+W5XFVeiPFGs/kk
	iYR9UTcMfGL56j4jLSKNAIXz4mG66kwuddvPWg5ZIDjKdFvl8JOh0T357KAVtqoAjwPQ8tCxXfI
	ryHZRHCMCGgLVhFYTzMThGnDZOmPmzcTjfAuYZRuawaKBCJVTO1IsEB16lz1E4e9EzKmnPaZI2u
	uthIqP1pj5vUaww++63X3e+tdV4Z33MPmWBMW03fHkAoqrmO+Ptw1am5pMyxFbZl+fBlYsIhuyt
	uQtkESkn8K6Sh7PRWqM4ojUKDJTCAf3xM1g3mHw9m7M5WVLZnafJH5mGO92L/G43XEtpqxw7XSB
	QKrxVsfVPbabiDA0Gyb6MDFFYE9Bd2Z4QFWz+ii/zOu8e4gFU=
X-Received: by 2002:a05:693c:2288:b0:304:de2b:446f with SMTP id 5a478bee46e88-30bca0aadf5mr1738283eec.28.1781692674617;
        Wed, 17 Jun 2026 03:37:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:37:54 -0700 (PDT)
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
Subject: [PATCH 32/78] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:49 +0700
Message-ID: <20260617103235.449609-33-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-113575-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4B346698A00

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/hdmi-codec.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 13ae9e83bc21..608a0bf28887 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -452,31 +452,30 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 	if (!((has_playback && tx) || (has_capture && !tx)))
 		return 0;
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	if (hcp->busy) {
 		dev_err(dai->dev, "Only one simultaneous stream supported!\n");
-		mutex_unlock(&hcp->lock);
 		return -EINVAL;
 	}
 
 	if (hcp->hcd.ops->audio_startup) {
 		ret = hcp->hcd.ops->audio_startup(dai->dev->parent, hcp->hcd.data);
 		if (ret)
-			goto err;
+			return ret;
 	}
 
 	if (tx && hcp->hcd.ops->get_eld) {
 		ret = hcp->hcd.ops->get_eld(dai->dev->parent, hcp->hcd.data,
 					    hcp->eld, sizeof(hcp->eld));
 		if (ret)
-			goto err;
+			return ret;
 
 		snd_parse_eld(dai->dev, &hcp->eld_parsed,
 			      hcp->eld, sizeof(hcp->eld));
 
 		ret = snd_pcm_hw_constraint_eld(substream->runtime, hcp->eld);
 		if (ret)
-			goto err;
+			return ret;
 
 		/* Select chmap supported */
 		hdmi_codec_eld_chmap(hcp);
@@ -484,8 +483,6 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 
 	hcp->busy = true;
 
-err:
-	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -503,9 +500,8 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	mutex_lock(&hcp->lock);
-	hcp->busy = false;
-	mutex_unlock(&hcp->lock);
+	scoped_guard(mutex, &hcp->lock)
+		hcp->busy = false;
 }
 
 static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
-- 
2.43.0


