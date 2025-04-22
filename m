Return-Path: <linux-arm-msm+bounces-54940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51911A96785
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBBFC189E346
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B17927D786;
	Tue, 22 Apr 2025 11:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KQ6hDzDC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D790427CCE6
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321543; cv=none; b=E8IKAerzIIwO3CQ2I4slzxSHpETB/6tFq5y+slUESySDnOcaj491EZdABTgmpbqxoK8NJ4Bp7jCOGUBA8PhsK5YZCYPtHfevvHj7UJXsdqv6AldakB0mJetc98u8BmudJ24txSmS/Kz+0AwDuVOhpNEFdMD0upPxW45pU7zoM3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321543; c=relaxed/simple;
	bh=HudZRsiLgZVjTqUtaHw4OpgjFsS0qdRoQeHRlSVb9is=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qTqF/AxYnQrLv+vCI3yCW20hv/yCM13AVWhL7yBMrexbGyAFqxfFFxm03L7jPITWNcS4ASeI+mkr7ixpd7X/ngTEDBlXI/cKL1S739lBE/Yym/ZtH1NuB9Th05tz5ARvUnz5Y9OAILTGkvk29t/T+Rt8ChSXmZyR/469vZfFtuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KQ6hDzDC; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3913b539aabso3028146f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321539; x=1745926339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JePmWDemaaU5/98Dg7tD07BeND+UgHEMeNRUmp9DPI=;
        b=KQ6hDzDCJPV2SI4KlvaADMSQ9/lEaPNkSRFK1qRayd7eYwfQPyxYG4/G4VWMZ8xtpH
         AbeDQBKykjpKp2XVdjKUZ0Iwq3hmSHJCVL1efbcrOaJAyW6JKYaM6LTyGPOsZTMVKrLs
         yT9uaImwlCrAt075sM5a9iudY/ChkrLS7JzBZLUXvyVgYlJvTJ5gdb5LlfV/v9tM1kBh
         9ZlskRhYNjh/E2THPWuuEdDQudace6sEfmqJ2SALyImn07IddjHb4PPf+1O6a8qji0OB
         284+/FIplmkU8XwIgZEMyFbRxnaANJ3IrV3jfJyxxJsmacJMa5ggeTQcGaC3SPHHyqNp
         Ox9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321539; x=1745926339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JePmWDemaaU5/98Dg7tD07BeND+UgHEMeNRUmp9DPI=;
        b=SLK0HKTC+Rw2X/rXghRvac0naW4ZCe50oQvUm6ZXpmtUdDtccq4YwNRVRUGBTE5dep
         snQwcAHpBQrz+UWGXqRNRYx1YQJ9trQhChSHNJxlnNOVQwQgOLXTi2YqOBZMKVJHJ+JJ
         RzUx6ggGFkmDi9ig4EsOvxNgryCaMG+9m+j5H8Q7hasajdErg8J7X9m39gjmlrBAEFL9
         MYfE+09YtiGG37g79vECK+ZfiFfRPVFBGk3w8GK15oxRbobwGhmDGt+tyh/A4GMn6+Cg
         43SOJlqoaz3KakKr8EU8Nz9Z/l4tRfAdsYXMhtwGWovQHZwiL8xBPmgGISvr3R8HxYA9
         0pKg==
X-Forwarded-Encrypted: i=1; AJvYcCVakkL41CkO7OhA289tgf47D5w4bJZ1Y/bv0AOoOrqoWoK873ariFW+LaQ2URjcRPySt5Cd4a7dOHooJ499@vger.kernel.org
X-Gm-Message-State: AOJu0YwHTexrMk3k/O7/3UPjy+K23eFsF6SpwXJxg1e3jYWPwWZKVicz
	IpJKHg5lMOyj9UUI6ZPATUCa9R0R/UrLlOpYl+oSmXGVWkPdXLIuBDswiE/eAzg=
X-Gm-Gg: ASbGncuhgRasKUoU33eFzojNuT4FBcCtVJ/UXgfhjyAbFvsg8RcxZGbaGFDjcczK62W
	e/GoWiHjhj3KPMwkQk56xn7qj89YIivRh1dpnWVYpO4HM5YlUd2zZVChzGe+x485iVVM2OKzkKK
	j1mLFjAmCcov/yGqfTSFBbSbD+qlSuwXVxtsobF8E5WmV10V6RuuYk7XUo70M2n7GJA7QtwMCJJ
	zsE3pfVZKYTn4aHdPiheMyLMeH/ufxoaoJWbnKU1YjxW1o0/pjt1LOtF8n3HA20vNzFfRojZgeF
	L2T3UhXegOkKYZ4wuKBIEFGlUcyOaC2DkeyjGu76lW0AEFgLMO/A
