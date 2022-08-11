Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 170E6590896
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Aug 2022 00:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235896AbiHKWGI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Aug 2022 18:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236369AbiHKWGG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Aug 2022 18:06:06 -0400
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DF4248CA;
        Thu, 11 Aug 2022 15:06:03 -0700 (PDT)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27BM1q8L012558;
        Thu, 11 Aug 2022 22:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=CBqQhmy5q8Ih5/yMHtszBKU42svrecCMR3Zi5a9CEqs=;
 b=YdXUFqM6hKJeaDKeZlh0xEaJHPW9tK1QvnTM9nVstx/56Y+CI0JxEAgqlXT/sRguOcl3
 464Inu/PcajygM1jFwfC4Uc6gIFqc7PA9CvneG4jFTohwa0R0XPYP5cstSUOFpZvvj98
 28To6VgFLTinWxDf1NWoxG3yFQvIAUCgpNqRaFllIGmTkvfq7lGTJNyku7gQB5LmTp/U
 eFltoydmCyLQ0Kgf2pa5o8Hhz9JAm4BMmR1mcPhUg9z6thR7k6kCUuYTgCxcTt1v2QgG
 EAxNLCvjw/0OAeJ00O6ckydX4bzMXxpkLXRdGJTGCA7h0M22l3iIko5qf5+n6ETd8vQl uw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3hvh25vjdf-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 22:05:54 +0000
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
        by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27BLfwVb011414
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 11 Aug 2022 21:41:58 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Thu, 11 Aug 2022 14:41:57 -0700
From:   Elliot Berman <quic_eberman@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Marc Zyngier" <maz@kernel.org>
CC:     Elliot Berman <quic_eberman@quicinc.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Srivatsa Vaddagiri" <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        "Mark Rutland" <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v3 05/12] virt: gunyah: Add hypercalls to identify Gunyah
Date:   Thu, 11 Aug 2022 14:41:00 -0700
Message-ID: <20220811214107.1074343-6-quic_eberman@quicinc.com>
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
X-Proofpoint-GUID: px05yBckFTcPvlodJQ7zfZj9dzqxXa6v
X-Proofpoint-ORIG-GUID: px05yBckFTcPvlodJQ7zfZj9dzqxXa6v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-11_13,2022-08-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Add hypercalls to identify when Linux is running a virtual machine under
Gunyah.

There are two calls to help identify Gunyah:

1. gh_hypercall_get_uid() returns a UID when running under a Gunyah
   hypervisor.
2. gh_hypercall_hyp_identify() returns build information and a set of
   feature flags that are supported by Gunyah.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 MAINTAINERS                   |  2 +
 arch/arm64/Kbuild             |  1 +
 arch/arm64/gunyah/Makefile    |  2 +
 arch/arm64/gunyah/hypercall.c | 71 +++++++++++++++++++++++++++++++++++
 drivers/virt/Kconfig          |  2 +
 drivers/virt/gunyah/Kconfig   | 13 +++++++
 include/asm-generic/gunyah.h  | 36 ++++++++++++++++++
 7 files changed, 127 insertions(+)
 create mode 100644 arch/arm64/gunyah/Makefile
 create mode 100644 arch/arm64/gunyah/hypercall.c
 create mode 100644 drivers/virt/gunyah/Kconfig

diff --git a/MAINTAINERS b/MAINTAINERS
index 14030c8ffe8a..f5d5ebb62701 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8741,6 +8741,8 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
 F:	Documentation/virt/gunyah/
+F:	arch/arm64/gunyah/
+F:	drivers/virt/gunyah/
 F:	include/asm-generic/gunyah.h
 
 HABANALABS PCI DRIVER
