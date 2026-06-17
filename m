Return-Path: <linux-arm-msm+bounces-113590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ddVMKeyCMmrs1AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:20:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6FC698FA2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:20:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=A5YCGavW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113590-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113590-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25C1531A6B9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD331492508;
	Wed, 17 Jun 2026 10:40:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A53644102E
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:40:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692825; cv=none; b=Vb/3VZnliRTlZwH8w9+Wshp3qK0J/P2tSwbyGLt3Sxdxu5N/xUZD6X8nVFg3/dUmb9bJvUXVzz5JRF51phRYAgWzqtFL+05MAMMY+tWrtH5xY3PGNqG2u66cMeNElENtxx1ghnws2jR0XmT1ZM4ks6ObFffuCdeki9kSXu9qwuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692825; c=relaxed/simple;
	bh=hnVgSVk2XjKkHVJ2nHstb4qGftdMio+vZ/e9nU127qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Job+zorKE1w2WYzX4mHYmEyNjale7xaZnI94COwK+MHtyBjzC4lAC9O/bMvPocDJ/mLEmKcfB9CV+ra/oLTAiBT1m2UF/LxUv94s06jRYCp42nhux8vzK8EmzkwgWREChVrMuDi7T8ZznuhufuZo7yLZqgM/1oEDeIGMMSpT7Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A5YCGavW; arc=none smtp.client-ip=74.125.82.181
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3078e0dcd67so5793810eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692824; x=1782297624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kiB2cTlRUl71yyu1OdTexyxMokBPzW7qW0HIhsxCVIg=;
        b=A5YCGavWfemFBCzA7KGzlFjUsv+F2mC0aMTQNKtJGaN8Oct/CF21+SLNxLsjIB18kB
         gesOXKYX2ZtprOqPlQgq6mv1rrIYszjcFh+8wyTVr8QnuKQ0EFAomXoThn51ym6SWR41
         SldpjJOkisJWfB+nxxug9NlQbxMxOcFYeiPTBDtl2Jf3IB8z4Pqb8nT8jENFAbK6iR3+
         xeJUXzGuomoqrpZGrorZF3LqbC06dbtwXQRZ7v9GqmYRiKmS114zjhBDminnDmWHymrB
         vqFdXDznDncF4mElhzl7wb/ZXeXK46bvlTrJ96owP1AMMv48252+PPdxMM5fBN52P1to
         7ceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692824; x=1782297624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kiB2cTlRUl71yyu1OdTexyxMokBPzW7qW0HIhsxCVIg=;
        b=ktNx3u1tNsOj4BNwuZ8D7JIRKOqNI/7RWiXB6Gd7MeTf4JhS5/+DqzaVeduTz0dW4a
         zGl08lLARUGtUgmy9rN3WufySRXTgL6Dq18bFYnlG7U2ZNYSROJvgN9MG7bPxSRzcl/u
         mfbgulPHbg9w1TzshahqQ8KNWohNUOAtiTUkNw4RmSpCtG1g7hjkAhMdjbaT7LzAdrDB
         Wiv2MRBWF5WCY57BNy6TaPfURF4U5DTzbAvLXWLVesm+sYvzpR7qv2LLdJEkc6tZRIw9
         9ElVmnJIvmb0/9oPC8MzmG3oU7fnQ8vJmpJ6BLDmFvvueIGINECriOpFkIRek0WTI6gE
         yGcw==
X-Forwarded-Encrypted: i=1; AFNElJ8zlilZsBV2/MFP/YFMBg3PbXdbELk+iTwo8cFsLLyCmxCJ9TiT1q8IbbciU7RH1fXt9XG7XPoyK5w7ba11@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx6AsDXZXQpOjPbd+5RsUvSpJu745zgQiriM5Owq9F7GHG7zZO
	FwRQLTLXWudC2zp/dEQg1+5pDXOO4g+Oj5ume4fvwgP+d5LOl4/RQ9HM
X-Gm-Gg: AfdE7cmlvX/+//Iq1SHHKBwbEbQM/EzL4gMluUoz8+jdY1DM81jGzu/pSpbhKgVq/N1
	emynvb3nv3ojOe+9uh0Xp5MU+XqhsE8NJGnpWIqp3j7/xhV+BRzOO+Vt1BZSGL6egOB4wxP3Zhv
	FQbDGTefD3YJiZLyohJ3nWtMLSn5YLT/efd9Z1o95GXSAMapOKgWrcxCzReMrqWlR8Vu8+Q1VZL
	nEfbOAnHNY7xe5Lf70fN3WWju7D8VjvXKd1LLa0814CXuibLS7Dp7xorqrp0Bq+lrkmK39ZdFrX
	/vs2QRFD+uiiDBB8YdxgdIZKFbyfFHuGjgCwFhdnpLG9mcYHvF1C7YF57LC6MSUZVu2kKCeLinW
	1gIwtKIxQxhAjfAlVkXEpqOqr4EXkh2RwsIv4Po5PTtfu6hSHQdVZuFHYqRC3OOSD2t/n6ec66v
	1YVf/f7m1K5s5fR1uAadDHRetKZVS/YmTwTht2tNatQ8rYo+UoFrfh3N8hvg==
X-Received: by 2002:a05:7301:6583:b0:304:e59a:e3d1 with SMTP id 5a478bee46e88-30bca0e2049mr1526809eec.24.1781692823559;
        Wed, 17 Jun 2026 03:40:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:23 -0700 (PDT)
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
Subject: [PATCH 47/78] ASoC: codecs: rt700: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:04 +0700
Message-ID: <20260617103235.449609-48-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-113590-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C6FC698FA2

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt700-sdw.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 30fcca210f05..8b15bbc31ac3 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -416,12 +416,11 @@ static int rt700_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt700->disable_irq_lock);
+	guard(mutex)(&rt700->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt700->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt700->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt700->disable_irq_lock);
 
 	return 0;
 }
@@ -502,11 +501,11 @@ static int rt700_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt700->disable_irq_lock);
-	rt700->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt700->disable_irq_lock);
+	scoped_guard(mutex, &rt700->disable_irq_lock) {
+		rt700->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
-- 
2.43.0


