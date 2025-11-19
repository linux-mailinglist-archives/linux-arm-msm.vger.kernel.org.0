Return-Path: <linux-arm-msm+bounces-82559-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E684FC6FCC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 16:51:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id A118D2ED44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 15:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5E9341077;
	Wed, 19 Nov 2025 15:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dCa/4hQ4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1F62EBBB4
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 15:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567175; cv=none; b=ab7nOaKR096Kmvw78glGlowP8AVLn4gmUWxVZMDaA480pOG4kqu+xHMW7VsRK80Vf41mV4n9jlVV65edLXYgyO+p+oiIohj1OqTa99tU1m/aw6PcnMwdL7cRhSofHD5Verj0pPFcLj9Do5H2xCzXqBBY7Bi9N7Psz+9KtJhpCD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567175; c=relaxed/simple;
	bh=f3ivw/X7k9GlCbiVs54CUIA/jWBXKlGJ8Yjl1U+AcTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B130POiWnoDFqFSQgB5uu/i/+XQkq+zWnYqnTLgTHuWCv+XLQwRNT4jy4gyG/ut9Wkrd/IR6X8FWw7lColXDUNxcfa3Yip8tXpaHh2j1HPkpcRyygkLMRMIyDeRvgJjk7tn0cjPWg05OaSy1gHzM3cSqQR4Z0LeircGVm8otTYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dCa/4hQ4; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b3ac40ae4so4187087f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 07:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567157; x=1764171957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aBNrwlYX8KQq53Dd2Ff7QORfdDzZbYxDqKu/vrV5PaM=;
        b=dCa/4hQ48Hjq7BSjuCS1fi++8OazBBBghVqyAKOA5S5UMJACUxUIjGgU8rkqnEf+PH
         PFmT4YhqkBIvw5DJz9t8mqnZ3+kVC14CitO6OaX2Uiesoqo0TgCl56HZZw0Rph7tBLZR
         CTMulBFZnRvRXrGF0Z5RrStTF1d9wvCxDh5dW/ZUKeIrB12IOJizdkASRhEjp0UufNco
         IjMN5Ym+14JJnsWmxeZNGjK3SQBufkLkYZXBIc+SRB3JEnN7cvnKrHOLhIZPSccN7BF1
         WfueqgGUlNLk3kVSjyuw7CdifKIZJ/YvVnpG0CNhC9QLKcsEb8wsC1hhDZqPKUbDbQ55
         dN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567157; x=1764171957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aBNrwlYX8KQq53Dd2Ff7QORfdDzZbYxDqKu/vrV5PaM=;
        b=Iye9O78zU0Vtrd3P0M9cSIwG+H0SrPbXpIdqHWhZRH+e/gPIxwJqCp30VfLSQk0L4v
         A5GWbavJVl7wGN7J+4uKuxsfZpL0pPKI1QK+CZqRn+iiya1E3ff7RMCRv2qi3qn/QwmR
         VFgK7awvauHvGgALBFKrnmlkk6WlfDYyc2GHNk+BMBHprJmdU6mZ5Q/Jxxze54vmy5Ng
         K14hnWOZHRQW+PI5DrFdL4cbJvE1Gmi7f7oGC5fTuQm2P8tJiHKSLQQPwl8D1xWYRUfD
         A8rdMV8ejQx55e1UxbDG/89O8IVLRHWscFp/PPkZUNuG2iMof7YV9Hz4M3DF8jFN9rY1
         15Aw==
X-Gm-Message-State: AOJu0YyttEbuDecyzUNxYiZJ96aTnPyhnRlN+l3pAaAEn0lsT4iDp531
	tm55+0GzOA6t+o9UmEhRezj6GYtQ0fxSSBPZRCGh3rhltElsAfBTGdTILNK6ay88L25XzzNxMRS
	0V4EVcIYSKQ==
X-Gm-Gg: ASbGncs3SF+q7AWsVJOr7GP0iHmY5QR9eCDbU24RDtItI9eJxAJJpyMWx1fB/SK7OoM
	QN0Znxe3W/mrAWaYcwRvxdZEwKjVFPw9s34oB28h6iKOXQbl9prh5hljdsK5mLFtvCfi8fat8mm
	uJWO7gDIQCqIYGS4B4zVV2Mzpp4C81LPTBJmW92d51FHsOs7SQzkMHFl/BOYEyfmX/nA/NhwF+k
	p6CmoYZguanNfPuK+BA8i7vQLISaLy1EU7Vb3gS964+TOrG25aHCTc+FINdHQ0XKQv7UQIec9St
	HiQhpROqTxXG9ZVOIsCR4lzcLeGFleF5+qFgJQqeOTQM0dOIYR8S6XHhoQ943LnN5T/Co1L8uVN
	V5/OXSu7Ux0fxozwZn4y50/UgYfWghBiPPvWXc2cjssmbILmk34RZR9GIZefae5Aoa8HO1Y+jdL
	SnVd5H+LrO1yzTRKXAWw0=
