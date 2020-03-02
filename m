Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69082175768
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2020 10:40:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727556AbgCBJjP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Mar 2020 04:39:15 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:38062 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727518AbgCBJjO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Mar 2020 04:39:14 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 1513D27E083D;
        Mon,  2 Mar 2020 10:39:13 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id VjQZ6XBHqgnt; Mon,  2 Mar 2020 10:39:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 981DC27E0840;
        Mon,  2 Mar 2020 10:39:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 981DC27E0840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1583141952;
        bh=W+DBp3Kdqtq/tZ/GwGHqju2JIwVWvf3NKbxPUqbSl0U=;
        h=From:To:Date:Message-Id;
        b=m5C12GROg4L7Huuk9KbevfVcjP5fFuW5IhoA2fYRJn7x4ICmpowKefnkN9KndB49E
         OtuITiNlvjFvBAtbbFb9o7fu4UfNI+Vm0b08E924B9D5fIdHt7YvK7OAbsiDR+ULxr
         3vHa9U0sko72xL+ouajRgbe85Zepceq4An7S7mgQ=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id FJxtIRFFr0pO; Mon,  2 Mar 2020 10:39:12 +0100 (CET)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 76BF627E083D;
        Mon,  2 Mar 2020 10:39:12 +0100 (CET)
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
Subject: [PATCH v5 4/8] remoteproc: Add elf helpers to access elf64 and elf32 fields
Date:   Mon,  2 Mar 2020 10:38:58 +0100
Message-Id: <20200302093902.27849-5-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
In-Reply-To: <20200302093902.27849-1-cleger@kalray.eu>
References: <20200210162209.23149-1-cleger@kalray.eu>
 <20200302093902.27849-1-cleger@kalray.eu>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

elf32 and elf64 mainly differ by their types. In order to avoid
copy/pasting the whole loader code, generate static inline functions
which will access values according to the elf class. It allows to
keep a common loader basis.
In order to accommodate both elf types sizes, the maximum size for a
elf header member is chosen using the maximum value of the field for
both elf class.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/remoteproc/remoteproc_elf_helpers.h | 96 +++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 drivers/remoteproc/remoteproc_elf_helpers.h

diff --git a/drivers/remoteproc/remoteproc_elf_helpers.h b/drivers/remoteproc/remoteproc_elf_helpers.h
new file mode 100644
index 000000000000..4b6be7b6bf4d
--- /dev/null
+++ b/drivers/remoteproc/remoteproc_elf_helpers.h
@@ -0,0 +1,96 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Remote processor elf helpers defines
+ *
+ * Copyright (C) 2020 Kalray, Inc.
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
+static inline void elf_hdr_init_ident(struct elf32_hdr *hdr, u8 class)
+{
+	memcpy(hdr->e_ident, ELFMAG, SELFMAG);
+	hdr->e_ident[EI_CLASS] = class;
+	hdr->e_ident[EI_DATA] = ELFDATA2LSB;
+	hdr->e_ident[EI_VERSION] = EV_CURRENT;
+	hdr->e_ident[EI_OSABI] = ELFOSABI_NONE;
+}
+
+/* Generate getter and setter for a specific elf struct/field */
+#define ELF_GEN_FIELD_GET_SET(__s, __field, __type) \
+static inline __type elf_##__s##_get_##__field(u8 class, const void *arg) \
+{ \
+	if (class == ELFCLASS32) \
+		return (__type) ((const struct elf32_##__s *) arg)->__field; \
+	else \
+		return (__type) ((const struct elf64_##__s *) arg)->__field; \
+} \
+static inline void elf_##__s##_set_##__field(u8 class, void *arg, \
+					     __type value) \
+{ \
+	if (class == ELFCLASS32) \
+		((struct elf32_##__s *) arg)->__field = (__type) value; \
+	else \
+		((struct elf64_##__s *) arg)->__field = (__type) value; \
+}
+
+ELF_GEN_FIELD_GET_SET(hdr, e_entry, u64)
+ELF_GEN_FIELD_GET_SET(hdr, e_phnum, u16)
+ELF_GEN_FIELD_GET_SET(hdr, e_shnum, u16)
+ELF_GEN_FIELD_GET_SET(hdr, e_phoff, u64)
+ELF_GEN_FIELD_GET_SET(hdr, e_shoff, u64)
+ELF_GEN_FIELD_GET_SET(hdr, e_shstrndx, u16)
+ELF_GEN_FIELD_GET_SET(hdr, e_machine, u16)
+ELF_GEN_FIELD_GET_SET(hdr, e_type, u16)
+ELF_GEN_FIELD_GET_SET(hdr, e_version, u32)
+ELF_GEN_FIELD_GET_SET(hdr, e_ehsize, u32)
+ELF_GEN_FIELD_GET_SET(hdr, e_phentsize, u16)
+
+ELF_GEN_FIELD_GET_SET(phdr, p_paddr, u64)
+ELF_GEN_FIELD_GET_SET(phdr, p_vaddr, u64)
+ELF_GEN_FIELD_GET_SET(phdr, p_filesz, u64)
+ELF_GEN_FIELD_GET_SET(phdr, p_memsz, u64)
+ELF_GEN_FIELD_GET_SET(phdr, p_type, u32)
+ELF_GEN_FIELD_GET_SET(phdr, p_offset, u64)
+ELF_GEN_FIELD_GET_SET(phdr, p_flags, u32)
+ELF_GEN_FIELD_GET_SET(phdr, p_align, u64)
+
+ELF_GEN_FIELD_GET_SET(shdr, sh_size, u64)
+ELF_GEN_FIELD_GET_SET(shdr, sh_offset, u64)
+ELF_GEN_FIELD_GET_SET(shdr, sh_name, u32)
+ELF_GEN_FIELD_GET_SET(shdr, sh_addr, u64)
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
+ELF_STRUCT_SIZE(hdr)
+
+#endif /* REMOTEPROC_ELF_LOADER_H */
-- 
2.15.0.276.g89ea799

