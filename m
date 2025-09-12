Return-Path: <linux-arm-msm+bounces-73353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F9EB552B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 17:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABA4D581BCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 15:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 056343115B8;
	Fri, 12 Sep 2025 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XCR9sitR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00C7306489
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689796; cv=none; b=BI3cM0LkcMSA1y5NdIAh4FXwzYYlRVSqAFHVGOik3UTeWwxtRnV5XZWGMrAg7j5Ew1TjCqFd6fBdqoVrVLXhopGTEVbQtSmZNGk3jMK1D9+1XWXZ0Uam5NSM34FKRVhT+MfYUiauMSoj5eVGjMfKPwUoz/BDIthwZDhDncfzxUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689796; c=relaxed/simple;
	bh=vuO2m3M71ygZaDwujP+rNQt318lNBmzfkAJO9dajnFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J5+NglP+uIePZMiZHjGM126y6a53ehPEZbC1h1lfPxmVQwSpYpnWhR9RlaBdrvHVorKZPOzFTreXzBgaJUemH5LtOMaz6SHUfp6e43bRkAuK3MbIE4zVp5Tq8RDAR0MeWPass1V4nBo7rQ0etISlFiOrH6y2c4FMcRT6Q5sMvy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XCR9sitR; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71d60501806so14386447b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689794; x=1758294594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzHigyy7wb6B4Qf5Kb9gVs2tyhtkzh8ngJUDwiJtOEQ=;
        b=XCR9sitRPs4JwCuc0rW5kAN5QtNyAzap3CHpbIqpkfMi/GQ8+MFD1qqJ4H0/5QNF2K
         SNxjH4dVRl4A1Da+NbMbF3F6srXILfhAdZogDulhQT9u9WTMRZfdRTRGHIhga0PEwVA7
         +NM0yBqClDI0r8q9GTZ3qDERgEQEbzF0alF0+7VVbzKaplFN19GnvEPPEhFB2IdUuzvY
         i+AWyq0JlB+5/doiUzg7CqTu8IJ1T6w7MA9VKgj4HCMqkjf37rG63CvA+PPJiSz9Qwar
         dbboLzB6qR6mzNeit2sgN8J9ineKQru+5dTlOHCWEg3/qyymKM6RhKEs+5jC2L3jE4tC
         tTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689794; x=1758294594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzHigyy7wb6B4Qf5Kb9gVs2tyhtkzh8ngJUDwiJtOEQ=;
        b=VUb4XPir0POXHIvuMDOXEWGpqbzr8V/9v+YEzEWJEcN0ve5YpnvDHB/mq9gjp+0IPv
         Eh23TWrCqGe44eM14Bh0QKLbfw4dyku5cpmN2Q7T4Qzij05dDZ5y2VGZW6PJhHMKiTta
         vpAT8n8atbTyfIgQgi9vm8Pn8pO2XZaNTye17SkwmZ2goVD7jCh6/m82hdFbaQDGKr9+
         QLkXZyqLWVDLA3NLIq/70b7avchud9GDhf0DH5jMNsV6kHsFLIz1lZnUXqN3ElAqahS2
         v9X8PPXiEyYK3TsjgpqLTBQu6zhu2Umh8BGiv+PzwtTKCXO254iTxo6MMlrGGC+x4+Jo
         ARnw==
X-Gm-Message-State: AOJu0Yx33jvgwrVjDmYTIDw4kGL5dV8qx7+jd2vHUd2oEi3i8GyQlees
	Svl+xIjhXEom8KWO+tQn5jEF0iLZ6eou9PxbCfslevYWG55Mxa052JTMVQA6lEX+jZOzPOib/WL
	5ENYIwdMGyA==
X-Gm-Gg: ASbGnct9WJwK6kK0M086piqgHlb0HxBFVmGRhLOawFkLoqa5A2N1mfpGnoxUn+X/e0g
	mlklg0YlOUjYfYk5u7Idc3Arkfudyn3uTvsXhZO30ZL5h8Qw7FxBoTcVqECb08wvgUPw/TZuTls
	Hw5bo/TvAIA54+V2vE3xi51qsY23b0qs31hi8uMXepvBIfWZ2qMw2q7z25AxHAHrxKS651CFw/l
	4h51+laLxs12Rl3WyHXr6X2O2VqlJiVffGhVzdhgyGjxEAMhnRkPqWPE2HrF4rYJehGH4MbXOHB
	4I2+bwI624Q8R9DQtKiLtJytmcna2hbnJrBhpf1Ps/W4uXpDVpTJJLqqt0mt2WPDsddtBtfiDhX
	P7Zwua8RH9wPGYW8e1dEJTFTcI3c4pIgALrNrzOAve+tF
