Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79734394985
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 02:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbhE2A06 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 20:26:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbhE2A05 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 20:26:57 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E443C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 17:25:21 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id b18so3640462lfv.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 May 2021 17:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=khM8ENZRiO9GfrYZWjrb0BjgVR9cdtd9zq05AkI4UO4=;
        b=ZDBw+iBt/3RegQRJ6kZ2Bow9ygm56XgFbr1rxodRCeVpxPKIAB0TSIm8WMFbKfyokj
         f82cHgyaBSkgSjIoPcRfIOAFYNBhWbD3E96iZiYJmoaB025ZgomsZb/BK/4baPp2stMM
         H8rwtBAnqcAV8GhfWRTEpHmrUTg3Ifk5AMMtD266gbePuxZqdzBnZrguCTndviz5/qKH
         0z85ln7LihtyR8t5dHNL9BrgyHnD4Z0JlX9wtnn5q9PaDofoLSlwxhweOK5z8d1ODRnS
         X0ehSo+O+AUrk0zDfigbjDWmp7Zjf+F8H03afbv5LXktBguoCedNLwD8pPthHodRIxcC
         Ij8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=khM8ENZRiO9GfrYZWjrb0BjgVR9cdtd9zq05AkI4UO4=;
        b=IGnK3zbj4+u0ku5uKvHOorl4kfVeTourkiQvpNYVWBWO8S+6+PXlPOExGaiOqN9GE3
         pKod8py6W0pemS6Ct1hTQ3aIBbvGWBPrly9VQn7y6/Awk1KjO6bEJVil3Dxw3NWZnDIh
         oKwjSiBg0cjEN6ZnIAw4lBqTmsFzbx/x5HqJrYcilPrHOkPwl3kuBoEz4OBnHjWUi9EB
         KO0FILXvRs/4tB+y3Ys7Crc5B5sHfS0B/wyR7G/qAPSpI/SU1EsJr3KasCw5h+xEObKv
         bO9N2N5kOxIq0dh66B8SzGb7ZvPw7UjHEdC8mymZpMwrYg1iuHs8HBj2wkDjex2XVZ5i
         3zmA==
X-Gm-Message-State: AOAM532aHb/8DX6TZULbZkVg3nu/9Qko53MfcyOiav6IbwUlDx9bTCH2
        EUGMutOFrk2U6GN7N40YZidY+Q==
X-Google-Smtp-Source: ABdhPJzViGkFYdy0GZRVC394LaUSWkHKNFjQP9sGC8uM03eDznb+laNRV5DtTm28p0VJ+NyKwrhRtQ==
X-Received: by 2002:ac2:5fae:: with SMTP id s14mr8040712lfe.588.1622247919684;
        Fri, 28 May 2021 17:25:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c8sm701078ljd.82.2021.05.28.17.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 17:25:19 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [RFC 5/8] lib: add small API for handling register snapshots
Date:   Sat, 29 May 2021 03:25:05 +0300
Message-Id: <20210529002508.3839467-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
References: <20210529002508.3839467-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add small API covering lists of register dumps. Currently this is a part
of MSM DRM driver, but is extracted as it might be usefull to other
drivers too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 include/linux/dump_state.h | 78 ++++++++++++++++++++++++++++++++++++++
 lib/Kconfig                |  3 ++
 lib/Makefile               |  1 +
 lib/dump_state.c           | 51 +++++++++++++++++++++++++
 4 files changed, 133 insertions(+)
 create mode 100644 include/linux/dump_state.h
 create mode 100644 lib/dump_state.c

