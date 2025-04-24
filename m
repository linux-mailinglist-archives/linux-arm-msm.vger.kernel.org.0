Return-Path: <linux-arm-msm+bounces-55423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE221A9B09E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11A337B6EAC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0226D28E5F2;
	Thu, 24 Apr 2025 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YIRJC4+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B3C28CF6F
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504053; cv=none; b=Rf2rDgk+f8ULo4dqQh8gnkCBRooQxMrvdCvEjnIYQRSdCuNC3n+0BCkF5qafx29unlROgGrlYRIbyf/Q2E89OrJAmMXGAue0KbKQ9dm4ApMU8zISz9amkNrMaU7djIzv+ZK5S+3UNlZaX7n6Rd9C6D85gRK7AYLye72Y/w6z+Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504053; c=relaxed/simple;
	bh=DcGv+45qXx8VGU67Z7HeTl3hoEPjIE7jytPc3+geiuE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ntH9ZcbEbXSLkN19Jxmc/EQp60BQhSfwHmJD9c1LFMIeQ6lg1Jw6A3/Zy4nUDPXVtxbhxvs6lWHHoktjhjgtunMG9RwcCtzz/BJSXO99pM0RMdMEsQE5c/+VgIbBLNZnwqINJnNZs3jPrMLPD/uJyZmbqNoAvtFQ+bNq3b9HDGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YIRJC4+s; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so802678f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504050; x=1746108850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=um+352HlfSoMWZjyUPYbdpZGkULscMwPKC2qBZ9EnFo=;
        b=YIRJC4+sfP9K7ZxYZWGxTQMjNFQy2JI0tIeeK/BfvqfqS1GKAfbm5Fr5c0XV+tMqwW
         9vVk0Ng3BuugZHjkFlsmW21qafmVfN99B3w4ye3xbHNzRJvmrEp8PVmeQQjPcgB231Kw
         MEisY8bi3PgsLmrLOV0dsPGFF2gOQDmDs20JrwveUJuu3vnofJlkHVCBncOYpfYTIFik
         TKNKBOwtDhKLWFH5cAPv06B/e4FIi8IoFcPWtqrnOcdHMeH90XTTy92j+BJCGdBQF/8v
         sIr/HhwK+QNWj3y2FNuztGVfZ7lwO8R4ARngY8kmLmNjLUTHLQBg/Jl1IrMqzMveSjNo
         uRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504050; x=1746108850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=um+352HlfSoMWZjyUPYbdpZGkULscMwPKC2qBZ9EnFo=;
        b=GsKvHOQJ5mjbyZ89HuP+Q+Xt7NWzi08fS+CjRYFQiGC7elLHFoA4aXxcBrwK6hUGFJ
         1R+12In6GykEcLq+oIU0XOsnesX1SPf6cR8e5kDaIMo756MHj58qi1K87Ux8yVXmqaEP
         czjLMJ+4RxiX+e/z2H3dx0epYwPxqx/xIwDivBx1gVkIFUw0hHb7qVPbvxdVM4keNZXl
         /Zb4sIfCP67a7QVkRm+2hpifSjdZ1ZBsgs4tZ7ok0QqVhlIOzbcvaCACPNxqR6zdTugU
         5yFkVL/lmDOGPKURLBKF5QLyKAZ23fIU+q5xhKUR+9rAdb6Jh++eXaMZ9MtSKBf4KjDZ
         1EKw==
X-Forwarded-Encrypted: i=1; AJvYcCUVl5H/Nfl3usg5/a/2rCwbm+EzHsuNVDKQVWzqvTlCQPRYxdTz8LJJ9U62BG9cqQabyixSU6XQD1jhd40t@vger.kernel.org
X-Gm-Message-State: AOJu0YzHFGBmuiZeebavEpnebQjEG5y8tO8RehPXm0pMvVLh+iggkpQl
	Yu2FI+janQVqKb6xiNUXAnlo1zc8bCSvEkaIvsOKQ0QXZFc03Y6mW4W8GkUbsPE=
