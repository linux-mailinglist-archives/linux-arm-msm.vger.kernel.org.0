Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45C25151FCC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2020 18:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727507AbgBDRo3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Feb 2020 12:44:29 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:55374 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbgBDRo2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Feb 2020 12:44:28 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id C903727E058F;
        Tue,  4 Feb 2020 18:44:25 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 4WGLBfY4YjDl; Tue,  4 Feb 2020 18:44:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id E84D327E167F;
        Tue,  4 Feb 2020 18:44:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu E84D327E167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1580838264;
        bh=8wiJQBti4vPAr2jhTr5E2seOWp5XeIkMbSxfFO5TqVI=;
        h=From:To:Date:Message-Id;
        b=P0YqHFmaJNA5Mma8FNfbnyy7NMhawB6Ddl71Y3sVRzw7AFeI5qLDyGyTEnXeffqpA
         aD/MNv2IuvLqzvlMUccBp7RwUdsCfHvfyX9/BP6IjSxzf6y9DgugTidFvgkwlZSD+M
         3Kfn8W7nrXlDvOQ69Rbs+qIQo8OIME6dzWjTaaXM=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id OMRxddzq87Ep; Tue,  4 Feb 2020 18:44:24 +0100 (CET)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id C231127E1660;
        Tue,  4 Feb 2020 18:44:24 +0100 (CET)
From:   Clement Leger <cleger@kalray.eu>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-remoteproc@vger.kernel.org
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Loic PALLARDY <loic.pallardy@st.com>, s-anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Clement Leger <cleger@kalray.eu>
Subject: [PATCH v3 2/2] remoteproc: Add elf64 support in elf loader
Date:   Tue,  4 Feb 2020 18:44:12 +0100
Message-Id: <20200204174412.16814-3-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
In-Reply-To: <20200204174412.16814-1-cleger@kalray.eu>
References: <20200129163013.GA16538@xps15>
 <20200204174412.16814-1-cleger@kalray.eu>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

elf32 and elf64 mainly differ by their types. In order to avoid
copy/pasting the whole loader code, generate static inline functions
which will access values according to the elf class. It allows to keep a
common loader basis.
In order to accommodate both elf types sizes, the maximum size for a
elf header member is chosen using the maximum value of both elf class.

Signed-off-by: Clement Leger <cleger@kalray.eu>
Tested-by: Arnaud POULIQUEN <arnaud.pouliquen@st.com>
---
 Documentation/remoteproc.txt               |   2 +-
 drivers/remoteproc/remoteproc_elf_loader.c | 147 ++++++++++++++++++-----------
 drivers/remoteproc/remoteproc_elf_loader.h |  69 ++++++++++++++
 drivers/remoteproc/remoteproc_internal.h   |   2 +-
 drivers/remoteproc/st_remoteproc.c         |   2 +-
 include/linux/remoteproc.h                 |   4 +-
 6 files changed, 167 insertions(+), 59 deletions(-)
 create mode 100644 drivers/remoteproc/remoteproc_elf_loader.h

diff --git a/Documentation/remoteproc.txt b/Documentation/remoteproc.txt
index 03c3d2e568b0..2be1147256e0 100644
--- a/Documentation/remoteproc.txt
+++ b/Documentation/remoteproc.txt
@@ -230,7 +230,7 @@ in the used rings.
 Binary Firmware Structure
 =========================
 
-At this point remoteproc only supports ELF32 firmware binaries. However,
+At this point remoteproc supports ELF32 and ELF64 firmware binaries. However,
 it is quite expected that other platforms/devices which we'd want to
 support with this framework will be based on different binary formats.
 
diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 606aae166eba..21fd2b2fe5ae 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -23,6 +23,7 @@
 #include <linux/elf.h>
 
 #include "remoteproc_internal.h"
+#include "remoteproc_elf_loader.h"
 
 /**
  * rproc_elf_sanity_check() - Sanity Check ELF firmware image
@@ -35,8 +36,16 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
 {
 	const char *name = rproc->firmware;
 	struct device *dev = &rproc->dev;
+	/*
+	 * Elf files are beginning with the same structure. Thus, to simplify
+	 * header parsing, we can use the elf32_hdr one for both elf64 and
+	 * elf32.
+	 */
 	struct elf32_hdr *ehdr;
