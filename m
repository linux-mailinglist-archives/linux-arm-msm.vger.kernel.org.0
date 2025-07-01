Return-Path: <linux-arm-msm+bounces-63144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 785C3AEEFAB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 09:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73B3E3B12BB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 07:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B54F42638BC;
	Tue,  1 Jul 2025 07:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q2lFkLDu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8519C2620E4;
	Tue,  1 Jul 2025 07:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751354390; cv=none; b=Zk7l7V576AwL/PATt5tJiAgeKhtwmW7T11UTjwM9B61Ou1KQCfYJEOWRLn6DFP/HoNZ2ZWugKX3+BDK7kjnBzEEQvVwX1bTN7/4+QEJrYj/l+xKranxShGAkElE+7dCNXexokdYsdOuL21HFUuOLSVs2GTZ2o9ny8dmXw0xANRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751354390; c=relaxed/simple;
	bh=7/1W5eGFXcnHz/vqJrs/P8Ldeaj6ecLN0wlsqotNedk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gunFBa8KqjBx3HrwcKeBoUV1DH8paVLNlHeSbSUQXs1r37MprCQuRWlZ3sgPR8yZdswXSPbdetjFGbMgV6qv9b30HU1RXEmfIzmuAozz14P2TGVNVdWMh4iSzMpBFai2+PIp/sqa++PCIopE3TIMFoZcGiVh86Fdgt3ap+04joM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q2lFkLDu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56140YON025373;
	Tue, 1 Jul 2025 07:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hta9i+JJrdo
	Le8lw4HxCbSPlRmIAsd4gjAVi0SwLNt0=; b=Q2lFkLDuiXYQbWHAcpjsfJWDfwr
	xgfO0wsP8cfDZAkFSknHfmDtqai5ItipNZqCg2euGtj+dFklAsauzsEwTT+Du9zS
	lJ23yRGO6byTQe9H4Irr44Dz5w2n84D/HQZr9pwc6PJfPMNG4JhXsbjU2b4sLTtt
	OYXV9aelQVh/re6rJScgiyX3x+wWcbOgRzNT/p8ScWJVpEtepqfWKa8hRBxAMhnU
	PkwFkivyD1bnsiIjzXmMgiNy/m+kdPo75BtlJRXGQo0s/UBLOf57vGTVWZo6+roB
	ud9r/iiOvNYJmTBUFwoGD1mAu9+g0jrb5g7oS62/eMaHQpF6arSnUbUiD1Q==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64mss8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 07:19:27 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5617JLoJ029821;
	Tue, 1 Jul 2025 07:19:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 47j9fktsuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 07:19:24 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5617JNpD029869;
	Tue, 1 Jul 2025 07:19:24 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-msavaliy-hyd.qualcomm.com [10.213.110.207])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5617JNCc029852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 07:19:23 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 429934)
	id 13EDC24053; Tue,  1 Jul 2025 12:49:23 +0530 (+0530)
From: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jarkko.nikula@linux.intel.com,
        linux-i3c@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Frank.Li@nxp.com, wsa+renesas@sang-engineering.com,
        alok.a.tiwari@oracle.com
Cc: andersson@kernel.org, konradybcio@kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: [PATCH v6 2/3] i3c: master: Add Qualcomm I3C controller driver
Date: Tue,  1 Jul 2025 12:48:51 +0530
Message-Id: <20250701071852.2107800-3-mukesh.savaliya@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=68638bff cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=DPmnDSXdv8NEt5ZNaxIA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0MCBTYWx0ZWRfXyvt/0YAATN5B
 Af/AqL/XdktxIiGAbPbQ/s9rK7zktDK+j09mnUZxCkYsqAcBpVrTHgBZbuU/XNwWgDBsjtw+4sd
 Q86p+pzpit1GY2maL1c/EHvjdDQXW0Q9gkATFv9NQMx4+LdojbQ2T6KoTZZutKYfy51xjOe4gVp
 wCVzrhngzF3+jEA4bJQulPK3RZ3nnb0CaZJPWxfQ4Gy3stBdexUch8WMj0KHW8lcZPtbGdN1y4U
 oxCHtMfBU+10cNNwgguqrXmILPih/gXKSwScMe1WQ2vRYWmEV55HfNczsQD+ax5m2uKaWVtDifF
 lX7JPSSWyqP3x+wyBA6Z679Y+GRtpQ4C6IZYn+9x3tl6tATV56Hv6d2BUlrDh+SXerJnS4nTLJo
 bOXcB8JxctDIsVk5lfyet2PqWFqpMDoPP+EndhjQKXofCIs+unOCnnDq4nn354namc9pe6yL
X-Proofpoint-GUID: Qyt5b_K2qvn0IEmR1z8pnxbIj2bjRTJq
X-Proofpoint-ORIG-GUID: Qyt5b_K2qvn0IEmR1z8pnxbIj2bjRTJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1011 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010040

Add support for the Qualcomm I3C controller driver, which implements
I3C master functionality as defined in the MIPI Alliance Specification
for I3C, Version 1.0.

This driver supports master role in SDR mode.

Unlike some other I3C master controllers, this implementation
does not support In-Band Interrupts (IBI) and Hot-join requests.

Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
---
 drivers/i3c/master/Kconfig         |   12 +
 drivers/i3c/master/Makefile        |    1 +
 drivers/i3c/master/i3c-qcom-geni.c | 1158 ++++++++++++++++++++++++++++
 3 files changed, 1171 insertions(+)
 create mode 100644 drivers/i3c/master/i3c-qcom-geni.c

diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
index 7b30db3253af..3e062d4b8f85 100644
--- a/drivers/i3c/master/Kconfig
+++ b/drivers/i3c/master/Kconfig
@@ -41,6 +41,18 @@ config SVC_I3C_MASTER
 	help
 	  Support for Silvaco I3C Dual-Role Master Controller.
 
+config I3C_QCOM_GENI
+	tristate "Qualcomm Technologies Inc.'s I3C controller driver"
+	depends on QCOM_GENI_SE
+	help
+	  This driver supports QUPV3 GENI based I3C controller in master
+	  mode on the Qualcomm Technologies Inc.s SoCs. If you say yes to
+	  this option, support will be included for the built-in I3C interface
+	  on the Qualcomm Technologies Inc.s SoCs.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i3c-qcom-geni.
+
 config MIPI_I3C_HCI
 	tristate "MIPI I3C Host Controller Interface driver (EXPERIMENTAL)"
 	depends on HAS_IOMEM
diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
index 3e97960160bc..0e3ad9d96424 100644
--- a/drivers/i3c/master/Makefile
+++ b/drivers/i3c/master/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
+obj-$(CONFIG_I3C_QCOM_GENI)		+= i3c-qcom-geni.o
 obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
 obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
 obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
