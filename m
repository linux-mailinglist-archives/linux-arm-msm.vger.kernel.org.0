Return-Path: <linux-arm-msm+bounces-73367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E66B552EB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 17:15:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF7E9189AF62
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 15:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA9AC32ED40;
	Fri, 12 Sep 2025 15:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AKjzJCNu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB8932ED21
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 15:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689870; cv=none; b=PfBwc0oqWHIPtjP5kiQM8YVUyjfzDQtRy02AJEh+2GH8KfevVUZf9/Au/uFd5G4i3h/edgSpgeJw9UD2t7PCPsY2L5AV9oUW0XyS0rk0PHJGzgbg08jnhY5MXY/G6NNkZz8YZBLLTbOoXFarIAd8/x9jAE6Iw2/PDKym5DczeIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689870; c=relaxed/simple;
	bh=HUD4Mjc5wMBAw/SAWwLyhxv8mf9k+BoSYkr0D6u7wvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gas+2y162Zl3gj1Lii/s+QsUJD7aybYt3hvoSDo5IaNKWicpiZl2cZ6H+gnT8PbltWnQ3z1N6OHZAjX+i9gd4s1zkmxFXj/g7b8VlnMN0kg2qHSQ9vhlOmnAP/nVMkyXBI5C61RRaf26m0C51lMWxwfeOzNDmLvJv69s7KJj3zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AKjzJCNu; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-72267c05111so15230507b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757689868; x=1758294668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgoQ+woT/93cBsRw8kKeoK5/i5b3BJOE5ioHeOB3mNE=;
        b=AKjzJCNuqfuNkKu/VY2j98CAAa6ccyfjrnZ0yHYAqqlYremzksSlk347ea78qE6QTJ
         pXgun726DA8jIrcyHiabYvPFutlE2KoUT1NUmrgIBBTqUycpB0Jd7DpDrIajJq865I9Y
         DXnANmRo1GlOYOfirfAUaMwofDRHL4o1Q0WPEY/mQiOAx0jedN0xmhPXizBAje6kZ2uy
         zNMTaAubhD0d70tcU9ZHViggY0ifEV4U68nYQwFR/z08p3ZObeSSTnC0m32YbkPlW8qE
         St7Ic0RYZrZ6Cix+wQvCABy0D5PQAyo8aGgjzzy/26f6PLlWS8fepfgwlXhs5NA9huLm
         FcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757689868; x=1758294668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgoQ+woT/93cBsRw8kKeoK5/i5b3BJOE5ioHeOB3mNE=;
        b=J9iPe0WJXwC12c4CUvS6k+R+qwmrbbGzQ5vgtzMaaHQjL93CMWq1rBYI/uQzay2A4A
         AMoX1IXcmX0sRUGDFmYHKj1/yI1HgRUB+6p4yJ5cQkZVuDW3iD9WPFPmlHr/zG1KNs9O
         NIv4sMUAMPTPM1wH7idrLEwBiCYCGCbGjZzv7E9xQwezNB58mZJb4hp+Gj45J7b4muaG
         Bj9By6EOekXVS+nCvCGYus62EhD7u6xjHtbmc9SO8vaqHwz+MyFZkP2n0TavyrsFCgch
         6uzsW2xLIIy/e264ewDeEE7BiAryEV/6AR4oIgoSqLM2fXcI7nWg3Vg2DzB0gcb0P/GH
         Xh5Q==
X-Gm-Message-State: AOJu0YxXUhsRvAqaeA83BVDyrnFmqaWNg9nnZ/NDi6Sk9meZMvPq2M+M
	sSP7vfD52BXrbaTVLJ2o0BLPp7qwwZEFBuXQ1xNQug6BUJ10K4RfbSDUEYF0KmkSwfaFq2DVeRh
	2VRzf4xeytw==
X-Gm-Gg: ASbGncvORgYoCqs0BE8gVxt4u0VbKfsRMW3w4aDKpnhsF94fZ7qq+Qvnxzc1lEVWdvf
	J4ljifcrImhn6mK7ltArphkZb/rINs61Tsrze+tktFqzO9jmhH+Dk8THzDcOdW+9TKSqi1dw5qC
	E+NAveKfg8w70jg4HGr26iKOI2CoFP+lvExzP+f03lNmjwfYrD0sY9W4ZOOys7pDDhfxbHOrAYQ
	aTST+Eqm6KLajohXxsuo5eXcRER8AEfXQsn7hZH/35IDNuwc82o1TeeuiBbbRruzYtgAOxx32hN
	gTz5vN4mUK5eyR2T8iR4M11H/6usW0Vp9JO7TleWc6ggr6ijRx/N7GJnFoqjo8E+TG6xvsiZwQs
	3mQIdM1qAb25vsdJIkN6jKWEKKMPmNqupqA==
