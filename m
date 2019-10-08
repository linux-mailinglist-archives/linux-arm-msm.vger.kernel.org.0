Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35C3CCF372
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2019 09:16:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730309AbfJHHQ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Oct 2019 03:16:29 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:52036 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730057AbfJHHQ3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Oct 2019 03:16:29 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id BC40D8E81B87B520A9E3;
        Tue,  8 Oct 2019 15:16:26 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Tue, 8 Oct 2019
 15:16:19 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <vivek.gautam@codeaurora.org>, <yuehaibing@huawei.com>,
        <jcrouse@codeaurora.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] soc: qcom: Fix llcc-qcom definitions to include
Date:   Tue, 8 Oct 2019 15:16:14 +0800
Message-ID: <20191008071614.21692-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

commit 99356b03b431 ("soc: qcom: Make llcc-qcom a
generic driver") move these out of llcc-qcom.h, make
the building fails:

drivers/edac/qcom_edac.c:86:40: error: array type has incomplete element type struct llcc_edac_reg_data
 static const struct llcc_edac_reg_data edac_reg_data[] = {
                                        ^~~~~~~~~~~~~
drivers/edac/qcom_edac.c:87:3: error: array index in non-array initializer
  [LLCC_DRAM_CE] = {
   ^~~~~~~~~~~~
drivers/edac/qcom_edac.c:87:3: note: (near initialization for edac_reg_data)
drivers/edac/qcom_edac.c:88:3: error: field name not in record or union initializer
   .name = "DRAM Single-bit",
...
drivers/edac/qcom_edac.c:169:51: warning: struct llcc_drv_data declared inside parameter
 list will not be visible outside of this definition or declaration
 qcom_llcc_clear_error_status(int err_type, struct llcc_drv_data *drv)
                                                   ^~~~~~~~~~~~~

This patch move the needed definitions back to include.

Reported-by: Hulk Robot <hulkci@huawei.com>
Fixes: 99356b03b431 ("soc: qcom: Make llcc-qcom a generic driver")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 50 --------------------------------------
 include/linux/soc/qcom/llcc-qcom.h | 50 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index 98563ef..43606736 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -86,56 +86,6 @@ struct llcc_slice_config {
 	bool activate_on_init;
 };
 
-/**
- * llcc_drv_data - Data associated with the llcc driver
- * @regmap: regmap associated with the llcc device
- * @bcast_regmap: regmap associated with llcc broadcast offset
- * @cfg: pointer to the data structure for slice configuration
- * @lock: mutex associated with each slice
- * @cfg_size: size of the config data table
- * @max_slices: max slices as read from device tree
- * @num_banks: Number of llcc banks
- * @bitmap: Bit map to track the active slice ids
- * @offsets: Pointer to the bank offsets array
- * @ecc_irq: interrupt for llcc cache error detection and reporting
- */
-struct llcc_drv_data {
-	struct regmap *regmap;
-	struct regmap *bcast_regmap;
-	const struct llcc_slice_config *cfg;
-	struct mutex lock;
-	u32 cfg_size;
-	u32 max_slices;
-	u32 num_banks;
-	unsigned long *bitmap;
-	u32 *offsets;
-	int ecc_irq;
-};
-
-/**
- * llcc_edac_reg_data - llcc edac registers data for each error type
- * @name: Name of the error
- * @synd_reg: Syndrome register address
- * @count_status_reg: Status register address to read the error count
- * @ways_status_reg: Status register address to read the error ways
- * @reg_cnt: Number of registers
- * @count_mask: Mask value to get the error count
- * @ways_mask: Mask value to get the error ways
- * @count_shift: Shift value to get the error count
- * @ways_shift: Shift value to get the error ways
- */
-struct llcc_edac_reg_data {
-	char *name;
-	u64 synd_reg;
-	u64 count_status_reg;
-	u64 ways_status_reg;
-	u32 reg_cnt;
-	u32 count_mask;
-	u32 ways_mask;
-	u8  count_shift;
-	u8  ways_shift;
-};
-
 struct qcom_llcc_config {
 	const struct llcc_slice_config *sct_data;
 	int size;
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index c0acdb2..90b8646 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -37,6 +37,56 @@ struct llcc_slice_desc {
 	size_t slice_size;
 };
 
+/**
+ * llcc_edac_reg_data - llcc edac registers data for each error type
+ * @name: Name of the error
+ * @synd_reg: Syndrome register address
+ * @count_status_reg: Status register address to read the error count
+ * @ways_status_reg: Status register address to read the error ways
+ * @reg_cnt: Number of registers
+ * @count_mask: Mask value to get the error count
+ * @ways_mask: Mask value to get the error ways
+ * @count_shift: Shift value to get the error count
+ * @ways_shift: Shift value to get the error ways
+ */
+struct llcc_edac_reg_data {
+	char *name;
+	u64 synd_reg;
+	u64 count_status_reg;
+	u64 ways_status_reg;
+	u32 reg_cnt;
+	u32 count_mask;
+	u32 ways_mask;
+	u8  count_shift;
+	u8  ways_shift;
+};
+
+/**
+ * llcc_drv_data - Data associated with the llcc driver
+ * @regmap: regmap associated with the llcc device
+ * @bcast_regmap: regmap associated with llcc broadcast offset
+ * @cfg: pointer to the data structure for slice configuration
+ * @lock: mutex associated with each slice
+ * @cfg_size: size of the config data table
+ * @max_slices: max slices as read from device tree
+ * @num_banks: Number of llcc banks
+ * @bitmap: Bit map to track the active slice ids
+ * @offsets: Pointer to the bank offsets array
+ * @ecc_irq: interrupt for llcc cache error detection and reporting
+ */
+struct llcc_drv_data {
+	struct regmap *regmap;
+	struct regmap *bcast_regmap;
+	const struct llcc_slice_config *cfg;
+	struct mutex lock;
+	u32 cfg_size;
+	u32 max_slices;
+	u32 num_banks;
+	unsigned long *bitmap;
+	u32 *offsets;
+	int ecc_irq;
+};
+
 #if IS_ENABLED(CONFIG_QCOM_LLCC)
 /**
  * llcc_slice_getd - get llcc slice descriptor
-- 
2.7.4