X-Gm-Gg: ASbGncvnCwKwZYQqBC9wR4ahKyqSGQyLONVL9Np3tmoQ/LtBLEv6ZTGHZIFMzLy0uXe
	aDH537sIMlx9RfZveymbqP2ku4l+WYNobh9Jx1v+aQZcfijTpkYDXiOyCEJVPE3CmlYE+k+bJOa
	AI8KT4gcLTHE0z5O+14BfqnHQuKHjMHSpHw08Zz4h37z3TqgmghIMdgLDO7RzbK6m5jWl8fYsW2
	L4p/19Eb0vr0aFgeBukwqDFHbZfp4zS6v5+gFdd1AXbi67vr5RLJ7toTnpP9HkyIPCzsUM4fXU5
	ixVJEYDuuwtmJPRZoz3jqLGa/reuvvH1sOPzOCoRM4IftwL99qp7XgBer9gvunuydV+8FDXnP1P
	OSdIYibyV0Nmy15Iw
X-Google-Smtp-Source: AGHT+IEvmLar5qQKwS4wz8XFX51INY2Yy6tUFq9mAIas/T9L785Up8KKwGDWzGpkxhc6ebHp9w3CBA==
X-Received: by 2002:a5d:64c7:0:b0:391:4389:f36a with SMTP id ffacd0b85a97d-3a06cfaf773mr2225643f8f.48.1745504049421;
        Thu, 24 Apr 2025 07:14:09 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:08 -0700 (PDT)
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
	Alex Elder <elder@linaro.org>
Subject: [RFC PATCH 18/34] gunyah: Add resource tickets
Date: Thu, 24 Apr 2025 15:13:25 +0100
Message-Id: <20250424141341.841734-19-karim.manaouil@linaro.org>
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

Some VM functions need to acquire Gunyah resources. For instance, Gunyah
vCPUs are exposed to the host as a resource. The Gunyah vCPU function
will register a resource ticket and be able to interact with the
hypervisor once the resource ticket is filled.

Resource tickets are the mechanism for functions to acquire ownership of
Gunyah resources. Gunyah functions can be created before the VM's
resources are created and made available to Linux. A resource ticket
identifies a type of resource and a label of a resource which the ticket
holder is interested in.

Resources are created by Gunyah as configured in the VM's devicetree
configuration. Gunyah doesn't process the label and that makes it
possible for userspace to create multiple resources with the same label.
Resource ticket owners need to be prepared for populate to be called
multiple times if userspace created multiple resources with the same
label.

Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/kvm/gunyah.c | 123 +++++++++++++++++++++++++++++++++++++++-
 include/linux/gunyah.h  |  42 +++++++++++++-
 2 files changed, 161 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kvm/gunyah.c b/arch/arm64/kvm/gunyah.c
index a3c29ae985c9..084ee1091770 100644
--- a/arch/arm64/kvm/gunyah.c
+++ b/arch/arm64/kvm/gunyah.c
@@ -330,6 +330,104 @@ int kvm_arm_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
 	}
 }
 
