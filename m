Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1085872CF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Aug 2022 23:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234951AbiHAVOA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Aug 2022 17:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232288AbiHAVOA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Aug 2022 17:14:00 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10CF19008;
        Mon,  1 Aug 2022 14:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1659388438; x=1690924438;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2wwXDsSDy8neRX8+Ed9SYEvVYy0LIc3XuXU/Jlw0R6s=;
  b=tgr4LxBa118J6DWD8goSlOwTRpVS7oVuyDqsM94xPFcWNdfG5qD0FqAY
   oHI/vtPTIx3mouoO/QsmQFEp335+G7fVNgoL/CgnsuSwmp/0pIBhUce83
   eVD9w23amelnaMUNIxre5O/mm8H7zNPG2IugX/Gy6h5s09XgZgTGOepBl
   0=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Aug 2022 14:13:57 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 14:13:57 -0700
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 1 Aug 2022 14:13:56 -0700
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
        <linux-arm-kernel@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        <devicetree@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 03/11] arm64: gunyah: Add Gunyah hypercalls ABI
Date:   Mon, 1 Aug 2022 14:12:32 -0700
Message-ID: <20220801211240.597859-4-quic_eberman@quicinc.com>
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

Add initial support to perform Gunyah hypercalls. The arm64 ABI for
Gunyah hypercalls generally follows the SMC Calling Convention.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
---
 MAINTAINERS                     |   1 +
 arch/arm64/include/asm/gunyah.h | 134 ++++++++++++++++++++++++++++++++
 2 files changed, 135 insertions(+)
 create mode 100644 arch/arm64/include/asm/gunyah.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cd12ea6c11c..02f97ac90cdf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8743,6 +8743,7 @@ L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/firmware/gunyah-hypervisor.yaml
 F:	Documentation/virt/gunyah/
+F:	arch/arm64/include/asm/gunyah.h
 
 HABANALABS PCI DRIVER
 M:	Oded Gabbay <ogabbay@kernel.org>
