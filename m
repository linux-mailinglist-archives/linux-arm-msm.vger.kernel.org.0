Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63A6282058
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Oct 2020 04:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725795AbgJCCGU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Oct 2020 22:06:20 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:17110 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725772AbgJCCGU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Oct 2020 22:06:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601690778; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=CJzPocbwiI9yoSHnVl6suTt1SLx51SQMAYXjhCSRMZY=; b=BFs0rhWx6506xPWUuUob/2/wYK8tK5iGrRzSCjH4I0KBE8yI4e20+6bcvPuxRNcNLi7friRk
 9fpFIpbvrgbEtdSVF75s04txjzKE0BwYk9jGvkY0+moDpinQihg960l66jEaqWyIqUP9/cVo
 frXYzyeC6x/M6u7OhIBF854zPMI=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f77dc9aad37af35ec219947 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 03 Oct 2020 02:06:18
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 20472C43385; Sat,  3 Oct 2020 02:06:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 89626C433CB;
        Sat,  3 Oct 2020 02:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 89626C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v6 2/4] remoteproc: coredump: Add minidump functionality
Date:   Fri,  2 Oct 2020 19:05:55 -0700
Message-Id: <1601690757-25726-3-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601690757-25726-1-git-send-email-sidgup@codeaurora.org>
References: <1601690757-25726-1-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This change adds a new kind of core dump mechanism which instead of dumping
entire program segments of the firmware, dumps sections of the remoteproc
memory which are sufficient to allow debugging the firmware. This function
thus uses section headers instead of program headers during creation of the
core dump elf.

Signed-off-by: Rishabh Bhatnagar <rishabhb@codeaurora.org>
Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/remoteproc_coredump.c    | 132 ++++++++++++++++++++++++++++
 drivers/remoteproc/remoteproc_elf_helpers.h |  27 ++++++
 include/linux/remoteproc.h                  |   1 +
 3 files changed, 160 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_coredump.c b/drivers/remoteproc/remoteproc_coredump.c
index bb15a29..e7d1394 100644
--- a/drivers/remoteproc/remoteproc_coredump.c
+++ b/drivers/remoteproc/remoteproc_coredump.c
@@ -13,6 +13,8 @@
 #include "remoteproc_internal.h"
 #include "remoteproc_elf_helpers.h"
 
+#define MAX_STRTBL_SIZE 512
+
 struct rproc_coredump_state {
 	struct rproc *rproc;
 	void *header;
@@ -323,3 +325,133 @@ void rproc_coredump(struct rproc *rproc)
 	 */
 	wait_for_completion(&dump_state.dump_done);
 }
