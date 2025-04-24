Return-Path: <linux-arm-msm+bounces-55428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4837DA9B09F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7D2D3AF3C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:23:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 682F928F524;
	Thu, 24 Apr 2025 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V1AW5rAW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3256C290BA4
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504063; cv=none; b=cRwCjmFTFSOSE5i73HkcX0C9jlUQZcKPM4by9OiK+MjdWzRnuPUTq6o9tk3tZkjETQ2Cz4RBDrapdiWPZjWzEV2jyUlAf0UdCb6tlFE+/7FCw3zwkN0OLDagI4thKOyrOdskKclO0Hu2ury4d8spnUobvWPsuEbYqVaG+DoOLMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504063; c=relaxed/simple;
	bh=vLbxwMoJK25jtdiinc5JboXzA9vEq1NIw2shYX4meSY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rg77hKB/arHA4NQK/6/j5oArSd/EZ2UUzUFjbaklNckZAgNQxDsqv1aN3rsP4wLkZiMG+UeZF/HrBgSrPSzKK5kSlnAFbxDTydH7bVennwVEeYo3pwfG2FZ5NBpwZKgZkdeWPO1esR9iUc8lFtTH402mJMI+iI/OFIFWJrS2D7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V1AW5rAW; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso840803f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504057; x=1746108857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXeykB8FkcDuL2Q2W63/7k8ahxVIXL64cFUzN9R5114=;
        b=V1AW5rAWrfLG1Wkq/87KzJUariKgRAJdGvyfb3BPRdNwLW0FK72L3c9c0jBBXVAWyJ
         3uhlbzwZO5P44RGLoNPqy6hqRo+K6BS+8X+oJbGEDcD2u5ziLSPhQyl6froafzR5x2Pj
         W56JpMYuWxH8iQ5NCPwma7xAfz7VjRJ+HUjGqdBgBP7o14nB3mY3ntsB/13uvlIF0t7v
         PeeB6LCB5wS0t5MD6QUXJSTQ1A3UVHSnxnlyXgSvMqVW181kFj2gc3OrTjwm/qNIhhVG
         Ks6f5LSXc2a9yUO5eRMQBc4wXwkuVnnHcCmvMbP3O6hkh/aGjrC9ZXgu4iyndXiS5YbQ
         ZwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504057; x=1746108857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXeykB8FkcDuL2Q2W63/7k8ahxVIXL64cFUzN9R5114=;
        b=i5xUzdyOPOWGqXv0QG2GV7geOVPoOPhZO8A30x+N9s/c52r5b/kXEK9Aq5Dp7u4p2C
         akABpPei6TvfuBO2Xe7r/exFsTCgSrW29dlLAuworGym34WgvIeQCg+srwysb1tbYtdS
         zmvFtERih7fH0Kbmfi5etbgwVTsPhFHSBGhrGBhDcqMfyxtckTHx/cYpFKS+9Ke1BVQ9
         l1Y6lLs/pedDhmQ+q6MSF+ejHVVHpBYbxpebIz90VVly3E/f/tPLWpkQm99P2Hlmj4q3
         lrOFQFolQNG6jKVOh529RKS5AQl7vVvLN0TW+Q4JmCm1akvwcJYH1qeTshbXTV8hk+rs
         S45w==
X-Forwarded-Encrypted: i=1; AJvYcCXP4Afx0sjpw1dIyPGjOCrO+ti2cb5UdfCM1IaEakXejcZLBm34wJTviuq93roQCd0omoMKVYCejOf8YmNO@vger.kernel.org
X-Gm-Message-State: AOJu0YyHrUzjxx7dhxUk+DN6y8Dda92nSWWp3lc1eLKCC/dFz51wM2IC
	aj/2cXGsvQLbNJ+wc6NaVEMlRAFPt/zhltRdQSmD6CYDW7H3NK5dqb9e56QX+W0=
X-Gm-Gg: ASbGncsIq+FgoEUnuZYN2EulJ1JYstIBEyj6h9b3NeEeHXSruBxQJiBGVbJeCVgD+F+
	wfHbP77qT2eGk0OnYmo+EAqS7zWHkU5D/zKI9FGYYUtjdOn6kqL/chNN1GurUVhviymWNrpmmDm
	Yorym9nyDYgTioWei+kbCOCJpImvhkPF/+UruMXEvL+uCsysaIQeZBjmfGbdgBCEh6fy2pSDT2z
	xOs1sZTkst4lQxnX610YtM66G2LRIdTAYzWBXri6s2GfS/uvF2Wm/i0/L2RH/n1/BIUeBFcvyZb
	yqd7kEYGgBlnwNODD7Nie6Xc3HBdvQdA2Lq7GmjHBsd+R1Me21R5rfrQWtE2XRTgPvRLS+xUtDD
	KuttPy5U7dqM4Il9MONuLyvXWDFE=
