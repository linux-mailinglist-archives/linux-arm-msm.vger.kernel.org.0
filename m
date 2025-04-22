Return-Path: <linux-arm-msm+bounces-54937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F93A9676E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 13:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2833E189E2FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Apr 2025 11:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6BC27CB3D;
	Tue, 22 Apr 2025 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VSfRPAG1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 042FD27C875
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 11:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745321538; cv=none; b=qFmtNI9VSJydmaZ8f3xTKbmT5CrAfvYyVZEWQ65Tf14Rkq7gepXdaopPHg6gbYkW2N+BmTskl5YbP7k5MIwasmHGQFZcvrp9kb7d20hQAJ85HMS3qaKCvwMW6ApXdR7PIoYoiFE/b6r1XhsCpJo7dx6d7GWr1SxUHdn9oYmRivA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745321538; c=relaxed/simple;
	bh=8jKxWe5l8OVfIf1ihdLZzhT0WCdG5pJVK0j+lvnJR90=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hQJYJCyf856oHlSrWWkbccfXsG4cddHPu+MyX8hxUEebyBL9o7iDtjDKRHcGxAdWQxK23COFugLZIVAPHtkIMexwf0+lbYmJW7gwVJdcK/VXlv5GtfnZIKZ7tlpzMMS0a5rEZb9Dw+aorg64sClN3aTKBzgVq0rpHoFOh2EZ1W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VSfRPAG1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso4890975f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 04:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745321534; x=1745926334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d6pSddhbiOlXQZYR80BvFSHp85nzfE1i19ocFXdQkwE=;
        b=VSfRPAG1MhhqvLBB7FZy3A/t/dp7abKAZNfvn7r21JubkCuRS07ToGFYeT4DtoIm9J
         ccNcrATmD0gVPCSQ8kdx4PTUzpEtVNgKa0JOkyzq0Th6//ipTxdLHgqbhRnnDvJY15ah
         TVcYjGUPgWrzEY4VvbiuFB2y+UJF99gE3tqHr99Wk4b0VrcqVSTd0wNlu9NRBnUvOH3h
         IkC88MK/l2K9TsIA7IjbrSo5sIAZw6Vc5qwzAY0psdwosa3LvzjOjiDA11GXtCvGplBT
         H8TWSsOJMzBd94sf8QkcIhe9KpsPrn1RHkq25f07MvoaL5MBQDcVNDXsGMsDKZetQdyS
         Dl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745321534; x=1745926334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d6pSddhbiOlXQZYR80BvFSHp85nzfE1i19ocFXdQkwE=;
        b=sDXwgi2HXAdnQF/ROTkfMrh4CdioFX4Mta6lZKDXAQ43ZZtXPGmXDwbkpxpNPP+B3n
         QB/t3p62e/NmcpSsLYum/DO8ucxy1McfkVBd3cvs+D4gGeOislgHYLzDSIhG+mXZWBnc
         yA31uDthxYc4yQPVCqz1HfkP3/Fh+BGoogO0hiZmS1sk4ZN2wJAuoSXRchJV6JlN8j5V
         DTO8O/DsgurnqWYUIWMHzVOY58/v9XxEfcI8A8924vgGSb3XznWT/k1sq4nSgY8f4nAu
         i+jzyvtdq77RfwxoMvDHMjqFMQvg9N7bN3NiNtaip0rR5A45sknhrxMfGB8dH0qjmP5t
         vIZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbcYoXxKE2Vaj1JuHVuknaGMi/Fz+dDHZjv0EdnCeB0AEltwrIypuoBTT5guOIXNMPU+bwNIXBaMG4UPW1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjc4i6L3y1ver6c+76pF4NXa6AzuORzBgcQtiMgKq+H6Spxl9U
	HutwVxyuNcsYSsWeXm/XO52E2aVidBs0SjI6uxUVLafuJUE6g5uygPkIELwCKnM=
