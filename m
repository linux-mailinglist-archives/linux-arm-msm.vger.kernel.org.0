Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40F674BDFA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Feb 2022 18:50:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355535AbiBUK6Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Feb 2022 05:58:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356031AbiBUK5L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Feb 2022 05:57:11 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C04C72FFF0;
        Mon, 21 Feb 2022 02:27:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 518B160FF0;
        Mon, 21 Feb 2022 10:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B514C340E9;
        Mon, 21 Feb 2022 10:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645439252;
        bh=a6ASU2O48d40j6M61B3Cb87FPq9gMZ+3ryBwDH0SqbE=;
        h=From:To:Cc:Subject:Date:From;
        b=KWhZbwlesp/STR2Klni2iUXNS+ap1rtn2kjgGad3VGtxPKw8Bu6KbhJYDFwALyPV1
         fT4CI8Huxt6omkxoCFdy5kh/+MxFC+W7YiGhbvozvbiq0TBz0pJJ97nu+PxfSQkz2w
         x5sQ7+/zIIXzUir5ATGqtSzCVPpeKes/tGqrpwbggYPpsh0+ANdRQ+jJ7Qgg/k2K0A
         Jm/UfZI625Q+5pQO5O5E39h1pgtBsnVj12rWbvReCqZgrF1nxP/ZaLsZY19xucxS7+
         GmbkN85c+b4wNDGh2wRnAjFtcO/iI63Lcea71gNMLMQ4KlFvbOtG1V0Q3XC1TPFQi7
         ZKvMKqFmZzENg==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        jorcrous@amazon.com, dmitry.baryshkov@linaro.org
Subject: [PATCH v7] i2c: qcom-geni: Add support for GPI DMA
Date:   Mon, 21 Feb 2022 15:57:16 +0530
Message-Id: <20220221102716.1167987-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QUP Serial engines supports data transfers thru FIFO mode, SE DMA mode
and lastly GPI DMA mode. Former two are already supported and this adds
supports for the last mode.

In GPI DMA mode, the firmware is issued commands by driver to perform
DMA and setup the serial port.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---

Changes since v6:
 - Fix comments by Bjorn
 - Use existing gi2c->err to pass status from callback
 - rework callback flow to avoid goto

Changes since v5:
 - Fix comments by Bjorn, Dmitry and Jordan
 - Fix the order of remove
 - make sure completion is called when status is !NOERROR
 - dont reset dma channel on exit
 - Make sure to return num on scucess for i2c xfer for both fifo and gpi
   mode


Changes since v4:
 - Fix buildbot warn
 - Fix flase warn reported by Alexey
 - Fix feedback from Bjorn and cleanup the probe code and add more details
   in changelog

Changes since v3:
 - remove separate tx and rx function for gsi dma and make a common one
 - remove global structs and use local variables instead



 drivers/i2c/busses/i2c-qcom-geni.c | 308 ++++++++++++++++++++++++++---
 1 file changed, 280 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 6d635a7c104c..fc1dcc19f2a1 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -3,7 +3,9 @@
 
 #include <linux/acpi.h>
 #include <linux/clk.h>
+#include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma/qcom-gpi-dma.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -48,6 +50,9 @@
 #define LOW_COUNTER_SHFT	10
 #define CYCLE_COUNTER_MSK	GENMASK(9, 0)
 
