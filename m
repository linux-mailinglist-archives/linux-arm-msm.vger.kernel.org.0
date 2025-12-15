Return-Path: <linux-arm-msm+bounces-85266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E907CBF4A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 18:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30E5330038E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 17:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEDF316182;
	Mon, 15 Dec 2025 17:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CAyJC5Ek"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEE131ED91
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 17:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765820988; cv=none; b=bryb3TBATDLrmSh1sutu66Os29LPcXjcqiKSWHvI9Mog7WhPEoyARIKWdaWbGCcRgBA6HCHs62bbTLzHeJJgJC02PyFVfO3gecuTXl1xA4JxR+FREIlC3Ryr0+8u0mlhpcK4qJUqz4dGK2s4vUUJoNqUM0ITSHpnlZfAZZMLZ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765820988; c=relaxed/simple;
	bh=Ug7z6hNXgyhetekE6C8cgQu3wJuNMkvuK/vyVoJ56uc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VCDCY3ZrvilwfxJjLkwg+TncljnJB3lkzd4zqnKHn7UzX3genBuunpqrJSUFNZRNfkyXwKoKvIk15Tel4de8eh4m4yBLZMgvC+W6eBiafEpAIgeQO8LwV9IlZZbgWGLM9WgQ7dq/WtVMowIT1piCC/KXT7J4bDbCuwFncG+WFEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CAyJC5Ek; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so797176866b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 09:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765820984; x=1766425784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2YU313m3BNCaKIyQOcKAwuqwt5SA77bY4YL6Y9S40NY=;
        b=CAyJC5EkW+d4VGn7+VqF1+tnFmMKmD5xXKPRxLYZsiE0oTqEXzgPIsNWDqZhX2o5p3
         CbZe/peQupJE1vtTNUhmOzjuCRS5L4rzcgBnXFBEbVHzehQODzLYG9nTDxZorw7+NwrX
         Ea2i10Gv78UUmhTvHa+fcAEfbEitAdICItiFAYFQI0jer1dEHQpiVw+4FQdNYFZFDaCC
         GDYSeqwEkO/e5awt1SGhvPaSyyimXGeu+RCJjV91/UWYOc+qmjh3zCEfcQAL+j1hdpDC
         d8YvKGoXIYC6q243J6nwsk8hA8+ZLF13Rzc12IVEcNbc2AFEJro5qa5m/yOm8tobVkLz
         8ZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765820984; x=1766425784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2YU313m3BNCaKIyQOcKAwuqwt5SA77bY4YL6Y9S40NY=;
        b=I3gxxhEe3stH7M+f8yqek+c0EnRSwbFp4F1Smyp8Ce0YWOOUX+a/vGhd5pDjTYMEe8
         b3UCQ/FstuwlbQsDjd7pbDJVag8JjkmvxdkFwB8eSviYe5ctzUEizdkjM/gRJFyPeuc4
         vcFidggSXmj0YuiQ+7GzqmeOkHtpD2M80lEjD4kaPajavQuYAQGP4ZNkt7YxuNzp6+EN
         jCcSgAMaPhC1CtqFzUbweSHYhXG0KNn947/EOKMCLFSFVB8izwI19qVL7ZYKmz+jKoWV
         QyQ0utovVUivXo0UV8A/fZHpIKswRrDH8EOHjQ0uxa+WxE406/I8xrQ/L/Ki7TfWlQms
         F0Qg==
X-Forwarded-Encrypted: i=1; AJvYcCU2yEF2WzM4PZOYAMhLRN2G5tvECYyM+24aGrtHXkzcY7qAoyXy6ZXLitqXBzDFTMUKDWzrArgMcTP+ywvs@vger.kernel.org
X-Gm-Message-State: AOJu0YyAWmfLn0RNCEKYIReoc7BQz4ogZsayawGJw0Ht1FIhZumWEh0U
	+RxO7jQRjTX6zXVHRVi1rZNBSBL5xPUUmQUnsxr2ccE3wajGb/Wr2wkJ8hFKR6P0FGg=