+	u32 elf_shdr_size;
+	u64 phoff, shoff;
 	char class;
+	u16 phnum;
 
 	if (!fw) {
 		dev_err(dev, "failed to load %s\n", name);
@@ -50,13 +59,22 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
 
 	ehdr = (struct elf32_hdr *)fw->data;
 
-	/* We only support ELF32 at this point */
+	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
+		dev_err(dev, "Image is corrupted (bad magic)\n");
+		return -EINVAL;
+	}
+
 	class = ehdr->e_ident[EI_CLASS];
-	if (class != ELFCLASS32) {
+	if (class != ELFCLASS32 && class != ELFCLASS64) {
 		dev_err(dev, "Unsupported class: %d\n", class);
 		return -EINVAL;
 	}
 
+	if (class == ELFCLASS64 && fw->size < sizeof(struct elf64_hdr)) {
+		dev_err(dev, "elf64 header is too small\n");
+		return -EINVAL;
+	}
+
 	/* We assume the firmware has the same endianness as the host */
 # ifdef __LITTLE_ENDIAN
 	if (ehdr->e_ident[EI_DATA] != ELFDATA2LSB) {
@@ -67,26 +85,29 @@ int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw)
 		return -EINVAL;
 	}
 
-	if (fw->size < ehdr->e_shoff + sizeof(struct elf32_shdr)) {
-		dev_err(dev, "Image is too small\n");
-		return -EINVAL;
-	}
+	phoff = elf_hdr_e_phoff(class, fw->data);
+	shoff = elf_hdr_e_shoff(class, fw->data);
+	phnum =  elf_hdr_e_phnum(class, fw->data);
+	elf_shdr_size = elf_size_of_shdr(class);
 
