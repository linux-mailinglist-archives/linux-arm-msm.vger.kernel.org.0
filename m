Return-Path: <linux-arm-msm+bounces-113735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KHH4EWfSM2pjGwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:11:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEC269FA5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:11:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UFY0cApE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113735-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113735-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EE01A304C2E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9A293EFFDE;
	Thu, 18 Jun 2026 11:09:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E063E5A19
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:09:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781780943; cv=none; b=aFe+E9Np+TRg1UZExU9VyyQs5E9p3fwUxchvA9fo+f6el1NBX1RIB2m71PNVTxUZvp3Q39z3P03gei9WQ2lykXkHadjQjNGzfItXhsLn3mxOazvoJyulERkMO/CnwjDvsoxSbFLxzzQCkQAvFm2RYxDERLZu/nEUzi7PkLsdfGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781780943; c=relaxed/simple;
	bh=3k5ocHDAte/5Y9dBudXlQ2zklcKkxOUMN9JvPLnupMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SF5+wtTEAWNfQ0g5y7eFET6lzaWy9pNnzZb6JsO6MqG/f7Xzs749dAAHtcufMp+ASdTATiwCfIlFLk+w3Sx8lhq9KolHWGd1c590WyivAYhcXP+SdkyK4dXj1/F62BVfQxz35TlGl+AzSVoAe+UKUD6v3hwYaS6v9H7YHbJ0vLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UFY0cApE; arc=none smtp.client-ip=209.85.214.182
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c0c1e0b0faso5827575ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780942; x=1782385742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qgwBmSSCggFVLUhXUYpfKHZun58CwgxvexKdy5tq5OA=;
        b=UFY0cApEvc0Gu4CfbSBeLzMwDUPNdhSzOxXgnPi02GrbjLHBk93pdIRszSs7XZrN3L
         DIaZYxTXZxtSuq4AYgBXOMg/wkb50B39F5FyKRNsdjdrrmxE3GhcIvp+dottfuGRU38O
         A+mLLIyyz+uDrde4Cxm/Hiu0gmTVixyqYY52Mm5xoCVH18uH8Jh/Y/pbcCt0hM/uH1p/
         iIVlPrfdloyfwGOkPt1PjrCkci7H4ZvwYEoHivv+kQqAGuJaXGrxDPfgtBxL+k2oklg/
         nvI9zVZjg4noxx/G/03zjmaRlTxDOYsKLwGilC/F3qbtDxC7jdOBvH2PXi2ITejWdLZP
         FVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780942; x=1782385742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qgwBmSSCggFVLUhXUYpfKHZun58CwgxvexKdy5tq5OA=;
        b=FKjXHdJRIxPP1xnfnd2e2NyJuxXiXiLM/t376sNDSv/G3zqxnmnCQPBs2q15+wG5aO
         xPztoNe+IGCi9r8Peog5upOEPx+Cj0a+77YvhuIgu3mEXR/Cw2UCQoU9EnrTcUfXmUD9
         heW+tFQGPrpH7Ov/4sLTUE35JHIyLPiAYRDtJCMpiSlLXtububcRbzgcwMrS4iYXZWk7
         U4KUdcVNRJJt9BV0rIiCI3kT2UGa3oxsjKb6NZrkreBVWF5yVry37eS73U/PEhst06oQ
         9IM3Q1k6qfJ7a2xri/64S9QvxLd8tPSzyH6tNQcjfON3mk05ifBGly9x1WMnv7SfrjH2
         ea0w==
X-Forwarded-Encrypted: i=1; AFNElJ+AfPCE/ahqE0bbREOsqJOFirZN83W9+Rzp+pXgFGbQwVoeVSyMaC2YQo6sT9u+llWgv+nyy0KdNy08Mej+@vger.kernel.org
X-Gm-Message-State: AOJu0YxelUIS/MenAVZpBqW3bU6lSo0CDXK+uV7OnoNC9M5VzDqI8Jwo
	BAqSWeekuUG03M8cXxkxvk/W6lVcIs/PJWmEl0WbxiYZLLbYkjUa0MCt
X-Gm-Gg: AfdE7clrKO6JbMLMyNZvK1XzH5339scJR2wRlamsdOtbZNqzerMDj5tPBASIqmYpYbs
	F0Dd6YcexsY5uYmORero/aplC5XRpXWDhUmsRcm3m4go7xYLFK29v7wMz1U4fdOW5VfU+T2iiH5
	dTHVWXK7rtbVC75ntRsIIhFlUOVywiRkiDQVQbNYkMwDKVt7kq/YnkZRQmt7HQj5Fl9wPygEh/7
	3gAKqDo7bMLtBgmKgFzaED7DlNonFJ/+E9x/Av0qLkNUyG1feEQR12xvwYMl3mgGSa1LtCqE6WC
	t25VQJrlYGqtZO5zpZbQxK3kWNYsH54laOwiXvGsSnw6Cnyasn1clrekd2hv3C086AdhC18HNQ1
	vxSGFZl5ABVl/+sdRzdk3u72ZpxSwp+u0zJpjMyWP1MCJg6nAraNZoeRAGT+jtwo/eIoSHxH5zz
	oEnq8WObxe1/h25u9i2n0VO5sxXiYo8zEGZYHz9ilMXWbw9mk=
X-Received: by 2002:a17:903:2a83:b0:2c6:ab74:985e with SMTP id d9443c01a7336-2c6bc24997bmr85186495ad.25.1781780942104;
        Thu, 18 Jun 2026 04:09:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:09:01 -0700 (PDT)
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
Subject: [PATCH 58/78] ASoC: codecs: tas675x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:07 +0700
Message-ID: <20260618110827.232983-2-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-113735-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FEC269FA5A

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/tas675x.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/tas675x.c b/sound/soc/codecs/tas675x.c
index 6f89a422f3c6..c44bf9144e44 100644
--- a/sound/soc/codecs/tas675x.c
+++ b/sound/soc/codecs/tas675x.c
@@ -162,7 +162,7 @@ static int tas675x_dsp_mem_write(struct tas675x_priv *tas, u8 page, u8 reg, u32
 	 * DSP regs in a different book, therefore block
 	 * regmap access before completion.
 	 */
-	mutex_lock(&tas->io_lock);
+	guard(mutex)(&tas->io_lock);
 
 	ret = __tas675x_select_book(tas, TAS675X_BOOK_DSP);
 	if (ret)
@@ -176,7 +176,6 @@ static int tas675x_dsp_mem_write(struct tas675x_priv *tas, u8 page, u8 reg, u32
 
 out:
 	__tas675x_select_book(tas, TAS675X_BOOK_DEFAULT);
-	mutex_unlock(&tas->io_lock);
 
 	return ret;
 }
@@ -191,7 +190,7 @@ static int tas675x_dsp_mem_read(struct tas675x_priv *tas, u8 page, u8 reg, u32 *
 	 * DSP regs in a different book, therefore block
 	 * regmap access before completion.
 	 */
-	mutex_lock(&tas->io_lock);
+	guard(mutex)(&tas->io_lock);
 
 	ret = __tas675x_select_book(tas, TAS675X_BOOK_DSP);
 	if (ret)
@@ -211,7 +210,6 @@ static int tas675x_dsp_mem_read(struct tas675x_priv *tas, u8 page, u8 reg, u32 *
 
 out:
 	__tas675x_select_book(tas, TAS675X_BOOK_DEFAULT);
-	mutex_unlock(&tas->io_lock);
 
 	return ret;
 }
-- 
2.43.0