X-Google-Smtp-Source: AGHT+IGUcGV4IM3PVToM3wIMhJFlncT19Inxpe70tej0adAKBemPa7cOoqolhGXuc6qPV6B9GeZ9vg==
X-Received: by 2002:a05:690c:f92:b0:70e:2d17:84b5 with SMTP id 00721157ae682-7305f99fd82mr33784177b3.0.1757689867582;
        Fri, 12 Sep 2025 08:11:07 -0700 (PDT)
Received: from eugen-station.. ([145.224.119.89])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-624841586c1sm1302244d50.6.2025.09.12.08.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 08:11:07 -0700 (PDT)
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
Subject: [RFC][PATCH v3 15/16] kmemdump: Add Kinfo backend driver
Date: Fri, 12 Sep 2025 18:08:54 +0300
Message-ID: <20250912150855.2901211-16-eugen.hristev@linaro.org>
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

Add Kinfo backend driver.
This backend driver will select only regions of interest for the firmware,
and it copy those into a shared memory area that is supplied via OF.
The firmware is only interested in addresses for some symbols.
The list format is kinfo-compatible, with devices like Google Pixel phone.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 MAINTAINERS               |   5 +
 mm/kmemdump/Kconfig.debug |  13 ++
 mm/kmemdump/Makefile      |   1 +
 mm/kmemdump/kinfo.c       | 293 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 312 insertions(+)
 create mode 100644 mm/kmemdump/kinfo.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8234acb24cbc..65d9e5db46a9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13818,6 +13818,11 @@ F:	include/linux/kmemdump.h
 F:	mm/kmemdump/kmemdump.c
 F:	mm/kmemdump/kmemdump_coreimage.c
 
+KMEMDUMP KINFO BACKEND DRIVER
+M:	Eugen Hristev <eugen.hristev@linaro.org>
+S:	Maintained
+F:	mm/kmemdump/kinfo.c
+
 KMEMDUMP QCOM MINIDUMP BACKEND DRIVER
 M:	Eugen Hristev <eugen.hristev@linaro.org>
 S:	Maintained
diff --git a/mm/kmemdump/Kconfig.debug b/mm/kmemdump/Kconfig.debug
index 91cec45bc3ca..ff88bf8017ae 100644
--- a/mm/kmemdump/Kconfig.debug
+++ b/mm/kmemdump/Kconfig.debug
@@ -38,3 +38,16 @@ config KMEMDUMP_QCOM_MINIDUMP_BACKEND
 	  into the minidump table of contents. Further on, the firmware
 	  will be able to read the table of contents and extract the
 	  memory regions on case-by-case basis.
+
+config KMEMDUMP_KINFO_BACKEND
+	tristate "Shared memory KInfo compatible backend"
+	depends on KMEMDUMP
+	select VMCORE_INFO
+	help
+	  Say y here to enable the Shared memory KInfo compatible backend
+	  driver.
+	  With this backend, the registered regions are copied to a shared
+	  memory zone at register time.
+	  The shared memory zone is supplied via OF.
+	  This backend will select only regions that are of interest,
+	  and keep only addresses. The format of the list is Kinfo compatible.
diff --git a/mm/kmemdump/Makefile b/mm/kmemdump/Makefile
index 6ec3871203ef..1ec94ee6c008 100644
--- a/mm/kmemdump/Makefile
+++ b/mm/kmemdump/Makefile
@@ -3,3 +3,4 @@
 obj-y += kmemdump.o
 obj-$(CONFIG_KMEMDUMP_COREIMAGE) += kmemdump_coreimage.o
 obj-$(CONFIG_KMEMDUMP_QCOM_MINIDUMP_BACKEND) += qcom_minidump.o
