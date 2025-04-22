Return-Path: <linux-arm-msm+bounces-54936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B977AA96769
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C76AF166FCC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8843327CB04;
	Tue, 22 Apr 2025 11:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NTEcpbuz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517DE27BF9E
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321536; cv=none; b=HU6A0SYLwNaYLFyFTp+Q0Nlf69QPvyqlD9COl0VtUnFe+yMYmVRSFCl3MORNUUXT0TQfBszCXwYDIg4PEssOri0hF8mGiqrMw11VeAi8gtrHj7LMyfsORTQBbWfLI8I92KS6z72dHBKO8MTBpijLwYrRe8eFqzdXiCXT9asuSaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321536; c=relaxed/simple;
	bh=97uK62zmD2sWyzkTZ44MvQTZD69HqLC6hR2+rP9VfTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NW+LtiTk6JCfChfAOB2Eb6bRJIcefKs6X7CEdL/21aVlFXQXxdFFbdtd5AQcLzXoBasNAVdz4+zeqJ43UAQfBp9p9SgNb8q2Rkr7nzRQ7RaMYnAfMLrVZAp88oPGKUAJAiartT7+LH4aeMyC53x/fiC3IhG4U76ongKbpVLIO4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NTEcpbuz; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3913958ebf2so4499265f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321532; x=1745926332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SCwux+a4Q8sCXgF1emBYGhkcA+99fK1/4YdDu/kkdcA=;
        b=NTEcpbuz6UtTebR0zP9xWoG3jP3pcZP1zE0vJtRD9dL1MztRe/nOx0ZWlkxW41mxHx
         NbvBnzxLg6U5JH+4RLH3HQJZi39pdY/l4KFJ2bXbsm3Iq3lcIuYhwA1LMo5DQAgQnUsf
         jWgjUQvJBUO1HTElL6QSJ/3VZm9/+hUT9UJcGUis8IGPx+gity9TYuzcUzo5Em9MpuxR
         5cwHpd/h4MS0h+WruCQtfpfdnqK5r/FX5GCOQMBHsdkXy5G4cH7x53a8XRUxpmS2B6GP
         ooui4sSAHbzhN8Yq/5+TAHn5QegMD9Q/WDonPSWRSmC/LiIJ/GYiIdW4JAFPCDMBgpXi
         kEOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321532; x=1745926332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SCwux+a4Q8sCXgF1emBYGhkcA+99fK1/4YdDu/kkdcA=;
        b=eMir/TF5tWMU/9QB2wfgp270B5geeI40u+kRwr9kiJBi3yuT43LWCUlYZ7fVm43KE5
         Zy/aatGu14AxtSKyjwiKPJCbHPNojWdl/k3o7CFgzPnwQ8rzjT7qqr/sMLz2G5O0F34D
         YlEwl9RUodqydqU6U8xeqFDMTRUQ5uoOy7Ft17m2oA+mN5xYbaE3y/MlmPsimnfNUuWT
         4zxdJSw88xE+L3QWoMl23Fl9fICzVA+eE0QKYh/g045jvkd5V7aQ3urWtBWwSA09oC8S
         uTFYIZmQkh6+F3pw3Z3dctBF7wfvsYAhOjPP1dQqrFi2BVml8bUtSvdxNDlNO1epHmLL
         C4Gg==
X-Forwarded-Encrypted: i=1; AJvYcCW5+ITXyIBV7FpEcjQUnlvc9dBmUfAxmJLoGbnwe3yD8bQJz1iwUenUWj3Xhu81TXMoJo+p4t6tYXACesr2@vger.kernel.org
X-Gm-Message-State: AOJu0YxUGOTrvJJSsRCQrENzlcftPu2wR9iFtxtjNH77AUgTC2YcG+Kd
	xjYZtwZws5wbA/8oEdF0QIidr7SmOE0nYvHvwkn0so4vOd83bLx5zv0dRcu4tBk=
