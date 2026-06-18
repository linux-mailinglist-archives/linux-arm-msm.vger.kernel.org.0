Return-Path: <linux-arm-msm+bounces-113753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xvdvLibUM2rJGwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:19:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA1E69FB3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:19:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=JvtxViAI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113753-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113753-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C654A3054F43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 11:11:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A59423F0ABA;
	Thu, 18 Jun 2026 11:11:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0573EFFDE
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 11:11:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781781098; cv=none; b=CqaxlNQTUIss4Fmjk11WMB0gCXdmRz9eOZ0M8V6m9lgD04gtwzPkCoxx1CaERZmyBKe0dvLTtos5zKcVe9p7D9j/Wl/nh/1XpZWL2VRjwlr9wHNcSYlDiGV9++g9lywLzRJYVZ/JZJ9RiT6UvzUouwvjWMgj7OWsu5IxqjujlgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781781098; c=relaxed/simple;
	bh=bLW2D0WmrIkzzwlGmVFMlDfU1k3KJHtIGoz6p5efmEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P/4r0evbJZMR9OWmX/7CV4jRzSofQzNrmpt7Z+C37mPy9zUmSavv8W/ThDdf3l5HwWyweZUhdQ0u2r56CWgyUOZVkq8R496ZLMXZwNvmzLFgyUj0DOA7i2rJbYinkLFWkLtFYg/Rvx2rOmubs1/9XZI1i6ZdiyUK31JJawa2c5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvtxViAI; arc=none smtp.client-ip=209.85.214.172
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c6c101aeafso5248355ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 04:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781781097; x=1782385897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FJMU7K56og6O0Mgof55SgHjMcgC38/i5g3OlSm/yHKg=;
        b=JvtxViAIrtPqiKTRd6qAd4bs04+pqRubMbERq4uNu2kIKnjF8ql8pKq9oC4DHvwTiE
         8RMzg6Q5AjA9geLCyvhezjDfFtYkLDNvruAeLGCsOuMRhfdNaS0OaVIsllSWwrGypcGs
         E7FROmas0Op5HrQ6bs3YfIH3qA6tgCkcpDcKfEq4Fwym7Odv0cGsY8BE9H2fCJzCMwI5
         Zq7MRajBouLKkmOfrxIk3NvfOkdBWDYsXAcaL0PbF0u+t8UPIGv+8Ta8gn4HMdWncde7
         JBc8KbQN/AcHlZd0QhtGraUpnlAvluXwJAoSNnPFaC2w4sSa64wDMfZdU7khERZVBqUv
         U8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781781097; x=1782385897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FJMU7K56og6O0Mgof55SgHjMcgC38/i5g3OlSm/yHKg=;
        b=JOA77yH5V38f69XmJ+C8hnmeC9IMXHYsgSfI0lrK+CSD2zBAE/K6iJpiailZAaUfCG
         D83QaR83ziFIUMInwdI39lGiucE/WBSBiQJ3zHm0kzqAgMT/lTTsb2C86Xg0AYAeHTBI
         HhttId+cH9i8lnLn8b+yAj8tQL7tNsNdhC/UkVelWUUVHWuire44vmce6bEx0VVs1Vlk
         H8cz5i8lsC7egokByi5Z5wJYF5f3T5eqegTt7f8ucYkUKibXseD4wnpN6xe1wtfbMt40
         gzVSVZTPS1pCg63BHxlzevpOZlVEYwG72hkumQiMasO+o9L2mIrpzIfXRuIkJf58BPI/
         1/RA==
X-Forwarded-Encrypted: i=1; AFNElJ+RaypKFED3WN6FBgy3A1jbUCENUE3GPUTWqxgX3QghyZlsL+F0TZ3t4chJnVBJIGddiMXYxEJA5q19TqmF@vger.kernel.org
X-Gm-Message-State: AOJu0Yx50kKDY12PpPQZ4ySShbUN0+TAq1Yl8Rd5LdnA9mp3AQXuOEOT
	Mdk0wA+6jo7vr/VESB3oI2wCdc7+TR1VII5gq69+EUIEYBm6XF8+T4CL
X-Gm-Gg: AfdE7ck6KO0Lj5jMyHJaCxKUj5YG/mq0lBGzOnOr9r4hc+9ZalIeLwfx0UdEWQ4EHz6
	3E1BgwatDVVlosAjDNnRNPr5EXtOJpWjdqOfnB2u6ojrJl5IaEDFiIDRtNA+8C6sUFQt4yMTV5H
	rLTyoEZ/ECS0Nqe33NDJtki/0bA8bIFEm5MgPNkPlGFzs8psY8DK8yHDlHxpmMqLfzj6KZPT9pp
	yhYxyi+gUmaI9tHKQxcshKSNIzcdr7SiFKAK8Op+Ch0jTIkvCpIMpm1wyjy+uyAbLOeZ+U+86BF
	7rn5Eyghgd7xIzAW68jUECUjiVzWu5/cKkSzqp/RCkJFirkl65opTubfe7yS2xzUlTmQKK2qbBM
	UQFZzmDwsefZmVxsv45wMgQYh5RcZs33o0pjDQ/6peThA5jUE83QeQD2sQiyD51oc45iy/gONYl
	a1zkOS0ZcZmg8S2LvpV0nA3TjtKEmf1Cxf0FxW+QJ/VAUYeZU=
X-Received: by 2002:a17:902:d546:b0:2c0:cb90:1e08 with SMTP id d9443c01a7336-2c6e2472467mr40617785ad.0.1781781096866;
        Thu, 18 Jun 2026 04:11:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm196384565ad.10.2026.06.18.04.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:11:36 -0700 (PDT)
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
Subject: [PATCH 76/78] ASoC: codecs: wm971x: Use guard() for mutex locks
Date: Thu, 18 Jun 2026 18:08:25 +0700
Message-ID: <20260618110827.232983-20-phucduc.bui@gmail.com>
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
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113753-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1EA1E69FB3C

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm9712.c | 4 +---
 sound/soc/codecs/wm9713.c | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index 83cd42fa0c28..68ebf9d23865 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -229,7 +229,7 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = 1 << shift;
 
-	mutex_lock(&wm9712->lock);
+	guard(mutex)(&wm9712->lock);
 	old = wm9712->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9712->hp_mixer[mixer] |= mask;
@@ -251,8 +251,6 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9712->lock);
-
 	return change;
 }
 
diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index b3bbecf074ee..d338b9a915d7 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -238,7 +238,7 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = (1 << shift);
 
-	mutex_lock(&wm9713->lock);
+	guard(mutex)(&wm9713->lock);
 	old = wm9713->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9713->hp_mixer[mixer] |= mask;
@@ -260,8 +260,6 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9713->lock);
-
 	return change;
 }
 
-- 
2.43.0


