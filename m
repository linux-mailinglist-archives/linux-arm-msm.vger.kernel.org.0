Return-Path: <linux-arm-msm+bounces-94772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBTvMbTZpGmbuAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94772-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 01:28:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5311D2195
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 01:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 146CB301D059
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 00:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23551DE2B4;
	Mon,  2 Mar 2026 00:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C/YZJQ0m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB486183CC3;
	Mon,  2 Mar 2026 00:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772411278; cv=none; b=jownyKb4FWOslzpL+kqc+2/u/crEh3SabMza+xQwJ/wF1++uqfxHuba7cC9wi5rbF6p/WuiSFE8BZBTX0MoxMcN8qUjvbMgSpXEtirlUDrIM6ZAzhEAOadiTA2Rnadl1vQXVuvo5SrESft054P8Kek5WngNJJln2yYGUusSHezI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772411278; c=relaxed/simple;
	bh=A5yanP5RSMw/V1kPO6P8wRGbSTHC1RAwVLFh5EBAlDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ImY/bXf2NOHslW9HRuOU+YiGGJhlTheCfCmedhsyb4VCRr0L3lRoj3HqGHSpCfbjUr0MS3WS+ihMcgggpLfb7j8rut3MxUTzWFQSXN8BH6QCmZiEa72ZBmx+sWHaZeSrSroC0FxXqe3cik97F3pf+kV/LOCtioO919SiwjTEKzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C/YZJQ0m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE99CC19422;
	Mon,  2 Mar 2026 00:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772411278;
	bh=A5yanP5RSMw/V1kPO6P8wRGbSTHC1RAwVLFh5EBAlDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C/YZJQ0m3Bp6U5Tr0EMZzGKgUwg68nprG2ExAJAXTS776DqQ3Qb8U4c3JTCbZTxlC
	 3v9jW0zAf6e68uufzm7+v86LP0qlXh/BczOsgaISAMXvJdjcRdLLR6TYTWbdFVwfb1
	 dLhKVJ4vF27ndwrYLSON8ffm0Iz901b7aFmD+kEQINH8yROco+68oFEzSFnk608Ca/
	 SUnUm84a/iW3V//5ITN0noSTlEh7X0vbE6HTntHscnt+CjqRxxKgb+RQ3x+CIp2Gno
	 dxFSngkOMZ1h+TrYWzyPGSxzWvzbw4pmaYWtO69wygwEQR5Ion3R4cLXjGK7ZbWgqH
	 emKrp9zzpF6MQ==
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
Subject: [PATCH 1/3] driver core: generalize driver_override in struct device
Date: Mon,  2 Mar 2026 01:25:56 +0100
Message-ID: <20260302002729.19438-2-dakr@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94772-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6E5311D2195
X-Rspamd-Action: no action

Currently, there are 12 busses (including platform and PCI) that
duplicate the driver_override logic for their individual devices.

All of them seem to be prone to the bug described in [1].

While this could be solved for every bus individually using a separate
lock, solving this in the driver-core generically results in less (and
cleaner) changes overall.

Thus, move driver_override to struct device, provide corresponding
accessors for busses and handle locking with a separate lock internally.

In particular, add device_set_driver_override(),
device_has_driver_override(), device_match_driver_override() and a
helper, DEVICE_ATTR_DRIVER_OVERRIDE(), to declare the corresponding
sysfs store() and show() callbacks.

Until all busses have migrated, keep driver_set_override() in place.

Note that we can't use the device lock for the reasons described in [2].

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220789 [1]
Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel.org/ [2]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/core.c    |  2 ++
 drivers/base/dd.c      | 60 +++++++++++++++++++++++++++++++
 include/linux/device.h | 81 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 143 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 791f9e444df8..a8cb90577d10 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2566,6 +2566,7 @@ static void device_release(struct kobject *kobj)
 	else
 		WARN(1, KERN_ERR "Device '%s' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.\n",
 			dev_name(dev));
+	kfree(dev->driver_override.name);
 	kfree(p);
 }
 
@@ -3159,6 +3160,7 @@ void device_initialize(struct device *dev)
 	kobject_init(&dev->kobj, &device_ktype);
 	INIT_LIST_HEAD(&dev->dma_pools);
 	mutex_init(&dev->mutex);
+	spin_lock_init(&dev->driver_override.lock);
 	lockdep_set_novalidate_class(&dev->mutex);
 	spin_lock_init(&dev->devres_lock);
 	INIT_LIST_HEAD(&dev->devres_head);
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 0354f209529c..697e36e63cab 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -381,6 +381,66 @@ static void __exit deferred_probe_exit(void)
 }
 __exitcall(deferred_probe_exit);
 