X-Gm-Gg: ASbGnct3wUZy+96bTY7n3FKAbmfVIpM/5vrtBUCd60BQzqHAclfsS3GylGwX4QLK6nP
	r51LC0aMtrk2mygrsQJqBa1moHRzr/HRN5C9mRZ7W+x+Nwv/YSIFtafikR5NDIqBRJY7STkQKAC
	6p2bYoJhbA8vN0Z+q1PwTZpK+bZRnFUTTUT1Cx7/aAoMwHOHIVzzDLfFhqKEqrtmHqWXjXOCSSr
	6NC88XlFoI6oPnZsA7NtIQoYfHapPUQj8pLJIceYzDVt2S+H4V85oi/sJ7znq9+HB62XhcXsrk/
	pIbekPj9OIOsHuowvtEzM4fIhS9dMDaeDah7TaONsIp+2TLYxb4d3wQwsR9WqJ4=
X-Google-Smtp-Source: AGHT+IGMfuXrs6yBJwUzUPD9ezVigzRz4yUbqmU88PCa4ZD+NBPSxQaWYDkLyhCxy4qvd1m4zcFnzQ==
X-Received: by 2002:a05:6000:1862:b0:38d:d0ca:fbad with SMTP id ffacd0b85a97d-39efba3c803mr11877512f8f.14.1745321532510;
        Tue, 22 Apr 2025 04:32:12 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:12 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org
Subject: [RFC][PATCH 02/14] kmemdump: introduce kmemdump
Date: Tue, 22 Apr 2025 14:31:44 +0300
Message-ID: <20250422113156.575971-3-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kmemdump mechanism allows any driver to mark a specific memory area
for later dumping purpose, depending on the functionality
of the attached backend. The backend would interface any hardware
mechanism that will allow dumping to complete regardless of the
state of the kernel (running, frozen, crashed, or any particular
state).

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/Kconfig          |   2 +
 drivers/Makefile         |   2 +
 drivers/debug/Kconfig    |  16 ++++
 drivers/debug/Makefile   |   3 +
 drivers/debug/kmemdump.c | 185 +++++++++++++++++++++++++++++++++++++++
 include/linux/kmemdump.h |  52 +++++++++++
 6 files changed, 260 insertions(+)
 create mode 100644 drivers/debug/Kconfig
 create mode 100644 drivers/debug/Makefile
 create mode 100644 drivers/debug/kmemdump.c
 create mode 100644 include/linux/kmemdump.h

diff --git a/drivers/Kconfig b/drivers/Kconfig
index 7bdad836fc62..ef56588f559e 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -245,4 +245,6 @@ source "drivers/cdx/Kconfig"
 
 source "drivers/dpll/Kconfig"
 
+source "drivers/debug/Kconfig"
+
 endmenu
diff --git a/drivers/Makefile b/drivers/Makefile
index 45d1c3e630f7..cf544a405007 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -195,3 +195,5 @@ obj-$(CONFIG_CDX_BUS)		+= cdx/
 obj-$(CONFIG_DPLL)		+= dpll/
 
 obj-$(CONFIG_S390)		+= s390/