X-Gm-Gg: AY/fxX77Ra54sAbKAPcZZfP3A99ZyGxOIu6kuwNC6H7o4r4+oCGzaba8ZGcLK3PknI2
	9IV49PElqhtGvpPmi5in/GOtW2YTPACKuWCfLg0I0Yt5Hv879SO48oPVVukRONenweyZ6uPYBP1
	00GeWNCyRPopjTsZ9R7DnULG09L8ZZsBkeNAnHvShLd32naocaGaB2FN/MIC6DiRT1JOdZnCIl8
	XhV7eV91I/9EmZBh4c1yIlobxSRn0JhKhx3gf51z1deN0BB36VxaXiZYoulbb7i0UJDY8fXkfsv
	vtdYWNWX+Xiinqz2rhIwEVs/M0sqATR4MheV0kbGbz+aZLnhiNDvhx5FF11Gacc+Cmi6Rm7z1NN
	X3MlSiIBgivk88CdvrS348vYt3m1c3bg2yNthiDNPORzDfGDWmyKY5aIEeChbWVUkB51czgrAYw
	RITilTWJlXF+p3HYMO/gDfqYm5rOQAZXeTQ/eovjmC6EzrjlrhSpKyY0PWPyj3dlLF4qmRs3JA8
	Dc=
X-Google-Smtp-Source: AGHT+IECC4hN+rfmDhT36oFOLr+fiHe8Khn0vwelE2hcLV8BQhWlPFkmUc9wqut2mwm+xxZ/2xl69g==
X-Received: by 2002:a17:907:2d8d:b0:b76:23b0:7d89 with SMTP id a640c23a62f3a-b7d236265abmr1169169766b.14.1765820984029;
        Mon, 15 Dec 2025 09:49:44 -0800 (PST)
Received: from localhost (p200300f65f006608e858c1c813bae2c0.dip0.t-ipconnect.de. [2003:f6:5f00:6608:e858:c1c8:13ba:e2c0])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7cfa5d0b02sm1453264766b.63.2025.12.15.09.49.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 09:49:43 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Oder Chiou <oder_chiou@realtek.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 1/2] soundwire: Make remove function return no value
Date: Mon, 15 Dec 2025 18:49:25 +0100
Message-ID: <20251215174925.1327021-5-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215174925.1327021-4-u.kleine-koenig@baylibre.com>
References: <20251215174925.1327021-4-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=18059; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Ug7z6hNXgyhetekE6C8cgQu3wJuNMkvuK/vyVoJ56uc=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQEoqQCaZ+67skDsMq3NOL0rihiwcrbtc+Qozf 2jbvIkN7uuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUBKKgAKCRCPgPtYfRL+ TtAAB/wLZKWRGVO1PnyaaQls2qsrgU57mKdDxoUPJbbQXAn+LUREji4WkUElDvdCJGiuTZHbsTm FDTfoeZbrXDEGbF7znGZEoNxKWb2VEhTfoWICitoBBKfh6+1+LF7deiOYsnds5DU8jO24cL7cAG WoBUHA9ZHfEp6eEb3Gzx2y5D+BsOxLJK7DmaJGoDr8mLwPOhlAp+SAV2YtIpJkDbOuB+Vq5/Mx+ UbxwmH7ggUi/WiEB8f9urNoODd17a1OA2Q3nTI4T4iIgBgHbeIitdcspoet+Bw7+e7V/yhKdvm3 FJaZGQ+Hx0oJfDW6PHU8Op+s9F+OPtr0dvlkxJCb7JIg/fM7
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

