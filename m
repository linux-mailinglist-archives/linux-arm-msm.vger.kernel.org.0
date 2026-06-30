Return-Path: <linux-arm-msm+bounces-115292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1ahLECFmQ2qGXwoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115292-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:45:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AF16E0DB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 08:45:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=piTcwy5U;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115292-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115292-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3485B30E4F8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 06:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 807AB3EAC71;
	Tue, 30 Jun 2026 06:38:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DDD3D7D80
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 06:38:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801503; cv=none; b=rZPZNB/wz69D/Pl8EZLuD6RrxPdcRoJniBNVFcIvZ+qsEBxEv58/yGKNDZyzvmVZCP75nqVDO9S3HoaTSpQyO2uWpRn2D+vUP26Env9PohJ2GSSR5pIydt6S2hNDpPlfGFuFHOkOtLvsOnzwAMmdUqZMrjEGPSRPDyD2BL2q6fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801503; c=relaxed/simple;
	bh=3PzW41r3lCqq7WloY+qVpfi9ylriJQnkL1vsBK8sQMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Na000AmM8SWDp8SaQz7EtvzD6LZNdPDQwFoOeHN33faGanrxpmTzt/6wjah/wZd5nlZXvN7l8wvFY+IQUH4c6N9VwVs6SPTOk5dSs84eTi3+9N/blc0Vklu/p195r5LrK3Ou6px8JMF4h93dUYc2GoOVzwpz16knu+Jd0xE13no=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=piTcwy5U; arc=none smtp.client-ip=209.85.210.170
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8423f236418so2120017b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 23:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782801495; x=1783406295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5I542Atg1yY1laQM/jnE851nD9DT4YIfrvz5OV73CCc=;
        b=piTcwy5UhK5q67EpzDV9q5LDAsypnZ7KVN8pecLV0SxPgT53C3VrgfLD51CbK/38IM
         Fg4O5RVGE71SYZgyNe+ugojykk13ccPN508Kasm5403ulyVI6JoSU5+I1rsXIVEsHAni
         iKbqmWEZacHHa8cYwwLmg746qjx10lMS5MQMiYtO4y5QgMPUMymkCcwNogbxfLnZ7zPj
         YGViaqDC4rfrsw7Az9m55oQ5usa8zWwJRw11D7xduSOY0dbvI+FXmsRYIbbh99fZMVnr
         ZSgBNhx3ZNvmW4ui8tCon4mQz+BLxhX+HZjcNxNriBJhqDu6q9FmgfOA6vxQ0m5ocyRn
         zIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801495; x=1783406295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5I542Atg1yY1laQM/jnE851nD9DT4YIfrvz5OV73CCc=;
        b=eZ/DawfZUlcjsnojZIAgP7+Sc/pjGF+gRZSQE3wyenazvDMg07TFUcCfPgkdE3OfVq
         ZCTEQIXbDu1p8TMZDJSL1/XCPVlSDNLvnHeLvWajvqF5nduJrt7kf3fMfjzHwD3fZNmn
         EyvQC2OjqIO4wD00KMLD3CoLqsP4RsAwASmx/j17j7P3kfts8RuPoQ3w61SWGmuqjwva
         Cc3StjhQE51xakLZqBcZqdVrrj7t+0ikTHOtuCeFt1q+mAN0mHpLbTSJN8VHR0wPbm1D
         UzQyoR+1UzCnw8ZKcYupwLGMp8jVzQae5PzTwyBbrgNJ83/I08wWMdo/PGNT83rTH9lL
         QusQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6bb9enqZYMCbzb4K1dNxhR/HsPBpE3FA6Qq4TKNLomigSsY24cH+Rp9Fj8dGJSkm+MebpMZNczwuBIIZr@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1fnENoS2EnKHDMLQYb20jYA8qIRg8uw9hRifv/ocKpWADoM2g
	CZ98FBDB0lJCxS8m40moIq5LtQBR3Fn5jfWolL9ZmVxSkx/YtVKqY1yH
