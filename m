Return-Path: <linux-arm-msm+bounces-81958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 60144C60F9E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 04:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id A20EB241EB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 03:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E81620458A;
	Sun, 16 Nov 2025 03:38:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A03817C211;
	Sun, 16 Nov 2025 03:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763264280; cv=none; b=SAO2yMAR+F555LHhNVshHx2gPuYoy78lQ0PLoWUotcTDf5fw//tc690US/LL/7VgtNfGpLORqsYToqpCslY/+QP5cxGOhbiNUeFBseXmQGu94jR1fZyUL1MWiafpFgBLU6WH6Fzu1hUZiQO7G/ksA9Hji6a+EnnxxvVzMxUmpWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763264280; c=relaxed/simple;
	bh=5TlFauKgyuZQTEVmaKa7SFRUz88wvUoi8MN+xGek9/c=;
	h=From:To:Cc:Subject:Date:Message-Id; b=uov6fh721Hfe8ozj2pvgiaBFubscrR6hYFOIpoKH2zMJVfVIbDP+s+Ii8p64yx+oxxHPn3yoK7+YPCV3HhuVxovL8pwqGZIATbSyLOjHM9lz1suzspojS9B16L3xZBWSETGsbhzJeHALA4Ga38OzFWNDsP1FEnx6i9VitRpZrJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-05 (Coremail) with SMTP id zQCowAAH_l7uRhlpbmjqAA--.17336S2;
	Sun, 16 Nov 2025 11:37:27 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: srini@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alexey.klimov@linaro.org
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: codecs: Fix error handling in pm4125 audio codec driver
Date: Sun, 16 Nov 2025 11:37:16 +0800
Message-Id: <20251116033716.29369-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:zQCowAAH_l7uRhlpbmjqAA--.17336S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFWxKFWkKrWDCw1fXF43Wrg_yoW5Wr18pa
	98Ca95KrWjqF17C393WrWDAay3Jw1IyF1fAr47Kw1xKr13tryFgFy0yryava48CFWkAFWD
	JasrX34kGryjyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
	FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
	0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8v
	x2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4
	vE14v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnYFA
	DUUUU
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

pm4125_bind() acquires references through pm4125_sdw_device_get() but
fails to release them in error paths and during normal unbind
operations. This could result in reference count leaks, preventing
proper cleanup and potentially causing resource exhaustion over
multiple bind/unbind cycles.

Calling path: pm4125_sdw_device_get() -> bus_find_device_by_of_node()
-> bus_find_device() -> get_device.

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 8ad529484937 ("ASoC: codecs: add new pm4125 audio codec driver")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 sound/soc/codecs/pm4125.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/pm4125.c b/sound/soc/codecs/pm4125.c
index 706fc668ffe2..f9bcae6d1d79 100644
--- a/sound/soc/codecs/pm4125.c
+++ b/sound/soc/codecs/pm4125.c
@@ -1551,6 +1551,10 @@ static int pm4125_bind(struct device *dev)
 	struct device_link *devlink;
 	int ret;
 
+	/* Initialize device pointers to NULL for safe cleanup */
+	pm4125->rxdev = NULL;
+	pm4125->txdev = NULL;
+
 	/* Give the soundwire subdevices some more time to settle */
 	usleep_range(15000, 15010);
 
@@ -1574,7 +1578,7 @@ static int pm4125_bind(struct device *dev)
 	if (!pm4125->txdev) {
 		dev_err(dev, "could not find txslave with matching of node\n");
 		ret = -EINVAL;
-		goto error_unbind_all;
+		goto error_put_rx;
 	}
 
 	pm4125->sdw_priv[AIF1_CAP] = dev_get_drvdata(pm4125->txdev);
@@ -1584,7 +1588,7 @@ static int pm4125_bind(struct device *dev)
 	if (!pm4125->tx_sdw_dev) {
 		dev_err(dev, "could not get txslave with matching of dev\n");
 		ret = -EINVAL;
-		goto error_unbind_all;
+		goto error_put_tx;
 	}
 
 	/*
@@ -1596,7 +1600,7 @@ static int pm4125_bind(struct device *dev)
 	if (!devlink) {
 		dev_err(dev, "Could not devlink TX and RX\n");
 		ret = -EINVAL;
-		goto error_unbind_all;
+		goto error_put_tx;
 	}
 
 	devlink = device_link_add(dev, pm4125->txdev,
@@ -1650,6 +1654,10 @@ static int pm4125_bind(struct device *dev)
 	device_link_remove(dev, pm4125->txdev);
 link_remove_rx_tx:
 	device_link_remove(pm4125->rxdev, pm4125->txdev);
+error_put_tx:
+	put_device(pm4125->txdev);
+error_put_rx:
+	put_device(pm4125->rxdev);
 error_unbind_all:
 	component_unbind_all(dev, pm4125);
 	return ret;
@@ -1663,6 +1671,13 @@ static void pm4125_unbind(struct device *dev)
 	device_link_remove(dev, pm4125->txdev);
 	device_link_remove(dev, pm4125->rxdev);
 	device_link_remove(pm4125->rxdev, pm4125->txdev);
+
+	/* Release device references acquired in bind */
+	if (pm4125->txdev)
+		put_device(pm4125->txdev);
+	if (pm4125->rxdev)
+		put_device(pm4125->rxdev);
+
 	component_unbind_all(dev, pm4125);
 }
 
-- 
2.17.1


