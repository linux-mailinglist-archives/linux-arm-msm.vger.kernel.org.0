Return-Path: <linux-arm-msm+bounces-20608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813538D009A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 14:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3703A286084
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 12:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F3215F3E9;
	Mon, 27 May 2024 12:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hOlu23/D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 639C515F302
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 12:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716814610; cv=none; b=Wj/wuz/KiamnrfPGEUu8MNqRy/YiAwW5BowGSAEOea/bImjp+hFlZ+TZZ4KQZ4DEsKIoH3McULYbxVLOwwifuy6u3pH1SNd9veDM3NMgZ+p7kuk+ifL73qMzEbC83BVpG0SS/ewoHiRNoIxDTtxnSxngeUPLK7mOem1oMOck8bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716814610; c=relaxed/simple;
	bh=meY1wo/NxEzDOv9msjl7yzgZ55EZS0CQR42a5BSERck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GUV76lO2Ng1oJMAGYbdr7YGJPSEGG16uDZdC6B575K4A0wsdMMQr9PGnl9v72R6c61O49NWG7o6ImMPQVLrB9lsTeXgu6UgdAsWIANmyqFWHmaJCYz/SYo4ALWvdXt026K8N6ED328ula9FqOjwjQLFL5KY8bgVd87GPTGlkoTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hOlu23/D; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4211249fbafso8765975e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 05:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716814607; x=1717419407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TVHi2ZeQ402QhpJd86jW1aHMB/MsAESVEUlJCBYjKa0=;
        b=hOlu23/DsjlZofAS4rW/hJ5thrigj73lu5BxK66SymHzG648n15PF3uSWPFahggic+
         BYe7kFE7UYiViuV98Tv+BobeErZmz97yjD4Bmr/UidlrxMrdOy7OZzqi6ZgRBiAPXBi6
         jqiQbVePbt7GOlNWNyIfWJZUwlPLecfpyMugnjvqgAbfYf6EbRNjo1zBo/IIv/zzG3YN
         YzIkzB5uEi8K7E9mKG8GIs8IwysxWrSXaL92ho3Q2vYSRqBLdfhcDJVqD5h/XLR00fhM
         WNJmsX/tU1glO07gD2oXOoquetNQeU7Ws9Rzy8BAqAv2ofriVJw2rAOkhWwnTYYZzqy7
         5bVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716814607; x=1717419407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVHi2ZeQ402QhpJd86jW1aHMB/MsAESVEUlJCBYjKa0=;
        b=iEbsj0KWXMsHCBrrK4lFz1RqCm2vZTh3hYVNT9/ppiMPKIfl+N8ksOjbrv7O13Ce4l
         GBSpPUZn0KV4ai5joSSidxPvf0sH+I37cJmBcHx0YEYooR6d7udFW+ZXEmS7K7EPLi1l
         C8M4XfcdfyhsxPZK/4C/RKtTBNQhj+vlwb+KdP+/+5ggyLspeVPO9GnOlFcB7oTXWnfv
         iAUUVhBDktgkY2h22NDlKvWHQI9IODce7IjYyeBnoOonhBQBsyx6bKOWsKcK2ttXKx2b
         YwcocgqdM0zTfDG146c6d8TeGxiIjB5vedKAUmnuQU8SyVNMNanEnRpMzdFYvoVSpp09
         HGhA==
X-Gm-Message-State: AOJu0Yz3m5wfFQOvSe7tpfeHYlJAZLm7NSJX+z4UhNt/bLs10MVc/rGS
	1LvtUeqDvsmCtvg2QhzVzi77LndaM8pX93STgqnl4zQ2yCpC4p2nHGIM2G4z7Zo=
X-Google-Smtp-Source: AGHT+IEog9ZNeS5+TA3qTIOArr0SSOWysA8XUZz5jMk3vmSPZBNBAaKBYOJEIxZ3RY1xn9NfV0Y8Wg==
X-Received: by 2002:a05:600c:b57:b0:420:11c1:b240 with SMTP id 5b1f17b1804b1-421089fa31dmr75202205e9.24.1716814606612;
        Mon, 27 May 2024 05:56:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f64f98sm138753635e9.24.2024.05.27.05.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:56:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 14:54:52 +0200
