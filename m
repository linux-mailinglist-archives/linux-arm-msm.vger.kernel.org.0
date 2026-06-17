Return-Path: <linux-arm-msm+bounces-113593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TeLrD9p/Mmq80wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113593-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:07:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A1570698CF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 13:07:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=s9eEWw1z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113593-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113593-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E0943180167
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8B44071C8;
	Wed, 17 Jun 2026 10:40:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D417472798
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:40:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692851; cv=none; b=D6evrITGWjmumxJFBz9EGDLUh4TEm0a5eGnigH4oOU9Wi5VyVUfhesAxiNsgOPhkd1s8z+K7cUJq1rPStUZsFOJhxRXRzhBFvFF3GkWrGMcWv/qvOva9W5nBuQHbHrpyYkEdeR2H+i3yi0dvKKZvnWSJW+x7A2r8G5UYlKhCjtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692851; c=relaxed/simple;
	bh=LbnglVcFXXDZoUarsc01FNHGS9yskzxEqsNznHtbNZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HSk1r3jErFSOUPakU0FQTpvgYXCLGN2H2MLY/mKGGvvRqHIYRMxizz3IIYE7rIYFMyzxJzeKXVK6Qixnm6XPCtWBvSBCIF3lklBscnLIjoiofpVOBCTOp5mQvMbYP5e7mUsTZRgh6DI0K1KgFTAJyfUmNaHGdxnU8hhlcXCL5OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9eEWw1z; arc=none smtp.client-ip=74.125.82.179
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30bd445db39so182789eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692848; x=1782297648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWpi+WrLr0HzmCcxgPyTE3MUTCsBXdlrFvgGYBNgrFE=;
        b=s9eEWw1zfwQoebUJEPSp1hz0toGnbDe1OjjBINfwljw4ZHT9siEcqcV/jYqWUGFXXy
         fQYeqsX+l+i8bEtLp7kHKxXBt/R90aAra7EmiqbwTGHjDgAudo3JKlK3uAtQIu27GcJL
         Q83+xfj5vPfvZJB9SH/k1MhJimfKH5fCj63N+eZz8gpsYQx4Lk4+xECCRajwTS96qjqg
         gm6aD3zvogLs4C8cAeojxWlOpmBJ8cIh9WDgS5rmjPde8Bch+Si+eD3VPkIrNCsuBbi6
         LMO7nirDvEtCpN/Xg4Wvh9kJd2Y+e4LYh890WHNZHZYJNgNG/mi7v57HN4sZxdRoC4Mj
         1ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692848; x=1782297648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eWpi+WrLr0HzmCcxgPyTE3MUTCsBXdlrFvgGYBNgrFE=;
        b=C57LJ4IXnIQiFyBdUP0295IPyl90hn76UIYO/VtE+R/lCxSzkjhbCW9cEUZVQabz6U
         7urnG3qpNPiEvlXXLSq4ZpYzBVP4xH7Baxxyne+qAD3v/skh0eSHPgPvBpKMmPM8t20Z
         K97/CPRXnN/pjHESh4f3thb3VvHXXEXdXVDtfJVARTZ9SjWjvhSQ9Pv0jrtO4Nz1ol78
         zRCBa+Tkev3/2KfmuodpEC4pApTHZCTjINqsSUqRJLuhIUYe6RLNHv4Y9wC6ijH+1rxj
         dOZv+k1PGyVvN84v7bvGenSAaYx/UK5WgmFRN2cWDsc4L+DR657DCL+JTpiwUB1JsTos
         lmkQ==
X-Forwarded-Encrypted: i=1; AFNElJ817M1uo6xC0p7e14987vUxCxhB5CAJfBEZmg0Lcv3NtvMo7YJePiB4PfgGBQBUxpNvFQpjpwfB5eGCPS56@vger.kernel.org
X-Gm-Message-State: AOJu0YwBxPsTNAymV/dKImZztjrwpMHqnyf1Y5OktMRaG8TSIo1adHm9
	OUerxeJpPAcz2subU0duvx6ftMO2z5hJYl/UalVK7sCwOv6lP0RmDCNJ