diff --git a/arch/arm64/Kbuild b/arch/arm64/Kbuild
index 5bfbf7d79c99..fbcde0d5cec8 100644
--- a/arch/arm64/Kbuild
+++ b/arch/arm64/Kbuild
@@ -4,6 +4,7 @@ obj-$(CONFIG_KVM)	+= kvm/
 obj-$(CONFIG_XEN)	+= xen/
 obj-$(subst m,y,$(CONFIG_HYPERV))	+= hyperv/
 obj-$(CONFIG_CRYPTO)	+= crypto/
+obj-$(CONFIG_GUNYAH)	+= gunyah/
 
 # for cleaning
 subdir- += boot
diff --git a/arch/arm64/gunyah/Makefile b/arch/arm64/gunyah/Makefile
new file mode 100644
index 000000000000..f71a9533c266
--- /dev/null
+++ b/arch/arm64/gunyah/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_GUNYAH) += gunyah_hypercall.o
+gunyah_hypercall-y += hypercall.o
diff --git a/arch/arm64/gunyah/hypercall.c b/arch/arm64/gunyah/hypercall.c
new file mode 100644
index 000000000000..5b08c9d80de0
--- /dev/null
+++ b/arch/arm64/gunyah/hypercall.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/module.h>
+#include <asm-generic/gunyah.h>
+
+#define GH_CALL_TYPE_PLATFORM_CALL		0
+#define GH_CALL_TYPE_HYPERCALL			2
+#define GH_CALL_TYPE_SERVICE			3
+#define GH_CALL_TYPE_SHIFT			14
+#define GH_CALL_FUNCTION_NUM_MASK		0x3fff
+
+#define GH_SERVICE(fn)		ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_32, \
+						   ARM_SMCCC_OWNER_VENDOR_HYP, \
+						   (GH_CALL_TYPE_SERVICE << GH_CALL_TYPE_SHIFT) \
+							| ((fn) & GH_CALL_FUNCTION_NUM_MASK))
+
+#define GH_HYPERCALL_CALL_UID			GH_SERVICE(0x3f01)
+
+#define GH_HYPERCALL(fn)	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64, \
+						   ARM_SMCCC_OWNER_VENDOR_HYP, \
+						   (GH_CALL_TYPE_HYPERCALL << GH_CALL_TYPE_SHIFT) \
+							| ((fn) & GH_CALL_FUNCTION_NUM_MASK))
+
+#define GH_HYPERCALL_HYP_IDENTIFY		GH_HYPERCALL(0x0000)
+
+/**
+ * gh_hypercall_get_uid() - Returns a UID when running under a Gunyah hypervisor.
+ * @uid: An array of 4 u32's (u32 uid[4];)
+ *
+ * The UID will be either QC_HYP_UID or GUNYAH_UID defined in include/asm-generic/gunyah.h.
+ * QC_HYP_UID is returned on platforms using Qualcomm's version of Gunyah.
+ * GUNYAH_UID is returned on platforms using open source version of Gunyah.
+ * If the uid is not one of the above two UIDs, then it is assumed that the hypervisor or firmware
+ * is not Gunyah.
+ */
+void gh_hypercall_get_uid(u32 *uid)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GH_HYPERCALL_CALL_UID, &res);
+
+	uid[0] = res.a0;
+	uid[1] = res.a1;
+	uid[2] = res.a2;
+	uid[3] = res.a3;
+}
+EXPORT_SYMBOL_GPL(gh_hypercall_get_uid);
+
+/**
+ * gh_hypercall_hyp_identify() - Returns build information and feature flags supported by Gunyah.
+ * @hyp_identify: filled by the hypercall with the API info and feature flags.
+ */
+void gh_hypercall_hyp_identify(struct gh_hypercall_hyp_identify_resp *hyp_identity)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GH_HYPERCALL_HYP_IDENTIFY, &res);
+
+	hyp_identity->api_info = res.a0;
+	hyp_identity->flags[0] = res.a1;
+	hyp_identity->flags[1] = res.a2;
+	hyp_identity->flags[2] = res.a3;
+}
+EXPORT_SYMBOL_GPL(gh_hypercall_hyp_identify);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Gunyah Hypervisor Hypercalls");
diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index 87ef258cec64..1c346f798ace 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -48,6 +48,8 @@ source "drivers/virt/nitro_enclaves/Kconfig"
 
 source "drivers/virt/acrn/Kconfig"
 
