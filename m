Return-Path: <linux-arm-msm+bounces-118151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id inQSI3d/UGqC0AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 07:13:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CB9737469
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 07:13:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hqtSye+t;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118151-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118151-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B9ED7301E597
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 05:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF5B378D63;
	Fri, 10 Jul 2026 05:08:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02651377EAC
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:08:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660086; cv=none; b=U2XuVz4tlDAgknMRwCcpeeGNdIPt4sCQR5HhZug9SIGKWkRq8pkJFDZ21BQW8BrFG5EFCcAn2nje0tvIuZbHVykfToz60a0WNxkep+36fz3o2s7Y2qcxYxC3pA+DLQHvDCmYd8kx+yh3j2iXiea0KjuCfQ8BKN5LZN45vdNtXRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660086; c=relaxed/simple;
	bh=J1G7wPxmRyNBNW8BftE0/keAgbIexwtADbIj/VuZHkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aVxFyhmvUbVJH+3FLAB+M/170xxZGMm7ZuKvNYU8gNK3tKzsrmq3pQmLSp4R13A5Mt+jRL9JL6GJfDwL3j6ZFIiPB2ErM3AyLeqodiCXb+Fnu22YB8kkd0+uQGewpUfD89M4B7BmQ90PzoFVisBPXGUYOVjae6aO6a/yhLhyrbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hqtSye+t; arc=none smtp.client-ip=209.85.210.177
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8487b7b4066so121067b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660083; x=1784264883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1tgnKdUkO+325mAT1Exy7hQiaP44koD8lFsPHXyvSQY=;
        b=hqtSye+tQOn5/kr7Dqfb4F7c159kiqKFJjMAj619pJC82oFUtiYMZY/Ea99RS1f0vz
         yLuEEVYStSXdZyK/kvb9jo8E2Km8JL5uydFqobx4Z1MhWizd2lHYBPwHEJcngNn/ys3y
         RObVwOVpcaWF05bgYu0vHtymj8sRdy1DNBYsxwIE6AimJ9HpGxBb8FnzSkAVGvRQcZD2
         cli39hmOjklS13BioFgtwMfmlKvgokM5RcFEVOc6vHPQbo2QYKtbHSmQxZDKPE13MbqO
         yEY/1/sUbBMfTmivQ+Ry5tzjd+rsXPuiQAl0Xmr41MSWLVfu5tqwSd2pMbhQWtIX12it
         4Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660083; x=1784264883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1tgnKdUkO+325mAT1Exy7hQiaP44koD8lFsPHXyvSQY=;
        b=kXVU4MLWE8azQ17b8GgeKBbf8Ms7Wh8rwuwlbFyOyzYUlJNUr/myGUaN33JGLDXWBn
         na0hP3fD2mwHUXoS/Zz7Q7Ll70/cJtSg5x8Fi5eKWsYLOmAlPQ1+MrcAzyeU7y96PLm7
         HRh0+76MSkTjv4Why5yl8YaoT/pfWuEkVij7y7kO2HngxpsEjBcPkC5PMqOy5IV/LIfL
         eAjxKmWDA3mqCDGZ4oCDYnk7yeZSer3hDK/YqM4yMRr8Dz01yT6UdbhAUmo2LrhFXOmd
         HbJKYN8DbYRhypMUiFtZk/ANh8Irxt7KQbLUovSD6qDXxV6DdOEK1ujFEJDHiVM2ASJC
         Ft1Q==
X-Forwarded-Encrypted: i=1; AHgh+RpwiMg2PCZ0TsfPOEOTh7UtniP9WaLmKFWqM8mdcpgfrD6rXugMfLNMUgP98L+JuwgaJ+3z1O332drzeb3y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1VA896mvEM876Dg1i1wjT1HBVkkPcfPVTpCC4pQGceELgCXxO
	B5XTWAyXUCdyBDn7Dp6inqK6ZvVw/c/oTwGWNMR3OkCru8jHmBQmg8Qq
