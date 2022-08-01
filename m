Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C50C65872D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Aug 2022 23:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235007AbiHAVOB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Aug 2022 17:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234487AbiHAVOA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Aug 2022 17:14:00 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 887573C150;
        Mon,  1 Aug 2022 14:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659388439; x=1690924439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8Zu1w/0V0h7dug7aLTMZQuEKcNOe7CoCHzakPAKWRP0=;
  b=tAw8LVSOdTCRaKgM3QipjQk3tmpjQgAP3SPTxPRaG61M1ci4Z6q3Vbs2
   S5/H57SjIL+Ke/bwBCK2LN5D3TXMZLhnr/eCD1h+oGL+9WGOaTfdH0uua
   +0aT6xA7rtJbsnrbdQ0yKtaoH/ej91lIt3i+HcxsjpwYVymeQPTYW4rFd
   4=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Aug 2022 14:13:58 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 14:13:58 -0700
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 1 Aug 2022 14:13:57 -0700
From:   Elliot Berman <quic_eberman@quicinc.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Elliot Berman <quic_eberman@quicinc.com>,
        Murali Nalajala <quic_mnalajal@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        "Srivatsa Vaddagiri" <quic_svaddagi@quicinc.com>,
        Carl van Schaik <quic_cvanscha@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        "Marc Zyngier" <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 04/11] gunyah: Common types and error codes for Gunyah hypercalls
Date:   Mon, 1 Aug 2022 14:12:33 -0700
Message-ID: <20220801211240.597859-5-quic_eberman@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220801211240.597859-1-quic_eberman@quicinc.com>
References: <20220801211240.597859-1-quic_eberman@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add architecture-independent standard error codes, types, and macros for
Gunyah hypercalls.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 MAINTAINERS            |  1 +
 include/linux/gunyah.h | 75 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 include/linux/gunyah.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 02f97ac90cdf..2e4f1d9ed47b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8744,6 +8744,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
 F:	Documentation/virt/gunyah/
 F:	arch/arm64/include/asm/gunyah.h
+F:	include/linux/gunyah.h
 
 HABANALABS PCI DRIVER
 M:	Oded Gabbay <ogabbay@kernel.org>
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
new file mode 100644
index 000000000000..69931a0f5736
--- /dev/null
+++ b/include/linux/gunyah.h
@@ -0,0 +1,75 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _GUNYAH_H
+#define _GUNYAH_H
+
+#include <linux/types.h>
+#include <linux/errno.h>
+#include <asm/gunyah.h>
+
+typedef u64 gh_capid_t;
+
+/* Common Gunyah macros */
+#define GH_CAPID_INVAL	U64_MAX
+
+#define GH_ERROR_OK			0
+#define GH_ERROR_UNIMPLEMENTED		-1
+#define GH_ERROR_RETRY			-2
+
+#define GH_ERROR_ARG_INVAL		1
+#define GH_ERROR_ARG_SIZE		2
+#define GH_ERROR_ARG_ALIGN		3
+
+#define GH_ERROR_NOMEM			10
+
+#define GH_ERROR_ADDR_OVFL		20
+#define GH_ERROR_ADDR_UNFL		21
+#define GH_ERROR_ADDR_INVAL		22
+
+#define GH_ERROR_DENIED			30
+#define GH_ERROR_BUSY			31
+#define GH_ERROR_IDLE			32
+
+#define GH_ERROR_IRQ_BOUND		40
+#define GH_ERROR_IRQ_UNBOUND		41
+
+#define GH_ERROR_CSPACE_CAP_NULL	50
+#define GH_ERROR_CSPACE_CAP_REVOKED	51
+#define GH_ERROR_CSPACE_WRONG_OBJ_TYPE	52
+#define GH_ERROR_CSPACE_INSUF_RIGHTS	53
+#define GH_ERROR_CSPACE_FULL		54
+
+#define GH_ERROR_MSGQUEUE_EMPTY		60
+#define GH_ERROR_MSGQUEUE_FULL		61
+
+static inline int gh_remap_error(int gh_error)
+{
+	switch (gh_error) {
+	case GH_ERROR_OK:
+		return 0;
+	case GH_ERROR_NOMEM:
+		return -ENOMEM;
+	case GH_ERROR_DENIED:
+	case GH_ERROR_CSPACE_CAP_NULL:
+	case GH_ERROR_CSPACE_CAP_REVOKED:
+	case GH_ERROR_CSPACE_WRONG_OBJ_TYPE:
+	case GH_ERROR_CSPACE_INSUF_RIGHTS:
+	case GH_ERROR_CSPACE_FULL:
+		return -EACCES;
+	case GH_ERROR_BUSY:
+	case GH_ERROR_IDLE:
+		return -EBUSY;
+	case GH_ERROR_IRQ_BOUND:
+	case GH_ERROR_IRQ_UNBOUND:
+	case GH_ERROR_MSGQUEUE_FULL:
+	case GH_ERROR_MSGQUEUE_EMPTY:
+		return -EPERM;
+	default:
+		return -EINVAL;
+	}
+}
+
+#endif
-- 
2.25.1