X-Google-Smtp-Source: AGHT+IHMsSbrwKXE/iT+c2iGpRnN+BNbOo3hGgZttZwiDhEyh5x/2x4kZMct8HS2b5hiT6bCYQDvdQ==
X-Received: by 2002:a05:6000:2083:b0:42b:3867:b39c with SMTP id ffacd0b85a97d-42b593745c4mr20164142f8f.34.1763567157017;
        Wed, 19 Nov 2025 07:45:57 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:56 -0800 (PST)
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
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 23/26] soc: qcom: Add minidump driver
Date: Wed, 19 Nov 2025 17:44:24 +0200
Message-ID: <20251119154427.1033475-24-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Qualcomm Minidump is a driver that manages the minidump shared memory
table on Qualcomm platforms.
It uses the meminspect table that it parses , in order to obtain inspection
entries from the kernel, and convert them into regions.
Regions are afterwards being registered into the shared memory
and into the table of contents.
Further, the firmware can read the table of contents and dump the memory
accordingly, as per the firmware requirements.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/soc/qcom/Kconfig          |  13 ++
 drivers/soc/qcom/Makefile         |   1 +
 drivers/soc/qcom/minidump.c       | 272 ++++++++++++++++++++++++++++++
 include/linux/soc/qcom/minidump.h |   4 +
 4 files changed, 290 insertions(+)
 create mode 100644 drivers/soc/qcom/minidump.c

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2caadbbcf830..be768537528e 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -180,6 +180,19 @@ config QCOM_SMEM
 	  The driver provides an interface to items in a heap shared among all
 	  processors in a Qualcomm platform.
 
+config QCOM_MINIDUMP
+	tristate "Qualcomm Minidump memory inspection driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on QCOM_SMEM
+	help
+	  Say y here to enable the Qualcomm Minidump memory inspection driver.
+	  This driver uses memory inspection mechanism to register minidump
+	  regions with the Qualcomm firmware, into the shared memory.
+	  The registered regions are being linked into the minidump table
+	  of contents.
+	  Further on, the firmware will be able to read the table of contents
+	  and extract the memory regions on case-by-case basis.
+
 config QCOM_SMD_RPM
 	tristate "Qualcomm Resource Power Manager (RPM) over SMD"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index b7f1d2a57367..3e5a2cacccd4 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -25,6 +25,7 @@ qcom_rpmh-y			+= rpmh.o
 obj-$(CONFIG_QCOM_SMD_RPM)	+= rpm-proc.o smd-rpm.o
 obj-$(CONFIG_QCOM_SMEM) +=	smem.o
 obj-$(CONFIG_QCOM_SMEM_STATE) += smem_state.o
+obj-$(CONFIG_QCOM_MINIDUMP)	+= minidump.o
 CFLAGS_smp2p.o := -I$(src)
 obj-$(CONFIG_QCOM_SMP2P)	+= smp2p.o
 obj-$(CONFIG_QCOM_SMSM)	+= smsm.o
