Return-Path: <linux-arm-msm+bounces-55416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9B7A9B078
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 082221B84AF6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0DE9288CA9;
	Thu, 24 Apr 2025 14:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qfStsnQM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A050128466D
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504044; cv=none; b=kzwEam3pVTGyXF9Y8Kl0FAGmnlZZtXjioHHNFlSnNR6m9Ifik/VMbnPApCWixQIET4WIeUn3ItI3MBQ+YX6XsT95CeAJfW3Oa/p35eCsT+m2F6XETsFYyC0DXJCkEMXy9QW1GysEP0/xeUVc5ImGgl5CDQADAvZexVrhEsKn99A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504044; c=relaxed/simple;
	bh=sW44/p8fc9q82gGRUYbPMkfXFBjgbu9rU1+e99sjorc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ER/Ij5/sTnDMaAnAELyIjeUke/3VyFmUlNN0lAOiC0TQZyFCsPD7xl3NC6uu37eaOILqjAzFj7aggCieducdcn7SENEYxPtUt/DuYtPOWj9FOIVQblDVKXYkRYhQxASsHQ6vGiByWAUo56xkeIaLNOjcQVCazXgCavclYNzvvjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qfStsnQM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso12170435e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504040; x=1746108840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnFOyyVscJj2zQjUVyQj//yqO74ALl7OUDNbU7iCFM0=;
        b=qfStsnQMn2V6Gkyza+2neBnGTryb06KyiNTsIkI4+wXFmPDOSW7W7vx20DwQvLwbKL
         MAGsoZPCYp4+XWPKiNC2sYM+V3wbJ/ruiWAHn5ImY61QgFJT8D0aLHhaFTdeem+3xlIj
         /Ztr/j4cAQOj68cMsA1UXOX+PUIr0MCQqNDJ5Pi14nB/ltSND35KsRchGPiZG7moxYRf
         7KOKiXjB3sO7E4AKmSMyszIq9mZOmv7mdM4mLAIk0dBcXf/1k8WUPzvTqsz++p73EL5k
         OUnzS1reM7AjX55Rd478N8i2ttIRFmcjyZR6d6P2Sft4zq4h+DapfkoqkgMH2B2nnCtt
         voYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504040; x=1746108840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hnFOyyVscJj2zQjUVyQj//yqO74ALl7OUDNbU7iCFM0=;
        b=X6/RXWUB4BbEObshK1AaP0sO88gODDz1X2lIdUsw3qFULg8+qi0uG6Jnz2Z3m1O1Tb
         7R9F3R1SA76B4AwcT5LIbbkdrOYirnUaPPuvY45I+y8uYL5/hHMWP/XOw3Y2jo1lROT+
         K3D0gKyerqZBKiZWHrAoLjPIOj1hGWI/saAcAcyIp8ad5OwzDyjm2YqZUpftO2HgjoyS
         1Y9O6tluEcVaZueEhUSq1t7Rro5zUXlsjc2JJsN5rG3VgyHMOJ9lYc6Lr7GzkfxucagS
         lqd8H76lq90JN/r2HI5PpE7H3DFIL/1Vb3gtS2qetTW6XeUnR7A1kD3NrmPyYo5D2bCW
         mbCw==
X-Forwarded-Encrypted: i=1; AJvYcCWesoJg3Vcwn8E+LzsA0JtKAgBxu0r2zFKKS/nJkF5wGe90YlDOB8ae5KlDQbmnWpcfD5UFnD5OXxjaVja4@vger.kernel.org
X-Gm-Message-State: AOJu0Yx18JXGR61wWGPEeyJJPAXve/Kpk4XHSAQNZMEYHEWsWCjp9u5f
	7fCqGxpvzzhyxnhFhm+S9RDZg7AbgFfsgNfWjai7ZclICfCdXtkBQr0T4LSa+Cc=
X-Gm-Gg: ASbGncupatThXOY0vN4vFoy9oDL3CTJnz9InZ+4XyC+vdOEiEmWCP2opNQKJ16F9Z6s
	+1Vevnsk+5Z/m+5P94acV5MHwotYiKBCcOUImphfXEVCUL0IfA3/KksXY8mH+8qRsEEwYngk47K
	drikQO5RDIbFwiobaMmt7DCK/QsFXQdtxP6HPbnrntnIs4GDWMUqM8O+SuaEdHHh9j8+7YZBZCs
	HqJniatv2JgXOjB4PaeOBW3e+KYMQij2wexHT163LwZF+aJjwEKd90V3gwG3kXBjGFqD0PwuFlI
	IE/NKBYRyXgjHljFILjBeNBIImh9sONGdF5bJRTgJ/bJyMVE8ZNmpIVYL51lWfACW/d/M+o3NuH
	E7Q0Mz5ptrw9O82g1
