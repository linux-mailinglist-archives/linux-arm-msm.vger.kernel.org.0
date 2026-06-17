Return-Path: <linux-arm-msm+bounces-113597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lJBlHKh8MmrM0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:53:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFAF698AE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:53:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=CL26QLzS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113597-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113597-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37ECF307060E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D766F43E4B3;
	Wed, 17 Jun 2026 10:41:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D25C3FD152
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:41:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692884; cv=none; b=XcYiwrlqrB+bCB8grZYHhJQOf2/Vjq853unANXnD/vtPACKzzG1oqdU93egUtdk+MdQffY6YP+BdSVWUQvTacC52TT50Bphu7y0NHVSXsu6x7kJ3gMq2S5Fgl15X+P7oN705vTg8T8Hp+qXEVNFX2DB3ilCW3AEyUNPDnTQvMik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692884; c=relaxed/simple;
	bh=9xbV3n1tUxWEoIS+358Ym1B2iqW853YzQpFC5yt90Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ncA5dMI6ZsF0HwJsaKD4PNgxdSOQG2V02vnrTuehacmtPH5TBVhOvkRce0cgl1225grYK5cXWO0L5EGaXJaUKf6OweDVU5BRf+rTYDri4YgIoJduIgeQg1wqnIvsRFXbQf0DkuIlp6+dPN+BkHRLZImkqmzxai+nPQ6Wio2qi6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CL26QLzS; arc=none smtp.client-ip=74.125.82.170
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30bc871ecdfso1200620eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692882; x=1782297682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwhpp7/VdBz3UggslbsZXRIuTaC9RnI8WqyEGL8e2x0=;
        b=CL26QLzSCD2wiibPZu425P8rA1xWl4kbqZOrDxqmfEbIJGOMytNYm0E7jW3o7FpbYE
         zn1OjdFdmCct8NHTeTbCmvp7uYvuMDC9T483PNOtA28hJ6si1CujUraZrg91pOgmLX9k
         CB9DFQo4Q/9O4qF89U+GZ6E33pEdLzirEMnxEssWqe241vhcj1Bc8vrfeXz4iEK7HZDe
         K8duQ3cThNec7fRTqgHDmm315QEyfEAZBIYdIf1xI+f3gkisupLaxxlypAUqNpEe0U5P
         IyhROnFDLxiNMRMT5UIqtmhxtPHSjlWW8636kYX+wQvV5MElFVzJmlToo34aKqPr/W8R
         iTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692882; x=1782297682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gwhpp7/VdBz3UggslbsZXRIuTaC9RnI8WqyEGL8e2x0=;
        b=F2RnK8BvPvCfc6acu3y2mO2k7AZG62Fjg3Haa8g7LWdJw3a0UAsrhJ5ndJRE9yC4ES
         uPadXFLUyIfzo0cPZjHQlB3Hwx8gkVs79doiW5ca70KCbKqIvRzLfSMFHe+y2aBsOck2
         SGZ6bT7dXKRkG66WOcELx8dP0TlZd3ge8DFrFivIZPFARWrF5WekW1R9d+v0uMnLQSAe
         WUiCB6BpmUY+AQ7J30JD5o1P3DqdbnzsR8/mhrJJoSHASjtCv5MYoGoTeQ50pNPemm7m
         VTsIGj8TzhLcO+ajTNfOtyB69MIpNMUhUnb0jcwPMmeR02yP0MyCuSWg7c82JgdEazan
         ePCA==
X-Forwarded-Encrypted: i=1; AFNElJ++xhxGsUhFEJYn819mHVa0DswpCE9M+90bIZO9M3lu8c8apOHhCr9XtX2uploLqTVbkAFOhFLsEWQIT/aF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1ASbAlXRSv62nEAr8P1Bjzb/0lxI7Liai6NP+UNk0uJNWpRNx
	db6ZGTUX6rMULARwAL0i5Ob7v7s1wuEOx+DoTLp1B1uQimGbu9WxaNBh
X-Gm-Gg: AfdE7cmkX4Q3QclPZ5bBIR0EJvzQCo3KZGE8dCixq5L/GNyWhJgZSM2gi/r7xpVk08d
	vvMaUH/fTdfGQysCn+y0cF35Xqx1AuEHe54oUzoNYUZGAiIVMn/Oi8lcamVseSKrM/tSsVIztP1
	ed1XU1ZISjYLEDLBgvGfMzqnl3DZ9Fj98bcoQ19rz8IyeG4JcUvNqiME3ihSVW6nhzL1dcamBZN
	gW7KnanjA9LAOvBlz7DYqGSn7tEaI6hjbISRCtwyUYBSMf6+jUQAnRvf08SYrftOiQbZFEVwfkL
	F0uoioMkT190/n1EjY+rNpZ1vf8vZnYl9wMsWAZhWvdQ852ZPei0qMUMkVKhNaxSikR3IDVCUCR
	gXlXoVQgvxflrEK38FsycNIU98t7GX5ecBpXeM/N0lQ7wTeqZZSJIDIHGwNf/JxtjZto+o9v/cJ
	m7Dv42T0mThiHSHrk3iQnA2DLMYeXRu1Yh0S78musYrRc2Xnk=
X-Received: by 2002:a05:693c:2d88:b0:2da:1874:f3bd with SMTP id 5a478bee46e88-30bc9f57d3amr1910340eec.16.1781692881708;
        Wed, 17 Jun 2026 03:41:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:21 -0700 (PDT)
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
Subject: [PATCH 54/78] ASoC: codecs: sta32x: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:11 +0700
Message-ID: <20260617103235.449609-55-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-113597-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 3EFAF698AE6

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/sta32x.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 652c6e3a9e63..61703e6e0586 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -271,7 +271,7 @@ static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 	unsigned int cfud, val;
 	int i, ret = 0;
 
-	mutex_lock(&sta32x->coeff_lock);
+	guard(mutex)(&sta32x->coeff_lock);
 
 	/* preserve reserved bits in STA32X_CFUD */
 	regmap_read(sta32x->regmap, STA32X_CFUD, &cfud);
@@ -287,19 +287,15 @@ static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 		regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x04);
 	} else if (numcoef == 5) {
 		regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x08);
-	} else {
-		ret = -EINVAL;
-		goto exit_unlock;
-	}
+	} else
+		return -EINVAL;
+
 
 	for (i = 0; i < 3 * numcoef; i++) {
 		regmap_read(sta32x->regmap, STA32X_B1CF1 + i, &val);
 		ucontrol->value.bytes.data[i] = val;
 	}
 
-exit_unlock:
-	mutex_unlock(&sta32x->coeff_lock);
-
 	return ret;
 }
 
-- 
2.43.0


