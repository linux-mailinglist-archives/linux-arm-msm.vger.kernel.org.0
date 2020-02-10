Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D71E157FAA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 17:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727934AbgBJQYA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 11:24:00 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:58774 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727579AbgBJQYA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 11:24:00 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 36E2127E079C;
        Mon, 10 Feb 2020 17:23:58 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id tmX7p0hWeVXR; Mon, 10 Feb 2020 17:23:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id C7C0627E081F;
        Mon, 10 Feb 2020 17:23:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu C7C0627E081F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1581351837;
        bh=lbGrzt+EeUkdMfPQfhAHlwY5IQfWOsG9uidshk6KgKw=;
        h=From:To:Date:Message-Id;
        b=HVcomNbs+t3vyBltSMKBnSeAfWkcbn809nStrCoRo1zwD7AxO5LP0L0ZuvUAH4ckL
         GNXCOiAGhaRvmcuCrO7REaBqtHf3b2obA8OYdZAiSEXNw+Uf/DzfUHZ2nTtcgbiCtg
         K8rlWDge9d16banmYXi9qd1Ds196myNy92nYJ2Y0=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 4SYyeIE-rC0J; Mon, 10 Feb 2020 17:23:57 +0100 (CET)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id A6DCE27E079C;
        Mon, 10 Feb 2020 17:23:57 +0100 (CET)
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
Subject: [PATCH v4 3/5] remoteproc: Add elf helpers to access elf64 and elf32 fields
Date:   Mon, 10 Feb 2020 17:22:07 +0100
Message-Id: <20200210162209.23149-4-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
In-Reply-To: <20200210162209.23149-1-cleger@kalray.eu>
References: <527785289.2852303.1581062223707.JavaMail.zimbra@kalray.eu>
 <20200210162209.23149-1-cleger@kalray.eu>
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
 drivers/remoteproc/remoteproc_elf_helpers.h | 95 +++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 drivers/remoteproc/remoteproc_elf_helpers.h

diff --git a/drivers/remoteproc/remoteproc_elf_helpers.h b/drivers/remoteproc/remoteproc_elf_helpers.h
new file mode 100644
index 000000000000..a29c17aaedb7
--- /dev/null
+++ b/drivers/remoteproc/remoteproc_elf_helpers.h
@@ -0,0 +1,95 @@
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
+static inline void elf_##__s##_set_##__field(u8 class, void *arg, __type value) \
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

