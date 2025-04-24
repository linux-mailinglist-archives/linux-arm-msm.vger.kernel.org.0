Return-Path: <linux-arm-msm+bounces-55422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC492A9B090
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:21:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C9E57B6DD3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970BB28B505;
	Thu, 24 Apr 2025 14:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZVrYkVnP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B56228C5A4
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504053; cv=none; b=aguxTBwopfs0BjMqHxJRRUTEwTkBij5fJZecpivlsqzCJ3Knv+AUHua/d3D8qtoI9AiCVnVyVHWeOzAj96PX9cnx8w319lSC9S7/Wyx9za+LX+mO6gqeHbCGVAarCqAB0wb6Uv0ZSh/Afli5vOFmaeUW4F/21RXNVCo5MFzP1Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504053; c=relaxed/simple;
	bh=S+aezV66gXf4D+s9yS2EKNbYmZv94XHap0Nf+ZRRUHk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qq+oLS4Mq9AdCdZnIbtyyCTm5pwzS5HOTXx7J835U7tNewBUEn678j0mTRW4oky+IiDrTbg6+cE1c1XkdXW4B0PoaoizbhcZDlLPy8RYpUz53BvaK6jy+oKU1yBKQrMA+1RqfgqW+NOs/OtNw7N3KH8OBkHbJpuwwS/WO+yHpD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZVrYkVnP; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39d83782ef6so1648172f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504048; x=1746108848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=98GtKQowyHwUXJ3/oi0BeOIZGrWAP4CATPU0kL4zC8c=;
        b=ZVrYkVnPnl9Ys6EiWjO0nW/ZKL9GZPhxZM8Jdq4yhpWJfZHOL7zyEOxMrBZQgE4ywb
         S/dHcmgPS1jkO5i8DXxJ+fn8JUsYf3LS8ffoJXnN9Obvw7bF4KK95uYdIdxYSk3FOog7
         4gZdjcJDvoxbNYrVrTnD6TfC3gXwFj0Q7fKu28uJZMdpJQQ9WazFoPCxhnuMNwow6cLm
         SwXd2GQgnZH64avWP2TPUZEJ5EEpzYL2FwLsoeVkaOXNR0FrskyMcsvHbDAlTyEBhCCH
         fBNLGXr2xfE/z7LpOxCBiHFnskchBvSkkplqymZ6IXk/VkZsoT4gAZf1MYFXX32dFOmo
         V/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504048; x=1746108848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=98GtKQowyHwUXJ3/oi0BeOIZGrWAP4CATPU0kL4zC8c=;
        b=kIOV3LIP+OT51UvriFPlvJQlljftoUSaycPKUHGmztmwA53w0go3CWJZ88bQlTBuBx
         xXXx0GMlGkXduXjjTqz+HZ9pnct/Crf31SBFitfrvwfK462ZUCc5HIi3vMThUw58wVZp
         EiXdVhdzynTLck9LDxZcAID/DL0qtVZZlqtX9lr6Tl2HIClHgTQbX6ftlKEQkkMOSUSo
         sKnq55IKJgOZVaWQqTantuysoReDbYULlA5w4ZydEjy5otz1EooByrp4PC8SFBFptiN6
         8aAGA+sxjXDKS6oWVY+Ayq9vxKO9a1lmHUyssZI45bvzrIj1YfaNzyxBubSwOHVXwaMF
         lRKw==
X-Forwarded-Encrypted: i=1; AJvYcCUDK9a8kn3uvEJKI0jBwCoCREus6QP4xL/2tW14NQmANyW/mdNvS0u0rtqoN7j3I2BSO/QdvEk2Wd10vAN9@vger.kernel.org
X-Gm-Message-State: AOJu0YzRyYU1AhvmJMNEHWm88UtqKmdT+ahUETxAzeQPOOpaUUetUZmS
	jGMIDVzStvA926ZuVxShqWEtXURxL9yoFH+fFi6L2o8R7U7AzuVtGw0alcefQ0M=
X-Gm-Gg: ASbGncuvZ2gfuZWdW9mAtOfSfQo4vz1gE7MGKUst3tMt/KijCo3lVtb1MBSYQHVCKKc
	ZaWirPW/mi7YmXlsl7ydp8y4KCEgWa+I7gwVvqccx+ZqUgITn9ERDuTVwhL5JdAdQ2rObdKa+AR
	Vrhsca2M4h0MxIEkmUm8robL6lveV/MwiwODimkxV2RTmcZpjdLhzcNLsMMCBM+QvyVtAxb61kI
	z3Nj7LIt4LYCOQAhLRwodv/Q8hiFpoyFwCz27THNJaXi07sIw8kJhIqwiDOpOwrywOti3xy/sF9
	mVSkJzWRcAYbLUR5qFITohW3oYK1qyZW0+PA/R6ihFia+XA5nWj3DFV9U6EqsEQ1Yx3A1EnP+Ek
	YhEgfqvIUuwkXa/QH
