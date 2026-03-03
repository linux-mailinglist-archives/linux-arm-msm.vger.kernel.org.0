Return-Path: <linux-arm-msm+bounces-95127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEQ3IIfPpmntWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:09:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5181EF10E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A85B1306981E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 11:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC659346795;
	Tue,  3 Mar 2026 11:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYdEyHSk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B890C33DEE0;
	Tue,  3 Mar 2026 11:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772539067; cv=none; b=I+jyviOZ3utaZ+XsRyS1AHHG4ibl09HvRt6hxjXo0eowxl91qW3gmuRtk8WxBfeVG+2RlAhWnB+kA1juAOg6bbtoQFv7N1EDjKLfjyCKtEkDMe9Lovw2VaXy/vh/Cymn4P8hZBttNe0Pe1+YDv894qvrfSfH0chk12iAAMcp47I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772539067; c=relaxed/simple;
	bh=gMiU4B7aXqUIwr1QMMO3H+NRPoBJrVaacNBNpA/ZYTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ag6cXEMPaSWcK8/+LIeszzCqybIt83y/SWhHn25XbTq8Nlfil8wLx8qKl2CKueKiRksQLO9IOZt7yln8WpAkFVi+FsE044tN3E0rkhdmYy80Ulu6icsAJ9c656+5xXVQIQMkWqXNxbr5V8QgJYRA6zOnIQJ93ol8Uewd1lkayoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYdEyHSk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F1C5C116C6;
	Tue,  3 Mar 2026 11:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772539067;
	bh=gMiU4B7aXqUIwr1QMMO3H+NRPoBJrVaacNBNpA/ZYTw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZYdEyHSkPk0Q+jTdZU0EFxuXND5MW1lXOobmRpuVKvoecoW1h8SuvPEp13UvRI1e+
	 42muQQmPujqgFsZEI+JjIZcieTQKhCPIBKqn7y/qeY/U3XUcIo8y33sb4I448Z31HE
	 KCmFRgwUWOpCxKJNX8z8SO0BlrQRYWA0kSj/EclyQkm/VcXF5GnZw337xCA1khtx0O
	 HB0R/1D16n0DZSsxIpFXqQzxYE4M0n/XDQvj0F+g3YxDO09O5aBi/bZVo4DMVctiE9
	 7cOkRdaxC7ABOF0Qf+pjiwypPWnF1kjhoGin3HansScyRnRh4ueaQGcWM6Z/l41IZw
	 ZLOYBQEyIBaHg==
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
Subject: [PATCH v2 4/4] driver core: platform: use generic driver_override infrastructure
Date: Tue,  3 Mar 2026 12:53:21 +0100
Message-ID: <20260303115720.48783-5-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303115720.48783-1-dakr@kernel.org>
References: <20260303115720.48783-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9F5181EF10E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95127-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
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
 drivers/base/platform.c          | 37 +++++---------------------------
 drivers/bus/simple-pm-bus.c      |  4 ++--
 drivers/clk/imx/clk-scu.c        |  3 +--
 drivers/slimbus/qcom-ngd-ctrl.c  |  6 ++----
 include/linux/platform_device.h  |  5 -----
 sound/soc/samsung/i2s.c          |  6 +++---
 7 files changed, 17 insertions(+), 50 deletions(-)

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
index b45d41b018ca..d44591d52e36 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -603,7 +603,6 @@ static void platform_device_release(struct device *dev)
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
 	kfree(pa->pdev.resource);
-	kfree(pa->pdev.driver_override);
 	kfree(pa);
 }
 
@@ -1306,38 +1305,9 @@ static ssize_t numa_node_show(struct device *dev,
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
-
 static struct attribute *platform_dev_attrs[] = {
 	&dev_attr_modalias.attr,
 	&dev_attr_numa_node.attr,
-	&dev_attr_driver_override.attr,
 	NULL,
 };
 
@@ -1377,10 +1347,12 @@ static int platform_match(struct device *dev, const struct device_driver *drv)
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
@@ -1516,6 +1488,7 @@ static const struct dev_pm_ops platform_dev_pm_ops = {
 const struct bus_type platform_bus_type = {
 	.name		= "platform",
 	.dev_groups	= platform_dev_groups,
+	.driver_override = true,
 	.match		= platform_match,
 	.uevent		= platform_uevent,
 	.probe		= platform_probe,
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


