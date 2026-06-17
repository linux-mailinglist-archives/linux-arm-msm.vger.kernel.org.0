Return-Path: <linux-arm-msm+bounces-113596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Kb5oFJd8MmrJ0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:53:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE09C698ADB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:53:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=d05YM2Pp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113596-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113596-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E1F530E6BAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFD8449ECA;
	Wed, 17 Jun 2026 10:41:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F86305057
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:41:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692875; cv=none; b=bf8RlieWF1pRV4QVn4JxKIW5ojCLSAs/ayhAcJG4jT8ruZ1093mtQjIwSoPmFSskkYQVLgcjXyP0vkUefnXjKACesnD0Q1IWSQkHoVxyy7/CrOaTcDlHH2ZMq/Q4l6m9bNwqgarFBLxQ1K6UAi/ZJDlsvYt0sUW8V2h+GcpC/cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692875; c=relaxed/simple;
	bh=dLcsmhfPTMCw3dE9DumePoMRCtlHGUVY/pwVPWnU2Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GMEC5T2RgN++zZ0SZXeTA1N+aFg4H05W+KdJz4OPZ5P/q55Gxrgy3EKHpHvDuAlR6bCja5YsQcxFQHNqZCuOSLgwcCzzbiVzmtg/ADFokJ2tortUjsHan5m3ko0/s4RJPJBE7xFj6Wd813hH5hNVIUl3KFyEagPALNfh9DMABbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d05YM2Pp; arc=none smtp.client-ip=74.125.82.177
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-30bdb3eb5f0so152990eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692873; x=1782297673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BwjSo2YB1qAt2HYPfLpM06SwzNXlHUGTMn3Wr6swOeo=;
        b=d05YM2PpKa7q0wU9lGIO+Uy25CTmS14NTUA5XMm30/g6pyFLiLRIf2xggZSrXn+FGT
         1IeG9PPj9qkM4zvtiJ2pDGcfY8PBki8SnRS/ft3Dxefmv8qIG8Poi1ic9osCFRWqAFC7
         z80SnjqiZ+k2PArYtZZeehvOg7uk8xTCbhuNW6AayGj111dOkefwyOnlRWuwo7u0Ytrz
         4wPBmow86HTEeDFNnR47txEuE8jK0LdOUoCK5CHm53iTYX63ygSdnTU8YD0fnloCv9Ns
         lRbz+FwpFJxWjtxacAWNKYVIYHMHanWCZpnA3QTJ1Vws7EjsdyfoQUB8v+U5jpq/qtpd
         BgZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692873; x=1782297673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BwjSo2YB1qAt2HYPfLpM06SwzNXlHUGTMn3Wr6swOeo=;
        b=ASuIaYLR/ycZr+LWb6ZymzeeBDrKIuNEJCpKbQemCYQ/VicaBPtQEvir87dEKWA72N
         6NxbNDMNtpD4uA/UhFyyueeXRC4/wqfRnTodYBWWyGqQjyzU65nSdlwUWYC88nMvD9+T
         NFKLur130qfTE4xMl12QdhRe2snpT9IZCwrrtdWW2yGfHU4eYbytyWVejr13rmPpbfVb
         o32xNCoK5rYC/E5tf/XW3QOWd7MKEzFYoSxHXesb1FRSNCOlUuvDZekhJPg2hgKrpMDo
         qMoPCPtNJSOD5mWlpbVM7CjPR9iPZfOXfSJbQt4ynFMYxo8EhVWkEAh428ChrsD5e6Z9
         Rbfg==
X-Forwarded-Encrypted: i=1; AFNElJ+2Iy4uXtseAPn/YzuBwPUnDofYA3nWLh0nPP4XdJY+PUWqNOocdG68zxfsZGdmT7v/1jRIpmPAM3NWUedE@vger.kernel.org
X-Gm-Message-State: AOJu0YyifxqVsJVhiM0rBRlCyn1SKtbJcab1dcB1cFrKMCqnISI+JGVt
	A5DN3MYpAClJ0BLMCWEi6XwihaxvzY0Q/2D0q5u93gHeuM4eJgMfRmOt
X-Gm-Gg: AfdE7cmMtRUTWF55guOhk+p/J3DSgRvQV+11Bp0qUTYY5ST2Wd0uYlUTRMm5RgzL6bv
	8/fYMrMLC/X59e2yjxs9XiWxA68bj4S8tvyGuflccuAFSp0xZSeTN8yyK17SYd431xbHxEUZwcN
	VI7KG7B5FlXsHUewiaY5/n0Kom5OQsSslm6adu46UEeqwWyTJBSesgFlj3aMD++EnrPNrm1UllV
	C6cBCBhsCvZyCnyBvoRstABAJUtAn4i7AEvzw8MU+QwN1CKWsvWD73tbAseaLPmLW5YTbjXKB6o
	m0d+cEtcgar4V0QEgehdRr8ItCHnABEX9FVd5c6ZbA+CDoVbvNzlck/wX8ci1U5Ro9kwbcHrBxZ
	rrS7R8DM4n9fKjB8BevDhahWuAU2Xs1d6to09ekOTTiHez+dXltJFe4sHvaqsWqp+3cYxLF37iM
	KK7ufqYs/iQT/RK6kLZeMgREXESHKDbnwoWIksopmfeg11KkA=
X-Received: by 2002:a05:7301:60d:b0:304:ddc3:2c35 with SMTP id 5a478bee46e88-30bcf6002c1mr1306991eec.10.1781692873410;
        Wed, 17 Jun 2026 03:41:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:13 -0700 (PDT)
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
Subject: [PATCH 53/78] ASoC: codecs: sta350: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:10 +0700
Message-ID: <20260617103235.449609-54-phucduc.bui@gmail.com>
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
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-113596-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE09C698ADB

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/sta350.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 99c7f7ac807b..b1e2f346c647 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -306,9 +306,9 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
 	unsigned int cfud, val;
-	int i, ret = 0;
+	int i;
 
-	mutex_lock(&sta350->coeff_lock);
+	guard(mutex)(&sta350->coeff_lock);
 
 	/* preserve reserved bits in STA350_CFUD */
 	regmap_read(sta350->regmap, STA350_CFUD, &cfud);
@@ -325,8 +325,7 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	} else if (numcoef == 5) {
 		regmap_write(sta350->regmap, STA350_CFUD, cfud | 0x08);
 	} else {
-		ret = -EINVAL;
-		goto exit_unlock;
+		return -EINVAL;
 	}
 
 	for (i = 0; i < 3 * numcoef; i++) {
@@ -334,10 +333,7 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 		ucontrol->value.bytes.data[i] = val;
 	}
 
-exit_unlock:
-	mutex_unlock(&sta350->coeff_lock);
-
-	return ret;
+	return 0;
 }
 
 static int sta350_coefficient_put(struct snd_kcontrol *kcontrol,
-- 
2.43.0