Subject: [PATCH v10 02/15] firmware: qcom: add a dedicated TrustZone buffer
 allocator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-shm-bridge-v10-2-ce7afaa58d3a@linaro.org>
References: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
In-Reply-To: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Das Srinagesh <quic_gurus@quicinc.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Arnd Bergmann <arnd@arndb.de>, Elliot Berman <quic_eberman@quicinc.com>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@quicinc.com, Andrew Halaney <ahalaney@redhat.com>, 
 Deepti Jaggi <quic_djaggi@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=15890;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mOaQJ76pAi8DfDmYfUIgvI22J5C2x0SmFzelql6S1xc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVIMIch6WhvRS5l6JSfrZ2sgNLqinYJUoa6s13
 CTL3pAZ3iCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlSDCAAKCRARpy6gFHHX
 cmP5D/913GO7T1Bt5zSp3QSRjHJR7P9a5aghpFTCeMYwu1FzOjQ+EdaUWsyAM9DpJDd4AlQy4yc
 P+vAsSG483eYyNdzsDuKhb5cRGOBIG6pZ036CuQkJ0qtUMD+3yLOfL5N8ws/uTkYsuSm9SDbuZu
 A2QCpvF4knYCbrNjGDaQ7booCnoNX4fj0h8k/0TPCpdV3w9xrukhvWtaP6+DmOgRV/0QDqJzqvY
 cwLuJ4ky2laRoqZo4AWoFGx3LYU1jXS7BBRsTjEbiNKr4/T7eQb9sD8j+4YDpQDjHaDoOWSSAfx
 2MK8b1DYSCgEig0Si90OgwJffJKVcZ218N3g3xjf9dBae+FCfaKwX8uTKaiRgWn0DcT80zDKN9M
 gooSPD1ZiDBx4jBIgVov2enJC/48fWR16ZSdFj9PWi6RUiLjopKhu9Jc0hg70BQN+pLzeLm53cq
 EKbxmQhXN9y6kJpzL8i+cUSxSJBgTyLVaXSqRAeoYDYORUhf054yj0YirMfbihmExVeuAjGFjNF
 GndcHvLdP1QLOdf8yIbeSohACNf496jHYw31kSCwjH0BN3CZAArZilyrZApISgSU0QlRuhOsWD+
 JYm85l4Z180Im0ktc6Z4Mwme5UK+0wGpo4C5kVpG02++jcfpdEZHTPnEyEhHmf5qlLafTs6kzrN
 6GWmTPrxDxtmvow==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have several SCM calls that require passing buffers to the TrustZone
on top of the SMC core which allocates memory for calls that require
more than 4 arguments.

Currently every user does their own thing which leads to code
duplication. Many users call dma_alloc_coherent() for every call which
is terribly unperformant (speed- and size-wise).

Provide a set of library functions for creating and managing pools of
memory which is suitable for sharing with the TrustZone, that is:
page-aligned, contiguous and non-cachable as well as provides a way of
mapping of kernel virtual addresses to physical space.

Make the allocator ready for extending with additional modes of operation
which will allow us to support the SHM bridge safety mechanism once all
users convert.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 MAINTAINERS                              |   8 +
 drivers/firmware/qcom/Kconfig            |  20 ++
 drivers/firmware/qcom/Makefile           |   1 +
 drivers/firmware/qcom/qcom_tzmem.c       | 389 +++++++++++++++++++++++++++++++
 drivers/firmware/qcom/qcom_tzmem.h       |  13 ++
 include/linux/firmware/qcom/qcom_tzmem.h |  56 +++++
 6 files changed, 487 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index dbc5d9ec3d20..305a1ea0f6be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18606,6 +18606,14 @@ F:	Documentation/networking/device_drivers/cellular/qualcomm/rmnet.rst
 F:	drivers/net/ethernet/qualcomm/rmnet/
 F:	include/linux/if_rmnet.h
 
+QUALCOMM TRUST ZONE MEMORY ALLOCATOR
+M:	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	drivers/firmware/qcom/qcom_tzmem.c
+F:	drivers/firmware/qcom/qcom_tzmem.h
+F:	include/linux/firmware/qcom/qcom_tzmem.h
+
 QUALCOMM TSENS THERMAL DRIVER
 M:	Amit Kucheria <amitk@kernel.org>
 M:	Thara Gopinath <thara.gopinath@gmail.com>
