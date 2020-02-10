Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 166A5157FAD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2020 17:24:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgBJQYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Feb 2020 11:24:04 -0500
Received: from zimbra2.kalray.eu ([92.103.151.219]:58898 "EHLO
        zimbra2.kalray.eu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727942AbgBJQYB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Feb 2020 11:24:01 -0500
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id 26B4627E081F;
        Mon, 10 Feb 2020 17:24:00 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id ka-xYB4Qjh8D; Mon, 10 Feb 2020 17:23:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by zimbra2.kalray.eu (Postfix) with ESMTP id A3D3127E082F;
        Mon, 10 Feb 2020 17:23:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu A3D3127E082F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
        s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1581351839;
        bh=z6MmYl/QLmO+1QqqDgCxFlby/GTqJm7qWVYW4F1t4MI=;
        h=From:To:Date:Message-Id;
        b=BKKqKiRwIB/AH5bPU9pVOJNsbBNTy4KJ42FxZX5KPMEbO7Q2Zv2ZUW49vkG+RryUx
         ayxhRlIGgJFWKOuZZfNMtMUsKZayZJaNQU+HAjEmkV6CcFff5iBXEHESY298cTR58G
         hRfrJmpdZJw6m3U5vVVsbNP6r59m/xJLm5gzIfyQ=
X-Virus-Scanned: amavisd-new at zimbra2.kalray.eu
Received: from zimbra2.kalray.eu ([127.0.0.1])
        by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id TUIlXYFIWjcm; Mon, 10 Feb 2020 17:23:59 +0100 (CET)
Received: from triton.lin.mbt.kalray.eu (unknown [192.168.37.25])
        by zimbra2.kalray.eu (Postfix) with ESMTPSA id 85BDD27E07D3;
        Mon, 10 Feb 2020 17:23:59 +0100 (CET)
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
Subject: [PATCH v4 5/5] remoteproc: Adapt coredump to generate correct elf type
Date:   Mon, 10 Feb 2020 17:22:09 +0100
Message-Id: <20200210162209.23149-6-cleger@kalray.eu>
X-Mailer: git-send-email 2.15.0.276.g89ea799
In-Reply-To: <20200210162209.23149-1-cleger@kalray.eu>
References: <527785289.2852303.1581062223707.JavaMail.zimbra@kalray.eu>
 <20200210162209.23149-1-cleger@kalray.eu>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that remoteproc can load an elf64, coredump elf class should be
the same as the loaded elf class. In order to do that, add a
elf_class field to rproc with default values. If an elf is loaded
successfully, these fields will be updated with the loaded elf class.
Then, the coredump core code has been modified to use the generic elf
macro in order to create an elf file with correct class.

Signed-off-by: Clement Leger <cleger@kalray.eu>
---
 drivers/remoteproc/remoteproc_core.c       | 67 ++++++++++++++++--------------
 drivers/remoteproc/remoteproc_elf_loader.c |  3 ++
 include/linux/remoteproc.h                 |  1 +
 3 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 9e6d3c6a60ee..ce70656ae150 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -38,6 +38,7 @@
 #include <linux/platform_device.h>
 
 #include "remoteproc_internal.h"
+#include "remoteproc_elf_helpers.h"
 
 #define HIGH_BITS_MASK 0xFFFFFFFF00000000ULL
 
@@ -1564,20 +1565,21 @@ EXPORT_SYMBOL(rproc_coredump_add_custom_segment);
 static void rproc_coredump(struct rproc *rproc)
 {
 	struct rproc_dump_segment *segment;
-	struct elf32_phdr *phdr;
-	struct elf32_hdr *ehdr;
+	void *phdr;
+	void *ehdr;
 	size_t data_size;
 	size_t offset;
 	void *data;
 	void *ptr;
+	u8 class = rproc->elf_class;
 	int phnum = 0;
 
 	if (list_empty(&rproc->dump_segments))
 		return;
 
-	data_size = sizeof(*ehdr);
+	data_size = elf_size_of_hdr(class);
 	list_for_each_entry(segment, &rproc->dump_segments, node) {
-		data_size += sizeof(*phdr) + segment->size;
+		data_size += elf_size_of_phdr(class) + segment->size;
 
 		phnum++;
 	}
@@ -1588,33 +1590,33 @@ static void rproc_coredump(struct rproc *rproc)
 
 	ehdr = data;
 
-	memset(ehdr, 0, sizeof(*ehdr));
-	memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
-	ehdr->e_ident[EI_CLASS] = ELFCLASS32;
-	ehdr->e_ident[EI_DATA] = ELFDATA2LSB;
-	ehdr->e_ident[EI_VERSION] = EV_CURRENT;
-	ehdr->e_ident[EI_OSABI] = ELFOSABI_NONE;
-	ehdr->e_type = ET_CORE;
-	ehdr->e_machine = EM_NONE;
-	ehdr->e_version = EV_CURRENT;
-	ehdr->e_entry = rproc->bootaddr;
-	ehdr->e_phoff = sizeof(*ehdr);
-	ehdr->e_ehsize = sizeof(*ehdr);
-	ehdr->e_phentsize = sizeof(*phdr);
-	ehdr->e_phnum = phnum;
-
-	phdr = data + ehdr->e_phoff;
-	offset = ehdr->e_phoff + sizeof(*phdr) * ehdr->e_phnum;
+	memset(ehdr, 0, elf_size_of_hdr(class));
+	/* e_ident field is common for both elf32 and elf64 */
+	elf_hdr_init_ident(ehdr, class);
+
+	elf_hdr_set_e_type(class, ehdr, ET_CORE);
+	elf_hdr_set_e_machine(class, ehdr, EM_NONE);
+	elf_hdr_set_e_version(class, ehdr, EV_CURRENT);
+	elf_hdr_set_e_entry(class, ehdr, rproc->bootaddr);
+	elf_hdr_set_e_phoff(class, ehdr, elf_size_of_hdr(class));
+	elf_hdr_set_e_ehsize(class, ehdr, elf_size_of_hdr(class));
+	elf_hdr_set_e_phentsize(class, ehdr, elf_size_of_phdr(class));
+	elf_hdr_set_e_phnum(class, ehdr, phnum);
+
+	phdr = data + elf_hdr_get_e_phoff(class, ehdr);
+	offset = elf_hdr_get_e_phoff(class, ehdr);
+	offset += elf_size_of_phdr(class) * elf_hdr_get_e_phnum(class, ehdr);
+
 	list_for_each_entry(segment, &rproc->dump_segments, node) {
-		memset(phdr, 0, sizeof(*phdr));
-		phdr->p_type = PT_LOAD;
-		phdr->p_offset = offset;
-		phdr->p_vaddr = segment->da;
-		phdr->p_paddr = segment->da;
-		phdr->p_filesz = segment->size;
-		phdr->p_memsz = segment->size;
-		phdr->p_flags = PF_R | PF_W | PF_X;
-		phdr->p_align = 0;
+		memset(phdr, 0, elf_size_of_phdr(class));
+		elf_phdr_set_p_type(class, phdr, PT_LOAD);
+		elf_phdr_set_p_offset(class, phdr, offset);
+		elf_phdr_set_p_vaddr(class, phdr, segment->da);
+		elf_phdr_set_p_paddr(class, phdr, segment->da);
+		elf_phdr_set_p_filesz(class, phdr, segment->size);
+		elf_phdr_set_p_memsz(class, phdr, segment->size);
+		elf_phdr_set_p_flags(class, phdr, PF_R | PF_W | PF_X);
+		elf_phdr_set_p_align(class, phdr, 0);
 
 		if (segment->dump) {
 			segment->dump(rproc, segment, data + offset);
@@ -1630,8 +1632,8 @@ static void rproc_coredump(struct rproc *rproc)
 			}
 		}
 
-		offset += phdr->p_filesz;
-		phdr++;
+		offset += elf_phdr_get_p_filesz(class, phdr);
+		phdr += elf_size_of_phdr(class);
 	}
 
 	dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
@@ -2029,6 +2031,7 @@ struct rproc *rproc_alloc(struct device *dev, const char *name,
 	rproc->name = name;
 	rproc->priv = &rproc[1];
 	rproc->auto_boot = true;
+	rproc->elf_class = ELFCLASS32;
 
 	device_initialize(&rproc->dev);
 	rproc->dev.parent = dev;
diff --git a/drivers/remoteproc/remoteproc_elf_loader.c b/drivers/remoteproc/remoteproc_elf_loader.c
index 2ffb02a2ee36..07712a541ea6 100644
--- a/drivers/remoteproc/remoteproc_elf_loader.c
+++ b/drivers/remoteproc/remoteproc_elf_loader.c
@@ -220,6 +220,9 @@ int rproc_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 			memset(ptr + filesz, 0, memsz - filesz);
 	}
 
+	if (ret == 0)
+		rproc->elf_class = class;
+
 	return ret;
 }
 EXPORT_SYMBOL(rproc_elf_load_segments);
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 82cebca9344c..113e356ce56a 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -514,6 +514,7 @@ struct rproc {
 	bool auto_boot;
 	struct list_head dump_segments;
 	int nb_vdev;
+	int elf_class;
 };
 
 /**
-- 
2.15.0.276.g89ea799