X-Gm-Gg: ASbGnctMLf30rgMGiWr86xYtP3VLyyvlPewGY5kpCafy/HgOezZVNrt57//+9ZWJ8SI
	B9VWdNPUIy7VbJhNuD1QHAx5PAv3ONouiUB8peKGAeqCFEmjq65AwgGPv/vdtiBw2aRtZhqqZt0
	5ZBRYg5kslpcEmsPPyqQNUVVfQbeFj8VdQFnJi6d/MlMYa+jfijzZcXoZHhY3U+FUYBa6AZkFgy
	J+rxKABW6jgIMd8VWYQ9fi04DxpFQIx2bqM5uoqnbgiK/CegQ46R126WI0Lx7BoBQDyrAaCRlWL
	zjoi5RUOfB3WVI1CvOBCG2Py2UfdrnQ/rFF9yYFXUa2zXYUVxyfj
X-Google-Smtp-Source: AGHT+IH8BH2AMctcLQnSIe88Oq6tqGkueAiadNbece/cNfBYdRbZoMYjxa1qtqbDc5QTg+2ZudqOeg==
X-Received: by 2002:a5d:584e:0:b0:391:41c9:7a87 with SMTP id ffacd0b85a97d-39efbaf5562mr12324995f8f.51.1745321534238;
        Tue, 22 Apr 2025 04:32:14 -0700 (PDT)