diff --git a/arch/arm64/include/asm/gunyah.h b/arch/arm64/include/asm/gunyah.h
new file mode 100644
index 000000000000..4820e9389f40
--- /dev/null
+++ b/arch/arm64/include/asm/gunyah.h
@@ -0,0 +1,134 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef __ASM_GUNYAH_H
+#define __ASM_GUNYAH_H
+
+#include <linux/arm-smccc.h>
+#include <linux/types.h>
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
+#define GH_HYPERCALL(fn)	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64, \
+						   ARM_SMCCC_OWNER_VENDOR_HYP, \
+						   (GH_CALL_TYPE_HYPERCALL << GH_CALL_TYPE_SHIFT) \
+							| ((fn) & GH_CALL_FUNCTION_NUM_MASK))
+
+#define ___gh_count_args(_0, _1, _2, _3, _4, _5, _6, _7, _8, x, ...) x
+
+#define __gh_count_args(...)						\
+	___gh_count_args(_, ## __VA_ARGS__, 8, 7, 6, 5, 4, 3, 2, 1, 0)
+
+#define __gh_skip_0(...)		__VA_ARGS__
+#define __gh_skip_1(a, ...)	__VA_ARGS__
+#define __gh_skip_2(a, b, ...)	__VA_ARGS__
+#define __gh_skip_3(a, b, c, ...)	__VA_ARGS__
+#define __gh_skip_4(a, b, c, d, ...)	__VA_ARGS__
+#define __gh_skip_5(a, b, c, d, e, ...)	__VA_ARGS__
+#define __gh_skip_6(a, b, c, d, e, f, ...)	__VA_ARGS__
+#define __gh_skip_7(a, b, c, d, e, f, g, ...)	__VA_ARGS__
+#define __gh_skip_8(a, b, c, d, e, f, g, h, ...)	__VA_ARGS__
+#define __gh_to_res(nargs, ...)		__gh_skip_ ## nargs (__VA_ARGS__)
+
+#define __gh_declare_arg_0(...)
+
+#define __gh_declare_arg_1(arg1, ...)						\
+	.a1 = (arg1)
+
+#define __gh_declare_arg_2(arg1, arg2, ...)					\
+	__gh_declare_arg_1(arg1),						\
+	.a2 = (arg2)
+
+#define __gh_declare_arg_3(arg1, arg2, arg3, ...)				\
+	__gh_declare_arg_2(arg1, arg2),						\
+	.a3 = (arg3)
+
+#define __gh_declare_arg_4(arg1, arg2, arg3, arg4, ...)				\
+	__gh_declare_arg_3(arg1, arg2, arg3),					\
+	.a4 = (arg4)
+
+#define __gh_declare_arg_5(arg1, arg2, arg3, arg4, arg5, ...)			\
+	__gh_declare_arg_4(arg1, arg2, arg3, arg4),				\
+	.a5 = (arg5)
+
+#define __gh_declare_arg_6(arg1, arg2, arg3, arg4, arg5, arg6, ...)		\
+	__gh_declare_arg_5(arg1, arg2, arg3, arg4, arg5),			\
+	.a6 = (arg6)
+
+#define __gh_declare_arg_7(arg1, arg2, arg3, arg4, arg5, arg6, arg7, ...)	\
+	__gh_declare_arg_6(arg1, arg2, arg3, arg4, arg5, arg6),			\
+	.a7 = (arg7)
+
+#define __gh_declare_arg_8(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, ...)	\
+	__gh_declare_arg_7(arg1, arg2, arg3, arg4, arg5, arg6, arg7),		\
+	.a8 = (arg8)
+
+#define ___gh_declare_args(nargs)	__gh_declare_arg_ ## nargs
+#define __gh_declare_args(nargs)	___gh_declare_args(nargs)
+#define _gh_declare_args(nargs, ...) __gh_declare_args(nargs)(__VA_ARGS__)
+
+#define __gh_assign_res_0(...)
+
+#define __gh_assign_res_1(r1)					\
+	r1 = __res.a0
+
+#define __gh_assign_res_2(r1, r2)				\
+	__gh_assign_res_1(r1);					\
+	r2 = __res.a1
+
+#define __gh_assign_res_3(r1, r2, r3)				\
+	__gh_assign_res_2(r1, r2);				\
+	r3 = __res.a2
+
+#define __gh_assign_res_4(r1, r2, r3, r4)			\
+	__gh_assign_res_3(r1, r2, r3);				\
+	r4 = __res.a3
+
+#define __gh_assign_res_5(r1, r2, r3, r4, r5)			\
+	__gh_assign_res_4(r1, r2, r3, r4);			\
+	r5 = __res.a4
+
+#define __gh_assign_res_6(r1, r2, r3, r4, r5, r6)		\
+	__gh_assign_res_5(r1, r2, r3, r4, r5);			\
+	r6 = __res.a5
+
+#define __gh_assign_res_7(r1, r2, r3, r4, r5, r6, r7)		\
+	__gh_assign_res_6(r1, r2, r3, r4, r5, r6);		\
+	r7 = __res.a6
+
+#define __gh_assign_res_8(r1, r2, r3, r4, r5, r6, r7, r8)	\
+	__gh_assign_res_7(r1, r2, r3, r4, r5, r6, r7);		\
+	r8 = __res.a7
+
+#define ___gh_assign_res(nargs)	__gh_assign_res_ ## nargs
+#define __gh_assign_res(nargs)	___gh_assign_res(nargs)
+#define _gh_assign_res(...) __gh_assign_res(__gh_count_args(__VA_ARGS__))(__VA_ARGS__)
+
+/**
+ * arch_gh_hypercall() - Performs an AArch64-specific call into hypervisor using Gunyah ABI
+ * @hcall_num: Hypercall function ID to invoke
+ * @nargs: Number of input arguments
+ * @...: First nargs are the input arguments. Remaining arguments are output variables.
+ */
+#define arch_gh_hypercall(hcall_num, nargs, ...)				\
+	do {									\
+		struct arm_smccc_1_2_regs __res;					\
+		struct arm_smccc_1_2_regs __args = {				\
+			.a0 = hcall_num,					\
+			_gh_declare_args(nargs, __VA_ARGS__)			\
+		};								\
+		arm_smccc_1_2_hvc(&__args, &__res);					\
+		_gh_assign_res(__gh_to_res(nargs, __VA_ARGS__));		\
+	} while (0)
+
+#endif
-- 
2.25.1