diff --git a/include/linux/dump_state.h b/include/linux/dump_state.h
new file mode 100644
index 000000000000..9cf2cd2e99a6
--- /dev/null
+++ b/include/linux/dump_state.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Linaro Ltd
+ */
+
+#ifndef LINUX_DUMP_STATE_H
+#define LINUX_DUMP_STATE_H
+
+#include <linux/list.h>
+#include <linux/sizes.h>
+
+/**
+ * struct dump_state_block - structure to store each hardware block state
+ * @name: name of the block
+ * @drm_dev: handle to the linked list head
+ * @size: size of the register space of this hardware block
+ * @state: array holding the register dump of this hardware block
+ * @base_addr: starting address of this hardware block's register space
+ */
+struct dump_state_block {
+	char name[SZ_128];
+	struct list_head node;
+	void __iomem *base_addr;
+	size_t size;
+	u8 state[0] __aligned(8);
+};
+
+/**
+ * struct dump_state - structure to store reg dump state
+ * @blocks: hardware blocks info related to this dump state
+ */
+struct dump_state {
+	struct list_head blocks;
+};
+
+static inline void dump_state_init(struct dump_state *state)
+{
+	INIT_LIST_HEAD(&state->blocks);
+}
+
+#define dump_state_for_each_block(state, block) \
+	list_for_each_entry(block, &(state)->blocks, node)
+
+/**
+ * dump_state_free_blocks - free allocated blocks
+ * @state:	    handle to struct dump_state
+ */
+void dump_state_free_blocks(struct dump_state *state);
+
+/**
+ * dump_state_allocate_block - allocate data block for register dumps
+ * @len:            size of the register space of the hardware block
+ * @base_addr:      starting address of the register space of the hardware block
+ * @gfp:            type of memory allocation
+ * @fmt:            format in which the block names need to be printed
+ *
+ * Returns: new block
+ */
+extern __printf(4, 5)
+struct dump_state_block *dump_state_allocate_block(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, ...);
+
+/**
+ * dump_state_allocate_block_va - allocate data block for register dumps
+ * @len:            size of the register space of the hardware block
+ * @base_addr:      starting address of the register space of the hardware block
+ * @gfp:            type of memory allocation
+ * @fmt:            format in which the block names need to be printed
+ *
+ * Returns: new block
+ */
+extern __printf(4, 0)
+struct dump_state_block *dump_state_allocate_block_va(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, va_list args);
+
+#define dump_state_add_block(state, block) \
+	list_add_tail(&(state)->blocks, &(block)->node)
+
+#endif
diff --git a/lib/Kconfig b/lib/Kconfig
index ac3b30697b2b..ab654232ecb6 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -704,3 +704,6 @@ config PLDMFW
 
 config ASN1_ENCODER
        tristate
+
+config DUMP_STATE
+	tristate
diff --git a/lib/Makefile b/lib/Makefile
index 2cc359ec1fdd..4836a0e3aef2 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -356,3 +356,4 @@ obj-$(CONFIG_BITS_TEST) += test_bits.o
 obj-$(CONFIG_CMDLINE_KUNIT_TEST) += cmdline_kunit.o
 
 obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
+obj-$(CONFIG_DUMP_STATE) += dump_state.o
diff --git a/lib/dump_state.c b/lib/dump_state.c
new file mode 100644
index 000000000000..58d88be65c0a
--- /dev/null
+++ b/lib/dump_state.c
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Linaro Ltd
+ */
+
+#include <linux/dump_state.h>
+#include <linux/slab.h>
+
+void dump_state_free_blocks(struct dump_state *state)
+{
+	struct dump_state_block *block, *tmp;
+
+	list_for_each_entry_safe(block, tmp, &state->blocks, node) {
+		list_del(&block->node);
+		kfree(block);
+	}
+}
+EXPORT_SYMBOL(dump_state_free_blocks);
+
+struct dump_state_block *dump_state_allocate_block_va(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, va_list args)
+{
+	struct dump_state_block *block = kzalloc(sizeof(*block) + len, gfp);
+
+	if (!block)
+		return ERR_PTR(-ENOMEM);
+
+	vsnprintf(block->name, sizeof(block->name), fmt, args);
+
+	INIT_LIST_HEAD(&block->node);
+	block->size = len;
+	block->base_addr = base_addr;
+
+	return block;
+}
+EXPORT_SYMBOL(dump_state_allocate_block);
+
+struct dump_state_block *dump_state_allocate_block(void __iomem *base_addr, size_t len, gfp_t gfp, const char *fmt, ...)
+{
+	struct dump_state_block *block;
+	va_list va;
+
+	va_start(va, fmt);
+
+	block = dump_state_allocate_block_va(base_addr, len, gfp, fmt, va);
+
+	va_end(va);
+
+	return block;
+}
+EXPORT_SYMBOL(dump_state_allocate_block_va);
-- 
2.30.2