diff --git a/drivers/i3c/master/i3c-qcom-geni.c b/drivers/i3c/master/i3c-qcom-geni.c
new file mode 100644
index 000000000000..c8bb40cdaaf4
--- /dev/null
+++ b/drivers/i3c/master/i3c-qcom-geni.c
@@ -0,0 +1,1158 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ *
+ * Author: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/i3c/master.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/geni-se.h>
+#include <linux/units.h>
+
+#define SE_I3C_SCL_HIGH                 0x268
+#define SE_I3C_TX_TRANS_LEN             0x26c
+#define SE_I3C_RX_TRANS_LEN             0x270
+#define SE_I3C_DELAY_COUNTER            0x274
+#define SE_I2C_SCL_COUNTERS             0x278
+#define SE_I3C_SCL_CYCLE                0x27c
+#define SE_GENI_HW_IRQ_EN               0x920
+#define SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE 0x924
+#define SE_GENI_HW_IRQ_CMD_PARAM_0      0x930
+
+/* HW I3C IBI interrupt enable */
+#define M_IBI_IRQ_EN			BIT(0)
+
+/* M_IBI_IRQ_IGNORE */
+#define M_IBI_IRQ_IGNORE		BIT(0)
+
+/* SE_GENI_M_CLK_CFG field shifts */
+#define	CLK_DIV_VALUE_MASK		GENMASK(23, 4)
+#define SER_CLK_EN			BIT(0)
+
+/* SE_GENI_HW_IRQ_CMD_PARAM_0 field bits */
+#define M_IBI_IRQ_PARAM_7E		BIT(0)
+#define M_IBI_IRQ_PARAM_STOP_STALL	BIT(1)
+
+/* SE_I2C_SCL_COUNTERS field shifts */
+#define I2C_SCL_HIGH_COUNTER_MASK	GENMASK(29, 20)
+#define I2C_SCL_LOW_COUNTER_MASK	GENMASK(19, 10)
+#define I2C_SCL_CYCLE_COUNTER_MASK	GENMASK(9, 0)
+
+#define SE_I3C_ERR  (M_CMD_OVERRUN_EN | M_ILLEGAL_CMD_EN | M_CMD_FAILURE_EN |\
+	M_CMD_ABORT_EN | M_GP_IRQ_0_EN | M_GP_IRQ_1_EN | M_GP_IRQ_2_EN | \
+	M_GP_IRQ_3_EN | M_GP_IRQ_4_EN)
+
+/* M_CMD OP codes for I2C/I3C */
+#define I3C_READ_IBI_HW          0
+#define I2C_WRITE                1
+#define I2C_READ                 2
+#define I2C_WRITE_READ           3
+#define I2C_ADDR_ONLY            4
+#define I3C_INBAND_RESET         5
+#define I2C_BUS_CLEAR            6
+#define I2C_STOP_ON_BUS          7
+#define I3C_HDR_DDR_EXIT         8
+#define I3C_PRIVATE_WRITE        9
+#define I3C_PRIVATE_READ         10
+#define I3C_HDR_DDR_WRITE        11
+#define I3C_HDR_DDR_READ         12
+#define I3C_DIRECT_CCC_ADDR_ONLY 13
+#define I3C_BCAST_CCC_ADDR_ONLY  14
+#define I3C_READ_IBI             15
+#define I3C_BCAST_CCC_WRITE      16
+#define I3C_DIRECT_CCC_WRITE     17
+#define I3C_DIRECT_CCC_READ      18
+
+/* M_CMD params for I3C */
+#define PRE_CMD_DELAY		BIT(0)
+#define TIMESTAMP_BEFORE	BIT(1)
+#define STOP_STRETCH		BIT(2)
+#define TIMESTAMP_AFTER		BIT(3)
+#define POST_COMMAND_DELAY	BIT(4)
+#define IGNORE_ADD_NACK		BIT(6)
+#define READ_FINISHED_WITH_ACK	BIT(7)
+#define CONTINUOUS_MODE_DAA	BIT(8)
+
+#define SLAVE_ADDR_MASK		GENMASK(15, 9)
+
+#define CCC_HDR_CMD_MSK		GENMASK(23, 16)
+#define IBI_NACK_TBL_CTRL	BIT(24)
+#define USE_7E			BIT(25)
+#define BYPASS_ADDR_PHASE	BIT(26)
+
+/* GSI callback error fields - DMA_TX_IRQ_STAT */
+#define GP_IRQ0			BIT(5)
+#define GP_IRQ1			BIT(6)
+#define GP_IRQ2			BIT(7)
+#define GP_IRQ3			BIT(8)
+#define GP_IRQ4			BIT(9)
+#define GP_IRQ5			BIT(10)
+#define DM_I3C_CB_ERR		GENMASK(10, 5)
+
+#define I3C_AUTO_SUSPEND_DELAY	250
+#define PACKING_BYTES_PER_WORD	4
+#define XFER_TIMEOUT		250
+#define DFS_INDEX_MAX		7
+
+#define I3C_ADDR_MASK		I2C_MAX_ADDR
+
+enum geni_i3c_err_code {
+	RD_TERM,
+	NACK,
+	CRC_ERR,
+	BUS_PROTO,
+	NACK_7E,
+	NACK_IBI,
+	GENI_OVERRUN,
+	GENI_ILLEGAL_CMD,
+	GENI_ABORT_DONE,
+	GENI_TIMEOUT,
+};
+
+enum i3c_bus_phase {
+	OPEN_DRAIN_MODE  = 0,
+	PUSH_PULL_MODE   = 1
+};
+
+struct geni_i3c_dev {
+	struct geni_se se;
+	unsigned int tx_wm;
+	int irq;
+	int err;
+	struct i3c_master_controller ctrlr;
+	struct completion done;
+	/* Protects per device CCC command or transfer from get_mutex_lock()/unlock() wrapper */
+	struct mutex lock;
+	/* Per device protection between process and IRQ context */
+	spinlock_t irq_lock;
+	u32 clk_src_freq;
+	u8 *cur_buf;
+	bool cur_is_write;
+	int cur_len;
+	int cur_idx;
+	DECLARE_BITMAP(newaddrslots, 64);
+
+	const struct geni_i3c_clk_settings *clk_cfg;
+	const struct geni_i3c_clk_settings *clk_od_cfg;
+};
+
+struct geni_i3c_i2c_dev_data {
+	u32 ibi_keeping;  /* Plan to save IBI information, keep as dummy for now */
+};
+
+struct geni_i3c_xfer_params {
+	enum geni_se_xfer_mode mode;
+	u32 m_cmd;
+	u32 m_param;
+};
+
+static inline struct geni_i3c_dev *to_geni_i3c_master(struct i3c_master_controller
+							*master)
+{
+	return container_of(master, struct geni_i3c_dev, ctrlr);
+}
+
+struct geni_i3c_clk_settings {
+	u32 clk_freq_out;
+	u32 clk_src_freq;
+	u8  clk_div;
+	u8  i2c_t_high_cnt;
+	u8  i2c_t_low_cnt;
+	u8  i3c_t_high_cnt;
+	u8  i3c_t_cycle_cnt;
+	u8  i2c_t_cycle_cnt;
+};
+
+/*
+ * The hardware uses the following formulas to calculate the time periods
+ * of the SCL clock cycle. The firmware adds a few extra cycles that are not
+ * included in the formulas below. It has been verified that the resulting
+ * timings remain within the I2C/I3C specification limits.
+ *
+ * I2C SCL high period:
+ *     i2c_t_high = (i2c_t_high_cnt * clk_div) / source_clock
+ *
+ * I2C SCL low period:
+ *     i2c_t_low = (i2c_t_low_cnt * clk_div) / source_clock
+ *
+ * I2C SCL full cycle:
+ *     i2c_t_cycle = (i2c_t_cycle_cnt * clk_div) / source_clock
+ *
+ * I3C SCL high period:
+ *     i3c_t_high = (i3c_t_high_cnt * clk_div) / source_clock
+ *
+ * I3C SCL full cycle:
+ *     i3c_t_cycle = (i3c_t_cycle_cnt * clk_div) / source_clock
+ *
+ * Output clock frequency:
+ *     clk_freq_out = t / t_cycle
+ */
+static const struct geni_i3c_clk_settings geni_i3c_clk_map[] = {
+	{
+		.clk_freq_out = 100 * HZ_PER_KHZ,
+		.clk_src_freq = 19200 * HZ_PER_KHZ,
+		.clk_div = 1,
+		.i2c_t_high_cnt = 76,
+		.i2c_t_low_cnt = 90,
+		.i3c_t_high_cnt = 7,
+		.i3c_t_cycle_cnt = 8,
+		.i2c_t_cycle_cnt = 192,
+	},
+	{
+		.clk_freq_out = 400 * HZ_PER_KHZ,
+		.clk_src_freq = 19200 * HZ_PER_KHZ,
+		.clk_div = 1,
+		.i2c_t_high_cnt = 12,
+		.i2c_t_low_cnt = 24,
+		.i3c_t_high_cnt = 7,
+		.i3c_t_cycle_cnt = 8,
+		.i2c_t_cycle_cnt = 48
+	},
+	{
+		.clk_freq_out = 1000 * HZ_PER_KHZ,
+		.clk_src_freq = 19200 * HZ_PER_KHZ,
+		.clk_div = 1,
+		.i2c_t_high_cnt = 4,
+		.i2c_t_low_cnt = 9,
+		.i3c_t_high_cnt = 7,
+		.i3c_t_cycle_cnt = 0,
+		.i2c_t_cycle_cnt = 19
+	},
+	{
+		.clk_freq_out = 12500 * HZ_PER_KHZ,
+		.clk_src_freq = 100000 * HZ_PER_KHZ,
+		.clk_div = 1,
+		.i2c_t_high_cnt = 45,
+		.i2c_t_low_cnt = 63,
+		.i3c_t_high_cnt = 6,
+		.i3c_t_cycle_cnt = 7,
+		.i2c_t_cycle_cnt = 110
+	}
+};
+
+static int geni_i3c_clk_map_idx(struct geni_i3c_dev *gi3c)
+{
+	const struct geni_i3c_clk_settings *clk_idx = geni_i3c_clk_map;
+	struct i3c_master_controller *m = &gi3c->ctrlr;
+	struct i3c_bus *bus = i3c_master_get_bus(m);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(geni_i3c_clk_map); i++, clk_idx++) {
+		if (clk_idx->clk_freq_out == bus->scl_rate.i3c &&
+		    clk_idx->clk_src_freq == gi3c->clk_src_freq)
+			gi3c->clk_cfg = clk_idx;
+
+		if (clk_idx->clk_freq_out == bus->scl_rate.i2c)
+			gi3c->clk_od_cfg = clk_idx;
+	}
+
+	if (!gi3c->clk_cfg || !gi3c->clk_od_cfg)
+		return -EINVAL;
+
+	return 0;
+}
+
+static inline void set_new_addr_slot(unsigned long *addrslot, u8 addr)
+{
+	if (addr > I3C_ADDR_MASK)
+		return;
+
+	set_bit(addr, addrslot);
+}
+
+static inline void clear_new_addr_slot(unsigned long *addrslot, u8 addr)
+{
+	if (addr > I3C_ADDR_MASK)
+		return;
+
+	clear_bit(addr, addrslot);
+}
+
+static inline bool is_new_addr_slot_set(unsigned long *addrslot, u8 addr)
+{
+	return test_bit(addr, addrslot);
+}
+
+static void qcom_geni_i3c_conf(struct geni_i3c_dev *gi3c, enum i3c_bus_phase bus_phase)
+{
+	const struct geni_i3c_clk_settings *clk_idx = gi3c->clk_cfg;
+	unsigned long freq;
+	u32 val, dfs_idx;
+	int ret;
+
+	if (bus_phase == OPEN_DRAIN_MODE)
+		clk_idx = gi3c->clk_od_cfg;
+
+	ret = geni_se_clk_freq_match(&gi3c->se, clk_idx->clk_src_freq,
+				     &dfs_idx, &freq, false);
+	if (ret)
+		dfs_idx = 0;
+
+	writel_relaxed(dfs_idx, gi3c->se.base + SE_GENI_CLK_SEL);
+
+	val = FIELD_PREP(CLK_DIV_VALUE_MASK, clk_idx->clk_div);
+	val |= SER_CLK_EN;
+	writel_relaxed(val, gi3c->se.base + GENI_SER_M_CLK_CFG);
+
+	val = FIELD_PREP(I2C_SCL_HIGH_COUNTER_MASK, clk_idx->i2c_t_high_cnt);
+	val |= FIELD_PREP(I2C_SCL_LOW_COUNTER_MASK, clk_idx->i2c_t_low_cnt);
+	val |= FIELD_PREP(I2C_SCL_CYCLE_COUNTER_MASK, clk_idx->i2c_t_cycle_cnt);
+	writel_relaxed(val, gi3c->se.base + SE_I2C_SCL_COUNTERS);
+
+	writel_relaxed(clk_idx->i3c_t_cycle_cnt, gi3c->se.base + SE_I3C_SCL_CYCLE);
+	writel_relaxed(clk_idx->i3c_t_high_cnt, gi3c->se.base + SE_I3C_SCL_HIGH);
+
+	writel_relaxed(M_IBI_IRQ_IGNORE, gi3c->se.base + SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE);
+
+	val = M_IBI_IRQ_PARAM_STOP_STALL | M_IBI_IRQ_PARAM_7E;
+	writel_relaxed(val, gi3c->se.base + SE_GENI_HW_IRQ_CMD_PARAM_0);
+
+	writel_relaxed(M_IBI_IRQ_EN, gi3c->se.base + SE_GENI_HW_IRQ_EN);
+}
+
+static void geni_i3c_handle_err(struct geni_i3c_dev *gi3c, u32 status)
+{
+	dev_dbg(gi3c->se.dev, "len:%d, %s\n",
+		gi3c->cur_len, gi3c->cur_is_write ? "write" : "read");
+
+	if (status & M_GP_IRQ_0_EN) {
+		gi3c->err = -EINVAL;
+		dev_dbg(gi3c->se.dev, "I3C slave early read termination\n");
+	}
+
+	if (status & M_GP_IRQ_1_EN) {
+		gi3c->err = -ENOTCONN;
+		dev_dbg(gi3c->se.dev, "NACK: slave unresponsive, check power/reset\n");
+	}
+
+	if (status & M_GP_IRQ_2_EN) {
+		gi3c->err = -EINVAL;
+		dev_dbg(gi3c->se.dev, "CRC or parity error\n");
+	}
+
+	if (status & M_GP_IRQ_3_EN) {
+		gi3c->err = -EPROTO;
+		dev_dbg(gi3c->se.dev, "Bus proto Error, noisy/unexpected start/stop\n");
+	}
+
+	if (status & M_GP_IRQ_4_EN) {
+		gi3c->err = -EBUSY;
+		dev_dbg(gi3c->se.dev, "NACK on 7E, unexpected protocol error\n");
+	}
+
+	if (status & M_GP_IRQ_5_EN) {
+		gi3c->err = -EINVAL;
+		dev_dbg(gi3c->se.dev, "NACK on IBI\n");
+	}
+
+	if (status & M_CMD_OVERRUN_EN) {
+		gi3c->err = -EIO;
+		dev_dbg(gi3c->se.dev, "Cmd overrun, check GENI cmd-state machine\n");
+	}
+
+	if (status & M_ILLEGAL_CMD_EN) {
+		gi3c->err = -EILSEQ;
+		dev_dbg(gi3c->se.dev, "Illegal cmd, check GENI cmd-state machine\n");
+	}
+
+	if (status & M_CMD_ABORT_EN) {
+		gi3c->err = -ETIMEDOUT;
+		dev_dbg(gi3c->se.dev, "Abort after timeout successful\n");
+	}
+
+	if (status & GENI_TIMEOUT) {
+		gi3c->err = -ETIMEDOUT;
+		dev_dbg(gi3c->se.dev, "I3C transaction timed out\n");
+	}
+}
+
+static irqreturn_t geni_i3c_irq(int irq, void *dev)
+{
+	u32 m_stat_mask, dm_tx_st, dm_rx_st, m_stat, rx_st, dma;
+	struct geni_i3c_dev *gi3c = dev;
+	bool fifo_read_status;
+	unsigned long flags;
+	int j;
+
+	m_stat = readl_relaxed(gi3c->se.base + SE_GENI_M_IRQ_STATUS);
+	m_stat_mask = readl_relaxed(gi3c->se.base + SE_GENI_M_IRQ_EN);
+	rx_st = readl_relaxed(gi3c->se.base + SE_GENI_RX_FIFO_STATUS);
+	dm_tx_st = readl_relaxed(gi3c->se.base + SE_DMA_TX_IRQ_STAT);
+	dm_rx_st = readl_relaxed(gi3c->se.base + SE_DMA_RX_IRQ_STAT);
+	dma = readl_relaxed(gi3c->se.base + SE_GENI_DMA_MODE_EN);
+
+	spin_lock_irqsave(&gi3c->irq_lock, flags);
+
+	if (m_stat & SE_I3C_ERR || dm_rx_st & DM_I3C_CB_ERR) {
+		geni_i3c_handle_err(gi3c, m_stat);
+		/* Disable the TX Watermark interrupt to stop TX */
+		if (!dma)
+			writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
+		goto irqret;
+	}
+
+	if (dma) {
+		dev_dbg(gi3c->se.dev, "i3c dma tx:0x%x, dma rx:0x%x\n", dm_tx_st, dm_rx_st);
+		goto irqret;
+	}
+
+	fifo_read_status = m_stat & (M_RX_FIFO_WATERMARK_EN | M_RX_FIFO_LAST_EN);
+	if (fifo_read_status && !gi3c->cur_is_write && gi3c->cur_buf) {
+		u32 rxcnt = rx_st & RX_FIFO_WC_MSK;
+
+		for (j = 0; j < rxcnt; j++) {
+			u32 val;
+			int p = 0;
+
+			val = readl_relaxed(gi3c->se.base + SE_GENI_RX_FIFOn);
+			while (gi3c->cur_idx < gi3c->cur_len && p < 4) {
+				gi3c->cur_buf[gi3c->cur_idx++] = val & 0xff;
+				val >>= 8;
+				p++;
+			}
+			if (gi3c->cur_idx == gi3c->cur_len)
+				break;
+		}
+	} else if (m_stat & M_TX_FIFO_WATERMARK_EN &&
+		gi3c->cur_is_write && gi3c->cur_buf) {
+		for (j = 0; j < gi3c->tx_wm; j++) {
+			u32 temp;
+			u32 val = 0;
+			int p = 0;
+
+			while (gi3c->cur_idx < gi3c->cur_len && p < 4) {
+				temp = gi3c->cur_buf[gi3c->cur_idx++];
+				val |= temp << (p * 8);
+				p++;
+			}
+
+			writel_relaxed(val, gi3c->se.base + SE_GENI_TX_FIFOn);
+			if (gi3c->cur_idx == gi3c->cur_len) {
+				writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
+				break;
+			}
+		}
+	}
+
+irqret:
+	if (m_stat)
+		writel_relaxed(m_stat, gi3c->se.base + SE_GENI_M_IRQ_CLEAR);
+
+	if (dma) {
+		if (dm_tx_st)
+			writel_relaxed(dm_tx_st, gi3c->se.base + SE_DMA_TX_IRQ_CLR);
+		if (dm_rx_st)
+			writel_relaxed(dm_rx_st, gi3c->se.base + SE_DMA_RX_IRQ_CLR);
+	}
+
+	/* if this is err with done-bit not set, handle that through timeout. */
+	if (m_stat & M_CMD_DONE_EN || m_stat & M_CMD_ABORT_EN) {
+		writel_relaxed(0, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
+		complete(&gi3c->done);
+	} else if (dm_tx_st & TX_DMA_DONE || dm_rx_st & RX_DMA_DONE || dm_rx_st & RX_RESET_DONE) {
+		complete(&gi3c->done);
+	}
+
+	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
+
+	return IRQ_HANDLED;
+}
+
+static int i3c_geni_runtime_get_mutex_lock(struct geni_i3c_dev *gi3c)
+	__acquires(&gi3c->lock)
+{
+	int ret;
+
+	mutex_lock(&gi3c->lock);
+	reinit_completion(&gi3c->done);
+	ret = pm_runtime_get_sync(gi3c->se.dev);
+	if (ret < 0) {
+		dev_err(gi3c->se.dev, "error turning on SE resources:%d\n", ret);
+		pm_runtime_put_noidle(gi3c->se.dev);
+		/* Set device in suspended since resume failed */
+		pm_runtime_set_suspended(gi3c->se.dev);
+		mutex_unlock(&gi3c->lock);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void i3c_geni_runtime_put_mutex_unlock(struct geni_i3c_dev *gi3c)
+	__releases(&gi3c->lock)
+{
+	pm_runtime_mark_last_busy(gi3c->se.dev);
+	pm_runtime_put_autosuspend(gi3c->se.dev);
+	mutex_unlock(&gi3c->lock);
+}
+
+static void geni_i3c_abort_xfer(struct geni_i3c_dev *gi3c)
+{
+	unsigned long time_remaining;
+	unsigned long flags;
+
+	reinit_completion(&gi3c->done);
+	spin_lock_irqsave(&gi3c->irq_lock, flags);
+	geni_i3c_handle_err(gi3c, GENI_TIMEOUT);
+	geni_se_abort_m_cmd(&gi3c->se);
+	spin_unlock_irqrestore(&gi3c->irq_lock, flags);
+	time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
+	if (!time_remaining)
+		dev_err(gi3c->se.dev, "Timeout abort_m_cmd\n");
+}
+
+static int _i3c_geni_execute_command(struct geni_i3c_dev *gi3c, struct geni_i3c_xfer_params *xfer)
+{
+	bool is_write = gi3c->cur_is_write;
+	dma_addr_t tx_dma = 0, rx_dma = 0;
+	unsigned long time_remaining;
+	u32 len = gi3c->cur_len;
+	int ret;
+
+	geni_se_select_mode(&gi3c->se, xfer->mode);
+
+	gi3c->err = 0;
+	gi3c->cur_idx = 0;
+
+	if (is_write) {
+		dev_dbg(gi3c->se.dev, "I3C cmd:0x%x param:0x%x WRITE len:%d\n",
+			xfer->m_cmd, xfer->m_param, len);
+
+		writel_relaxed(len, gi3c->se.base + SE_I3C_TX_TRANS_LEN);
+		geni_se_setup_m_cmd(&gi3c->se, xfer->m_cmd, xfer->m_param);
+
+		if (xfer->mode == GENI_SE_DMA) {
+			ret = geni_se_tx_dma_prep(&gi3c->se, gi3c->cur_buf, len, &tx_dma);
+			if (ret) {
+				xfer->mode = GENI_SE_FIFO;
+				geni_se_select_mode(&gi3c->se, xfer->mode);
+			}
+		}
+
+		if (xfer->mode == GENI_SE_FIFO && len > 0) /* Get FIFO IRQ */
+			writel_relaxed(1, gi3c->se.base + SE_GENI_TX_WATERMARK_REG);
+	} else {
+		dev_dbg(gi3c->se.dev, "I3C cmd:0x%x param:0x%x READ len:%d\n",
+			xfer->m_cmd, xfer->m_param, len);
+		writel_relaxed(len, gi3c->se.base + SE_I3C_RX_TRANS_LEN);
+		geni_se_setup_m_cmd(&gi3c->se, xfer->m_cmd, xfer->m_param);
+		if (xfer->mode == GENI_SE_DMA) {
+			ret = geni_se_rx_dma_prep(&gi3c->se, gi3c->cur_buf, len, &rx_dma);
+			if (ret) {
+				xfer->mode = GENI_SE_FIFO;
+				geni_se_select_mode(&gi3c->se, xfer->mode);
+			}
+		}
+	}
+
+	time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
+	if (!time_remaining) {
+		unsigned long flags;
+
+		dev_dbg(gi3c->se.dev, "Timeout completing transfer\n");
+		spin_lock_irqsave(&gi3c->irq_lock, flags);
+		geni_i3c_handle_err(gi3c, GENI_TIMEOUT);
+		gi3c->cur_buf = NULL;
+		spin_unlock_irqrestore(&gi3c->irq_lock, flags);
+		geni_i3c_abort_xfer(gi3c);
+	}
+
+	if (xfer->mode == GENI_SE_DMA) {
+		if (gi3c->err) {
+			if (is_write)
+				writel_relaxed(1, gi3c->se.base + SE_DMA_TX_FSM_RST);
+			else
+				writel_relaxed(1, gi3c->se.base + SE_DMA_RX_FSM_RST);
+
+			time_remaining = wait_for_completion_timeout(&gi3c->done, XFER_TIMEOUT);
+			dev_dbg(gi3c->se.dev, "Timeout completing DMA transfer\n");
+		}
+		geni_se_rx_dma_unprep(&gi3c->se, rx_dma, len);
+		geni_se_tx_dma_unprep(&gi3c->se, tx_dma, len);
+	}
+
+	ret = gi3c->err;
+	if (gi3c->err)
+		dev_err(gi3c->se.dev, "I3C transaction error :%d\n", gi3c->err);
+
+	gi3c->cur_buf = NULL;
+	gi3c->err = 0;
+
+	return ret;
+}
+
+static int i3c_geni_execute_read_command(struct geni_i3c_dev *gi3c,
+					 struct geni_i3c_xfer_params *xfer, u8 *buf, u32 len)
+{
+	gi3c->cur_is_write = false;
+	gi3c->cur_buf = buf;
+	gi3c->cur_len = len;
+
+	return _i3c_geni_execute_command(gi3c, xfer);
+}
+
+static int i3c_geni_execute_write_command(struct geni_i3c_dev *gi3c,
+					  struct geni_i3c_xfer_params *xfer, u8 *buf, u32 len)
+{
+	gi3c->cur_is_write = true;
+	gi3c->cur_buf = buf;
+	gi3c->cur_len = len;
+
+	return _i3c_geni_execute_command(gi3c, xfer);
+}
+
+static void geni_i3c_perform_daa(struct geni_i3c_dev *gi3c)
+{
+	u8 last_dyn_addr = 0;
+	int ret;
+
+	while (1) {
+		u8 rx_buf[8], tx_buf[8];
+		struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
+		struct i3c_device_info info = { 0 };
+		struct i3c_dev_desc *i3cdev;
+		bool new_device = true;
+		u64 pid;
+		u8 bcr, dcr, addr;
+
+		xfer.m_cmd = I2C_READ;
+		xfer.m_param = STOP_STRETCH | CONTINUOUS_MODE_DAA | USE_7E;
+		ret = i3c_geni_execute_read_command(gi3c, &xfer, rx_buf, 8);
+		if (ret)
+			break;
+
+		dcr = FIELD_PREP(GENMASK(7, 0), rx_buf[7]);
+		bcr = FIELD_PREP(GENMASK(7, 0), rx_buf[6]);
+		pid = FIELD_PREP(GENMASK(47, 40), (u64)rx_buf[0]) |
+			FIELD_PREP(GENMASK(39, 32), (u64)rx_buf[1]) |
+			FIELD_PREP(GENMASK(31, 24), (u64)rx_buf[2]) |
+			FIELD_PREP(GENMASK(23, 16), (u64)rx_buf[3]) |
+			FIELD_PREP(GENMASK(15, 8), (u64)rx_buf[4]) |
+			FIELD_PREP(GENMASK(7, 0), (u64)rx_buf[5]);
+
+		i3c_bus_for_each_i3cdev(&gi3c->ctrlr.bus, i3cdev) {
+			i3c_device_get_info(i3cdev->dev, &info);
+			if (pid == info.pid && dcr == info.dcr && bcr == info.bcr) {
+				new_device = false;
+				addr = info.dyn_addr ? : info.static_addr;
+				break;
+			}
+		}
+
+		if (new_device) {
+			ret = i3c_master_get_free_addr(&gi3c->ctrlr, last_dyn_addr + 1);
+			if (ret < 0)
+				break;
+			addr = (u8)ret;
+			last_dyn_addr = addr;
+			set_new_addr_slot(gi3c->newaddrslots, addr);
+		}
+
+		/* Set Parity bit at BIT(7) */
+		tx_buf[0] = (addr & I3C_ADDR_MASK) << 1;
+		tx_buf[0] |= parity8(addr & I3C_ADDR_MASK);
+
+		xfer.m_cmd = I2C_WRITE;
+		xfer.m_param = STOP_STRETCH | BYPASS_ADDR_PHASE | USE_7E;
+
+		ret = i3c_geni_execute_write_command(gi3c, &xfer, tx_buf, 1);
+		if (ret)
+			break;
+	}
+}
+
+static int geni_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
+					struct i3c_ccc_cmd *cmd)
+{
+	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
+	int i, ret;
+
+	if (!(cmd->id & I3C_CCC_DIRECT) && cmd->ndests != 1)
+		return -EINVAL;
+
+	ret = i3c_geni_runtime_get_mutex_lock(gi3c);
+	if (ret)
+		return ret;
+
+	qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
+	for (i = 0; i < cmd->ndests; i++) {
+		int stall = (i < (cmd->ndests - 1)) ||
+			(cmd->id == I3C_CCC_ENTDAA);
+		struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
+
+		xfer.m_param  = (stall ? STOP_STRETCH : 0);
+		xfer.m_param |= FIELD_PREP(CCC_HDR_CMD_MSK, cmd->id);
+		xfer.m_param |= IBI_NACK_TBL_CTRL;
+		if (cmd->id & I3C_CCC_DIRECT) {
+			xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, cmd->dests[i].addr);
+			if (cmd->rnw) {
+				if (i == 0)
+					xfer.m_cmd = I3C_DIRECT_CCC_READ;
+				else
+					xfer.m_cmd = I3C_PRIVATE_READ;
+			} else {
+				if (i == 0)
+					xfer.m_cmd =
+					   (cmd->dests[i].payload.len > 0) ?
+						I3C_DIRECT_CCC_WRITE :
+						I3C_DIRECT_CCC_ADDR_ONLY;
+				else
+					xfer.m_cmd = I3C_PRIVATE_WRITE;
+			}
+		} else {
+			if (cmd->dests[i].payload.len > 0)
+				xfer.m_cmd = I3C_BCAST_CCC_WRITE;
+			else
+				xfer.m_cmd = I3C_BCAST_CCC_ADDR_ONLY;
+		}
+
+		if (i == 0)
+			xfer.m_param |= USE_7E;
+
+		if (cmd->rnw)
+			ret = i3c_geni_execute_read_command(gi3c, &xfer,
+							    cmd->dests[i].payload.data,
+							    cmd->dests[i].payload.len);
+		else
+			ret = i3c_geni_execute_write_command(gi3c, &xfer,
+							     cmd->dests[i].payload.data,
+							     cmd->dests[i].payload.len);
+		if (ret)
+			break;
+
+		if (cmd->id == I3C_CCC_ENTDAA)
+			geni_i3c_perform_daa(gi3c);
+	}
+
+	i3c_geni_runtime_put_mutex_unlock(gi3c);
+
+	return ret;
+}
+
+static int geni_i3c_master_priv_xfers(struct i3c_dev_desc *dev, struct i3c_priv_xfer *xfers,
+				      int nxfers)
+{
+	struct i3c_master_controller *m = i3c_dev_get_master(dev);
+	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
+	bool use_7e = false;
+	int i, ret;
+
+	ret = i3c_geni_runtime_get_mutex_lock(gi3c);
+	if (ret)
+		return ret;
+
+	qcom_geni_i3c_conf(gi3c, PUSH_PULL_MODE);
+
+	for (i = 0; i < nxfers; i++) {
+		bool stall = (i < (nxfers - 1));
+		struct geni_i3c_xfer_params xfer = { GENI_SE_FIFO };
+
+		xfer.m_param  = (stall ? STOP_STRETCH : 0);
+		xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, dev->info.dyn_addr);
+		xfer.m_param |= (use_7e) ? USE_7E : 0;
+
+		/* use_7e = true only for last transfer */
+		use_7e = (i == nxfers - 1);
+
+		if (xfers[i].rnw) {
+			xfer.m_cmd = I3C_PRIVATE_READ;
+			ret = i3c_geni_execute_read_command(gi3c, &xfer, (u8 *)xfers[i].data.in,
+							    xfers[i].len);
+		} else {
+			xfer.m_cmd = I3C_PRIVATE_WRITE;
+			ret = i3c_geni_execute_write_command(gi3c, &xfer, (u8 *)xfers[i].data.out,
+							     xfers[i].len);
+		}
+
+		if (ret)
+			break;
+	}
+
+	dev_dbg(gi3c->se.dev, "i3c priv: txn ret:%d\n", ret);
+	i3c_geni_runtime_put_mutex_unlock(gi3c);
+
+	return ret;
+}
+
+static int geni_i3c_master_i2c_xfers(struct i2c_dev_desc *dev, struct i2c_msg *msgs, int num)
+{
+	struct i3c_master_controller *m = i2c_dev_get_master(dev);
+	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
+	int i, ret;
+
+	ret = i3c_geni_runtime_get_mutex_lock(gi3c);
+	if (ret)
+		return ret;
+
+	qcom_geni_i3c_conf(gi3c, PUSH_PULL_MODE);
+
+	for (i = 0; i < num; i++) {
+		struct geni_i3c_xfer_params xfer;
+
+		xfer.m_cmd    = (msgs[i].flags & I2C_M_RD) ? I2C_READ : I2C_WRITE;
+		xfer.m_param  = (i < (num - 1)) ? STOP_STRETCH : 0;
+		xfer.m_param |= FIELD_PREP(SLAVE_ADDR_MASK, msgs[i].addr);
+		xfer.mode     = msgs[i].len > 32 ? GENI_SE_DMA : GENI_SE_FIFO;
+		if (msgs[i].flags & I2C_M_RD)
+			ret = i3c_geni_execute_read_command(gi3c, &xfer, msgs[i].buf, msgs[i].len);
+		else
+			ret = i3c_geni_execute_write_command(gi3c, &xfer, msgs[i].buf, msgs[i].len);
+		if (ret)
+			break;
+	}
+
+	dev_dbg(gi3c->se.dev, "i2c: txn ret:%d\n", ret);
+	i3c_geni_runtime_put_mutex_unlock(gi3c);
+
+	return ret;
+}
+
+static int geni_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
+{
+	struct geni_i3c_i2c_dev_data *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	i2c_dev_set_master_data(dev, data);
+
+	return 0;
+}
+
+static void geni_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
+{
+	struct geni_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
+
+	i2c_dev_set_master_data(dev, NULL);
+	kfree(data);
+}
+
+static int geni_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
+{
+	struct geni_i3c_i2c_dev_data *data;
+
+	data = kzalloc(sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	i3c_dev_set_master_data(dev, data);
+
+	return 0;
+}
+
+static void geni_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
+{
+	struct geni_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
+
+	i3c_dev_set_master_data(dev, NULL);
+	kfree(data);
+}
+
+static int geni_i3c_master_do_daa(struct i3c_master_controller *m)
+{
+	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
+	u8 addr;
+	int ret;
+
+	ret = i3c_master_entdaa_locked(m);
+	if (ret && ret != I3C_ERROR_M2)
+		return ret;
+
+	for (addr = 0; addr <= I3C_ADDR_MASK; addr++) {
+		if (is_new_addr_slot_set(gi3c->newaddrslots, addr)) {
+			clear_new_addr_slot(gi3c->newaddrslots, addr);
+			i3c_master_add_i3c_dev_locked(m, addr);
+		}
+	}
+
+	return 0;
+}
+
+static int geni_i3c_master_bus_init(struct i3c_master_controller *m)
+{
+	struct geni_i3c_dev *gi3c = to_geni_i3c_master(m);
+	struct i3c_bus *bus = i3c_master_get_bus(m);
+	struct i3c_device_info info = { };
+	int ret;
+
+	/* Get an address for the master. */
+	ret = i3c_master_get_free_addr(m, 0);
+	if (ret < 0)
+		dev_err(gi3c->se.dev, "%s: error No free addr:%d\n", __func__, ret);
+
+	info.dyn_addr = ret;
+	info.dcr = I3C_DCR_GENERIC_DEVICE;
+	info.bcr = I3C_BCR_I3C_MASTER | I3C_BCR_HDR_CAP;
+	info.pid = 0;
+
+	ret = geni_i3c_clk_map_idx(gi3c);
+	if (ret) {
+		dev_err(gi3c->se.dev,
+			"Invalid clk frequency %d Hz src for %ld Hz bus: %d\n",
+			gi3c->clk_src_freq, bus->scl_rate.i3c, ret);
+		return ret; //This was missed in upstream : TBD
+	}
+
+	ret = i3c_geni_runtime_get_mutex_lock(gi3c);
+	if (ret)
+		return ret;
+
+	qcom_geni_i3c_conf(gi3c, OPEN_DRAIN_MODE);
+
+	ret = i3c_master_set_info(&gi3c->ctrlr, &info);
+	i3c_geni_runtime_put_mutex_unlock(gi3c);
+
+	return ret;
+}
+
+static bool geni_i3c_master_supports_ccc_cmd(struct i3c_master_controller *m,
+					     const struct i3c_ccc_cmd *cmd)
+{
+	switch (cmd->id) {
+	case I3C_CCC_ENEC(true):
+		fallthrough;
+	case I3C_CCC_ENEC(false):
+		fallthrough;
+	case I3C_CCC_DISEC(true):
+		fallthrough;
+	case I3C_CCC_DISEC(false):
+		fallthrough;
+	case I3C_CCC_ENTAS(0, true):
+		fallthrough;
+	case I3C_CCC_ENTAS(0, false):
+		fallthrough;
+	case I3C_CCC_RSTDAA(true):
+		fallthrough;
+	case I3C_CCC_RSTDAA(false):
+		fallthrough;
+	case I3C_CCC_ENTDAA:
+		fallthrough;
+	case I3C_CCC_SETMWL(true):
+		fallthrough;
+	case I3C_CCC_SETMWL(false):
+		fallthrough;
+	case I3C_CCC_SETMRL(true):
+		fallthrough;
+	case I3C_CCC_SETMRL(false):
+		fallthrough;
+	case I3C_CCC_DEFSLVS:
+		fallthrough;
+	case I3C_CCC_SETDASA:
+		fallthrough;
+	case I3C_CCC_SETNEWDA:
+		fallthrough;
+	case I3C_CCC_GETMWL:
+		fallthrough;
+	case I3C_CCC_GETMRL:
+		fallthrough;
+	case I3C_CCC_GETPID:
+		fallthrough;
+	case I3C_CCC_GETBCR:
+		fallthrough;
+	case I3C_CCC_GETDCR:
+		fallthrough;
+	case I3C_CCC_GETSTATUS:
+		fallthrough;
+	case I3C_CCC_GETACCMST:
+		fallthrough;
+	case I3C_CCC_GETMXDS:
+		fallthrough;
+	case I3C_CCC_GETHDRCAP:
+		return true;
+
+	default:
+		return false;
+	}
+}
+
+static const struct i3c_master_controller_ops geni_i3c_master_ops = {
+	.bus_init = geni_i3c_master_bus_init,
+	.bus_cleanup = NULL,
+	.do_daa = geni_i3c_master_do_daa,
+	.attach_i3c_dev = geni_i3c_master_attach_i3c_dev,
+	.reattach_i3c_dev = NULL,
+	.detach_i3c_dev = geni_i3c_master_detach_i3c_dev,
+	.attach_i2c_dev = geni_i3c_master_attach_i2c_dev,
+	.detach_i2c_dev = geni_i3c_master_detach_i2c_dev,
+	.supports_ccc_cmd = geni_i3c_master_supports_ccc_cmd,
+	.send_ccc_cmd = geni_i3c_master_send_ccc_cmd,
+	.priv_xfers = geni_i3c_master_priv_xfers,
+	.i2c_xfers = geni_i3c_master_i2c_xfers,
+	.enable_ibi = NULL,
+	.disable_ibi = NULL,
+	.request_ibi = NULL,
+	.free_ibi = NULL,
+	.recycle_ibi_slot = NULL,
+};
+
+static int i3c_geni_resources_init(struct geni_i3c_dev *gi3c, struct platform_device *pdev)
+{
+	int ret;
+
+	gi3c->se.base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(gi3c->se.base))
+		return PTR_ERR(gi3c->se.base);
+
+	gi3c->se.clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(gi3c->se.clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(gi3c->se.clk),
+							"Unable to get serial engine core clock: %pe\n",
+							gi3c->se.clk);
+	ret = geni_icc_get(&gi3c->se, NULL);
+	if (ret)
+		return ret;
+
+	/* Set the bus quota to a reasonable value for register access */
+	gi3c->se.icc_paths[GENI_TO_CORE].avg_bw = GENI_DEFAULT_BW;
+	gi3c->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
+	ret = geni_icc_set_bw(&gi3c->se);
+	if (ret)
+		return ret;
+
+	/* Default source clock (se-clock-frequency) freq is 100Mhz */
+	gi3c->clk_src_freq = HZ_PER_MHZ * 100;
+
+	return 0;
+}
+
+static int geni_i3c_probe(struct platform_device *pdev)
+{
+	u32 proto, tx_depth, fifo_disable;
+	struct geni_i3c_dev *gi3c;
+	int ret;
+
+	gi3c = devm_kzalloc(&pdev->dev, sizeof(*gi3c), GFP_KERNEL);
+	if (!gi3c)
+		return -ENOMEM;
+
+	gi3c->se.dev = &pdev->dev;
+	gi3c->se.wrapper = dev_get_drvdata(pdev->dev.parent);
+
+	init_completion(&gi3c->done);
+	mutex_init(&gi3c->lock);
+	spin_lock_init(&gi3c->irq_lock);
+	platform_set_drvdata(pdev, gi3c);
+
+	ret = i3c_geni_resources_init(gi3c, pdev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Error Initializing GENI Resources\n");
+
+	gi3c->irq = platform_get_irq(pdev, 0);
+	if (gi3c->irq < 0)
+		return dev_err_probe(&pdev->dev, gi3c->irq, "Error getting IRQ number for I3C\n");
+
+	ret = devm_request_irq(&pdev->dev, gi3c->irq, geni_i3c_irq,
+			       IRQF_NO_AUTOEN, dev_name(&pdev->dev), gi3c);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Error registering core IRQ\n");
+
+	ret = geni_se_resources_on(&gi3c->se);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Error turning resources ON\n");
+
+	proto = geni_se_read_proto(&gi3c->se);
+	if (proto != GENI_SE_I3C) {
+		geni_se_resources_off(&gi3c->se);
+		return dev_err_probe(&pdev->dev, -ENXIO, "Invalid proto %d\n", proto);
+	}
+
+	fifo_disable = readl_relaxed(gi3c->se.base + GENI_IF_DISABLE_RO);
+	if (fifo_disable) {
+		geni_se_resources_off(&gi3c->se);
+		return dev_err_probe(&pdev->dev, -ENXIO, "GPI DMA mode not supported\n");
+	}
+
+	tx_depth = geni_se_get_tx_fifo_depth(&gi3c->se);
+	gi3c->tx_wm = tx_depth - 1;
+	geni_se_init(&gi3c->se, gi3c->tx_wm, tx_depth);
+	geni_se_config_packing(&gi3c->se, BITS_PER_BYTE, PACKING_BYTES_PER_WORD, true, true, true);
+	geni_se_resources_off(&gi3c->se);
+	dev_dbg(&pdev->dev, "i3c fifo/se-dma mode. fifo depth:%d\n", tx_depth);
+
+	pm_runtime_set_suspended(gi3c->se.dev);
+	pm_runtime_set_autosuspend_delay(gi3c->se.dev, I3C_AUTO_SUSPEND_DELAY);
+	pm_runtime_use_autosuspend(gi3c->se.dev);
+	pm_runtime_enable(gi3c->se.dev);
+
+	ret = i3c_master_register(&gi3c->ctrlr, &pdev->dev, &geni_i3c_master_ops, false);
+	if (ret) {
+		pm_runtime_disable(gi3c->se.dev);
+		pm_runtime_set_suspended(gi3c->se.dev);
+		pm_runtime_dont_use_autosuspend(gi3c->se.dev);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void geni_i3c_remove(struct platform_device *pdev)
+{
+	struct geni_i3c_dev *gi3c = platform_get_drvdata(pdev);
+
+	i3c_master_unregister(&gi3c->ctrlr);
+	pm_runtime_disable(gi3c->se.dev);
+	pm_runtime_set_suspended(gi3c->se.dev);
+	pm_runtime_dont_use_autosuspend(gi3c->se.dev);
+}
+
+static int geni_i3c_runtime_suspend(struct device *dev)
+{
+	struct geni_i3c_dev *gi3c = dev_get_drvdata(dev);
+
+	disable_irq(gi3c->irq);
+	geni_se_resources_off(&gi3c->se);
+
+	return 0;
+}
+
+static int geni_i3c_runtime_resume(struct device *dev)
+{
+	int ret;
+	struct geni_i3c_dev *gi3c = dev_get_drvdata(dev);
+
+	ret = geni_se_resources_on(&gi3c->se);
+	if (ret)
+		return ret;
+	enable_irq(gi3c->irq);
+
+	return 0;
+}
+
+static const struct dev_pm_ops geni_i3c_pm_ops = {
+	SET_RUNTIME_PM_OPS(geni_i3c_runtime_suspend, geni_i3c_runtime_resume, NULL)
+};
+
+static const struct of_device_id geni_i3c_dt_match[] = {
+	{ .compatible = "qcom,geni-i3c" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, geni_i3c_dt_match);
+
+static struct platform_driver geni_i3c_master = {
+	.probe  = geni_i3c_probe,
+	.remove = geni_i3c_remove,
+	.driver = {
+		.name = "geni_i3c",
+		.pm = &geni_i3c_pm_ops,
+		.of_match_table = geni_i3c_dt_match,
+	},
+};
+
+module_platform_driver(geni_i3c_master);
+
+MODULE_AUTHOR("Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>");
+MODULE_DESCRIPTION("Qualcomm I3C Controller Driver for GENI based QUP cores");
+MODULE_LICENSE("GPL");
-- 
2.25.1


