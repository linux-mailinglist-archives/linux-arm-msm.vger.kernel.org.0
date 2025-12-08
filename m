Return-Path: <linux-arm-msm+bounces-84658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E74ACCAD206
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 13:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 85B9A302D5E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 12:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0279B2F7444;
	Mon,  8 Dec 2025 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phwIDtrX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35F22F39BE;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765196775; cv=none; b=U08Ge0GTdTbBy5uQJMwAOlySx9TNftrfglwIrTcJWj1ozLCQm9hP+9ZRaom319dRH1RiLUqrTx0Ab4vpau2C5xqq4PoUfTrUsCthXF/ugCh/NSTjgXRHheTax5bwsltCNP0YZtQDzyZ3dCpQfx89dIlTjgXXSJc2PI0IELlX6gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765196775; c=relaxed/simple;
	bh=dx66ViePdpCuN8MqDJW3/fe4f4y/6KcT5fNx5SuOuYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OjincDLy0bsoxM66kE7TMVZntN8jfSGYkGvP19lRSWtL9un9g3SuWnua116AAe1Nww9VmjL2ZdFaeYa2qhvXIJ1ab0h2pk8ORS2UdXHW1Ktmht95x4QDFezVkLwPDSXm5pQit65KAuporadhioUNQ7KaP2Kx9LnHfXjWJkjet+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=phwIDtrX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EF80C19424;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765196775;
	bh=dx66ViePdpCuN8MqDJW3/fe4f4y/6KcT5fNx5SuOuYA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=phwIDtrX9omQ66MAqrqF2wVm9mTJSNSNd7CLpNAGMWNS18D6Gu7KeSs15vJuszqKs
	 Ht2MS1+FfW0UQrzi9+1EbBKBrmnwDlETDDfIKCdlK/4xqY6YyO8B+lTiUmFbmztm47
	 r8phYAMTg+pI2SWgbuNPigIb2dl+5L6EyGFgOss3qNcuEI2LHFDdd6yXAeR1O+PSUx
	 VHiqjgs2L1vexzA7XjQxXHt57I6ceoa7Du9SjFXJnHB9X7RzjKY0ECMWQ2dH9fo8h3
	 2zusApwKjAcewdZL14FGfIVnUGsfP0t2/hqB9YPwkStNArY0Cw1+BXptWVWceYh1qo
	 t8FlviGLueyAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D8ED3B7ED;
	Mon,  8 Dec 2025 12:26:15 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 08 Dec 2025 16:25:35 +0400
Subject: [PATCH v6 3/8] remoteproc: qcom: add hexagon based WCSS secure PIL
 driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-ipq5018-wifi-v6-3-d0ce2facaa5f@outlook.com>
References: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
In-Reply-To: <20251208-ipq5018-wifi-v6-0-d0ce2facaa5f@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>, 
 Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>, 
 George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765196772; l=15057;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=eVGDRLiVkWlYZi9xHIZEfPHMIzsKU5hiKUaCoDXNlhk=;
 b=YlsFG69peEtXSFE9ZST2b/FZSQzvAwcs0mI5ffjaMBcY+tjArGsjvQnGjt+x8N5cDdee6+4m2
 VuvuoywyrmZCPKOeIrd7eZvnRgaILgiResM44E087aszY3duvtaiaa7
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>

Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
SoCs support secure Peripheral Image Loading (PIL).

Secure PIL image is signed firmware image which only trusted software such
as TrustZone (TZ) can authenticate and load. Linux kernel will send a
Peripheral Authentication Service (PAS) request to TZ to authenticate and
load the PIL images. This change also introduces secure firmware
authentication using Trusted Management Engine-Lite (TME-L) which is
supported on IPQ5424 SoC. This driver uses mailbox based PAS request to
TME-L for image authentication if supported, else it will fallback to use
SCM call based PAS request to TZ.