-	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG)) {
-		dev_err(dev, "Image is corrupted (bad magic)\n");
+	if (fw->size < shoff + elf_shdr_size) {
+		dev_err(dev, "Image is too small\n");
 		return -EINVAL;
 	}
 
-	if (ehdr->e_phnum == 0) {
+	if (phnum == 0) {
 		dev_err(dev, "No loadable segments\n");
 		return -EINVAL;
 	}
 
-	if (ehdr->e_phoff > fw->size) {
+	if (phoff > fw->size) {
 		dev_err(dev, "Firmware size is too small\n");
 		return -EINVAL;
 	}
 
+	dev_dbg(dev, "Firmware is an elf%d file\n",
+		class == ELFCLASS32 ? 32 : 64);
+
 	return 0;
 }
 EXPORT_SYMBOL(rproc_elf_sanity_check);
@@ -102,11 +123,9 @@ EXPORT_SYMBOL(rproc_elf_sanity_check);
  * Note that the boot address is not a configurable property of all remote
  * processors. Some will always boot at a specific hard-coded address.
  */
-u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
+u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw)
 {
-	struct elf32_hdr *ehdr  = (struct elf32_hdr *)fw->data;
-
-	return ehdr->e_entry;
+	return elf_hdr_e_entry(fw_elf_get_class(fw), fw->data);
 }
 EXPORT_SYMBOL(rproc_elf_get_boot_addr);
 
@@ -137,37 +156,41 @@ EXPORT_SYMBOL(rproc_elf_get_boot_addr);
 int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 {
 	struct device *dev = &rproc->dev;
-	struct elf32_hdr *ehdr;
-	struct elf32_phdr *phdr;
+	const void *ehdr, *phdr;
 	int i, ret = 0;
+	u16 phnum;
 	const u8 *elf_data = fw->data;
+	u8 class = fw_elf_get_class(fw);
+	u32 elf_phdr_size = elf_size_of_phdr(class);
 
-	ehdr = (struct elf32_hdr *)elf_data;
-	phdr = (struct elf32_phdr *)(elf_data + ehdr->e_phoff);
+	ehdr = elf_data;
+	phnum = elf_hdr_e_phnum(class, ehdr);
+	phdr = elf_data + elf_hdr_e_phoff(class, ehdr);
 
 	/* go through the available ELF segments */
-	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
-		u32 da = phdr->p_paddr;
-		u32 memsz = phdr->p_memsz;
-		u32 filesz = phdr->p_filesz;
-		u32 offset = phdr->p_offset;
+	for (i = 0; i < phnum; i++, phdr += elf_phdr_size) {
+		u64 da = elf_phdr_p_paddr(class, phdr);
+		u64 memsz = elf_phdr_p_memsz(class, phdr);
+		u64 filesz = elf_phdr_p_filesz(class, phdr);
+		u64 offset = elf_phdr_p_offset(class, phdr);
+		u32 type = elf_phdr_p_type(class, phdr);
 		void *ptr;
 
-		if (phdr->p_type != PT_LOAD)
+		if (type != PT_LOAD)
 			continue;
 
-		dev_dbg(dev, "phdr: type %d da 0x%x memsz 0x%x filesz 0x%x\n",
-			phdr->p_type, da, memsz, filesz);
+		dev_dbg(dev, "phdr: type %d da 0x%llx memsz 0x%llx filesz 0x%llx\n",
+			type, da, memsz, filesz);
 
 		if (filesz > memsz) {
-			dev_err(dev, "bad phdr filesz 0x%x memsz 0x%x\n",
+			dev_err(dev, "bad phdr filesz 0x%llx memsz 0x%llx\n",
 				filesz, memsz);
 			ret = -EINVAL;
 			break;
 		}
 
 		if (offset + filesz > fw->size) {
-			dev_err(dev, "truncated fw: need 0x%x avail 0x%zx\n",
+			dev_err(dev, "truncated fw: need 0x%llx avail 0x%zx\n",
 				offset + filesz, fw->size);
 			ret = -EINVAL;
 			break;
@@ -176,14 +199,15 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		/* grab the kernel address for this device address */
 		ptr = rproc_da_to_va(rproc, da, memsz);
 		if (!ptr) {
-			dev_err(dev, "bad phdr da 0x%x mem 0x%x\n", da, memsz);
+			dev_err(dev, "bad phdr da 0x%llx mem 0x%llx\n", da,
+				memsz);
 			ret = -EINVAL;
 			break;
 		}
 
 		/* put the segment where the remote processor expects it */
-		if (phdr->p_filesz)
-			memcpy(ptr, elf_data + phdr->p_offset, filesz);
+		if (filesz)
+			memcpy(ptr, elf_data + offset, filesz);
 
 		/*
 		 * Zero out remaining memory for this segment.
@@ -200,24 +224,35 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 }
 EXPORT_SYMBOL(rproc_elf_load_segments);
 
-static struct elf32_shdr *
-find_table(struct device *dev, struct elf32_hdr *ehdr, size_t fw_size)
+static const void *
+find_table(struct device *dev, const struct firmware *fw)
 {
-	struct elf32_shdr *shdr;
+	const void *shdr, *name_table_shdr;
 	int i;
 	const char *name_table;
 	struct resource_table *table = NULL;
-	const u8 *elf_data = (void *)ehdr;
+	const u8 *elf_data = (void *)fw->data;
+	u8 class = fw_elf_get_class(fw);
+	size_t fw_size = fw->size;
+	const void *ehdr = elf_data;
+	u16 shnum = elf_hdr_e_shnum(class, ehdr);
+	u32 elf_shdr_size = elf_size_of_shdr(class);
+	u16 shstrndx = elf_hdr_e_shstrndx(class, ehdr);
 
 	/* look for the resource table and handle it */
-	shdr = (struct elf32_shdr *)(elf_data + ehdr->e_shoff);
-	name_table = elf_data + shdr[ehdr->e_shstrndx].sh_offset;
-
-	for (i = 0; i < ehdr->e_shnum; i++, shdr++) {
-		u32 size = shdr->sh_size;
-		u32 offset = shdr->sh_offset;
-
-		if (strcmp(name_table + shdr->sh_name, ".resource_table"))
+	/* First, get the section header according to the elf class */
+	shdr = elf_data + elf_hdr_e_shoff(class, ehdr);
+	/* Compute name table section header entry in shdr array */
+	name_table_shdr = shdr + (shstrndx * elf_shdr_size);
+	/* Finally, compute the name table section address in elf */
+	name_table = elf_data + elf_shdr_sh_offset(class, name_table_shdr);
+
+	for (i = 0; i < shnum; i++, shdr += elf_shdr_size) {
+		u64 size = elf_shdr_sh_size(class, shdr);
+		u64 offset = elf_shdr_sh_offset(class, shdr);
+		u32 name = elf_shdr_sh_name(class, shdr);
+
+		if (strcmp(name_table + name, ".resource_table"))
 			continue;
 
 		table = (struct resource_table *)(elf_data + offset);
@@ -270,21 +305,21 @@ find_table(struct device *dev, struct elf32_hdr *ehdr, size_t fw_size)
  */
 int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw)
 {
-	struct elf32_hdr *ehdr;
-	struct elf32_shdr *shdr;
+	const void *shdr;
 	struct device *dev = &rproc->dev;
 	struct resource_table *table = NULL;
 	const u8 *elf_data = fw->data;
 	size_t tablesz;
+	u8 class = fw_elf_get_class(fw);
+	u64 sh_offset;
 
-	ehdr = (struct elf32_hdr *)elf_data;
-
-	shdr = find_table(dev, ehdr, fw->size);
+	shdr = find_table(dev, fw);
 	if (!shdr)
 		return -EINVAL;
 
-	table = (struct resource_table *)(elf_data + shdr->sh_offset);
-	tablesz = shdr->sh_size;
+	sh_offset = elf_shdr_sh_offset(class, shdr);
+	table = (struct resource_table *)(elf_data + sh_offset);
+	tablesz = elf_shdr_sh_size(class, shdr);
 
 	/*
 	 * Create a copy of the resource table. When a virtio device starts
@@ -317,13 +352,17 @@ EXPORT_SYMBOL(rproc_elf_load_rsc_table);
 struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
 						       const struct firmware *fw)
 {
-	struct elf32_hdr *ehdr = (struct elf32_hdr *)fw->data;
-	struct elf32_shdr *shdr;
+	const void *shdr;
+	u64 sh_addr, sh_size;
+	u8 class = fw_elf_get_class(fw);
 
-	shdr = find_table(&rproc->dev, ehdr, fw->size);
+	shdr = find_table(&rproc->dev, fw);
 	if (!shdr)
 		return NULL;
 
-	return rproc_da_to_va(rproc, shdr->sh_addr, shdr->sh_size);
+	sh_addr = elf_shdr_sh_addr(class, shdr);
+	sh_size = elf_shdr_sh_size(class, shdr);
+
+	return rproc_da_to_va(rproc, sh_addr, sh_size);
 }
 EXPORT_SYMBOL(rproc_elf_find_loaded_rsc_table);
diff --git a/drivers/remoteproc/remoteproc_elf_loader.h b/drivers/remoteproc/remoteproc_elf_loader.h
new file mode 100644
index 000000000000..fac3565734f9
--- /dev/null
+++ b/drivers/remoteproc/remoteproc_elf_loader.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Remote processor elf loader defines
+ *
+ * Copyright (C) 2019 Kalray, Inc.
+ */
+
+#ifndef REMOTEPROC_ELF_LOADER_H
+#define REMOTEPROC_ELF_LOADER_H
+
+#include <linux/elf.h>
+#include <linux/types.h>
+
+/**
+ * fw_elf_get_class - Get elf class
+ * @fw: the ELF firmware image
+ *
+ * Note that we use and elf32_hdr to access the class since the start of the
+ * struct is the same for both elf class
+ *
+ * Return: elf class of the firmware
+ */
+static inline u8 fw_elf_get_class(const struct firmware *fw)
+{
+	struct elf32_hdr *ehdr = (struct elf32_hdr *)fw->data;
+
+	return ehdr->e_ident[EI_CLASS];
+}
+
+#define ELF_GET_FIELD(__s, __field, __type) \
+static inline __type elf_##__s##_##__field(u8 class, const void *arg) \
+{ \
+	if (class == ELFCLASS32) \
+		return (__type) ((const struct elf32_##__s *) arg)->__field; \
+	else \
+		return (__type) ((const struct elf64_##__s *) arg)->__field; \
+}
+
+ELF_GET_FIELD(hdr, e_entry, u64)
+ELF_GET_FIELD(hdr, e_phnum, u16)
+ELF_GET_FIELD(hdr, e_shnum, u16)
+ELF_GET_FIELD(hdr, e_phoff, u64)
+ELF_GET_FIELD(hdr, e_shoff, u64)
+ELF_GET_FIELD(hdr, e_shstrndx, u16)
+
+ELF_GET_FIELD(phdr, p_paddr, u64)
+ELF_GET_FIELD(phdr, p_filesz, u64)
+ELF_GET_FIELD(phdr, p_memsz, u64)
+ELF_GET_FIELD(phdr, p_type, u32)
+ELF_GET_FIELD(phdr, p_offset, u64)
+
+ELF_GET_FIELD(shdr, sh_size, u64)
+ELF_GET_FIELD(shdr, sh_offset, u64)
+ELF_GET_FIELD(shdr, sh_name, u32)
+ELF_GET_FIELD(shdr, sh_addr, u64)
+
+#define ELF_STRUCT_SIZE(__s) \
+static inline unsigned long elf_size_of_##__s(u8 class) \
+{ \
+	if (class == ELFCLASS32)\
+		return sizeof(struct elf32_##__s); \
+	else \
+		return sizeof(struct elf64_##__s); \
+}
+
+ELF_STRUCT_SIZE(shdr)
+ELF_STRUCT_SIZE(phdr)
+
+#endif /* REMOTEPROC_ELF_LOADER_H */
diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
index 004867061721..eeb26434220e 100644
--- a/drivers/remoteproc/remoteproc_internal.h
+++ b/drivers/remoteproc/remoteproc_internal.h
@@ -55,7 +55,7 @@ phys_addr_t rproc_va_to_pa(void *cpu_addr);
 int rproc_trigger_recovery(struct rproc *rproc);
 
 int rproc_elf_sanity_check(struct rproc *rproc, const struct firmware *fw);
-u32 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
+u64 rproc_elf_get_boot_addr(struct rproc *rproc, const struct firmware *fw);
 int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw);
 int rproc_elf_load_rsc_table(struct rproc *rproc, const struct firmware *fw);
 struct resource_table *rproc_elf_find_loaded_rsc_table(struct rproc *rproc,
diff --git a/drivers/remoteproc/st_remoteproc.c b/drivers/remoteproc/st_remoteproc.c
index ee13d23b43a9..a3268d95a50e 100644
--- a/drivers/remoteproc/st_remoteproc.c
+++ b/drivers/remoteproc/st_remoteproc.c
@@ -190,7 +190,7 @@ static int st_rproc_start(struct rproc *rproc)
 		}
 	}
 
-	dev_info(&rproc->dev, "Started from 0x%x\n", rproc->bootaddr);
+	dev_info(&rproc->dev, "Started from 0x%llx\n", rproc->bootaddr);
 
 	return 0;
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index f84bd5fe0211..82cebca9344c 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -382,7 +382,7 @@ struct rproc_ops {
 				struct rproc *rproc, const struct firmware *fw);
 	int (*load)(struct rproc *rproc, const struct firmware *fw);
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
-	u32 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
+	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
 };
 
 /**
@@ -498,7 +498,7 @@ struct rproc {
 	int num_traces;
 	struct list_head carveouts;
 	struct list_head mappings;
-	u32 bootaddr;
+	u64 bootaddr;
 	struct list_head rvdevs;
 	struct list_head subdevs;
 	struct idr notifyids;
-- 
2.15.0.276.g89ea799