X-Google-Smtp-Source: AGHT+IFg8XOlOSbfkRtBuJWxisCALodsFHPa4IUTZp3Kj17cI2U8pp461yntnlLPPaPA3d0u/jWMRw==
X-Received: by 2002:a05:6000:420f:b0:399:71d4:a9 with SMTP id ffacd0b85a97d-3a06cfb2391mr2162635f8f.52.1745504057229;
        Thu, 24 Apr 2025 07:14:17 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:16 -0700 (PDT)
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
Subject: [RFC PATCH 24/34] gunyah: Add platform ops on mem_lend/mem_reclaim
Date: Thu, 24 Apr 2025 15:13:31 +0100
Message-Id: <20250424141341.841734-25-karim.manaouil@linaro.org>
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

On Qualcomm platforms, there is a firmware entity which controls access
to physical pages. In order to share memory with another VM, this entity
needs to be informed that the guest VM should have access to the memory.

Co-developed-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
Signed-off-by: Prakruthi Deepak Heragu <quic_pheragu@quicinc.com>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/kvm/gunyah.c                     |  29 ++++-
 drivers/virt/gunyah/Kconfig                 |   4 +
 drivers/virt/gunyah/Makefile                |   1 +
 drivers/virt/gunyah/gunyah_platform_hooks.c | 117 ++++++++++++++++++++
 drivers/virt/gunyah/rsc_mgr_rpc.c           |  19 +++-
 include/linux/gunyah.h                      |  63 +++++++++--
 include/linux/gunyah_rsc_mgr.h              |  10 ++
 7 files changed, 226 insertions(+), 17 deletions(-)
 create mode 100644 drivers/virt/gunyah/gunyah_platform_hooks.c

