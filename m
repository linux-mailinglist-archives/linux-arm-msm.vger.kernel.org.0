Return-Path: <linux-arm-msm+bounces-117663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HxmcN3BeTmqoLQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:28:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EEE727565
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:28:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Dh2SXtFf;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117663-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117663-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A78630F49B6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EEDE4968E0;
	Wed,  8 Jul 2026 14:20:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A624C48BD5B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:20:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520410; cv=none; b=LgOYUAQuVBuRPd6RCbTzFX9Fy4HHRa5lL/B4pRBjMaYGXwNYvST3QHSpTG2uccIfMI5WImpBfUAJAOub6WIle3LCE4Vtfrj5EfZAwThV2/l2SezTNji2DK8IVMKkzAniWKOX8JmLLzLHj4djMQCp2s2fZLwhHmRbbjfOuXIGYDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520410; c=relaxed/simple;
	bh=+nT6I4Pca0g3yL9/0MMMJ9eU5lzYcdje8+rHxYbR5Lw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OTrnEFE+YmerABJ8FVhg0j+9CYO+cdmSJ0k7UBrUFn5m5Vpdb2v1Y4SA08I8zHLJBGSqvJQbzrqfmIuwzs31nWvL0ExOh9yJOHDBf3xzZX6UkNYlQASDe97Jud70F1f7+gCapwdskH2emCIfGZLwz6SFjQB8IzdRrYAtAhDXDgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dh2SXtFf; arc=none smtp.client-ip=209.85.214.171
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c7c61b5292so14149635ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520408; x=1784125208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=Dh2SXtFfTzz/wBOBCb1kES4k8pWeeScR3nlVFi9pqJ4rp2Dycnnr+YgcklzW/qjI3U
         NZ91ELzl6XDDhV/8y2yj6Q6VkVeLe0X3Lt+rKLlH0lmv3nbZ9jED4euIGdRrPtUc/oQ9
         L9d+HOXV+n2tzSXeDUQ2UqSOBhpzpLfqS1Nm4XHk3pO1MP6mx36NgMWn4ssmKwmCNeoy
         SJ2Z6UI0/wNEURrhtF7wSyh3d+QS1+RuLcLohADskcr2bUcFEEfmuYwNQFtBsfFPkfee
         rmBBl92sFLfZJArj2ZG7ySVZVU4+q8p8sXc2k+YzRP8PsL2CmV2IrnKUVAD5vrk5im0e
         7WSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520408; x=1784125208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aUrf6Km35HLEs48Iv+5EKVZGrilhk0m+5i7bYMdUoc0=;
        b=RuPy4IghWMYwi0LHcK1gNg1bmAUSuZ75O3jUxVw0d3UtlkRqWfTjJSnMT59qA362We
         9dwERYzhHUFaFqyQO/5NUfZJGWE0bnFsiXM+rblN/VJCCPkdsKmX/L3m/8x645RNC1S8
         tds/9QsiJ7yUa92fBe1tXWD595IGdz2/p+rS5jtz29XF6FxqNgpoFoJiWn0tl+G+sxip
         CZWtYsmidLeGLoepn/Bvj3Wtms5xd/qJ0UDiww44sZu/rqSFPKs6UxCcjln90yatMOq9
         E728oxb6hn+DluyDAlPISIzcRV6hB25gTAwRY6lRe6GQsNNiDtHo35GxAInCAkt2qpkM
         Fn3A==
X-Forwarded-Encrypted: i=1; AHgh+RqmjdxttkRF9uT5UW7TDVVHFspLNoZJyuSvYdn9AKdALaf9yOMt4joYcZyuTGzd7wF93TeaMVuK0j6yS5jz@vger.kernel.org
X-Gm-Message-State: AOJu0Ywshkl4x1Dold/CvIId0FGFZqXd93Sz/g+gV7DODAo5mctzuzlE
	kf1xmIjrzkhUyoZdtidY4iBHWK0TO1Pg00QdB0ntlmkOa0fIGSBTZN48
X-Gm-Gg: AfdE7ckDMEqFRXw9z8mJHC9J61X3Z+SosehO1CkgABfje9Zbv6Dwg48XJPYf4XzmcpT
	93pLohIjep2LOzl5ryhv8zkDbF9z+PFymy4cnd2rATaqq/n+C9Y7SVw6StkM1nD7d9H0tfM+rGg
	5Z5dz44Pkm/UUh4vk98+/DulIjy2Z8fbm5yZgZYt09CQmiMUcZ6NCuJk5SJCXz7eo8AdoNxJXMo
	SxmIHaRMLmqwMRFZGgOEdNp7W2DUrUPsO3IJYPk4bzWscWTA4GkVU2v7y5kKZGiClAO9Kn6qF4X
	VtrEp7J7BlgX4IjCpSYOvr/VlN3U994ZwpJYNt438Yxx/ooGFwiPEznKaSXYjteDr1QwJ1WoFKE
	tPi3R3h9jpiTgMYKzCyjbq0FVQ+aWCkFAoT1KKaN1WZiDLgx0zivTWN9+kHE8jOTs7CFLlj5pID
	+IS1mPY2X9D1kdlnYgAl3ItI+5uFBQfrdpWo2IGOXVgBWhi8MvCcbaQpomAw==
X-Received: by 2002:a17:902:ce82:b0:2c9:97a9:2097 with SMTP id d9443c01a7336-2ccea3a28e7mr30636245ad.43.1783520408022;
        Wed, 08 Jul 2026 07:20:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:07 -0700 (PDT)
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
Subject: [PATCH v2 08/27] ASoC: codecs: hdmi-codec: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:15 +0700
Message-ID: <20260708141734.578926-9-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-117663-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 75EEE727565

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