X-Google-Smtp-Source: AGHT+IE5YJnan3mhmVKTpnc/qVabMAWHQ4V7v9w5sLmYvHsMlgVVw6mvPzm8RfO76m/SQuXkiV/5wA==
X-Received: by 2002:a05:690c:c16:b0:729:f78b:4205 with SMTP id 00721157ae682-730652dc116mr32595427b3.36.1757689793641;
        Fri, 12 Sep 2025 08:09:53 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:09:53 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH v3 01/16] kmemdump: Introduce kmemdump
Date: Fri, 12 Sep 2025 18:08:40 +0300
Message-ID: <20250912150855.2901211-2-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912150855.2901211-1-eugen.hristev@linaro.org>
References: <20250912150855.2901211-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kmemdump mechanism allows any driver to mark a specific memory area
for later dumping/debugging purpose, depending on the functionality
of the attached backend.
The backend would interface any hardware mechanism that will allow
dumping to complete regardless of the state of the kernel
(running, frozen, crashed, or any particular state).

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 MAINTAINERS               |   6 ++
 include/linux/kmemdump.h  |  63 ++++++++++++
 mm/Kconfig.debug          |   2 +
 mm/Makefile               |   1 +
 mm/kmemdump/Kconfig.debug |  14 +++
 mm/kmemdump/Makefile      |   3 +
 mm/kmemdump/kmemdump.c    | 202 ++++++++++++++++++++++++++++++++++++++
 7 files changed, 291 insertions(+)
 create mode 100644 include/linux/kmemdump.h
 create mode 100644 mm/kmemdump/Kconfig.debug
 create mode 100644 mm/kmemdump/Makefile
 create mode 100644 mm/kmemdump/kmemdump.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8cf4990a8ff6..1713cccefc91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13810,6 +13810,12 @@ L:	linux-iio@vger.kernel.org
 S:	Supported
 F:	drivers/iio/accel/kionix-kx022a*
 
+KMEMDUMP
+M:	Eugen Hristev <eugen.hristev@linaro.org>
+S:	Maintained
+F:	include/linux/kmemdump.h
+F:	mm/kmemdump/kmemdump.c
+
 KMEMLEAK
 M:	Catalin Marinas <catalin.marinas@arm.com>
 S:	Maintained
diff --git a/include/linux/kmemdump.h b/include/linux/kmemdump.h
new file mode 100644
index 000000000000..8e764bb2d8ac
--- /dev/null
+++ b/include/linux/kmemdump.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _KMEMDUMP_H
+#define _KMEMDUMP_H
+
+enum kmemdump_uid {
+	KMEMDUMP_ID_START = 0,
+	KMEMDUMP_ID_USER_START,
+	KMEMDUMP_ID_USER_END,
+	KMEMDUMP_ID_NO_ID,
+};
+
+#ifdef CONFIG_KMEMDUMP
+/**
+ * struct kmemdump_zone - region mark zone information
+ * @id: unique id for this zone
+ * @zone: pointer to the memory area for this zone
+ * @size: size of the memory area of this zone
+ */
+struct kmemdump_zone {
+	enum kmemdump_uid	id;
+	void			*zone;
+	size_t			size;
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
+	int (*register_region)(const struct kmemdump_backend *be,
+			       enum kmemdump_uid uid, void *vaddr, size_t size);
+	int (*unregister_region)(const struct kmemdump_backend *be,
+				 enum kmemdump_uid uid);
+};
+
+int kmemdump_register_backend(const struct kmemdump_backend *backend);
+void kmemdump_unregister_backend(const struct kmemdump_backend *backend);
+
+int kmemdump_register_id(enum kmemdump_uid id, void *zone, size_t size);
+
+#define kmemdump_register(...)						\
+	kmemdump_register_id(KMEMDUMP_ID_NO_ID, __VA_ARGS__)		\
+
+void kmemdump_unregister(enum kmemdump_uid id);
+#else
+static inline int kmemdump_register_id(enum kmemdump_uid uid, void *area,
+				       size_t size)
+{
+	return 0;
+}
+
+#define kmemdump_register(...)
+
+static inline void kmemdump_unregister(enum kmemdump_uid id)
+{
+}
+#endif
+
+#endif
diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 32b65073d0cc..b6aad5cb09c1 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -309,3 +309,5 @@ config PER_VMA_LOCK_STATS
 	  overhead in the page fault path.
 
 	  If in doubt, say N.