In order to avoid overloading the existing WCSS driver or PAS driver, we
came up with this new PAS based IPQ WCSS driver.

Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/remoteproc/Kconfig              |  19 ++
 drivers/remoteproc/Makefile             |   1 +
 drivers/remoteproc/qcom_q6v5_wcss_sec.c | 397 ++++++++++++++++++++++++++++++++
 include/linux/remoteproc.h              |   2 +
 4 files changed, 419 insertions(+)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 48a0d3a69ed08057716f1e7ea950899f60bbe0cf..eaa427e4e9eca48b853fe0648304e67649878d8e 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -254,6 +254,25 @@ config QCOM_Q6V5_WCSS
 	  Hexagon V5 based WCSS remote processors on e.g. IPQ8074.  This is
 	  a non-TrustZone wireless subsystem.
 
+config QCOM_Q6V5_WCSS_SEC
+	tristate "Qualcomm Hexagon based WCSS Secure Peripheral Image Loader"
+	depends on OF && ARCH_QCOM
+	depends on QCOM_SMEM
+	depends on RPMSG_QCOM_GLINK_SMEM || RPMSG_QCOM_GLINK_SMEM=n
+	depends on RPMSG_QCOM_GLINK || RPMSG_QCOM_GLINK=n
+	select QCOM_MDT_LOADER
+	select QCOM_PIL_INFO
+	select QCOM_Q6V5_COMMON
+	select QCOM_RPROC_COMMON
+	select QCOM_SCM
+	help
+	  Say y here to support the Qualcomm Secure Peripheral Image Loader
+	  for the Hexagon based remote processors on e.g. IPQ5332.
+
+	  This is TrustZone wireless subsystem. The firmware is
+	  verified and booted with the help of the Peripheral Authentication
+	  System (PAS) in TrustZone.
+
 config QCOM_SYSMON
 	tristate "Qualcomm sysmon driver"
 	depends on RPMSG
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index 1c7598b8475d6057a3e044b41e3515103b7aa9f1..08705ef62bceb8b683a9419a5a8b027cbe2433c5 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
 obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
 obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
 obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
+obj-$(CONFIG_QCOM_Q6V5_WCSS_SEC)	+= qcom_q6v5_wcss_sec.o
 obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
 obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
 qcom_wcnss_pil-y			+= qcom_wcnss.o
