Return-Path: <linux-arm-msm+bounces-113566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /8A6HamBMmpj1AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:14:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6CD698E1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:14:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=laLWu17p;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113566-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113566-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 89B8A312EB3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFCDC3FD13F;
	Wed, 17 Jun 2026 10:36:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8835447277F
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:36:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692600; cv=none; b=DdKN/5gu9eLKsFjnefI31Q35UVVllM+9OEy6Y8gc8iAJqE28HwtVtYf1Mk2gfle/SC8nvTCZJpC+X8PpUX9nXyuw39W9tr1UuLtdN83NTPFtXOQ6rGW0M2G3BeAA43Wo6BkVcb4Ip6JxNRRjDvvxJrCYUoRb+1IrYsV5xVRPUAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692600; c=relaxed/simple;
	bh=f1BYheWpgYmqvxFP+LuNBK9MoGzL9oHfU4zeAFfLjtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dOxcfMoQ1hzk8F/0f4OO9yhozGs+OyhuQ0ryy9BNuCYKUGgi07h+HJ5Nl2Jzln335xlvnxCN0WwCgb2AmdvBepLSwGIAAzf3yUx4lB3z6HlDkSZtVB9gSUWwjjELfdniQmSag1+3V18JbL4lWBbZjzO/rLF/S2WIbfAy7ruQ7E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laLWu17p; arc=none smtp.client-ip=74.125.82.51
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-137335bc3caso6885371c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692592; x=1782297392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLoxnhSs+1o+EbkqMlV4TtbB/c6QxxOb6So3gGVF6YM=;
        b=laLWu17pMNJ4KFQwpRoVOBveCwWA9JMYxJks3pS3HCMgOQYQpjP9TiP15q28fMAObx
         7oPJ4g82HaeQmYxW7URtKXwA0suk6XyCXjjChqXk8Vep5KtPCMK5bo6sqQZnZ0fYaXHv
         VoB00/NronQUQkqoJ0SVABkcsmvVLiZkui0p2/23Dn2j1URlBQ5qq+XFbz5DByYfktas
         27Wr4H+2tfseiXEZNC6aMC6d+S2wg3NXxvLYm8hHlrVeycTO7x0Oz9N3Dy/Wyjr5fd3j
         naTX1olOwYmbG1saO4aGpo0kw0by7qD3DgXmuJjEG/J5Lj2iL7qdcxEtagocot9EX5IX
         BJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692592; x=1782297392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZLoxnhSs+1o+EbkqMlV4TtbB/c6QxxOb6So3gGVF6YM=;
        b=jGx+7V7HP47HF0X9DNN2bTf05/4Wm/fpjee7erxk6wIbB9YVUv/8OAIz0p7RxShtZx
         RHFHet9076RIDP9w/gCIq4FJl44eD6v44zfJgkZSe16VTQpyz5iAeLvOl8vH43da/Wc8
         ZY4C46aNznNWuX95/GxHUjBBx+pJS7Uc6F5FvX5xhQx7hwiuzZYfn0fvDNhIodnJGzRZ
         h8hNhm4+fmZMBkEkmnQWjlxqdxrUtx/9/yfde4HuIgq8N4NUr+CqwlmA18FbuhOLUXni
         BiK6e5K+WXHmOeDLttrKYUm+aEN/YzHgzqS9MEoQ9CKjnbqO06jCsenaAi8i1F8jib+N
         s89g==
X-Forwarded-Encrypted: i=1; AFNElJ9Z71kgzQ+xiUW7Oi9+oOuIJGlDwBX0QMaoLgqGioHoLWn3JCrGq8XIzA5xbsIQUilFuKUaUqCUqQAgErjx@vger.kernel.org
X-Gm-Message-State: AOJu0YxBSyurD6WBZxiWpMVtMwHAZ+xgbm1FVkDtbfc/176+dg5NI429
	acUQSDnq9ZcPyJ1ChD//wnONbJWYIT7JrZyfy0qAfx5JSDW78VhbroVaQj2mog==
