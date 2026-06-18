Return-Path: <linux-arm-msm+bounces-113739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EzvVOfXRM2pFGwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113739-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:09:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EDA69FA1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:09:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="AN/IXmhW";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113739-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113739-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E7E653010909
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 528013F0A8E;
	Thu, 18 Jun 2026 11:09:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBB93F0759
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:09:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780979; cv=none; b=MuoZQI85LUjtp8x5PdKHrA4v0Q0x3Jp3fLJylDAWUk22vxVH1T33em8S6Mpdns8majDJtzJnBPP6lDQSyzo4uNHvcZ37ygp/wgfWNnw4WpAiFy1XgL+dQfi5Ef8V3PHQpRYt/VqaKjmQGFNVCrc96IRAOvFuvurwHgHOi59ghOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780979; c=relaxed/simple;
	bh=VveqHJbkYEX4uhQvFM0c21ksOyeuRsbn28lpWqPOOFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hN6S3ojwSD5jjjWOCudgspQtDcHsyQEopOxvk1866vo2ilolTfKb3khCuoARAQOhIMWe9TnJApJYb+HVW0sQwqmGSUksYtBBFEe97Zh/oSExOtNcUHr6WR9g0QSundc/zrRY4AjxVfEBFkeVbOUjl9lsrJiOVVnLN3GCkQw9eW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AN/IXmhW; arc=none smtp.client-ip=209.85.215.177
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c889ade5287so396563a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780977; x=1782385777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EWJ/7U705zHTEAWXLYlWm+c6/Dx8tZg3vpf9oUByAzw=;
        b=AN/IXmhW6jD4HamXqatDLn6Z/vgDzY4A6iOwMeLuy7i35S4o2AiZKkZU4SkPN2aBLH
         AAWbc9gG2qY2w80IqpVsdrQoLRtmUviQdvp3/sMyAQKhC8AlH95Qx+D6Mr51b8KoeP+6
         lpWv4rd1gab1hOdwHuYJhrd+5GtbukMH7WsyXway/jmxuYZZ7Eh9pk5zGqJdWfHSiHw4
         setGVTVwaT6LfQJ4Xr+Qmcp/3nq6qn/Ru61GTR5szikaZnIpfYCP7Dsis5g0m9zLUFnB
         JhgtLvrQSGJxmtBmhzmaWQIQwbJi9tkmJqixBS6RCucfboSrrxcPqCeH2XszeqnlRtYx
         mqHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780977; x=1782385777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EWJ/7U705zHTEAWXLYlWm+c6/Dx8tZg3vpf9oUByAzw=;
        b=nZ1vM0FiGM1F5dWPaL2KMGEHPalXoJvX8YfquBPSaKw95SU1ChzpTkNd6jJyRVMwlG
         C/mp54Y/Mrg0MTdprADCDvGfJOdr+3U9SY4c43XSWcLQ7blWdDe4yNAlmwklPlP1F0bS
         S29kyOmAiGVIuVqxhmSDJFl2gnodZPaKnztNnLbJbfb/PgS6r+psdr3MdB04vlmMJifK
         W7g2XUIAm8Of1dt74vlaU1/dyQIJ6+xxP2TX2EaQfMP0PgFLxwUAiLlVfz8W8m37cK6t
         QuXywH65lCZzHrquToniNuSL9ro6e3JGfrkM7ea7o7vjaXhEJOWr9kbJ8xbDpb6QtzAp
         T3hw==
X-Forwarded-Encrypted: i=1; AFNElJ8Y4FC0lmDaXv8FKba2TcaxJNHSPYVONYnI7/+B1DxmF8uFOEasZq2/ZwwI7/VILXk/PWul7o58ELXsiRfK@vger.kernel.org
X-Gm-Message-State: AOJu0YxR+ql+LzRszoYTgYOf1rxK9SdDyESoqFoYYskDrhHEJCJggNsn
	OyAahDB3kGC8wlloYgM91SJLGCstSzk2E8S0ckqXFYF8MwsPMvJGWJTp
X-Gm-Gg: AfdE7cl7HQgeQnJLW6BHIysNKmXOxHTHoHaxGdH1zZEhRo8sfvtfVIR5NuiwzCz0/eI
	MEA3dbhqj9DYGNgpRIFtJdNODSgg8x/FRvbJjg8rsYnJnlGYEaK90K8aM7RaZUnLJkcH7pNx8Yt
	nvstYOAxuWK4qlheGlejYzUiQG0Aud/ONqqUvjIlffhrJ3hUN7zBdZdgDMkmknOYgjsPHPCTKSP
	GW49u2pQdYjR8hjjGdQ0I1W0XIT5OyTV68jR9KhkQ9x2AplEmJXZwpVKWJNYQ8Ws8SJb04aGXPt
	lR4d7YV3Ei6AVUNMEPGl9X+bJtnJUHUNLxIkpDcFWPxGumCO/98XZOYbL43noG8WB0/kjZ5OFaR
	m2C/MhxwlwCLFUzWy76JykVK4CVJe02C/Ybt9HZIIWMqrsZWOS/o+au7sUI4uPLwZCeIv3ZXp0+
	Bn6pu97aTJ276UUzAWbLbHKB24NC0m4lQn7Ri89pAFFO1lOW/6GCOypqFRuw==
X-Received: by 2002:a17:902:f547:b0:2c2:c0db:964a with SMTP id d9443c01a7336-2c6bc23d4c8mr89883015ad.26.1781780977509;
        Thu, 18 Jun 2026 04:09:37 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:37 -0700 (PDT)
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
Subject: [PATCH 62/78] ASoC: codecs: twl6040: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:11 +0700
Message-ID: <20260618110827.232983-6-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-113739-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 82EDA69FA1A

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/twl6040.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index e10c51092a35..6b18252fa8c6 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -273,7 +273,7 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 	int status;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 
 	/* Sync status */
 	status = twl6040_read(component, TWL6040_REG_STATUS);
@@ -281,8 +281,6 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 		snd_soc_jack_report(jack, report, report);
 	else
 		snd_soc_jack_report(jack, 0, report);
-
-	mutex_unlock(&priv->mutex);
 }
 
 void twl6040_hs_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