X-Gm-Gg: AfdE7ckmkHPEKXlCBHXRV6EAP696K8nTfQnG6k/ogfZUY5S08qEY6RkDzcWikyp9OZ4
	HodOjtkltOZ/2vh/hKneawiedg9/IXoYSjzq3saFsrjnGil48MuAFRqRP2DgRh0iMHzhBKe1z7D
	5tirQKCgbWXscbNn9uXQi4KpzICx0qX5p0L0x1EE3+fHd0v0mz85yYDvJrr9uDlBrAHchPSBQrQ
	1SwWhsYhgRNh0VAQemGqh7Quh/pVmaPPqCJ+fJQmULmt1Y48EDc5azeAeRN6cm+4ZdFWKybxANt
	JSYsKFgx85ynnzRUxDc8lJcSPeZEnepqVJsQZeH3woZsotmXC5IqQGthXXwnV8lF3pKtYShvDJ9
	qOXe0zLNofYvwXE/8IJWxmzsplBpXg60Ir/Jm0RBzzjsBVFoxQrxz9yU7JA490b5sVWnyyHDulj
	Np6jYrqAWdlEnuVE1hYSlU7Af+Hr6uPGchTHAaSUw2fbaYLPY=
X-Received: by 2002:a05:7300:ea06:b0:30b:7bc2:c70b with SMTP id 5a478bee46e88-30bcf0900aemr927511eec.9.1781692848447;
        Wed, 17 Jun 2026 03:40:48 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:40:48 -0700 (PDT)
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
Subject: [PATCH 50/78] ASoC: codecs: rt721: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:32:07 +0700
Message-ID: <20260617103235.449609-51-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-113593-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A1570698CF0

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt721-sdca-sdw.c | 33 +++++++++++++++----------------
 sound/soc/codecs/rt721-sdca.c     |  3 +--
 2 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 58606209316a..0ee78b28a3ce 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -315,7 +315,7 @@ static int rt721_sdca_interrupt_callback(struct sdw_slave *slave,
 	 * scheme. We do want however to prevent new workqueues from being scheduled if
 	 * the disable_irq flag was set during system suspend.
 	 */
-	mutex_lock(&rt721->disable_irq_lock);
+	guard(mutex)(&rt721->disable_irq_lock);
 
 	ret = sdw_read_no_pm(rt721->slave, SDW_SCP_SDCA_INT1);
 	if (ret < 0)
@@ -382,12 +382,9 @@ static int rt721_sdca_interrupt_callback(struct sdw_slave *slave,
 		mod_delayed_work(system_power_efficient_wq,
 			&rt721->jack_detect_work, msecs_to_jiffies(280));
 
-	mutex_unlock(&rt721->disable_irq_lock);
-
 	return 0;
 
 io_error:
-	mutex_unlock(&rt721->disable_irq_lock);
 	pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
 	return ret;
 }
@@ -467,13 +464,13 @@ static int rt721_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt721_sdca->disable_irq_lock);
-	rt721_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt721_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt721_sdca->disable_irq_lock) {
+		rt721_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -495,13 +492,15 @@ static int rt721_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt721->disable_irq_lock);
-		if (rt721->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt721->disable_irq = false;
+		scoped_guard(mutex, &rt721->disable_irq_lock) {
+			if (rt721->disable_irq == true) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt721->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt721->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT721_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 35960c225224..157269ba2723 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -289,7 +289,7 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 
 static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 {
-	mutex_lock(&rt721->calibrate_mutex);
+	guard(mutex)(&rt721->calibrate_mutex);
 	if (rt721->hs_jack) {
 		sdw_write_no_pm(rt721->slave, SDW_SCP_SDCA_INTMASK1,
 			SDW_SCP_SDCA_INTMASK_SDCA_0);
@@ -309,7 +309,6 @@ static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 		rt_sdca_index_update_bits(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
 			RT721_GE_REL_CTRL1, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt721->calibrate_mutex);
 }
 
 static int rt721_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0