X-Gm-Gg: AfdE7ckntO7jb2wl0HNLcRRtvqh1sQLpAhNPLfr/ZJ59bU3jurVnCTSAb7nWOQiPR2/
	8b03s1TkzgH/eIN6Pl7TkOLUhkLrawiigMwWclwXn1PelOmgYOkXL0aqnrGa6oMMIJWSR9f24tS
	3Vne05glEcEVjOxJYR87kZikPnxYzmNmHg2v0/vrKuOKR3/gTkOWfm21AIT60BBjoQQqxYzpCBc
	Bhj+kx1WhL02seTzkeaggOahUUBVVFVWOYU6X9n9b6PHSE+Y7iQnJbdUoJxp81kr4AlF65M8mmQ
	hFzzsg0qSsASuOwXZPu3zgZFGm3QYZ+wASmZjEAju/ZIj4YWNNhh3+b0zE7/J0p52Mz+xHmsv58
	2dYbEX9tWxYrBOfnrp5xnA1eI+UxjMTc5X6jT2WhQxqk/mvhzSrXt84Xp572rJryzcB6K+76Kcv
	zHNXJwRALM27YC5hC3Dy1zZjZtz5+Mf5WG9zH3gUj2FpXvTtg=
X-Received: by 2002:a05:6a00:98d:b0:837:f79d:909 with SMTP id d2e1a72fcca58-84843424211mr10048596b3a.39.1783660083225;
        Thu, 09 Jul 2026 22:08:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:08:02 -0700 (PDT)
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
Subject: [PATCH v3 21/27] ASoC: codecs: rt5677: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:05 +0700
Message-ID: <20260710050511.14439-19-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-118151-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[realtek.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6CB9737469

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt5677-spi.c | 36 +++++++----------
 sound/soc/codecs/rt5677.c     | 75 ++++++++++++++++-------------------
 2 files changed, 49 insertions(+), 62 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 1bcafd5f4468..ebc527115ea5 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -6,6 +6,7 @@
  * Author: Oder Chiou <oder_chiou@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/input.h>
 #include <linux/spi/spi.h>
@@ -133,9 +134,8 @@ static int rt5677_spi_hw_params(
 	struct rt5677_dsp *rt5677_dsp =
 			snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5677_dsp->dma_lock);
+	guard(mutex)(&rt5677_dsp->dma_lock);
 	rt5677_dsp->substream = substream;
-	mutex_unlock(&rt5677_dsp->dma_lock);
 
 	return 0;
 }
@@ -147,9 +147,8 @@ static int rt5677_spi_hw_free(
 	struct rt5677_dsp *rt5677_dsp =
 			snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5677_dsp->dma_lock);
+	guard(mutex)(&rt5677_dsp->dma_lock);
 	rt5677_dsp->substream = NULL;
-	mutex_unlock(&rt5677_dsp->dma_lock);
 
 	return 0;
 }
@@ -311,17 +310,17 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 	int ret = 0;
 
 	/* Ensure runtime->dma_area buffer does not go away while copying. */
-	mutex_lock(&rt5677_dsp->dma_lock);
+	guard(mutex)(&rt5677_dsp->dma_lock);
 	if (!rt5677_dsp->substream) {
 		dev_err(rt5677_dsp->dev, "No pcm substream\n");
-		goto done;
+		return;
 	}
 
 	runtime = rt5677_dsp->substream->runtime;
 
 	if (rt5677_spi_mic_write_offset(&mic_write_offset)) {
 		dev_err(rt5677_dsp->dev, "No mic_write_offset\n");
-		goto done;
+		return;
 	}
 
 	/* If this is the first time that we've asked for streaming data after
@@ -355,7 +354,7 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 		ret = rt5677_spi_copy(rt5677_dsp, copy_bytes);
 		if (ret) {
 			dev_err(rt5677_dsp->dev, "Copy failed %d\n", ret);
-			goto done;
+			return;
 		}
 		rt5677_dsp->avail_bytes += copy_bytes;
 		if (rt5677_dsp->avail_bytes >= period_bytes) {
@@ -367,8 +366,6 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 
 	delay = bytes_to_frames(runtime, period_bytes) / runtime->rate;
 	schedule_delayed_work(&rt5677_dsp->copy_work, secs_to_jiffies(delay));
-done:
-	mutex_unlock(&rt5677_dsp->dma_lock);
 }
 
 static int rt5677_spi_pcm_new(struct snd_soc_component *component,
@@ -507,10 +504,8 @@ int rt5677_spi_read(u32 addr, void *rxbuf, size_t len)
 		header[3] = ((addr + offset) & 0x0000ff00) >> 8;
 		header[4] = ((addr + offset) & 0x000000ff) >> 0;
 
-		mutex_lock(&spi_mutex);
-		status |= spi_sync(g_spi, &m);
-		mutex_unlock(&spi_mutex);
-
+		scoped_guard(mutex, &spi_mutex)
+			status |= spi_sync(g_spi, &m);
 
 		/* Copy data back to caller buffer */
 		rt5677_spi_reverse(cb + offset, len - offset, body, t[1].len);
