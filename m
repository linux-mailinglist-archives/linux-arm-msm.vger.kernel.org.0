Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57D18590866
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Aug 2022 23:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236169AbiHKV4I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 17:56:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236086AbiHKV4E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 17:56:04 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D34B67CBF;
        Thu, 11 Aug 2022 14:56:03 -0700 (PDT)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BLkYSm017425;
        Thu, 11 Aug 2022 21:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=o32zkpwWp2BJgilgcohYN9jdVJI5EyHrbrja1y46rII=;
 b=L89/jB7iMggjOdpPzsFuSbsnir/rN7KauAfCr/r+BkmW5pXvfG3dbVw9kiUiVqlgT+H7
 hjx8s8ubWKc7UquxaT3Y5l4GJ+r2vs9B4qamg3aOTjXXEZTJ5CIj7GklIZKa3tnCmZ7D
 8Dy4lOn7dK5C0abWAeqpXlgLt+Q3RDYtgCb0ZN8nA7ivo3QS+dDhARsCFU+woaIDwgvk
 V72p2knWMQVMwEejJln/JNM1f3KZonLfcue4wfH+NXTfPwqtsoz7R5H7ytKRmoHzKine
 orLQbbxzW+Tkk6lXD6U+o4Uf0DwKeKPQ+y1a1HRHm1NQ8y4VuKGqfIwpuR1mtpn2JL/+ AA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hv95ywwyv-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 21:55:55 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27BLfxwD018010
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 21:41:59 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 11 Aug 2022 14:41:57 -0700
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
Subject: [PATCH v3 06/12] virt: gunyah: Add sysfs nodes
Date:   Thu, 11 Aug 2022 14:41:01 -0700
Message-ID: <20220811214107.1074343-7-quic_eberman@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ICSVZdz8PXV-Pzra8Pl6HqA7xOWDyZcn
X-Proofpoint-GUID: ICSVZdz8PXV-Pzra8Pl6HqA7xOWDyZcn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_13,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208110066
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add /sys/hypervisor support when detecting that Linux is running in a
Gunyah environment. Export the version of Gunyah which is reported via
the hyp_identify hypercall.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 .../ABI/testing/sysfs-hypervisor-gunyah       | 23 +++++
 MAINTAINERS                                   |  1 +
 drivers/virt/Makefile                         |  1 +
 drivers/virt/gunyah/Makefile                  |  2 +
 drivers/virt/gunyah/sysfs.c                   | 87 +++++++++++++++++++
 5 files changed, 114 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-hypervisor-gunyah
 create mode 100644 drivers/virt/gunyah/Makefile
 create mode 100644 drivers/virt/gunyah/sysfs.c

diff --git a/Documentation/ABI/testing/sysfs-hypervisor-gunyah b/Documentation/ABI/testing/sysfs-hypervisor-gunyah
new file mode 100644
index 000000000000..219465783a9e
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-hypervisor-gunyah
@@ -0,0 +1,23 @@
+What:		/sys/hypervisor/type
+Date:		August 2022
+KernelVersion:	6.0
+Contact:	linux-arm-msm@vger.kernel.org
+Description:	If running under Gunyah:
+		Type of hypervisor:
+		"gunyah": Gunyah hypervisor
+
+What:		/sys/hypervisor/gunyah/api
+Date:		August 2022
+KernelVersion:	6.0
+Contact:	linux-arm-msm@vger.kernel.org
+Description:	If running under Gunyah:
+		The Gunyah API version.
+
+What:		/sys/hypervisor/gunyah/variant
+Date:		August 2022
+KernelVersion:	6.0
+Contact:	linux-arm-msm@vger.kernel.org
+Description:	If running under Gunyah:
+		The Gunyah variant (build) version.
+		The open source build of Gunyah will report "81".
+		The Qualcomm build of Gunyah will report "72".
diff --git a/MAINTAINERS b/MAINTAINERS
index f5d5ebb62701..c774bbcdb348 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8739,6 +8739,7 @@ M:	Elliot Berman <quic_eberman@quicinc.com>
 M:	Murali Nalajala <quic_mnalajal@quicinc.com>
 L:	linux-arm-msm@vger.kernel.org
 S:	Supported
+F:	Documentation/ABI/testing/sysfs-hypervisor-gunyah
 F:	Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
 F:	Documentation/virt/gunyah/
 F:	arch/arm64/gunyah/