+obj-$(CONFIG_KMEMDUMP_KINFO_BACKEND) += kinfo.o
diff --git a/mm/kmemdump/kinfo.c b/mm/kmemdump/kinfo.c
new file mode 100644
index 000000000000..9f0ec8a1aaa2
--- /dev/null
+++ b/mm/kmemdump/kinfo.c
@@ -0,0 +1,293 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *
+ * Copyright 2002 Rusty Russell <rusty@rustcorp.com.au> IBM Corporation
+ * Copyright 2021 Google LLC
+ * Copyright 2025 Linaro Ltd. Eugen Hristev <eugen.hristev@linaro.org>
+ */
+#include <linux/platform_device.h>
+#include <linux/kallsyms.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/kmemdump.h>
+#include <linux/module.h>
+#include <linux/utsname.h>
+
+#define BUILD_INFO_LEN		256
+#define DEBUG_KINFO_MAGIC	0xCCEEDDFF
+
+/*
+ * Header structure must be byte-packed, since the table is provided to
+ * bootloader.
+ */
+struct kernel_info {
+	/* For kallsyms */
+	__u8 enabled_all;
+	__u8 enabled_base_relative;
+	__u8 enabled_absolute_percpu;
+	__u8 enabled_cfi_clang;
+	__u32 num_syms;
+	__u16 name_len;
+	__u16 bit_per_long;
+	__u16 module_name_len;
+	__u16 symbol_len;
+	__u64 _relative_pa;
+	__u64 _text_pa;
+	__u64 _stext_pa;
+	__u64 _etext_pa;
+	__u64 _sinittext_pa;
+	__u64 _einittext_pa;
+	__u64 _end_pa;
+	__u64 _offsets_pa;
+	__u64 _names_pa;
+	__u64 _token_table_pa;
+	__u64 _token_index_pa;
+	__u64 _markers_pa;
+	__u64 _seqs_of_names_pa;
+
+	/* For frame pointer */
+	__u32 thread_size;
+
+	/* For virt_to_phys */
+	__u64 swapper_pg_dir_pa;
+
+	/* For linux banner */
+	__u8 last_uts_release[__NEW_UTS_LEN];
+
+	/* Info of running build */
+	__u8 build_info[BUILD_INFO_LEN];
+
+	/* For module kallsyms */
+	__u32 enabled_modules_tree_lookup;
+	__u32 mod_mem_offset;
+	__u32 mod_kallsyms_offset;
+} __packed;
+
+struct kernel_all_info {
+	__u32 magic_number;
+	__u32 combined_checksum;
+	struct kernel_info info;
+} __packed;
+
+struct debug_kinfo {
+	struct device *dev;
+	void *all_info_addr;
+	u32 all_info_size;
+	struct kmemdump_backend kinfo_be;
+};
+
+static struct debug_kinfo *kinfo;
+
+#define be_to_kinfo(be) container_of(be, struct debug_kinfo, kinfo_be)
+
+static void update_kernel_all_info(struct kernel_all_info *all_info)
+{
+	int index;
+	struct kernel_info *info;
+	u32 *checksum_info;
+
+	all_info->magic_number = DEBUG_KINFO_MAGIC;
+	all_info->combined_checksum = 0;
+
+	info = &all_info->info;
+	checksum_info = (u32 *)info;
+	for (index = 0; index < sizeof(*info) / sizeof(u32); index++)
+		all_info->combined_checksum ^= checksum_info[index];
+}
+
+static int build_info_set(const char *str, const struct kernel_param *kp)
+{
+	struct kernel_all_info *all_info = kinfo->all_info_addr;
+	size_t build_info_size;
+
+	if (kinfo->all_info_addr == 0 || kinfo->all_info_size == 0)
+		return -ENAVAIL;
+
+	all_info = (struct kernel_all_info *)kinfo->all_info_addr;
+	build_info_size = sizeof(all_info->info.build_info);
+
+	memcpy(&all_info->info.build_info, str, min(build_info_size - 1,
+						    strlen(str)));
+	update_kernel_all_info(all_info);
+
+	if (strlen(str) > build_info_size) {
+		pr_warn("%s: Build info buffer (len: %zd) can't hold entire string '%s'\n",
+			__func__, build_info_size, str);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static const struct kernel_param_ops build_info_op = {
+	.set = build_info_set,
+};
+
+module_param_cb(build_info, &build_info_op, NULL, 0200);
+MODULE_PARM_DESC(build_info, "Write build info to field 'build_info' of debug kinfo.");
+
+static int register_kinfo_region(const struct kmemdump_backend *be,
+				 enum kmemdump_uid id, void *vaddr, size_t size)
+{
+	struct debug_kinfo *kinfo = be_to_kinfo(be);
+	struct kernel_all_info *all_info = kinfo->all_info_addr;
+	struct kernel_info *info = &all_info->info;
+	struct uts_namespace *uts;
+
+	switch (id) {
+	case KMEMDUMP_ID_COREIMAGE__sinittext:
+		info->_sinittext_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE__einittext:
+		info->_einittext_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE__end:
+		info->_end_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE__text:
+		info->_text_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE__stext:
+		info->_stext_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE__etext:
+		info->_etext_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_num_syms:
+		info->num_syms = *(__u32 *)vaddr;
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_relative_base:
+		info->_relative_pa = (u64)__pa(*(u64 *)vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_offsets:
+		info->_offsets_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_names:
+		info->_names_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_token_table:
+		info->_token_table_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_token_index:
+		info->_token_index_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_markers:
+		info->_markers_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_kallsyms_seqs_of_names:
+		info->_seqs_of_names_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_swapper_pg_dir:
+		info->swapper_pg_dir_pa = (u64)__pa(vaddr);
+		break;
+	case KMEMDUMP_ID_COREIMAGE_init_uts_ns:
+		uts = vaddr;
+		strscpy(info->last_uts_release, uts->name.release, __NEW_UTS_LEN);
+		break;
+	default:
+		break;
+	};
+
+	update_kernel_all_info(all_info);
+	return 0;
+}
+
+static int unregister_kinfo_region(const struct kmemdump_backend *be,
+				   enum kmemdump_uid id)
+{
+	return 0;
+}
+
+static int debug_kinfo_probe(struct platform_device *pdev)
+{
+	struct device_node *mem_region;
+	struct reserved_mem *rmem;
+	struct kernel_info *info;
+	struct kernel_all_info *all_info;
+
+	mem_region = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
+	if (!mem_region) {
+		dev_warn(&pdev->dev, "no such memory-region\n");
+		return -ENODEV;
+	}
+
+	rmem = of_reserved_mem_lookup(mem_region);
+	if (!rmem) {
+		dev_warn(&pdev->dev, "no such reserved mem of node name %s\n",
+			 pdev->dev.of_node->name);
+		return -ENODEV;
+	}
+
+	/* Need to wait for reserved memory to be mapped */
+	if (!rmem->priv)
+		return -EPROBE_DEFER;
+
+	if (!rmem->base || !rmem->size) {
+		dev_warn(&pdev->dev, "unexpected reserved memory\n");
+		return -EINVAL;
+	}
+
+	if (rmem->size < sizeof(struct kernel_all_info)) {
+		dev_warn(&pdev->dev, "unexpected reserved memory size\n");
+		return -EINVAL;
+	}
+
+	kinfo = kzalloc(sizeof(*kinfo), GFP_KERNEL);
+	if (!kinfo)
+		return -ENOMEM;
+
+	kinfo->dev = &pdev->dev;
+
+	strscpy(kinfo->kinfo_be.name, "debug_kinfo");
+	kinfo->kinfo_be.register_region = register_kinfo_region;
+	kinfo->kinfo_be.unregister_region = unregister_kinfo_region;
+	kinfo->all_info_addr = rmem->priv;
+	kinfo->all_info_size = rmem->size;
+
+	all_info = kinfo->all_info_addr;
+
+	memset(all_info, 0, sizeof(struct kernel_all_info));
+	info = &all_info->info;
+	info->enabled_all = IS_ENABLED(CONFIG_KALLSYMS_ALL);
+	info->enabled_absolute_percpu = IS_ENABLED(CONFIG_KALLSYMS_ABSOLUTE_PERCPU);
+	info->enabled_base_relative = IS_ENABLED(CONFIG_KALLSYMS_BASE_RELATIVE);
+	info->enabled_cfi_clang = IS_ENABLED(CONFIG_CFI_CLANG);
+	info->name_len = KSYM_NAME_LEN;
+	info->bit_per_long = BITS_PER_LONG;
+	info->module_name_len = MODULE_NAME_LEN;
+	info->symbol_len = KSYM_SYMBOL_LEN;
+	info->thread_size = THREAD_SIZE;
+	info->enabled_modules_tree_lookup = IS_ENABLED(CONFIG_MODULES_TREE_LOOKUP);
+	info->mod_mem_offset = offsetof(struct module, mem);
+	info->mod_kallsyms_offset = offsetof(struct module, kallsyms);
+
+	return kmemdump_register_backend(&kinfo->kinfo_be);
+}
+
+static void debug_kinfo_remove(struct platform_device *pdev)
+{
+	kfree(kinfo);
+	kmemdump_unregister_backend(&kinfo->kinfo_be);
+}
+
+static const struct of_device_id debug_kinfo_of_match[] = {
+	{ .compatible	= "google,debug-kinfo" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, debug_kinfo_of_match);
+
+static struct platform_driver debug_kinfo_driver = {
+	.probe = debug_kinfo_probe,
+	.remove = debug_kinfo_remove,
+	.driver = {
+		.name = "debug-kinfo",
+		.of_match_table = of_match_ptr(debug_kinfo_of_match),
+	},
+};
+module_platform_driver(debug_kinfo_driver);
+
+MODULE_AUTHOR("Eugen Hristev <eugen.hristev@linaro.org>");
+MODULE_AUTHOR("Jone Chou <jonechou@google.com>");
+MODULE_DESCRIPTION("kmemdump Kinfo Driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


