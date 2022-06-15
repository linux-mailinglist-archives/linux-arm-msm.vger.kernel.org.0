Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B76D54BEFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 03:00:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242718AbiFOBAO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jun 2022 21:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243240AbiFOBAN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jun 2022 21:00:13 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01C922E099;
        Tue, 14 Jun 2022 18:00:12 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id z17so5517497wmi.1;
        Tue, 14 Jun 2022 18:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+Hg5uRFStx3WS0kTKnxQCOQKCrzVsjeN7435gZhvinI=;
        b=TuGiKHWsdqE5qoMksWCE7et9bkykyGuNrqLTDoDvBo2X45m2ExOUukLStTvjN3WpI6
         5bFBA1qJAW7e2h71q88pb2IeO9a9XyZ27oL4LrTkCT0a2csit7nNUZ73SO+xs2uWgKrv
         7lFtIYOWk54ovUXRKAIo73qYRubH0WgLyz8QgAugFVnIPDbgn2r099N6wDkMcuQqQkLv
         jwXP38XVSYSQaQBN5WJxqUEnjlcXp/QpfSJyUZSXWaIAoNBWkmXfkCKBumdqTxifbpnZ
         hshzJ7kiNgIxSII6cnKo8dn5g/6IWdEklgg2vv6poghoH1D5CGBEzGwNfBsMx54VHa1P
         PaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+Hg5uRFStx3WS0kTKnxQCOQKCrzVsjeN7435gZhvinI=;
        b=Rr8VnQoPfNmJCiGDUq/1TMy61kVKBY+w+A54r5JT7xztyeC6Gj7EnKQtTZm3F4VrG8
         0Xrnm9ruHr2Hj9l1X7ySb2EO17IqU91XVSIZhCk7joJSKe6GH8meOw0EEVyduo28vx6Z
         P2EnAz+o9P7ebITDH3oHXBBbwxGhu93AXWqzvNo8L8fGRbfv2VqieVssyT3G0+Ll3DEU
         LpmfsJyOham4mx64fiOODlUo3REUPHONT7I8lja5dBDvUp6J00J0atboFB/A8TacaFY/
         0I0NXY+S8Nuohc0VYJ/othNqA928Ogl8qBO+kHT9qWA9svIwAVm+47bm5tfVlA5HMMOa
         71Fg==
X-Gm-Message-State: AOAM533z8mlGiMlrRdtk0Ha7UagamBVMAX2bMqODJKH+Q1c3h1A49RSj
        d7exAEXBD9iYuJfY6fdNrXuTfxj3+8I=
X-Google-Smtp-Source: ABdhPJxIZFFPi1d0J2SQkKqrfzLF3FEe3HyApFazV18Din98fNplIpfzD2oZwwaKhWQnHz6yCdTVIw==
X-Received: by 2002:a05:600c:294a:b0:39c:4df5:f825 with SMTP id n10-20020a05600c294a00b0039c4df5f825mr6978769wmd.55.1655254810377;
        Tue, 14 Jun 2022 18:00:10 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id g10-20020a5d698a000000b0021020517639sm12890265wru.102.2022.06.14.18.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 18:00:06 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH v7 1/3] mtd: nand: raw: qcom_nandc: reorder qcom_nand_host struct
