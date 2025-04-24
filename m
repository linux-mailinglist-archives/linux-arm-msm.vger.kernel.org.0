Return-Path: <linux-arm-msm+bounces-55432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D522A9B0AA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD79D3AEC4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 296B8293B7F;
	Thu, 24 Apr 2025 14:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P3uDnySM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795ED2918E4
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504066; cv=none; b=PH9Yj9qHyc0eJtZ74hLbGOmPvtxbHDQiB7WbXYI6LPjZ0QO510onwfv/HHU2aT8hs4e8PspkAKE6QRfeCBk/26EOrz27LuXphGIP3SatklX4VZIz/FuJEl92hu43WQwKksmmZ2aOeiBZQTtPKLRxKb/R2enM00NJ5oV8Ff9Prt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504066; c=relaxed/simple;
	bh=Yi4ZtnxtwEwwcGq5Pu3T2/cALo63bY4y5tVWXmp+Y3c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O6mrpRaYeD8jO7Frt3bTgyvaevbLJj410EEDk0Roa02xNSPV7zGtJ/q3lXNrJ0bsb1P0GqLw/h4l6XT5cI24OSo+kKS6M7IJHpao0ip0vHNhAskYXBCZPFNG00xIGzv0DaufkjSrNn5wb6m25Okvc0/0s/lqi0QW+IF7i6kjNYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P3uDnySM; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c0dfba946so793954f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504061; x=1746108861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqI809F7wKcnGZMELURBH0WwNUVNARNAdRqZ1Gwku8c=;
        b=P3uDnySMxJTWQ7/cn0c6QZfS+2mrcsS4YkITm9Jqvkwwd5JKcVX1YIHlyx536M/Icz
         4zoZfnwIj3oiZI26ksGkdThqhKWvQPNuKpAtg0fkVVqb0ht0/qc+RXXvjh9+I7NEmj82
         l2vILtAz+xiQF9fd9P4TADL3bYT0NkFm03GbsGx9OF16fSnpc8NRO2c8JfG9wsP2i7AG
         5RmNr/QZ9Rn4X7SQjxqek8nWQOPb2h12lqjSgAFaeCHojqBNfD7Rc22d4ZYqnlClkN05
         bPkc1avSLqwWPj47rGA9wVVzjqkp1NktobmDDPe/qldAM3KePajlpvrZKB615gfDflo7
         4MJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504061; x=1746108861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KqI809F7wKcnGZMELURBH0WwNUVNARNAdRqZ1Gwku8c=;
        b=bnxXKXfbHxfzUcUZawpr1GbM7zrXE85v/4O032gsseH7nQyMJeEyHkhd+Vr0Qb6zd3
         ZWtUM+WRAhY+nZw0Kkw9PDSQVbnlmTBd6MZfWeiMVbZhizVblWyw1tvkp7AdAp/mvmmt
         ITUc+CXMHTsThSUXm2T8xoQpMyF2Q6urMTBHLe7E8dQB99f0Xf2MAnkujnieeWKa5fd2
         Iovvv+qbu0Gp9NCmgo4iqYjWAzOVgPPnN7xUeVFEPo3Nz5MsMIJyYTsLs4Sj3s4YzM+F
         nGbKwPdcMkoRNcPqaXGijmFDskRh+PoYCWRJeWlezNVi1hzqqBfuS+9tHXnrBtUXBRAk
         biSA==
X-Forwarded-Encrypted: i=1; AJvYcCW+7UR9wUwk4AnvJixYCnFvbTUO2xPBSt57UJGnwWu04GI+JOu2/sS0McvX4Nu/G+8/RRjCszvz7taS5PJz@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn4VIbQXNmiysrt/Ghk5DwMpdlhU3daZtBKJXMtfXM7dodhkJE
	bfdQ1+LvXJGpGhfvbZ5SxBLIK2lKaiL9xIa+CX7f+TM2OrXQ7j/vwl5MP2qJ3xs=
X-Gm-Gg: ASbGnctlhXpPqgChbjD8DVE5kyAUdAkL2lrW9cAz11qw+fWcFYvfWE0sXWvvqoIdqZ0
	G9Lzl9LGz/gtHjhXYSUbbIWGXeIVI/vKv4TuE7tRg1k0a23uvUGYNc1PGdsVMza1/SOYMWeBIfG
	VGsLzVKwEhkXrvolONyXJF5SYBY6OLV4Auu31JSPlqEm3+4bmovcI30FRc4hZf1Si75WN0EgLZF
	7aDJUWY4S+1QxB6M8WG9IrIqUBhk2Iljgx6X4iBGESQf+tLzyBKQS5OTyPYZ6zfowkM8l+BiKuO
	rleDsSrmmrr9VI57hYmwir4UE2/At9jnj+0jCwhqw/bHHc7a+Zn8deSgR+SlO94iYxxLqfkZRQ3
	32JPOGTH39PgrzmSn
X-Google-Smtp-Source: AGHT+IHu0xINB3AI0ORmGPEOw/RldxQp1Lf0CLnYLBWHSDl9/V/LyKw8BRQRYMCgyV0pnZHvllr1jA==
X-Received: by 2002:a5d:584e:0:b0:39a:c9ac:cd3a with SMTP id ffacd0b85a97d-3a06cfa9c91mr2435184f8f.51.1745504061234;
        Thu, 24 Apr 2025 07:14:21 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:20 -0700 (PDT)
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
Subject: [RFC PATCH 27/34] gunyah: Share guest VM dtb configuration to Gunyah
Date: Thu, 24 Apr 2025 15:13:34 +0100
Message-Id: <20250424141341.841734-28-karim.manaouil@linaro.org>
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