+
+/**
+ * rproc_minidump() - perform minidump
+ * @rproc:	rproc handle
+ *
+ * This function will generate an ELF header for the registered sections of
+ * segments and create a devcoredump device associated with rproc. Based on
+ * the coredump configuration this function will directly copy the segments
+ * from device memory to userspace or copy segments from device memory to
+ * a separate buffer, which can then be read by userspace.
+ * The first approach avoids using extra vmalloc memory. But it will stall
+ * recovery flow until dump is read by userspace.
+ */
+void rproc_minidump(struct rproc *rproc)
+{
+	struct rproc_dump_segment *segment;
+	void *shdr;
+	void *ehdr;
+	size_t data_size;
+	size_t offset;
+	void *data;
+	u8 class = rproc->elf_class;
+	int shnum;
+	struct rproc_coredump_state dump_state;
+	unsigned int dump_conf = rproc->dump_conf;
+	char *str_tbl = "STR_TBL";
+
+	if (list_empty(&rproc->dump_segments) ||
+	    dump_conf == RPROC_COREDUMP_DISABLED)
+		return;
+
+	if (class == ELFCLASSNONE) {
+		dev_err(&rproc->dev, "Elf class is not set\n");
+		return;
+	}
+
+	/*
+	 * We allocate two extra section headers. The first one is null.
+	 * Second section header is for the string table. Also space is
+	 * allocated for string table.
+	 */
+	data_size = elf_size_of_hdr(class) + 2 * elf_size_of_shdr(class) +
+		    MAX_STRTBL_SIZE;
+	shnum = 2;
+
+	list_for_each_entry(segment, &rproc->dump_segments, node) {
+		data_size += elf_size_of_shdr(class);
+		if (dump_conf == RPROC_COREDUMP_DEFAULT)
+			data_size += segment->size;
+		shnum++;
+	}
+
+	data = vmalloc(data_size);
+	if (!data)
+		return;
+
+	ehdr = data;
+	memset(ehdr, 0, elf_size_of_hdr(class));
+	/* e_ident field is common for both elf32 and elf64 */
+	elf_hdr_init_ident(ehdr, class);
+
+	elf_hdr_set_e_type(class, ehdr, ET_CORE);
+	elf_hdr_set_e_machine(class, ehdr, rproc->elf_machine);
+	elf_hdr_set_e_version(class, ehdr, EV_CURRENT);
+	elf_hdr_set_e_entry(class, ehdr, rproc->bootaddr);
+	elf_hdr_set_e_shoff(class, ehdr, elf_size_of_hdr(class));
+	elf_hdr_set_e_ehsize(class, ehdr, elf_size_of_hdr(class));
+	elf_hdr_set_e_shentsize(class, ehdr, elf_size_of_shdr(class));
+	elf_hdr_set_e_shnum(class, ehdr, shnum);
+	elf_hdr_set_e_shstrndx(class, ehdr, 1);
+
+	/* Set the first section header as null and move to the next one. */
+	shdr = data + elf_hdr_get_e_shoff(class, ehdr);
+	memset(shdr, 0, elf_size_of_shdr(class));
+	shdr += elf_size_of_shdr(class);
+
+	/* Initialize the string table. */
+	offset = elf_hdr_get_e_shoff(class, ehdr) +
+		 elf_size_of_shdr(class) * elf_hdr_get_e_shnum(class, ehdr);
+	memset(data + offset, 0, MAX_STRTBL_SIZE);
+
+	/* Fill in the string table section header. */
+	memset(shdr, 0, elf_size_of_shdr(class));
+	elf_shdr_set_sh_type(class, shdr, SHT_STRTAB);
+	elf_shdr_set_sh_offset(class, shdr, offset);
+	elf_shdr_set_sh_size(class, shdr, MAX_STRTBL_SIZE);
+	elf_shdr_set_sh_entsize(class, shdr, 0);
+	elf_shdr_set_sh_flags(class, shdr, 0);
+	elf_shdr_set_sh_name(class, shdr, set_section_name(str_tbl, ehdr, class));
+	offset += elf_shdr_get_sh_size(class, shdr);
+	shdr += elf_size_of_shdr(class);
+
+	list_for_each_entry(segment, &rproc->dump_segments, node) {
+		memset(shdr, 0, elf_size_of_shdr(class));
+		elf_shdr_set_sh_type(class, shdr, SHT_PROGBITS);
+		elf_shdr_set_sh_offset(class, shdr, offset);
+		elf_shdr_set_sh_addr(class, shdr, segment->da);
+		elf_shdr_set_sh_size(class, shdr, segment->size);
+		elf_shdr_set_sh_entsize(class, shdr, 0);
+		elf_shdr_set_sh_flags(class, shdr, SHF_WRITE);
+		elf_shdr_set_sh_name(class, shdr,
+				     set_section_name(segment->priv, ehdr, class));
+
+		/* No need to copy segments for inline dumps */
+		if (dump_conf == RPROC_COREDUMP_DEFAULT)
+			rproc_copy_segment(rproc, data + offset, segment, 0,
+					   segment->size);
+		offset += elf_shdr_get_sh_size(class, shdr);
+		shdr += elf_size_of_shdr(class);
+	}
+
+	if (dump_conf == RPROC_COREDUMP_DEFAULT) {
+		dev_coredumpv(&rproc->dev, data, data_size, GFP_KERNEL);
+		return;
+	}
+
+	/* Initialize the dump state struct to be used by rproc_coredump_read */
+	dump_state.rproc = rproc;
+	dump_state.header = data;
+	init_completion(&dump_state.dump_done);
+
+	dev_coredumpm(&rproc->dev, NULL, &dump_state, data_size, GFP_KERNEL,
+		      rproc_coredump_read, rproc_coredump_free);
+
+	/* Wait until the dump is read and free is called. Data is freed
+	 * by devcoredump framework automatically after 5 minutes.
+	 */
+	wait_for_completion(&dump_state.dump_done);
+}
+EXPORT_SYMBOL(rproc_minidump);
diff --git a/drivers/remoteproc/remoteproc_elf_helpers.h b/drivers/remoteproc/remoteproc_elf_helpers.h
index 4b6be7b..d83ebca 100644
--- a/drivers/remoteproc/remoteproc_elf_helpers.h
+++ b/drivers/remoteproc/remoteproc_elf_helpers.h
@@ -11,6 +11,7 @@
 #include <linux/elf.h>
 #include <linux/types.h>
 
