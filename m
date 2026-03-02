Return-Path: <linux-arm-msm+bounces-94774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E7oNfPZpGlhuAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 01:29:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D71D21D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 01:29:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B815302DA01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 00:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 021741E1A3B;
	Mon,  2 Mar 2026 00:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZFEgcByT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01A01D7E41;
	Mon,  2 Mar 2026 00:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772411286; cv=none; b=kyuAKAZAhEBVlhf7vaI39AGsPvajPs5pdGLu6qMJ0Z8qcYEPi/NGxAorfeymf7t2qeIFdD7OeRZos6p3QyO4d+pwHVDhgxoMnRHX+LSlIGjKlVeFty7IlnVQT8Gkv04oyb3UDoViSKh+jul9ulADFmDw81sa6Uq+ckqLoLK89/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772411286; c=relaxed/simple;
	bh=zlvrhlx/EjA3BdLSQUT+ZWXnRIIRH4KVYqPd4X0vsCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqiKd5SO6Rn2tI4YVV3uSgDre2XzftK4sb9Trhpt/c1vZqxA/S9PLxIdbVJ7BntYxWlnL1hCYXXiOfC2PTlsY4zLe61AEd+TG2QM81R4JkTWMsHURIUd9eNSFHTnSIv6CFLMEBoPcSMUd8jysUG+hSM5YFVhfbh2y7M3uoOxWwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZFEgcByT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15E3CC116C6;
	Mon,  2 Mar 2026 00:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772411286;
	bh=zlvrhlx/EjA3BdLSQUT+ZWXnRIIRH4KVYqPd4X0vsCI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZFEgcByTE5ORBprx0RnqWmbUmE5Sq5+MHOwJzPBz7Q4NNvqYbz+W4JPtNZnbQH4ff
	 y+P39Bfu/x9/SnWVaQUNVuWO29/TDeG9qzFNckwUQqqCeN2N2Kz0NOyJLqUJUSp0aI
	 5h9JxFlptDo28MKx0QAZA3H5l78O8LzK2opCov5ROHdthHEAYHdBYFQES1BaMEpo4c
	 fx2Dqj4NN6xUr5dopk9Ah9f0ppyo0nBaiDkQs5vygcco4us2af2tsMYAgKm84MxSQi
	 1yrSNMpmUr8rNmu67y96R04G2OnoMzYNlTjNVCLHuh+QojXm1bf62tMhjh+Vlp9I5U
	 pDVuLZgnwg8Jg==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	hanguidong02@gmail.com,
	ysato@users.sourceforge.jp,
	dalias@libc.org,
	glaubitz@physik.fu-berlin.de,
	abelvesa@kernel.org,
	srini@kernel.org,
	s.nawrocki@samsung.com,
	nuno.sa@analog.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sh@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 3/3] driver core: platform: use generic driver_override infrastructure
Date: Mon,  2 Mar 2026 01:25:58 +0100
Message-ID: <20260302002729.19438-4-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302002729.19438-1-dakr@kernel.org>
References: <20260302002729.19438-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94774-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com,users.sourceforge.jp,libc.org,physik.fu-berlin.de,samsung.com,analog.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dakr@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 808D71D21D0
X-Rspamd-Action: no action

When a driver is probed through __driver_attach(), the bus' match()
callback is called without the device lock held, thus accessing the
driver_override field without a lock, which can cause a UAF.

Fix this by using the driver-core driver_override infrastructure taking
care of proper locking internally.

Note that calling match() from __driver_attach() without the device lock
held is intentional. [1]

Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [1]
Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220789
Fixes: 3d713e0e382e ("driver core: platform: add device binding path 'driver_override'")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 arch/sh/drivers/platform_early.c |  6 ++++--
 drivers/base/platform.c          | 35 +++++---------------------------
 drivers/bus/simple-pm-bus.c      |  4 ++--
 drivers/clk/imx/clk-scu.c        |  3 +--
 drivers/slimbus/qcom-ngd-ctrl.c  |  6 ++----
 include/linux/platform_device.h  |  5 -----
 sound/soc/samsung/i2s.c          |  6 +++---
 7 files changed, 17 insertions(+), 48 deletions(-)

diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_early.c
index 143747c45206..3cd17bb0be67 100644
--- a/arch/sh/drivers/platform_early.c
+++ b/arch/sh/drivers/platform_early.c
@@ -25,10 +25,12 @@ static int platform_match(struct device *dev, struct device_driver *drv)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct platform_driver *pdrv = to_platform_driver(drv);
+	int ret;
 
 	/* When driver_override is set, only bind to the matching driver */
-	if (pdev->driver_override)
-		return !strcmp(pdev->driver_override, drv->name);
+	ret = device_match_driver_override(dev, drv);
+	if (ret >= 0)
+		return ret;
 
 	/* Then try to match against the id table */
 	if (pdrv->id_table)
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index b45d41b018ca..22ae87921a7a 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -603,7 +603,6 @@ static void platform_device_release(struct device *dev)
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
 	kfree(pa->pdev.resource);