Date:   Wed, 15 Jun 2022 02:06:10 +0200
Message-Id: <20220615000612.3119-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220615000612.3119-1-ansuelsmth@gmail.com>
References: <20220615000612.3119-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reorder structs in nandc driver to save holes.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 107 +++++++++++++++++-------------
 1 file changed, 62 insertions(+), 45 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 1a77542c6d67..f2990d721733 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -238,6 +238,9 @@ nandc_set_reg(chip, reg,			\
  * @bam_ce - the array of BAM command elements
  * @cmd_sgl - sgl for NAND BAM command pipe
  * @data_sgl - sgl for NAND BAM consumer/producer pipe
+ * @last_data_desc - last DMA desc in data channel (tx/rx).
+ * @last_cmd_desc - last DMA desc in command channel.
+ * @txn_done - completion for NAND transfer.
  * @bam_ce_pos - the index in bam_ce which is available for next sgl
  * @bam_ce_start - the index in bam_ce which marks the start position ce
  *		   for current sgl. It will be used for size calculation
@@ -250,14 +253,14 @@ nandc_set_reg(chip, reg,			\
  * @rx_sgl_start - start index in data sgl for rx.
  * @wait_second_completion - wait for second DMA desc completion before making
  *			     the NAND transfer completion.
- * @txn_done - completion for NAND transfer.
- * @last_data_desc - last DMA desc in data channel (tx/rx).
- * @last_cmd_desc - last DMA desc in command channel.
  */
 struct bam_transaction {
 	struct bam_cmd_element *bam_ce;
 	struct scatterlist *cmd_sgl;
 	struct scatterlist *data_sgl;
+	struct dma_async_tx_descriptor *last_data_desc;
+	struct dma_async_tx_descriptor *last_cmd_desc;
+	struct completion txn_done;
 	u32 bam_ce_pos;
 	u32 bam_ce_start;
 	u32 cmd_sgl_pos;
@@ -267,25 +270,23 @@ struct bam_transaction {
 	u32 rx_sgl_pos;
 	u32 rx_sgl_start;
 	bool wait_second_completion;
-	struct completion txn_done;
-	struct dma_async_tx_descriptor *last_data_desc;
-	struct dma_async_tx_descriptor *last_cmd_desc;
 };
 
 /*
  * This data type corresponds to the nand dma descriptor
+ * @dma_desc - low level DMA engine descriptor
  * @list - list for desc_info
- * @dir - DMA transfer direction
+ *
  * @adm_sgl - sgl which will be used for single sgl dma descriptor. Only used by
  *	      ADM
  * @bam_sgl - sgl which will be used for dma descriptor. Only used by BAM
  * @sgl_cnt - number of SGL in bam_sgl. Only used by BAM
- * @dma_desc - low level DMA engine descriptor
+ * @dir - DMA transfer direction
  */
 struct desc_info {
+	struct dma_async_tx_descriptor *dma_desc;
 	struct list_head node;
 
-	enum dma_data_direction dir;
 	union {
 		struct scatterlist adm_sgl;
 		struct {
@@ -293,7 +294,7 @@ struct desc_info {
 			int sgl_cnt;
 		};
 	};
-	struct dma_async_tx_descriptor *dma_desc;
+	enum dma_data_direction dir;
 };
 
 /*
@@ -337,52 +338,64 @@ struct nandc_regs {
 /*
  * NAND controller data struct
  *
- * @controller:			base controller structure
- * @host_list:			list containing all the chips attached to the
- *				controller
  * @dev:			parent device
+ *
  * @base:			MMIO base
- * @base_phys:			physical base address of controller registers
- * @base_dma:			dma base address of controller registers
+ *
  * @core_clk:			controller clock
  * @aon_clk:			another controller clock
  *
+ * @regs:			a contiguous chunk of memory for DMA register
+ *				writes. contains the register values to be
+ *				written to controller
+ *
+ * @props:			properties of current NAND controller,
+ *				initialized via DT match data
+ *
+ * @controller:			base controller structure
+ * @host_list:			list containing all the chips attached to the
+ *				controller
+ *
  * @chan:			dma channel
  * @cmd_crci:			ADM DMA CRCI for command flow control
  * @data_crci:			ADM DMA CRCI for data flow control
+ *
  * @desc_list:			DMA descriptor list (list of desc_infos)
  *
  * @data_buffer:		our local DMA buffer for page read/writes,
  *				used when we can't use the buffer provided
  *				by upper layers directly
- * @buf_size/count/start:	markers for chip->legacy.read_buf/write_buf
- *				functions
  * @reg_read_buf:		local buffer for reading back registers via DMA
+ *
+ * @base_phys:			physical base address of controller registers
+ * @base_dma:			dma base address of controller registers
  * @reg_read_dma:		contains dma address for register read buffer
- * @reg_read_pos:		marker for data read in reg_read_buf
  *
- * @regs:			a contiguous chunk of memory for DMA register
- *				writes. contains the register values to be
- *				written to controller
- * @cmd1/vld:			some fixed controller register values
- * @props:			properties of current NAND controller,
- *				initialized via DT match data
+ * @buf_size/count/start:	markers for chip->legacy.read_buf/write_buf
+ *				functions
  * @max_cwperpage:		maximum QPIC codewords required. calculated
  *				from all connected NAND devices pagesize
+ *
+ * @reg_read_pos:		marker for data read in reg_read_buf
+ *
+ * @cmd1/vld:			some fixed controller register values
  */
 struct qcom_nand_controller {
-	struct nand_controller controller;
-	struct list_head host_list;
-
 	struct device *dev;
 
 	void __iomem *base;
-	phys_addr_t base_phys;
-	dma_addr_t base_dma;
 
 	struct clk *core_clk;
 	struct clk *aon_clk;
 
+	struct nandc_regs *regs;
+	struct bam_transaction *bam_txn;
+
+	const struct qcom_nandc_props *props;
+
+	struct nand_controller controller;
+	struct list_head host_list;
+
 	union {
 		/* will be used only by QPIC for BAM DMA */
 		struct {
@@ -400,22 +413,22 @@ struct qcom_nand_controller {
 	};
 
 	struct list_head desc_list;
-	struct bam_transaction *bam_txn;
 
 	u8		*data_buffer;
+	__le32		*reg_read_buf;
+
+	phys_addr_t base_phys;
+	dma_addr_t base_dma;
+	dma_addr_t reg_read_dma;
+
 	int		buf_size;
 	int		buf_count;
 	int		buf_start;
 	unsigned int	max_cwperpage;
 
-	__le32 *reg_read_buf;
-	dma_addr_t reg_read_dma;
 	int reg_read_pos;
 
-	struct nandc_regs *regs;
-
 	u32 cmd1, vld;
-	const struct qcom_nandc_props *props;
 };
 
 /*
@@ -431,19 +444,21 @@ struct qcom_nand_controller {
  *				and reserved bytes
  * @cw_data:			the number of bytes within a codeword protected
  *				by ECC
- * @use_ecc:			request the controller to use ECC for the
- *				upcoming read/write
- * @bch_enabled:		flag to tell whether BCH ECC mode is used
  * @ecc_bytes_hw:		ECC bytes used by controller hardware for this
  *				chip
- * @status:			value to be returned if NAND_CMD_STATUS command
- *				is executed
+ *
  * @last_command:		keeps track of last command on this chip. used
  *				for reading correct status
  *
  * @cfg0, cfg1, cfg0_raw..:	NANDc register configurations needed for
  *				ecc/non-ecc mode for the current nand flash
  *				device
+ *
+ * @status:			value to be returned if NAND_CMD_STATUS command
+ *				is executed
+ * @use_ecc:			request the controller to use ECC for the
+ *				upcoming read/write
+ * @bch_enabled:		flag to tell whether BCH ECC mode is used
  */
 struct qcom_nand_host {
 	struct nand_chip chip;
@@ -452,12 +467,10 @@ struct qcom_nand_host {
 	int cs;
 	int cw_size;
 	int cw_data;
-	bool use_ecc;
-	bool bch_enabled;
 	int ecc_bytes_hw;
 	int spare_bytes;
 	int bbm_size;
-	u8 status;
+
 	int last_command;
 
 	u32 cfg0, cfg1;
@@ -466,23 +479,27 @@ struct qcom_nand_host {
 	u32 ecc_bch_cfg;
 	u32 clrflashstatus;
 	u32 clrreadstatus;
+
+	u8 status;
+	bool use_ecc;
+	bool bch_enabled;
 };
 
 /*
  * This data type corresponds to the NAND controller properties which varies
  * among different NAND controllers.
  * @ecc_modes - ecc mode for NAND
+ * @dev_cmd_reg_start - NAND_DEV_CMD_* registers starting offset
  * @is_bam - whether NAND controller is using BAM
  * @is_qpic - whether NAND CTRL is part of qpic IP
  * @qpic_v2 - flag to indicate QPIC IP version 2
- * @dev_cmd_reg_start - NAND_DEV_CMD_* registers starting offset
  */
 struct qcom_nandc_props {
 	u32 ecc_modes;
+	u32 dev_cmd_reg_start;
 	bool is_bam;
 	bool is_qpic;
 	bool qpic_v2;
-	u32 dev_cmd_reg_start;
 };
 
 /* Frees the BAM transaction memory */
-- 
2.36.1