+source "drivers/virt/gunyah/Kconfig"
+
 source "drivers/virt/coco/efi_secret/Kconfig"
 
 source "drivers/virt/coco/sev-guest/Kconfig"
diff --git a/drivers/virt/gunyah/Kconfig b/drivers/virt/gunyah/Kconfig
new file mode 100644
index 000000000000..c1a621aaefc6
--- /dev/null
+++ b/drivers/virt/gunyah/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config GUNYAH
+	tristate "Gunyah Virtualization drivers"
+	depends on ARM64
+	select AUXILIARY_BUS
+	help
+	  The Gunyah drivers are the helper interfaces that runs in a guest VM
+	  such as basic inter-VM IPC and signaling mechanism,s and higher level
+	  services such as memory/device sharing, IRQ sharing, and so on.
+
+	  Say Y/M here to enable the drivers needed to interact in a Gunyah
+	  virtual environment.
diff --git a/include/asm-generic/gunyah.h b/include/asm-generic/gunyah.h
index 64a02dd3b5ad..86eb59e203ef 100644
--- a/include/asm-generic/gunyah.h
+++ b/include/asm-generic/gunyah.h
@@ -71,4 +71,40 @@ static inline int gh_remap_error(int gh_error)
 	}
 }
 
+#define QC_HYP_UID0 0x19bd54bd
+#define QC_HYP_UID1 0x0b37571b
+#define QC_HYP_UID2 0x946f609b
+#define QC_HYP_UID3 0x54539de6
+
+#define GUNYAH_UID0 0x673d5f14
+#define GUNYAH_UID1 0x9265ce36
+#define GUNYAH_UID2 0xa4535fdb
+#define GUNYAH_UID3 0xc1d58fcd
+
+#define gh_uid_matches(prefix, uid)	\
+	((uid)[0] == prefix ## _UID0 && (uid)[1] == prefix ## _UID1 && \
+	 (uid)[2] == prefix ## _UID2 && (uid)[3] == prefix ## _UID3)
+
+#define GH_API_INFO_API_VERSION(x)	(((x) >> 0) & 0x3fff)
+#define GH_API_INFO_BIG_ENDIAN(x)	(((x) >> 14) & 1)
+#define GH_API_INFO_IS_64BIT(x)		(((x) >> 15) & 1)
+#define GH_API_INFO_VARIANT(x)		(((x) >> 56) & 0xff)
+
+#define GH_IDENTIFY_PARTITION_CSPACE(flags)	(((flags)[0] >> 0) & 1)
+#define GH_IDENTIFY_DOORBELL(flags)		(((flags)[0] >> 1) & 1)
+#define GH_IDENTIFY_MSGQUEUE(flags)		(((flags)[0] >> 2) & 1)
+#define GH_IDENTIFY_VIC(flags)			(((flags)[0] >> 3) & 1)
+#define GH_IDENTIFY_VPM(flags)			(((flags)[0] >> 4) & 1)
+#define GH_IDENTIFY_VCPU(flags)			(((flags)[0] >> 5) & 1)
+#define GH_IDENTIFY_MEMEXTENT(flags)		(((flags)[0] >> 6) & 1)
+#define GH_IDENTIFY_TRACE_CTRL(flags)		(((flags)[0] >> 7) & 1)
+
+struct gh_hypercall_hyp_identify_resp {
+	u64 api_info;
+	u64 flags[3];
+};
+
+void gh_hypercall_get_uid(u32 *uid);
+void gh_hypercall_hyp_identify(struct gh_hypercall_hyp_identify_resp *hyp_identity);
+
 #endif
-- 
2.25.1

