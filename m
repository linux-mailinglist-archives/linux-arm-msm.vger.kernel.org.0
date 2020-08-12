Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23D46242DF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Aug 2020 19:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgHLRUo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Aug 2020 13:20:44 -0400
Received: from smtprelay0173.hostedemail.com ([216.40.44.173]:52828 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725993AbgHLRUo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Aug 2020 13:20:44 -0400
X-Greylist: delayed 407 seconds by postgrey-1.27 at vger.kernel.org; Wed, 12 Aug 2020 13:20:43 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 7727E80105A7
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2020 17:13:57 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 9308C18029144;
        Wed, 12 Aug 2020 17:13:55 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:2:41:355:379:599:960:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1535:1593:1594:1606:1730:1747:1777:1792:2194:2198:2199:2200:2393:2559:2562:2731:2828:3138:3139:3140:3141:3142:3355:3865:4117:4321:4605:5007:6119:6742:7901:7903:9036:10004:10848:11026:11473:11658:11914:12043:12296:12297:12438:12555:12697:12737:12760:13439:13868:14659:21080:21451:21611:21627:21990:30046:30054:30070,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: place34_20016de26fed
X-Filterd-Recvd-Size: 6706
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf10.hostedemail.com (Postfix) with ESMTPA;
        Wed, 12 Aug 2020 17:13:52 +0000 (UTC)
Message-ID: <305f0df155e89e0c626b8f7366c4ab5f6741aedd.camel@perches.com>
Subject: Re: [PATCH 00/44] SPMI patches needed by Hikey 970
From:   Joe Perches <joe@perches.com>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Stephen Boyd <sboyd@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Wei Xu <xuwei5@hisilicon.com>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>, devel@driverdev.osuosl.org,
        linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>
Date:   Wed, 12 Aug 2020 10:13:51 -0700
In-Reply-To: <cover.1597247164.git.mchehab+huawei@kernel.org>
References: <cover.1597247164.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Perhaps these trivial bits on top:
---
 drivers/staging/hikey9xx/hi6421-spmi-pmic.c     |  5 +++--
 drivers/staging/hikey9xx/hi6421v600-regulator.c |  6 +++---
 drivers/staging/hikey9xx/hisi-spmi-controller.c | 21 +++++++++++++--------
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
index 76766e7b8bf9..9d73458ca65a 100644
--- a/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
+++ b/drivers/staging/hikey9xx/hi6421-spmi-pmic.c
@@ -99,7 +99,7 @@ int hi6421_spmi_pmic_write(struct hi6421_spmi_pmic *pmic, int reg, u32 val)
 EXPORT_SYMBOL(hi6421_spmi_pmic_write);
 
 int hi6421_spmi_pmic_rmw(struct hi6421_spmi_pmic *pmic, int reg,
-			  u32 mask, u32 bits)
+			 u32 mask, u32 bits)
 {
 	unsigned long flags;
 	u32 data;
@@ -130,7 +130,8 @@ static irqreturn_t hi6421_spmi_irq_handler(int irq, void *data)
 		hi6421_spmi_pmic_write(pmic, (i + pmic->irq_addr), pending);
 
 		/* solve powerkey order */
-		if ((i == HISI_IRQ_KEY_NUM) && ((pending & HISI_IRQ_KEY_VALUE) == HISI_IRQ_KEY_VALUE)) {
+		if ((i == HISI_IRQ_KEY_NUM) &&
+		    ((pending & HISI_IRQ_KEY_VALUE) == HISI_IRQ_KEY_VALUE)) {
 			generic_handle_irq(pmic->irqs[HISI_IRQ_KEY_DOWN]);
 			generic_handle_irq(pmic->irqs[HISI_IRQ_KEY_UP]);
 			pending &= (~HISI_IRQ_KEY_VALUE);
diff --git a/drivers/staging/hikey9xx/hi6421v600-regulator.c b/drivers/staging/hikey9xx/hi6421v600-regulator.c
index 29ef6bcadd84..82635ff54a74 100644
--- a/drivers/staging/hikey9xx/hi6421v600-regulator.c
+++ b/drivers/staging/hikey9xx/hi6421v600-regulator.c
@@ -227,7 +227,7 @@ static int hi6421_spmi_dt_parse(struct platform_device *pdev,
 
 	ret = of_property_read_u32(np, "reg", &rdesc->enable_reg);
 	if (ret) {
-		dev_err(dev, "missing reg property\nn");
+		dev_err(dev, "missing reg property\n");
 		return ret;
 	}
 
@@ -303,13 +303,13 @@ static int hi6421_spmi_dt_parse(struct platform_device *pdev,
 	 */
 	rdesc->vsel_mask = (1 << (fls(rdesc->n_voltages) - 1)) - 1;
 
-	dev_dbg(dev, "voltage selector settings: reg: 0x%x, mask: 0x%x",
+	dev_dbg(dev, "voltage selector settings: reg: 0x%x, mask: 0x%x\n",
 		rdesc->vsel_reg, rdesc->vsel_mask);
 
 	return 0;
 }
 
-static struct regulator_ops hi6421_spmi_ldo_rops = {
+static const struct regulator_ops hi6421_spmi_ldo_rops = {
 	.is_enabled = hi6421_spmi_regulator_is_enabled,
 	.enable = hi6421_spmi_regulator_enable,
 	.disable = hi6421_spmi_regulator_disable,
diff --git a/drivers/staging/hikey9xx/hisi-spmi-controller.c b/drivers/staging/hikey9xx/hisi-spmi-controller.c
index 583df10cbf1a..513d962b8bce 100644
--- a/drivers/staging/hikey9xx/hisi-spmi-controller.c
+++ b/drivers/staging/hikey9xx/hisi-spmi-controller.c
@@ -102,7 +102,7 @@ static int spmi_controller_wait_for_done(struct device *dev,
 			return 0;
 		}
 		udelay(1);
-	}  while(timeout--);
+	} while (timeout--);
 
 	dev_err(dev, "%s: timeout, status 0x%x\n", __func__, status);
 	return -ETIMEDOUT;
@@ -121,7 +121,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,
 
 	if (bc > SPMI_CONTROLLER_MAX_TRANS_BYTES) {
 		dev_err(&ctrl->dev,
-			"spmi_controller supports 1..%d bytes per trans, but:%ld requested",
+			"spmi_controller supports 1..%d bytes per trans, but:%ld requested\n",
 			SPMI_CONTROLLER_MAX_TRANS_BYTES, bc);
 		return  -EINVAL;
 	}
@@ -137,7 +137,7 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,
 		op_code = SPMI_CMD_EXT_REG_READ_L;
 		break;
 	default:
-		dev_err(&ctrl->dev, "invalid read cmd 0x%x", opc);
+		dev_err(&ctrl->dev, "invalid read cmd 0x%x\n", opc);
 		return -EINVAL;
 	}
 
@@ -157,7 +157,10 @@ static int spmi_read_cmd(struct spmi_controller *ctrl,
 		goto done;
 
 	for (i = 0; bc > i * SPMI_PER_DATAREG_BYTE; i++) {
-		data = readl(spmi_controller->base + chnl_ofst + SPMI_SLAVE_OFFSET * slave_id + SPMI_APB_SPMI_RDATA0_BASE_ADDR + i * SPMI_PER_DATAREG_BYTE);
+		data = readl(spmi_controller->base + chnl_ofst +
+			     SPMI_SLAVE_OFFSET * slave_id +
+			     SPMI_APB_SPMI_RDATA0_BASE_ADDR +
+			     i * SPMI_PER_DATAREG_BYTE);
 		data = be32_to_cpu((__be32)data);
 		if ((bc - i * SPMI_PER_DATAREG_BYTE) >> 2) {
 			memcpy(buf, &data, sizeof(data));
@@ -194,7 +197,7 @@ static int spmi_write_cmd(struct spmi_controller *ctrl,
 
 	if (bc > SPMI_CONTROLLER_MAX_TRANS_BYTES) {
 		dev_err(&ctrl->dev,
-			"spmi_controller supports 1..%d bytes per trans, but:%ld requested",
+			"spmi_controller supports 1..%d bytes per trans, but:%ld requested\n",
 			SPMI_CONTROLLER_MAX_TRANS_BYTES, bc);
 		return  -EINVAL;
 	}
@@ -210,7 +213,7 @@ static int spmi_write_cmd(struct spmi_controller *ctrl,
 		op_code = SPMI_CMD_EXT_REG_WRITE_L;
 		break;
 	default:
-		dev_err(&ctrl->dev, "invalid write cmd 0x%x", opc);
+		dev_err(&ctrl->dev, "invalid write cmd 0x%x\n", opc);
 		return -EINVAL;
 	}
 
@@ -234,8 +237,10 @@ static int spmi_write_cmd(struct spmi_controller *ctrl,
 		}
 
 		writel((u32)cpu_to_be32(data),
-		       spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_WDATA0_BASE_ADDR + SPMI_PER_DATAREG_BYTE * i);
-	};
+		       spmi_controller->base + chnl_ofst +
+		       SPMI_APB_SPMI_WDATA0_BASE_ADDR +
+		       SPMI_PER_DATAREG_BYTE * i);
+	}
 
 	/* Start the transaction */
 	writel(cmd, spmi_controller->base + chnl_ofst + SPMI_APB_SPMI_CMD_BASE_ADDR);