All remove functions return zero and the driver core ignores any other
returned value (just emits a warning about it being ignored). So make all
remove callbacks return void instead of an ignored int. This is in line
with most other subsystems.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/soundwire/bus_type.c       | 5 ++---
 include/linux/soundwire/sdw.h      | 2 +-
 sound/soc/codecs/cs35l56-sdw.c     | 4 +---
 sound/soc/codecs/cs42l42-sdw.c     | 4 +---
 sound/soc/codecs/max98373-sdw.c    | 4 +---
 sound/soc/codecs/pm4125-sdw.c      | 4 +---
 sound/soc/codecs/rt1017-sdca-sdw.c | 4 +---
 sound/soc/codecs/rt1308-sdw.c      | 4 +---
 sound/soc/codecs/rt1316-sdw.c      | 4 +---
 sound/soc/codecs/rt1318-sdw.c      | 4 +---
 sound/soc/codecs/rt1320-sdw.c      | 4 +---
 sound/soc/codecs/rt5682-sdw.c      | 4 +---
 sound/soc/codecs/rt700-sdw.c       | 4 +---
 sound/soc/codecs/rt711-sdca-sdw.c  | 4 +---
 sound/soc/codecs/rt711-sdw.c       | 4 +---
 sound/soc/codecs/rt712-sdca-dmic.c | 4 +---
 sound/soc/codecs/rt712-sdca-sdw.c  | 4 +---
 sound/soc/codecs/rt715-sdca-sdw.c  | 4 +---
 sound/soc/codecs/rt715-sdw.c       | 4 +---
 sound/soc/codecs/rt721-sdca-sdw.c  | 4 +---
 sound/soc/codecs/rt722-sdca-sdw.c  | 4 +---
 sound/soc/codecs/tas2783-sdw.c     | 4 +---
 sound/soc/codecs/wcd937x-sdw.c     | 4 +---
 sound/soc/codecs/wcd938x-sdw.c     | 4 +---
 sound/soc/codecs/wcd939x-sdw.c     | 4 +---
 25 files changed, 26 insertions(+), 73 deletions(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 91e70cb46fb5..c40de98f1485 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -168,7 +168,6 @@ static int sdw_drv_remove(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct sdw_driver *drv = drv_to_sdw_driver(dev->driver);
-	int ret = 0;
 
 	mutex_lock(&slave->sdw_dev_lock);
 
@@ -177,11 +176,11 @@ static int sdw_drv_remove(struct device *dev)
 	mutex_unlock(&slave->sdw_dev_lock);
 
 	if (drv->remove)
-		ret = drv->remove(slave);
+		drv->remove(slave);
 
 	ida_free(&slave->bus->slave_ida, slave->index);
 
-	return ret;
+	return 0;
 }
 
 static void sdw_drv_shutdown(struct device *dev)
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index e6a3476bcef1..f462717acf20 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -705,7 +705,7 @@ struct sdw_master_device {
 
 struct sdw_driver {
 	int (*probe)(struct sdw_slave *sdw, const struct sdw_device_id *id);
-	int (*remove)(struct sdw_slave *sdw);
+	void (*remove)(struct sdw_slave *sdw);
 	void (*shutdown)(struct sdw_slave *sdw);
 
 	const struct sdw_device_id *id_table;
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 42d24ac2977f..30b3192d6ce9 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -554,7 +554,7 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 	return 0;
 }
 
-static int cs35l56_sdw_remove(struct sdw_slave *peripheral)
+static void cs35l56_sdw_remove(struct sdw_slave *peripheral)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
 
@@ -566,8 +566,6 @@ static int cs35l56_sdw_remove(struct sdw_slave *peripheral)
 	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
 
 	cs35l56_remove(cs35l56);
-
-	return 0;
 }
 
 static const struct dev_pm_ops cs35l56_sdw_pm = {
diff --git a/sound/soc/codecs/cs42l42-sdw.c b/sound/soc/codecs/cs42l42-sdw.c
index f837c7eff10b..d5999ad9ff9b 100644
--- a/sound/soc/codecs/cs42l42-sdw.c
+++ b/sound/soc/codecs/cs42l42-sdw.c
@@ -585,14 +585,12 @@ static int cs42l42_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 	return 0;
 }
 
-static int cs42l42_sdw_remove(struct sdw_slave *peripheral)
+static void cs42l42_sdw_remove(struct sdw_slave *peripheral)
 {
 	struct cs42l42_private *cs42l42 = dev_get_drvdata(&peripheral->dev);
 
 	cs42l42_common_remove(cs42l42);
 	pm_runtime_disable(cs42l42->dev);
-
-	return 0;
 }
 
 static const struct dev_pm_ops cs42l42_sdw_pm = {
diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index 88ff215f52b3..16673440218c 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -839,11 +839,9 @@ static int max98373_sdw_probe(struct sdw_slave *slave,
 	return max98373_init(slave, regmap);
 }
 
-static int max98373_sdw_remove(struct sdw_slave *slave)
+static void max98373_sdw_remove(struct sdw_slave *slave)
 {
 	pm_runtime_disable(&slave->dev);
-
-	return 0;
 }
 
 #if defined(CONFIG_OF)
diff --git a/sound/soc/codecs/pm4125-sdw.c b/sound/soc/codecs/pm4125-sdw.c
index 3167b38e2876..1c612ae4a4b2 100644
--- a/sound/soc/codecs/pm4125-sdw.c
+++ b/sound/soc/codecs/pm4125-sdw.c
@@ -436,13 +436,11 @@ static int pm4125_probe(struct sdw_slave *pdev, const struct sdw_device_id *id)
 	return 0;
 }
 
-static int pm4125_remove(struct sdw_slave *pdev)
+static void pm4125_remove(struct sdw_slave *pdev)
 {
 	struct device *dev = &pdev->dev;
 
 	component_del(dev, &wcd_sdw_component_ops);
-
-	return 0;
 }
 
 static const struct sdw_device_id pm4125_slave_id[] = {
diff --git a/sound/soc/codecs/rt1017-sdca-sdw.c b/sound/soc/codecs/rt1017-sdca-sdw.c
index a9c000876be8..148b36173a25 100644
--- a/sound/soc/codecs/rt1017-sdca-sdw.c
+++ b/sound/soc/codecs/rt1017-sdca-sdw.c
@@ -741,14 +741,12 @@ static int rt1017_sdca_sdw_probe(struct sdw_slave *slave,
 	return rt1017_sdca_init(&slave->dev, regmap, slave);
 }
 
-static int rt1017_sdca_sdw_remove(struct sdw_slave *slave)
+static void rt1017_sdca_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt1017_sdca_priv *rt1017 = dev_get_drvdata(&slave->dev);
 
 	if (rt1017->first_hw_init)
 		pm_runtime_disable(&slave->dev);
-
-	return 0;
 }
 
 static const struct sdw_device_id rt1017_sdca_id[] = {
diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index b6c224832a43..e077d096bc23 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -739,11 +739,9 @@ static int rt1308_sdw_probe(struct sdw_slave *slave,
 	return rt1308_sdw_init(&slave->dev, regmap, slave);
 }
 
-static int rt1308_sdw_remove(struct sdw_slave *slave)
+static void rt1308_sdw_remove(struct sdw_slave *slave)
 {
 	pm_runtime_disable(&slave->dev);
-
-	return 0;
 }
 
 static const struct sdw_device_id rt1308_id[] = {
diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 01a977398864..20fc1579eb9c 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -716,11 +716,9 @@ static int rt1316_sdw_probe(struct sdw_slave *slave,
 	return rt1316_sdw_init(&slave->dev, regmap, slave);
 }
 
-static int rt1316_sdw_remove(struct sdw_slave *slave)
+static void rt1316_sdw_remove(struct sdw_slave *slave)
 {
 	pm_runtime_disable(&slave->dev);
-
-	return 0;
 }
 
 static const struct sdw_device_id rt1316_id[] = {
diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index 70db5450d6d2..d28f1afe68f1 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -793,11 +793,9 @@ static int rt1318_sdw_probe(struct sdw_slave *slave,
 	return rt1318_sdw_init(&slave->dev, regmap, slave);
 }
 
-static int rt1318_sdw_remove(struct sdw_slave *slave)
+static void rt1318_sdw_remove(struct sdw_slave *slave)
 {
 	pm_runtime_disable(&slave->dev);
-
-	return 0;
 }
 
 static const struct sdw_device_id rt1318_id[] = {
diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index e3f9b03df3aa..d03e8dbd0cda 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1740,11 +1740,9 @@ static int rt1320_sdw_probe(struct sdw_slave *slave,
 	return rt1320_sdw_init(&slave->dev, regmap, mbq_regmap, slave);
 }
 
-static int rt1320_sdw_remove(struct sdw_slave *slave)
+static void rt1320_sdw_remove(struct sdw_slave *slave)
 {
 	pm_runtime_disable(&slave->dev);
-
-	return 0;
 }
 
 /*
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 055bea0a4a3b..fc464538ceff 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -690,7 +690,7 @@ static int rt5682_sdw_probe(struct sdw_slave *slave,
 	return rt5682_sdw_init(&slave->dev, regmap, slave);
 }
 
-static int rt5682_sdw_remove(struct sdw_slave *slave)
+static void rt5682_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt5682_priv *rt5682 = dev_get_drvdata(&slave->dev);
 
@@ -698,8 +698,6 @@ static int rt5682_sdw_remove(struct sdw_slave *slave)
 		cancel_delayed_work_sync(&rt5682->jack_detect_work);
 
 	pm_runtime_disable(&slave->dev);
-
-	return 0;
 }
 
 static const struct sdw_device_id rt5682_id[] = {
diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 44543c0da177..9ce36a66fae1 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -455,7 +455,7 @@ static int rt700_sdw_probe(struct sdw_slave *slave,
 	return rt700_init(&slave->dev, sdw_regmap, regmap, slave);
 }
 
-static int rt700_sdw_remove(struct sdw_slave *slave)
+static void rt700_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt700_priv *rt700 = dev_get_drvdata(&slave->dev);
 
@@ -465,8 +465,6 @@ static int rt700_sdw_remove(struct sdw_slave *slave)
 	}
 
 	pm_runtime_disable(&slave->dev);
-
-	return 0;
 }
 
 static const struct sdw_device_id rt700_id[] = {
diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 6eb05871db37..49dacceddf81 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -365,7 +365,7 @@ static int rt711_sdca_sdw_probe(struct sdw_slave *slave,
 	return rt711_sdca_init(&slave->dev, regmap, mbq_regmap, slave);
 }
 
-static int rt711_sdca_sdw_remove(struct sdw_slave *slave)
+static void rt711_sdca_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt711_sdca_priv *rt711 = dev_get_drvdata(&slave->dev);
 
@@ -378,8 +378,6 @@ static int rt711_sdca_sdw_remove(struct sdw_slave *slave)
 
 	mutex_destroy(&rt711->calibrate_mutex);
 	mutex_destroy(&rt711->disable_irq_lock);
-
-	return 0;
 }
 
 static const struct sdw_device_id rt711_sdca_id[] = {
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 93a5a89a96b1..72ddf4cebdf3 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -458,7 +458,7 @@ static int rt711_sdw_probe(struct sdw_slave *slave,
 	return rt711_init(&slave->dev, sdw_regmap, regmap, slave);
 }
 
-static int rt711_sdw_remove(struct sdw_slave *slave)
+static void rt711_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt711_priv *rt711 = dev_get_drvdata(&slave->dev);
 
@@ -472,8 +472,6 @@ static int rt711_sdw_remove(struct sdw_slave *slave)
 
 	mutex_destroy(&rt711->calibrate_mutex);
 	mutex_destroy(&rt711->disable_irq_lock);
-
-	return 0;
 }
 
 static const struct sdw_device_id rt711_id[] = {
diff --git a/sound/soc/codecs/rt712-sdca-dmic.c b/sound/soc/codecs/rt712-sdca-dmic.c
index 2928649e80e4..4d83544ef204 100644
--- a/sound/soc/codecs/rt712-sdca-dmic.c
+++ b/sound/soc/codecs/rt712-sdca-dmic.c
@@ -960,11 +960,9 @@ static int rt712_sdca_dmic_sdw_probe(struct sdw_slave *slave,
 	return rt712_sdca_dmic_init(&slave->dev, regmap, mbq_regmap, slave);
 }
 
-static int rt712_sdca_dmic_sdw_remove(struct sdw_slave *slave)
+static void rt712_sdca_dmic_sdw_remove(struct sdw_slave *slave)
 {
 	pm_runtime_disable(&slave->dev);
-
-	return 0;
 }
 
 static struct sdw_driver rt712_sdca_dmic_sdw_driver = {
diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index ea07131edfa2..8c82887174db 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -374,7 +374,7 @@ static int rt712_sdca_sdw_probe(struct sdw_slave *slave,
 	return rt712_sdca_init(&slave->dev, regmap, mbq_regmap, slave);
 }
 
-static int rt712_sdca_sdw_remove(struct sdw_slave *slave)
+static void rt712_sdca_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt712_sdca_priv *rt712 = dev_get_drvdata(&slave->dev);
 
@@ -387,8 +387,6 @@ static int rt712_sdca_sdw_remove(struct sdw_slave *slave)
 
 	mutex_destroy(&rt712->calibrate_mutex);
 	mutex_destroy(&rt712->disable_irq_lock);
-
-	return 0;
 }
 
 static const struct sdw_device_id rt712_sdca_id[] = {
diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index ce7d8955efc3..968bc183b8d8 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -191,11 +191,9 @@ static int rt715_sdca_sdw_probe(struct sdw_slave *slave,
 	return rt715_sdca_init(&slave->dev, mbq_regmap, regmap, slave);
 }
 
-static int rt715_sdca_sdw_remove(struct sdw_slave *slave)
+static void rt715_sdca_sdw_remove(struct sdw_slave *slave)
 {
 	pm_runtime_disable(&slave->dev);
-
-	return 0;
 }
 
 static const struct sdw_device_id rt715_sdca_id[] = {
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index a3df4bbedf86..49c91d015be4 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -471,11 +471,9 @@ static int rt715_sdw_probe(struct sdw_slave *slave,
 	return rt715_init(&slave->dev, sdw_regmap, regmap, slave);
 }
 
-static int rt715_sdw_remove(struct sdw_slave *slave)
+static void rt715_sdw_remove(struct sdw_slave *slave)
 {
 	pm_runtime_disable(&slave->dev);
-
-	return 0;
 }
 
 static const struct sdw_device_id rt715_id[] = {
diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 4d8a12b13015..6eb8512975b8 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -415,7 +415,7 @@ static int rt721_sdca_sdw_probe(struct sdw_slave *slave,
 	return rt721_sdca_init(&slave->dev, regmap, mbq_regmap, slave);
 }
 
-static int rt721_sdca_sdw_remove(struct sdw_slave *slave)
+static void rt721_sdca_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt721_sdca_priv *rt721 = dev_get_drvdata(&slave->dev);
 
@@ -429,8 +429,6 @@ static int rt721_sdca_sdw_remove(struct sdw_slave *slave)
 
 	mutex_destroy(&rt721->calibrate_mutex);
 	mutex_destroy(&rt721->disable_irq_lock);
-
-	return 0;
 }
 
 static const struct sdw_device_id rt721_sdca_id[] = {
diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index a0f5601a262a..0a5b3ffa90da 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -428,7 +428,7 @@ static int rt722_sdca_sdw_probe(struct sdw_slave *slave,
 	return rt722_sdca_init(&slave->dev, regmap, slave);
 }
 
-static int rt722_sdca_sdw_remove(struct sdw_slave *slave)
+static void rt722_sdca_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt722_sdca_priv *rt722 = dev_get_drvdata(&slave->dev);
 
@@ -442,8 +442,6 @@ static int rt722_sdca_sdw_remove(struct sdw_slave *slave)
 
 	mutex_destroy(&rt722->calibrate_mutex);
 	mutex_destroy(&rt722->disable_irq_lock);
-
-	return 0;
 }
 
 static const struct sdw_device_id rt722_sdca_id[] = {
diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index 43b779873b93..0b07981c3f2c 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -1310,7 +1310,7 @@ static s32 tas_sdw_probe(struct sdw_slave *peripheral,
 	return tas_init(tas_dev);
 }
 
-static s32 tas_sdw_remove(struct sdw_slave *peripheral)
+static void tas_sdw_remove(struct sdw_slave *peripheral)
 {
 	struct tas2783_prv *tas_dev = dev_get_drvdata(&peripheral->dev);
 
@@ -1319,8 +1319,6 @@ static s32 tas_sdw_remove(struct sdw_slave *peripheral)
 	mutex_destroy(&tas_dev->calib_lock);
 	mutex_destroy(&tas_dev->pde_lock);
 	dev_set_drvdata(&peripheral->dev, NULL);
-
-	return 0;
 }
 
 static const struct sdw_device_id tas_sdw_id[] = {
diff --git a/sound/soc/codecs/wcd937x-sdw.c b/sound/soc/codecs/wcd937x-sdw.c
index 1878d67e3fa1..7a18bed7f347 100644
--- a/sound/soc/codecs/wcd937x-sdw.c
+++ b/sound/soc/codecs/wcd937x-sdw.c
@@ -1056,13 +1056,11 @@ static int wcd9370_probe(struct sdw_slave *pdev,
 	return 0;
 }
 
-static int wcd9370_remove(struct sdw_slave *pdev)
+static void wcd9370_remove(struct sdw_slave *pdev)
 {
 	struct device *dev = &pdev->dev;
 
 	component_del(dev, &wcd_sdw_component_ops);
-
-	return 0;
 }
 
 static const struct sdw_device_id wcd9370_slave_id[] = {
diff --git a/sound/soc/codecs/wcd938x-sdw.c b/sound/soc/codecs/wcd938x-sdw.c
index 8c8f39d04972..0f0cc0ac3056 100644
--- a/sound/soc/codecs/wcd938x-sdw.c
+++ b/sound/soc/codecs/wcd938x-sdw.c
@@ -1217,13 +1217,11 @@ static int wcd9380_probe(struct sdw_slave *pdev,
 	return 0;
 }
 
-static int wcd9380_remove(struct sdw_slave *pdev)
+static void wcd9380_remove(struct sdw_slave *pdev)
 {
 	struct device *dev = &pdev->dev;
 
 	component_del(dev, &wcd_sdw_component_ops);
-
-	return 0;
 }
 
 static const struct sdw_device_id wcd9380_slave_id[] = {
diff --git a/sound/soc/codecs/wcd939x-sdw.c b/sound/soc/codecs/wcd939x-sdw.c
index da342a0c95a5..965c768e7995 100644
--- a/sound/soc/codecs/wcd939x-sdw.c
+++ b/sound/soc/codecs/wcd939x-sdw.c
@@ -1414,7 +1414,7 @@ static int wcd9390_probe(struct sdw_slave *pdev, const struct sdw_device_id *id)
 	return ret;
 }
 
-static int wcd9390_remove(struct sdw_slave *pdev)
+static void wcd9390_remove(struct sdw_slave *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct wcd939x_sdw_priv *wcd = dev_get_drvdata(dev);
@@ -1423,8 +1423,6 @@ static int wcd9390_remove(struct sdw_slave *pdev)
 
 	if (wcd->regmap)
 		regmap_exit(wcd->regmap);
-
-	return 0;
 }
 
 static const struct sdw_device_id wcd9390_slave_id[] = {
-- 
2.47.3


