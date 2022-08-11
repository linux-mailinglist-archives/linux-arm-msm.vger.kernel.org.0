Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCFEC590892
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Aug 2022 00:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236374AbiHKWGJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 18:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236384AbiHKWGH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 18:06:07 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9BD326110;
        Thu, 11 Aug 2022 15:06:04 -0700 (PDT)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BM0p6n003581;
        Thu, 11 Aug 2022 22:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=k6Y1DW7nSaYoDaBPAG/5W8MlSEp7Am9DjSvPqKO/Qbo=;
 b=pEVomlPG8L+RjFK7nrTCFMTa5xelEtAP16zqOppm7HiwSURc1v6XUCf9vIGgYDktLVDp
 hxwAlAmKv10bdU5mix+mYfCwyPB6ZNbRsAHPI+8bTcL5WDP9UMf2FGzEhez962UZ4CqN
 TCxEb0El/7I4N8CPZXfrPeNknDNbuwg83gP4l/Q5Girwq6gWTdKKND2vMY8iOYb3mG8b
 mZtgX6PBHjFvV/jqKlJBJfX8L+mUa+BMxd2acl7tKXCGjmi5jBcekViBVeAds0l0vaiL
 4rsNyMAzwhhgQ/wdyAStFL5UZxq/bjGpLscHdvloNPgX+6/msxxnGWI2/cdQPj+vCzp8 LQ== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hvsaak2s7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 22:05:54 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27BLg1w1011445
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 21:42:01 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 11 Aug 2022 14:42:00 -0700
From:   Elliot Berman <quic_eberman@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Elliot Berman <quic_eberman@quicinc.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Srivatsa Vaddagiri" <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Marc Zyngier" <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v3 10/12] gunyah: rsc_mgr: Add RPC for console services
Date:   Thu, 11 Aug 2022 14:41:05 -0700
Message-ID: <20220811214107.1074343-11-quic_eberman@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811214107.1074343-1-quic_eberman@quicinc.com>
References: <20220811214107.1074343-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oi2f4XGWHrbIDN6MtcS-omvml8XHmobN
X-Proofpoint-GUID: oi2f4XGWHrbIDN6MtcS-omvml8XHmobN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_13,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=807 adultscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110066
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Gunyah resource manager defines a simple API for virtual machine log
sharing with the console service. A VM's own log can be opened by using
GH_VMID_SELF. Another VM's log can be accessed via its VMID. Once
opened, characters can be written to the log with a write command.
Characters are received with resource manager notifications (using ID
GH_RM_NOTIF_VM_CONSOLE_CHARS).

These high level rpc calls are kept in
drivers/virt/gunyah/rsc_mgr_rpc.c. Future RPC calls, e.g. to launch a VM
will also be maintained in this file.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/virt/gunyah/Makefile      |   2 +-
 drivers/virt/gunyah/rsc_mgr.h     |  22 +++++
 drivers/virt/gunyah/rsc_mgr_rpc.c | 151 ++++++++++++++++++++++++++++++
 include/linux/gunyah_rsc_mgr.h    |  16 ++++
 4 files changed, 190 insertions(+), 1 deletion(-)
 create mode 100644 drivers/virt/gunyah/rsc_mgr_rpc.c

diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
index c97ad382f640..7eae745cea08 100644
--- a/drivers/virt/gunyah/Makefile
+++ b/drivers/virt/gunyah/Makefile
@@ -1,3 +1,3 @@
 gunyah-y += sysfs.o msgq.o
-gunyah_rsc_mgr-y += rsc_mgr.o
+gunyah_rsc_mgr-y += rsc_mgr.o rsc_mgr_rpc.o
 obj-$(CONFIG_GUNYAH) += gunyah.o gunyah_rsc_mgr.o
diff --git a/drivers/virt/gunyah/rsc_mgr.h b/drivers/virt/gunyah/rsc_mgr.h
index e4f2499267bf..deb884979209 100644
--- a/drivers/virt/gunyah/rsc_mgr.h
+++ b/drivers/virt/gunyah/rsc_mgr.h
@@ -28,6 +28,28 @@
 #define GH_RM_ERROR_IRQ_INUSE		0x10
 #define GH_RM_ERROR_IRQ_RELEASED	0x11
 
+/* Message IDs: VM Management */
+#define GH_RM_RPC_VM_GET_VMID			0x56000024
+
+/* Message IDs: VM Services */
+#define GH_RM_RPC_VM_CONSOLE_OPEN_ID		0x56000081
+#define GH_RM_RPC_VM_CONSOLE_CLOSE_ID		0x56000082
+#define GH_RM_RPC_VM_CONSOLE_WRITE_ID		0x56000083
+#define GH_RM_RPC_VM_CONSOLE_FLUSH_ID		0x56000084
+
+/* Call: CONSOLE_OPEN, CONSOLE_CLOSE, CONSOLE_FLUSH */
+struct gh_vm_console_common_req {
+	u16 vmid;
+	u16 reserved0;
+} __packed;
+
+/* Call: CONSOLE_WRITE */
+struct gh_vm_console_write_req {
+	u16 vmid;
+	u16 num_bytes;
+	u8 data[0];
+} __packed;
+
 int gh_rm_call(u32 message_id, void *req_buff, size_t req_buff_size,
 		void **resp_buf, size_t *resp_buff_size);
 