-	kfree(pa->pdev.driver_override);
 	kfree(pa);
 }
 
@@ -1306,33 +1305,7 @@ static ssize_t numa_node_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(numa_node);
 
-static ssize_t driver_override_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	ssize_t len;
-
-	device_lock(dev);
-	len = sysfs_emit(buf, "%s\n", pdev->driver_override);
-	device_unlock(dev);
-
-	return len;
-}
-
-static ssize_t driver_override_store(struct device *dev,
-				     struct device_attribute *attr,
-				     const char *buf, size_t count)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	int ret;
-
-	ret = driver_set_override(dev, &pdev->driver_override, buf, count);
-	if (ret)
-		return ret;
-
-	return count;
-}
-static DEVICE_ATTR_RW(driver_override);
+DEVICE_ATTR_DRIVER_OVERRIDE();
 
 static struct attribute *platform_dev_attrs[] = {
 	&dev_attr_modalias.attr,
@@ -1377,10 +1350,12 @@ static int platform_match(struct device *dev, const struct device_driver *drv)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct platform_driver *pdrv = to_platform_driver(drv);
+	int ret;
 
 	/* When driver_override is set, only bind to the matching driver */
-	if (pdev->driver_override)
-		return !strcmp(pdev->driver_override, drv->name);
+	ret = device_match_driver_override(dev, drv);
+	if (ret >= 0)
+		return ret;
 
 	/* Attempt an OF style match first */
 	if (of_driver_match_device(dev, drv))
diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 3f00d953fb9a..c920bd6fbaaf 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -36,7 +36,7 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
 	 * that's not listed in simple_pm_bus_of_match. We don't want to do any
 	 * of the simple-pm-bus tasks for these devices, so return early.
 	 */
-	if (pdev->driver_override)
+	if (device_has_driver_override(&pdev->dev))
 		return 0;
 
 	match = of_match_device(dev->driver->of_match_table, dev);
@@ -78,7 +78,7 @@ static void simple_pm_bus_remove(struct platform_device *pdev)
 {
 	const void *data = of_device_get_match_data(&pdev->dev);
 
-	if (pdev->driver_override || data)
+	if (device_has_driver_override(&pdev->dev) || data)
 		return;
 
 	dev_dbg(&pdev->dev, "%s\n", __func__);
diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
index a85ec48a798b..9b33df9967ec 100644
--- a/drivers/clk/imx/clk-scu.c
+++ b/drivers/clk/imx/clk-scu.c
@@ -706,8 +706,7 @@ struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
 	if (ret)
 		goto put_device;
 
-	ret = driver_set_override(&pdev->dev, &pdev->driver_override,
-				  "imx-scu-clk", strlen("imx-scu-clk"));
+	ret = device_set_driver_override(&pdev->dev, "imx-scu-clk");
 	if (ret)
 		goto put_device;
 
diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 9aa7218b4e8d..1ed6be6e85d2 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1535,10 +1535,8 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 		ngd->id = id;
 		ngd->pdev->dev.parent = parent;
 
-		ret = driver_set_override(&ngd->pdev->dev,
-					  &ngd->pdev->driver_override,
-					  QCOM_SLIM_NGD_DRV_NAME,
-					  strlen(QCOM_SLIM_NGD_DRV_NAME));
+		ret = device_set_driver_override(&ngd->pdev->dev,
+						 QCOM_SLIM_NGD_DRV_NAME);
 		if (ret) {
 			platform_device_put(ngd->pdev);
 			kfree(ngd);
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 813da101b5bf..ed1d50d1c3c1 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -31,11 +31,6 @@ struct platform_device {
 	struct resource	*resource;
 
 	const struct platform_device_id	*id_entry;
-	/*
-	 * Driver name to force a match.  Do not set directly, because core
-	 * frees it.  Use driver_set_override() to set or clear it.
-	 */
-	const char *driver_override;
 
 	/* MFD cell pointer */
 	struct mfd_cell *mfd_cell;
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index e9964f0e010a..140907a41a70 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1360,10 +1360,10 @@ static int i2s_create_secondary_device(struct samsung_i2s_priv *priv)
 	if (!pdev_sec)
 		return -ENOMEM;
 
-	pdev_sec->driver_override = kstrdup("samsung-i2s", GFP_KERNEL);
-	if (!pdev_sec->driver_override) {
+	ret = device_set_driver_override(&pdev_sec->dev, "samsung-i2s");
+	if (ret) {
 		platform_device_put(pdev_sec);
-		return -ENOMEM;
+		return ret;
 	}
 
 	ret = platform_device_add(pdev_sec);
-- 
2.53.0


