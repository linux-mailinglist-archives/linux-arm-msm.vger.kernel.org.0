Return-Path: <linux-arm-msm+bounces-85737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DF2CCD1FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 19:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1E0AE3081036
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 18:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CA5535505D;
	Thu, 18 Dec 2025 18:03:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE244354AD7;
	Thu, 18 Dec 2025 18:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766081003; cv=none; b=fGrprg/mOmp81X/lfbV5yVaCLZqhzmf2R9Xw9QdQ5BdfPu4xdJLEtE7Sj5PLcNVsmxlYa07+Gizk2JW2bhPLTVQ5vLyZa1eLtmo46VWsrh+cb3dMntOkcRWvkEJIvbbfY6o70ERYVLx5wErwsU8SIv3LPAZ36rML0IOB4QilspE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766081003; c=relaxed/simple;
	bh=9NFP+lkYx1RDyYK5uALA3aRFuNVGTf2anS04BoevzS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JGJ/GL52tYOwK8q0kltr65Reo8VcqAXJhEGIxfL4tAJdq2QM40P1zT0LmmHyI23HifBwV/fGS5xQFRoY2sMYengC2VMR0CGDyIFpFzHhQJeKQKz+WRGE+LYRkGTaSs0STAGmNH1QRnZHFEyGe2BgzezZQR3I8glXTWsWfiXn3pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: esmtpgz12t1766080959t18399a9e
X-QQ-Originating-IP: HRY41DCVJM6ztJQhG5rRVPrgnrnvSTWL8ryX4p9C0vg=
Received: from bigfoot-server-arm-node1.classf ( [183.250.239.212])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 Dec 2025 02:02:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10201982189096493261
EX-QQ-RecipientCnt: 16
From: Junhao Xie <bigfoot@radxa.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Junhao Xie <bigfoot@radxa.com>,
	Xilin Wu <sophon@radxa.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tomas Winkler <tomasw@gmail.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: devices: Add Qualcomm SCM storage driver
Date: Fri, 19 Dec 2025 02:02:05 +0800
Message-ID: <A41171D3EA8B583B+20251218180205.930961-3-bigfoot@radxa.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251218180205.930961-1-bigfoot@radxa.com>
References: <20251218180205.930961-1-bigfoot@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: OdKM2jcE40T2SB1uthZS5rWQKsA78htpXUaI6RO3QMYE/zG8J2A5pKyR
	MSDbFQWwCcSRDE0k6cOoHzRlalB5i8T4lzLDxRG3s/+KTjnncthLQejlAS2xitl2kYshTBn
	6k+OV5T+iwGdPFk/VX1nVKQ3qOfFFb8XkQcYiHQn1/nhKYR1LzxrL/Er76+vW2Qsq2YENYG
	LCB9bEHLVNpUIk5vl9nmoccq/x+IEZRKfW/tO+rVJomA8PoYH0q+kQchTE3Fp5bNDBcuCwe
	7fxKhUxCjn5AC2n4LLdb8LzG3f8Zq8Id4OapFkEqqynxkPg0HERatg9xKRYaoYHfYzJcBaq
	pcjzGa5JC5fsnflo9CME221yBBaiboanTpPSvSxvtl7tvWpvo9uoXiQPBUrOBCmoxM9nFNs
	KYnJJW2A3z8eduCreNK0GYdlIHuHvwjky/jus6NNEkj0om0t+/Gng6sQbymMiWNc3dZHDMX
	IfX3BmcvCh+onl9TbuR+gAZWrO1HcO65K95WVuNV6MlCjHMDJaennFShH9T/1qxwd3SfXou
	Q8yWQN8xEld7EG3Ax0xRg41KFIXPGyVK3g1QL8ZWb4xGmHXPqpbTnpXh/fQDgc64TuQi1In
	D14Q9MMBHK/11EyyDaWtQVyL8MZEfWEg5RcaQMQ7MggBBKzjYYAqjWYwYx56Ju367G3mEW5
	iTKlrE4YOIJxBQtIZhJl7oj8eJwU6f2gM9rLcO2vmoSueDA8HwjcM+k1tIXX9N42eIV8DdU
	lQo7gl6BweNtiVQWfEeaUCzc9TrhdyMcWe6nFclDhQGzs2+imdh0E+QOvsMYtf+wu4HTKgA
	d7ybMkv7qyrnN8RUhE0oG3SaTDuWvmO1/2aJ+o2M+IJYj+djFcXGM45YOFY7v8r1xV5WR9B
	1FzfTG6K7XSw1HsMhdQGKiBH+1umoLsPEbHz9eTcNTRJOlYsEAwu1ndnjbD679myAKplHke
	ysqW8abZQtpGo1znBQQ8VPC4JSNeQAvpK5yrCyAvjTN0QePiq5GblSjGmlisFWKWha+awAk
	cYYPqx+6m15UIhibbA5gavoIkYkbWwbvQq0MonBrMoWnQw/jw6
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

Add MTD driver for accessing storage devices managed by Qualcomm's
TrustZone firmware. On some platforms, BIOS/firmware storage (typically
SPI NOR flash) is not directly accessible from the non-secure world and
all operations must go through SCM (Secure Channel Manager) calls.