X-Google-Smtp-Source: AGHT+IFQAg02MXbpqUbddZDz1Nf5W/i1x6IwVsYQPoOcChQDsuxBB7Db2uzIfhJZTYe0HZGVw3TbTg==
X-Received: by 2002:a05:6000:18ae:b0:39f:cd2:1fa1 with SMTP id ffacd0b85a97d-3a06d647026mr2922759f8f.3.1745504048036;
        Thu, 24 Apr 2025 07:14:08 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:07 -0700 (PDT)
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
	Elliot Berman <quic_eberman@quicinc.com>
Subject: [RFC PATCH 17/34] gunyah: Translate gh_rm_hyp_resource into gunyah_resource
Date: Thu, 24 Apr 2025 15:13:24 +0100
Message-Id: <20250424141341.841734-18-karim.manaouil@linaro.org>
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

When booting a Gunyah virtual machine, the host VM may gain capabilities
to interact with resources for the guest virtual machine. Examples of
such resources are vCPUs or message queues. To use those resources, we
need to translate the RM response into a gunyah_resource structure which
are useful to Linux drivers. Presently, Linux drivers need only to know
the type of resource, the capability ID, and an interrupt.

On ARM64 systems, the interrupt reported by Gunyah is the GIC interrupt
ID number and always a SPI or extended SPI.

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Reviewed-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/include/asm/gunyah.h | 35 +++++++++++++++++
 drivers/virt/gunyah/rsc_mgr.c   | 68 +++++++++++++++++++++++++++++++++
 include/linux/gunyah.h          |  2 +
 include/linux/gunyah_rsc_mgr.h  |  4 ++
 4 files changed, 109 insertions(+)
 create mode 100644 arch/arm64/include/asm/gunyah.h

diff --git a/arch/arm64/include/asm/gunyah.h b/arch/arm64/include/asm/gunyah.h
new file mode 100644
index 000000000000..29079d1a4df2
--- /dev/null
+++ b/arch/arm64/include/asm/gunyah.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef _ASM_GUNYAH_H
+#define _ASM_GUNYAH_H
+
+#include <linux/irq.h>
+#include <linux/irqdomain.h>
+
+static inline int arch_gunyah_fill_irq_fwspec_params(u32 virq,
+						 struct irq_fwspec *fwspec)
+{
+	/* Assume that Gunyah gave us an SPI or ESPI; defensively check it */
+	if (WARN(virq < 32, "Unexpected virq: %d\n", virq)) {
+		return -EINVAL;
+	} else if (virq <= 1019) {
+		fwspec->param_count = 3;
+		fwspec->param[0] = 0; /* GIC_SPI */
+		fwspec->param[1] = virq - 32; /* virq 32 -> SPI 0 */
+		fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
+	} else if (WARN(virq < 4096, "Unexpected virq: %d\n", virq)) {
+		return -EINVAL;
+	} else if (virq < 5120) {
+		fwspec->param_count = 3;
+		fwspec->param[0] = 2; /* GIC_ESPI */
+		fwspec->param[1] = virq - 4096; /* virq 4096 -> ESPI 0 */
+		fwspec->param[2] = IRQ_TYPE_EDGE_RISING;
+	} else {
+		WARN(1, "Unexpected virq: %d\n", virq);
+		return -EINVAL;
+	}
+	return 0;
+}
+#endif
diff --git a/drivers/virt/gunyah/rsc_mgr.c b/drivers/virt/gunyah/rsc_mgr.c
index 75fc86887868..2d34b0ba98b2 100644
--- a/drivers/virt/gunyah/rsc_mgr.c
+++ b/drivers/virt/gunyah/rsc_mgr.c
@@ -9,8 +9,10 @@
 #include <linux/mutex.h>
 #include <linux/notifier.h>
 #include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 
+#include <asm/gunyah.h>
 #include <linux/gunyah_rsc_mgr.h>
 
 /* clang-format off */
@@ -118,6 +120,7 @@ struct gunyah_rm_message {
  * @send_lock: synchronization to allow only one request to be sent at a time
  * @send_ready: completed when we know Tx message queue can take more messages
  * @nh: notifier chain for clients interested in RM notification messages
+ * @parent_fwnode: Parent IRQ fwnode to translate Gunyah hwirqs to Linux irqs
  */
 struct gunyah_rm {
 	struct device *dev;
@@ -133,6 +136,8 @@ struct gunyah_rm {
 	struct mutex send_lock;
 	struct completion send_ready;
 	struct blocking_notifier_head nh;
+
+	struct fwnode_handle *parent_fwnode;
 };
 
 /* Global resource manager instance */
@@ -177,6 +182,53 @@ static inline int gunyah_rm_error_remap(enum gunyah_rm_error rm_error)
 	}
 }
 
