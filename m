Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5334A5F5E39
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Oct 2022 03:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbiJFBHH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Oct 2022 21:07:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbiJFBHA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Oct 2022 21:07:00 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3C49647ED;
        Wed,  5 Oct 2022 18:06:58 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2960itVd017702;
        Thu, 6 Oct 2022 01:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=i1frD2iGTglSVBbREfU4Tq7v/C4TbkJZ9IqQRChRHkc=;
 b=PQFg7pim7yrW9A9Y5Jen6L2dutCx8PXwuoJHhP+aKUEt7uW2S1OYJuKO5uALZRJaUzuD
 7kg1DPwskllJFR+uY4jcg4/IdoTRXk59tIbQyDLCAZ/qNLPPnVA/L24nRQ7W+dUk9sFp
 iQOECuPFYIMUw8GVMSOWymKx2aSI6cHCBnSF1fBg7VrHLLoAnb8+vtL1CuIy6F6p5Biu
 58NfO1LUmHX15JAnzoBqdFOL+Y1Kvx8ALiFzuEcTUZT2qb0Yk4vteYC+1ZhOjgXrLtil
 mi8wNfYPm/FmJRIPloxKX8t6slYDIjRo5wYVdhM/6bGaYjFQ0ezzEOknSMcphUiLjSKd Iw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3k0syqts66-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 Oct 2022 01:06:51 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
        by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29616o1S021645
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 6 Oct 2022 01:06:50 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Wed, 5 Oct 2022 18:06:50 -0700
From:   Asutosh Das <quic_asutoshd@quicinc.com>
To:     <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_richardp@quicinc.com>, <linux-scsi@vger.kernel.org>
CC:     Asutosh Das <quic_asutoshd@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <quic_nguyenb@quicinc.com>,
        <quic_xiaosenh@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <mani@kernel.org>, <beanhuo@micron.com>
Subject: [PATCH v2 05/17] ufs: core: mcq: Introduce Multi Circular Queue
Date:   Wed, 5 Oct 2022 18:06:04 -0700
Message-ID: <11ee57da1d1872f8f02aa5d94e254ee9ddf4ef7a.1665017636.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1665017636.git.quic_asutoshd@quicinc.com>
References: <cover.1665017636.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: b6sEauxooxB4vmwwIk9po2RXB-k9JYHm
X-Proofpoint-ORIG-GUID: b6sEauxooxB4vmwwIk9po2RXB-k9JYHm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-05_05,2022-10-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210060005
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce multi-circular queue (MCQ) which has been added
in UFSHC v4.0 standard in addition to the Single Doorbell mode.
The MCQ mode supports multiple submission and completion queues.
Add support to configure the number of queues.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
---
 drivers/ufs/core/Makefile      |   2 +-
 drivers/ufs/core/ufs-mcq.c     | 113 +++++++++++++++++++++++++++++++++++++++++
 drivers/ufs/core/ufshcd-priv.h |   1 +
 drivers/ufs/core/ufshcd.c      |  12 +++++
 include/ufs/ufshcd.h           |   4 ++
 5 files changed, 131 insertions(+), 1 deletion(-)
 create mode 100644 drivers/ufs/core/ufs-mcq.c

diff --git a/drivers/ufs/core/Makefile b/drivers/ufs/core/Makefile
index 62f38c5..4d02e0f 100644
--- a/drivers/ufs/core/Makefile
+++ b/drivers/ufs/core/Makefile
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 
 obj-$(CONFIG_SCSI_UFSHCD)		+= ufshcd-core.o
-ufshcd-core-y				+= ufshcd.o ufs-sysfs.o
+ufshcd-core-y				+= ufshcd.o ufs-sysfs.o ufs-mcq.o
 ufshcd-core-$(CONFIG_DEBUG_FS)		+= ufs-debugfs.o
 ufshcd-core-$(CONFIG_SCSI_UFS_BSG)	+= ufs_bsg.o
 ufshcd-core-$(CONFIG_SCSI_UFS_CRYPTO)	+= ufshcd-crypto.o
diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
new file mode 100644
index 0000000..659398d
--- /dev/null
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center. All rights reserved.
+ *
+ * Authors:
+ *	Asutosh Das <quic_asutoshd@quicinc.com>
+ *	Can Guo <quic_cang@quicinc.com>
+ */
+
+#include <asm/unaligned.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include "ufshcd-priv.h"
+
+#define UFS_MCQ_MIN_RW_QUEUES 2
+#define UFS_MCQ_MIN_READ_QUEUES 0
+#define UFS_MCQ_NUM_DEV_CMD_QUEUES 1
+#define UFS_MCQ_MIN_POLL_QUEUES 0
+
+
+static int rw_queue_count_set(const char *val, const struct kernel_param *kp)
+{
+	return param_set_uint_minmax(val, kp, UFS_MCQ_MIN_RW_QUEUES,
+				     num_possible_cpus());
+}
+
+static const struct kernel_param_ops rw_queue_count_ops = {
+	.set = rw_queue_count_set,
+	.get = param_get_uint,
+};
+
+static unsigned int rw_queues;
+module_param_cb(rw_queues, &rw_queue_count_ops, &rw_queues, 0644);
+MODULE_PARM_DESC(rw_queues,
+		 "Number of interrupt driven I/O queues used for rw. Default value is nr_cpus");
+
+static int read_queue_count_set(const char *val, const struct kernel_param *kp)
+{
+	return param_set_uint_minmax(val, kp, UFS_MCQ_MIN_READ_QUEUES,
+				     num_possible_cpus());
+}
+
+static const struct kernel_param_ops read_queue_count_ops = {
+	.set = read_queue_count_set,
+	.get = param_get_uint,
+};
+
+static unsigned int read_queues;
+module_param_cb(read_queues, &read_queue_count_ops, &read_queues, 0644);
+MODULE_PARM_DESC(read_queues,
+		 "Number of interrupt driven read queues used for read. Default value is 0");
+
+static int poll_queue_count_set(const char *val, const struct kernel_param *kp)
+{
+	return param_set_uint_minmax(val, kp, UFS_MCQ_MIN_POLL_QUEUES,
+				     num_possible_cpus());
+}
+
+static const struct kernel_param_ops poll_queue_count_ops = {
+	.set = poll_queue_count_set,
+	.get = param_get_uint,
+};
+
+static unsigned int poll_queues = 1;
+module_param_cb(poll_queues, &poll_queue_count_ops, &poll_queues, 0644);
+MODULE_PARM_DESC(poll_queues,
+		 "Number of poll queues used for r/w. Default value is 1");
+
+static int ufshcd_mcq_config_nr_queues(struct ufs_hba *hba)
+{
+	int i;
+	u32 hba_maxq, rem, tot_queues;
+	struct Scsi_Host *host = hba->host;
+
+	hba_maxq = FIELD_GET(GENMASK(7, 0), hba->mcq_capabilities);
+
+	if (!rw_queues)
+		rw_queues = num_possible_cpus();
+
+	tot_queues = UFS_MCQ_NUM_DEV_CMD_QUEUES + read_queues + poll_queues +
+			rw_queues;
+
+	if (hba_maxq < tot_queues) {
+		dev_err(hba->dev, "Total queues (%d) exceeds HC capacity (%d)\n",
+			tot_queues, hba_maxq);
+		return -EOPNOTSUPP;
+	}
+
+	rem = hba_maxq - UFS_MCQ_NUM_DEV_CMD_QUEUES;
+	hba->nr_queues[HCTX_TYPE_DEFAULT] = min3(rem, rw_queues,
+						 num_possible_cpus());
+	rem -= hba->nr_queues[HCTX_TYPE_DEFAULT];
+	hba->nr_queues[HCTX_TYPE_POLL] = min(rem, poll_queues);
+	rem -= hba->nr_queues[HCTX_TYPE_POLL];
+	hba->nr_queues[HCTX_TYPE_READ] = min(rem, read_queues);
+
+	for (i = 0; i < HCTX_MAX_TYPES; i++)
+		host->nr_hw_queues += hba->nr_queues[i];
+
+	hba->nr_hw_queues = host->nr_hw_queues + UFS_MCQ_NUM_DEV_CMD_QUEUES;
+	return 0;
+}
+
+int ufshcd_mcq_init(struct ufs_hba *hba)
+{
+	int ret;
+
+	ret = ufshcd_mcq_config_nr_queues(hba);
+
+	return ret;
+}
+
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 8f67db2..cf6bdd8e 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -50,6 +50,7 @@ int ufshcd_query_attr(struct ufs_hba *hba, enum query_opcode opcode,
 int ufshcd_query_flag(struct ufs_hba *hba, enum query_opcode opcode,
 	enum flag_idn idn, u8 index, bool *flag_res);
 void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit);
+int ufshcd_mcq_init(struct ufs_hba *hba);
 
 #define SD_ASCII_STD true
 #define SD_RAW false
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index fe4b683..ebc2c91 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8175,6 +8175,15 @@ static int ufshcd_add_lus(struct ufs_hba *hba)
 	return ret;
 }
 
+static int ufshcd_config_mcq(struct ufs_hba *hba)
+{
+	int ret;
+
+	ret = ufshcd_mcq_init(hba);
+
+	return ret;
+}
+
 /**
  * ufshcd_probe_hba - probe hba to detect device and initialize it
  * @hba: per-adapter instance
@@ -8224,6 +8233,9 @@ static int ufshcd_probe_hba(struct ufs_hba *hba, bool init_dev_params)
 			goto out;
 
 		if (is_mcq_supported(hba)) {
+			ret = ufshcd_config_mcq(hba);
+			if (ret)
+				goto out;
 			ret = scsi_add_host(host, hba->dev);
 			if (ret) {
 				dev_err(hba->dev, "scsi_add_host failed\n");
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index da7ec0c..298e103 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -827,6 +827,8 @@ struct ufs_hba_monitor {
  *	ufshcd_resume_complete()
  * @ext_iid_sup: is EXT_IID is supported by UFSHC
  * @mcq_sup: is mcq supported by UFSHC
+ * @nr_hw_queues: number of hardware queues configured
+ * @nr_queues: number of Queues of different queue types
  */
 struct ufs_hba {
 	void __iomem *mmio_base;
@@ -977,6 +979,8 @@ struct ufs_hba {
 	bool complete_put;
 	bool ext_iid_sup;
 	bool mcq_sup;
+	unsigned int nr_hw_queues;
+	unsigned int nr_queues[HCTX_MAX_TYPES];
 };
 
 static inline bool is_mcq_supported(struct ufs_hba *hba)
-- 
2.7.4

