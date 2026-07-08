Return-Path: <linux-arm-msm+bounces-117671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VRgTF+FeTmq+LQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:29:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E51DB7275B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:29:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="NIhgxvM/";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117671-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117671-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 39868312F71E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5D8A481FA3;
	Wed,  8 Jul 2026 14:21:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5EE437877
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:21:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520474; cv=none; b=bNaxSyTTCVvNAfNpuz+4NZZHpj22EY5CftJY40PIaxsFd9NgMv7WiYoiGy9cko6x79OO1g+zo87g6tjFNeOny06dnhTBIXTphvJBslo0hzcjMuIMYFrE4KoCFYRXd41yoTuFTNLqM9W2MZwrZeeTVN6gKOPQN73PtgTk6vSuKt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520474; c=relaxed/simple;
	bh=AI47RSj0Y1j+vIuhRVu3twL/jah5jy/cblTwRVB7e0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbOnYMwb1ZfACYcfiEOvSsqhDTwoaMwSDrUvvlWyQiOakrWwyA1leiGd2eAIpPiOWNZ2QYCKgD7PtKApsr61sLq8dj317TTSccQrmWfIRQNV0GA2vjKhfvQx7ZQFdjW+0lNKFTziTyVd24H79uV4fwcyG1vNcf35XmARcvv1w18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIhgxvM/; arc=none smtp.client-ip=209.85.214.169
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cacb8416a1so7124745ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520473; x=1784125273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+Jtygu+85BYYl+nZawFG490qiPpGrZE3faHfj25h+8=;
        b=NIhgxvM/QbS9X0MwELs/DEcKKZTwG2XP1cHJ0Cpq6kGramDsaoXALLC22G4ct8xscF
         7Xav/OAqZ8k5ZLoKQfZw1fRnqeejEZr1nqDnzj168fmb1YP8Fgt80S41vMc0ntOfYRXV
         /A+TKag1a3uZwlRh8SzvqZWug1WCTR8SBWhTsiG6mDR7zbFikyGzOdL2XmP0w9W+Ccut
         4jm1ya09jrOJA/EfVhli9VNCeMMbPk6k41vRxgv6q8+6TKH2+1gObwIT+Ob14Zt1aTo5
         yAuDnf51QV6FXOZBtJ8/VttwevJozgCNmRiwPjb3zegFg5Hd7zOGRvFwrD836c6Y82es
         0ENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520473; x=1784125273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2+Jtygu+85BYYl+nZawFG490qiPpGrZE3faHfj25h+8=;
        b=AaYC4QolDIHfnZuVvHExS2XbBsLsaXsRqwOqm9C1De3Oxk3tO782ow5R+dtoQMTQB9
         O/L6uXjTeyOtLGxlQmOgXDOAiCkfdCknoyxiSt1RmCr+bteJNVvM00h5dLIOnrg9IAzu
         9jYs+zETgJL6DYmChPl77iuEdsN4dbD5jxV3lInp+YFR7JN3yv6+1rpOFJUeyPHgBYuk
         enf2kfX4n92hwuAbdFmzLWuthGryUYoqD/IT77K0ko4AmW6VcLdqduS3KQO4512MwuqW
         9yRKNdbtHdNhDTkpaArcaNHq9MtTcShAAVQY+vSTWv2ZjNrU10y7H7voLxJCQZJzS010
         3A1A==
X-Forwarded-Encrypted: i=1; AHgh+RpOwwunLzsTYWW/ss3yiKfXRoGEPifn9Mm3NnjoFUXrvCrGvCrwl9eIuzKWpoJis6LvtTklQ2Hkiie7zhGv@vger.kernel.org
X-Gm-Message-State: AOJu0YyDbUwpRry0ls5dkuBdcsMdDl83JjplWMvAz0Wfcye7XeX7w6R5
	tMi6YJldNUimJazI3GrrJgif4nVA7H6wNDRRbEVJ6lhRCgV6+SsPiD1n
X-Gm-Gg: AfdE7cnEgDLCUNiUr7ymdmQefBputQXxvVmD9DCZWl3c0/trxgPzUCi60/wjs8e++Tx
	jEVUNO8eNMiwwEO7d4J6begQSewc9/Py9g99N1iOgNA9Na03uQV/1FzIu4tVkl1udtQ4jaZrjfH
	moyxoSVPh9ld0MfObYOIZuB6SEW1zUvjjAA+K/dX+LC0dPuwEnwQ9Q3CUAZVgbLibGf9qKHtd1F
	riPDGkxOKhEvGLxlbhUinJqYQ4naSyMRr891PTWVGQOtuCjPjrosquKFw/krLkdHdNtIOjgSVxo
	+ZWk2oLWQGXdYachWayW1B0EJqAmPqoHtinMOnQogiGHB++Myqi+Cn0prZBreJmrvFKgZUkMJgs
	LL5jTMeq5M39u8mCSEoqzje8yG8IQZqJNiX0hkRfgQpIG6hpfioWj28zCVvO84HKb22mjg1bLvC
	L4nQ5CId219ZBuCWG3zqwW+yRTzevVIFplrxCCMAV6dNCW5zv20ZQWu7Rhlg==
X-Received: by 2002:a17:903:2307:b0:2ca:6d2a:871 with SMTP id d9443c01a7336-2ccea47c7a5mr27721945ad.37.1783520472703;
        Wed, 08 Jul 2026 07:21:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:12 -0700 (PDT)
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
Subject: [PATCH v2 16/27] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:23 +0700
Message-ID: <20260708141734.578926-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[diasemi.com,gmail.com,perex.cz,kernel.org,opensource.cirrus.com,collabora.com,ti.com,realtek.com,renesas.com,baylibre.com,everest-semi.com,suse.com,arndb.de,vivo.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117671-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:tiwai@suse.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:support.opensource@diasemi.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:srini@kernel.org,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:linusw@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:u.kleine-koenig@baylibre.com,m:zhangyi@everest-semi.com,m:marco.crivellari@suse.com,m:kees@kernel.org,m:sammiee5311@gmail.com,m:arnd@arndb.de,m:rongqianfeng@vivo.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:phucduc.bui@gmail.com,m:matthiasbgg@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-arm-msm@vger.kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E51DB7275B4

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 - Add Reviewed-by tags from Herve.

 sound/soc/codecs/peb2466.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d71d204d8fa..5a1ed02abb84 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -6,6 +6,7 @@
 //
 // Author: Herve Codina <herve.codina@bootlin.com>
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/clk.h>
 #include <linux/firmware.h>
@@ -1704,13 +1705,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
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
@@ -1718,14 +1717,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 
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