+struct gunyah_resource *
+gunyah_rm_alloc_resource(struct gunyah_rm *rm,
+			 struct gunyah_rm_hyp_resource *hyp_resource)
+{
+	struct gunyah_resource *ghrsc;
+	int ret;
+
+	ghrsc = kzalloc(sizeof(*ghrsc), GFP_KERNEL);
+	if (!ghrsc)
+		return NULL;
+
+	ghrsc->type = hyp_resource->type;
+	ghrsc->capid = le64_to_cpu(hyp_resource->cap_id);
+	ghrsc->irq = IRQ_NOTCONNECTED;
+	ghrsc->rm_label = le32_to_cpu(hyp_resource->resource_label);
+	if (hyp_resource->virq) {
+		struct irq_fwspec fwspec;
+
+
+		fwspec.fwnode = rm->parent_fwnode;
+		ret = arch_gunyah_fill_irq_fwspec_params(le32_to_cpu(hyp_resource->virq), &fwspec);
+		if (ret) {
+			dev_err(rm->dev,
+				"Failed to translate interrupt for resource %d label: %d: %d\n",
+				ghrsc->type, ghrsc->rm_label, ret);
+		}
+
+		ret = irq_create_fwspec_mapping(&fwspec);
+		if (ret < 0) {
+			dev_err(rm->dev,
+				"Failed to allocate interrupt for resource %d label: %d: %d\n",
+				ghrsc->type, ghrsc->rm_label, ret);
+			kfree(ghrsc);
+			return NULL;
+		}
+		ghrsc->irq = ret;
+	}
+
+	return ghrsc;
+}
+
+void gunyah_rm_free_resource(struct gunyah_resource *ghrsc)
+{
+	irq_dispose_mapping(ghrsc->irq);
+	kfree(ghrsc);
+}
+
 static int gunyah_rm_init_message_payload(struct gunyah_rm_message *message,
 					  const void *msg, size_t hdr_size,
 					  size_t msg_size)
@@ -676,6 +728,7 @@ static int gunyah_rm_probe_rx_msgq(struct gunyah_rm *rm,
 
 static int gunyah_rm_probe(struct platform_device *pdev)
 {
+	struct device_node *parent_irq_node;
 	int ret;
 
 	gunyah_rm = devm_kzalloc(&pdev->dev, sizeof(*gunyah_rm), GFP_KERNEL);
@@ -695,6 +748,21 @@ static int gunyah_rm_probe(struct platform_device *pdev)
 	ret = gunyah_rm_probe_tx_msgq(gunyah_rm, pdev);
 	if (ret)
 		return ret;
+
+	parent_irq_node = of_irq_find_parent(pdev->dev.of_node);
+	if (!parent_irq_node) {
+		dev_err(&pdev->dev,
+			"Failed to find interrupt parent of resource manager\n");
+		return -ENODEV;
+	}
+
+	gunyah_rm->parent_fwnode = of_node_to_fwnode(parent_irq_node);
+	if (!gunyah_rm->parent_fwnode) {
+		dev_err(&pdev->dev,
+			"Failed to find interrupt parent domain of resource manager\n");
+		return -ENODEV;
+	}
+
 	/* assume RM is ready to receive messages from us */
 	complete(&gunyah_rm->send_ready);
 
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 1f4389eb21fb..40ea21b17195 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -35,6 +35,8 @@ struct gunyah_resource {
 	enum gunyah_resource_type type;
 	u64 capid;
 	unsigned int irq;
+
+	u32 rm_label;
 };
 
 /**
diff --git a/include/linux/gunyah_rsc_mgr.h b/include/linux/gunyah_rsc_mgr.h
index 294e847c27ed..c0fe516d54a8 100644
--- a/include/linux/gunyah_rsc_mgr.h
+++ b/include/linux/gunyah_rsc_mgr.h
@@ -97,6 +97,10 @@ struct gunyah_rm_hyp_resources {
 
 int gunyah_rm_get_hyp_resources(struct gunyah_rm *rm, u16 vmid,
 				struct gunyah_rm_hyp_resources **resources);
+struct gunyah_resource *
+gunyah_rm_alloc_resource(struct gunyah_rm *rm,
+			 struct gunyah_rm_hyp_resource *hyp_resource);
+void gunyah_rm_free_resource(struct gunyah_resource *ghrsc);
 
 int gunyah_rm_call(struct gunyah_rm *rsc_mgr, u32 message_id,
 		   const void *req_buf, size_t req_buf_size, void **resp_buf,
-- 
2.39.5