Received: from eugen-station.. ([2a02:2f0a:131e:0:1820:da87:73b1:d80c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa49312fsm14907887f8f.70.2025.04.22.04.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 04:32:13 -0700 (PDT)
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
Subject: [RFC][PATCH 03/14] kmemdump: introduce qcom-md backend driver
Date: Tue, 22 Apr 2025 14:31:45 +0300
Message-ID: <20250422113156.575971-4-eugen.hristev@linaro.org>
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

Qualcomm Minidump is a backend driver for kmemdump.
Regions are being registered into the shared memory on Qualcomm platforms
and into the table of contents.
Further, the firmware can read the table of contents and dump the memory
accordingly.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
Co-developed-by: Mukesh Ojha <quic_mojha@quicinc.com>
Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/debug/Kconfig   |  13 ++
 drivers/debug/Makefile  |   1 +
 drivers/debug/qcom_md.c | 467 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 481 insertions(+)
 create mode 100644 drivers/debug/qcom_md.c

diff --git a/drivers/debug/Kconfig b/drivers/debug/Kconfig
index 22348608d187..72a906487e02 100644
--- a/drivers/debug/Kconfig
+++ b/drivers/debug/Kconfig
@@ -13,4 +13,17 @@ config DRIVER_KMEMDUMP
 
 	  Note that modules using this feature must be rebuilt if option
 	  changes.
+
+config QCOM_MD_KMEMDUMP_BACKEND
+	tristate "Qualcomm Minidump kmemdump backend driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on DRIVER_KMEMDUMP
+	help
+	  Say y here to enable the Qualcomm Minidump kmemdump backend
+	  driver.
+	  With this backend, the registered regions are being linked
+	  into the minidump table of contents. Further on, the firmware
+	  will be able to read the table of contents and extract the
+	  memory regions on case-by-case basis.
+
 endmenu
diff --git a/drivers/debug/Makefile b/drivers/debug/Makefile
index cc14dea250e3..d8a9db29cd15 100644
--- a/drivers/debug/Makefile
+++ b/drivers/debug/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_DRIVER_KMEMDUMP) += kmemdump.o
+obj-$(CONFIG_QCOM_MD_KMEMDUMP_BACKEND) += qcom_md.o
diff --git a/drivers/debug/qcom_md.c b/drivers/debug/qcom_md.c
new file mode 100644
index 000000000000..1aff28e18230
--- /dev/null
+++ b/drivers/debug/qcom_md.c
@@ -0,0 +1,467 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/smem.h>
+#include <linux/soc/qcom/socinfo.h>
+#include <linux/kmemdump.h>
+
+/*
+ * In some of the Old Qualcomm devices, boot firmware statically allocates 300
+ * as total number of supported region (including all co-processors) in
+ * minidump table out of which linux was using 201. In future, this limitation
+ * from boot firmware might get removed by allocating the region dynamically.
+ * So, keep it compatible with older devices, we can keep the current limit for
+ * Linux to 201.
+ */
+#define MAX_NUM_ENTRIES	  201
+
+#define MAX_NUM_OF_SS           10
+#define MAX_REGION_NAME_LENGTH  16
+#define SBL_MINIDUMP_SMEM_ID	602
+#define MINIDUMP_REGION_VALID	   ('V' << 24 | 'A' << 16 | 'L' << 8 | 'I' << 0)
+#define MINIDUMP_SS_ENCR_DONE	   ('D' << 24 | 'O' << 16 | 'N' << 8 | 'E' << 0)
+#define MINIDUMP_SS_ENABLED	   ('E' << 24 | 'N' << 16 | 'B' << 8 | 'L' << 0)
+
+#define MINIDUMP_SS_ENCR_NOTREQ	   (0 << 24 | 0 << 16 | 'N' << 8 | 'R' << 0)
+
+#define MINIDUMP_APSS_DESC	   0
+
+/**
+ * struct minidump - Minidump driver data information
+ * @apss_data: APSS driver data
+ * @md_lock: Lock to protect access to APSS minidump table
+ */
+struct minidump {
+	struct device		*dev;
+	struct minidump_ss_data	*apss_data;
+	struct mutex		md_lock;
+};
+
+/**
+ * struct minidump_region - Minidump region
+ * @name		: Name of the region to be dumped
+ * @seq_num:		: Use to differentiate regions with same name.
+ * @valid		: This entry to be dumped (if set to 1)
+ * @address		: Physical address of region to be dumped
+ * @size		: Size of the region
+ */
+struct minidump_region {
+	char	name[MAX_REGION_NAME_LENGTH];
+	__le32	seq_num;
+	__le32	valid;
+	__le64	address;
+	__le64	size;
+};
+
+/**
+ * struct minidump_subsystem - Subsystem's SMEM Table of content
+ * @status : Subsystem toc init status
+ * @enabled : if set to 1, this region would be copied during coredump
+ * @encryption_status: Encryption status for this subsystem
+ * @encryption_required : Decides to encrypt the subsystem regions or not
+ * @region_count : Number of regions added in this subsystem toc
+ * @regions_baseptr : regions base pointer of the subsystem
+ */
+struct minidump_subsystem {
+	__le32	status;
+	__le32	enabled;
+	__le32	encryption_status;
+	__le32	encryption_required;
+	__le32	region_count;
+	__le64	regions_baseptr;
+};
+
+/**
+ * struct minidump_global_toc - Global Table of Content
+ * @status : Global Minidump init status
+ * @md_revision : Minidump revision
+ * @enabled : Minidump enable status
+ * @subsystems : Array of subsystems toc
+ */
+struct minidump_global_toc {
+	__le32				status;
+	__le32				md_revision;
+	__le32				enabled;
+	struct minidump_subsystem	subsystems[MAX_NUM_OF_SS];
+};
+
+/**
+ * struct minidump_ss_data - Minidump subsystem private data
+ * @md_ss_toc: Application Subsystem TOC pointer
+ * @md_regions: Application Subsystem region base pointer
+ */
+struct minidump_ss_data {
+	struct minidump_subsystem *md_ss_toc;
+	struct minidump_region	  *md_regions;
+};
+
+#define MINIDUMP_MAX_NAME_LENGTH	12
+/**
+ * struct qcom_minidump_region - Minidump region information
+ *
+ * @name:	Minidump region name
+ * @virt_addr:  Virtual address of the entry.
+ * @phys_addr:	Physical address of the entry to dump.
+ * @size:	Number of bytes to dump from @address location,
+ *		and it should be 4 byte aligned.
+ */
+struct qcom_minidump_region {
+	char		name[MINIDUMP_MAX_NAME_LENGTH];
+	void		*virt_addr;
+	phys_addr_t	phys_addr;
+	size_t		size;
+	unsigned int	id;
+};
+
+static LIST_HEAD(apss_md_rlist);
+
+/**
+ * struct md_region_list - Minidump region list struct
+ *
+ * @md_region:	associated minidump region
+ * @list:  list head entry
+ */
+struct md_region_list {
+	struct qcom_minidump_region md_region;
+	struct list_head list;
+};
+
+static struct minidump *md;
+
+/**
+ * qcom_md_add_region() - Register region in APSS Minidump table.
+ * @region: minidump region.
+ *
+ * Return: None
+ */
+static void qcom_md_add_region(const struct qcom_minidump_region *region)
+{
+	struct minidump_subsystem *mdss_toc = md->apss_data->md_ss_toc;
+	struct minidump_region *mdr;
+	unsigned int region_cnt;
+
+	region_cnt = le32_to_cpu(mdss_toc->region_count);
+	mdr = &md->apss_data->md_regions[region_cnt];
+	strscpy(mdr->name, region->name, sizeof(mdr->name));
+	mdr->address = cpu_to_le64(region->phys_addr);
+	mdr->size = cpu_to_le64(region->size);
+	mdr->valid = cpu_to_le32(MINIDUMP_REGION_VALID);
+	region_cnt++;
+	mdss_toc->region_count = cpu_to_le32(region_cnt);
+}
+
+/**
+ * qcom_md_get_region_index() - Lookup minidump region by name
+ * @mdss_data: minidump subsystem data
+ * @region: minidump region.
+ *
+ * Return: On success, it returns the region index, on failure, returns
+ *	negative error value
+ */
+static int qcom_md_get_region_index(struct minidump_ss_data *mdss_data,
+				    const struct qcom_minidump_region *region)
+{
+	struct minidump_subsystem *mdss_toc = mdss_data->md_ss_toc;
+	struct minidump_region *mdr;
+	unsigned int i;
+	unsigned int count;
+
+	count = le32_to_cpu(mdss_toc->region_count);
+	for (i = 0; i < count; i++) {
+		mdr = &mdss_data->md_regions[i];
+		if (!strcmp(mdr->name, region->name))
+			return i;
+	}
+
+	return -ENOENT;
+}
+
+/**
+ * qcom_md_region_unregister() - Unregister region from APSS Minidump table.
+ * @region: minidump region.
+ *
+ * Return: On success, it returns 0 and negative error value on failure.
+ */
+static int qcom_md_region_unregister(const struct qcom_minidump_region *region)
+{
+	struct minidump_ss_data *mdss_data = md->apss_data;
+	struct minidump_subsystem *mdss_toc = mdss_data->md_ss_toc;
+	struct minidump_region *mdr;
+	unsigned int region_cnt;
+	unsigned int idx;
+	int ret;
+
+	ret = qcom_md_get_region_index(mdss_data, region);
+	if (ret < 0) {
+		dev_err(md->dev, "%s region is not present\n", region->name);
+		return ret;
+	}
+
+	idx = ret;
+	mdr = &mdss_data->md_regions[0];
+	region_cnt = le32_to_cpu(mdss_toc->region_count);
+	/*
+	 * Left shift all the regions exist after this removed region
+	 * index by 1 to fill the gap and zero out the last region
+	 * present at the end.
+	 */
+	memmove(&mdr[idx], &mdr[idx + 1], (region_cnt - idx - 1) * sizeof(*mdr));
+	memset(&mdr[region_cnt - 1], 0, sizeof(*mdr));
+	region_cnt--;
+	mdss_toc->region_count = cpu_to_le32(region_cnt);
+
+	return 0;
+}
+
+/**
+ * qcom_md_region_register() - Register region in APSS Minidump table.
+ * @region: minidump region.
+ *
+ * Return: On success, it returns 0 and negative error value on failure.
+ */
+static int qcom_md_region_register(const struct qcom_minidump_region *region)
+{
+	struct minidump_ss_data *mdss_data = md->apss_data;
+	struct minidump_subsystem *mdss_toc = mdss_data->md_ss_toc;
+	unsigned int num_region;
+	int ret;
+
+	ret = qcom_md_get_region_index(mdss_data, region);
+	if (ret >= 0) {
+		dev_info(md->dev, "%s region is already registered\n", region->name);
+		return -EEXIST;
+	}
+
+	/* Check if there is a room for a new entry */
+	num_region = le32_to_cpu(mdss_toc->region_count);
+	if (num_region >= MAX_NUM_ENTRIES) {
+		dev_err(md->dev, "maximum region limit %u reached\n", num_region);
+		return -ENOSPC;
+	}
+
+	qcom_md_add_region(region);
+
+	return 0;
+}
+
+/**
+ * qcom_minidump_valid_region() - Checks if region is valid
+ * @region: minidump region.
+ *
+ * Return: true if region is valid, false otherwise.
+ */
+static bool qcom_minidump_valid_region(const struct qcom_minidump_region *region)
+{
+	return region &&
+		strnlen(region->name, MINIDUMP_MAX_NAME_LENGTH) < MINIDUMP_MAX_NAME_LENGTH &&
+			region->virt_addr &&
+			region->size &&
+			IS_ALIGNED(region->size, 4);
+}
+
+/**
+ * qcom_minidump_region_register() - Register region in APSS Minidump table.
+ * @region: minidump region.
+ *
+ * Return: On success, it returns 0 and negative error value on failure.
+ */
+static int qcom_minidump_region_register(const struct qcom_minidump_region *region)
+{
+	int ret;
+
+	if (!qcom_minidump_valid_region(region))
+		return -EINVAL;
+
+	mutex_lock(&md->md_lock);
+	ret = qcom_md_region_register(region);
+
+	mutex_unlock(&md->md_lock);
+	return ret;
+}
+
+/**
+ * qcom_minidump_region_unregister() - Unregister region from APSS Minidump table.
+ * @region: minidump region.
+ *
+ * Return: On success, it returns 0 and negative error value on failure.
+ */
+static int qcom_minidump_region_unregister(const struct qcom_minidump_region *region)
+{
+	int ret;
+
+	if (!qcom_minidump_valid_region(region))
+		return -EINVAL;
+
+	mutex_lock(&md->md_lock);
+	ret = qcom_md_region_unregister(region);
+
+	mutex_unlock(&md->md_lock);
+	return ret;
+}
+
+/**
+ * qcom_apss_md_table_init() - Initialize the minidump table
+ * @mdss_toc: minidump subsystem table of contents
+ *
+ * Return: On success, it returns 0 and negative error value on failure.
+ */
+static int qcom_apss_md_table_init(struct minidump_subsystem *mdss_toc)
+{
+	struct minidump_ss_data *mdss_data;
+
+	mdss_data = devm_kzalloc(md->dev, sizeof(*mdss_data), GFP_KERNEL);
+	if (!mdss_data)
+		return -ENOMEM;
+
+	mdss_data->md_ss_toc = mdss_toc;
+	mdss_data->md_regions = devm_kcalloc(md->dev, MAX_NUM_ENTRIES,
+					     sizeof(*mdss_data->md_regions),
+					     GFP_KERNEL);
+	if (!mdss_data->md_regions)
+		return -ENOMEM;
+
+	mdss_toc = mdss_data->md_ss_toc;
+	mdss_toc->regions_baseptr = cpu_to_le64(virt_to_phys(mdss_data->md_regions));
+	mdss_toc->enabled = cpu_to_le32(MINIDUMP_SS_ENABLED);
+	mdss_toc->status = cpu_to_le32(1);
+	mdss_toc->region_count = cpu_to_le32(0);
+
+	/* Tell bootloader not to encrypt the regions of this subsystem */
+	mdss_toc->encryption_status = cpu_to_le32(MINIDUMP_SS_ENCR_DONE);
+	mdss_toc->encryption_required = cpu_to_le32(MINIDUMP_SS_ENCR_NOTREQ);
+
+	md->apss_data = mdss_data;
+
+	return 0;
+}
+
+/**
+ * register_md_region() - Register a new minidump region
+ * @id: unique id to identify the region
+ * @name: name of the region
+ * @vaddr: virtual memory address of the region start
+ * @size: size of the region
+ *
+ * Return: On success, it returns 0 and negative error value on failure.
+ */
+static int register_md_region(unsigned int id, char *name, void *vaddr,
+			      size_t size)
+{
+	struct qcom_minidump_region *md_region;
+	int ret;
+
+	struct md_region_list *mdr_list =
+		kzalloc(sizeof(*mdr_list), GFP_KERNEL);
+	if (!mdr_list)
+		return -ENOMEM;
+	md_region = &mdr_list->md_region;
+
+	scnprintf(md_region->name, sizeof(md_region->name), "K%d%.8s", id, name);
+	md_region->virt_addr = vaddr;
+	md_region->phys_addr = virt_to_phys(vaddr);
+	md_region->size = ALIGN(size, 4);
+	md_region->id = id;
+
+	ret = qcom_minidump_region_register(md_region);
+	if (ret < 0) {
+		pr_err("failed to register region in minidump %d %s: err: %d\n",
+		       id, name, ret);
+		return ret;
+	}
+
+	list_add(&mdr_list->list, &apss_md_rlist);
+	return 0;
+}
+
+/**
+ * unregister_md_region() - Unregister a previously registered minidump region
+ * @id: unique id to identify the region
+ *
+ * Return: On success, it returns 0 and negative error value on failure.
+ */
+static int unregister_md_region(unsigned int id)
+{
+	int ret = -ENOENT;
+	struct md_region_list *mdr_list;
+	struct md_region_list *tmp;
+
+	list_for_each_entry_safe(mdr_list, tmp, &apss_md_rlist, list) {
+		struct qcom_minidump_region *region;
+
+		region = &mdr_list->md_region;
+		if (region->id == id) {
+			ret = qcom_minidump_region_unregister(region);
+			list_del(&mdr_list->list);
+			return ret;
+		}
+	}
+
+	pr_err("failed to unregister region from minidump %d\n", ret);
+
+	return ret;
+}
+
+static struct kmemdump_backend qcom_md_backend = {
+	.name = "qcom_md",
+	.register_region = register_md_region,
+	.unregister_region = unregister_md_region,
+};
+
+static int qcom_md_probe(struct platform_device *pdev)
+{
+	struct minidump_global_toc *mdgtoc;
+	size_t size;
+	int ret;
+
+	md = devm_kzalloc(&pdev->dev, sizeof(*md), GFP_KERNEL);
+
+	md->dev = &pdev->dev;
+
+	mdgtoc = qcom_smem_get(QCOM_SMEM_HOST_ANY, SBL_MINIDUMP_SMEM_ID, &size);
+	if (IS_ERR(mdgtoc)) {
+		ret = PTR_ERR(mdgtoc);
+		dev_err(md->dev, "Couldn't find minidump smem item %d\n", ret);
+	}
+
+	if (size < sizeof(*mdgtoc) || !mdgtoc->status) {
+		dev_err(md->dev, "minidump table is not initialized %d\n", ret);
+		return -ENAVAIL;
+	}
+
+	mutex_init(&md->md_lock);
+
+	ret = qcom_apss_md_table_init(&mdgtoc->subsystems[MINIDUMP_APSS_DESC]);
+	if (ret) {
+		dev_err(md->dev, "apss minidump initialization failed %d\n", ret);
+		return ret;
+	}
+
+	return kmemdump_register_backend(&qcom_md_backend);
+}
+
+static void qcom_md_remove(struct platform_device *pdev)
+{
+	kmemdump_unregister_backend(&qcom_md_backend);
+}
+
+static struct platform_driver qcom_md_driver = {
+	.probe = qcom_md_probe,
+	.remove = qcom_md_remove,
+	.driver  = {
+		.name = "qcom-md",
+	},
+};
+
+module_platform_driver(qcom_md_driver);
+
+MODULE_AUTHOR("Eugen Hristev <eugen.hristev@linaro.org>");
+MODULE_AUTHOR("Mukesh Ojha <quic_mojha@quicinc.com>");
+MODULE_DESCRIPTION("Qualcomm kmemdump minidump backend driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0