X-Gm-Gg: AfdE7clwqXKTxd3xw9tekIsK0C+Naue1wVHujTGqDOAbKLxmzfKSDwT0ZFH+mCtqf/d
	jt6BZUz5pzvyTTb5dqW28eTKUs5Nasqrkex0jq5ek/gEs560jpHu4OshisimspznmReo/EFqIAk
	XYt02zH4mW219xgN2NyBve/basKdS71iDsntIu0M2MvmRs+8MmFMpfXI07rTOh0Cmp76UyiuAj7
	rvHWvHFKyGsDIM4ybLEDjjw5lD4EBL8Xw8Jl/8N2mHOtDcqRYutXFTciHHzt9h8ZmyOoqBbCfhh
	QfrQy9PPh3GdoTIflj2cZ0k+UCoV6q/wOSm9MCgCKb/VGBLP/wF0QONV5/BbffNZh/3LPeefTL2
	1DCUemGoSfMVZkyLLwC9h0pN1WbSgay4iNM9SQC/H/Fu+zqrNaFDyjQKK+P1U79KSCyRBPqIRip
	o5MuurEb79MDSbnCmsMVbWxFQedTCegJmg0as1O+d5CnHttfQ=
X-Received: by 2002:a05:6a00:2191:b0:847:8dec:1427 with SMTP id d2e1a72fcca58-8479eed0d97mr1690509b3a.8.1782801495183;
        Mon, 29 Jun 2026 23:38:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cd237sm1165061b3a.32.2026.06.29.23.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:38:14 -0700 (PDT)
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
Subject: [PATCH 22/27] ASoC: codecs: rt5682: Use guard() for mutex locks
Date: Tue, 30 Jun 2026 13:34:44 +0700
Message-ID: <20260630063449.503996-23-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630063449.503996-1-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
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
	RCPT_COUNT_TWELVE(0.00)[33];
	TAGGED_FROM(0.00)[bounces-115292-lists,linux-arm-msm=lfdr.de];
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
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 93AF16E0DB9

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt5682-sdw.c | 24 ++++++++++++------------
 sound/soc/codecs/rt5682.c     |  5 ++---
 sound/soc/codecs/rt5682s.c    | 17 +++++------------
 3 files changed, 19 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index dec8c2147d68..e7dc4f722fc1 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -6,6 +6,7 @@
 // Author: Oder Chiou <oder_chiou@realtek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -660,12 +661,11 @@ static int rt5682_interrupt_callback(struct sdw_slave *slave,
 	dev_dbg(&slave->dev,
 		"%s control_port_stat=%x", __func__, status->control_port);
 
-	mutex_lock(&rt5682->disable_irq_lock);
+	guard(mutex)(&rt5682->disable_irq_lock);
 	if (status->control_port & 0x4 && !rt5682->disable_irq) {
 		mod_delayed_work(system_power_efficient_wq,
 			&rt5682->jack_detect_work, msecs_to_jiffies(rt5682->irq_work_delay_time));
 	}
-	mutex_unlock(&rt5682->disable_irq_lock);
 
 	return 0;
 }
