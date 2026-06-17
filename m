Return-Path: <linux-arm-msm+bounces-113561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id faORM355Mmoe0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:39:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A906698969
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:39:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kHUvcRn+;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113561-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113561-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B76F0303685E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3F645349C;
	Wed, 17 Jun 2026 10:36:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763CB4534A9
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:35:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692563; cv=none; b=ZtRCZrMQIL9B27yVgyYqBckdlAqBjbIn3/Em67ZRD2MfnVrQAWvy/JRKsPEKKokR12hVlsb6cT+kdHesoPzvOTR6DuGPta3jlJv+GDbIhdoQXjcVmJDsu+VJc2VKVjFdnTQuFLGCGzDgdx/MjoI0zsBjPIkoHdapWUNGl4PEpE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692563; c=relaxed/simple;
	bh=9hWHT0ST4On0+z7FkEqiiZ7FKNgKKOtsAQNxNQQLtbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZX2iU7YRU3YgnFbgJn+oumUU/QYg2dVZyEMnc7xu6pBotmu530auI14/DGukhoN8G0IkK3wvtl/gh3Xfv+nFDhqeZbO4BJrXnmFufEn0eWvlzDNGiY3Vl+VofNkBLboIzWF7cEXqAvEL0+bDN+/DOJ44+hMjjjpX6qOZEk1zcpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHUvcRn+; arc=none smtp.client-ip=74.125.82.178
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30bc871ecdfso1195480eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692556; x=1782297356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBnOqWbH40FVhs8UqspMubOH0CXFQx0yaen9o+O7YM0=;
        b=kHUvcRn+JXibekQY+tk+20XWDpI2dlR0MTTgxygRnvrGYTY8FsQcKzRKk95sD1PZhx
         xW03rjWd2UrH7uzrAvADVpMTSrrM4gBiF5BbRSm35H6Et7g+9+vXpenYR8zi10gR8+jX
         THT5RmV8hFaE4m9t6daFQBFX4VL74I3FQ2tVMVFzx8zVZSLpacXjlbgCFCcNgn3WRWJb
         GC2hHu9/oUKHXkcZlXyIOH4nDEUe2E1zQyAi8hOsnBu2K8u4+wTS8uMWNlFO2zcGc4WF
         2GxtpBoUC0MQ2ZU4f8Q46nptASOF+x7PvT5QuIpjKi335rK4BJ4iqtAA5RFaZiBfuAVH
         jyKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692556; x=1782297356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FBnOqWbH40FVhs8UqspMubOH0CXFQx0yaen9o+O7YM0=;
        b=HlLnM7DNmLNgs2TkO/BUDkTTc6MOhQmvUtoYU/3uM3OoE7BWdiCqIHbhzMCTOwjxpT
         L7vYYU5ghmavSlwWOg7IfPyrazebBg2XluFiW0svqoLP25vpYyDhLYEh1tU+Mae7HF+a
         oUahONR/HAfr4QVo1UFRvGyJ7ra+riim2RrJ+Ww1N3zgx+F0iH0+slpVtMV49mqTw44l
         6/M78jUYLndxab/Ntaff3cz6JaeSBWB3KnFUwwgi2mCrPCgLeIjU8ToJ+X9FdFBzcmu6
         n7aVNUW7xNF1mY50woI/E7xU8krk1EMiIjS7y1Cb03c7YZkFhno0GStqEgo1DzZ3Sx6/
         cjxA==
X-Forwarded-Encrypted: i=1; AFNElJ+O941/v7potJBTfsXnWq7cUWHrpidv48GiEldjIT18hAW+bMw53K/BI4rTq4CbWrFf9ohga443ZQm5N7YG@vger.kernel.org
X-Gm-Message-State: AOJu0YydzAwS6i0SqaTgXlRIGb5U+TqGoii4H1L5asgw15ZihBbPp00H
	mNanevHlMAs8KhTPKFSQkPSVkSWDx2NyIJSBeYj+aatDoCx4tV1gAytB
X-Gm-Gg: AfdE7cmxy5KZt0VjkPt+qIkJhuAcvlP0DQlvwjTpj0Jm3P3VIlShcHqpRuolomz2Kk0
	cGo+5UfcY0kSHl+oYmBqlSIEOnWfRdxkkDNUpRquss4mmu3c2/U0oC/WILx3xKFRQqFN8Nf2Nwf
	Bj29v4wMW944+U2meZW9O28qXuNtg0GEqudWOhxdWNCoQfWZxPGVcswBP63Te5rYTnyjdxefjdw
	WLB9i6j8wNDSVWBDUUh4TljB/TTb7quTxsgsFaA6R0yKeXHCUeQUya9sXpCSZ2GTaoIr0H5BLuk
	pvQ/t2uDiluG3VcgIWYSffsynEiwosK84GcvpRMCsSOJ0Mgr6kitkJlIOC3EuFB4WTcJSbLPLN4
	bhxkHJSZ3ir04w9dSsSsaJ7cnF4xAW5ssH1qSYK90AXCsD5KTVwK683PjBrsYBnFvFpYheZ3Bcq
	QbqJw66BCGs4vSRo55nAx54WtZUjKy9hCuYGKblzOFSvlcNEI=
X-Received: by 2002:a05:7300:80c2:b0:2dd:8ac2:9f7a with SMTP id 5a478bee46e88-30bc9ab54ecmr1861524eec.11.1781692556439;
        Wed, 17 Jun 2026 03:35:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:56 -0700 (PDT)
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
Subject: [PATCH 19/78] ASoC: codecs: cs47l35: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:36 +0700
Message-ID: <20260617103235.449609-20-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-113561-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 8A906698969

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs47l35.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index a8fe5a99a8bb..c22de7356ce7 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1566,9 +1566,8 @@ static int cs47l35_component_probe(struct snd_soc_component *component)
 
 	snd_soc_component_init_regmap(component, madera->regmap);
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = snd_soc_component_to_dapm(component);
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = snd_soc_component_to_dapm(component);
 
 	ret = madera_init_inputs(component);
 	if (ret)
@@ -1600,9 +1599,8 @@ static void cs47l35_component_remove(struct snd_soc_component *component)
 	struct madera *madera = cs47l35->core.madera;
 	int i;
 
-	mutex_lock(&madera->dapm_ptr_lock);
-	madera->dapm = NULL;
-	mutex_unlock(&madera->dapm_ptr_lock);
+	scoped_guard(mutex, &madera->dapm_ptr_lock)
+		madera->dapm = NULL;
 
 	for (i = 0; i < CS47L35_NUM_ADSP; i++)
 		wm_adsp2_component_remove(&cs47l35->core.adsp[i], component);
-- 
2.43.0


