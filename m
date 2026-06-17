Return-Path: <linux-arm-msm+bounces-113587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uz6VGMF7Mmp/0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:49:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F68698A6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:49:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kj1mA3Ap;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113587-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113587-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D93FF304BF3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CC748C8BB;
	Wed, 17 Jun 2026 10:40:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E90B492180
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:39:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692801; cv=none; b=OkFJziHHnRS5adoQ0SSO3/SYzWv8SJUPDZsVD1mMXyPjjh596BeLTjB6CsuTzE2Asjvr+NlJfE/nXVCmvQxLA3+46IOLmdsUMt3d9KIZSmyiELVeJtdGnnTsfDSHHk1P3aYBgy76cz+hBmjmOz4Gk4TJnKzNcC5gsf+CMt87fvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692801; c=relaxed/simple;
	bh=CfPSrFVheY2+VrZHiVHqixZx/q7uaP11RkObiCVMyqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LxEpqOVImvSf1lSLXCrl5a6Qita/49MY9MkonDcZVFl6FiPKgwRaBDCs8reC1YSjAKer2xnM5yOSGusOTd0AK7yomRbHOiXFkO2CK9CPcpt6/g+ng92dEd9zzzTZ4tiA/Q4EOi4gjYfuUYZ9cw7GiPZIA3reSJ3NiCwrzPmBjno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kj1mA3Ap; arc=none smtp.client-ip=74.125.82.177
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304d8362a58so603920eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692796; x=1782297596; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9NimHoJxrkt0fKeQ5nDtc/hHZTnOxU7Jn5N5pQIslE=;
        b=kj1mA3ApmfFqFUXGU6/LIlztl8DgfAT8Y/wZ9lnwm3AATorYnwu3VW7l1vzJLCmKXe
         6GGmNZXCT+65pg3y6X7Wx6objXaeDjnyegB3Vc4sybXKMghwDqpIo98WC7v0YDT/YatS
         pAGTV3AmoIs4DOiuQEUpd5R/B+/Uzd113Rqx3TfF3BS2km9EP2ZcLy0Zrle9zO2jA/kQ
         V2jG53JBgw5sPS/4bYKhB7VUPXXJnlkXNCPCTtxxFHebkGFkGWHg0S6Vr+ix7R3R5rFs
         xkjKBOyUFv1xTdakBpNx0Acn6gV+XYJJm7QdQi4jwmZYPJS8Cz8olb2jdfcQvRZg9tj3
         ml9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692796; x=1782297596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9NimHoJxrkt0fKeQ5nDtc/hHZTnOxU7Jn5N5pQIslE=;
        b=BZie9vARrmrlfHyLy7BTZ2/Gb61gpoPQ9Noa78AbBjb1xG4v2HFNG6IoicGAVClZhO
         k0MXQtiLQ/0idDpK937R/7ue9TiRwz/RkXRUBLBA+m7QfSCShUaNHOjNo2eY5dS9G9ow
         Txjg8O/ZxZzqnKHNA8limUVLb0U9NvY3q5x4B9QvIjm1K5L+1JZLS+AiumwZHjsDVztI
         TCFrwC8jAN7GKTk21ir21qpQ6CK6rqPW8muJKTwFnfDtfAkJZ0C4SdS4xTzXkhIgnppS
         RM8Uh1OIYAvfpaIws2uB6pKbi0c7oya6VNjUtdcAc0wDTlBoX842YpPma4LdEdaZjrWR
         03bg==
X-Forwarded-Encrypted: i=1; AFNElJ/XgnFAQCPqN5VK4ZhP/6Tx9sSDhBTgYfF8pTvtGSFvrb/QPRHTJKSESPd7UWhLpRzIIm8axlLv49E64z9v@vger.kernel.org
X-Gm-Message-State: AOJu0YzUDiO4d85W+mMu4KRSU+WHPT8qaypDDwEl6rGQWH8AU4HNXqFw
	W7R0oMxV4JIGFQWgzVPl2qU3A+TATRW1z50j7tILEla3SYeIlbBjunIM
X-Gm-Gg: AfdE7cnfmh2iOTnblSSv8ZZSoV+mqWQ4Poh1zrwxw3l6P5hDekcCJr0to7UfWR89NUe
	ZcSKHrI3MHhBDQksZDN7Dgkl/7vPfYpg1YpHRs9qdIFhBzeClixTZNe2BwIPJ72WOk+CXzwP3VJ
	0HXyJhMbg36wZT6t+Icmxn4acv4TslNwZUkyxrSNbr3joWArEavBjfMYrn5TvRztUYXlptomX7Z
	hE8T6h64WYX+QJAWjXPr44s9bwXOPXczjfILHpMD1csJyQ/qNXraOCz5wNVqHWth4evDATO4sUh
	j7afV8nfHLBhg+KUZZEFs29Oi5m/fY6V522o45eGblo7jZTqWirqRttA9k19ie03iL2ZhtCdULS
	eoGYJpZeAOr7HL09M6OzKtO3SlEAMvKrnyiFbQepghGyIpi2tv4BspQHh/tSSbzjLk/FbmkYESM
	e1xyee/RkCvjQwca5qcUnf3O8GSr0Xfbg1KaWBjJq3bOSca/zmd4bMxzNsfQ==
X-Received: by 2002:a05:7300:3aa8:b0:30b:df3b:fe94 with SMTP id 5a478bee46e88-30bdf3c0705mr266574eec.3.1781692796467;
        Wed, 17 Jun 2026 03:39:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:39:56 -0700 (PDT)
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
Subject: [PATCH 44/78] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:01 +0700
Message-ID: <20260617103235.449609-45-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-113587-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06F68698A6F

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt5668.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index fed6de40b8c8..1eba4d559c0f 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -986,7 +986,7 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5668->component, RT5668_AJD1_CTRL)
 		& RT5668_JDH_RS_MASK;
@@ -1053,8 +1053,6 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5668->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5668->jd_check_work);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
 }
 
 static const struct snd_kcontrol_new rt5668_snd_controls[] = {
@@ -2356,7 +2354,7 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 {
 	int value, count;
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	rt5668_reset(rt5668->regmap);
 	regmap_write(rt5668->regmap, RT5668_PWR_ANLG_1, 0xa2bf);
@@ -2400,9 +2398,6 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 	/* restore settings */
 	regmap_write(rt5668->regmap, RT5668_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5668->regmap, RT5668_PWR_DIG_1, 0x0000);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
-
 }
 
 static int rt5668_i2c_probe(struct i2c_client *i2c)
-- 
2.43.0