+int __device_set_driver_override(struct device *dev, const char *s, size_t len)
+{
+	const char *new, *old;
+	char *cp;
+
+	if (!s)
+		return -EINVAL;
+
+	/*
+	 * The stored value will be used in sysfs show callback (sysfs_emit()),
+	 * which has a length limit of PAGE_SIZE and adds a trailing newline.
+	 * Thus we can store one character less to avoid truncation during sysfs
+	 * show.
+	 */
+	if (len >= (PAGE_SIZE - 1))
+		return -EINVAL;
+
+	/*
+	 * Compute the real length of the string in case userspace sends us a
+	 * bunch of \0 characters like python likes to do.
+	 */
+	len = strlen(s);
+
+	if (!len) {
+		/* Empty string passed - clear override */
+		spin_lock(&dev->driver_override.lock);
+		old = dev->driver_override.name;
+		dev->driver_override.name = NULL;
+		spin_unlock(&dev->driver_override.lock);
+		kfree(old);
+
+		return 0;
+	}
+
+	cp = strnchr(s, len, '\n');
+	if (cp)
+		len = cp - s;
+
+	new = kstrndup(s, len, GFP_KERNEL);
+	if (!new)
+		return -ENOMEM;
+
+	spin_lock(&dev->driver_override.lock);
+	old = dev->driver_override.name;
+	if (cp != s) {
+		dev->driver_override.name = new;
+		spin_unlock(&dev->driver_override.lock);
+	} else {
+		/* "\n" passed - clear override */
+		dev->driver_override.name = NULL;
+		spin_unlock(&dev->driver_override.lock);
+
+		kfree(new);
+	}
+	kfree(old);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(__device_set_driver_override);
+
 /**
  * device_is_bound() - Check if device is bound to a driver
  * @dev: device to check
diff --git a/include/linux/device.h b/include/linux/device.h
index 0be95294b6e6..4599156d5cbd 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -266,6 +266,33 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 	struct dev_ext_attribute dev_attr_##_name = \
 		{ __ATTR(_name, (_mode) & ~0222, device_show_string, NULL), (_var) }
 
+/**
+ * DEVICE_ATTR_DRIVER_OVERRIDE - Define sysfs driver_override attribute callbacks
+ *
+ * Generates the standard driver_override_show() and driver_override_store()
+ * sysfs callbacks and the static DEVICE_ATTR_RW(driver_override) declaration.
+ */
+#define DEVICE_ATTR_DRIVER_OVERRIDE()						\
+static ssize_t driver_override_store(struct device *dev,			\
+				     struct device_attribute *attr,		\
+				     const char *buf, size_t count)		\
+{										\
+	int ret;								\
+										\
+	ret = __device_set_driver_override(dev, buf, count);			\
+	if (ret)								\
+		return ret;							\
+										\
+	return count;								\
+}										\
+static ssize_t driver_override_show(struct device *dev,				\
+				    struct device_attribute *attr, char *buf)	\
+{										\
+	guard(spinlock)(&dev->driver_override.lock);				\
+	return sysfs_emit(buf, "%s\n", dev->driver_override.name);		\
+}										\
+static DEVICE_ATTR_RW(driver_override)
+
 #define DEVICE_ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store) \
 	struct device_attribute dev_attr_##_name =		\
 		__ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store)
@@ -483,6 +510,8 @@ struct device_physical_location {
  * 		on.  This shrinks the "Board Support Packages" (BSPs) and
  * 		minimizes board-specific #ifdefs in drivers.
  * @driver_data: Private pointer for driver specific info.
+ * @driver_override: Driver name to force a match.  Do not touch directly; use
+ *		     device_set_driver_override() instead.
  * @links:	Links to suppliers and consumers of this device.
  * @power:	For device power management.
  *		See Documentation/driver-api/pm/devices.rst for details.
@@ -576,6 +605,10 @@ struct device {
 					   core doesn't touch it */
 	void		*driver_data;	/* Driver data, set and get with
 					   dev_set_drvdata/dev_get_drvdata */
+	struct {
+		const char	*name;
+		spinlock_t	lock;
+	} driver_override;
 	struct mutex		mutex;	/* mutex to synchronize calls to
 					 * its driver.
 					 */
@@ -701,6 +734,54 @@ struct device_link {
 
 #define kobj_to_dev(__kobj)	container_of_const(__kobj, struct device, kobj)
 
+int __device_set_driver_override(struct device *dev, const char *s, size_t len);
+
+/**
+ * device_set_driver_override() - Helper to set or clear driver override.
+ * @dev: Device to change
+ * @s: NUL-terminated string, new driver name to force a match, pass empty
+ *     string to clear it ("" or "\n", where the latter is only for sysfs
+ *     interface).
+ *
+ * Helper to set or clear driver override of a device.
+ *
+ * Returns: 0 on success or a negative error code on failure.
+ */
+static inline int device_set_driver_override(struct device *dev, const char *s)
+{
+	return __device_set_driver_override(dev, s, strlen(s));
+}
+
+/**
+ * device_has_driver_override() - Check if a driver override has been set.
+ * @dev: device to check
+ *
+ * Returns true if a driver override has been set for this device.
+ */
+static inline bool device_has_driver_override(struct device *dev)
+{
+	guard(spinlock)(&dev->driver_override.lock);
+	return !!dev->driver_override.name;
+}
+
+/**
+ * device_match_driver_override() - Match a driver against the device's driver_override.
+ * @dev: device to check
+ * @drv: driver to match against
+ *
+ * Returns > 0 if a driver override is set and matches the given driver, 0 if a
+ * driver override is set but does not match, or < 0 if a driver override is not
+ * set at all.
+ */
+static inline int device_match_driver_override(struct device *dev,
+					       const struct device_driver *drv)
+{
+	guard(spinlock)(&dev->driver_override.lock);
+	if (dev->driver_override.name)
+		return !strcmp(dev->driver_override.name, drv->name);
+	return -1;
+}
+
 /**
  * device_iommu_mapped - Returns true when the device DMA is translated
  *			 by an IOMMU
-- 
2.53.0