+#define MAX_NAME_LENGTH 16
 /**
  * fw_elf_get_class - Get elf class
  * @fw: the ELF firmware image
@@ -65,6 +66,7 @@ ELF_GEN_FIELD_GET_SET(hdr, e_type, u16)
 ELF_GEN_FIELD_GET_SET(hdr, e_version, u32)
 ELF_GEN_FIELD_GET_SET(hdr, e_ehsize, u32)
 ELF_GEN_FIELD_GET_SET(hdr, e_phentsize, u16)
+ELF_GEN_FIELD_GET_SET(hdr, e_shentsize, u16)
 
 ELF_GEN_FIELD_GET_SET(phdr, p_paddr, u64)
 ELF_GEN_FIELD_GET_SET(phdr, p_vaddr, u64)
@@ -74,6 +76,9 @@ ELF_GEN_FIELD_GET_SET(phdr, p_type, u32)
 ELF_GEN_FIELD_GET_SET(phdr, p_offset, u64)
 ELF_GEN_FIELD_GET_SET(phdr, p_flags, u32)
 ELF_GEN_FIELD_GET_SET(phdr, p_align, u64)
+ELF_GEN_FIELD_GET_SET(shdr, sh_type, u32)
+ELF_GEN_FIELD_GET_SET(shdr, sh_flags, u32)
+ELF_GEN_FIELD_GET_SET(shdr, sh_entsize, u16)
 
 ELF_GEN_FIELD_GET_SET(shdr, sh_size, u64)
 ELF_GEN_FIELD_GET_SET(shdr, sh_offset, u64)
@@ -93,4 +98,26 @@ ELF_STRUCT_SIZE(shdr)
 ELF_STRUCT_SIZE(phdr)
 ELF_STRUCT_SIZE(hdr)
 
+static inline unsigned int set_section_name(const char *name, void *ehdr,
+					    u8 class)
+{
+	u16 shstrndx = elf_hdr_get_e_shstrndx(class, ehdr);
+	void *shdr;
+	char *strtab;
+	static int strtable_idx = 1;
+	int idx, ret = 0;
+
+	shdr = ehdr + elf_size_of_hdr(class) + shstrndx * elf_size_of_shdr(class);
+	strtab = ehdr + elf_shdr_get_sh_offset(class, shdr);
+	idx = strtable_idx;
+	if (!strtab || !name)
+		return 0;
+
+	ret = idx;
+	idx += strlcpy((strtab + idx), name, MAX_NAME_LENGTH);
+	strtable_idx = idx + 1;
+
+	return ret;
+}
+
 #endif /* REMOTEPROC_ELF_LOADER_H */
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index a66e2cb..0864ece 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -656,6 +656,7 @@ rproc_of_resm_mem_entry_init(struct device *dev, u32 of_resm_idx, size_t len,
 int rproc_boot(struct rproc *rproc);
 void rproc_shutdown(struct rproc *rproc);
 void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type);
+void rproc_minidump(struct rproc *rproc);
 int rproc_coredump_add_segment(struct rproc *rproc, dma_addr_t da, size_t size);
 int rproc_coredump_add_custom_segment(struct rproc *rproc,
 				      dma_addr_t da, size_t size,
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

