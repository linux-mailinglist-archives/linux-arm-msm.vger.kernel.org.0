Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEEE18B65
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2019 16:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbfEIOOd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 May 2019 10:14:33 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:39442 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726449AbfEIOOc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 May 2019 10:14:32 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id E9858BD0E4808C833EF4;
        Thu,  9 May 2019 22:14:28 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Thu, 9 May 2019 22:14:23 +0800
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
To:     <linux-kernel@vger.kernel.org>
CC:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        David Brown <david.brown@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH next v3] mfd: Use dev_get_drvdata()
Date:   Thu, 9 May 2019 22:23:39 +0800
Message-ID: <20190509142339.96276-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190509061443.GU31645@dell>
References: <20190509061443.GU31645@dell>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using dev_get_drvdata directly.

Cc: David Brown <david.brown@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
v3:
- fix build issue('dev' undeclared) in tc6393xb_nand_enable()
v2:
-use dev_get_drvdata() instead of to_ssbi()

 drivers/mfd/ssbi.c     |  6 ++----
 drivers/mfd/t7l66xb.c  | 12 ++++--------
 drivers/mfd/tc6387xb.c | 12 ++++--------
 drivers/mfd/tc6393xb.c | 23 ++++++++---------------
 4 files changed, 18 insertions(+), 35 deletions(-)

diff --git a/drivers/mfd/ssbi.c b/drivers/mfd/ssbi.c
index 36b96fee4ce6..0ae27cd30268 100644
--- a/drivers/mfd/ssbi.c
+++ b/drivers/mfd/ssbi.c
@@ -80,8 +80,6 @@ struct ssbi {
 	int (*write)(struct ssbi *, u16 addr, const u8 *buf, int len);
 };
 