@@ -564,9 +559,8 @@ int rt5677_spi_write(u32 addr, const void *txbuf, size_t len)
 		offset += t.len;
 		t.len += RT5677_SPI_HEADER + 1;
 
-		mutex_lock(&spi_mutex);
-		status |= spi_sync(g_spi, &m);
-		mutex_unlock(&spi_mutex);
+		scoped_guard(mutex, &spi_mutex)
+			status |= spi_sync(g_spi, &m);
 	}
 	return status;
 }
@@ -591,10 +585,10 @@ void rt5677_spi_hotword_detected(void)
 		return;
 	}
 
-	mutex_lock(&rt5677_dsp->dma_lock);
-	dev_info(rt5677_dsp->dev, "Hotword detected\n");
-	rt5677_dsp->new_hotword = true;
-	mutex_unlock(&rt5677_dsp->dma_lock);
+	scoped_guard(mutex, &rt5677_dsp->dma_lock) {
+		dev_info(rt5677_dsp->dev, "Hotword detected\n");
+		rt5677_dsp->new_hotword = true;
+	}
 
 	schedule_delayed_work(&rt5677_dsp->copy_work, 0);
 }
diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 73fc008d558a..3e4d1dbce740 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -6,6 +6,7 @@
  * Author: Oder Chiou <oder_chiou@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/bits.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
@@ -564,46 +565,43 @@ static int rt5677_dsp_mode_i2c_write_addr(struct rt5677_priv *rt5677,
 	struct snd_soc_component *component = rt5677->component;
 	int ret;
 
-	mutex_lock(&rt5677->dsp_cmd_lock);
+	guard(mutex)(&rt5677->dsp_cmd_lock);
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_MSB,
 		addr >> 16);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr msb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_LSB,
 		addr & 0xffff);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr lsb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_MSB,
 		value >> 16);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set data msb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_LSB,
 		value & 0xffff);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set data lsb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_OP_CODE,
 		opcode);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set op code value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
-err:
-	mutex_unlock(&rt5677->dsp_cmd_lock);
-
 	return ret;
 }
 
@@ -623,36 +621,33 @@ static int rt5677_dsp_mode_i2c_read_addr(
 	int ret;
 	unsigned int msb, lsb;
 
-	mutex_lock(&rt5677->dsp_cmd_lock);
+	guard(mutex)(&rt5677->dsp_cmd_lock);
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_MSB,
 		addr >> 16);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr msb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_ADDR_LSB,
 		addr & 0xffff);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set addr lsb value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	ret = regmap_write(rt5677->regmap_physical, RT5677_DSP_I2C_OP_CODE,
 		0x0002);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to set op code value: %d\n", ret);
-		goto err;
+		return ret;
 	}
 
 	regmap_read(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_MSB, &msb);
 	regmap_read(rt5677->regmap_physical, RT5677_DSP_I2C_DATA_LSB, &lsb);
 	*value = (msb << 16) | lsb;
 