diff --git a/drivers/soc/qcom/minidump.c b/drivers/soc/qcom/minidump.c
new file mode 100644
index 000000000000..67ebbf09c171
--- /dev/null
+++ b/drivers/soc/qcom/minidump.c
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Qualcomm Minidump kernel inspect driver
+ * Copyright (C) 2016,2024-2025 Linaro Ltd
+ * Copyright (C) 2015 Sony Mobile Communications Inc
+ * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/notifier.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/smem.h>
+#include <linux/soc/qcom/minidump.h>
+#include <linux/meminspect.h>
+
+/**
+ * struct minidump - Minidump driver data information
+ *
+ * @dev:	Minidump device struct.
+ * @toc:	Minidump table of contents subsystem.
+ * @regions:	Minidump regions array.
+ * @nb:		Notifier block to register to meminspect.
+ */
+struct minidump {
+	struct device			*dev;
+	struct minidump_subsystem	*toc;
+	struct minidump_region		*regions;
+	struct notifier_block		nb;
+};
+
+static const char * const meminspect_id_to_md_string[] = {
+	"",
+	"ELF",
+	"vmcoreinfo",
+	"config",
+	"totalram",
+	"cpu_possible",
+	"cpu_present",
+	"cpu_online",
+	"cpu_active",
+	"mem_section",
+	"jiffies",
+	"linux_banner",
+	"nr_threads",
+	"nr_irqs",
+	"tainted_mask",
+	"taint_flags",
+	"node_states",
+	"__per_cpu_offset",
+	"nr_swapfiles",
+	"init_uts_ns",
+	"printk_rb_static",
+	"printk_rb_dynamic",
+	"prb",
+	"prb_descs",
+	"prb_infos",
+	"prb_data",
+	"high_memory",
+	"init_mm",
+	"init_mm_pgd",
+};
+
+/**
+ * qcom_md_table_init() - Initialize the minidump table
+ * @md: minidump data
+ * @mdss_toc: minidump subsystem table of contents
+ *
+ * Return: On success, it returns 0 and negative error value on failure.
+ */
+static int qcom_md_table_init(struct minidump *md,
+			      struct minidump_subsystem *mdss_toc)
+{
+	md->toc = mdss_toc;
+	md->regions = devm_kcalloc(md->dev, MAX_NUM_REGIONS,
+				   sizeof(*md->regions), GFP_KERNEL);
+	if (!md->regions)
+		return -ENOMEM;
+
+	md->toc->regions_baseptr = cpu_to_le64(virt_to_phys(md->regions));
+	md->toc->enabled = cpu_to_le32(MINIDUMP_SS_ENABLED);
+	md->toc->status = cpu_to_le32(1);
+	md->toc->region_count = cpu_to_le32(0);
+
+	/* Tell bootloader not to encrypt the regions of this subsystem */
+	md->toc->encryption_status = cpu_to_le32(MINIDUMP_SS_ENCR_DONE);
+	md->toc->encryption_required = cpu_to_le32(MINIDUMP_SS_ENCR_NOTREQ);
+
+	return 0;
+}
+
+/**
+ * qcom_md_get_region_index() - Lookup minidump region by id
+ * @md: minidump data
+ * @id: minidump region id
+ *
+ * Return: On success, it returns the internal region index, on failure,
+ *	returns	negative error value
+ */
+static int qcom_md_get_region_index(struct minidump *md, int id)
+{
+	unsigned int count = le32_to_cpu(md->toc->region_count);
+	unsigned int i;
+
+	for (i = 0; i < count; i++)
+		if (md->regions[i].seq_num == id)
+			return i;
+
+	return -ENOENT;
+}
+
+/**
+ * register_md_region() - Register a new minidump region
+ * @priv: private data
+ * @e: pointer to inspect entry
+ *
+ * Return: None
+ */
+static void __maybe_unused register_md_region(void *priv,
+					      const struct inspect_entry *e)
+{
+	unsigned int num_region, region_cnt;
+	const char *name = "unknown";
+	struct minidump_region *mdr;
+	struct minidump *md = priv;
+
+	if (!(e->va || e->pa) || !e->size) {
+		dev_dbg(md->dev, "invalid region requested\n");
+		return;
+	}
+
+	if (e->id < ARRAY_SIZE(meminspect_id_to_md_string))
+		name = meminspect_id_to_md_string[e->id];
+
+	if (qcom_md_get_region_index(md, e->id) >= 0) {
+		dev_dbg(md->dev, "%s:%d region is already registered\n",
+			name, e->id);
+		return;
+	}
+
+	/* Check if there is a room for a new entry */
+	num_region = le32_to_cpu(md->toc->region_count);
+	if (num_region >= MAX_NUM_REGIONS) {
+		dev_dbg(md->dev, "maximum region limit %u reached\n",
+			num_region);
+		return;
+	}
+
+	region_cnt = le32_to_cpu(md->toc->region_count);
+	mdr = &md->regions[region_cnt];
+	scnprintf(mdr->name, MAX_REGION_NAME_LENGTH, "K%.8s", name);
+	mdr->seq_num = e->id;
+	if (e->pa)
+		mdr->address = cpu_to_le64(e->pa);
+	else if (e->va)
+		mdr->address = cpu_to_le64(__pa(e->va));
+	mdr->size = cpu_to_le64(ALIGN(e->size, 4));
+	mdr->valid = cpu_to_le32(MINIDUMP_REGION_VALID);
+	region_cnt++;
+	md->toc->region_count = cpu_to_le32(region_cnt);
+
+	dev_dbg(md->dev, "%s:%d region registered %llx:%llx\n",
+		mdr->name, mdr->seq_num, mdr->address, mdr->size);
+}
+
+/**
+ * unregister_md_region() - Unregister a previously registered minidump region
+ * @priv: private data
+ * @e: pointer to inspect entry
+ *
+ * Return: None
+ */
+static void __maybe_unused unregister_md_region(void *priv,
+						const struct inspect_entry *e)
+{
+	struct minidump_region *mdr;
+	struct minidump *md = priv;
+	unsigned int region_cnt;
+	unsigned int idx;
+
+	idx = qcom_md_get_region_index(md, e->id);
+	if (idx < 0) {
+		dev_dbg(md->dev, "%d region is not present\n", e->id);
+		return;
+	}
+
+	mdr = &md->regions[0];
+	region_cnt = le32_to_cpu(md->toc->region_count);
+
+	/*
+	 * Left shift one position all the regions located after the
+	 * region being removed, in order to fill the gap.
+	 * Then, zero out the last region at the end.
+	 */
+	memmove(&mdr[idx], &mdr[idx + 1], (region_cnt - idx - 1) * sizeof(*mdr));
+	memset(&mdr[region_cnt - 1], 0, sizeof(*mdr));
+	region_cnt--;
+	md->toc->region_count = cpu_to_le32(region_cnt);
+}
+
+static int qcom_md_notifier_cb(struct notifier_block *nb,
+			       unsigned long code, void *entry)
+{
+	struct minidump *md = container_of(nb, struct minidump, nb);
+
+	if (code == MEMINSPECT_NOTIFIER_ADD)
+		register_md_region(md, entry);
+	else if (code == MEMINSPECT_NOTIFIER_REMOVE)
+		unregister_md_region(md, entry);
+
+	return 0;
+}
+
+static int qcom_md_probe(struct platform_device *pdev)
+{
+	struct minidump_global_toc *mdgtoc;
+	struct device *dev = &pdev->dev;
+	struct minidump *md;
+	size_t size;
+	int ret;
+
+	md = devm_kzalloc(dev, sizeof(*md), GFP_KERNEL);
+	if (!md)
+		return -ENOMEM;
+	platform_set_drvdata(pdev, md);
+
+	md->dev = dev;
+	md->nb.notifier_call = qcom_md_notifier_cb;
+
+	mdgtoc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, &size);
+	if (IS_ERR(mdgtoc)) {
+		ret = PTR_ERR(mdgtoc);
+		dev_err_probe(dev, ret, "Couldn't find minidump smem item\n");
+	}
+
+	if (size < sizeof(*mdgtoc) || !mdgtoc->status)
+		dev_err_probe(dev, -EINVAL, "minidump table not ready\n");
+
+	ret = qcom_md_table_init(md, &mdgtoc->subsystems[MINIDUMP_SUBSYSTEM_APSS]);
+	if (ret)
+		dev_err_probe(dev, ret, "Could not initialize table\n");
+
+	meminspect_notifier_register(&md->nb);
+
+	meminspect_lock_traverse(md, register_md_region);
+	return 0;
+}
+
+static void qcom_md_remove(struct platform_device *pdev)
+{
+	struct minidump *md = platform_get_drvdata(pdev);
+
+	meminspect_notifier_unregister(&md->nb);
+	meminspect_lock_traverse(md, unregister_md_region);
+}
+
+static struct platform_driver qcom_md_driver = {
+	.probe = qcom_md_probe,
+	.remove = qcom_md_remove,
+	.driver  = {
+		.name = "qcom-minidump",
+	},
+};
+
+module_platform_driver(qcom_md_driver);
+
+MODULE_AUTHOR("Eugen Hristev <eugen.hristev@linaro.org>");
+MODULE_AUTHOR("Mukesh Ojha <quic_mojha@quicinc.com>");
+MODULE_DESCRIPTION("Qualcomm minidump inspect driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/soc/qcom/minidump.h b/include/linux/soc/qcom/minidump.h
index 25247a6216e2..f90b61feb550 100644
--- a/include/linux/soc/qcom/minidump.h
+++ b/include/linux/soc/qcom/minidump.h
@@ -10,12 +10,16 @@
 #ifndef __QCOM_MINIDUMP_H__
 #define __QCOM_MINIDUMP_H__
 
+#define MINIDUMP_SUBSYSTEM_APSS	0
 #define MAX_NUM_OF_SS           10
 #define MAX_REGION_NAME_LENGTH  16
 #define SBL_MINIDUMP_SMEM_ID	602
 #define MINIDUMP_REGION_VALID		('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
 #define MINIDUMP_SS_ENCR_DONE		('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
+#define MINIDUMP_SS_ENCR_NOTREQ		(0 << 24 | 0 << 16 | 'N' << 8 | 'R' << 0)
 #define MINIDUMP_SS_ENABLED		('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
+#define MAX_NUM_REGIONS		201
+
 
 /**
  * struct minidump_region - Minidump region
-- 
2.43.0