+
+obj-y				+= debug/
diff --git a/drivers/debug/Kconfig b/drivers/debug/Kconfig
new file mode 100644
index 000000000000..22348608d187
--- /dev/null
+++ b/drivers/debug/Kconfig
@@ -0,0 +1,16 @@
+# SPDX-License-Identifier: GPL-2.0
+menu "Generic Driver Debug Options"
+
+config DRIVER_KMEMDUMP
+	bool "Allow drivers to register memory for dumping"
+	help
+	  Kmemdump mechanism allows any driver to mark a specific memory area
+	  for later dumping purpose, depending on the functionality
+	  of the attached backend. The backend would interface any hardware
+	  mechanism that will allow dumping to complete regardless of the
+	  state of the kernel (running, frozen, crashed, or any particular
+	  state).
+
+	  Note that modules using this feature must be rebuilt if option
+	  changes.
+endmenu
diff --git a/drivers/debug/Makefile b/drivers/debug/Makefile
new file mode 100644
index 000000000000..cc14dea250e3
--- /dev/null
+++ b/drivers/debug/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_DRIVER_KMEMDUMP) += kmemdump.o
diff --git a/drivers/debug/kmemdump.c b/drivers/debug/kmemdump.c
new file mode 100644
index 000000000000..a685c0863e25
--- /dev/null
+++ b/drivers/debug/kmemdump.c
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/kmemdump.h>
+#include <linux/idr.h>
+
+#define MAX_ZONES 512
+
+static struct kmemdump_backend *backend;
+static DEFINE_IDR(kmemdump_idr);
+static DEFINE_MUTEX(kmemdump_lock);
+static LIST_HEAD(kmemdump_list);
+
+/**
+ * kmemdump_register() - Register region into kmemdump.
+ * @handle: string of maximum 8 chars that identifies this region
+ * @zone: pointer to the zone of memory
+ * @size: region size
+ *
+ * Return: On success, it returns an allocated unique id that can be used
+ *	at a later point to identify the region. On failure, it returns
+ *	negative error value.
+ */
+int kmemdump_register(char *handle, void *zone, size_t size)
+{
+	struct kmemdump_zone *z = kzalloc(sizeof(*z), GFP_KERNEL);
+	int id;
+
+	if (!z)
+		return -ENOMEM;
+
+	mutex_lock(&kmemdump_lock);
+
+	id = idr_alloc_cyclic(&kmemdump_idr, z, 0, MAX_ZONES, GFP_KERNEL);
+	if (id < 0) {
+		mutex_unlock(&kmemdump_lock);
+		return id;
+	}
+
+	if (!backend)
+		pr_debug("kmemdump backend not available yet, waiting...\n");
+
+	z->zone = zone;
+	z->size = size;
+	z->id = id;
+
+	if (handle)
+		strscpy(z->handle, handle, 8);
+
+	if (backend) {
+		int ret;
+
+		ret = backend->register_region(id, handle, zone, size);
+		if (ret) {
+			mutex_unlock(&kmemdump_lock);
+			return ret;
+		}
+		z->registered = true;
+	}
+
+	mutex_unlock(&kmemdump_lock);
+	return id;
+}
+EXPORT_SYMBOL_GPL(kmemdump_register);
+
+/**
+ * kmemdump_unregister() - Unregister region from kmemdump.
+ * @id: unique id that was returned when this region was successfully
+ *	registered initially.
+ *
+ * Return: None
+ */
+void kmemdump_unregister(int id)
+{
+	struct kmemdump_zone *z;
+
+	mutex_lock(&kmemdump_lock);
+
+	z = idr_find(&kmemdump_idr, id);
+	if (!z)
+		return;
+	if (z->registered && backend)
+		backend->unregister_region(z->id);
+
+	idr_remove(&kmemdump_idr, id);
+	kfree(z);
+
+	mutex_unlock(&kmemdump_lock);
+}
+EXPORT_SYMBOL_GPL(kmemdump_unregister);
+
+static int kmemdump_register_fn(int id, void *p, void *data)
+{
+	struct kmemdump_zone *z = p;
+	int ret;
+
+	if (z->registered)
+		return 0;
+
+	ret = backend->register_region(z->id, z->handle, z->zone, z->size);
+	if (ret)
+		return ret;
+	z->registered = true;
+
+	return 0;
+}
+
+/**
+ * kmemdump_register_backend() - Register a backend into kmemdump.
+ * Only one backend is supported at a time.
+ * @be: Pointer to a driver allocated backend. This backend must have
+ *	two callbacks for registering and deregistering a zone from the
+ *	backend.
+ *
+ * Return: On success, it returns 0, negative error value otherwise.
+ */
+int kmemdump_register_backend(struct kmemdump_backend *be)
+{
+	mutex_lock(&kmemdump_lock);
+
+	if (backend)
+		return -EALREADY;
+
+	if (!be || !be->register_region || !be->unregister_region)
+		return -EINVAL;
+
+	backend = be;
+	pr_info("kmemdump backend %s registered successfully.\n",
+		backend->name);
+
+	/* Try to call the backend for all previously requested zones */
+	idr_for_each(&kmemdump_idr, kmemdump_register_fn, NULL);
+
+	mutex_unlock(&kmemdump_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kmemdump_register_backend);
+
+static int kmemdump_unregister_fn(int id, void *p, void *data)
+{
+	int ret;
+	struct kmemdump_zone *z = p;
+
+	if (!z->registered)
+		return 0;
+
+	ret = backend->unregister_region(z->id);
+	if (ret)
+		return ret;
+	z->registered = false;
+
+	return 0;
+}
+
+/**
+ * kmemdump_register_backend() - Unregister the backend from kmemdump.
+ * Only one backend is supported at a time.
+ * Before deregistering, this will call the backend to unregister all the
+ * previously registered zones.
+ * @be: Pointer to a driver allocated backend. This backend must match
+ *	the initially registered backend.
+ *
+ * Return: None
+ */
+void kmemdump_unregister_backend(struct kmemdump_backend *be)
+{
+	mutex_lock(&kmemdump_lock);
+
+	if (backend != be) {
+		mutex_unlock(&kmemdump_lock);
+		return;
+	}
+
+	/* Try to call the backend for all previously requested zones */
+	idr_for_each(&kmemdump_idr, kmemdump_unregister_fn, NULL);
+
+	backend = NULL;
+	pr_info("kmemdump backend %s removed successfully.\n", be->name);
+
+	mutex_unlock(&kmemdump_lock);
+}
+EXPORT_SYMBOL_GPL(kmemdump_unregister_backend);
diff --git a/include/linux/kmemdump.h b/include/linux/kmemdump.h
new file mode 100644
index 000000000000..b55b15c295ac
--- /dev/null
+++ b/include/linux/kmemdump.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _KMEMDUMP_H
+#define _KMEMDUMP_H
+
+#define KMEMDUMP_ZONE_MAX_HANDLE 8
+/**
+ * struct kmemdump_zone - region mark zone information
+ * @id: unique id for this zone
+ * @zone: pointer to the memory area for this zone
+ * @size: size of the memory area of this zone
+ * @registered: bool indicating whether this zone is registered into the
+ *	backend or not.
+ * @handle: a string representing this region
+ */
+struct kmemdump_zone {
+	int id;
+	void *zone;
+	size_t size;
+	bool registered;
+	char handle[KMEMDUMP_ZONE_MAX_HANDLE];
+};
+
+#define KMEMDUMP_BACKEND_MAX_NAME 128
+/**
+ * struct kmemdump_backend - region mark backend information
+ * @name: the name of the backend
+ * @register_region: callback to register region in the backend
+ * @unregister_region: callback to unregister region in the backend
+ */
+struct kmemdump_backend {
+	char name[KMEMDUMP_BACKEND_MAX_NAME];
+	int (*register_region)(unsigned int id, char *, void *, size_t);
+	int (*unregister_region)(unsigned int id);
+};
+
+#ifdef CONFIG_DRIVER_KMEMDUMP
+int kmemdump_register(char *handle, void *zone, size_t size);
+void kmemdump_unregister(int id);
+#else
+static inline int kmemdump_register(char *handle, void *area, size_t size)
+{
+	return 0;
+}
+
+static inline void kmemdump_unregister(int id)
+{
+}
+#endif
+
+int kmemdump_register_backend(struct kmemdump_backend *backend);
+void kmemdump_unregister_backend(struct kmemdump_backend *backend);
+#endif
-- 
2.43.0