+#define I2C_PACK_TX		BIT(0)
+#define I2C_PACK_RX		BIT(1)
+
 enum geni_i2c_err_code {
 	GP_IRQ0,
 	NACK,
@@ -89,6 +94,9 @@ struct geni_i2c_dev {
 	void *dma_buf;
 	size_t xfer_len;
 	dma_addr_t dma_addr;
+	struct dma_chan *tx_c;
+	struct dma_chan *rx_c;
+	bool gpi_mode;
 };
 
 struct geni_i2c_err_log {
@@ -456,12 +464,207 @@ static int geni_i2c_tx_one_msg(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
 	return gi2c->err;
 }
 
+static void i2c_gpi_cb_result(void *cb, const struct dmaengine_result *result)
+{
+	struct geni_i2c_dev *gi2c = cb;
+
+	if (result->result != DMA_TRANS_NOERROR) {
+		dev_err(gi2c->se.dev, "DMA txn failed:%d\n", result->result);
+		gi2c->err = -EIO;
+	} else if (result->residue) {
+		dev_dbg(gi2c->se.dev, "DMA xfer has pending: %d\n", result->residue);
+	}
+
+	complete(&gi2c->done);
+}
+
+static void geni_i2c_gpi_unmap(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
+			       void *tx_buf, dma_addr_t tx_addr,
+			       void *rx_buf, dma_addr_t rx_addr)
+{
+	if (tx_buf) {
+		dma_unmap_single(gi2c->se.dev->parent, tx_addr, msg->len, DMA_TO_DEVICE);
+		i2c_put_dma_safe_msg_buf(tx_buf, msg, false);
+	}
+
+	if (rx_buf) {
+		dma_unmap_single(gi2c->se.dev->parent, rx_addr, msg->len, DMA_FROM_DEVICE);
+		i2c_put_dma_safe_msg_buf(rx_buf, msg, false);
+	}
+}
+
+static int geni_i2c_gpi(struct geni_i2c_dev *gi2c, struct i2c_msg *msg,
+			struct dma_slave_config *config, dma_addr_t *dma_addr_p,
+			void **buf, unsigned int op, struct dma_chan *dma_chan)
+{
+	struct gpi_i2c_config *peripheral;
+	unsigned int flags;
+	void *dma_buf;
+	dma_addr_t addr;
+	enum dma_data_direction map_dirn;
+	enum dma_transfer_direction dma_dirn;
+	struct dma_async_tx_descriptor *desc;
+	int ret;
+
+	peripheral = config->peripheral_config;
+
+	dma_buf = i2c_get_dma_safe_msg_buf(msg, 1);
+	if (!dma_buf)
+		return -ENOMEM;
+
+	if (op == I2C_WRITE)
+		map_dirn = DMA_TO_DEVICE;
+	else
+		map_dirn = DMA_FROM_DEVICE;
+
+	addr = dma_map_single(gi2c->se.dev->parent, dma_buf, msg->len, map_dirn);
+	if (dma_mapping_error(gi2c->se.dev->parent, addr)) {
+		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
+		return -ENOMEM;
+	}
+
+	/* set the length as message for rx txn */
+	peripheral->rx_len = msg->len;
+	peripheral->op = op;
+
+	ret = dmaengine_slave_config(dma_chan, config);
+	if (ret) {
+		dev_err(gi2c->se.dev, "dma config error: %d for op:%d\n", ret, op);
+		goto err_config;
+	}
+
+	peripheral->set_config = 0;
+	peripheral->multi_msg = true;
+	flags = DMA_PREP_INTERRUPT | DMA_CTRL_ACK;
+
+	if (op == I2C_WRITE)
+		dma_dirn = DMA_MEM_TO_DEV;
+	else
+		dma_dirn = DMA_DEV_TO_MEM;
+
+	desc = dmaengine_prep_slave_single(dma_chan, addr, msg->len, dma_dirn, flags);
+	if (!desc) {
+		dev_err(gi2c->se.dev, "prep_slave_sg failed\n");
+		ret = -EIO;
+		goto err_config;
+	}
+
+	desc->callback_result = i2c_gpi_cb_result;
+	desc->callback_param = gi2c;
+
+	dmaengine_submit(desc);
+	*dma_addr_p = addr;
+
+	return 0;
+
+err_config:
+	dma_unmap_single(gi2c->se.dev->parent, addr, msg->len, map_dirn);
+	i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
+	return ret;
+}
+
+static int geni_i2c_gpi_xfer(struct geni_i2c_dev *gi2c, struct i2c_msg msgs[], int num)
+{
+	struct dma_slave_config config = {};
+	struct gpi_i2c_config peripheral = {};
+	int i, ret = 0, timeout;
+	dma_addr_t tx_addr, rx_addr;
+	void *tx_buf = NULL, *rx_buf = NULL;
+	const struct geni_i2c_clk_fld *itr = gi2c->clk_fld;
+
+	config.peripheral_config = &peripheral;
+	config.peripheral_size = sizeof(peripheral);
+
+	peripheral.pack_enable = I2C_PACK_TX | I2C_PACK_RX;
+	peripheral.cycle_count = itr->t_cycle_cnt;
+	peripheral.high_count = itr->t_high_cnt;
+	peripheral.low_count = itr->t_low_cnt;
+	peripheral.clk_div = itr->clk_div;
+	peripheral.set_config = 1;
+	peripheral.multi_msg = false;
+
+	for (i = 0; i < num; i++) {
+		gi2c->cur = &msgs[i];
+		gi2c->err = 0;
+		dev_dbg(gi2c->se.dev, "msg[%d].len:%d\n", i, gi2c->cur->len);
+
+		peripheral.stretch = 0;
+		if (i < num - 1)
+			peripheral.stretch = 1;
+
+		peripheral.addr = msgs[i].addr;
+
+		if (msgs[i].flags & I2C_M_RD) {
+			ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
+					    &rx_addr, &rx_buf, I2C_READ, gi2c->rx_c);
+			if (ret)
+				goto err;
+		}
+
+		ret =  geni_i2c_gpi(gi2c, &msgs[i], &config,
+				    &tx_addr, &tx_buf, I2C_WRITE, gi2c->tx_c);
+		if (ret)
+			goto err;
+
+		if (msgs[i].flags & I2C_M_RD)
+			dma_async_issue_pending(gi2c->rx_c);
+		dma_async_issue_pending(gi2c->tx_c);
+
+		timeout = wait_for_completion_timeout(&gi2c->done, XFER_TIMEOUT);
+		if (!timeout) {
+			dev_err(gi2c->se.dev, "I2C timeout gpi flags:%d addr:0x%x\n",
+				gi2c->cur->flags, gi2c->cur->addr);
+			gi2c->err = -ETIMEDOUT;
+			goto err;
+		}
+
+		if (gi2c->err) {
+			ret = gi2c->err;
+			goto err;
+		}
+
+		geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
+	}
+
+	return num;
+
+err:
+	dev_err(gi2c->se.dev, "GPI transfer failed: %d\n", ret);
+	dmaengine_terminate_sync(gi2c->rx_c);
+	dmaengine_terminate_sync(gi2c->tx_c);
+	geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
+	return ret;
+}
+
+static int geni_i2c_fifo_xfer(struct geni_i2c_dev *gi2c,
+			      struct i2c_msg msgs[], int num)
+{
+	int i, ret = 0;
+
+	for (i = 0; i < num; i++) {
+		u32 m_param = i < (num - 1) ? STOP_STRETCH : 0;
+
+		m_param |= ((msgs[i].addr << SLV_ADDR_SHFT) & SLV_ADDR_MSK);
+
+		gi2c->cur = &msgs[i];
+		if (msgs[i].flags & I2C_M_RD)
+			ret = geni_i2c_rx_one_msg(gi2c, &msgs[i], m_param);
+		else
+			ret = geni_i2c_tx_one_msg(gi2c, &msgs[i], m_param);
+
+		if (ret)
+			return ret;
+	}
+
+	return num;
+}
+
 static int geni_i2c_xfer(struct i2c_adapter *adap,
 			 struct i2c_msg msgs[],
 			 int num)
 {
 	struct geni_i2c_dev *gi2c = i2c_get_adapdata(adap);
-	int i, ret;
+	int ret;
 
 	gi2c->err = 0;
 	reinit_completion(&gi2c->done);
@@ -475,28 +678,17 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	}
 
 	qcom_geni_i2c_conf(gi2c);
-	for (i = 0; i < num; i++) {
-		u32 m_param = i < (num - 1) ? STOP_STRETCH : 0;
-
-		m_param |= ((msgs[i].addr << SLV_ADDR_SHFT) & SLV_ADDR_MSK);
-
-		gi2c->cur = &msgs[i];
-		if (msgs[i].flags & I2C_M_RD)
-			ret = geni_i2c_rx_one_msg(gi2c, &msgs[i], m_param);
-		else
-			ret = geni_i2c_tx_one_msg(gi2c, &msgs[i], m_param);
 
-		if (ret)
-			break;
-	}
-	if (ret == 0)
-		ret = num;
+	if (gi2c->gpi_mode)
+		ret = geni_i2c_gpi_xfer(gi2c, msgs, num);
+	else
+		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
 
 	pm_runtime_mark_last_busy(gi2c->se.dev);
 	pm_runtime_put_autosuspend(gi2c->se.dev);
 	gi2c->cur = NULL;
 	gi2c->err = 0;
-	return ret;
+	return num;
 }
 
 static u32 geni_i2c_func(struct i2c_adapter *adap)
