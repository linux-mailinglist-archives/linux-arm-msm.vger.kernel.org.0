Return-Path: <linux-arm-msm+bounces-49163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F564A41D08
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 12:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1BC641890986
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 11:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B3F026F455;
	Mon, 24 Feb 2025 11:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cF6uzdQf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226DF26F44A;
	Mon, 24 Feb 2025 11:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740396000; cv=none; b=FO0Bxbu4pgoVgxsoojzbsaV0ZVASOW/xm/qYNqyWdTkq7ni8LohTVDw6q97EpTsIqOyHeWp6KU8Dvm6bBBldsLWYrizBwhU2UHC/ZQ4rl340SzsYVI1XJX4FmG2zXvBvSDymqEf05eRz1WYziVNQR8jPgZQoeXBY3GcXt2X05DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740396000; c=relaxed/simple;
	bh=Yim0/UFxWsVs7ZjFolL1jtb/Fogcz7Qgthqq78PKsxo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VlISK9UcOJYA/3p5DDUuY+3zW+lYnFHfdSMm6q5SFc86gKFZgfkMkGETbLEwIgQoVHDoy6Jy5VLVh05iS2jQSco1PQaeTJi7wwqbMJZipcT0eARE/1xt1SWA2ySDqfDG0pQTppJYfevPNYOaz7uwDOHTUR4RlzRk05TMx4b8H4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cF6uzdQf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3380DC4CEE8;
	Mon, 24 Feb 2025 11:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740396000;
	bh=Yim0/UFxWsVs7ZjFolL1jtb/Fogcz7Qgthqq78PKsxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cF6uzdQfnjprnThbTv/fRs+E+0JL64wD2SxAJ40T1+yU9sLNr+apZpj8gXFab59qN
	 7Tj+W6q1OTiJ11jVoaroualrFt/S2H+AtnuA6pPwDb5ugi7zis4gO5/L0rPOnLYx4r
	 m2ugKzbTHpxLQJBUKD4n8US5TXjE5bKUkakWVBOCStrmly7a+irR5NcnX9HkZhkhic
	 JMwp/AYnelSta1+9Ojl5pf58ZFQGGrUw4aQlRrux/lEvS+R8J3KcWicWOzN3/5zxjR
	 QjH8W/dgecKOy+Ds450VxwJzJLpSGJOhD4SuY6lK4IuSCxQjVPm1w7CKotzthvy+XR
	 DN/qt5inPC/Yw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Johan Hovold <johan+linaro@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 20/20] irqchip/qcom-pdc: Workaround hardware register bug on X1E80100
Date: Mon, 24 Feb 2025 06:19:13 -0500
Message-Id: <20250224111914.2214326-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250224111914.2214326-1-sashal@kernel.org>
References: <20250224111914.2214326-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.79
Content-Transfer-Encoding: 8bit

From: Stephan Gerhold <stephan.gerhold@linaro.org>

[ Upstream commit e9a48ea4d90be251e0d057d41665745caccb0351 ]

On X1E80100, there is a hardware bug in the register logic of the
IRQ_ENABLE_BANK register: While read accesses work on the normal address,
all write accesses must be made to a shifted address. Without a workaround
for this, the wrong interrupt gets enabled in the PDC and it is impossible
to wakeup from deep suspend (CX collapse). This has not caused problems so
far, because the deep suspend state was not enabled. A workaround is
required now since work is ongoing to fix this.

The PDC has multiple "DRV" regions, each one has a size of 0x10000 and
provides the same set of registers for a particular client in the system.
Linux is one the clients and uses DRV region 2 on X1E. Each "bank" inside
the DRV region consists of 32 interrupt pins that can be enabled using the
IRQ_ENABLE_BANK register:

  IRQ_ENABLE_BANK[bank] = base + IRQ_ENABLE_BANK + bank * sizeof(u32)

On X1E, this works as intended for read access. However, write access to
most banks is shifted by 2:

  IRQ_ENABLE_BANK_X1E[0] = IRQ_ENABLE_BANK[-2]
  IRQ_ENABLE_BANK_X1E[1] = IRQ_ENABLE_BANK[-1]
  IRQ_ENABLE_BANK_X1E[2] = IRQ_ENABLE_BANK[0] = IRQ_ENABLE_BANK[2 - 2]
  IRQ_ENABLE_BANK_X1E[3] = IRQ_ENABLE_BANK[1] = IRQ_ENABLE_BANK[3 - 2]
  IRQ_ENABLE_BANK_X1E[4] = IRQ_ENABLE_BANK[2] = IRQ_ENABLE_BANK[4 - 2]
  IRQ_ENABLE_BANK_X1E[5] = IRQ_ENABLE_BANK[5] (this one works as intended)

The negative indexes underflow to banks of the previous DRV/client region:

  IRQ_ENABLE_BANK_X1E[drv 2][bank 0] = IRQ_ENABLE_BANK[drv 2][bank -2]
                                     = IRQ_ENABLE_BANK[drv 1][bank 5-2]
                                     = IRQ_ENABLE_BANK[drv 1][bank 3]
                                     = IRQ_ENABLE_BANK[drv 1][bank 0 + 3]
  IRQ_ENABLE_BANK_X1E[drv 2][bank 1] = IRQ_ENABLE_BANK[drv 2][bank -1]
                                     = IRQ_ENABLE_BANK[drv 1][bank 5-1]
                                     = IRQ_ENABLE_BANK[drv 1][bank 4]
                                     = IRQ_ENABLE_BANK[drv 1][bank 1 + 3]

