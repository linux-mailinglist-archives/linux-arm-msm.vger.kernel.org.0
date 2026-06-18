Return-Path: <linux-arm-msm+bounces-113749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d0EnOtXSM2p8GwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:13:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E650569FA9F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:13:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=QlgOq0jU;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113749-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113749-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3728E304AE6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EAF3F0AB9;
	Thu, 18 Jun 2026 11:11:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0CD3F0ABC
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:11:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781064; cv=none; b=odkBEkKq4VVEzcFPj3GOu/NTLbXg3or7ZsuUROj7U/e8QXNNGeimKybf0sF9g9Bcxk0nzunr+i6ZwEFy/FTwMzH2aWGQ4wOoM3qkckUpyrdSgnYjLAUBLiZ6+CVZCIF4HFdDn38vYF8D17oy3PZo1v0q+ZUI66augq2lNDExCGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781064; c=relaxed/simple;
	bh=Aa2l9agGlZMpsb3Jajw4aEzL2RNOE2njupqBSV7PUtM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kuWO4dYSlayJK16C47kYSJ572c9aGbC9RRvTCGlXIuVFD8CRaSYWppFwaVt/wA9GkrqUGFCz4FSk+Y14g/3Jf+lGS9mFXnBnMMrGkjyqJ9UD4hMbeHXTLCPyyJZGApwVpRU339QZF/Bbzork6KYl+bNJRotfIal+3tka7NS3lCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlgOq0jU; arc=none smtp.client-ip=209.85.216.54
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-36b9ec98144so560614a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781063; x=1782385863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uALf/9dfvj+6HILGtD9NwFTW55kuICuicnzgKi1Z2S8=;
        b=QlgOq0jURUbvSbbFDZYZzkwVSWy3DLSWJggqOG1BuoOj42Jr7+0rQBrFhNNi5TDVaL
         ThIP2uCgqn5oOfUwlxzI0/0TbAbFF5ZUN4KJ4zGLwIjfUWg+faNGdN93YGp2UaSFfe69
         2BQAWR1uZ9nLuPgbq5HzeDV0cL/Rgjoj4QUWNvg84liEKV2fxATk/4SWDhbNDb8Y7AT1
         1psicWLa1LObZAEMrGAwSVAeHT8dcTp+CC6uYd9WQTN0Q7vBJTFebduWfrp5ZYFKwbsP
         l635qj4XSsw2mhgFeQNnyjpLpRJizuVHkoT0GXsq9wMfT2ZxAK5BtT4pljMpML94dyUq
         cQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781063; x=1782385863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uALf/9dfvj+6HILGtD9NwFTW55kuICuicnzgKi1Z2S8=;
        b=aFU6mQFhr7Kj7Mo9epaTIW77JNVoVffm0aLqiQq/mFxIh241ckT/4C5iH8zenU9Cno
         lb1a+RMq4n9FZs5/z3Yh2eVCEPdO9URLBFmfg94x5VOjBXW02/q3JyAbERa2E4txFrch
         4vkwHqpQT5o5z1hv918p182BhJXviYU/ROxWDLh+0tCLt9PJbcqESkQadND99BoQw6AM
         lt21mT5hURBKVELDzFqb8w1Fr9y6MH9S56U2jlx1Z2wYlfpPmBO94X7O2kRxPWgI7cS4
         ekobapEOrpAXBfv55wzrxppzCVUvxHZnN6Rn99ofmIoEm8NBjI73FwJaW5VM8q+kpI11
         x/1Q==
X-Forwarded-Encrypted: i=1; AFNElJ9fqs3SVHwdA347zq865KIkyQ/hWLbHXMc9/MnU62TIiP9v+RAN7F9C11kVPMUXjjxnezttJistcjXoEkCz@vger.kernel.org
X-Gm-Message-State: AOJu0YwF2+qTH95rMJoZG8/clENEDaUFdj4lEO/aCzrH+H+6vFhteFcR
	O3cQjztg5LGA3/XXTSxr+Yw2YUkHlmVmmtTvB9tY7jH3KPs3XV/fu5rp
X-Gm-Gg: AfdE7ck1ZCKp+ydigZOdAXRxiQBIfku6t/vuLxdkDkoV3/yfCMNTvPZMxyGfDyU8Ibj
	rLejvxMFvsW7elPnowLdf7MAEm71rIDjtZUW1QXdhoEtkH93hQ5tzwRiktA4MHjHGopHpDGgY98
	IxhaG/XG4D/pqgCUqR7jMOaGR8WPgeOl9Fj9y4hzVIWI6GEEZ2sA+zDxlClVRCUPqJ8h9TbcOJn
	yGnUOfqDXg0z3sT3bTTUdL5rElv1qAt9c3oKLZ6uDZukK15vnbM9IdBXQbt5tRIAZ/e47Jao7k9
	NwX/m5Ggp87a1TKzVg1sWjqHyeG1lRgBWInUAOsemOvBfq1PLcycWra6fLoXFxpwEl1vfwDxsHl
	zrlrT0blfIZYCUzuiKs5pjEH1Mv41mND/6+ZjfisyG4cvTvE7SRTdCKIptDzeXjrdll6J8S/saD
	IG7EJYW1puhOjzfbdzKj05dfSGjHdLWEc6HDNeC17JbbciusU=
X-Received: by 2002:a17:902:ec87:b0:2bf:1cda:29ce with SMTP id d9443c01a7336-2c6f340c89fmr22802915ad.6.1781781062990;
        Thu, 18 Jun 2026 04:11:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:02 -0700 (PDT)
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
Subject: [PATCH 72/78] ASoC: codecs: wm8903: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:21 +0700
Message-ID: <20260618110827.232983-16-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113749-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E650569FA9F

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8903.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 320d7737699d..7c87e927836b 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -463,7 +463,7 @@ static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8903->lock);
+	guard(mutex)(&wm8903->lock);
 	if (wm8903->deemph != deemph) {
 		wm8903->deemph = deemph;
 
@@ -471,7 +471,6 @@ static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
 
 		ret = 1;
 	}
-	mutex_unlock(&wm8903->lock);
 
 	return ret;
 }
-- 
2.43.0