@@ -517,11 +709,50 @@ static const struct acpi_device_id geni_i2c_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, geni_i2c_acpi_match);
 #endif
 
+static void release_gpi_dma(struct geni_i2c_dev *gi2c)
+{
+	if (gi2c->rx_c)
+		dma_release_channel(gi2c->rx_c);
+
+	if (gi2c->tx_c)
+		dma_release_channel(gi2c->tx_c);
+}
+
+static int setup_gpi_dma(struct geni_i2c_dev *gi2c)
+{
+	int ret;
+
+	geni_se_select_mode(&gi2c->se, GENI_GPI_DMA);
+	gi2c->tx_c = dma_request_chan(gi2c->se.dev, "tx");
+	if (IS_ERR(gi2c->tx_c)) {
+		ret = dev_err_probe(gi2c->se.dev, PTR_ERR(gi2c->tx_c),
+				    "Failed to get tx DMA ch\n");
+		if (ret < 0)
+			goto err_tx;
+	}
+
+	gi2c->rx_c = dma_request_chan(gi2c->se.dev, "rx");
+	if (IS_ERR(gi2c->rx_c)) {
+		ret = dev_err_probe(gi2c->se.dev, PTR_ERR(gi2c->rx_c),
+				    "Failed to get rx DMA ch\n");
+		if (ret < 0)
+			goto err_rx;
+	}
+
+	dev_dbg(gi2c->se.dev, "Grabbed GPI dma channels\n");
+	return 0;
+
+err_rx:
+	dma_release_channel(gi2c->tx_c);
+err_tx:
+	return ret;
+}
+
 static int geni_i2c_probe(struct platform_device *pdev)
 {
 	struct geni_i2c_dev *gi2c;
 	struct resource *res;
-	u32 proto, tx_depth;
+	u32 proto, tx_depth, fifo_disable;
 	int ret;
 	struct device *dev = &pdev->dev;
 
@@ -601,27 +832,43 @@ static int geni_i2c_probe(struct platform_device *pdev)
 		return ret;
 	}
 	proto = geni_se_read_proto(&gi2c->se);
