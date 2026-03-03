Return-Path: <linux-arm-msm+bounces-95124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GELcCjvPpmntWQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:08:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 350471EF08A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 13:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B72C83061ED0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 11:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DE2340A6B;
	Tue,  3 Mar 2026 11:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFlN4PJR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4090033F8D4;
	Tue,  3 Mar 2026 11:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772539055; cv=none; b=EooF72/Uuyss3auUMF6Af8lWpYEr1p/mtPpXC71kV3+VlvvEl9WJKBkeZHMr0xBkCX/KfLGkYM7zaWYBLjtgQLlN4dsbdAA69jgOEax2viV+j/xgNwNRreGPxELMZSAgFfvKhV8rh2TuJpbe7n4jmx84xvlCf+AvRGcSq+APT8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772539055; c=relaxed/simple;
	bh=bM/WxmTLJTdChrUodxAPjrbTJrXuDhe2tNOzUWPxoao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hw5J3pmWIS09LZJBoUTWUCsNlaYZgbr0mWjvu/WLvm/NZOY9FogfDZYVyzfVGS6AX1QRLgM7+BL0VZ8HFAi1WrJrY/v+SMslGTcRJxg2uhyN46sdyhLADhQGOPZSHwPuw+wbV1hnTp9vYKe8DwLg30got4/frV9BrIC0BBWrVwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFlN4PJR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49008C2BC9E;
	Tue,  3 Mar 2026 11:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772539054;
	bh=bM/WxmTLJTdChrUodxAPjrbTJrXuDhe2tNOzUWPxoao=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BFlN4PJRqNZQEpDNMgLegxcUHkAxH2m8F82gK75vDU4k0pXlgYSTG6aDN7Tz1MaTb
	 9YfaJ2F2y6bEnfAH0k9MmnBByPtLti4uiNtiepfhKmbSjDW8/b8B+vuspV8BVsESqp
	 vJACe5q0SN5BnYEmUMmJ13OkTcyTmuPKdJ5wvQIaw8z1mXXw5xXwZrL2uwSzO5GWDL
	 idDXCCX5yKzam+zhl/S3P2NQ8q7+AkI+Oq7BPTePiwjbglAuOfH92Iw2YMlnH5YGBO
	 r9isp5ry2HoXuJ3yQ3gbBxYUuNippkG2w73D578cu1bHE434aFOfU7QlVUvsMAo/nX
	 AUp1N0iRixsmQ==
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
Subject: [PATCH v2 1/4] driver core: generalize driver_override in struct device
Date: Tue,  3 Mar 2026 12:53:18 +0100
Message-ID: <20260303115720.48783-2-dakr@kernel.org>
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
X-Rspamd-Queue-Id: 350471EF08A
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
	TAGGED_FROM(0.00)[bounces-95124-lists,linux-arm-msm=lfdr.de];
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
Co-developed-by: Gui-Dong Han <hanguidong02@gmail.com>
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/bus.c         | 43 ++++++++++++++++++++++++++-
 drivers/base/core.c        |  2 ++
 drivers/base/dd.c          | 60 ++++++++++++++++++++++++++++++++++++++
 include/linux/device.h     | 54 ++++++++++++++++++++++++++++++++++
 include/linux/device/bus.h |  4 +++
 5 files changed, 162 insertions(+), 1 deletion(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index bb61d8adbab1..c734e7162b74 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -504,6 +504,36 @@ int bus_for_each_drv(const struct bus_type *bus, struct device_driver *start,
 }
 EXPORT_SYMBOL_GPL(bus_for_each_drv);
 
+static ssize_t driver_override_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t count)
+{
+	int ret;
+
+	ret = __device_set_driver_override(dev, buf, count);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t driver_override_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	guard(spinlock)(&dev->driver_override.lock);
+	return sysfs_emit(buf, "%s\n", dev->driver_override.name);
+}
+static DEVICE_ATTR_RW(driver_override);
+
+static struct attribute *driver_override_dev_attrs[] = {
+	&dev_attr_driver_override.attr,
+	NULL,
+};
+
+static const struct attribute_group driver_override_dev_group = {
+	.attrs = driver_override_dev_attrs,
+};
+
 /**
  * bus_add_device - add device to bus
  * @dev: device being added
@@ -537,9 +567,15 @@ int bus_add_device(struct device *dev)
 	if (error)
 		goto out_put;
 
+	if (sp->bus->driver_override) {
+		error = device_add_group(dev, &driver_override_dev_group);
+		if (error)
+			goto out_groups;
+	}
+
 	error = sysfs_create_link(&sp->devices_kset->kobj, &dev->kobj, dev_name(dev));
 	if (error)
-		goto out_groups;
+		goto out_override;
 
 	error = sysfs_create_link(&dev->kobj, &sp->subsys.kobj, "subsystem");
 	if (error)
@@ -550,6 +586,9 @@ int bus_add_device(struct device *dev)
 
 out_subsys:
 	sysfs_remove_link(&sp->devices_kset->kobj, dev_name(dev));
+out_override:
+	if (dev->bus->driver_override)
+		device_remove_group(dev, &driver_override_dev_group);
 out_groups:
 	device_remove_groups(dev, sp->bus->dev_groups);
 out_put:
@@ -607,6 +646,8 @@ void bus_remove_device(struct device *dev)
 
 	sysfs_remove_link(&dev->kobj, "subsystem");
 	sysfs_remove_link(&sp->devices_kset->kobj, dev_name(dev));
+	if (dev->bus->driver_override)
+		device_remove_group(dev, &driver_override_dev_group);
 	device_remove_groups(dev, dev->bus->dev_groups);
 	if (klist_node_attached(&dev->p->knode_bus))
 		klist_del(&dev->p->knode_bus);
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 791f9e444df8..09b98f02f559 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2556,6 +2556,7 @@ static void device_release(struct kobject *kobj)
 	devres_release_all(dev);
 
 	kfree(dev->dma_range_map);
+	kfree(dev->driver_override.name);
 
 	if (dev->release)
 		dev->release(dev);
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
index 0be95294b6e6..e65d564f01cd 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -483,6 +483,8 @@ struct device_physical_location {
  * 		on.  This shrinks the "Board Support Packages" (BSPs) and
  * 		minimizes board-specific #ifdefs in drivers.
  * @driver_data: Private pointer for driver specific info.
+ * @driver_override: Driver name to force a match.  Do not touch directly; use
+ *		     device_set_driver_override() instead.
  * @links:	Links to suppliers and consumers of this device.
  * @power:	For device power management.
  *		See Documentation/driver-api/pm/devices.rst for details.
@@ -576,6 +578,10 @@ struct device {
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
@@ -701,6 +707,54 @@ struct device_link {
 
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
+	return __device_set_driver_override(dev, s, s ? strlen(s) : 0);
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
diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index 99c3c83ea520..cda597812324 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -63,6 +63,9 @@ struct fwnode_handle;
  *			this bus.
  * @pm:		Power management operations of this bus, callback the specific
  *		device driver's pm-ops.
+ * @driver_override:	Set to true if this bus supports the driver_override
+ *			mechanism, which allows userspace to force a specific
+ *			driver to bind to a device via a sysfs attribute.
  * @need_parent_lock:	When probing or removing a device on this bus, the
  *			device core should lock the device's parent.
  *
@@ -104,6 +107,7 @@ struct bus_type {
 
 	const struct dev_pm_ops *pm;
 
+	bool driver_override;
 	bool need_parent_lock;
 };
 
-- 
2.53.0