@@ -736,11 +736,11 @@ static int rt5682_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt5682->disable_irq_lock);
-	rt5682->disable_irq = true;
-	ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
-			       SDW_SCP_INT1_IMPL_DEF, 0);
-	mutex_unlock(&rt5682->disable_irq_lock);
+	scoped_guard(mutex, &rt5682->disable_irq_lock) {
+		rt5682->disable_irq = true;
+		ret = sdw_update_no_pm(slave, SDW_SCP_INTMASK1,
+				       SDW_SCP_INT1_IMPL_DEF, 0);
+	}
 
 	if (ret < 0) {
 		/* log but don't prevent suspend from happening */
@@ -760,12 +760,12 @@ static int rt5682_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt5682->disable_irq_lock);
-		if (rt5682->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
-			rt5682->disable_irq = false;
+		scoped_guard(mutex, &rt5682->disable_irq_lock) {
+			if (rt5682->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_INTMASK1, SDW_SCP_INT1_IMPL_DEF);
+				rt5682->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt5682->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT5682_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 4b82e07d3b2c..6f7e68c20d13 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -6,6 +6,7 @@
 // Author: Bard Liao <bardliao@realtek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -3125,7 +3126,7 @@ void rt5682_calibrate(struct rt5682_priv *rt5682)
 {
 	int value, count;
 
-	mutex_lock(&rt5682->calibrate_mutex);
+	guard(mutex)(&rt5682->calibrate_mutex);
 
 	rt5682_reset(rt5682);
 	regmap_write(rt5682->regmap, RT5682_I2C_CTRL, 0x000f);
@@ -3175,8 +3176,6 @@ void rt5682_calibrate(struct rt5682_priv *rt5682)
 		regmap_write(rt5682->regmap, RT5682_CALIB_ADC_CTRL, 0x2005);
 	regmap_write(rt5682->regmap, RT5682_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5682->regmap, RT5682_CAL_REC, 0x0c0c);
-
-	mutex_unlock(&rt5682->calibrate_mutex);
 }
 EXPORT_SYMBOL_GPL(rt5682_calibrate);
 
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 3624067950c0..34997cfb465b 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -6,6 +6,7 @@
 // Author: Derek Fang <derek.fang@realtek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -648,7 +649,7 @@ static void rt5682s_sar_power_mode(struct snd_soc_component *component, int mode
 {
 	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5682s->sar_mutex);
+	guard(mutex)(&rt5682s->sar_mutex);
 
 	switch (mode) {
 	case SAR_PWR_SAVING:
@@ -695,8 +696,6 @@ static void rt5682s_sar_power_mode(struct snd_soc_component *component, int mode
 		dev_err(component->dev, "Invalid SAR Power mode: %d\n", mode);
 		break;
 	}
-
-	mutex_unlock(&rt5682s->sar_mutex);
 }
 
 static void rt5682s_enable_push_button_irq(struct snd_soc_component *component)
@@ -2534,7 +2533,7 @@ static int rt5682s_wclk_prepare(struct clk_hw *hw)
 	if (!rt5682s_clk_check(rt5682s))
 		return -EINVAL;
 
-	mutex_lock(&rt5682s->wclk_mutex);
+	guard(mutex)(&rt5682s->wclk_mutex);
 
 	snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
 		RT5682S_PWR_VREF2 | RT5682S_PWR_FV2 | RT5682S_PWR_MB,
@@ -2556,8 +2555,6 @@ static int rt5682s_wclk_prepare(struct clk_hw *hw)
 
 	rt5682s->wclk_enabled = 1;
 
-	mutex_unlock(&rt5682s->wclk_mutex);
-
 	return 0;
 }
 
@@ -2570,7 +2567,7 @@ static void rt5682s_wclk_unprepare(struct clk_hw *hw)
 	if (!rt5682s_clk_check(rt5682s))
 		return;
 
-	mutex_lock(&rt5682s->wclk_mutex);
+	guard(mutex)(&rt5682s->wclk_mutex);
 
 	if (!rt5682s->jack_type)
 		snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
@@ -2585,8 +2582,6 @@ static void rt5682s_wclk_unprepare(struct clk_hw *hw)
 	rt5682s_set_pllb_power(rt5682s, 0);
 
 	rt5682s->wclk_enabled = 0;
-
-	mutex_unlock(&rt5682s->wclk_mutex);
 }
 
 static unsigned long rt5682s_wclk_recalc_rate(struct clk_hw *hw,
@@ -2997,7 +2992,7 @@ static void rt5682s_calibrate(struct rt5682s_priv *rt5682s)
 {
 	unsigned int count, value;
 
-	mutex_lock(&rt5682s->calibrate_mutex);
+	guard(mutex)(&rt5682s->calibrate_mutex);
 
 	regmap_write(rt5682s->regmap, RT5682S_PWR_ANLG_1, 0xaa80);
 	usleep_range(15000, 20000);
@@ -3034,8 +3029,6 @@ static void rt5682s_calibrate(struct rt5682s_priv *rt5682s)
 	regmap_write(rt5682s->regmap, RT5682S_PWR_DIG_1, 0x00c0);
 	regmap_write(rt5682s->regmap, RT5682S_PWR_ANLG_1, 0x0800);
 	regmap_write(rt5682s->regmap, RT5682S_GLB_CLK, 0x0000);
-
-	mutex_unlock(&rt5682s->calibrate_mutex);
 }
 
 static const struct regmap_config rt5682s_regmap = {
-- 
2.43.0


