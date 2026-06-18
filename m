Return-Path: <linux-arm-msm+bounces-113747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AMj9EXzTM2qqGwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113747-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:16:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EC669FAFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:16:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LvUpjONt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113747-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113747-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00E343128A2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E26AD3F0A9C;
	Thu, 18 Jun 2026 11:10:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C0D3BBFB0
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:10:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781047; cv=none; b=cdTtz7Hjkn2io2Q1qej7kSkCpQKrIMEMPl0dWMVdNlIzR+woSjsg/xF/W1Aa/dn/eu/d1x/I9NrX3K4Yk2fE9NelMnI4+5tXRwBxvvKvDHxm55r6CdnQmiC3qxu64g26BzWuccUbiU99mdWhAej8jIyWFuF0MCboMETX9qh8aPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781047; c=relaxed/simple;
	bh=um4XzRK/FYmWBzEASpvNytlSiXtvP8Pb9Nu/RJVt2Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JaN9E1inwNOVjYo6a+vrZhex2mFAD+7Ry+D0j167oqpCZqYD+2Lu4Ao2+obkO00OObWa3L58jJfJYaEibStM1eg6hHSvQMAALHGqMhawHwDDFveyoulk8d5wEZ4bgp3U9EHkSM/8IOOR8OLdv2ILPT3NV4QaLsXAfSn5R33jGIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvUpjONt; arc=none smtp.client-ip=209.85.214.181
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c6d4851142so9089725ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781046; x=1782385846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McfH8rWJuuVUcm1G/yfvz4+Q+IQpATUYtGec2KxjrME=;
        b=LvUpjONtNaCp2YPJvEMCV2DuuZc/R8xSobV4T3+6JrURu9U3iKotkjMv0k34eD5vRa
         i+ortNss+csfFspCdvjXaZnvewUDiC6z8bQizlGgSKa6XVNtFhnE+NG3/B/hQ3UOpIJ7
         bDSh+/D4324+LZ0lBKIq8wPyaHCxihPTzq/p6N1S7Ig4cAyNZX5USCnO95HUCpKr+SZ8
         +D2dBCf+iWJRrZ+UrBnrSd6yfNEVpS/CPvgYcR0OobjmqHrXNXbKHbLfhDEvpW5rId5j
         W7cxLEuoZ+tEzGQ1dJJuC6uvuGXsg361nuBQL3tDuyH892DBTM7Mvgq740yQ9T/4bz4Q
         kdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781046; x=1782385846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=McfH8rWJuuVUcm1G/yfvz4+Q+IQpATUYtGec2KxjrME=;
        b=jxWBs0nu93Fhegs9W8qxOdKA7Apc059BeImXsoPa4XtLzBnd27lPYZrn2KqVj4VtdX
         H4zvDSEv4gA8nADnpIZxS79brhxCkoZkLRix5ZDo5zPMI+2FmDclrvQtxe0SIIdT5iGu
         NohyXidltIHqvJgo8P4F7+j364MGArbmUrc9kx1jmpEv0zLcSMlyiZISR3eJn6LoClY/
         G7n5oYPRBjsZLYoxx/nArgJmRF4OBLpCGx0yc2WrbxwTCR0O9qmdi/uLoWSmvNk6Lwus
         5519iuHLnFlRN1GbUeXWj8LRAXrFcq4Rpz105aEU7PjhbhcTjCGjGC4SEHtQilR1rPuS
         t4Qg==
X-Forwarded-Encrypted: i=1; AFNElJ9ryLY5QP+YI4OaECWnG9nCUXC2UIG1fIQrAXBOvocQ4J4EnLzw3f4IzK0Gb4Jy41dVf+8u4whKSfvFMBfB@vger.kernel.org
X-Gm-Message-State: AOJu0YyrMGfLlxpUDNQlp5IKt9WPDmmbVWqGz0+DtxutF4WfseM1oTxM
	goJWLGnpbPgUuTHWYZfqWS4hitGLWFSKldq5/drTpvLmdpDfOTcouecV
X-Gm-Gg: AfdE7clM6h3bNuZz4eJSIHMjQJW01npHW9G+21lL16e8XGGCZHFBs1isghw4hyDq/SI
	GhDFXUZ7nJB596MgeK6Cu+uiTYtuK9xQHX2gGAzZHU3RNTR85YiLcSbeGGFmeKUUOIUi4QHT4qk
	cfPd71kqvQ3P6e6ZDiGdUdSoqi49nC7/lqbwtz3j5tztMVYn0DteNQb2BlZdosIXWARAinjbeqq
	2vcJMdj2r9UaGGjrlbPNUgEVBY0rlFfTCwXwspxTr0qkgsUU8n/0zq98wZ2NZYTbIa6WxbdUM/H
	Zmye9c3vA3DSaMMet5lPah2i5s6iFOqFmT7fcuR4c3Zsqpzi4PhdMPdyD9cuA7TPjVuzPgyK6KH
	JA2ZhfJD5K/Td0mjy3kBqxsr0ZdsTUCZbxQeXwrz4lnIiavBypuDO5QKNFaf9djfTaQkM9JBQDu
	0fc0seM/H4ah//p38ZcKpIBF5XUe/Y+5npYDj5M9yCQCFrtyE=
X-Received: by 2002:a17:903:22cb:b0:2c2:343:88b0 with SMTP id d9443c01a7336-2c6de666d41mr28427805ad.19.1781781046290;
        Thu, 18 Jun 2026 04:10:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:10:46 -0700 (PDT)
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
Subject: [PATCH 70/78] ASoC: codecs: wm5102: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:19 +0700
Message-ID: <20260618110827.232983-14-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113747-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0EC669FAFE

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm5102.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index b4d4137c05b4..d0b6707ce62e 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -667,10 +667,9 @@ static int wm5102_out_comp_coeff_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	put_unaligned_be16(arizona->dac_comp_coeff,
 			   ucontrol->value.bytes.data);
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return 0;
 }
@@ -683,12 +682,11 @@ static int wm5102_out_comp_coeff_put(struct snd_kcontrol *kcontrol,
 	uint16_t dac_comp_coeff = get_unaligned_be16(ucontrol->value.bytes.data);
 	int ret = 0;
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	if (arizona->dac_comp_coeff != dac_comp_coeff) {
 		arizona->dac_comp_coeff = dac_comp_coeff;
 		ret = 1;
 	}
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return ret;
 }
@@ -699,9 +697,8 @@ static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	ucontrol->value.integer.value[0] = arizona->dac_comp_enabled;
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return 0;
 }
@@ -717,12 +714,11 @@ static int wm5102_out_comp_switch_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.integer.value[0] > mc->max)
 		return -EINVAL;
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	if (arizona->dac_comp_enabled != ucontrol->value.integer.value[0]) {
 		arizona->dac_comp_enabled = ucontrol->value.integer.value[0];
 		ret = 1;
 	}
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return ret;
 }
-- 
2.43.0