Gunyah Resource Manager sets up a virtual machine based on a device tree
which lives in guest memory. Resource manager requires this memory to be
provided as a memory parcel for it to read and manipulate. Construct a
memory parcel, lend it to the virtual machine, and inform resource
manager about the device tree location (the memory parcel ID and offset
into the memory parcel).

Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/kvm/gunyah.c | 27 ++++++++++++++++++++++++---
 include/linux/gunyah.h  | 10 ++++++++++
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/gunyah.c b/arch/arm64/kvm/gunyah.c
index ef0971146b56..687f2beea4e7 100644
--- a/arch/arm64/kvm/gunyah.c
+++ b/arch/arm64/kvm/gunyah.c
@@ -699,8 +699,7 @@ static int gunyah_reclaim_memory_parcel(struct gunyah_vm *ghvm,
 	if (parcel->mem_handle != GUNYAH_MEM_HANDLE_INVAL) {
 		ret = gunyah_rm_mem_reclaim(ghvm->rm, parcel);
 		if (ret) {
-			dev_err(ghvm->parent, "Failed to reclaim parcel: %d\n",
-				ret);
+			pr_err("Failed to reclaim parcel: %d\n", ret);
 			/* We can't reclaim the pages -- hold onto the pages
 			 * forever because we don't know what state the memory
 			 * is in
@@ -1574,6 +1573,7 @@ static void gunyah_vm_stop(struct gunyah_vm *ghvm)
 
 static int gunyah_vm_start(struct gunyah_vm *ghvm)
 {
+	struct kvm *kvm = &ghvm->kvm;
 	struct gunyah_rm_hyp_resources *resources;
 	struct gunyah_resource *ghrsc;
 	int i, n, ret;
@@ -1597,7 +1597,18 @@ static int gunyah_vm_start(struct gunyah_vm *ghvm)
 	ghvm->vmid = ret;
 	ghvm->vm_status = GUNYAH_RM_VM_STATUS_LOAD;
 
-	ret = gunyah_rm_vm_configure(ghvm->rm, ghvm->vmid, ghvm->auth, 0, 0, 0, 0, 0);
+	ghvm->dtb.parcel_start = gpa_to_gfn(kvm->dtb.guest_phys_addr);
+	ghvm->dtb.parcel_pages = gpa_to_gfn(kvm->dtb.size);
+	ret = gunyah_share_memory_parcel(ghvm, &ghvm->dtb.parcel,
+					 ghvm->dtb.parcel_start,
+					 ghvm->dtb.parcel_pages);
+	if (ret) {
+		pr_warn("Failed to allocate parcel for DTB: %d\n", ret);
+		goto err;
+	}
+
+	ret = gunyah_rm_vm_configure(ghvm->rm, ghvm->vmid, ghvm->auth,
+			ghvm->dtb.parcel.mem_handle, 0, 0, 0, kvm->dtb.size);
 	if (ret) {
 		pr_warn("Failed to configure VM: %d\n", ret);
 		goto err;
@@ -1698,6 +1709,16 @@ static void gunyah_destroy_vm(struct gunyah_vm *ghvm)
 	if (ghvm->vm_status == GUNYAH_RM_VM_STATUS_RUNNING)
 		gunyah_vm_stop(ghvm);
 
+	if (ghvm->vm_status == GUNYAH_RM_VM_STATUS_LOAD ||
+	    ghvm->vm_status == GUNYAH_RM_VM_STATUS_READY ||
+	    ghvm->vm_status == GUNYAH_RM_VM_STATUS_INIT_FAILED) {
+		ret = gunyah_reclaim_memory_parcel(ghvm, &ghvm->dtb.parcel,
+						 ghvm->dtb.parcel_start,
+						 ghvm->dtb.parcel_pages);
+		if (ret)
+			pr_err("Failed to reclaim DTB parcel: %d\n", ret);
+	}
+
 	gunyah_vm_remove_resource_ticket(ghvm, &ghvm->addrspace_ticket);
 	gunyah_vm_remove_resource_ticket(ghvm, &ghvm->host_shared_extent_ticket);
 	gunyah_vm_remove_resource_ticket(ghvm, &ghvm->host_private_extent_ticket);
diff --git a/include/linux/gunyah.h b/include/linux/gunyah.h
index 1d363ab8967a..72aafc813664 100644
--- a/include/linux/gunyah.h
+++ b/include/linux/gunyah.h
@@ -94,6 +94,12 @@ struct gunyah_vm_resource_ticket {
  * @resource_tickets: List of &struct gunyah_vm_resource_ticket
  * @auth: Authentication mechanism to be used by resource manager when
  *        launching the VM
+ * @dtb: For tracking dtb configuration when launching the VM
+ * @dtb.parcel_start: Guest frame number where the memory parcel that we lent to
+ *                    VM (DTB could start in middle of folio; we lend entire
+ *                    folio; parcel_start is start of the folio)
+ * @dtb.parcel_pages: Number of pages lent for the memory parcel
+ * @dtb.parcel: Data for resource manager to lend the parcel
  */
 struct gunyah_vm {
 	u16 vmid;
@@ -113,6 +119,10 @@ struct gunyah_vm {
 	struct gunyah_vm_resource_ticket host_shared_extent_ticket;
 	struct gunyah_vm_resource_ticket guest_private_extent_ticket;
 	struct gunyah_vm_resource_ticket guest_shared_extent_ticket;
+	struct {
+		gfn_t parcel_start, parcel_pages;
+		struct gunyah_rm_mem_parcel parcel;
+	} dtb;
 };
 
 /**
-- 
2.39.5