Signed-off-by: Junhao Xie <bigfoot@radxa.com>
Tested-by: Xilin Wu <sophon@radxa.com>
---
 drivers/mtd/devices/Kconfig            |  17 ++
 drivers/mtd/devices/Makefile           |   1 +
 drivers/mtd/devices/qcom_scm_storage.c | 256 +++++++++++++++++++++++++
 3 files changed, 274 insertions(+)
 create mode 100644 drivers/mtd/devices/qcom_scm_storage.c

diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index e518dfeee6542..4f73e89a11947 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -194,6 +194,23 @@ config MTD_INTEL_DG
 	  To compile this driver as a module, choose M here: the module
 	  will be called mtd-intel-dg.
 
+config MTD_QCOM_SCM_STORAGE
+	tristate "Qualcomm TrustZone protected storage MTD driver"
+	depends on MTD
+	depends on QCOM_SCM || COMPILE_TEST
+	help
+	  This provides an MTD device to access storage (typically SPI NOR
+	  flash) that is managed by Qualcomm's TrustZone firmware. On some
+	  platforms, the firmware storage is not directly accessible from
+	  the non-secure world and all operations must go through secure
+	  monitor calls.
+
+	  This driver is only functional on devices where the bootloader
+	  has configured TrustZone to expose the storage interface.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called qcom_scm_storage.
+
 comment "Disk-On-Chip Device Drivers"
 
 config MTD_DOCG3
diff --git a/drivers/mtd/devices/Makefile b/drivers/mtd/devices/Makefile
index 9fe4ce9cffde9..d71d07f811fa2 100644
--- a/drivers/mtd/devices/Makefile
+++ b/drivers/mtd/devices/Makefile
@@ -19,6 +19,7 @@ obj-$(CONFIG_MTD_BCM47XXSFLASH)	+= bcm47xxsflash.o
 obj-$(CONFIG_MTD_ST_SPI_FSM)    += st_spi_fsm.o
 obj-$(CONFIG_MTD_POWERNV_FLASH)	+= powernv_flash.o
 obj-$(CONFIG_MTD_INTEL_DG)	+= mtd_intel_dg.o
+obj-$(CONFIG_MTD_QCOM_SCM_STORAGE)	+= qcom_scm_storage.o
 
 
 CFLAGS_docg3.o			+= -I$(src)