Introduce a workaround for the bug by matching the qcom,x1e80100-pdc
compatible and apply the offsets as shown above:

 - Bank 0...1: previous DRV region, bank += 3
 - Bank 1...4: our DRV region, bank -= 2
 - Bank 5: our DRV region, no fixup required

The PDC node in the device tree only describes the DRV region for the Linux
client, but the workaround also requires to map parts of the previous DRV
region to issue writes there. To maintain compatibility with old device
trees, obtain the base address of the preceeding region by applying the
-0x10000 offset. Note that this is also more correct from a conceptual
point of view:

It does not really make use of the other region; it just issues shifted
writes that end up in the registers of the Linux associated DRV region 2.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
Link: https://lore.kernel.org/all/20250218-x1e80100-pdc-hw-wa-v2-1-29be4c98e355@linaro.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/irqchip/qcom-pdc.c | 67 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 74b2f124116e3..52d77546aacb9 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -21,9 +21,11 @@
 #include <linux/types.h>
 
 #define PDC_MAX_GPIO_IRQS	256
+#define PDC_DRV_OFFSET		0x10000
 
 /* Valid only on HW version < 3.2 */
 #define IRQ_ENABLE_BANK		0x10
+#define IRQ_ENABLE_BANK_MAX	(IRQ_ENABLE_BANK + BITS_TO_BYTES(PDC_MAX_GPIO_IRQS))
 #define IRQ_i_CFG		0x110
 
 /* Valid only on HW version >= 3.2 */
@@ -46,13 +48,20 @@ struct pdc_pin_region {
 
 static DEFINE_RAW_SPINLOCK(pdc_lock);
 static void __iomem *pdc_base;
+static void __iomem *pdc_prev_base;
 static struct pdc_pin_region *pdc_region;
 static int pdc_region_cnt;
 static unsigned int pdc_version;
+static bool pdc_x1e_quirk;
+
+static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)
+{
+	writel_relaxed(val, base + reg + i * sizeof(u32));
+}
 
 static void pdc_reg_write(int reg, u32 i, u32 val)
 {
-	writel_relaxed(val, pdc_base + reg + i * sizeof(u32));
+	pdc_base_reg_write(pdc_base, reg, i, val);
 }
 
 static u32 pdc_reg_read(int reg, u32 i)
@@ -60,6 +69,34 @@ static u32 pdc_reg_read(int reg, u32 i)
 	return readl_relaxed(pdc_base + reg + i * sizeof(u32));
 }
 
+static void pdc_x1e_irq_enable_write(u32 bank, u32 enable)
+{
+	void __iomem *base;
+
+	/* Remap the write access to work around a hardware bug on X1E */
+	switch (bank) {
+	case 0 ... 1:
+		/* Use previous DRV (client) region and shift to bank 3-4 */
+		base = pdc_prev_base;
+		bank += 3;
+		break;
+	case 2 ... 4:
+		/* Use our own region and shift to bank 0-2 */
+		base = pdc_base;
+		bank -= 2;
+		break;
+	case 5:
+		/* No fixup required for bank 5 */
+		base = pdc_base;
+		break;
+	default:
+		WARN_ON(1);
+		return;
+	}
+
+	pdc_base_reg_write(base, IRQ_ENABLE_BANK, bank, enable);
+}
+
 static void __pdc_enable_intr(int pin_out, bool on)
 {
 	unsigned long enable;
@@ -72,7 +109,11 @@ static void __pdc_enable_intr(int pin_out, bool on)
 
 		enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
 		__assign_bit(mask, &enable, on);
-		pdc_reg_write(IRQ_ENABLE_BANK, index, enable);
+
+		if (pdc_x1e_quirk)
+			pdc_x1e_irq_enable_write(index, enable);
+		else
+			pdc_reg_write(IRQ_ENABLE_BANK, index, enable);
 	} else {
 		enable = pdc_reg_read(IRQ_i_CFG, pin_out);
 		__assign_bit(IRQ_i_CFG_IRQ_ENABLE, &enable, on);
@@ -324,10 +365,29 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 	if (res_size > resource_size(&res))
 		pr_warn("%pOF: invalid reg size, please fix DT\n", node);
 
+	/*
+	 * PDC has multiple DRV regions, each one provides the same set of
+	 * registers for a particular client in the system. Due to a hardware
+	 * bug on X1E, some writes to the IRQ_ENABLE_BANK register must be
+	 * issued inside the previous region. This region belongs to
+	 * a different client and is not described in the device tree. Map the
+	 * region with the expected offset to preserve support for old DTs.
+	 */
+	if (of_device_is_compatible(node, "qcom,x1e80100-pdc")) {
+		pdc_prev_base = ioremap(res.start - PDC_DRV_OFFSET, IRQ_ENABLE_BANK_MAX);
+		if (!pdc_prev_base) {
+			pr_err("%pOF: unable to map previous PDC DRV region\n", node);
+			return -ENXIO;
+		}
+
+		pdc_x1e_quirk = true;
+	}
+
 	pdc_base = ioremap(res.start, res_size);
 	if (!pdc_base) {
 		pr_err("%pOF: unable to map PDC registers\n", node);
-		return -ENXIO;
+		ret = -ENXIO;
+		goto fail;
 	}
 
 	pdc_version = pdc_reg_read(PDC_VERSION_REG, 0);
@@ -363,6 +423,7 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 fail:
 	kfree(pdc_region);
 	iounmap(pdc_base);
+	iounmap(pdc_prev_base);
 	return ret;
 }
 
-- 
2.39.5


