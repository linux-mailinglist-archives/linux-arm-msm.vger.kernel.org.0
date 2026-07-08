Return-Path: <linux-arm-msm+bounces-117679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZHABA3diTmrLLgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:45:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E8980727884
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 16:45:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="W/V/Ai+u";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117679-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117679-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A90E300863D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 14:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931FE4BCAAE;
	Wed,  8 Jul 2026 14:22:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFCD47D955
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:22:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520541; cv=none; b=uMkVOsD/0nFUuT/8sFvVPP9Vk7csjXIBAga/Nc5hS2WMqO9K29ZxyR4QVVAlKDyzKVVx05Nc+bn1t5VjQpJyepoPXrdyMAVEsToJITofC9sroMBY6SELT38eo4qaGn2051P6qlOZfW75NsgmvMpWIUNGrUi8UrEihYiOlE35/w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520541; c=relaxed/simple;
	bh=b6bXhDV0xAT62Sv/xuA4dAXzeoy8Q1sAavmTbjIAcBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X+zwGcr0jcByIdnYLeI5GMS4TByf72VhG3MDz22++dSynoYDiVJM/8sIuAZkissxCRqUo/yfDtUrkcFj8J8DZrArM3PTlHe1g9nYZvidXg9tMbLSsRIHAGTckX6PCDvOT3TwZ4jRvxIGqw4x89m6tndGclkVilzYSeSVlkqWDZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/V/Ai+u; arc=none smtp.client-ip=209.85.214.173
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cae1a3a744so5876015ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520538; x=1784125338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oDRsvel3aOe6HXXq16gFA8Smd1MpsNxMXFE75/1K/lk=;
        b=W/V/Ai+u1gx4vt52cxjvE0aXR2QPxI4LU6F6ONemIJ0Q3sI8cz/RqiEmble08mAyyz
         IkXbTZZUU9NHdirQdk0/BgnXshlhZLquKGPabd094UYYyF4UVWqFHiVw+sc9yHkTj6pE
         ogyZsefZ3CqGY+VPQnLP2pHfD0m2/zxbPfdpw+h+1I4hJsLSmixhqBCYpGK1hKZ5769G
         v19wxKsKx74HxyD5s4didaxK67fiBBqJTFbZs0kuSucGpd/bDYiT7aeL8uxfcTWCY8RW
         266WLe5GyWnjKMAWC448GO65U/cw/xbT94oEfQ4BwV04xal9il0ka7OwY6v19cJS735g
         m+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520538; x=1784125338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oDRsvel3aOe6HXXq16gFA8Smd1MpsNxMXFE75/1K/lk=;
        b=qmY7VDtNgfA2mUyCK8y9WD5vgEAmljFBjzxhKXtxuog9vObvL//ggVJP9W4xxG7d8K
         Q7wxKfI5Ub8Eybethp8ZaaLmCgEvbO3mrNzIae4GT+mwPnvsQG3/znuC/tpTz8UXMUuw
         iDnjhIuPo9eRMgzH0wl3cnss8k6pmBPWQPwbtPSms+8MTkAJ3ntE3GLWnSwc0z8dY3m6
         m+hW3HosnSgeAZrWzwBQIqcRvWEVNHmO8hhirfEMO71h5SpF6F/xYlM0zBF7v4bl8eEL
         fmYQ/mLUGIRt/0D/YZGMbziXenPOJB/M2acDU3obKX12+3eyLt/qtnylZqv6umZuhfdA
         YInQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjJ1ibT+8AHc3rLTKeNDRz9VBCM0/lQgMDNCd8+cT9gh0BH00WaERmeua35WENruwlhcK2jsShzC2GuZSg@vger.kernel.org
X-Gm-Message-State: AOJu0YzFzL1H8ChYh4tZ0sgwQIlavi06dqeK8GMDZCLPlkqBYO/XEVeY
	MQErIVclHzmwhNI7fbDNdaztajUWELa2ihIrD+fP1JFFilWVhMlbTRC3
X-Gm-Gg: AfdE7cneIbG+UsR5tf2QeokFw0c3qW0R+nAa1pBklE2hNQYkw3nwprkWjgLERFiOkc9
	jl7T1XJd6zhmnfAJh7nmB18ua85RldTDr1FYhoaUraACkKM+B2WvRAhJTPAqsjf76DBSLuSXfa4
	Yo9Y11zrrCRA1KVtjL70IhEcH1C2rbmG78+S0U+9tJgFrd3izWwxDY0I+PdxFsoHDE0Ldx7ZY/X
	FLTkAnQZVGDtgVwbb6IX3HYvvBcqWHgixRgjjf8YPcczmQUlTr/nyyBlqnFN29qy1X/M6oHv7bf
	teStNOLxl5w9LGRh53g5TDx3nFDFK2mXZ/ko+H8dG8VSdCMGKQ8z5tthnMcsv8yV/nCW5KT4tGX
	M5IyHxJMiO00xk1fmSxBUKk5+cXD9xCkC4GijZYDJd95PqHu1Vfel4q4KTSnkL4zVdOVF7g44Z/
	nocS7Tu5YD4iptstWlcxi7na85ZeFRu1anTpDiHOyBRIrTSP0=