diff --git a/arch/arm64/kvm/gunyah.c b/arch/arm64/kvm/gunyah.c
index 5d18d133df50..7216db642174 100644
--- a/arch/arm64/kvm/gunyah.c
+++ b/arch/arm64/kvm/gunyah.c
@@ -488,7 +488,7 @@ static int gunyah_memory_provide_folio(struct gunyah_vm *ghvm,
 	size_t size = folio_size(folio);
 	enum gunyah_error gunyah_error;
 	unsigned long tag = 0;
-	int ret;
+	int ret, tmp;
 
 	if (share) {
 		guest_extent = __first_resource(&ghvm->guest_shared_extent_ticket);
@@ -521,6 +521,11 @@ static int gunyah_memory_provide_folio(struct gunyah_vm *ghvm,
 	else /* !share && !write */
 		access = GUNYAH_PAGETABLE_ACCESS_RX;
 
+	ret = gunyah_rm_platform_pre_demand_page(ghvm->rm, ghvm->vmid, access,
+						 folio);
+	if (ret)
+		return ret;
+
 	gunyah_error = gunyah_hypercall_memextent_donate(donate_flags(share),
 							 host_extent->capid,
 							 guest_extent->capid,
@@ -528,7 +533,8 @@ static int gunyah_memory_provide_folio(struct gunyah_vm *ghvm,
 	if (gunyah_error != GUNYAH_ERROR_OK) {
 		pr_err("Failed to donate memory for guest address 0x%016llx: %d\n",
 		       gpa, gunyah_error);
-		return gunyah_error_remap(gunyah_error);
+		ret = gunyah_error_remap(gunyah_error);
+		goto platform_release;
 	}
 
 	extent_attrs =
@@ -556,6 +562,14 @@ static int gunyah_memory_provide_folio(struct gunyah_vm *ghvm,
 	if (gunyah_error != GUNYAH_ERROR_OK)
 		pr_err("Failed to reclaim memory donation for guest address 0x%016llx: %d\n",
 		       gpa, gunyah_error);
+platform_release:
+	tmp = gunyah_rm_platform_reclaim_demand_page(ghvm->rm, ghvm->vmid,
+						     access, folio);
+	if (tmp) {
+		pr_err("Platform failed to reclaim memory for guest address 0x%016llx: %d",
+		       gpa, tmp);
+		return ret;
+	}
 	return ret;
 }
 
@@ -565,6 +579,7 @@ static int gunyah_memory_reclaim_folio(struct gunyah_vm *ghvm,
 	u32 map_flags = BIT(GUNYAH_ADDRSPACE_MAP_FLAG_PARTIAL);
 	struct gunyah_resource *guest_extent, *host_extent, *addrspace;
 	enum gunyah_error gunyah_error;
+	enum gunyah_pagetable_access access;
 	phys_addr_t pa;
 	size_t size;
 	int ret;
@@ -604,6 +619,16 @@ static int gunyah_memory_reclaim_folio(struct gunyah_vm *ghvm,
 		goto err;
 	}
 
+	access = GUNYAH_PAGETABLE_ACCESS_RWX;
+
+	ret = gunyah_rm_platform_reclaim_demand_page(ghvm->rm, ghvm->vmid, access, folio);
+	if (ret) {
+		pr_err_ratelimited(
+			"Platform failed to reclaim memory for guest address 0x%016llx: %d",
+			gfn_to_gpa(gfn), ret);
+		goto err;
+	}
+
 	return 0;
 err:
 	return ret;
diff --git a/drivers/virt/gunyah/Kconfig b/drivers/virt/gunyah/Kconfig
index 6f4c85db80b5..23ba523d25dc 100644
--- a/drivers/virt/gunyah/Kconfig
+++ b/drivers/virt/gunyah/Kconfig
@@ -3,6 +3,7 @@
 config GUNYAH
 	tristate "Gunyah Virtualization drivers"
 	depends on ARM64
+	select GUNYAH_PLATFORM_HOOKS
 	help
 	  The Gunyah drivers are the helper interfaces that run in a guest VM
 	  such as basic inter-VM IPC and signaling mechanisms, and higher level
@@ -10,3 +11,6 @@ config GUNYAH
 
 	  Say Y/M here to enable the drivers needed to interact in a Gunyah
 	  virtual environment.
+
+config GUNYAH_PLATFORM_HOOKS
+	tristate
diff --git a/drivers/virt/gunyah/Makefile b/drivers/virt/gunyah/Makefile
index b1bdf3e84155..45cabba3110c 100644
--- a/drivers/virt/gunyah/Makefile
+++ b/drivers/virt/gunyah/Makefile
@@ -3,3 +3,4 @@
 gunyah_rsc_mgr-y += rsc_mgr.o rsc_mgr_rpc.o
 
 obj-$(CONFIG_GUNYAH) += gunyah.o gunyah_rsc_mgr.o
+obj-$(CONFIG_GUNYAH_PLATFORM_HOOKS) += gunyah_platform_hooks.o
diff --git a/drivers/virt/gunyah/gunyah_platform_hooks.c b/drivers/virt/gunyah/gunyah_platform_hooks.c
new file mode 100644
index 000000000000..8a1af171e4c9
--- /dev/null
+++ b/drivers/virt/gunyah/gunyah_platform_hooks.c
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/gunyah.h>
+#include <linux/module.h>
+#include <linux/rwsem.h>
+
+#include <linux/gunyah_rsc_mgr.h>
+
+static const struct gunyah_rm_platform_ops *rm_platform_ops;
+static DECLARE_RWSEM(rm_platform_ops_lock);
+
+int gunyah_rm_platform_pre_mem_share(struct gunyah_rm *rm,
+				     struct gunyah_rm_mem_parcel *mem_parcel)
+{
+	int ret = 0;
+
+	down_read(&rm_platform_ops_lock);
+	if (rm_platform_ops && rm_platform_ops->pre_mem_share)
+		ret = rm_platform_ops->pre_mem_share(rm, mem_parcel);
+	up_read(&rm_platform_ops_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gunyah_rm_platform_pre_mem_share);
+
+int gunyah_rm_platform_post_mem_reclaim(struct gunyah_rm *rm,
+					struct gunyah_rm_mem_parcel *mem_parcel)
+{
+	int ret = 0;
+
+	down_read(&rm_platform_ops_lock);
+	if (rm_platform_ops && rm_platform_ops->post_mem_reclaim)
+		ret = rm_platform_ops->post_mem_reclaim(rm, mem_parcel);
+	up_read(&rm_platform_ops_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gunyah_rm_platform_post_mem_reclaim);
+
+int gunyah_rm_platform_pre_demand_page(struct gunyah_rm *rm, u16 vmid,
+				       enum gunyah_pagetable_access access,
+				       struct folio *folio)
+{
+	int ret = 0;
+
+	down_read(&rm_platform_ops_lock);
+	if (rm_platform_ops && rm_platform_ops->pre_demand_page)
+		ret = rm_platform_ops->pre_demand_page(rm, vmid, access, folio);
+	up_read(&rm_platform_ops_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gunyah_rm_platform_pre_demand_page);
+
+int gunyah_rm_platform_reclaim_demand_page(struct gunyah_rm *rm, u16 vmid,
+					   enum gunyah_pagetable_access access,
+					   struct folio *folio)
+{
+	int ret = 0;
+
+	down_read(&rm_platform_ops_lock);
+	if (rm_platform_ops && rm_platform_ops->pre_demand_page)
+		ret = rm_platform_ops->release_demand_page(rm, vmid, access,
+							   folio);
+	up_read(&rm_platform_ops_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gunyah_rm_platform_reclaim_demand_page);
+
+int gunyah_rm_register_platform_ops(
+	const struct gunyah_rm_platform_ops *platform_ops)
+{
+	int ret = 0;
+
+	down_write(&rm_platform_ops_lock);
+	if (!rm_platform_ops)
+		rm_platform_ops = platform_ops;
+	else
+		ret = -EEXIST;
+	up_write(&rm_platform_ops_lock);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gunyah_rm_register_platform_ops);
+
+void gunyah_rm_unregister_platform_ops(
+	const struct gunyah_rm_platform_ops *platform_ops)
+{
+	down_write(&rm_platform_ops_lock);
+	if (rm_platform_ops == platform_ops)
+		rm_platform_ops = NULL;
+	up_write(&rm_platform_ops_lock);
+}
+EXPORT_SYMBOL_GPL(gunyah_rm_unregister_platform_ops);
+
+static void _devm_gunyah_rm_unregister_platform_ops(void *data)
+{
+	gunyah_rm_unregister_platform_ops(
+		(const struct gunyah_rm_platform_ops *)data);
+}
+
+int devm_gunyah_rm_register_platform_ops(
+	struct device *dev, const struct gunyah_rm_platform_ops *ops)
+{
+	int ret;
+
+	ret = gunyah_rm_register_platform_ops(ops);
+	if (ret)
+		return ret;
+
+	return devm_add_action(dev, _devm_gunyah_rm_unregister_platform_ops,
+			       (void *)ops);
+}
+EXPORT_SYMBOL_GPL(devm_gunyah_rm_register_platform_ops);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Gunyah Platform Hooks");
diff --git a/drivers/virt/gunyah/rsc_mgr_rpc.c b/drivers/virt/gunyah/rsc_mgr_rpc.c
index 0266c2a8d583..ec187d116dd7 100644
--- a/drivers/virt/gunyah/rsc_mgr_rpc.c
+++ b/drivers/virt/gunyah/rsc_mgr_rpc.c
@@ -212,6 +212,12 @@ int gunyah_rm_mem_share(struct gunyah_rm *rm, struct gunyah_rm_mem_parcel *p)
 	if (!msg)
 		return -ENOMEM;
 
+	ret = gunyah_rm_platform_pre_mem_share(rm, p);
+	if (ret) {
+		kfree(msg);
+		return ret;
+	}
+
 	req_header = msg;
 	acl = (void *)req_header + sizeof(*req_header);
 	mem = (void *)acl + acl_size;
@@ -237,8 +243,10 @@ int gunyah_rm_mem_share(struct gunyah_rm *rm, struct gunyah_rm_mem_parcel *p)
 			     &resp_size);
 	kfree(msg);
 
-	if (ret)
+	if (ret) {
+		gunyah_rm_platform_post_mem_reclaim(rm, p);
 		return ret;
+	}
 
 	p->mem_handle = le32_to_cpu(*resp);
 	kfree(resp);
@@ -270,9 +278,14 @@ int gunyah_rm_mem_reclaim(struct gunyah_rm *rm,
 	struct gunyah_rm_mem_release_req req = {
 		.mem_handle = cpu_to_le32(parcel->mem_handle),
 	};
+	int ret;
+
+	 ret = gunyah_rm_call(rm, GUNYAH_RM_RPC_MEM_RECLAIM, &req, sizeof(req),
+			 NULL, NULL);
+	if (ret)
+		return ret;
 
-	 return gunyah_rm_call(rm, GUNYAH_RM_RPC_MEM_RECLAIM, &req, sizeof(req),
-			     NULL, NULL);
+	return gunyah_rm_platform_post_mem_reclaim(rm, parcel);
 }
 ALLOW_ERROR_INJECTION(gunyah_rm_mem_reclaim, ERRNO);
 
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index d1048d0fc246..1d363ab8967a 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -158,6 +158,57 @@ struct gunyah_vcpu {
 	struct gunyah_vm_resource_ticket ticket;
 };
 
+enum gunyah_pagetable_access {
+	/* clang-format off */
+	GUNYAH_PAGETABLE_ACCESS_NONE		= 0,
+	GUNYAH_PAGETABLE_ACCESS_X		= 1,
+	GUNYAH_PAGETABLE_ACCESS_W		= 2,
+	GUNYAH_PAGETABLE_ACCESS_R		= 4,
+	GUNYAH_PAGETABLE_ACCESS_RX		= 5,
+	GUNYAH_PAGETABLE_ACCESS_RW		= 6,
+	GUNYAH_PAGETABLE_ACCESS_RWX		= 7,
+	/* clang-format on */
+};
+
+struct gunyah_rm_platform_ops {
+	int (*pre_mem_share)(struct gunyah_rm *rm,
+			     struct gunyah_rm_mem_parcel *mem_parcel);
+	int (*post_mem_reclaim)(struct gunyah_rm *rm,
+				struct gunyah_rm_mem_parcel *mem_parcel);
+
+	int (*pre_demand_page)(struct gunyah_rm *rm, u16 vmid,
+			       enum gunyah_pagetable_access access,
+			       struct folio *folio);
+	int (*release_demand_page)(struct gunyah_rm *rm, u16 vmid,
+				   enum gunyah_pagetable_access access,
+				   struct folio *folio);
+};
+
+#if IS_ENABLED(CONFIG_GUNYAH_PLATFORM_HOOKS)
+int gunyah_rm_register_platform_ops(
+	const struct gunyah_rm_platform_ops *platform_ops);
+void gunyah_rm_unregister_platform_ops(
+	const struct gunyah_rm_platform_ops *platform_ops);
+int devm_gunyah_rm_register_platform_ops(
+	struct device *dev, const struct gunyah_rm_platform_ops *ops);
+#else
+static inline int gunyah_rm_register_platform_ops(
+	const struct gunyah_rm_platform_ops *platform_ops)
+{
+	return 0;
+}
+static inline void gunyah_rm_unregister_platform_ops(
+	const struct gunyah_rm_platform_ops *platform_ops)
+{
+}
+static inline int
+devm_gunyah_rm_register_platform_ops(struct device *dev,
+				     const struct gunyah_rm_platform_ops *ops)
+{
+	return 0;
+}
+#endif
+
 /******************************************************************************/
 /* Common arch-independent definitions for Gunyah hypercalls                  */
 #define GUNYAH_CAPID_INVAL U64_MAX
@@ -278,18 +329,6 @@ enum gunyah_error gunyah_hypercall_msgq_recv(u64 capid, void *buff, size_t size,
 
 #define GUNYAH_ADDRSPACE_SELF_CAP 0
 
-enum gunyah_pagetable_access {
-	/* clang-format off */
-	GUNYAH_PAGETABLE_ACCESS_NONE		= 0,
-	GUNYAH_PAGETABLE_ACCESS_X		= 1,
-	GUNYAH_PAGETABLE_ACCESS_W		= 2,
-	GUNYAH_PAGETABLE_ACCESS_R		= 4,
-	GUNYAH_PAGETABLE_ACCESS_RX		= 5,
-	GUNYAH_PAGETABLE_ACCESS_RW		= 6,
-	GUNYAH_PAGETABLE_ACCESS_RWX		= 7,
-	/* clang-format on */
-};
-
 /* clang-format off */
 #define GUNYAH_MEMEXTENT_MAPPING_USER_ACCESS		GENMASK_ULL(2, 0)
 #define GUNYAH_MEMEXTENT_MAPPING_KERNEL_ACCESS		GENMASK_ULL(6, 4)
diff --git a/include/linux/gunyah_rsc_mgr.h b/include/linux/gunyah_rsc_mgr.h
index c42a0cb42ba6..fb3feee73490 100644
--- a/include/linux/gunyah_rsc_mgr.h
+++ b/include/linux/gunyah_rsc_mgr.h
@@ -155,4 +155,14 @@ void gunyah_rm_free_resource(struct gunyah_resource *ghrsc);
 int gunyah_rm_call(struct gunyah_rm *rsc_mgr, u32 message_id,
 		   const void *req_buf, size_t req_buf_size, void **resp_buf,
 		   size_t *resp_buf_size);
+
+int gunyah_rm_platform_pre_mem_share(struct gunyah_rm *rm,
+				     struct gunyah_rm_mem_parcel *mem_parcel);
+int gunyah_rm_platform_post_mem_reclaim(
+	struct gunyah_rm *rm, struct gunyah_rm_mem_parcel *mem_parcel);
+
+int gunyah_rm_platform_pre_demand_page(struct gunyah_rm *rm, u16 vmid,
+				       u32 flags, struct folio *folio);
+int gunyah_rm_platform_reclaim_demand_page(struct gunyah_rm *rm, u16 vmid,
+					   u32 flags, struct folio *folio);
 #endif
-- 
2.39.5