diff --git a/drivers/virt/Makefile b/drivers/virt/Makefile
index 093674e05c40..5cd759f60122 100644
--- a/drivers/virt/Makefile
+++ b/drivers/virt/Makefile
@@ -9,5 +9,6 @@ obj-y				+= vboxguest/
 
 obj-$(CONFIG_NITRO_ENCLAVES)	+= nitro_enclaves/
 obj-$(CONFIG_ACRN_HSM)		+= acrn/
+obj-$(CONFIG_GUNYAH)		+= gunyah/
 obj-$(CONFIG_EFI_SECRET)	+= coco/efi_secret/
 obj-$(CONFIG_SEV_GUEST)		+= coco/sev-guest/
diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
new file mode 100644
index 000000000000..e15f16c17142
--- /dev/null
+++ b/drivers/virt/gunyah/Makefile
@@ -0,0 +1,2 @@
+gunyah-y += sysfs.o
+obj-$(CONFIG_GUNYAH) += gunyah.o
diff --git a/drivers/virt/gunyah/sysfs.c b/drivers/virt/gunyah/sysfs.c
new file mode 100644
index 000000000000..9de700fdbfcb
--- /dev/null
+++ b/drivers/virt/gunyah/sysfs.c
@@ -0,0 +1,87 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#define pr_fmt(fmt) "gunyah: " fmt
+
+#include <linux/kobject.h>
+#include <linux/module.h>
+#include <linux/printk.h>
+#include <linux/init.h>
+#include <asm-generic/gunyah.h>
+
+static struct gh_hypercall_hyp_identify_resp gunyah_api;
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr, char *buffer)
+{
+	return sysfs_emit(buffer, "gunyah\n");
+}
+static struct kobj_attribute type_attr = __ATTR_RO(type);
+
+static ssize_t api_show(struct kobject *kobj, struct kobj_attribute *attr, char *buffer)
+{
+	return sysfs_emit(buffer, "%d\n", (int)GH_API_INFO_API_VERSION(gunyah_api.api_info));
+}
+static struct kobj_attribute api_attr = __ATTR_RO(api);
+
+static ssize_t variant_show(struct kobject *kobj, struct kobj_attribute *attr, char *buffer)
+{
+	return sysfs_emit(buffer, "%d\n", (int)GH_API_INFO_VARIANT(gunyah_api.api_info));
+}
+static struct kobj_attribute variant_attr = __ATTR_RO(variant);
+
+static struct attribute *gunyah_attrs[] = {
+	&api_attr.attr,
+	&variant_attr.attr,
+	NULL
+};
+
+static const struct attribute_group gunyah_group = {
+	.name = "gunyah",
+	.attrs = gunyah_attrs,
+};
+
+static int __init gunyah_init(void)
+{
+	int ret;
+	u32 uid[4];
+
+	gh_hypercall_get_uid(uid);
+
+	if (!(gh_uid_matches(GUNYAH, uid) || gh_uid_matches(QC_HYP, uid)))
+		return 0;
+
+	gh_hypercall_hyp_identify(&gunyah_api);
+
+	if (GH_API_INFO_API_VERSION(gunyah_api.api_info) != 1) {
+		pr_warn("Unrecognized gunyah version: %llu. Currently supported: 1\n",
+			GH_API_INFO_API_VERSION(gunyah_api.api_info));
+		return 0;
+	}
+
+	pr_notice("Running under Gunyah hypervisor %llx/v%lld\n",
+		  GH_API_INFO_VARIANT(gunyah_api.api_info),
+		  GH_API_INFO_API_VERSION(gunyah_api.api_info));
+
+	ret = sysfs_create_file(hypervisor_kobj, &type_attr.attr);
+	if (ret)
+		return ret;
+
+	ret = sysfs_create_group(hypervisor_kobj, &gunyah_group);
+	if (ret)
+		sysfs_remove_file(hypervisor_kobj, &type_attr.attr);
+
+	return ret;
+}
+module_init(gunyah_init);
+
+static void __exit gunyah_exit(void)
+{
+	sysfs_remove_group(hypervisor_kobj, &gunyah_group);
+	sysfs_remove_file(hypervisor_kobj, &type_attr.attr);
+}
+module_exit(gunyah_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Gunyah Hypervisor Driver");
-- 
2.25.1