diff --git a/drivers/remoteproc/qcom_q6v5_wcss_sec.c b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
new file mode 100644
index 0000000000000000000000000000000000000000..7bd45b4fd917e896f8df085c5ff2c87fa005e354
--- /dev/null
+++ b/drivers/remoteproc/qcom_q6v5_wcss_sec.c
@@ -0,0 +1,397 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2016-2018 Linaro Ltd.
+ * Copyright (C) 2014 Sony Mobile Communications AB
+ * Copyright (c) 2012-2018 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#include <linux/clk.h>
+#include <linux/firmware/qcom/qcom_scm.h>
+#include <linux/io.h>
+#include <linux/mailbox_client.h>
+#include <linux/mailbox/tmelcom-qmp.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
+#include <linux/soc/qcom/mdt_loader.h>
+
+#include "qcom_common.h"
+#include "qcom_q6v5.h"
+#include "qcom_pil_info.h"
+
+#define WCSS_CRASH_REASON		421
+
+#define WCSS_PAS_ID			0x6
+#define MPD_WCSS_PAS_ID			0xd
+
+#define Q6_WAIT_TIMEOUT			(5 * HZ)
+
+struct wcss_sec {
+	struct device *dev;
+	struct qcom_rproc_glink glink_subdev;
+	struct qcom_rproc_ssr ssr_subdev;
+	struct qcom_q6v5 q6;
+	phys_addr_t mem_phys;
+	phys_addr_t mem_reloc;
+	void *mem_region;
+	size_t mem_size;
+	const struct wcss_data *desc;
+
+	struct mbox_client mbox_client;
+	struct mbox_chan *mbox_chan;
+	void *metadata;
+	size_t metadata_len;
+};
+
+struct wcss_data {
+	u32 pasid;
+	const char *ss_name;
+	bool auto_boot;
+	bool use_tmelcom;
+};
+
+static int wcss_sec_start(struct rproc *rproc)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+	int ret;
+
+	ret = qcom_q6v5_prepare(&wcss->q6);
+	if (ret)
+		return ret;
+
+	if (wcss->desc->use_tmelcom) {
+		struct tmel_sec_auth tsa;
+		struct tmel_qmp_msg tqm;
+
+		tsa.data = wcss->metadata;
+		tsa.size = wcss->metadata_len;
+		tsa.pas_id = wcss->desc->pasid;
+		tqm.msg = &tsa;
+		tqm.msg_id = TMEL_MSG_UID_SECBOOT_SEC_AUTH;
+
+		ret = mbox_send_message(wcss->mbox_chan, (void *)&tqm);
+		if (ret < 0) {
+			dev_err(dev, "Failed to send message via mailbox\n");
+			goto unprepare;
+		}
+	} else {
+		ret = qcom_scm_pas_auth_and_reset(wcss->desc->pasid);
+		if (ret) {
+			dev_err(dev, "wcss_reset failed\n");
+			goto unprepare;
+		}
+	}
+
+	ret = qcom_q6v5_wait_for_start(&wcss->q6, Q6_WAIT_TIMEOUT);
+	if (ret == -ETIMEDOUT)
+		dev_err(dev, "start timed out\n");
+
+unprepare:
+	qcom_q6v5_unprepare(&wcss->q6);
+
+	return ret;
+}
+
+static int wcss_sec_stop(struct rproc *rproc)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+	int ret;
+
+	if (wcss->desc->use_tmelcom) {
+		struct tmel_sec_auth tsa = {0};
+		struct tmel_qmp_msg tqm;
+
+		tsa.pas_id = wcss->desc->pasid;
+		tqm.msg = &tsa;
+		tqm.msg_id = TMEL_MSG_UID_SECBOOT_SS_TEAR_DOWN;
+
+		mbox_send_message(wcss->mbox_chan, (void *)&tqm);
+	} else {
+		ret = qcom_scm_pas_shutdown(wcss->desc->pasid);
+		if (ret) {
+			dev_err(dev, "not able to shutdown\n");
+			return ret;
+		}
+	}
+
+	qcom_q6v5_unprepare(&wcss->q6);
+
+	return 0;
+}
+
+static void *wcss_sec_da_to_va(struct rproc *rproc, u64 da, size_t len,
+			       bool *is_iomem)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	int offset;
+
+	offset = da - wcss->mem_reloc;
+	if (offset < 0 || offset + len > wcss->mem_size)
+		return NULL;
+
+	return wcss->mem_region + offset;
+}
+
+static int wcss_sec_load(struct rproc *rproc, const struct firmware *fw)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+	int ret;
+
+	if (wcss->desc->use_tmelcom) {
+		wcss->metadata = qcom_mdt_read_metadata(fw, &wcss->metadata_len,
+							rproc->firmware, wcss->dev);
+		if (IS_ERR(wcss->metadata)) {
+			ret = PTR_ERR(wcss->metadata);
+			dev_err(wcss->dev, "error %d reading firmware %s metadata\n",
+				ret, rproc->firmware);
+			return ret;
+		}
+
+		ret = qcom_mdt_load_no_init(wcss->dev, fw, rproc->firmware, wcss->desc->pasid,
+					    wcss->mem_region, wcss->mem_phys, wcss->mem_size,
+					    &wcss->mem_reloc);
+		if (ret) {
+			kfree(wcss->metadata);
+			return ret;
+		}
+	} else {
+		ret = qcom_mdt_load(dev, fw, rproc->firmware, wcss->desc->pasid, wcss->mem_region,
+				    wcss->mem_phys, wcss->mem_size, &wcss->mem_reloc);
+		if (ret)
+			return ret;
+	}
+
+	qcom_pil_info_store("wcss", wcss->mem_phys, wcss->mem_size);
+
+	return 0;
+}
+
+static unsigned long wcss_sec_panic(struct rproc *rproc)
+{
+	struct wcss_sec *wcss = rproc->priv;
+
+	return qcom_q6v5_panic(&wcss->q6);
+}
+
+static void wcss_sec_copy_segment(struct rproc *rproc,
+				  struct rproc_dump_segment *segment,
+				  void *dest, size_t offset, size_t size)
+{
+	struct wcss_sec *wcss = rproc->priv;
+	struct device *dev = wcss->dev;
+
+	if (!segment->io_ptr)
+		segment->io_ptr = ioremap_wc(segment->da, segment->size);
+
+	if (!segment->io_ptr) {
+		dev_err(dev, "Failed to ioremap segment %pad size 0x%zx\n",
+			&segment->da, segment->size);
+		return;
+	}
+
+	if (offset + size < segment->size) {
+		memcpy(dest, segment->io_ptr + offset, size);
+	} else {
+		iounmap(segment->io_ptr);
+		segment->io_ptr = NULL;
+	}
+}
+
+static int wcss_sec_dump_segments(struct rproc *rproc,
+				  const struct firmware *fw)
+{
+	struct device *dev = rproc->dev.parent;
+	struct reserved_mem *rmem = NULL;
+	struct device_node *node;
+	int num_segs, index;
+	int ret;
+
+	/*
+	 * Parse through additional reserved memory regions for the rproc
+	 * and add them to the coredump segments
+	 */
+	num_segs = of_count_phandle_with_args(dev->of_node,
+					      "memory-region", NULL);
+	for (index = 0; index < num_segs; index++) {
+		node = of_parse_phandle(dev->of_node,
+					"memory-region", index);
+		if (!node)
+			return -EINVAL;
+
+		rmem = of_reserved_mem_lookup(node);
+		of_node_put(node);
+		if (!rmem) {
+			dev_err(dev, "unable to acquire memory-region index %d num_segs %d\n",
+				index, num_segs);
+			return -EINVAL;
+		}
+
+		dev_dbg(dev, "Adding segment 0x%pa size 0x%pa",
+			&rmem->base, &rmem->size);
+		ret = rproc_coredump_add_custom_segment(rproc,
+							rmem->base,
+							rmem->size,
+							wcss_sec_copy_segment,
+							NULL);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct rproc_ops wcss_sec_ops = {
+	.start = wcss_sec_start,
+	.stop = wcss_sec_stop,
+	.da_to_va = wcss_sec_da_to_va,
+	.load = wcss_sec_load,
+	.get_boot_addr = rproc_elf_get_boot_addr,
+	.panic = wcss_sec_panic,
+	.parse_fw = wcss_sec_dump_segments,
+};
+
+static int wcss_sec_alloc_memory_region(struct wcss_sec *wcss)
+{
+	struct device *dev = wcss->dev;
+	struct resource res;
+	int ret;
+
+	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
+	if (ret) {
+		dev_err(dev, "unable to acquire memory-region resource\n");
+		return ret;
+	}
+
+	wcss->mem_phys = res.start;
+	wcss->mem_reloc = res.start;
+	wcss->mem_size = resource_size(&res);
+	wcss->mem_region = devm_ioremap_resource_wc(dev, &res);
+	if (!wcss->mem_region) {
+		dev_err(dev, "unable to map memory region: %pR\n", &res);
+		return -ENOMEM;
+	}
+
+	return 0;
+}
+
+static int wcss_sec_probe(struct platform_device *pdev)
+{
+	const struct wcss_data *desc = of_device_get_match_data(&pdev->dev);
+	const char *fw_name = NULL;
+	struct wcss_sec *wcss;
+	struct clk *sleep_clk;
+	struct clk *int_clk;
+	struct rproc *rproc;
+	int ret;
+
+	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
+				      &fw_name);
+	if (ret < 0)
+		return ret;
+
+	rproc = devm_rproc_alloc(&pdev->dev, desc->ss_name, &wcss_sec_ops,
+				 fw_name, sizeof(*wcss));
+	if (!rproc) {
+		dev_err(&pdev->dev, "failed to allocate rproc\n");
+		return -ENOMEM;
+	}
+
+	wcss = rproc->priv;
+	wcss->dev = &pdev->dev;
+	wcss->desc = desc;
+
+	ret = wcss_sec_alloc_memory_region(wcss);
+	if (ret)
+		return ret;
+
+	sleep_clk = devm_clk_get_optional_enabled(&pdev->dev, "sleep");
+	if (IS_ERR(sleep_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(sleep_clk),
+				     "Failed to get sleep clock\n");
+
+	int_clk = devm_clk_get_optional_enabled(&pdev->dev, "interconnect");
+	if (IS_ERR(int_clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(int_clk),
+				     "Failed to get interconnect clock\n");
+
+	ret = qcom_q6v5_init(&wcss->q6, pdev, rproc,
+			     WCSS_CRASH_REASON, NULL, NULL);
+	if (ret)
+		return ret;
+
+	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, desc->ss_name);
+	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, desc->ss_name);
+
+	rproc->auto_boot = false;
+	rproc->dump_conf = RPROC_COREDUMP_INLINE;
+	rproc_coredump_set_elf_info(rproc, ELFCLASS32, EM_NONE);
+
+	if (desc->use_tmelcom) {
+		wcss->mbox_client.dev = wcss->dev;
+		wcss->mbox_client.knows_txdone = true;
+		wcss->mbox_client.tx_block = true;
+		wcss->mbox_chan = mbox_request_channel(&wcss->mbox_client, 0);
+		if (IS_ERR_OR_NULL(wcss->mbox_chan))
+			return dev_err_probe(wcss->dev, PTR_ERR(wcss->mbox_chan),
+					     "mbox chan for IPC is missing\n");
+	}
+
+	ret = devm_rproc_add(&pdev->dev, rproc);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, rproc);
+
+	return 0;
+}
+
+static void wcss_sec_remove(struct platform_device *pdev)
+{
+	struct rproc *rproc = platform_get_drvdata(pdev);
+	struct wcss_sec *wcss = rproc->priv;
+
+	mbox_free_channel(wcss->mbox_chan);
+	qcom_remove_glink_subdev(rproc, &wcss->glink_subdev);
+	qcom_remove_ssr_subdev(rproc, &wcss->ssr_subdev);
+	qcom_q6v5_deinit(&wcss->q6);
+}
+
+static const struct wcss_data wcss_sec_ipq5332_res_init = {
+	.pasid = MPD_WCSS_PAS_ID,
+	.ss_name = "q6wcss",
+};
+
+static const struct wcss_data wcss_sec_ipq5424_res_init = {
+	.pasid = MPD_WCSS_PAS_ID,
+	.ss_name = "q6wcss",
+	.use_tmelcom = true,
+};
+
+static const struct wcss_data wcss_sec_ipq9574_res_init = {
+	.pasid = WCSS_PAS_ID,
+	.ss_name = "q6wcss",
+};
+
+static const struct of_device_id wcss_sec_of_match[] = {
+	{ .compatible = "qcom,ipq5018-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
+	{ .compatible = "qcom,ipq5332-wcss-sec-pil", .data = &wcss_sec_ipq5332_res_init },
+	{ .compatible = "qcom,ipq5424-wcss-sec-pil", .data = &wcss_sec_ipq5424_res_init },
+	{ .compatible = "qcom,ipq9574-wcss-sec-pil", .data = &wcss_sec_ipq9574_res_init },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, wcss_sec_of_match);
+
+static struct platform_driver wcss_sec_driver = {
+	.probe = wcss_sec_probe,
+	.remove = wcss_sec_remove,
+	.driver = {
+		.name = "qcom-wcss-secure-pil",
+		.of_match_table = wcss_sec_of_match,
+	},
+};
+module_platform_driver(wcss_sec_driver);
+
+MODULE_DESCRIPTION("Hexagon WCSS Secure Peripheral Image Loader");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2a4e80ccafbe632436c4dfb636a1e..7b2159853345eec3d787f08413ff086bbc59ae91 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -472,6 +472,7 @@ enum rproc_dump_mechanism {
  * @node:	list node related to the rproc segment list
  * @da:		device address of the segment
  * @size:	size of the segment
+ * @io_ptr:	ptr to store the ioremapped dump segment
  * @priv:	private data associated with the dump_segment
  * @dump:	custom dump function to fill device memory segment associated
  *		with coredump
@@ -483,6 +484,7 @@ struct rproc_dump_segment {
 	dma_addr_t da;
 	size_t size;
 
+	void *io_ptr;
 	void *priv;
 	void (*dump)(struct rproc *rproc, struct rproc_dump_segment *segment,
 		     void *dest, size_t offset, size_t size);

-- 
2.52.0