-#define to_ssbi(dev)	platform_get_drvdata(to_platform_device(dev))
-
 static inline u32 ssbi_readl(struct ssbi *ssbi, u32 reg)
 {
 	return readl(ssbi->base + reg);
@@ -243,7 +241,7 @@ ssbi_pa_write_bytes(struct ssbi *ssbi, u16 addr, const u8 *buf, int len)
 
 int ssbi_read(struct device *dev, u16 addr, u8 *buf, int len)
 {
-	struct ssbi *ssbi = to_ssbi(dev);
+	struct ssbi *ssbi = dev_get_drvdata(dev);
 	unsigned long flags;
 	int ret;
 
@@ -257,7 +255,7 @@ EXPORT_SYMBOL_GPL(ssbi_read);
 
 int ssbi_write(struct device *dev, u16 addr, const u8 *buf, int len)
 {
-	struct ssbi *ssbi = to_ssbi(dev);
+	struct ssbi *ssbi = dev_get_drvdata(dev);
 	unsigned long flags;
 	int ret;
 
diff --git a/drivers/mfd/t7l66xb.c b/drivers/mfd/t7l66xb.c
index 43d8683266de..e9cfb147345e 100644
--- a/drivers/mfd/t7l66xb.c
+++ b/drivers/mfd/t7l66xb.c
@@ -82,8 +82,7 @@ struct t7l66xb {
 
 static int t7l66xb_mmc_enable(struct platform_device *mmc)
 {
-	struct platform_device *dev = to_platform_device(mmc->dev.parent);
-	struct t7l66xb *t7l66xb = platform_get_drvdata(dev);
+	struct t7l66xb *t7l66xb = dev_get_drvdata(mmc->dev.parent);
 	unsigned long flags;
 	u8 dev_ctl;
 	int ret;
@@ -108,8 +107,7 @@ static int t7l66xb_mmc_enable(struct platform_device *mmc)
 
 static int t7l66xb_mmc_disable(struct platform_device *mmc)
 {
-	struct platform_device *dev = to_platform_device(mmc->dev.parent);
-	struct t7l66xb *t7l66xb = platform_get_drvdata(dev);
+	struct t7l66xb *t7l66xb = dev_get_drvdata(mmc->dev.parent);
 	unsigned long flags;
 	u8 dev_ctl;
 
@@ -128,16 +126,14 @@ static int t7l66xb_mmc_disable(struct platform_device *mmc)
 
 static void t7l66xb_mmc_pwr(struct platform_device *mmc, int state)
 {
-	struct platform_device *dev = to_platform_device(mmc->dev.parent);
-	struct t7l66xb *t7l66xb = platform_get_drvdata(dev);
+	struct t7l66xb *t7l66xb = dev_get_drvdata(mmc->dev.parent);
 
 	tmio_core_mmc_pwr(t7l66xb->scr + 0x200, 0, state);
 }
 
 static void t7l66xb_mmc_clk_div(struct platform_device *mmc, int state)
 {
-	struct platform_device *dev = to_platform_device(mmc->dev.parent);
-	struct t7l66xb *t7l66xb = platform_get_drvdata(dev);
+	struct t7l66xb *t7l66xb = dev_get_drvdata(mmc->dev.parent);
 
 	tmio_core_mmc_clk_div(t7l66xb->scr + 0x200, 0, state);
 }
diff --git a/drivers/mfd/tc6387xb.c b/drivers/mfd/tc6387xb.c
index 85fab3729102..f417c6fecfe2 100644
--- a/drivers/mfd/tc6387xb.c
+++ b/drivers/mfd/tc6387xb.c
@@ -80,16 +80,14 @@ static int tc6387xb_resume(struct platform_device *dev)
 
 static void tc6387xb_mmc_pwr(struct platform_device *mmc, int state)
 {
-	struct platform_device *dev = to_platform_device(mmc->dev.parent);
-	struct tc6387xb *tc6387xb = platform_get_drvdata(dev);
+	struct tc6387xb *tc6387xb = dev_get_drvdata(mmc->dev.parent);
 
 	tmio_core_mmc_pwr(tc6387xb->scr + 0x200, 0, state);
 }
 
 static void tc6387xb_mmc_clk_div(struct platform_device *mmc, int state)
 {
-	struct platform_device *dev = to_platform_device(mmc->dev.parent);
-	struct tc6387xb *tc6387xb = platform_get_drvdata(dev);
+	struct tc6387xb *tc6387xb = dev_get_drvdata(mmc->dev.parent);
 
 	tmio_core_mmc_clk_div(tc6387xb->scr + 0x200, 0, state);
 }
@@ -97,8 +95,7 @@ static void tc6387xb_mmc_clk_div(struct platform_device *mmc, int state)
 
 static int tc6387xb_mmc_enable(struct platform_device *mmc)
 {
-	struct platform_device *dev      = to_platform_device(mmc->dev.parent);
-	struct tc6387xb *tc6387xb = platform_get_drvdata(dev);
+	struct tc6387xb *tc6387xb = dev_get_drvdata(mmc->dev.parent);
 
 	clk_prepare_enable(tc6387xb->clk32k);
 
@@ -110,8 +107,7 @@ static int tc6387xb_mmc_enable(struct platform_device *mmc)
 
 static int tc6387xb_mmc_disable(struct platform_device *mmc)
 {
-	struct platform_device *dev      = to_platform_device(mmc->dev.parent);
-	struct tc6387xb *tc6387xb = platform_get_drvdata(dev);
+	struct tc6387xb *tc6387xb = dev_get_drvdata(mmc->dev.parent);
 
 	clk_disable_unprepare(tc6387xb->clk32k);
 
diff --git a/drivers/mfd/tc6393xb.c b/drivers/mfd/tc6393xb.c
index 0c9f0390e891..6943048a64c2 100644
--- a/drivers/mfd/tc6393xb.c
+++ b/drivers/mfd/tc6393xb.c
@@ -122,14 +122,13 @@ enum {
 
 static int tc6393xb_nand_enable(struct platform_device *nand)
 {
-	struct platform_device *dev = to_platform_device(nand->dev.parent);
-	struct tc6393xb *tc6393xb = platform_get_drvdata(dev);
+	struct tc6393xb *tc6393xb = dev_get_drvdata(nand->dev.parent);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&tc6393xb->lock, flags);
 
 	/* SMD buffer on */
-	dev_dbg(&dev->dev, "SMD buffer on\n");
+	dev_dbg(nand->dev.parent, "SMD buffer on\n");
 	tmio_iowrite8(0xff, tc6393xb->scr + SCR_GPI_BCR(1));
 
 	raw_spin_unlock_irqrestore(&tc6393xb->lock, flags);
@@ -312,8 +311,7 @@ static int tc6393xb_fb_disable(struct platform_device *dev)
 
 int tc6393xb_lcd_set_power(struct platform_device *fb, bool on)
 {
-	struct platform_device *dev = to_platform_device(fb->dev.parent);
-	struct tc6393xb *tc6393xb = platform_get_drvdata(dev);
+	struct tc6393xb *tc6393xb = dev_get_drvdata(fb->dev.parent);
 	u8 fer;
 	unsigned long flags;
 
@@ -334,8 +332,7 @@ EXPORT_SYMBOL(tc6393xb_lcd_set_power);
 
 int tc6393xb_lcd_mode(struct platform_device *fb,
 					const struct fb_videomode *mode) {
-	struct platform_device *dev = to_platform_device(fb->dev.parent);
-	struct tc6393xb *tc6393xb = platform_get_drvdata(dev);
+	struct tc6393xb *tc6393xb = dev_get_drvdata(fb->dev.parent);
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&tc6393xb->lock, flags);
@@ -351,8 +348,7 @@ EXPORT_SYMBOL(tc6393xb_lcd_mode);
 
 static int tc6393xb_mmc_enable(struct platform_device *mmc)
 {
-	struct platform_device *dev = to_platform_device(mmc->dev.parent);
-	struct tc6393xb *tc6393xb = platform_get_drvdata(dev);
+	struct tc6393xb *tc6393xb = dev_get_drvdata(mmc->dev.parent);
 
 	tmio_core_mmc_enable(tc6393xb->scr + 0x200, 0,
 		tc6393xb_mmc_resources[0].start & 0xfffe);
@@ -362,8 +358,7 @@ static int tc6393xb_mmc_enable(struct platform_device *mmc)
 
 static int tc6393xb_mmc_resume(struct platform_device *mmc)
 {
-	struct platform_device *dev = to_platform_device(mmc->dev.parent);
-	struct tc6393xb *tc6393xb = platform_get_drvdata(dev);
+	struct tc6393xb *tc6393xb = dev_get_drvdata(mmc->dev.parent);
 
 	tmio_core_mmc_resume(tc6393xb->scr + 0x200, 0,
 		tc6393xb_mmc_resources[0].start & 0xfffe);
@@ -373,16 +368,14 @@ static int tc6393xb_mmc_resume(struct platform_device *mmc)
 
 static void tc6393xb_mmc_pwr(struct platform_device *mmc, int state)
 {
-	struct platform_device *dev = to_platform_device(mmc->dev.parent);
-	struct tc6393xb *tc6393xb = platform_get_drvdata(dev);
+	struct tc6393xb *tc6393xb = dev_get_drvdata(mmc->dev.parent);
 
 	tmio_core_mmc_pwr(tc6393xb->scr + 0x200, 0, state);
 }
 
 static void tc6393xb_mmc_clk_div(struct platform_device *mmc, int state)
 {
-	struct platform_device *dev = to_platform_device(mmc->dev.parent);
-	struct tc6393xb *tc6393xb = platform_get_drvdata(dev);
+	struct tc6393xb *tc6393xb = dev_get_drvdata(mmc->dev.parent);
 
 	tmio_core_mmc_clk_div(tc6393xb->scr + 0x200, 0, state);
 }
-- 
2.20.1