-	tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
 	if (proto != GENI_SE_I2C) {
 		dev_err(dev, "Invalid proto %d\n", proto);
 		geni_se_resources_off(&gi2c->se);
 		return -ENXIO;
 	}
-	gi2c->tx_wm = tx_depth - 1;
-	geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
-	geni_se_config_packing(&gi2c->se, BITS_PER_BYTE, PACKING_BYTES_PW,
-							true, true, true);
+
+	fifo_disable = readl_relaxed(gi2c->se.base + GENI_IF_DISABLE_RO) & FIFO_IF_DISABLE;
+	if (fifo_disable) {
+		/* FIFO is disabled, so we can only use GPI DMA */
+		gi2c->gpi_mode = true;
+		ret = setup_gpi_dma(gi2c);
+		if (ret) {
+			dev_err(dev, "Failed to setup GPI DMA mode:%d ret\n", ret);
+			return ret;
+		}
+
+		dev_dbg(dev, "Using GPI DMA mode for I2C\n");
+	} else {
+		gi2c->gpi_mode = false;
+		tx_depth = geni_se_get_tx_fifo_depth(&gi2c->se);
+		gi2c->tx_wm = tx_depth - 1;
+		geni_se_init(&gi2c->se, gi2c->tx_wm, tx_depth);
+		geni_se_config_packing(&gi2c->se, BITS_PER_BYTE,
+				       PACKING_BYTES_PW, true, true, true);
+
+		dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
+	}
+
 	ret = geni_se_resources_off(&gi2c->se);
 	if (ret) {
 		dev_err(dev, "Error turning off resources %d\n", ret);
-		return ret;
+		goto err_dma;
 	}
 
 	ret = geni_icc_disable(&gi2c->se);
 	if (ret)
-		return ret;
-
-	dev_dbg(dev, "i2c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
+		goto err_dma;
 
 	gi2c->suspended = 1;
 	pm_runtime_set_suspended(gi2c->se.dev);
@@ -633,12 +880,16 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(dev, "Error adding i2c adapter %d\n", ret);
 		pm_runtime_disable(gi2c->se.dev);
-		return ret;
+		goto err_dma;
 	}
 
 	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");
 
 	return 0;
+
+err_dma:
+	release_gpi_dma(gi2c);
+	return ret;
 }
 
 static int geni_i2c_remove(struct platform_device *pdev)
@@ -646,6 +897,7 @@ static int geni_i2c_remove(struct platform_device *pdev)
 	struct geni_i2c_dev *gi2c = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&gi2c->adap);
+	release_gpi_dma(gi2c);
 	pm_runtime_disable(gi2c->se.dev);
 	return 0;
 }
-- 
2.34.1