diff --git a/drivers/virt/gunyah/rsc_mgr_rpc.c b/drivers/virt/gunyah/rsc_mgr_rpc.c
new file mode 100644
index 000000000000..042a9d95c70a
--- /dev/null
+++ b/drivers/virt/gunyah/rsc_mgr_rpc.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) "gh_rsc_mgr: " fmt
+
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/printk.h>
+#include <linux/gunyah_rsc_mgr.h>
+
+#include "rsc_mgr.h"
+
+/**
+ * gh_rm_get_vmid: Retrieve VMID of this virtual machine
+ * @vmid: Filled with the VMID of this VM
+ */
+int gh_rm_get_vmid(u16 *vmid)
+{
+	void *resp;
+	size_t resp_size;
+	int ret;
+	int payload = 0;
+
+	ret = gh_rm_call(GH_RM_RPC_VM_GET_VMID, &payload, sizeof(payload), &resp, &resp_size);
+	if (ret)
+		return ret;
+
+	if (resp_size != sizeof(*vmid))
+		return -EIO;
+	*vmid = *(u16 *)resp;
+	kfree(resp);
+
+	return ret;
+}
+
+/**
+ * gh_rm_console_open: Open a console with a VM
+ * @vmid: VMID of the other vmid whose console to open. If VMID is GH_VMID_SELF, the
+ *        console associated with this VM is opened.
+ */
+int gh_rm_console_open(u16 vmid)
+{
+	void *resp;
+	struct gh_vm_console_common_req req_payload = {0};
+	size_t resp_size;
+	int ret;
+
+	req_payload.vmid = vmid;
+
+	ret = gh_rm_call(GH_RM_RPC_VM_CONSOLE_OPEN_ID,
+			  &req_payload, sizeof(req_payload),
+			  &resp, &resp_size);
+	kfree(resp);
+
+	if (!ret && resp_size)
+		pr_warn("Received unexpected payload for CONSOLE_OPEN: %lu\n", resp_size);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gh_rm_console_open);
+
+/**
+ * gh_rm_console_close: Close a console with a VM
+ * @vmid: The vmid of the vm whose console to close.
+ */
+int gh_rm_console_close(u16 vmid)
+{
+	void *resp;
+	struct gh_vm_console_common_req req_payload = {0};
+	size_t resp_size;
+	int ret;
+
+	req_payload.vmid = vmid;
+
+	ret = gh_rm_call(GH_RM_RPC_VM_CONSOLE_CLOSE_ID,
+			  &req_payload, sizeof(req_payload),
+			  &resp, &resp_size);
+	kfree(resp);
+
+	if (!ret && resp_size)
+		pr_warn("Received unexpected payload for CONSOLE_CLOSE: %lu\n", resp_size);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gh_rm_console_close);
+
+/**
+ * gh_rm_console_write: Write to a VM's console
+ * @vmid: The vmid of the vm whose console to write to.
+ * @buf: Buffer to write to the VM's console
+ * @size: Size of the buffer
+ */
+int gh_rm_console_write(u16 vmid, const char *buf, size_t size)
+{
+	void *resp;
+	struct gh_vm_console_write_req *req_payload;
+	size_t resp_size;
+	int ret = 0;
+	size_t req_payload_size = sizeof(*req_payload) + size;
+
+	if (size < 1 || size > (U32_MAX - sizeof(*req_payload)))
+		return -EINVAL;
+
+	req_payload = kzalloc(req_payload_size, GFP_KERNEL);
+
+	if (!req_payload)
+		return -ENOMEM;
+
+	req_payload->vmid = vmid;
+	req_payload->num_bytes = size;
+	memcpy(req_payload->data, buf, size);
+
+	ret = gh_rm_call(GH_RM_RPC_VM_CONSOLE_WRITE_ID,
+		   req_payload, req_payload_size,
+		   &resp, &resp_size);
+	kfree(req_payload);
+	kfree(resp);
+
+	if (!ret && resp_size)
+		pr_warn("Received unexpected payload for CONSOLE_WRITE: %lu\n", resp_size);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gh_rm_console_write);
+
+/**
+ * gh_rm_console_flush: Flush a console with a VM
+ * @vmid: The vmid of the vm whose console to flush
+ */
+int gh_rm_console_flush(u16 vmid)
+{
+	void *resp;
+	struct gh_vm_console_common_req req_payload = {0};
+	size_t resp_size;
+	int ret;
+
+	req_payload.vmid = vmid;
+
+	ret = gh_rm_call(GH_RM_RPC_VM_CONSOLE_FLUSH_ID,
+			  &req_payload, sizeof(req_payload),
+			  &resp, &resp_size);
+	kfree(resp);
+
+	if (!ret && resp_size)
+		pr_warn("Received unexpected payload for CONSOLE_FLUSH: %lu\n", resp_size);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gh_rm_console_flush);
diff --git a/include/linux/gunyah_rsc_mgr.h b/include/linux/gunyah_rsc_mgr.h
index b3b37225b7fb..f831ca921c26 100644
--- a/include/linux/gunyah_rsc_mgr.h
+++ b/include/linux/gunyah_rsc_mgr.h
@@ -23,4 +23,20 @@ struct gh_rm_notification {
 int gh_rm_register_notifier(struct notifier_block *nb);
 int gh_rm_unregister_notifier(struct notifier_block *nb);
 
+/* Notification type Message IDs */
+#define GH_RM_NOTIF_VM_CONSOLE_CHARS	0x56100080
+
+struct gh_rm_notif_vm_console_chars {
+	u16 vmid;
+	u16 num_bytes;
+	u8 bytes[0];
+} __packed;
+
+/* RPC Calls */
+int gh_rm_get_vmid(u16 *vmid);
+int gh_rm_console_open(u16 vmid);
+int gh_rm_console_close(u16 vmid);
+int gh_rm_console_write(u16 vmid, const char *buf, size_t size);
+int gh_rm_console_flush(u16 vmid);
+
 #endif
-- 
2.25.1