X-Google-Smtp-Source: AGHT+IGVKtM5eljGkCrzTpD2ovzaQ8f+au6jsqSHcIImWj4PNZP1imBC1ZW1MG0yi5By14S+t9g+3w==
X-Received: by 2002:a05:6000:228a:b0:39d:6f2b:e74d with SMTP id ffacd0b85a97d-39efbae02a8mr13054124f8f.39.1745321538982;
        Tue, 22 Apr 2025 04:32:18 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:18 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	andersson@kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	tglx@linutronix.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	pmladek@suse.com,
	peterz@infradead.org,
	mojha@qti.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	vincent.guittot@linaro.org,
	konradybcio@kernel.org,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	eugen.hristev@linaro.org,
	Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [RFC][PATCH 06/14] kmemdump: add coreimage ELF layer
Date: Tue, 22 Apr 2025 14:31:48 +0300
Message-ID: <20250422113156.575971-7-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422113156.575971-1-eugen.hristev@linaro.org>
References: <20250422113156.575971-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement kmemdumping into an ELF coreimage.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Co-developed-by: Mukesh Ojha <quic_mojha@quicinc.com>
Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/debug/Kconfig              |  10 +
 drivers/debug/Makefile             |   1 +
 drivers/debug/kmemdump.c           |  12 ++
 drivers/debug/kmemdump_coreimage.c | 285 +++++++++++++++++++++++++++++
 include/linux/kmemdump.h           |  25 +++
 5 files changed, 333 insertions(+)
 create mode 100644 drivers/debug/kmemdump_coreimage.c

diff --git a/drivers/debug/Kconfig b/drivers/debug/Kconfig
index 72a906487e02..cd73f299e5cd 100644
--- a/drivers/debug/Kconfig
+++ b/drivers/debug/Kconfig
@@ -14,6 +14,16 @@ config DRIVER_KMEMDUMP
 	  Note that modules using this feature must be rebuilt if option
 	  changes.
 
+config DRIVER_KMEMDUMP_COREIMAGE
+	depends on DRIVER_KMEMDUMP
+	bool "Assemble memory regions into a coredump readable with debuggers"
+	help
+	  Enabling this will assemble all the memory regions into a
+	  core ELF file. The first region will include program headers for
+	  all the regions, together with vmcoreinfo and specific coredump
+	  structures. The coredump file can then be loaded into GDB or crash
+	  tool and further inspected.
+
 config QCOM_MD_KMEMDUMP_BACKEND
 	tristate "Qualcomm Minidump kmemdump backend driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/debug/Makefile b/drivers/debug/Makefile
index d8a9db29cd15..95ecc315b376 100644
--- a/drivers/debug/Makefile
+++ b/drivers/debug/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_DRIVER_KMEMDUMP) += kmemdump.o
+obj-$(CONFIG_DRIVER_KMEMDUMP_COREIMAGE) += kmemdump_coreimage.o
 obj-$(CONFIG_QCOM_MD_KMEMDUMP_BACKEND) += qcom_md.o
diff --git a/drivers/debug/kmemdump.c b/drivers/debug/kmemdump.c
index a685c0863e25..be96b39a136a 100644
--- a/drivers/debug/kmemdump.c
+++ b/drivers/debug/kmemdump.c
@@ -58,6 +58,7 @@ int kmemdump_register(char *handle, void *zone, size_t size)
 			return ret;
 		}
 		z->registered = true;
+		update_elfheader(z);
 	}
 
 	mutex_unlock(&kmemdump_lock);
@@ -84,6 +85,7 @@ void kmemdump_unregister(int id)
 	if (z->registered && backend)
 		backend->unregister_region(z->id);
 
+	clear_elfheader(z);
 	idr_remove(&kmemdump_idr, id);
 	kfree(z);
 
@@ -103,6 +105,7 @@ static int kmemdump_register_fn(int id, void *p, void *data)
 	if (ret)
 		return ret;
 	z->registered = true;
+	update_elfheader(z);
 
 	return 0;
 }
@@ -130,6 +133,14 @@ int kmemdump_register_backend(struct kmemdump_backend *be)
 	pr_info("kmemdump backend %s registered successfully.\n",
 		backend->name);
 
+	init_elfheader(backend);
+
+	mutex_unlock(&kmemdump_lock);
+
+	register_coreinfo();
+
+	mutex_lock(&kmemdump_lock);
+
 	/* Try to call the backend for all previously requested zones */
 	idr_for_each(&kmemdump_idr, kmemdump_register_fn, NULL);
 