-err:
-	mutex_unlock(&rt5677->dsp_cmd_lock);
-
 	return ret;
 }
 
@@ -941,21 +936,20 @@ static void rt5677_dsp_work(struct work_struct *work)
 		activity = false;
 
 		/* Don't turn off the DSP while handling irqs */
-		mutex_lock(&rt5677->irq_lock);
-		/* Set DSP CPU to Stop */
-		regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
-			RT5677_PWR_DSP_CPU, RT5677_PWR_DSP_CPU);
+		scoped_guard(mutex, &rt5677->irq_lock) {
+			/* Set DSP CPU to Stop */
+			regmap_update_bits(rt5677->regmap, RT5677_PWR_DSP1,
+					   RT5677_PWR_DSP_CPU, RT5677_PWR_DSP_CPU);
 
-		rt5677_set_dsp_mode(rt5677, false);
+			rt5677_set_dsp_mode(rt5677, false);
 
-		/* Disable and clear VAD interrupt */
-		regmap_write(rt5677->regmap, RT5677_VAD_CTRL1, 0x2184);
+			/* Disable and clear VAD interrupt */
+			regmap_write(rt5677->regmap, RT5677_VAD_CTRL1, 0x2184);
 
-		/* Set GPIO1 pin back to be IRQ output for jack detect */
-		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
-			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
-
-		mutex_unlock(&rt5677->irq_lock);
+			/* Set GPIO1 pin back to be IRQ output for jack detect */
+			regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
+					   RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
+		}
 	}
 }
 
@@ -4997,11 +4991,11 @@ static int rt5677_read(void *context, unsigned int reg, unsigned int *val)
 
 	if (rt5677->is_dsp_mode) {
 		if (reg > 0xff) {
-			mutex_lock(&rt5677->dsp_pri_lock);
-			rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
-				reg & 0xff);
-			rt5677_dsp_mode_i2c_read(rt5677, RT5677_PRIV_DATA, val);
-			mutex_unlock(&rt5677->dsp_pri_lock);
+			scoped_guard(mutex, &rt5677->dsp_pri_lock) {
+				rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
+							  reg & 0xff);
+				rt5677_dsp_mode_i2c_read(rt5677, RT5677_PRIV_DATA, val);
+			}
 		} else {
 			rt5677_dsp_mode_i2c_read(rt5677, reg, val);
 		}
@@ -5019,12 +5013,12 @@ static int rt5677_write(void *context, unsigned int reg, unsigned int val)
 
 	if (rt5677->is_dsp_mode) {
 		if (reg > 0xff) {
-			mutex_lock(&rt5677->dsp_pri_lock);
-			rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
-				reg & 0xff);
-			rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_DATA,
-				val);
-			mutex_unlock(&rt5677->dsp_pri_lock);
+			scoped_guard(mutex, &rt5677->dsp_pri_lock) {
+				rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_INDEX,
+							  reg & 0xff);
+				rt5677_dsp_mode_i2c_write(rt5677, RT5677_PRIV_DATA,
+							  val);
+			}
 		} else {
 			rt5677_dsp_mode_i2c_write(rt5677, reg, val);
 		}
@@ -5416,7 +5410,7 @@ static void rt5677_resume_irq_check(struct work_struct *work)
 	 * Without this explicit check, unplug the headset right after suspend
 	 * starts, then after resume the headset is still shown as plugged in.
 	 */
-	mutex_lock(&rt5677->irq_lock);
+	guard(mutex)(&rt5677->irq_lock);
 	for (i = 0; i < RT5677_IRQ_NUM; i++) {
 		if (rt5677->irq_en & rt5677_irq_descs[i].enable_mask) {
 			virq = irq_find_mapping(rt5677->domain, i);
@@ -5424,7 +5418,6 @@ static void rt5677_resume_irq_check(struct work_struct *work)
 				handle_nested_irq(virq);
 		}
 	}
-	mutex_unlock(&rt5677->irq_lock);
 }
 
 static void rt5677_irq_bus_lock(struct irq_data *data)
-- 
2.43.0