diff --git a/drivers/firmware/qcom/Kconfig b/drivers/firmware/qcom/Kconfig
index 3f05d9854ddf..3c495f8698e1 100644
--- a/drivers/firmware/qcom/Kconfig
+++ b/drivers/firmware/qcom/Kconfig
@@ -9,6 +9,26 @@ menu "Qualcomm firmware drivers"
 config QCOM_SCM
 	tristate
 
+config QCOM_TZMEM
+	tristate
+	select GENERIC_ALLOCATOR
+
+choice
+	prompt "TrustZone interface memory allocator mode"
+	default QCOM_TZMEM_MODE_GENERIC
+	help
+	  Selects the mode of the memory allocator providing memory buffers of
+	  suitable format for sharing with the TrustZone. If in doubt, select
+	  'Generic'.
+
+config QCOM_TZMEM_MODE_GENERIC
+	bool "Generic"
+	help
+	  Use the generic allocator mode. The memory is page-aligned, non-cachable
+	  and physically contiguous.
+
+endchoice
+
 config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
 	bool "Qualcomm download mode enabled by default"
 	depends on QCOM_SCM
diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Makefile
index c9f12ee8224a..0be40a1abc13 100644
--- a/drivers/firmware/qcom/Makefile
+++ b/drivers/firmware/qcom/Makefile
@@ -5,5 +5,6 @@
 
 obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
 qcom-scm-objs += qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
+obj-$(CONFIG_QCOM_TZMEM)	+= qcom_tzmem.o
 obj-$(CONFIG_QCOM_QSEECOM)	+= qcom_qseecom.o
 obj-$(CONFIG_QCOM_QSEECOM_UEFISECAPP) += qcom_qseecom_uefisecapp.o
diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
new file mode 100644
index 000000000000..3853385bf215
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -0,0 +1,389 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Memory allocator for buffers shared with the TrustZone.
+ *
+ * Copyright (C) 2023-2024 Linaro Ltd.
+ */
+
+#include <linux/bug.h>
+#include <linux/cleanup.h>
+#include <linux/dma-mapping.h>
+#include <linux/err.h>
+#include <linux/firmware/qcom/qcom_tzmem.h>
+#include <linux/genalloc.h>
+#include <linux/gfp.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+#include <linux/mm.h>
+#include <linux/radix-tree.h>
+#include <linux/slab.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#include "qcom_tzmem.h"
+
+struct qcom_tzmem_area {
+	struct list_head list;
+	void *vaddr;
+	dma_addr_t paddr;
+	size_t size;
+	void *priv;
+};
+
+struct qcom_tzmem_pool {
+	struct gen_pool *genpool;
+	struct list_head areas;
+	enum qcom_tzmem_policy policy;
+	size_t increment;
+	size_t max_size;
+	spinlock_t lock;
+};
+
+struct qcom_tzmem_chunk {
+	phys_addr_t paddr;
+	size_t size;
+	struct qcom_tzmem_pool *owner;
+};
+
+static struct device *qcom_tzmem_dev;
+static RADIX_TREE(qcom_tzmem_chunks, GFP_ATOMIC);
+static DEFINE_SPINLOCK(qcom_tzmem_chunks_lock);
+
+#if IS_ENABLED(CONFIG_QCOM_TZMEM_MODE_GENERIC)
+
+static int qcom_tzmem_init(void)
+{
+	return 0;
+}
+
+static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
+{
+	return 0;
+}
+
+static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
+{
+
+}
+
+#endif /* CONFIG_QCOM_TZMEM_MODE_GENERIC */
+
+static int qcom_tzmem_pool_add_memory(struct qcom_tzmem_pool *pool,
+				      size_t size, gfp_t gfp)
+{
+	int ret;
+
+	struct qcom_tzmem_area *area __free(kfree) = kzalloc(sizeof(*area),
+							     gfp);
+	if (!area)
+		return -ENOMEM;
+
+	area->size = PAGE_ALIGN(size);
+
+	area->vaddr = dma_alloc_coherent(qcom_tzmem_dev, area->size,
+					 &area->paddr, gfp);
+	if (!area->vaddr)
+		return -ENOMEM;
+
+	ret = qcom_tzmem_init_area(area);
+	if (ret) {
+		dma_free_coherent(qcom_tzmem_dev, area->size,
+				  area->vaddr, area->paddr);
+		return ret;
+	}
+
+	ret = gen_pool_add_virt(pool->genpool, (unsigned long)area->vaddr,
+				(phys_addr_t)area->paddr, size, -1);
+	if (ret) {
+		dma_free_coherent(qcom_tzmem_dev, area->size,
+				  area->vaddr, area->paddr);
+		return ret;
+	}
+
+	scoped_guard(spinlock_irqsave, &pool->lock)
+		list_add_tail(&area->list, &pool->areas);
+
+	area = NULL;
+	return 0;
+}
+
+/**
+ * qcom_tzmem_pool_new() - Create a new TZ memory pool.
+ * @config: Pool configuration.
+ *
+ * Create a new pool of memory suitable for sharing with the TrustZone.
+ *
+ * Must not be used in atomic context.
+ *
+ * Return: New memory pool address or ERR_PTR() on error.
+ */
+struct qcom_tzmem_pool *
+qcom_tzmem_pool_new(const struct qcom_tzmem_pool_config *config)
+{
+	int ret = -ENOMEM;
+
+	might_sleep();
+
+	switch (config->policy) {
+	case QCOM_TZMEM_POLICY_STATIC:
+		if (!config->initial_size)
+			return ERR_PTR(-EINVAL);
+		break;
+	case QCOM_TZMEM_POLICY_MULTIPLIER:
+		if (!config->increment)
+			return ERR_PTR(-EINVAL);
+		break;
+	case QCOM_TZMEM_POLICY_ON_DEMAND:
+		break;
+	default:
+		return ERR_PTR(-EINVAL);
+	}
+
+	struct qcom_tzmem_pool *pool __free(kfree) = kzalloc(sizeof(*pool),
+							     GFP_KERNEL);
+	if (!pool)
+		return ERR_PTR(-ENOMEM);
+
+	pool->genpool = gen_pool_create(PAGE_SHIFT, -1);
+	if (!pool->genpool)
+		return ERR_PTR(-ENOMEM);
+
+	gen_pool_set_algo(pool->genpool, gen_pool_best_fit, NULL);
+
+	pool->policy = config->policy;
+	pool->increment = config->increment;
+	pool->max_size = config->max_size;
+	INIT_LIST_HEAD(&pool->areas);
+	spin_lock_init(&pool->lock);
+
+	if (config->initial_size) {
+		ret = qcom_tzmem_pool_add_memory(pool, config->initial_size,
+						 GFP_KERNEL);
+		if (ret) {
+			gen_pool_destroy(pool->genpool);
+			return ERR_PTR(ret);
+		}
+	}
+
+	return no_free_ptr(pool);
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_pool_new);
+
+/**
+ * qcom_tzmem_pool_free() - Destroy a TZ memory pool and free all resources.
+ * @pool: Memory pool to free.
+ *
+ * Must not be called if any of the allocated chunks has not been freed.
+ * Must not be used in atomic context.
+ */
+void qcom_tzmem_pool_free(struct qcom_tzmem_pool *pool)
+{
+	struct qcom_tzmem_area *area, *next;
+	struct qcom_tzmem_chunk *chunk;
+	struct radix_tree_iter iter;
+	bool non_empty = false;
+	void __rcu **slot;
+
+	might_sleep();
+
+	if (!pool)
+		return;
+
+	scoped_guard(spinlock_irqsave, &qcom_tzmem_chunks_lock) {
+		radix_tree_for_each_slot(slot, &qcom_tzmem_chunks, &iter, 0) {
+			chunk = radix_tree_deref_slot_protected(slot,
+						&qcom_tzmem_chunks_lock);
+
+			if (chunk->owner == pool)
+				non_empty = true;
+		}
+	}
+
+	WARN(non_empty, "Freeing TZ memory pool with memory still allocated");
+
+	list_for_each_entry_safe(area, next, &pool->areas, list) {
+		list_del(&area->list);
+		qcom_tzmem_cleanup_area(area);
+		dma_free_coherent(qcom_tzmem_dev, area->size,
+				  area->vaddr, area->paddr);
+		kfree(area);
+	}
+
+	gen_pool_destroy(pool->genpool);
+	kfree(pool);
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_pool_free);
+
+static void devm_qcom_tzmem_pool_free(void *data)
+{
+	struct qcom_tzmem_pool *pool = data;
+
+	qcom_tzmem_pool_free(pool);
+}
+
+/**
+ * devm_qcom_tzmem_pool_new() - Managed variant of qcom_tzmem_pool_new().
+ * @dev: Device managing this resource.
+ * @config: Pool configuration.
+ *
+ * Must not be used in atomic context.
+ *
+ * Return: Address of the managed pool or ERR_PTR() on failure.
+ */
+struct qcom_tzmem_pool *
+devm_qcom_tzmem_pool_new(struct device *dev,
+			 const struct qcom_tzmem_pool_config *config)
+{
+	struct qcom_tzmem_pool *pool;
+	int ret;
+
+	pool = qcom_tzmem_pool_new(config);
+	if (IS_ERR(pool))
+		return pool;
+
+	ret = devm_add_action_or_reset(dev, devm_qcom_tzmem_pool_free, pool);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return pool;
+}
+
+static bool qcom_tzmem_try_grow_pool(struct qcom_tzmem_pool *pool,
+				     size_t requested, gfp_t gfp)
+{
+	size_t current_size = gen_pool_size(pool->genpool);
+
+	if (pool->max_size && (current_size + requested) > pool->max_size)
+		return false;
+
+	switch (pool->policy) {
+	case QCOM_TZMEM_POLICY_STATIC:
+		return false;
+	case QCOM_TZMEM_POLICY_MULTIPLIER:
+		requested = current_size * pool->increment;
+		break;
+	case QCOM_TZMEM_POLICY_ON_DEMAND:
+		break;
+	}
+
+	return !qcom_tzmem_pool_add_memory(pool, requested, gfp);
+}
+
+/**
+ * qcom_tzmem_alloc() - Allocate a memory chunk suitable for sharing with TZ.
+ * @pool: TZ memory pool from which to allocate memory.
+ * @size: Number of bytes to allocate.
+ * @gfp: GFP flags.
+ *
+ * Can be used in any context.
+ *
+ * Return:
+ * Address of the allocated buffer or NULL if no more memory can be allocated.
+ * The buffer must be released using qcom_tzmem_free().
+ */
+void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp)
+{
+	unsigned long vaddr;
+	int ret;
+
+	if (!size)
+		return NULL;
+
+	size = PAGE_ALIGN(size);
+
+	struct qcom_tzmem_chunk *chunk __free(kfree) = kzalloc(sizeof(*chunk),
+							       gfp);
+	if (!chunk)
+		return NULL;
+
+again:
+	vaddr = gen_pool_alloc(pool->genpool, size);
+	if (!vaddr) {
+		if (qcom_tzmem_try_grow_pool(pool, size, gfp))
+			goto again;
+
+		return NULL;
+	}
+
+	chunk->paddr = gen_pool_virt_to_phys(pool->genpool, vaddr);
+	chunk->size = size;
+	chunk->owner = pool;
+
+	scoped_guard(spinlock_irqsave, &qcom_tzmem_chunks_lock) {
+		ret = radix_tree_insert(&qcom_tzmem_chunks, vaddr, chunk);
+		if (ret) {
+			gen_pool_free(pool->genpool, vaddr, size);
+			return NULL;
+		}
+
+		chunk = NULL;
+	}
+
+	return (void *)vaddr;
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_alloc);
+
+/**
+ * qcom_tzmem_free() - Release a buffer allocated from a TZ memory pool.
+ * @vaddr: Virtual address of the buffer.
+ *
+ * Can be used in any context.
+ */
+void qcom_tzmem_free(void *vaddr)
+{
+	struct qcom_tzmem_chunk *chunk;
+
+	scoped_guard(spinlock_irqsave, &qcom_tzmem_chunks_lock)
+		chunk = radix_tree_delete_item(&qcom_tzmem_chunks,
+					       (unsigned long)vaddr, NULL);
+
+	if (!chunk) {
+		WARN(1, "Virtual address %p not owned by TZ memory allocator",
+		     vaddr);
+		return;
+	}
+
+	scoped_guard(spinlock_irqsave, &chunk->owner->lock)
+		gen_pool_free(chunk->owner->genpool, (unsigned long)vaddr,
+			      chunk->size);
+	kfree(chunk);
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_free);
+
+/**
+ * qcom_tzmem_to_phys() - Map the virtual address of a TZ buffer to physical.
+ * @vaddr: Virtual address of the buffer allocated from a TZ memory pool.
+ *
+ * Can be used in any context. The address must have been returned by a call
+ * to qcom_tzmem_alloc().
+ *
+ * Returns: Physical address of the buffer.
+ */
+phys_addr_t qcom_tzmem_to_phys(void *vaddr)
+{
+	struct qcom_tzmem_chunk *chunk;
+
+	guard(spinlock_irqsave)(&qcom_tzmem_chunks_lock);
+
+	chunk = radix_tree_lookup(&qcom_tzmem_chunks, (unsigned long)vaddr);
+	if (!chunk)
+		return 0;
+
+	return chunk->paddr;
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_to_phys);
+
+int qcom_tzmem_enable(struct device *dev)
+{
+	if (qcom_tzmem_dev)
+		return -EBUSY;
+
+	qcom_tzmem_dev = dev;
+
+	return qcom_tzmem_init();
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_enable);
+
+MODULE_DESCRIPTION("TrustZone memory allocator for Qualcomm firmware drivers");
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/firmware/qcom/qcom_tzmem.h b/drivers/firmware/qcom/qcom_tzmem.h
new file mode 100644
index 000000000000..8fa8a3eb940e
--- /dev/null
+++ b/drivers/firmware/qcom/qcom_tzmem.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023-2024 Linaro Ltd.
+ */
+
+#ifndef __QCOM_TZMEM_PRIV_H
+#define __QCOM_TZMEM_PRIV_H
+
+struct device;
+
+int qcom_tzmem_enable(struct device *dev);
+
+#endif /* __QCOM_TZMEM_PRIV_H */
diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
new file mode 100644
index 000000000000..b83b63a0c049
--- /dev/null
+++ b/include/linux/firmware/qcom/qcom_tzmem.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023-2024 Linaro Ltd.
+ */
+
+#ifndef __QCOM_TZMEM_H
+#define __QCOM_TZMEM_H
+
+#include <linux/cleanup.h>
+#include <linux/gfp.h>
+#include <linux/types.h>
+
+struct device;
+struct qcom_tzmem_pool;
+
+/**
+ * enum qcom_tzmem_policy - Policy for pool growth.
+ */
+enum qcom_tzmem_policy {
+	/**< Static pool, never grow above initial size. */
+	QCOM_TZMEM_POLICY_STATIC = 1,
+	/**< When out of memory, add increment * current size of memory. */
+	QCOM_TZMEM_POLICY_MULTIPLIER,
+	/**< When out of memory add as much as is needed until max_size. */
+	QCOM_TZMEM_POLICY_ON_DEMAND,
+};
+
+/**
+ * struct qcom_tzmem_pool_config - TZ memory pool configuration.
+ * @initial_size: Number of bytes to allocate for the pool during its creation.
+ * @policy: Pool size growth policy.
+ * @increment: Used with policies that allow pool growth.
+ * @max_size: Size above which the pool will never grow.
+ */
+struct qcom_tzmem_pool_config {
+	size_t initial_size;
+	enum qcom_tzmem_policy policy;
+	size_t increment;
+	size_t max_size;
+};
+
+struct qcom_tzmem_pool *
+qcom_tzmem_pool_new(const struct qcom_tzmem_pool_config *config);
+void qcom_tzmem_pool_free(struct qcom_tzmem_pool *pool);
+struct qcom_tzmem_pool *
+devm_qcom_tzmem_pool_new(struct device *dev,
+			 const struct qcom_tzmem_pool_config *config);
+
+void *qcom_tzmem_alloc(struct qcom_tzmem_pool *pool, size_t size, gfp_t gfp);
+void qcom_tzmem_free(void *ptr);
+
+DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
+
+phys_addr_t qcom_tzmem_to_phys(void *ptr);
+
+#endif /* __QCOM_TZMEM */

-- 
2.43.0