X-Received: by 2002:a17:903:22c1:b0:2bf:9760:b94d with SMTP id d9443c01a7336-2ccea37ace4mr29753045ad.15.1783520538163;
        Wed, 08 Jul 2026 07:22:18 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.22.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:17 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 24/27] ASoC: codecs: rt711: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:31 +0700
Message-ID: <20260708141734.578926-25-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-117679-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:tiwai@suse.com,m:nick.li@foursemi.com,m:herve.codina@bootlin.com,m:support.opensource@diasemi.com,m:lgirdwood@gmail.com,m:perex@perex.cz,m:srini@kernel.org,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:shenghao-ding@ti.com,m:kevin-lu@ti.com,m:baojun.xu@ti.com,m:sen@ti.com,m:oder_chiou@realtek.com,m:linusw@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:u.kleine-koenig@baylibre.com,m:zhangyi@everest-semi.com,m:marco.crivellari@suse.com,m:kees@kernel.org,m:sammiee5311@gmail.com,m:arnd@arndb.de,m:rongqianfeng@vivo.com,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-mediatek@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:phucduc.bui@gmail.com,m:matthiasbgg@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[diasemi.com,gmail.com,perex.cz,kernel.org,opensource.cirrus.com,collabora.com,ti.com,realtek.com,renesas.com,baylibre.com,everest-semi.com,suse.com,arndb.de,vivo.com,vger.kernel.org,lists.infradead.org];
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
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E8980727884

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 30 ++++++++++----------
 sound/soc/codecs/rt711-sdca.c     |  8 ++----
 sound/soc/codecs/rt711-sdw.c      | 24 ++++++++--------
 sound/soc/codecs/rt711.c          | 46 +++++++++++++++----------------
 4 files changed, 53 insertions(+), 55 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 461315844ba9..c8dfdec65e61 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -331,7 +332,6 @@ static int rt711_sdca_interrupt_callback(struct sdw_slave *slave,
 	if (status->sdca_cascade && !rt711->disable_irq)
 		mod_delayed_work(system_power_efficient_wq,
 			&rt711->jack_detect_work, msecs_to_jiffies(30));
-
 	mutex_unlock(&rt711->disable_irq_lock);
 
 	return 0;
@@ -416,13 +416,13 @@ static int rt711_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt711_sdca->disable_irq_lock);
-	rt711_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt711_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt711_sdca->disable_irq_lock) {
+		rt711_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -444,13 +444,15 @@ static int rt711_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt711->disable_irq_lock);
-		if (rt711->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt711->disable_irq = false;
+		scoped_guard(mutex, &rt711->disable_irq_lock) {
+			if (rt711->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt711->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt711->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 3a26c782d800..e93ad34fb545 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -107,7 +108,7 @@ static int rt711_sdca_calibration(struct rt711_sdca_priv *rt711)
 	int chk_cnt = 100;
 	int ret = 0;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	dev = regmap_get_device(regmap);
 
 	regmap_read(rt711->regmap, RT711_RC_CAL_STATUS, &val);
@@ -178,7 +179,6 @@ static int rt711_sdca_calibration(struct rt711_sdca_priv *rt711)
 	rt711_sdca_index_write(rt711, RT711_VENDOR_REG,
 		RT711_DIGITAL_MISC_CTRL4, 0x201b);
 
-	mutex_unlock(&rt711->calibrate_mutex);
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
 }
@@ -450,7 +450,7 @@ static void rt711_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt711_sdca_jack_init(struct rt711_sdca_priv *rt711)
 {
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 
 	if (rt711->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -515,8 +515,6 @@ static void rt711_sdca_jack_init(struct rt711_sdca_priv *rt711)
 
 		dev_dbg(&rt711->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt711->calibrate_mutex);
 }
 
 static int rt711_sdca_set_jack_detect(struct snd_soc_component *component,
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index df3c43f2ab6b..71a9a8761ab5 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -423,12 +424,11 @@ static int rt711_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt711->disable_irq_lock);
+	guard(mutex)(&rt711->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt711->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt711->jack_detect_work, msecs_to_jiffies(250));
 	}
-	mutex_unlock(&rt711->disable_irq_lock);
 
 	return 0;
 }
@@ -510,11 +510,11 @@ static int rt711_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt711->disable_irq_lock);
-	rt711->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt711->disable_irq_lock);
+	scoped_guard(mutex, &rt711->disable_irq_lock) {
+		rt711->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
@@ -536,12 +536,12 @@ static int rt711_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt711->disable_irq_lock);
-		if (rt711->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
-			rt711->disable_irq = false;
+		scoped_guard(mutex, &rt711->disable_irq_lock) {
+			if (rt711->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
+				rt711->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt711->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT711_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 5dbe9b67703e..5bdca5330ca4 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -89,9 +90,9 @@ static int rt711_calibration(struct rt711_priv *rt711)
 	struct regmap *regmap = rt711->regmap;
 	int ret = 0;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	regmap_write(rt711->regmap,
-		RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+		     RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
 	dev = regmap_get_device(regmap);
 
@@ -101,12 +102,12 @@ static int rt711_calibration(struct rt711_priv *rt711)
 
 	/* trigger */
 	rt711_index_update_bits(regmap, RT711_VENDOR_CALI,
-		RT711_DAC_DC_CALI_CTL1, RT711_DAC_DC_CALI_TRIGGER,
-		RT711_DAC_DC_CALI_TRIGGER);
+				RT711_DAC_DC_CALI_CTL1, RT711_DAC_DC_CALI_TRIGGER,
+				RT711_DAC_DC_CALI_TRIGGER);
 
 	/* wait for calibration process */
 	rt711_index_read(regmap, RT711_VENDOR_CALI,
-		RT711_DAC_DC_CALI_CTL1, &val);
+			 RT711_DAC_DC_CALI_CTL1, &val);
 
 	while (val & RT711_DAC_DC_CALI_TRIGGER) {
 		if (loop >= 500) {
@@ -119,16 +120,15 @@ static int rt711_calibration(struct rt711_priv *rt711)
 
 		usleep_range(10000, 11000);
 		rt711_index_read(regmap, RT711_VENDOR_CALI,
-			RT711_DAC_DC_CALI_CTL1, &val);
+				 RT711_DAC_DC_CALI_CTL1, &val);
 	}
 
 	/* depop mode */
 	rt711_index_update_bits(regmap, RT711_VENDOR_REG,
-		RT711_FSM_CTL, 0xf, RT711_DEPOP_CTL);
+				RT711_FSM_CTL, 0xf, RT711_DEPOP_CTL);
 
 	regmap_write(rt711->regmap,
-		RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
-	mutex_unlock(&rt711->calibrate_mutex);
+		     RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
@@ -362,24 +362,24 @@ static void rt711_jack_init(struct rt711_priv *rt711)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rt711->component);
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 	/* power on */
 	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
-			RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
+			     RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D0);
 
 	if (rt711->hs_jack) {
 		/* unsolicited response & IRQ control */
 		regmap_write(rt711->regmap,
-			RT711_SET_MIC2_UNSOLICITED_ENABLE, 0x82);
+			     RT711_SET_MIC2_UNSOLICITED_ENABLE, 0x82);
 		regmap_write(rt711->regmap,
-			RT711_SET_HP_UNSOLICITED_ENABLE, 0x81);
+			     RT711_SET_HP_UNSOLICITED_ENABLE, 0x81);
 		regmap_write(rt711->regmap,
-			RT711_SET_INLINE_UNSOLICITED_ENABLE, 0x83);
+			     RT711_SET_INLINE_UNSOLICITED_ENABLE, 0x83);
 		rt711_index_write(rt711->regmap, RT711_VENDOR_REG,
-			0x10, 0x2420);
+				  0x10, 0x2420);
 		rt711_index_write(rt711->regmap, RT711_VENDOR_REG,
-			0x19, 0x2e11);
+				  0x19, 0x2e11);
 
 		switch (rt711->jd_src) {
 		case RT711_JD1:
@@ -450,7 +450,6 @@ static void rt711_jack_init(struct rt711_priv *rt711)
 	if (snd_soc_dapm_get_bias_level(dapm) <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt711->regmap,
 			RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
-	mutex_unlock(&rt711->calibrate_mutex);
 }
 
 static int rt711_set_jack_detect(struct snd_soc_component *component,
@@ -511,7 +510,7 @@ static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 	unsigned int read_ll, read_rl;
 	int i;
 
-	mutex_lock(&rt711->calibrate_mutex);
+	guard(mutex)(&rt711->calibrate_mutex);
 
 	/* Can't use update bit function, so read the original value first */
 	addr_h = mc->reg;
@@ -599,7 +598,6 @@ static int rt711_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 		regmap_write(rt711->regmap,
 				RT711_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
 
-	mutex_unlock(&rt711->calibrate_mutex);
 	return 0;
 }
 
@@ -908,11 +906,11 @@ static int rt711_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		mutex_lock(&rt711->calibrate_mutex);
-		regmap_write(rt711->regmap,
-			RT711_SET_AUDIO_POWER_STATE,
-			AC_PWRST_D3);
-		mutex_unlock(&rt711->calibrate_mutex);
+		scoped_guard(mutex, &rt711->calibrate_mutex) {
+			regmap_write(rt711->regmap,
+				     RT711_SET_AUDIO_POWER_STATE,
+				     AC_PWRST_D3);
+		}
 		break;
 
 	default:
-- 
2.43.0


