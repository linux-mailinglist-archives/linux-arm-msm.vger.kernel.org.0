Return-Path: <linux-arm-msm+bounces-115286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 91VQKPZlQ2qAXwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:45:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4826E0DA8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:45:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=nTIGDehO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115286-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115286-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65EA030D1A94
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 06:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4777D3EB81D;
	Tue, 30 Jun 2026 06:37:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144983EA96E
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:37:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801456; cv=none; b=MXsoJkmfC9C2nnQXilzVgkKBtZDuZ21js9pcL5BtP52pH5ftKVXAjPm1f/1b58pJ32A5BfBc28dBUbvNAYZpTTYCqDowoSFkOfVS+fZXZqML73lY792In+1Sqv2nVRm555S3WVrMuUEb2WpbYeCZzpgOENOVuf12zXDXJXPEecY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801456; c=relaxed/simple;
	bh=FkzjMsXUtOizyXpAhVhzWGEvYlKPeN0aQ4i9BCrSMH4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2j4o6OfLOmhy+iQiG0OU606FwjTh66l3erY/hVgkRnyX74+Dz4YH6apeBMCyBN40jfuJ4XUZvkqFiGrAXQOjKTPGJPoJg3lVw/e7JmcnP75k8ZNlC4C47zZtMs76PvdaTlO9o0nVq2lJB8qdN5VauuA7npW7W0bB1Ak2vavXyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTIGDehO; arc=none smtp.client-ip=209.85.210.178
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8453427d3f4so1895174b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 23:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801449; x=1783406249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JleaosgPudHEejmUeNFrpNbP60XzHFLgR4c9WPlcTX8=;
        b=nTIGDehOdWT42RsuhufmUFnZH87XyvZVq+W8DSnaXMjsWl/qoMthVJfSWCGaoVUqEz
         iTGsA9bymPq16hEzjzOcBMjMMjN5GHAyLX4GW4hetjI8PRNusrnTwxXqEIVY+nvZVrDO
         j+/TRU2HDkxAu04t6xXGzYL/vhiK/gTUN1VJsie65SjD5aPFaxBv1MCNK+xvvVclKVa8
         fuUqydB8y5N7mQ4fdoYDtLTfRCafv23GKkZW0TjTbsHZFZm5/1hQPijdLTixX+fJQM25
         0brm7UXrSWjvYnh/dDKNKD8SnRm878js7yskjVWd9K+dhuTK0qQGgVkxqNHp93vGxyWX
         cuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801449; x=1783406249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JleaosgPudHEejmUeNFrpNbP60XzHFLgR4c9WPlcTX8=;
        b=ED79lVssQNnsmwFNBmysfegja48Ki1juxx8pJy7u0Ve024I0gUbxYrv5Q6vO0aUne4
         +CfP+jbiDhj2aBL56VWuZlxqxNqED/JEUIw2qtSYTIqJ6ThaYrK93uVKOfJfNLvHsRqR
         fkLPyriFiupQdCXgdOjAWAGiut9YyQfoCgFO427Eml7WwXO1kl8s3nOOZb7/OhAJTpFq
         EbeuzKx4jtJTMZjVnn9Iz2PsPMTP/Loc2bVoCtGG7oPIYNJ/HvcnwdD+MM+LHmZclWWo
         /7z7MjYDmLvv7pFj1pJ6dKlmVu+x4JIB14vEWB6H/vr63IzifMPgy8tvUeozFNbhvkQ5
         23QA==
X-Forwarded-Encrypted: i=1; AHgh+RoO6G0lhyHVl2An2WDPpVguEgREFXWEu06iKurSUQ3BQxoiOH8gX+zwBX+RVajpcd3nZaUkuBDtssH9nOQi@vger.kernel.org
X-Gm-Message-State: AOJu0YxdsqCPflNDzAzcQdsbrgL33d4xENA7eXK45XkYZIJaHYsev4OA
	ExmfVGoTRwVh1cwDIBMpGlLi1XNi5jDsSLt9lQi4GyF+AKWfwj35uMMW
X-Gm-Gg: AfdE7clfmIIKuBy8zfix5XK7EbLKilGCFbkK/wfmmW0eAnAZEFaxQp15uhLx2i/NokR
	VWmXhwRJ21+uKIY09C5/HVl6k6iJzEiqpsTODKRqtw/kCWF4sFIaJWROMhAuTD8J/h2qpIxGhyr
	RkoVZbjM2DRAKHJJlM6hZx1OjS7RKtth/18o4ejK1ASHiObZj+YSHIVVc0RWGJvFn2zhClKhJ67
	CtWh17Rhs/JZaz+50MLK7A6+SJ8vM1SA8T3qej39bpE0Vxbw09P2QcdeYl8iGGoYOicZuPOJ3HF
	FI1ABEqIbMj4UM8M45KHNGeLV2IsXUwq8fufc8W3PBPR8oC3kFqM8+AqryoQX1PkxzxqktX6mL+
	erEZmK7SpfJIxpL492kG80v1xXlV/mF8EQOakHHnNEISBnYJ9fLSSd5uIouslBw+qQ1rscvRll8
	MIUPYeRvxZ2nBXeWxUuEIUuD7LG1Ixd2KuIoJaYAU1vf3w2laNl+rHrm0/KQ==
X-Received: by 2002:a05:6a00:4b4b:b0:847:8842:8c63 with SMTP id d2e1a72fcca58-8479f2ea745mr1734146b3a.56.1782801449017;
        Mon, 29 Jun 2026 23:37:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:28 -0700 (PDT)
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
Subject: [PATCH 16/27] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:38 +0700
Message-ID: <20260630063449.503996-17-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[33];
	TAGGED_FROM(0.00)[bounces-115286-lists,linux-arm-msm=lfdr.de];
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
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bootlin.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED4826E0DA8

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
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


