Return-Path: <linux-arm-msm+bounces-113558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CiJKOel8Mmrd0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:54:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2401A698B21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:54:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=VrtZfzhP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113558-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113558-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 436F63105728
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E758E44CAC6;
	Wed, 17 Jun 2026 10:35:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C06413638
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:35:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692533; cv=none; b=oZ8BJruFzcOE4YbCzzVG2ohYKwKRQqrLKcgdEdhCGEpgBwoJ7Q3mSnnJ/kH/i158QCAxU/nigIbquxJmEQ+aAZJeeOgnUl+PoWijRUsZATSi7Z1fEK3+vXOC/s6vimdDIk/QydDra9jtiqERjWE2TXTTObzAhiTOKqCx/UXqACE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692533; c=relaxed/simple;
	bh=ywyecjY5IPnCpFu8t60JAxjAocTPdOv2KzNz4XTlQY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iwT7y98Fcx8/7++drPwcqBP0QmI3fM8ZFjz9t4ySM0BRtjL+kQOu9JY2sfvR2dNRpyFblmJK1U3NgEuoMJ/lfpg0QKM/jJT7Ekm6HTdQ8q+68QfHJe/Ip+e1vH8ZIUUESKSSo8XbLKofslecrD/gHu5TWF+/akPn3nRmpOzN3v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrtZfzhP; arc=none smtp.client-ip=74.125.82.173
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30b6dad2382so6291151eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692529; x=1782297329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HgQKBXBVqugKEAIaw6gam4xuekLuGQC8Pf1ITJyu83w=;
        b=VrtZfzhPS525+dBmjAIAnd2vduK0otJgA5Mz+6+zrksjLNfXIMsBff363tAZaMfrCj
         LmDrVZsCxmhvU/M/Zb9fLAcl8HLrKW9cLiKtjCP6V3vTds2eLiIyj33r7JtAdOQ+pwnn
         pxuDGclgR1d4Rh67+dKWRUbyLiFsJCkOjb/mGo/PIcYojg3aX9ErEKjtH6gXs15kvyF1
         fSjSoLUfIjaOzKuyDbmBUl7/kk4fuq/Y9s0A+XFw1/QvOmUdb1i4+4u9HhwBhbZxq66P
         HZaX11HNZEdcjjlUhOHqXdLIEogc7xD74lYmK6FcEsmlLlp38HJFPiyW3eB9kk/0kRJh
         eVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692529; x=1782297329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HgQKBXBVqugKEAIaw6gam4xuekLuGQC8Pf1ITJyu83w=;
        b=KIDMcCe93uEtyAS7CBwlN9a6kSEtRtLzk+qaZyNjqE3YCYdszq4ndbstxPdS6T3zTi
         zUw4eh5U90tbwR0qdAs9Ce83AxJbk3qe8jdzZM2MGFvzz+3HkF8czOeQSPLXeEgsX+pe
         9ubVMkXa5Qgf4FAaKmDK03Sj3e+BORo99EElAtW6X0X4vaYq06bBHWGKHlpLXuodzTsb
         bI2U6wzIC8wGe81MgUZUuZXHTDt+p0HBVROvaPRvoeutZlNcEpTnBb38XeyVSJbnoyCY
         8EMWX6LRoaMJDyIeN81eZZ05tpZ1k4AxVrPnxInKsRFg8IZc/JW2u0znRWCpzbAavB7x
         xTnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+OIP0qnwInstLY0NtvFPgBk3T7bCOXCL5/YjA+ah023RL1OAjwodmwEcZqZhiLEbkQsTGHqP76AkkpSQlp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk3YXd9GHpkzY1AkB2YJcs4pXsQA4d7vGRt7Hh8jkkerp1z7Jg
	Ik/0/cllO8iz9k3z6zk9y1+vmOvPRMCICmEcaKrAM7gu8y5Co3R+Ko0R
X-Gm-Gg: AfdE7cmtfTPQiqzOBbiefjauCPLsyv5HkwJRHPWTtktkBDHlhgn3TBzsqYyv7UnMsq0
	V4dWjJOhqimpiOk5sBB/q5/EZZe8jiMjGW+Hs1rA3kp46/gD77Hqh5gN/x63t6G/3zb+FYyeb3Y
	O/kEcR4JZNdRiQYU3eAmn/4AX0bbi4RpJze4coDuZXlWrhjHeJTk1ZbMGsEQZ2Vnf9v9Tw3WJbp
	2MocwsrvziEqxwz8YH9y0RFM3sxj9o0CWJy3gFRG9XoFdldPeswuUIdNe4z/1o1NNUufQ4ziB1A
	3qSBwXo/6dx+jHW82KMFgGLi0VpmgflghF64w1kg2am3ZwIxImdGkLBl6K0vwwKkMm0EnwG3+yK
	8ewZAZf14u8WM6qGGuRJW5rQr4AGiX7OX4r3rDnVnj4FEVCFtkKd4FjCsAyVZfbYdjj/o/UwEBJ
	exAzduGaxM5I3Jm/NB4y/o3mPhQb5C85T2EZgjj/RmOG4yMy0=
X-Received: by 2002:a05:7300:6dac:b0:307:91f5:92e2 with SMTP id 5a478bee46e88-30bca90bafbmr1658562eec.4.1781692528915;
        Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:35:28 -0700 (PDT)
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
Subject: [PATCH 16/78] ASoC: codecs: cs42l84: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:33 +0700
Message-ID: <20260617103235.449609-17-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-113558-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 2401A698B21

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs42l84.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs42l84.c b/sound/soc/codecs/cs42l84.c
index f2a58163de0e..a212f6891b40 100644
--- a/sound/soc/codecs/cs42l84.c
+++ b/sound/soc/codecs/cs42l84.c
@@ -281,10 +281,9 @@ static int cs42l84_set_jack(struct snd_soc_component *component, struct snd_soc_
 	struct cs42l84_private *cs42l84 = snd_soc_component_get_drvdata(component);
 
 	/* Prevent race with interrupt handler */
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	cs42l84->jack = jk;
 	snd_soc_jack_report(jk, cs42l84->hs_type, SND_JACK_HEADSET);
-	mutex_unlock(&cs42l84->irq_lock);
 
 	return 0;
 }
@@ -831,7 +830,7 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 	u8 current_ring_state;
 	int i;
 
-	mutex_lock(&cs42l84->irq_lock);
+	guard(mutex)(&cs42l84->irq_lock);
 	/* Read sticky registers to clear interrupt */
 	for (i = 0; i < ARRAY_SIZE(stickies); i++) {
 		regmap_read(cs42l84->regmap, irq_params_table[i].status_addr,
@@ -902,8 +901,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 				break;
 			}
 
-			mutex_unlock(&cs42l84->irq_lock);
-
 			return IRQ_HANDLED;
 		}
 
@@ -919,8 +916,6 @@ static irqreturn_t cs42l84_irq_thread(int irq, void *data)
 		}
 	}
 
-	mutex_unlock(&cs42l84->irq_lock);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.43.0