+
+source "mm/kmemdump/Kconfig.debug"
diff --git a/mm/Makefile b/mm/Makefile
index 21abb3353550..ca1691dd8924 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -90,6 +90,7 @@ obj-$(CONFIG_MMU_NOTIFIER) += mmu_notifier.o
 obj-$(CONFIG_KSM) += ksm.o
 obj-$(CONFIG_PAGE_POISONING) += page_poison.o
 obj-$(CONFIG_KASAN)	+= kasan/
+obj-$(CONFIG_KMEMDUMP)	+= kmemdump/
 obj-$(CONFIG_KFENCE) += kfence/
 obj-$(CONFIG_KMSAN)	+= kmsan/
 obj-$(CONFIG_FAILSLAB) += failslab.o
diff --git a/mm/kmemdump/Kconfig.debug b/mm/kmemdump/Kconfig.debug
new file mode 100644
index 000000000000..5654180141c0
--- /dev/null
+++ b/mm/kmemdump/Kconfig.debug
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config KMEMDUMP
+	bool "KMEMDUMP: Allow the kernel to register memory regions for dumping purpose"
+	help
+	  Kmemdump mechanism allows any driver to mark a specific memory area
+	  for later dumping/debugging purpose, depending on the functionality
+	  of the attached backend.
+	  The backend would interface any hardware mechanism that will allow
+	  dumping to complete regardless of the state of the kernel
+	  (running, frozen, crashed, or any particular state).
+
+	  Note that modules using this feature must be rebuilt if option
+	  changes.
diff --git a/mm/kmemdump/Makefile b/mm/kmemdump/Makefile
new file mode 100644
index 000000000000..f5b917a6ef5e
--- /dev/null
+++ b/mm/kmemdump/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-y += kmemdump.o
diff --git a/mm/kmemdump/kmemdump.c b/mm/kmemdump/kmemdump.c
new file mode 100644
index 000000000000..c016457620a4
--- /dev/null
+++ b/mm/kmemdump/kmemdump.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/kmemdump.h>
+
+#define MAX_ZONES 201
+
+static int default_register_region(const struct kmemdump_backend *be,
+				   enum kmemdump_uid id, void *area, size_t sz)
+{
+	return 0;
+}
+
+static int default_unregister_region(const struct kmemdump_backend *be,
+				     enum kmemdump_uid id)
+{
+	return 0;
+}
+
+static const struct kmemdump_backend kmemdump_default_backend = {
+	.name = "default",
+	.register_region = default_register_region,
+	.unregister_region = default_unregister_region,
+};
+
+static const struct kmemdump_backend *backend = &kmemdump_default_backend;
+static DEFINE_MUTEX(kmemdump_lock);
+static struct kmemdump_zone kmemdump_zones[MAX_ZONES];
+
+/**
+ * kmemdump_register_id() - Register region into kmemdump with given ID.
+ * @req_id: Requested unique kmemdump_uid that identifies the region
+ *	This can be KMEMDUMP_ID_NO_ID, in which case the function will
+ *	find an unused ID and return it.
+ * @zone: pointer to the zone of memory
+ * @size: region size
+ *
+ * Return: On success, it returns the unique id for the region.
+ *	 On failure, it returns negative error value.
+ */
+int kmemdump_register_id(enum kmemdump_uid req_id, void *zone, size_t size)
+{
+	struct kmemdump_zone *z;
+	enum kmemdump_uid uid = req_id;
+	int ret;
+
+	if (uid < KMEMDUMP_ID_START)
+		return -EINVAL;
+
+	if (uid >= MAX_ZONES)
+		return -ENOSPC;
+
+	mutex_lock(&kmemdump_lock);
+
+	if (uid == KMEMDUMP_ID_NO_ID)
+		while (uid < MAX_ZONES) {
+			if (!kmemdump_zones[uid].id)
+				break;
+			uid++;
+		}
+
+	if (uid == MAX_ZONES) {
+		mutex_unlock(&kmemdump_lock);
+		return -ENOSPC;
+	}
+
+	z = &kmemdump_zones[uid];
+
+	if (z->id) {
+		mutex_unlock(&kmemdump_lock);
+		return -EALREADY;
+	}
+
+	ret = backend->register_region(backend, uid, zone, size);
+	if (ret) {
+		mutex_unlock(&kmemdump_lock);
+		return ret;
+	}
+
+	z->zone = zone;
+	z->size = size;
+	z->id = uid;
+
+	mutex_unlock(&kmemdump_lock);
+
+	return uid;
+}
+EXPORT_SYMBOL_GPL(kmemdump_register_id);
+
+/**
+ * kmemdump_unregister() - Unregister region from kmemdump.
+ * @id: unique id that was returned when this region was successfully
+ *	registered initially.
+ *
+ * Return: None
+ */
+void kmemdump_unregister(enum kmemdump_uid id)
+{
+	struct kmemdump_zone *z = NULL;
+
+	mutex_lock(&kmemdump_lock);
+
+	z = &kmemdump_zones[id];
+	if (!z->id) {
+		mutex_unlock(&kmemdump_lock);
+		return;
+	}
+
+	backend->unregister_region(backend, z->id);
+
+	memset(z, 0, sizeof(*z));
+
+	mutex_unlock(&kmemdump_lock);
+}
+EXPORT_SYMBOL_GPL(kmemdump_unregister);
+
+/**
+ * kmemdump_register_backend() - Register a backend into kmemdump.
+ * @be: Pointer to a driver allocated backend. This backend must have
+ *	two callbacks for registering and deregistering a zone from the
+ *	backend.
+ *
+ * Only one backend is supported at a time.
+ *
+ * Return: On success, it returns 0, negative error value otherwise.
+ */
+int kmemdump_register_backend(const struct kmemdump_backend *be)
+{
+	enum kmemdump_uid uid;
+	int ret;
+
+	if (!be || !be->register_region || !be->unregister_region)
+		return -EINVAL;
+
+	mutex_lock(&kmemdump_lock);
+
+	/* Try to call the old backend for all existing regions */
+	for (uid = KMEMDUMP_ID_START; uid < MAX_ZONES; uid++)
+		if (kmemdump_zones[uid].id)
+			backend->unregister_region(backend,
+						   kmemdump_zones[uid].id);
+
+	backend = be;
+	pr_debug("kmemdump backend %s registered successfully.\n",
+		 backend->name);
+
+	/* Call the new backend for all existing regions */
+	for (uid = KMEMDUMP_ID_START; uid < MAX_ZONES; uid++) {
+		if (!kmemdump_zones[uid].id)
+			continue;
+		ret = backend->register_region(backend,
+					       kmemdump_zones[uid].id,
+					       kmemdump_zones[uid].zone,
+					       kmemdump_zones[uid].size);
+		if (ret)
+			pr_debug("register region failed with %d\n", ret);
+	}
+
+	mutex_unlock(&kmemdump_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(kmemdump_register_backend);
+
+/**
+ * kmemdump_unregister_backend() - Unregister the backend from kmemdump.
+ * @be: Pointer to a driver allocated backend. This backend must match
+ *	the initially registered backend.
+ *
+ * Only one backend is supported at a time.
+ * Before deregistering, this will call the backend to unregister all the
+ * previously registered zones.
+ *
+ * Return: None
+ */
+void kmemdump_unregister_backend(const struct kmemdump_backend *be)
+{
+	enum kmemdump_uid uid;
+
+	mutex_lock(&kmemdump_lock);
+
+	if (backend != be) {
+		mutex_unlock(&kmemdump_lock);
+		return;
+	}
+
+	/* Try to call the old backend for all existing regions */
+	for (uid = KMEMDUMP_ID_START; uid < MAX_ZONES; uid++)
+		if (kmemdump_zones[uid].id)
+			backend->unregister_region(backend,
+						   kmemdump_zones[uid].id);
+
+	pr_debug("kmemdump backend %s removed successfully.\n", be->name);
+
+	backend = &kmemdump_default_backend;
+
+	mutex_unlock(&kmemdump_lock);
+}
+EXPORT_SYMBOL_GPL(kmemdump_unregister_backend);
+
-- 
2.43.0