X-Gm-Gg: Acq92OFp+IVdIHIvUCmaW1c/rA/cuqy+jVRYqxZOUUuxldHTxK2vPLTF7MtiZOsdbPO
	+YKg10mE5Isqc17Pw3V3WPsfE3E0nUbdml/gWoHG42zwa8RAdmKAyAPniRtrTRauGv+UletlaAI
	l/sdtjQK8QKU3SQA1z1r5XALir+D+mKiiD0jcrLT9b/I+C3wcUGvz8k4No6BB0jdYs6IZxGvxeU
	B1LI8RF8FZhrznbW8CsdN3FSsmzJuv5/jWujgQB7YFiWXd8fAzlln463AQYUjolt4n4U/ukum6B
	B4h6+kE/jG9cKNBybIhVIWtftmNe5VV9hZJRb2TiFdyTgUy2B+HqMTvXXI4IPJ9b8djAyyNdMfw
	LgFwN/D1COU7A0qEu6Rirp5exHZ6cdT0+KwZSYeospJ0tB/yyLo7mDDFyQeWP9drW3x8ssidN9t
	2PzC0opsAxGJmEGwu1jzQlgS0MkI7qK3XSRxtglTGZC8ZEc/s=
X-Received: by 2002:a05:7022:fd08:b0:137:f532:e360 with SMTP id a92af1059eb24-1398f62354dmr1205523c88.3.1781692592243;
        Wed, 17 Jun 2026 03:36:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:36:31 -0700 (PDT)
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
Subject: [PATCH 23/78] ASoC: codecs: cs48l32: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:40 +0700
Message-ID: <20260617103235.449609-24-phucduc.bui@gmail.com>
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
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113566-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6E6CD698E1D

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs48l32.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/cs48l32.c b/sound/soc/codecs/cs48l32.c
index 086ed0f57a85..d45e339f76a7 100644
--- a/sound/soc/codecs/cs48l32.c
+++ b/sound/soc/codecs/cs48l32.c
@@ -236,15 +236,13 @@ static int cs48l32_rate_put(struct snd_kcontrol *kcontrol, struct snd_ctl_elem_v
 	int ret;
 
 	/* Prevent any mixer mux changes while we do this */
-	mutex_lock(&cs48l32_codec->rate_lock);
+	guard(mutex)(&cs48l32_codec->rate_lock);
 
 	/* The write must be guarded by a number of SYSCLK cycles */
 	cs48l32_spin_sysclk(cs48l32_codec);
 	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 	cs48l32_spin_sysclk(cs48l32_codec);
 
-	mutex_unlock(&cs48l32_codec->rate_lock);
-
 	return ret;
 }
 
@@ -2242,7 +2240,6 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 	struct cs48l32_dai_priv *dai_priv = &cs48l32_codec->dai[dai->id - 1];
 	unsigned int base = dai->driver->base;
 	unsigned int current_asp_rate, target_asp_rate;
-	bool change_rate_domain = false;
 	int ret;
 
 	if (clk_id == dai_priv->clk)
@@ -2284,19 +2281,18 @@ static int cs48l32_dai_set_sysclk(struct snd_soc_dai *dai,
 
 		if ((current_asp_rate & CS48L32_ASP_RATE_MASK) !=
 		    (target_asp_rate & CS48L32_ASP_RATE_MASK)) {
-			change_rate_domain = true;
-
-			mutex_lock(&cs48l32_codec->rate_lock);
 			/* Guard the rate change with SYSCLK cycles */
-			cs48l32_spin_sysclk(cs48l32_codec);
-		}
-
-		snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
-					      CS48L32_ASP_RATE_MASK, target_asp_rate);
-
-		if (change_rate_domain) {
-			cs48l32_spin_sysclk(cs48l32_codec);
-			mutex_unlock(&cs48l32_codec->rate_lock);
+			scoped_guard(mutex, &cs48l32_codec->rate_lock) {
+				cs48l32_spin_sysclk(cs48l32_codec);
+				snd_soc_component_update_bits(component,
+							      base + CS48L32_ASP_CONTROL1,
+							      CS48L32_ASP_RATE_MASK,
+							      target_asp_rate);
+				cs48l32_spin_sysclk(cs48l32_codec);
+			}
+		} else {
+			snd_soc_component_update_bits(component, base + CS48L32_ASP_CONTROL1,
+						      CS48L32_ASP_RATE_MASK, target_asp_rate);
 		}
 	}
 
-- 
2.43.0


