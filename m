Return-Path: <linux-arm-msm+bounces-48181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C45A37FC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 11:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED4903A6740
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 10:18:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F0E217F28;
	Mon, 17 Feb 2025 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OO3VBxZd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07220217679
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 10:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787472; cv=none; b=Gn+oI4oFSY8NvqeZhekf/lnDFoi/hY6s4tayl4JPmi4Fkiy1efLYlrZH+0smoQGu7IWWtbvBgJ77fFjuq5D2aBvM7OBe+TdHxY5ogidPtOrtmUxoEAGSb/J0DlCWzZX0PDp+Zp7/Z0d6wIM9j0jEG13fZMyhNLOUheQyl8jDq4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787472; c=relaxed/simple;
	bh=1hkKPUWrxq7K5LZ+JEA021QIrfwfKcgoOdedz+W5Q9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EtvxsSNFeOZZ22EXfNLFbVSbkFv2YE9YgBAj3HjqhMW+D7zXDysU43jD5tPAAufemNVsrHiKxGSSYdgYAP83ngZf24d/IYMOFnBzn0/iT2Sa8u7umh7R0LHXS/P1dTi67eX81+5p+Da4cRwGclj+aDwFewG1AFR7D/nnKYbRCIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OO3VBxZd; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dedd4782c6so5491170a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 02:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787468; x=1740392268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UO0IV1Fa2w4jRN2VF1J5DC4vESX9Rcd9+LGQ+k/6XZk=;
        b=OO3VBxZd2S8Aj8r1yxFIR8d5NhbGf1AJ2aOLJ0kLtZRSLbhB1k99nuC/RsU9mzdfIz
         UG/xoi5Y/PsG04GKdC85Hs4CtQGEiuhUGl62pEK87rBcZ3BfGK/UX4FWB5FvqC6X4CAM
         yegjLcNhdxx78BoqFgMiDF1jVQ8GME9UbnbbUiWnaWyMJEQhOD951NbFE8x+E/L9BGJY
         AI316Ot9PtKkLIdC/pTG/U8tX5CR0lQfirAhevjpiGF66fevZ0bihC4B7ybMGeKsm7xJ
         DfoAj3kFeWgV+h94BRlhi+jp1lFxkbOCl41ux4MtXnELW9+XTtOkMejD7DPIeHa81s9r
         ZYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787468; x=1740392268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UO0IV1Fa2w4jRN2VF1J5DC4vESX9Rcd9+LGQ+k/6XZk=;
        b=kuKHSOuGA5wGWIlxfr4bwytCLeiJU0/fm2+racaoK985w6L/jAhyY5RavW8n3Xn+jG
         nXkNx+tC1LG0pVdoEyBMDBxCZNc95LR6VJuddJXHsOdPRnA+2F2Bp+qafZ+ffNT1suQI
         ZPtQ8cYoLHxKTLzFDTKjI5S0LFFRko2o72/U2dBGlkKKH6MFgQx7wIqi9Mngapb3u3tP
         IWOipi6UW/uP8FLtOsffhT6a4sC854RZPZm8mM7FNLGGYOi2AxL0MePYPYZ5u2Uobsws
         V0nSmgO6FuYyFH3e1aXHnHBOVVHmONBMLzIw3NxnNusb0wqkEjhjiQZMXsyFVcgVM78J
         b+Pg==
X-Gm-Message-State: AOJu0YyP3eNmzjo7gz3RfAmFOWhVnHRvIZYJBvn0YOplp0xW2lJU2+cL
	h3NCituRfOPEyQAyDa+EqCcIwcj1ZwYrh8v1/0AN4sq7KGtiQ7EsTj3sOFcPzSXTY9cnZvs+WpX
	u6MI=
X-Gm-Gg: ASbGncsdmMD0qojbd034e/nM7UN0nl8LH1AgVVMCU4sqYQUxOXdWCW+J6cFZwfdFFEF
	TMguC5K+4xWxGIMTnVqsMNV6t+B1ksHfTd7nU95YP9KxRPkZpshU71n4HAQvif/7vR8NFGMW76A
	gBCLKcjiWnIvGpWj9lc/Xo4+QVVbA7ZqPdq3ikjJ8AoFr2OwcBTRpSLHz7/jHZX5I7b5/oDHlZb
	cy+/dRpRiUaPM+QTjA4nyaqBNYWL8a4WlRgQvXNcSAyMVAZrftKxn/5nyOllGx1gS94tNDoIIfr
	0RcxMUYiPRQdR1blrFuvvVk6
X-Google-Smtp-Source: AGHT+IFeqQRmHtufh/hnET9/WDBmQ08tktpUPlNNW2f16K2ts13CoRF9gAnCjQkfdJKdSGt+WA/5Ug==
X-Received: by 2002:a17:906:3290:b0:ab7:d179:2496 with SMTP id a640c23a62f3a-abb70a791dcmr775286966b.6.1739787468349;
        Mon, 17 Feb 2025 02:17:48 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm308583266b.174.2025.02.17.02.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:17:48 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH 02/10] pstore/smem: add new pstore/smem type of pstore
Date: Mon, 17 Feb 2025 12:16:58 +0200
Message-ID: <20250217101706.2104498-3-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217101706.2104498-1-eugen.hristev@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add shared memory type of pstore.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 fs/pstore/Kconfig           |  13 ++++
 fs/pstore/Makefile          |   3 +
 fs/pstore/smem.c            | 115 ++++++++++++++++++++++++++++++++++++
 include/linux/pstore_smem.h |   9 +++
 4 files changed, 140 insertions(+)
 create mode 100644 fs/pstore/smem.c
 create mode 100644 include/linux/pstore_smem.h