X-Google-Smtp-Source: AGHT+IFe20I1qXpRONr6or0FTVbxh/3TZQo8fNSyYvn8TOfhWs9pYDOoLZ+ij1siBFtRALlOMdvrUQ==
X-Received: by 2002:a5d:648c:0:b0:39c:2669:d7f4 with SMTP id ffacd0b85a97d-3a06cfa3406mr2184828f8f.43.1745504039514;
        Thu, 24 Apr 2025 07:13:59 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:59 -0700 (PDT)
From: Karim Manaouil <karim.manaouil@linaro.org>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: Karim Manaouil <karim.manaouil@linaro.org>,
	Alexander Graf <graf@amazon.com>,
	Alex Elder <elder@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>,
	Quentin Perret <qperret@google.com>,
	Rob Herring <robh@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
	Will Deacon <will@kernel.org>,
	Haripranesh S <haripran@qti.qualcomm.com>,
	Carl van Schaik <cvanscha@qti.qualcomm.com>,
	Murali Nalajala <mnalajal@quicinc.com>,
	Sreenivasulu Chalamcharla <sreeniva@qti.qualcomm.com>,
	Trilok Soni <tsoni@quicinc.com>,
	Stefan Schmidt <stefan.schmidt@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Alex Elder <elder@linaro.org>
Subject: [RFC PATCH 11/34] gunyah: Add hypercalls to identify Gunyah
Date: Thu, 24 Apr 2025 15:13:18 +0100
Message-Id: <20250424141341.841734-12-karim.manaouil@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424141341.841734-1-karim.manaouil@linaro.org>
References: <20250424141341.841734-1-karim.manaouil@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Elliot Berman <quic_eberman@quicinc.com>

Add hypercalls to identify when Linux is running in a virtual machine
under Gunyah.

There are two calls to help identify Gunyah:

1. gh_hypercall_get_uid() returns a UID when running under a Gunyah
   hypervisor.
2. gh_hypercall_hyp_identify() returns build information and a set of
   feature flags that are supported by Gunyah.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/Kbuild                    |  1 +
 arch/arm64/gunyah/Makefile           |  3 ++
 arch/arm64/gunyah/gunyah_hypercall.c | 62 ++++++++++++++++++++++++++++
 drivers/virt/Kconfig                 |  2 +
 drivers/virt/gunyah/Kconfig          | 12 ++++++
 include/linux/gunyah.h               | 38 +++++++++++++++++
 6 files changed, 118 insertions(+)
 create mode 100644 arch/arm64/gunyah/Makefile
 create mode 100644 arch/arm64/gunyah/gunyah_hypercall.c
 create mode 100644 drivers/virt/gunyah/Kconfig

diff --git a/arch/arm64/Kbuild b/arch/arm64/Kbuild
index 5bfbf7d79c99..e4847ba0e3c9 100644
--- a/arch/arm64/Kbuild
+++ b/arch/arm64/Kbuild
@@ -3,6 +3,7 @@ obj-y			+= kernel/ mm/ net/
 obj-$(CONFIG_KVM)	+= kvm/
 obj-$(CONFIG_XEN)	+= xen/
 obj-$(subst m,y,$(CONFIG_HYPERV))	+= hyperv/
+obj-$(CONFIG_GUNYAH)	+= gunyah/
 obj-$(CONFIG_CRYPTO)	+= crypto/
 
 # for cleaning
