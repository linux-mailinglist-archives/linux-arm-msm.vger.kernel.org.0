Return-Path: <linux-arm-msm+bounces-81959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A98BBC61097
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 07:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F2EC13627BA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 06:16:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E95421E087;
	Sun, 16 Nov 2025 06:16:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A68154425;
	Sun, 16 Nov 2025 06:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763273808; cv=none; b=hMwkJFero1durrMQEgW7sP6I/8SxvyYj1l2ATq1Bkfscsqa1xNKFtqQ+DR6mpM479MTouOc6lUCaAo2VelzVkWHPCoUSdNQjkbDykWh9gFXYWVX1wQkEDC62NsJ6k7a2PjnhELq8G0VqU3wImZeBBa7pj6EokegOL7UYgcwCaic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763273808; c=relaxed/simple;
	bh=TFVwht++e2GHt41kvufSh6XV336zccnWiMsrsnCJCcY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=EqNu8qVXlX8QNen+Vs8x6187zLsPr1seYDbgafu+j6MywOjQleMwqmkpM6GD8OZ32l95gzyLaajdE9gPSQ/xvtZH4FJUDmJkO/GymB2tsoesR7cjXCmoQe36GpcUopWMo1kQxe1oKPgkcmRqZD1gEuwxwRnR1XSO+wxb6bak2YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [202.112.113.212])
	by APP-03 (Coremail) with SMTP id rQCowAAXptg5bBlpkD_wAA--.21573S2;
	Sun, 16 Nov 2025 14:16:34 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: srini@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	dmitry.baryshkov@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: codecs: wcd937x: Fix error handling in wcd937x codec driver
Date: Sun, 16 Nov 2025 14:16:23 +0800
Message-Id: <20251116061623.11830-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID:rQCowAAXptg5bBlpkD_wAA--.21573S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCr17WF1UKr48XrWkJr13urg_yoWrAFWkpa
	yUCa90k3yUWryxCF93Gry8Jas8Gr40yFs3Xr47Kw17KwsxJrWjyryYvw1jv3Z3GF95WFnr
	CFy3Ja4kCF4UXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPY14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwV
	AFwVW8AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU3HUDU
	UUUU=
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

In wcd937x_bind(), the driver calls of_sdw_find_device_by_node() to
obtain references to RX and TX SoundWire devices, which increment the
device reference counts. However, the corresponding put_device() are
missing in both the error paths and the normal unbind path in
wcd937x_unbind().

Add proper error handling with put_device() calls in all error paths
of wcd937x_bind() and ensure devices are released in wcd937x_unbind().

Found by code review.

Cc: stable@vger.kernel.org
Fixes: 772ed12bd04e ("ASoC: codecs: wcdxxxx: use of_sdw_find_device_by_node helper")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 sound/soc/codecs/wcd937x.c | 43 ++++++++++++++++++++++++++++++--------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 421ec7a2d6bd..ed0ff45a8964 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2748,7 +2748,8 @@ static int wcd937x_bind(struct device *dev)
 	wcd937x->rxdev = of_sdw_find_device_by_node(wcd937x->rxnode);
 	if (!wcd937x->rxdev) {
 		dev_err(dev, "could not find slave with matching of node\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_component_unbind;
 	}
 
 	wcd937x->sdw_priv[AIF1_PB] = dev_get_drvdata(wcd937x->rxdev);
@@ -2757,7 +2758,8 @@ static int wcd937x_bind(struct device *dev)
 	wcd937x->txdev = of_sdw_find_device_by_node(wcd937x->txnode);
 	if (!wcd937x->txdev) {
 		dev_err(dev, "could not find txslave with matching of node\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_put_rxdev;
 	}
 
 	wcd937x->sdw_priv[AIF1_CAP] = dev_get_drvdata(wcd937x->txdev);
@@ -2765,7 +2767,8 @@ static int wcd937x_bind(struct device *dev)
 	wcd937x->tx_sdw_dev = dev_to_sdw_dev(wcd937x->txdev);
 	if (!wcd937x->tx_sdw_dev) {
 		dev_err(dev, "could not get txslave with matching of dev\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_put_txdev;
 	}
 
 	/*
@@ -2775,31 +2778,35 @@ static int wcd937x_bind(struct device *dev)
 	if (!device_link_add(wcd937x->rxdev, wcd937x->txdev,
 			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
 		dev_err(dev, "Could not devlink TX and RX\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_put_txdev;
 	}
 
 	if (!device_link_add(dev, wcd937x->txdev,
 			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
 		dev_err(dev, "Could not devlink WCD and TX\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_remove_link1;
 	}
 
 	if (!device_link_add(dev, wcd937x->rxdev,
 			     DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME)) {
 		dev_err(dev, "Could not devlink WCD and RX\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_remove_link2;
 	}
 
 	wcd937x->regmap = wcd937x->sdw_priv[AIF1_CAP]->regmap;
 	if (!wcd937x->regmap) {
 		dev_err(dev, "could not get TX device regmap\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto err_remove_link3;
 	}
 
 	ret = wcd937x_irq_init(wcd937x, dev);
 	if (ret) {
 		dev_err(dev, "IRQ init failed: %d\n", ret);
-		return ret;
+		goto err_remove_link3;
 	}
 
 	wcd937x->sdw_priv[AIF1_PB]->slave_irq = wcd937x->virq;
@@ -2809,10 +2816,26 @@ static int wcd937x_bind(struct device *dev)
 
 	ret = snd_soc_register_component(dev, &soc_codec_dev_wcd937x,
 					 wcd937x_dais, ARRAY_SIZE(wcd937x_dais));
-	if (ret)
+	if (ret) {
 		dev_err(dev, "Codec registration failed\n");
+		goto err_remove_link3;
+	}
 
 	return ret;
+
+err_remove_link3:
+	device_link_remove(dev, wcd937x->rxdev);
+err_remove_link2:
+	device_link_remove(dev, wcd937x->txdev);
+err_remove_link1:
+	device_link_remove(wcd937x->rxdev, wcd937x->txdev);
+err_put_txdev:
+	put_device(wcd937x->txdev);
+err_put_rxdev:
+	put_device(wcd937x->rxdev);
+err_component_unbind:
+	component_unbind_all(dev, wcd937x);
+	return ret;
 }
 
 static void wcd937x_unbind(struct device *dev)
@@ -2825,6 +2848,8 @@ static void wcd937x_unbind(struct device *dev)
 	device_link_remove(wcd937x->rxdev, wcd937x->txdev);
 	component_unbind_all(dev, wcd937x);
 	mutex_destroy(&wcd937x->micb_lock);
+	put_device(wcd937x->txdev);
+	put_device(wcd937x->rxdev);
 }
 
 static const struct component_master_ops wcd937x_comp_ops = {
-- 
2.17.1


