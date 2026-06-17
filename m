Return-Path: <linux-arm-msm+bounces-113554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tIOBGuZ6Mmpd0gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113554-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:45:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C351698A14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:45:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=h1HsbCbx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113554-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113554-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E02E317C109
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 10:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2C943DA3C;
	Wed, 17 Jun 2026 10:35:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E4A43E49A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:35:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692506; cv=none; b=qpIO3p44mAxwJyalVxAhKsO3yFGPTeIdVnaHImWWCSjWnhVsa/5d7ExI6fm3A8c8k1ZBz+4i73s0HEfW5+dResjyCJ5WVPH9c9aT8aCmuUp+dLOGxOlcnhhuyQB/BMWTfFHvCcguDLFBWfw3cv7fY9BBvFOZYGDMAKq3YFo+7ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692506; c=relaxed/simple;
	bh=bnnbXh/V2n2+AtFO4atogpAp71aVpB96YqCdXUYXKh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JRuIkjYhLs89obonI8mpwgrf8y0uiR66kGHvM0dF7KTFt1PizY0X3KR+nte3q61+4rXu77FR7h9NANI5hnjJBaDDoqb9Sk3THsmtT8wUlqMZjh519wTBb6YFmSGOapIH9Cw/uMtsk2BFMa/ODkJ3hKHc8jIGMfwXbo0N0df0Dyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1HsbCbx; arc=none smtp.client-ip=74.125.82.48
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-137335bc3caso6883230c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 03:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692500; x=1782297300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1QeGLnTyUL0/QJF0HVH9R665IeUBRSb9Jie1YUIXrk=;
        b=h1HsbCbx+OrcSeeWH5gttjbA3sN78vLQQ5KJacIBBE0OXX7pvuYPMWTzJV63/hZe/9
         0JDWhSCpEDJIgC6nsRjYbPYA9z+3COcfxoWW/gMJUh9NnG6tbnce4uu2mzXODOYlWZoS
         3kHqdlYaBATMlXSJmJpuHam+vCl3Gvqb0Bgh5itzwX48AdjcfmdIub6nGTSfuv+sFK2H
         OK/5HykAVvZHpE21xKhSjEseY2B5Zxe1z0Slb4JdAM9gtRdQ6MPmsAyeNwt0iqyRIZZn
         BPczn4MphW6zs3MNSyR9i9F27GO6Yaf2dqPiPaMhGpSknqrndBSheOQmh2FRZhFvWAyM
         KZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692500; x=1782297300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U1QeGLnTyUL0/QJF0HVH9R665IeUBRSb9Jie1YUIXrk=;
        b=YNyZzc/gyEwO7o4fKPgvAI8GdkawRrtD+E79yKnY/s1BjrXYEPhlPJb22wazgTtjJX
         9NCYSruOHb/ZgZIeE0ypQttV8V9vCmM0dqJX6j/1JKYjJRpR6jL/eqBd8e9BLu18epWL
         +wDuRRXHbm/1PX26RzT6CE/Cqn0nmTO7fVRtrKuaaQEhL9Kd2VU0ipAivSr1ie6IfNSH
         FEhHQG/4EepNGXEM50tbTzUrbWRER8yXcjiNKJ0oVr3/jPgEshFU3TKfd/1R9xTn5/wI
         tcXNcRphxLRNpHOKUM73uicDCbhkU7QzgAzGIFWaQLraWsyMRQP2pmT93C3DUpGdkbIf
         Wuag==
X-Forwarded-Encrypted: i=1; AFNElJ/6vpLeZlJjUNWpoGCEX+LZ5jljISgjHb6alRnHwsOTQVdZoSaHkuVjdTKnBjfkmZ1pDhSuKDedOReACg/d@vger.kernel.org
X-Gm-Message-State: AOJu0YyyKcJMqfDt6rhmeuTN5djw7rJ91eGH5e6/XgYUyqvgke6c90u2
	wHPwgFPGwBodvl/8o0lO2fLTRDlOHFKugl8JJYgCZ0J1SA/LfmB+Oiwf
X-Gm-Gg: AfdE7clVzMug7Im+SLiPuU6jADi/KS/7aANV1jMeEl25cuW5TSBnH+wajTy+mskYzhq
	4UFf1R6Wdu/K6u6kX7hVrjvWF126NXrcZRHCsG80OqMfuFD0ald/Ha85D8h4RNkq2af+o84cxbZ
	EaL6CthDpmbbuilLzTL+Oeaeb+dayhCAUOsNQdz476yrvrlEnpSEyBm+68mvs9uuYq2vM0h3H6P
	uEuNbg7D71KBG4KukVJ3SmfkSs8zZYup+sDFmTDAigRZfVD+AIoYcirHeS76ZSeFmC64V/s9Uz9
	EzCbTKaVaXxdh/q7dW8NTq++/WbcwPPFug7MVlAy+tlMdgXGaWS0FXuRV8fjvfxbA/p1Nwo1ri/
	t6XBgRofgAw5FjS7N4QmX8V3j1gpyeo561/vZwDMPfShFAE6w95Lx0GBXKEXP0QZkqBrRUWCe3S
	qQ6njbdyi1K9s8zKWyvi98kdDEl0euX2qeRs4tyvCJX2SGSfI=