+static int gunyah_vm_add_resource_ticket(struct gunyah_vm *ghvm,
+				  struct gunyah_vm_resource_ticket *ticket)
+{
+	struct gunyah_vm_resource_ticket *iter;
+	struct gunyah_resource *ghrsc, *rsc_iter;
+	int ret = 0;
+
+	mutex_lock(&ghvm->resources_lock);
+	list_for_each_entry(iter, &ghvm->resource_tickets, vm_list) {
+		if (iter->resource_type == ticket->resource_type &&
+		    iter->label == ticket->label) {
+			ret = -EEXIST;
+			goto out;
+		}
+	}
+
+	list_add(&ticket->vm_list, &ghvm->resource_tickets);
+	INIT_LIST_HEAD(&ticket->resources);
+
+	list_for_each_entry_safe(ghrsc, rsc_iter, &ghvm->resources, list) {
+		if (ghrsc->type == ticket->resource_type &&
+		    ghrsc->rm_label == ticket->label) {
+			if (ticket->populate(ticket, ghrsc))
+				list_move(&ghrsc->list, &ticket->resources);
+		}
+	}
+out:
+	mutex_unlock(&ghvm->resources_lock);
+	return ret;
+}
+
+static void __gunyah_vm_remove_resource_ticket(struct gunyah_vm *ghvm,
+		struct gunyah_vm_resource_ticket *ticket)
+{
+	struct gunyah_resource *ghrsc, *iter;
+
+	list_for_each_entry_safe(ghrsc, iter, &ticket->resources, list) {
+		ticket->unpopulate(ticket, ghrsc);
+		list_move(&ghrsc->list, &ghvm->resources);
+	}
+	list_del(&ticket->vm_list);
+}
+
+static void gunyah_vm_remove_resource_ticket(struct gunyah_vm *ghvm,
+		struct gunyah_vm_resource_ticket *ticket)
+{
+
+	mutex_lock(&ghvm->resources_lock);
+	__gunyah_vm_remove_resource_ticket(ghvm, ticket);
+	mutex_unlock(&ghvm->resources_lock);
+}
+
+static void gunyah_vm_add_resource(struct gunyah_vm *ghvm,
+		struct gunyah_resource *ghrsc)
+{
+	struct gunyah_vm_resource_ticket *ticket;
+
+	mutex_lock(&ghvm->resources_lock);
+	list_for_each_entry(ticket, &ghvm->resource_tickets, vm_list) {
+		if (ghrsc->type == ticket->resource_type &&
+		    ghrsc->rm_label == ticket->label) {
+			if (ticket->populate(ticket, ghrsc))
+				list_add(&ghrsc->list, &ticket->resources);
+			else
+				list_add(&ghrsc->list, &ghvm->resources);
+			/* unconditonal -- we prevent multiple identical
+			 * resource tickets so there will not be some other
+			 * ticket elsewhere in the list if populate() failed.
+			 */
+			goto found;
+		}
+	}
+	list_add(&ghrsc->list, &ghvm->resources);
+found:
+	mutex_unlock(&ghvm->resources_lock);
+}
+
+static void gunyah_vm_clean_resources(struct gunyah_vm *ghvm)
+{
+	struct gunyah_vm_resource_ticket *ticket, *titer;
+	struct gunyah_resource *ghrsc, *riter;
+
+	mutex_lock(&ghvm->resources_lock);
+	if (!list_empty(&ghvm->resource_tickets)) {
+		pr_warn("Dangling resource tickets:\n");
+		list_for_each_entry_safe(ticket, titer, &ghvm->resource_tickets,
+					 vm_list) {
+			pr_warn("  %pS\n", ticket->populate);
+			__gunyah_vm_remove_resource_ticket(ghvm, ticket);
+		}
+	}
+
+	list_for_each_entry_safe(ghrsc, riter, &ghvm->resources, list) {
+		gunyah_rm_free_resource(ghrsc);
+	}
+	mutex_unlock(&ghvm->resources_lock);
+}
+
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 {
 	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
@@ -852,7 +950,9 @@ static void gunyah_vm_stop(struct gunyah_vm *ghvm)
 
 static int gunyah_vm_start(struct gunyah_vm *ghvm)
 {
-	int ret;
+	struct gunyah_rm_hyp_resources *resources;
+	struct gunyah_resource *ghrsc;
+	int i, n, ret;
 
 	down_write(&ghvm->status_lock);
 	if (ghvm->vm_status != GUNYAH_RM_VM_STATUS_NO_STATE) {
@@ -887,6 +987,22 @@ static int gunyah_vm_start(struct gunyah_vm *ghvm)
 	}
 	ghvm->vm_status = GUNYAH_RM_VM_STATUS_READY;
 
+	ret = gunyah_rm_get_hyp_resources(ghvm->rm, ghvm->vmid, &resources);
+	if (ret) {
+		pr_warn("Failed to get hyp resources for VM: %d\n", ret);
+		goto err;
+	}
+
+	for (i = 0, n = le32_to_cpu(resources->n_entries); i < n; i++) {
+		ghrsc = gunyah_rm_alloc_resource(ghvm->rm,
+						 &resources->entries[i]);
+		if (!ghrsc) {
+			ret = -ENOMEM;
+			goto err;
+		}
+		gunyah_vm_add_resource(ghvm, ghrsc);
+	}
+
 	ret = gunyah_rm_vm_start(ghvm->rm, ghvm->vmid);
 	if (ret) {
 		pr_warn("Failed to start VM: %d\n", ret);
@@ -915,6 +1031,9 @@ static struct gunyah_vm *gunyah_vm_alloc(struct gunyah_rm *rm)
 	init_rwsem(&ghvm->status_lock);
 	init_waitqueue_head(&ghvm->vm_status_wait);
 	ghvm->vm_status = GUNYAH_RM_VM_STATUS_NO_STATE;
+	mutex_init(&ghvm->resources_lock);
+	INIT_LIST_HEAD(&ghvm->resources);
+	INIT_LIST_HEAD(&ghvm->resource_tickets);
 
 	return ghvm;
 }
@@ -930,6 +1049,8 @@ static void gunyah_destroy_vm(struct gunyah_vm *ghvm)
 	if (ghvm->vm_status == GUNYAH_RM_VM_STATUS_RUNNING)
 		gunyah_vm_stop(ghvm);
 
+	gunyah_vm_clean_resources(ghvm);
+
 	if (ghvm->vm_status == GUNYAH_RM_VM_STATUS_EXITED ||
 	    ghvm->vm_status == GUNYAH_RM_VM_STATUS_READY ||
 	    ghvm->vm_status == GUNYAH_RM_VM_STATUS_INIT_FAILED) {
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 40ea21b17195..573e3bbd4cb6 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/interrupt.h>
 #include <linux/limits.h>
+#include <linux/list.h>
 #include <linux/types.h>
 #include <linux/kvm_host.h>
 
@@ -18,6 +19,8 @@
 #define kvm_to_gunyah(kvm_ptr) \
 	container_of(kvm_ptr, struct gunyah_vm, kvm)
 
+struct gunyah_vm;
+
 /* Matches resource manager's resource types for VM_GET_HYP_RESOURCES RPC */
 enum gunyah_resource_type {
 	/* clang-format off */
@@ -35,10 +38,39 @@ struct gunyah_resource {
 	enum gunyah_resource_type type;
 	u64 capid;
 	unsigned int irq;
-
+	struct list_head list;
 	u32 rm_label;
 };
 
+/**
+ * struct gunyah_vm_resource_ticket - Represents a ticket to reserve access to VM resource(s)
+ * @label: Label of the resource from resource manager this ticket reserves.
+ * @vm_list: for @gunyah_vm->resource_tickets
+ * @resources: List of resource(s) associated with this ticket
+ *             (members are from @gunyah_resource->list)
+ * @resource_type: Type of resource this ticket reserves
+ * @populate: callback provided by the ticket owner and called when a resource is found that
+ *            matches @resource_type and @label. Note that this callback could be called
+ *            multiple times if userspace created mutliple resources with the same type/label.
+ *            This callback may also have significant delay after gunyah_vm_add_resource_ticket()
+ *            since gunyah_vm_add_resource_ticket() could be called before the VM starts.
+ * @unpopulate: callback provided by the ticket owner and called when the ticket owner should no
+ *              longer use the resource provided in the argument. When unpopulate() returns,
+ *              the ticket owner should not be able to use the resource any more as the resource
+ *              might being freed.
+ */
+struct gunyah_vm_resource_ticket {
+	u32 label;
+	struct list_head vm_list;
+	struct list_head resources;
+	enum gunyah_resource_type resource_type;
+	bool (*populate)(struct gunyah_vm_resource_ticket *ticket,
+			 struct gunyah_resource *ghrsc);
+	void (*unpopulate)(struct gunyah_vm_resource_ticket *ticket,
+			   struct gunyah_resource *ghrsc);
+};
+
+
 /**
  * struct gunyah_vm - Main representation of a Gunyah Virtual machine
                               memory shared with the guest.
@@ -49,6 +81,9 @@ struct gunyah_resource {
  * @vm_status: Current state of the VM, as last reported by RM
  * @vm_status_wait: Wait queue for status @vm_status changes
  * @status_lock: Serializing state transitions
+ * @resource_lock: Serializing addition of resources and resource tickets
+ * @resources: List of &struct gunyah_resource that are associated with this VM
+ * @resource_tickets: List of &struct gunyah_vm_resource_ticket
  * @auth: Authentication mechanism to be used by resource manager when
  *        launching the VM
  */
@@ -56,12 +91,13 @@ struct gunyah_vm {
 	u16 vmid;
 	struct kvm kvm;
 	struct gunyah_rm *rm;
-
 	struct notifier_block nb;
 	enum gunyah_rm_vm_status vm_status;
 	wait_queue_head_t vm_status_wait;
 	struct rw_semaphore status_lock;
-
+	struct mutex resources_lock;
+	struct list_head resources;
+	struct list_head resource_tickets;
 	enum gunyah_rm_vm_auth_mechanism auth;
 };
 
-- 
2.39.5


