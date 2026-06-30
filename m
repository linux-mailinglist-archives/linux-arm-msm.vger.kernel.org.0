Return-Path: <linux-arm-msm+bounces-115278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Ld83EpplQ2p0XwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:43:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4F56E0D99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:43:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=P5mGfMgn;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115278-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115278-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 738853027126
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 06:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF72326928;
	Tue, 30 Jun 2026 06:36:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27722379971
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:36:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801389; cv=none; b=ZpJsH1U7B1s0ij4vbFiWryjgZOtYvCIZMKvJ3811tli4x/VJ+0saisleItPDHLrX+QbbJWNN43/eEzqzj/21o82JQAFw42PIytBpntxq8dOxTkua6IUZ9N2EvgrZwBQwIS8AiJ44q+EeMkRxUjYFTme9Vz4TDxFCyTBLxC9MaK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801389; c=relaxed/simple;
	bh=+nT6I4Pca0g3yL9/0MMMJ9eU5lzYcdje8+rHxYbR5Lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=adHwINHCEGfI2gOTNJQZMxJDE82i6l9Cdb2kFXASAl0pYU9giVv+Yh3SVXZJdVx9bWGOPnkTfpCAcIaQ6H0jC7GXXNBNwKWP1lbAopS8OAzVkEbtaJnqF+A0zMSOUL2SSNG0uImKP4gP9iQItuOYGrfoYnHIb/FCTTqEALVQIbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5mGfMgn; arc=none smtp.client-ip=209.85.210.170
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8478a25f268so1050588b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 23:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801387; x=1783406187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=P5mGfMgnYwYeSc3VEEWtIjtm29Zz/4VHRHeQJNDbW1Tbnzk0Jhi6QT4LgJJMngXM73
         levt4j+s2TYA/fxjKkZ0IFZexKccO7ZDh1Wty6VaTEXook9iLnOx9DmTbGUKbd1QtzWr
         VNQb6aq9reelOkXVna06oKTUcLfLAPcO1kruwFkpp4cfmy9oSu5lfGQ90gZaGNmE6CRP
         2+pA2V5h/EcplylHqhT/HgZXimwWxBDq/zefszG8yq/uDfF/34qTH6iNOelXuN7W7PAU
         Fy45EhtsTJYLPakwpCQws1xMQLa9JPrsMzXaoQk6mw1QDWb+Jw8AxWnfRoD2btNaCzIr
         u9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801387; x=1783406187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=rBAPLuLaf3R3a5vX/L2JgafxERT9JHHzWrOKedvcuDAvQZRpZF46jj7xoWByPxBo3k
         8LA9F0Dr72OGkqp8CK6BIeXnD4XL0IIU2oR7WFhcIVbAOlBL9QymVP4JUF9daEaY3CpU
         9iMdKX3dZTlEEUA9WCpgMWrcj0ff6SvbBBE8T3XrB5gmPYta9iuNFWLuyhy0EMznMgN+
         w8Q+t47B4DAuPEmcRnCKHYCOgxNhC3sYK5jd/4Mz2dN0q9Ceqt4lkGgSAc6qH1P8Xjt5
         C+e8jmvCLMo3U46hWmYOtrSTThnDkSWfLJqimHr08HAlRRTUwUBF1ADMN3L/hOR6yNNk
         U/7w==
X-Forwarded-Encrypted: i=1; AHgh+RrW2SoAHFtx8mMIAw33CJFLWpotx7mIDVGgPHBVmSFzIoHaM9u6xgZ77Yd5d+Z0HxaBmvo9GLCQr9smAmFI@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjqt+14HK+x94WjHdRO+iMjagrUtzzhN20X2tUHXaBu0hDlYDt
	aPYrm7h1ZrZLIZE5wMpVcef1hjhfVKR+rIwFtaFAx51y+CE5WcZquNiz
X-Gm-Gg: AfdE7ck1SvHSf9nVKW1AtrMtVPtYofc3NwnXKkLAkd/8ayZJ3kvGtRz4nO1PWSxhUUR
	b5zLkjr8E6dn5Cvjnr8Pti22WvUOMqinrsBP+pXQcR0l/hqipYY/dx5O4SSUXXmsdl23vqafl31
	jjdggr9MmFJEa1Sxta28iLo0s47YXyanERbgh8gvG4HQGe0UmGHa/sV9iZhCvMZ/C9dCK0EiNTI
	XmEFu9qTBGppama7dAehPyZRNV153TIEGk/vXuLtMQ0yEetipjadb/oFE/R/AwPprA3VAdKPZHC
	fQ1/ihDNos60qHKqxEWO+1roepe9P2prOa/eiBZFgxlulvLWKOYr3C65aoeRpoQK4yRmI/2NYPF
	G04DZ2wrNPzjniiizVAd9K4W1EtUPHrWstWQmImgOQARuTaQvMd6ACVCl2xskDYLd81+vgBtisk
	DOy6DMX27Nenxh8EEspr/sLU+7sytRrgRu65Y2npbC3ZcfI9k=
X-Received: by 2002:a05:6a00:995:b0:846:169c:d815 with SMTP id d2e1a72fcca58-8479f2d139dmr2002482b3a.60.1782801387427;
        Mon, 29 Jun 2026 23:36:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:36:27 -0700 (PDT)
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
Subject: [PATCH 08/27] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:30 +0700
Message-ID: <20260630063449.503996-9-phucduc.bui@gmail.com>
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
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-115278-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ti.com:url,ti.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F4F56E0D99

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/hdmi-codec.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 13ae9e83bc21..bc2c22436ba6 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2015 Texas Instruments Incorporated - https://www.ti.com/
  * Author: Jyri Sarha <jsarha@ti.com>
  */
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/string.h>
 #include <sound/core.h>
@@ -452,31 +453,30 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
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
@@ -484,8 +484,6 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 
 	hcp->busy = true;
 
-err:
-	mutex_unlock(&hcp->lock);
 	return ret;
 }
 
@@ -503,9 +501,8 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 	hcp->chmap_idx = HDMI_CODEC_CHMAP_IDX_UNKNOWN;
 	hcp->hcd.ops->audio_shutdown(dai->dev->parent, hcp->hcd.data);
 
-	mutex_lock(&hcp->lock);
+	guard(mutex)(&hcp->lock);
 	hcp->busy = false;
-	mutex_unlock(&hcp->lock);
 }
 
 static int hdmi_codec_fill_codec_params(struct snd_soc_dai *dai,
-- 
2.43.0