diff --git a/fs/pstore/Kconfig b/fs/pstore/Kconfig
index 3acc38600cd1..84f87edf9b8f 100644
--- a/fs/pstore/Kconfig
+++ b/fs/pstore/Kconfig
@@ -81,6 +81,19 @@ config PSTORE_RAM
 
 	  For more information, see Documentation/admin-guide/ramoops.rst.
 
+config PSTORE_SMEM
+	tristate "Log panic/oops to a shared memory buffer"
+	depends on PSTORE
+	select PSTORE_ZONE
+	help
+	  This enables panic and oops messages to be logged to memory
+	  that is shared between different hardware blocks in the system.
+	  This shared memory can be a static ram, a part of dynamic RAM,
+	  a dedicated cache or memory area specific for crash dumps,
+	  or even a memory on an attached device.
+
+	  if unsure, say N.
+
 config PSTORE_ZONE
 	tristate
 	depends on PSTORE
diff --git a/fs/pstore/Makefile b/fs/pstore/Makefile
index c270467aeece..f2a314ca03a0 100644
--- a/fs/pstore/Makefile
+++ b/fs/pstore/Makefile
@@ -18,3 +18,6 @@ obj-$(CONFIG_PSTORE_ZONE)	+= pstore_zone.o
 
 pstore_blk-objs += blk.o
 obj-$(CONFIG_PSTORE_BLK)	+= pstore_blk.o
+
+pstore_smem-objs += smem.o
+obj-$(CONFIG_PSTORE_SMEM)	+= pstore_smem.o
diff --git a/fs/pstore/smem.c b/fs/pstore/smem.c
new file mode 100644
index 000000000000..9eedd7df5446
--- /dev/null
+++ b/fs/pstore/smem.c
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Implements pstore backend driver for shared memory devices,
+ * using the pstore/zone API.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/blkdev.h>
+#include <linux/string.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pstore_smem.h>
+#include <linux/fs.h>
+#include <linux/file.h>
+#include <linux/init_syscalls.h>
+#include <linux/mount.h>
+
+/*
+ * All globals must only be accessed under the pstore_smem_lock
+ * during the register/unregister functions.
+ */
+static DEFINE_MUTEX(pstore_smem_lock);
+static struct pstore_device_info *pstore_device_info;
+
+static int __register_pstore_device(struct pstore_device_info *dev)
+{
+	int ret;
+
+	lockdep_assert_held(&pstore_smem_lock);
+
+	if (!dev) {
+		pr_err("NULL device info\n");
+		return -EINVAL;
+	}
+	if (!dev->zone.total_size) {
+		pr_err("zero sized device\n");
+		return -EINVAL;
+	}
+	if (!dev->zone.read) {
+		pr_err("no read handler for device\n");
+		return -EINVAL;
+	}
+	if (!dev->zone.write) {
+		pr_err("no write handler for device\n");
+		return -EINVAL;
+	}
+
+	/* someone already registered before */
+	if (pstore_device_info)
+		return -EBUSY;
+
+	/* zero means not limit on which backends to attempt to store. */
+	if (!dev->flags)
+		dev->flags = UINT_MAX;
+
+	/* Initialize required zone ownership details. */
+	dev->zone.name = KBUILD_MODNAME;
+	dev->zone.owner = THIS_MODULE;
+
+	ret = register_pstore_zone(&dev->zone);
+	if (ret == 0)
+		pstore_device_info = dev;
+
+	return ret;
+}
+/**
+ * register_pstore_smem_device() - register smem device to pstore
+ *
+ * @dev: smem device information
+ *
+ * Return:
+ * * 0		- OK
+ * * Others	- some error.
+ */
+int register_pstore_smem_device(struct pstore_device_info *dev)
+{
+	int ret;
+
+	mutex_lock(&pstore_smem_lock);
+	ret = __register_pstore_device(dev);
+	mutex_unlock(&pstore_smem_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(register_pstore_smem_device);
+
+static void __unregister_pstore_device(struct pstore_device_info *dev)
+{
+	lockdep_assert_held(&pstore_smem_lock);
+	if (pstore_device_info && pstore_device_info == dev) {
+		unregister_pstore_zone(&dev->zone);
+		pstore_device_info = NULL;
+	}
+}
+
+/**
+ * unregister_pstore_smem_device() - unregister smem device from pstore
+ *
+ * @dev: smem device information
+ */
+void unregister_pstore_smem_device(struct pstore_device_info *dev)
+{
+	mutex_lock(&pstore_smem_lock);
+	__unregister_pstore_device(dev);
+	mutex_unlock(&pstore_smem_lock);
+}
+EXPORT_SYMBOL_GPL(unregister_pstore_smem_device);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Eugen Hristev <eugen.hristev@linaro.org>");
+MODULE_DESCRIPTION("pstore backend for smem devices");
diff --git a/include/linux/pstore_smem.h b/include/linux/pstore_smem.h
new file mode 100644
index 000000000000..f0ad23e117c4
--- /dev/null
+++ b/include/linux/pstore_smem.h
@@ -0,0 +1,9 @@
+#ifndef PSTORE_SMEM_H
+#define PSTORE_SMEM_H
+
+#include <linux/pstore_zone.h>
+
+int register_pstore_smem_device(struct pstore_device_info *dev);
+void unregister_pstore_smem_device(struct pstore_device_info *dev);
+
+#endif
-- 
2.43.0