diff --git a/drivers/mtd/devices/qcom_scm_storage.c b/drivers/mtd/devices/qcom_scm_storage.c
new file mode 100644
index 0000000000000..bf5a9f423ed7c
--- /dev/null
+++ b/drivers/mtd/devices/qcom_scm_storage.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Qualcomm TrustZone SCM Storage Flash driver
+ *
+ * Copyright (c) 2025 Junhao Xie <bigfoot@radxa.com>
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/mtd/mtd.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#include <linux/firmware/qcom/qcom_scm.h>
+
+/*
+ * This driver provides MTD access to storage devices managed by Qualcomm's
+ * TrustZone firmware. The storage (typically SPI NOR flash) is not directly
+ * accessible from the non-secure world and all operations must go through
+ * SCM (Secure Channel Manager) calls.
+ *
+ * A bounce buffer is required because the interface requires
+ * block-aligned addresses and sizes
+ */
+struct qcom_scm_storage {
+	struct device *dev;
+	struct mutex lock;	/* Protects SCM storage operations */
+	struct mtd_info mtd;
+	struct qcom_scm_storage_info info;
+	size_t buffer_size;
+	u8 *buffer;
+};
+
+static int qcom_scm_storage_erase(struct mtd_info *mtd,
+				  struct erase_info *instr)
+{
+	struct qcom_scm_storage *host =
+		container_of(mtd, struct qcom_scm_storage, mtd);
+
+	if (instr->addr % host->info.block_size ||
+	    instr->len % host->info.block_size)
+		return -EINVAL;
+
+	guard(mutex)(&host->lock);
+
+	return qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
+					 QCOM_SCM_STORAGE_ERASE,
+					 instr->addr / host->info.block_size,
+					 0, instr->len);
+}
+
+static int qcom_scm_storage_read(struct mtd_info *mtd,
+				 loff_t from, size_t len,
+				 size_t *retlen, u_char *buf)
+{
+	struct qcom_scm_storage *host =
+		container_of(mtd, struct qcom_scm_storage, mtd);
+	size_t block_size = host->info.block_size;
+	loff_t block_start, block_off, lba;
+	size_t chunk, to_read;
+	int ret = 0;
+
+	if (retlen)
+		*retlen = 0;
+
+	if (from + len > mtd->size)
+		return -EINVAL;
+
+	if (len == 0)
+		return 0;
+
+	guard(mutex)(&host->lock);
+
+	while (len > 0) {
+		block_start = round_down(from, block_size);
+		block_off = from - block_start;
+		lba = block_start / block_size;
+
+		if (block_off || len < block_size) {
+			chunk = min_t(size_t, block_size - block_off, len);
+			to_read = block_size;
+		} else {
+			chunk = round_down(len, block_size);
+			chunk = min_t(size_t, chunk, host->buffer_size);
+			to_read = chunk;
+		}
+
+		ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
+						QCOM_SCM_STORAGE_READ,
+						lba, host->buffer,
+						to_read);
+		if (ret)
+			return ret;
+
+		memcpy(buf, host->buffer + block_off, chunk);
+
+		buf += chunk;
+		from += chunk;
+		len -= chunk;
+		if (retlen)
+			*retlen += chunk;
+	}
+
+	return 0;
+}
+
+static int qcom_scm_storage_write(struct mtd_info *mtd,
+				  loff_t to, size_t len,
+				  size_t *retlen, const u_char *buf)
+{
+	struct qcom_scm_storage *host =
+		container_of(mtd, struct qcom_scm_storage, mtd);
+	size_t block_size = host->info.block_size;
+	loff_t block_start, block_off, lba;
+	size_t chunk, to_write;
+	int ret = 0;
+
+	if (retlen)
+		*retlen = 0;
+
+	if (to + len > mtd->size)
+		return -EINVAL;
+
+	if (len == 0)
+		return 0;
+
+	guard(mutex)(&host->lock);
+
+	while (len > 0) {
+		block_start = round_down(to, block_size);
+		block_off = to - block_start;
+		lba = block_start / block_size;
+
+		if (block_off || len < block_size) {
+			chunk = min_t(size_t, block_size - block_off, len);
+			to_write = block_size;
+
+			ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
+							QCOM_SCM_STORAGE_READ,
+							lba, host->buffer,
+							block_size);
+			if (ret)
+				return ret;
+		} else {
+			chunk = round_down(len, block_size);
+			chunk = min_t(size_t, chunk, host->buffer_size);
+			to_write = chunk;
+		}
+
+		memcpy(host->buffer + block_off, buf, chunk);
+
+		ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
+						QCOM_SCM_STORAGE_WRITE,
+						lba, host->buffer,
+						to_write);
+		if (ret)
+			return ret;
+
+		buf += chunk;
+		to += chunk;
+		len -= chunk;
+		if (retlen)
+			*retlen += chunk;
+	}
+
+	return 0;
+}
+
+static int qcom_scm_storage_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct qcom_scm_storage *host;
+	int ret;
+
+	host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
+	if (!host)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, host);
+	host->dev = dev;
+
+	ret = devm_mutex_init(dev, &host->lock);
+	if (ret)
+		return ret;
+
+	host->buffer_size = SZ_256K;
+	host->buffer = devm_kzalloc(dev, host->buffer_size, GFP_KERNEL);
+	if (!host->buffer)
+		return -ENOMEM;
+
+	ret = qcom_scm_storage_send_cmd(QCOM_SCM_STORAGE_SPINOR,
+					QCOM_SCM_STORAGE_GET_INFO,
+					0, &host->info,
+					sizeof(host->info));
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "failed to get storage info\n");
+
+	if (!host->info.block_size || !host->info.total_blocks)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid storage geometry\n");
+
+	if (host->info.block_size > host->buffer_size)
+		return dev_err_probe(dev, -EINVAL,
+				     "block size %u exceeds buffer size\n",
+				     host->info.block_size);
+
+	host->mtd.name = dev_name(dev);
+	host->mtd.owner = THIS_MODULE;
+	host->mtd.dev.parent = dev;
+	host->mtd.size = host->info.total_blocks * host->info.block_size;
+	host->mtd.erasesize = host->info.block_size;
+	host->mtd.writesize = host->info.block_size;
+	host->mtd.writebufsize = host->info.block_size;
+	host->mtd.type = MTD_NORFLASH;
+	host->mtd.flags = MTD_WRITEABLE;
+	host->mtd._erase = qcom_scm_storage_erase;
+	host->mtd._read = qcom_scm_storage_read;
+	host->mtd._write = qcom_scm_storage_write;
+
+	ret = mtd_device_register(&host->mtd, NULL, 0);
+	if (ret)
+		return ret;
+
+	dev_info(dev, "scm storage 0x%llx registered with size %llu bytes\n",
+		 host->info.serial_num, host->mtd.size);
+
+	return 0;
+}
+
+static void qcom_scm_storage_remove(struct platform_device *pdev)
+{
+	struct qcom_scm_storage *host = platform_get_drvdata(pdev);
+
+	WARN_ON(mtd_device_unregister(&host->mtd));
+}
+
+static const struct platform_device_id qcom_scm_storage_ids[] = {
+	{ "qcom_scm_storage", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, qcom_scm_storage_ids);
+
+static struct platform_driver qcom_scm_storage_driver = {
+	.probe	= qcom_scm_storage_probe,
+	.remove	= qcom_scm_storage_remove,
+	.driver = {
+		.name	= "qcom_scm_storage",
+	},
+	.id_table = qcom_scm_storage_ids,
+};
+module_platform_driver(qcom_scm_storage_driver);
+
+MODULE_AUTHOR("Junhao Xie <bigfoot@radxa.com>");
+MODULE_DESCRIPTION("Qualcomm TrustZone SCM Storage Flash driver");
+MODULE_LICENSE("GPL");
-- 
2.51.2


