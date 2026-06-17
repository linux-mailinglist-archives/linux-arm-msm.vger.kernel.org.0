Return-Path: <linux-arm-msm+bounces-113577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6IlEEeN6Mmpc0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:45:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0385C698A0F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:45:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QKEDzbK2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113577-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113577-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3DE2B3065C38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7FA48166E;
	Wed, 17 Jun 2026 10:38:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A584348BD24
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:38:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692699; cv=none; b=e3rcbPixp4Y97Ovqf/qWpnxxarU4sQlKmRusyH1MJwQM+ZCBwPna+FFsE5KlZlo3Od0mfR08LBJcxblkM7BLmI7djzaLY9v6Z2xoiMtnOE0BlrVn4JakCHg7Q5CzEd1vHAzQgsAagfl2edzq+L/6X6gMWrqKWxiqJ/aAmk3dm94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692699; c=relaxed/simple;
	bh=nSAn+IvomI3poT2XfEpySfMVhSrZidmFTXRdJVEBP6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k+gD0IasiIAwgKeNPUFr0zFrtu8UC+00blZBgP736wAjKdbuTul5sr2ZJYhxwVowAYU6I/tVLVoYWykPEnAdpbqfiCmnOlS0FmAWYl4pbP+EVJ/NUlia/o0lzmsQwFfK0XmN0H4im8cNyXID9//WneAfXShfkSxRXOqNPqbJbco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKEDzbK2; arc=none smtp.client-ip=74.125.82.181
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30b6dad2382so6294420eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692693; x=1782297493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbx3ojyGvZm0HFvzH2fDjGYEhzXxcDovZmyIxDXeLB0=;
        b=QKEDzbK2m+qSnduJiuc4OO9wPTT3iXovThu7YhE2r7T5ohKbNF5Mt1hiimi2K+9CW4
         bGd8mxyi24dAnFKfxAd4JhTRfpmCgSBcLZ6eTWXg6SgNwSCv75CPTgxiJTzaAxjbr9+Z
         4efORgIZX27YgaIJb43MEJ6o5sN1rjI5yzpokryH+PZEv6QVYTUiYRaHfHJ1bgKhvg7E
         8Z1MRnySkexgps6XLJOZQPXVH4qVeP/NKwND7bqn0fwiICyOKlB8XLwJW2iVFYQ0C6qk
         NvYEf2MezRaZsT5TnXTrK/9QiJqnRC7rhCSsKKy6ePvswy6AqP9C8nvc4QCmiEJxwFXP
         Lnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692693; x=1782297493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wbx3ojyGvZm0HFvzH2fDjGYEhzXxcDovZmyIxDXeLB0=;
        b=UGmJmpf4RZ4VmPhsE2XPdN8Rg7+VZQ116n0uHSAAPc4yU4r57tb1K1hn3FCnUGNP4W
         S2vOxm85hZ1r1KEK0z2V8BqJdwrpxE3Sh4kyZbufqbgU3Q0RnlibTBTFPtmKYln3um4J
         z7buwUu2rKi/IAIjn4/aRMLIez43zFpZs8aDUwmZAhqAJzLujcA6hmYT/wYrSUHDVQc6
         GVvzn2FGPu1B2Mu30iEjBLC7A7oK4w+FDeNmmZGmKrF9kNX0kedgL3POpL41csHTLemD
         AvBNQKioaKPs0av3aPiMphP5Fj9ob2u7T+6j/cJDg0Sr6sSWVvhIIMcj0czv8xgrK3Y5
         drBg==
X-Forwarded-Encrypted: i=1; AFNElJ+CUNSTQu7KY4vsP13wsfE0ia6rQ1bBW6EJGVL1wI1gcN3q9kCelifq6VFAbDwgruZ75clRLxhjrmRbVNAC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpolep/Pl3lvh8Ki2MncIINTS6Rk3I4e6W1hYY6nmRNT/fH7hD
	djLUcaouyLYsNf7iVHD98wsewyfU2qnLZRfwwC/k48q6JZ2Nre+YbhyW
X-Gm-Gg: AfdE7ckOT77odXYYCw7IemBd8y191+bVBJojMKjwn/ioEM7UIPif8UTFVW6jwmBh7M2
	nyRSlL8lyaip+TsDAeUmlinmxdUo3+w0AjOSRzE5w6QmEBU46+a+Hpga9Iq9/QZrpV8tiUtH4to
	rY33hlyj3bV4cCSp/W00OC3a6KWMQruFhK4eOQIbUMBp80X1knED0JufN4tI/W4ptBC3uPmwKQR
	Qodqpp6rXDMh/iVvrwaYxt+nSl0hxTqSYml552u+rZbQzgNrEBeLuFCmFSBS3GdxBrneWMcE4C1
	Ximll5+K6j6UostpqF0BcN+lJtedH6o5DH26z1xhL9dqHzFwGwaCIbXm83dyGuVbmGP8GenXof+
	PrqZV/SpRsr51B+02LcopkwCP71YCB4QFsectyQof00rdSbHXBau/kimjiS3EolKm4/BI9KrlJo
	ZZNPS2Mrv6L5GgyckL8OcsOkifF4kF0B1hLdPxynFz0j1vT3Q=
X-Received: by 2002:a05:7301:38a4:b0:304:e7c9:b528 with SMTP id 5a478bee46e88-30bcae4246bmr1408050eec.30.1781692692655;
        Wed, 17 Jun 2026 03:38:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:12 -0700 (PDT)
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
Subject: [PATCH 34/78] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:51 +0700
Message-ID: <20260617103235.449609-35-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-113577-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 0385C698A0F

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/lpass-macro-common.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index 6e3b8d0897dd..c8c4a98fd765 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -71,21 +71,16 @@ EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
 
 void lpass_macro_set_codec_version(enum lpass_codec_version version)
 {
-	mutex_lock(&lpass_codec_mutex);
+	guard(mutex)(&lpass_codec_mutex);
 	lpass_codec_version = version;
-	mutex_unlock(&lpass_codec_mutex);
 }
 EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
 
 enum lpass_codec_version lpass_macro_get_codec_version(void)
 {
-	enum lpass_codec_version ver;
+	guard(mutex)(&lpass_codec_mutex);
 
-	mutex_lock(&lpass_codec_mutex);
-	ver = lpass_codec_version;
-	mutex_unlock(&lpass_codec_mutex);
-
-	return ver;
+	return lpass_codec_version;
 }
 EXPORT_SYMBOL_GPL(lpass_macro_get_codec_version);
 
-- 
2.43.0


