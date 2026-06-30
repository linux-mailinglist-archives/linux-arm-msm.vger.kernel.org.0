Return-Path: <linux-arm-msm+bounces-115289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tSx7AO5kQ2pQXwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:40:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC65B6E0D49
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:40:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QUYW2Ghd;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115289-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115289-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5E058300E307
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 06:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 259F13CF960;
	Tue, 30 Jun 2026 06:38:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B707F3EBF3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:37:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801481; cv=none; b=OPC5dPsVsHAwhwumNpneI/FxaVqbDJ6OCd6CWmf8McleEwOaxxy5qx6t64dAHIT50FuVCydGniPxZUHXXsQfqiZ589nGpXD4ZJB9hs1h82+cQiZT9JqLvrn3jdihtoPoR/IW5cpctd5lmDxiZ055XlAC2bsqIO4xLCjJ4bAQgHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801481; c=relaxed/simple;
	bh=71e6v5A0pmTCpY/muFVgY0bKxBOo24zj6ulqSaCErLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BaHPyTzMzcQokS1EC/82FtbUFlVzK7hyTOyyKeUKoHoeJrU6xkPX2GaFEKBF6OlyTmXOna2GionLEKC0gdvM7N7lCq7ceTw/i1bFf1WS3r4ypyLgfwHgjX9mQF1sB8mjq+/8oOFrIAeXwKOx7ISWEWwt+yJYapZYHVfFtwT3weg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUYW2Ghd; arc=none smtp.client-ip=209.85.210.178
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8478fe07f65so799471b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 23:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801472; x=1783406272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=QUYW2Ghda/7TE9utZn4MLaa/1S340Km4V7AppQb67ZlXL5tlo/EMNrq8rDHxt3C0Yl
         vZFt12UguIehXFBNtF6JgkTsKEW/5J5dtmmMoQg/8wzhFwrY8IB/rT5xyXnzaQpEIqn0
         QiQLkHaIQObd4qRmaD88IhMJXqE1GGYxtsHCn6W5PL0MKkvUDkHdU443vOcauT1IThZB
         3CqPWTJF3Ku48byz9VQ6BJn+ZujZS8xtx+E2gXMzx1Ptkv6GJt9R1lMuMkfGnhP3LlIe
         2q7QiuahTPwD7hRmnSzMBu4u5AhkFM2p2SqngE7x1cX4KWwYobhdxVloKIC+wTae996t
         JbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801472; x=1783406272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=eOXKqWMP1YgehnO2cMh0En6CUCV1Ah22Y9qv4sttKHsJG3mRC8r1yyDVV3SO+Y2v29
         PM6QztCjncmcKKTEUmHEMQwvhEUaOX0yXxIz4wa3MDfZ75GyTN1SX/uXOpKfEgz1tMQT
         ddPPMcAUt8trElTTxv6ffTn1jNPTP8QB1TCgVM4KTus4cs5oSLJuAHIVUN3VaUZSFw/i
         e43ogr0z4FSsuxFzE1Aj98+JPT/zMQGpryD74KthvCXd+pSSWv0GOK92w7LdgiJoyAH0
         pLGlESwyl2hPcZFznhQvs1ca30OFLqW9aKA5TkMzewB+t3LgHvuLNo/FqNYtO8ERcmPh
         wbIg==
X-Forwarded-Encrypted: i=1; AHgh+Rrqz/phkGh/t3FtAJvsTRQlH2cZqXDtacxx2Ac2Dq/p6v1rp3XeNThQk5aPCvjJVZEExKT0S9qmQ+vFxjYF@vger.kernel.org
X-Gm-Message-State: AOJu0YwyGliXU9+bDwFzx7QEAJb0MFsSdnkxTAQd0wVdiXHhMS5cb5Xb
	MTsdkJPKwsGvJ1TZeIPqty8do36Phu9dfsRAyrD/GTeVALiA/6DzMcF5
X-Gm-Gg: AfdE7clZpLLo1dX3XbHQv7d0u1qAPjxiczEKCpqzRgJuh1+/NcHXFF8UUkOtI0xio3p
	5iwGEoTciEUfiCCi6M+LtqmGoUupDJS5MnbdGGkbV2YE+mDX8YCq7gxW8Ot+BI23qK3Xf2PRbUw
	TOIhvgKF8Qw+u8hGXdy6Rxph2pYIF6o7hyImowZXF540/y2UJePM3pUuRMlNC0EUsZIULCVnsWX
	alIHU1LYLZOD18GpblXG4i2SuboQWkCAcViKdJLgoJpLlfr3lzOS6SwY519qEFj0jkYR56mp5AI
	aSsqnGXlGfhHFYWmtt2ujEi482OtmMoaxXwRL+zSQFoJLKMW5CtaOgz3c81QNBsnD3dMIflAfhd
	bXGl6LxoTON7Z3u8lCxzVyDs2+R2KkYMo73heomRRCyvRpVeTlhyun4Qnz4mW0G8EFWAoyeeCqQ
	0NLCWknatD60r/w+4Amz5IeXUh62oT4Mfz/WqlxrVsI84eup8=
X-Received: by 2002:a05:6a00:3d0f:b0:847:8a47:264d with SMTP id d2e1a72fcca58-8479f22aa22mr1967010b3a.36.1782801471671;
        Mon, 29 Jun 2026 23:37:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:37:51 -0700 (PDT)
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
Subject: [PATCH 19/27] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:41 +0700
Message-ID: <20260630063449.503996-20-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[33];
	TAGGED_FROM(0.00)[bounces-115289-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,realtek.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EC65B6E0D49

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt5665.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 48f57cd0920d..1d987472ba42 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -1208,7 +1209,7 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		usleep_range(10000, 15000);
 	}
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5665->component, RT5665_AJD1_CTRL) & 0x0010;
 	if (!val) {
@@ -1274,8 +1275,6 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5665->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5665->jd_check_work);
-
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static const char * const rt5665_clk_sync[] = {
@@ -4564,7 +4563,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 {
 	int value, count;
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	regcache_cache_bypass(rt5665->regmap, true);
 
@@ -4601,7 +4600,8 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 			pr_err("HP Calibration Failure\n");
 			regmap_write(rt5665->regmap, RT5665_RESET, 0);
 			regcache_cache_bypass(rt5665->regmap, false);
-			goto out_unlock;
+			rt5665->calibration_done = true;
+			return;
 		}
 
 		count++;
@@ -4620,7 +4620,8 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 			pr_err("MONO Calibration Failure\n");
 			regmap_write(rt5665->regmap, RT5665_RESET, 0);
 			regcache_cache_bypass(rt5665->regmap, false);
-			goto out_unlock;
+			rt5665->calibration_done = true;
+			return;
 		}
 
 		count++;
@@ -4635,9 +4636,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 	regmap_write(rt5665->regmap, RT5665_BIAS_CUR_CTRL_8, 0xa602);
 	regmap_write(rt5665->regmap, RT5665_ASRC_8, 0x0120);
 
-out_unlock:
 	rt5665->calibration_done = true;
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static void rt5665_calibrate_handler(struct work_struct *work)
-- 
2.43.0