diff --git a/arch/arm64/gunyah/Makefile b/arch/arm64/gunyah/Makefile
new file mode 100644
index 000000000000..84f1e38cafb1
--- /dev/null
+++ b/arch/arm64/gunyah/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_GUNYAH) += gunyah_hypercall.o
diff --git a/arch/arm64/gunyah/gunyah_hypercall.c b/arch/arm64/gunyah/gunyah_hypercall.c
new file mode 100644
index 000000000000..d44663334f38
--- /dev/null
+++ b/arch/arm64/gunyah/gunyah_hypercall.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/arm-smccc.h>
+#include <linux/module.h>
+#include <linux/gunyah.h>
+#include <linux/uuid.h>
+
+/* {c1d58fcd-a453-5fdb-9265-ce36673d5f14} */
+static const uuid_t GUNYAH_UUID = UUID_INIT(0xc1d58fcd, 0xa453, 0x5fdb, 0x92,
+					    0x65, 0xce, 0x36, 0x67, 0x3d, 0x5f,
+					    0x14);
+
+bool arch_is_gunyah_guest(void)
+{
+	struct arm_smccc_res res;
+	uuid_t uuid;
+	u32 *up;
+
+	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID, &res);
+
+	up = (u32 *)&uuid.b[0];
+	up[0] = lower_32_bits(res.a0);
+	up[1] = lower_32_bits(res.a1);
+	up[2] = lower_32_bits(res.a2);
+	up[3] = lower_32_bits(res.a3);
+
+	return uuid_equal(&uuid, &GUNYAH_UUID);
+}
+EXPORT_SYMBOL_GPL(arch_is_gunyah_guest);
+
+#define GUNYAH_HYPERCALL(fn)                                      \
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL, ARM_SMCCC_SMC_64, \
+			   ARM_SMCCC_OWNER_VENDOR_HYP, fn)
+
+/* clang-format off */
+#define GUNYAH_HYPERCALL_HYP_IDENTIFY		GUNYAH_HYPERCALL(0x8000)
+/* clang-format on */
+
+/**
+ * gunyah_hypercall_hyp_identify() - Returns build information and feature flags
+ *                               supported by Gunyah.
+ * @hyp_identity: filled by the hypercall with the API info and feature flags.
+ */
+void gunyah_hypercall_hyp_identify(
+	struct gunyah_hypercall_hyp_identify_resp *hyp_identity)
+{
+	struct arm_smccc_res res;
+
+	arm_smccc_1_1_hvc(GUNYAH_HYPERCALL_HYP_IDENTIFY, &res);
+
+	hyp_identity->api_info = res.a0;
+	hyp_identity->flags[0] = res.a1;
+	hyp_identity->flags[1] = res.a2;
+	hyp_identity->flags[2] = res.a3;
+}
+EXPORT_SYMBOL_GPL(gunyah_hypercall_hyp_identify);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Gunyah Hypervisor Hypercalls");
diff --git a/drivers/virt/Kconfig b/drivers/virt/Kconfig
index d8c848cf09a6..5a6781405a60 100644
--- a/drivers/virt/Kconfig
+++ b/drivers/virt/Kconfig
@@ -49,4 +49,6 @@ source "drivers/virt/acrn/Kconfig"
 
 source "drivers/virt/coco/Kconfig"
 
+source "drivers/virt/gunyah/Kconfig"
+
 endif
diff --git a/drivers/virt/gunyah/Kconfig b/drivers/virt/gunyah/Kconfig
new file mode 100644
index 000000000000..6f4c85db80b5
--- /dev/null
+++ b/drivers/virt/gunyah/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config GUNYAH
+	tristate "Gunyah Virtualization drivers"
+	depends on ARM64
+	help
+	  The Gunyah drivers are the helper interfaces that run in a guest VM
+	  such as basic inter-VM IPC and signaling mechanisms, and higher level
+	  services such as memory/device sharing, IRQ sharing, and so on.
+
+	  Say Y/M here to enable the drivers needed to interact in a Gunyah
+	  virtual environment.
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 1eab631a49b6..33bcbd22d39f 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -6,9 +6,11 @@
 #ifndef _LINUX_GUNYAH_H
 #define _LINUX_GUNYAH_H
 
+#include <linux/bitfield.h>
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/limits.h>
+#include <linux/types.h>
 
 /* Matches resource manager's resource types for VM_GET_HYP_RESOURCES RPC */
 enum gunyah_resource_type {
@@ -103,4 +105,40 @@ static inline int gunyah_error_remap(enum gunyah_error gunyah_error)
 	}
 }
 
+enum gunyah_api_feature {
+	/* clang-format off */
+	GUNYAH_FEATURE_DOORBELL		= 1,
+	GUNYAH_FEATURE_MSGQUEUE		= 2,
+	GUNYAH_FEATURE_VCPU		= 5,
+	GUNYAH_FEATURE_MEMEXTENT	= 6,
+	/* clang-format on */
+};
+
+bool arch_is_gunyah_guest(void);
+
+#define GUNYAH_API_V1 1
+
+/* Other bits reserved for future use and will be zero */
+/* clang-format off */
+#define GUNYAH_API_INFO_API_VERSION_MASK	GENMASK_ULL(13, 0)
+#define GUNYAH_API_INFO_BIG_ENDIAN		BIT_ULL(14)
+#define GUNYAH_API_INFO_IS_64BIT		BIT_ULL(15)
+#define GUNYAH_API_INFO_VARIANT_MASK 		GENMASK_ULL(63, 56)
+/* clang-format on */
+
+struct gunyah_hypercall_hyp_identify_resp {
+	u64 api_info;
+	u64 flags[3];
+};
+
+static inline u16
+gunyah_api_version(const struct gunyah_hypercall_hyp_identify_resp *gunyah_api)
+{
+	return FIELD_GET(GUNYAH_API_INFO_API_VERSION_MASK,
+			 gunyah_api->api_info);
+}
+
+void gunyah_hypercall_hyp_identify(
+	struct gunyah_hypercall_hyp_identify_resp *hyp_identity);
+
 #endif
-- 
2.39.5