X-Received: by 2002:a05:7301:7c0e:b0:303:f295:4db2 with SMTP id 5a478bee46e88-30bc91d96d0mr1569188eec.0.1781692499885;
        Wed, 17 Jun 2026 03:34:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:59 -0700 (PDT)
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
Subject: [PATCH 13/78] ASoC: codecs: cs35l56: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:30 +0700
Message-ID: <20260617103235.449609-14-phucduc.bui@gmail.com>
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
	RCPT_COUNT_TWELVE(0.00)[35];
	TAGGED_FROM(0.00)[bounces-113554-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C351698A14

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/cs35l56-shared.c |  6 ++--
 sound/soc/codecs/cs35l56.c        | 56 +++++++++++++++----------------
 2 files changed, 29 insertions(+), 33 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index f14e2eaaa4ee..6cb835a5aaac 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -645,12 +645,12 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 	if (!cs35l56_base->init_done)
 		return IRQ_NONE;
 
-	mutex_lock(&cs35l56_base->irq_lock);
+	guard(mutex)(&cs35l56_base->irq_lock);
 
 	rv = pm_runtime_resume_and_get(cs35l56_base->dev);
 	if (rv < 0) {
 		dev_err(cs35l56_base->dev, "irq: failed to get pm_runtime: %d\n", rv);
-		goto err_unlock;
+		return ret;
 	}
 
 	regmap_read(cs35l56_base->regmap, CS35L56_IRQ1_STATUS, &val);
@@ -692,8 +692,6 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 
 err:
 	pm_runtime_put(cs35l56_base->dev);
-err_unlock:
-	mutex_unlock(&cs35l56_base->irq_lock);
 
 	return ret;
 }
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 570a68829ccd..98ebf38c9bb7 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -848,42 +848,40 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 	if (ret)
 		goto err;
 
-	mutex_lock(&cs35l56->base.irq_lock);
+	scoped_guard(mutex, &cs35l56->base.irq_lock) {
+		reinit_completion(&cs35l56->init_completion);
 
-	reinit_completion(&cs35l56->init_completion);
-
-	cs35l56->soft_resetting = true;
-	cs35l56_system_reset(&cs35l56->base, !!cs35l56->sdw_peripheral);
+		cs35l56->soft_resetting = true;
+		cs35l56_system_reset(&cs35l56->base, !!cs35l56->sdw_peripheral);
 
-	if (cs35l56->sdw_peripheral) {
-		/*
-		 * The system-reset causes the CS35L56 to detach from the bus.
-		 * Wait for the manager to re-enumerate the CS35L56 and
-		 * cs35l56_init() to run again.
-		 */
-		if (!wait_for_completion_timeout(&cs35l56->init_completion,
-						 msecs_to_jiffies(5000))) {
-			dev_err(cs35l56->base.dev, "%s: init_completion timed out (SDW)\n",
-				__func__);
-			goto err_unlock;
+		if (cs35l56->sdw_peripheral) {
+			/*
+			 * The system-reset causes the CS35L56 to detach from the bus.
+			 * Wait for the manager to re-enumerate the CS35L56 and
+			 * cs35l56_init() to run again.
+			 */
+			if (!wait_for_completion_timeout(&cs35l56->init_completion,
+							 msecs_to_jiffies(5000))) {
+				dev_err(cs35l56->base.dev, "%s: init_completion timed out (SDW)\n",
+					__func__);
+				goto err;
+			}
+		} else if (cs35l56_init(cs35l56)) {
+			goto err;
 		}
-	} else if (cs35l56_init(cs35l56)) {
-		goto err_unlock;
-	}
 
-	/* Check if the firmware is still reported missing */
-	cs35l56_warn_if_firmware_missing(&cs35l56->base);
+		/* Check if the firmware is still reported missing */
+		cs35l56_warn_if_firmware_missing(&cs35l56->base);
 
-	regmap_clear_bits(cs35l56->base.regmap,
-			  cs35l56->base.fw_reg->prot_sts,
-			  CS35L56_FIRMWARE_MISSING);
-	cs35l56->base.fw_patched = true;
+		regmap_clear_bits(cs35l56->base.regmap,
+				  cs35l56->base.fw_reg->prot_sts,
+				  CS35L56_FIRMWARE_MISSING);
+		cs35l56->base.fw_patched = true;
 
-	if (cs35l56_write_cal(cs35l56) == 0)
-		cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
+		if (cs35l56_write_cal(cs35l56) == 0)
+			cs35l56_mbox_send(&cs35l56->base, CS35L56_MBOX_CMD_AUDIO_REINIT);
+	}
 
-err_unlock:
-	mutex_unlock(&cs35l56->base.irq_lock);
 err:
 	cs35l56_enable_sdw_interrupts(cs35l56);
 }
-- 
2.43.0


