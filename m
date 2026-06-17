Return-Path: <linux-arm-msm+bounces-113595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id H/JjLLh/Mmq10wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:06:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B54EC698CDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:06:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JEWge9r3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113595-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113595-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0D17130822C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5171B478E2B;
	Wed, 17 Jun 2026 10:41:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E996F495530
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:41:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692867; cv=none; b=CEdkEbwsIXMdH4aF7hzV/VfWz7/caIqVSnsUpu0Jz3FAJu7I7H0P/J9wGqFTsnaspLhcUZadA7iBP2/BFvzGOkEkYZQHzK0oKTT7sHKDikbKYOPXEl+f8dvlqr+jS/0BH3C62Se0vdMr4/kGHswmAJ9VhM1Cb/fv2XidjTF7BCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692867; c=relaxed/simple;
	bh=T5inPM0/ZembfY2Nrx+5l3rT9jXABsUVzUit1sml7qs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BdZ4jTUapwwRVP4Is2dia+fiIOch39bW6T+O7rEmTvbWaY3fjgNpvq+hH2PzCGliVHr0jtuZaU0BFXgtfTrEv2p0FJkEA905uvo9lI40yxiysLbVOjDPlw/xdmvVZHTPJgRXmcW7grJ7t4WSfvgUv97TSLrCp5+ptFgwjTvUjJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEWge9r3; arc=none smtp.client-ip=74.125.82.172
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-307d0405e07so8462787eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692865; x=1782297665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=djEuHymjWJS5SFW/o8P0inIono61ptYNHJ11jX9l3Ik=;
        b=JEWge9r3t77IxDu8JtRTjBRotsTcjblX1D5wOKuVJGmPjnAHcxFw1/939jwvpWhSGy
         Q3IxDzSOmrRAMo+0tQOQMIv0EkM1Q4tkyR0xWORhvW1sHHrwCogSLI+7mY4w2VwFo6U5
         uvXGVFp8p0cqFfLHKtUP9NbZn4q2h6+TQ/aXGmRziEqhkxSF6KzWcj8z9Xo9fH3txtFs
         V6Ij71rYn8dYITJDH5ZJ9qOV0omkTl5pe05WapzLfwumzaA+8ohIznIQR7W22wB52y3w
         GVkTbnJd9VXQ2i9A2Ho4yQyB8EzZIiPBjB5QpIffseoA8EGSM7f+UeqcA65SFP3iKjJW
         b++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692865; x=1782297665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=djEuHymjWJS5SFW/o8P0inIono61ptYNHJ11jX9l3Ik=;
        b=KLp5+y3uD04w83kjydRWVjkhyBEkdM+o0uVVy0k5PEQDnRpcCwhoi164dO2I0crFRT
         Se9ejoAGZhOYstsI4nslDq40Dn4h4QZDbAdx1A266tWzFnjGtM0nAfd3ghl+9aDjkqvA
         FAUyAIwudEvJO4Rfsrl7i6iQMQREiyGVv6jwvxw8x1mbnsLOvvC1v0EnpZv+iGQZHjNn
         Edpu2S9bngcohPXB/Nrc750hdNO7zbeHthBbf74ZYniUM0AFcBEUeQgBsAaLgE5zUiir
         WLaHiH5zhQQaQZuSRHL2ZkJZ9nc/wibsTHN/MG9eUzFX4akrkNtwHqTDYsQHRdH4XnM9
         2Siw==
X-Forwarded-Encrypted: i=1; AFNElJ9gq0AdR3BINHua24O/JPA37r0TiRVr3XpKmzP0v6WD4iozQBmatp6ZpgWPkNtK7IYQ85094mHzTlucaN4X@vger.kernel.org
X-Gm-Message-State: AOJu0YyUWQKd7Yhj3Inc2q3GsEf8EwxYxssMyzfKcADnfv1gtwNkSSzm
	CGN9hvbYot6Lbvz3KSZ7GpTprJ1Z80KsNQsHSnWVoC2bx0T4VAz/VPyg
X-Gm-Gg: AfdE7clPBIK2sH1Q29TiF6UDvxeLLKcwEyoLrrtv7GtgfcXFRZ6nY/AQRlDCVyFuVLN
	+ZHLhg8dGKKAaZHlkcKwkk/S4nvaw3gnrXOEOebKxfnGFtl4EKIeCQALsIWMpbhKrl8JDpeCQwW
	ERyliYvUjU2NjVs3wTHA3hO3b5meDkG3+fAf+YmhkLQ3P54GDxa8uCYGXHPV+gX1sHb2BgMxgbA
	9xQbOE5VU478btMOnMYtHS9cQiZ/9xTVJ9a7XZxdJUr9VccZwfaGvH0U64XaurrekGjU9X4Vorg
	yFqOKiMOQy+ddItG9p7yJ43kdR6xh3q4ZBMCAI3YIxSdvWWE2GASTTIF7a70RVLXhzBH303sl1A
	P+kCa+gBtaUDfaTWB9hyE7C6dfuNXpighb8EAUAeKfnVyA9saZ/Pt+AZlrdQRjoEye2R4kzubOM
	grlgcFLWFTzAC9eBOBUIWGB40rGPjEg/yRQDvUGddJP0Q3YUUKaizfD1IVug==
X-Received: by 2002:a05:7300:30c8:b0:30a:e52d:fb27 with SMTP id 5a478bee46e88-30bc9df5a44mr2016767eec.11.1781692865129;
        Wed, 17 Jun 2026 03:41:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:41:04 -0700 (PDT)
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
Subject: [PATCH 52/78] ASoC: codecs: sigmadsp: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:09 +0700
Message-ID: <20260617103235.449609-53-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-113595-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B54EC698CDF

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/sigmadsp.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index 2e08fde3989c..592aba25de11 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -135,7 +135,7 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 	uint8_t *data;
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	data = ucontrol->value.bytes.data;
 
@@ -148,8 +148,6 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 			ctrl->cached = true;
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -160,7 +158,7 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 	struct sigmadsp *sigmadsp = snd_kcontrol_chip(kcontrol);
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	if (!ctrl->cached) {
 		ret = sigmadsp_read(sigmadsp, ctrl->addr, ctrl->cache,
@@ -174,8 +172,6 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 			ctrl->num_bytes);
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -677,10 +673,10 @@ static void sigmadsp_activate_ctrl(struct sigmadsp *sigmadsp,
 		return;
 	changed = snd_ctl_activate_id(card, &ctrl->kcontrol->id, active);
 	if (active && changed > 0) {
-		mutex_lock(&sigmadsp->lock);
-		if (ctrl->cached)
-			sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
-		mutex_unlock(&sigmadsp->lock);
+		scoped_guard(mutex, &sigmadsp->lock) {
+			if (ctrl->cached)
+				sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
+		}
 	}
 }
 
-- 
2.43.0