@@ -151,6 +162,7 @@ static int kmemdump_unregister_fn(int id, void *p, void *data)
 	if (ret)
 		return ret;
 	z->registered = false;
+	clear_elfheader(z);
 
 	return 0;
 }
diff --git a/drivers/debug/kmemdump_coreimage.c b/drivers/debug/kmemdump_coreimage.c
new file mode 100644
index 000000000000..59630adf5dd2
--- /dev/null
+++ b/drivers/debug/kmemdump_coreimage.c
@@ -0,0 +1,285 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/init.h>
+#include <linux/elfcore.h>
+#include <linux/kmemdump.h>
+#include <linux/utsname.h>
+#include <linux/sched/stat.h>
+#include <linux/vmcore_info.h>
+
+#define CORE_STR "CORE"
+#define KMEMDUMP_ELF_ID 0
+
+#define MAX_NUM_ENTRIES	  201
+
+/**
+ * struct kmemdump_elfhdr - Kmemdump table elf header
+ * @ehdr: elf main header
+ * @phdr: Program header
+ * @elf_offset: Section offset in elf
+ */
+struct kmemdump_elfhdr {
+	struct elfhdr	 *ehdr;
+	struct elf_phdr	 *phdr;
+	size_t		 elf_offset;
+} elf;
+
+extern char kernel_config_data;
+
+/**
+ * register_coreinfo() - Register vital kernel information into the coreimage
+ *
+ * Return: None
+ */
+void register_coreinfo(void)
+{
+	/*
+	 * Right before kernel_config_data there is a marker string,
+	 * capture it as well.
+	 * Debug tools don't care about config size, they just try 64K and
+	 * if it's not enough, double it.
+	 */
+	kmemdump_register("config", (void *)&kernel_config_data - 8,
+			  128 * 1024);
+	kmemdump_register("utsn", (void *)&init_uts_ns,
+			  sizeof(init_uts_ns));
+	kmemdump_register("banner", (void *)&linux_banner,
+			  strlen(linux_banner));
+	kmemdump_register("percpu", (void *)&__per_cpu_offset,
+			  sizeof(__per_cpu_offset));
+	kmemdump_register("init_mm", (void *)&init_mm,
+			  sizeof(init_mm));
+	kmemdump_register("mmpgd", (void *)init_mm.pgd,
+			  sizeof(*init_mm.pgd));
+	kmemdump_register("highmem", (void *)&high_memory,
+			  sizeof(&high_memory));
+	kmemdump_register("memsect", (void *)*mem_section,
+			  sizeof(struct mem_section) * NR_SECTION_ROOTS);
+	kmemdump_register("memsect", (void *)&mem_section,
+			  sizeof(&mem_section));
+	kmemdump_register("totalram", (void *)&_totalram_pages,
+			  sizeof(_totalram_pages));
+	kmemdump_register("node_states", (void *)&node_states,
+			  sizeof(node_states));
+	kmemdump_register("nr_threads", (void *)&nr_threads,
+			  sizeof(nr_threads));
+	kmemdump_register("cpu_po", (void *)cpu_possible_mask,
+			  sizeof(cpumask_t));
+	kmemdump_register("cpu_pr", (void *)cpu_present_mask,
+			  sizeof(cpumask_t));
+	kmemdump_register("cpu_on", (void *)cpu_online_mask,
+			  sizeof(cpumask_t));
+	kmemdump_register("jiffies", (void *)&jiffies_64,
+			  sizeof(jiffies_64));
+}
+
+static struct elf_phdr *elf_phdr_entry_addr(struct elfhdr *ehdr, int idx)
+{
+	struct elf_phdr *ephdr = (struct elf_phdr *)((size_t)ehdr + ehdr->e_phoff);
+
+	return &ephdr[idx];
+}
+
+/**
+ * clear_elfheader() - Remove the program header for a specific memory zone
+ * @z: pointer to the kmemdump zone
+ *
+ * Return: On success, it returns 0, errno otherwise
+ */
+int clear_elfheader(const struct kmemdump_zone *z)
+{
+	struct elfhdr *ehdr = elf.ehdr;
+	struct elf_phdr *phdr;
+	struct elf_phdr *tmp_phdr;
+	unsigned int phidx;
+	unsigned int i;
+
+	for (i = 0; i < ehdr->e_phnum; i++) {
+		phdr = elf_phdr_entry_addr(ehdr, i);
+		if (phdr->p_paddr == virt_to_phys(z->zone) &&
+		    phdr->p_memsz == ALIGN(z->size, 4))
+			break;
+	}
+
+	if (i == ehdr->e_phnum) {
+		pr_err("Cannot find program header entry in elf\n");
+		return -EINVAL;
+	}
+
+	phidx = i;
+
+	/* Clear program header */
+	tmp_phdr = elf_phdr_entry_addr(ehdr, phidx);
+	for (i = phidx; i < ehdr->e_phnum - 1; i++) {
+		tmp_phdr = elf_phdr_entry_addr(ehdr, i + 1);
+		phdr = elf_phdr_entry_addr(ehdr, i);
+		memcpy(phdr, tmp_phdr, sizeof(*phdr));
+		phdr->p_offset = phdr->p_offset - ALIGN(z->size, 4);
+	}
+	memset(tmp_phdr, 0, sizeof(*tmp_phdr));
+	ehdr->e_phnum--;
+
+	elf.elf_offset -= ALIGN(z->size, 4);
+
+	return 0;
+}
+
+/**
+ * update_elfheader() - Add the program header for a specific memory zone
+ * @z: pointer to the kmemdump zone
+ *
+ * Return: None
+ */
+void update_elfheader(const struct kmemdump_zone *z)
+{
+	struct elfhdr *ehdr = elf.ehdr;
+	struct elf_phdr *phdr;
+
+	phdr = elf_phdr_entry_addr(ehdr, ehdr->e_phnum++);
+
+	phdr->p_type = PT_LOAD;
+	phdr->p_offset = elf.elf_offset;
+	phdr->p_vaddr = (elf_addr_t)z->zone;
+	phdr->p_paddr = (elf_addr_t)virt_to_phys(z->zone);
+	phdr->p_filesz = phdr->p_memsz = ALIGN(z->size, 4);
+	phdr->p_flags = PF_R | PF_W;
+
+	elf.elf_offset += ALIGN(z->size, 4);
+}
+
+static void append_kcore_note(char *notes, size_t *i, const char *name,
+			      unsigned int type, const void *desc,
+			      size_t descsz)
+{
+	struct elf_note *note = (struct elf_note *)&notes[*i];
+
+	note->n_namesz = strlen(name) + 1;
+	note->n_descsz = descsz;
+	note->n_type = type;
+	*i += sizeof(*note);
+	memcpy(&notes[*i], name, note->n_namesz);
+	*i = ALIGN(*i + note->n_namesz, 4);
+	memcpy(&notes[*i], desc, descsz);
+	*i = ALIGN(*i + descsz, 4);
+}
+
+static void append_kcore_note_nodesc(char *notes, size_t *i, const char *name,
+				     unsigned int type, size_t descsz)
+{
+	struct elf_note *note = (struct elf_note *)&notes[*i];
+
+	note->n_namesz = strlen(name) + 1;
+	note->n_descsz = descsz;
+	note->n_type = type;
+	*i += sizeof(*note);
+	memcpy(&notes[*i], name, note->n_namesz);
+	*i = ALIGN(*i + note->n_namesz, 4);
+}
+
+/**
+ * init_elfheader() - Prepare coreinfo elf header
+ *		This function prepares the elf header for the coredump image.
+ *		Initially there is a single program header for the elf NOTE.
+ *		The note contains the usual core dump information, and the
+ *		vmcoreinfo.
+ * @z: pointer to the kmemdump zone
+ *
+ * Return: 0 on success, errno otherwise
+ */
+int init_elfheader(struct kmemdump_backend *be)
+{
+	struct elfhdr *ehdr;
+	struct elf_phdr *phdr;
+	void *notes;
+	unsigned int elfh_size;
+	unsigned int phdr_off;
+	size_t note_len, i = 0;
+
+	struct elf_prstatus prstatus = {};
+	struct elf_prpsinfo prpsinfo = {
+		.pr_sname = 'R',
+		.pr_fname = "vmlinux",
+	};
+
+	/*
+	 * Header buffer contains:
+	 * ELF header, Note entry with PR status, PR ps info, and vmcoreinfo
+	 * MAX_NUM_ENTRIES Program headers,
+	 */
+	elfh_size = sizeof(*ehdr);
+	elfh_size += sizeof(struct elf_prstatus);
+	elfh_size += sizeof(struct elf_prpsinfo);
+	elfh_size += sizeof(VMCOREINFO_NOTE_NAME);
+	elfh_size += ALIGN(vmcoreinfo_size, 4);
+	elfh_size += (sizeof(*phdr)) * (MAX_NUM_ENTRIES);
+
+	elfh_size = ALIGN(elfh_size, 4);
+
+	elf.ehdr = kzalloc(elfh_size, GFP_KERNEL);
+	if (!elf.ehdr)
+		return -ENOMEM;
+
+	ehdr = elf.ehdr;
+	/* Assign Program headers offset, it's right after the elf header. */
+	elf.phdr = phdr = (struct elf_phdr *)(ehdr + 1);
+	phdr_off = sizeof(*ehdr);
+
+	memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
+	ehdr->e_ident[EI_CLASS] = ELF_CLASS;
+	ehdr->e_ident[EI_DATA] = ELF_DATA;
+	ehdr->e_ident[EI_VERSION] = EV_CURRENT;
+	ehdr->e_ident[EI_OSABI] = ELF_OSABI;
+	ehdr->e_type = ET_CORE;
+	ehdr->e_machine  = ELF_ARCH;
+	ehdr->e_version = EV_CURRENT;
+	ehdr->e_ehsize = sizeof(*ehdr);
+	ehdr->e_phentsize = sizeof(*phdr);
+
+	elf.elf_offset = elfh_size;
+
+	notes = (void *)(((char *)elf.ehdr) + elf.elf_offset);
+
+	/* we have a single program header now */
+	ehdr->e_phnum = 1;
+
+	/* Length of the note is made of :
+	 * 3 elf notes structs (prstatus, prpsinfo, vmcoreinfo)
+	 * 3 notes names (2 core strings, 1 vmcoreinfo name)
+	 * sizeof each note
+	 */
+	note_len = (3 * sizeof(struct elf_note) +
+		    2 * ALIGN(sizeof(CORE_STR), 4) +
+		    VMCOREINFO_NOTE_NAME_BYTES +
+		    ALIGN(sizeof(struct elf_prstatus), 4) +
+		    ALIGN(sizeof(struct elf_prpsinfo), 4) +
+		    ALIGN(vmcoreinfo_size, 4));
+
+	phdr->p_type = PT_NOTE;
+	phdr->p_offset = elf.elf_offset;
+	phdr->p_filesz = note_len;
+
+	/* advance elf offset */
+	elf.elf_offset += note_len;
+
+	strscpy(prpsinfo.pr_psargs, saved_command_line,
+		sizeof(prpsinfo.pr_psargs));
+
+	append_kcore_note(notes, &i, CORE_STR, NT_PRSTATUS, &prstatus,
+			  sizeof(prstatus));
+	append_kcore_note(notes, &i, CORE_STR, NT_PRPSINFO, &prpsinfo,
+			  sizeof(prpsinfo));
+	append_kcore_note_nodesc(notes, &i, VMCOREINFO_NOTE_NAME, 0,
+				 ALIGN(vmcoreinfo_size, 4));
+
+	ehdr->e_phoff = phdr_off;
+
+	/* This is the first kmemdump region, the ELF header */
+	be->register_region(KMEMDUMP_ELF_ID, "ELF", elf.ehdr,
+			    elfh_size + note_len - ALIGN(vmcoreinfo_size, 4));
+
+	/* The second region is the vmcoreinfo, which goes right after */
+	be->register_region(KMEMDUMP_ELF_ID, "vmcoreinfo", vmcoreinfo_data,
+			    ALIGN(vmcoreinfo_size, 4));
+
+	return 0;
+}
diff --git a/include/linux/kmemdump.h b/include/linux/kmemdump.h
index b55b15c295ac..13aabd72d17a 100644
--- a/include/linux/kmemdump.h
+++ b/include/linux/kmemdump.h
@@ -49,4 +49,29 @@ static inline void kmemdump_unregister(int id)
 
 int kmemdump_register_backend(struct kmemdump_backend *backend);
 void kmemdump_unregister_backend(struct kmemdump_backend *backend);
+
+#ifdef CONFIG_DRIVER_KMEMDUMP_COREIMAGE
+int init_elfheader(struct kmemdump_backend *be);
+void update_elfheader(const struct kmemdump_zone *z);
+int clear_elfheader(const struct kmemdump_zone *z);
+void register_coreinfo(void);
+#else
+static inline int init_elfheader(struct kmemdump_backend *be)
+{
+	return 0;
+}
+
+static inline void update_elfheader(const struct kmemdump_zone *z)
+{
+}
+
+static inline int clear_elfheader(const struct kmemdump_zone *z)
+{
+	return 0;
+}
+
+static inline void register_coreinfo(void)
+{
+}
+#endif
 #endif
-- 
2.43.0


