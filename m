Return-Path: <linux-arm-msm+bounces-55410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AA5A9B062
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5E9F4A3EA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:16:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A2627FD55;
	Thu, 24 Apr 2025 14:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YyLEy0uC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A8325A65F
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504037; cv=none; b=Xf4gmako7QbcwVpNrAvm1HeZ3R0J+DsP6jOEbRMSpsqCO7bTJYOlmoShWbIpVtF8HZ63mtoveeSwlfUOsQWtXzpDdYOGuvhPsrjuq7Hi+ssmZS2q0J9mc/CwmmtmpbDXSIV7q+R1cLy5JpOmBHxihwgLjuSw8pfwpB81BzPYLLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504037; c=relaxed/simple;
	bh=62G1u7Mmcj0LoLg/GsZOxRpsdU6hf0LcgEiDACKmXjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rpm8l0EDvFeWRDvxROo9+TkOJ+lV5DLc1Seu0Phcy5gtClJdpBi/HiiqkSIdrWgIcDls1lgIOuDRr+0/pSqBljH0I2LQsq2fO84wr/hkZestEKLt+a98GssOXETSSIYFlAGWTibh+BnufwykfZdK3VBJLNqMpDkMl5/zdV0e5q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YyLEy0uC; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39d83782ef6so1647886f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504031; x=1746108831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvSif0ZiFcbo45REElIUdI7xtRbISNuAr1Y97HbCqdI=;
        b=YyLEy0uC+aKHIkM4oaNNOOvTEZxl/5B4cXMJWSiA5CH0VKETdRs1XxMP9euG6CgE2e
         Z23rgG1SUAKMC/rdVHWjNbC+XWmyfueGcOirkOcsGMCQPLCujAKCkPge1SHWgctMolRg
         VsK7AbhITHdDJZ/mZTkqKU2opmMA5akZbn1I1JWbXeLTDgeuLCR+bqweC7o3r8fqG0JP
         rvxIZ6AW6JAFEQIIudhQnHCQgdgEg6zG4+kSRQJN8FbIPXzyGwglOHS25g10OTkEfunL
         lbyuyS6pqq7X1Q8tQ/K+fZGkXN0vkHcZtBXrR60SkIIevTg4zC9iJj8ScVY3BHkXRwUW
         mzag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504031; x=1746108831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvSif0ZiFcbo45REElIUdI7xtRbISNuAr1Y97HbCqdI=;
        b=hX8n9gr/7pQ2NPvF3U2yVlX8zs3TjfV2ivfOo+qXEg1gJGl6EaXRR4NnjtG20U5GHB
         9U+92vJMH8VOORA1XnqfnmzWoh7VbaTrgk23lz6V3FEcx/Qczb0V5sTqscPS6yoLUZTf
         4ruDVfDF5IMmWWF8PZrKxnXX1JlTzBh+D9PAg44nSgDjuQkJ67B4TIJxjJGeaAYDCku8
         XVPUTOO4sS161m+LD4KsDYFJFmsImVpZKMMr/RD0DUJ1mSMin4wz5YSFpW4Wo3UCtmRg
         ANsCLLdSLLqH800m8T9IY2jSfvwxUEacNyrrJaSgVe5Nlm0aL6ir/oRJ/bQOjxcxcqOf
         PI+g==
X-Forwarded-Encrypted: i=1; AJvYcCUEAcgS9K/3dCZmvVCDdea2ta7FkpMN9/QbgjI5JYt9+FFsZVUzYDsFGjQdZuFIGv6rgJJ82uBf/ZRto3uq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5VtP+QlfnutJGg0f8+R6zmAyreziccJE+pKk2oWwAk5rogF2n
	DOPcbGslO2bBg1YpjktQyCnHZ50ECPQGAcbEA/JSdDtLYG/gPC356ZOoQq/0Dd8=
X-Gm-Gg: ASbGncting8RsHUb3Gzox+GGxYrGAGmvv74K4+/PfOZccdrIQNuYqjL5hlJ6LYN+K1q
	esAmqGCDtMIapfSfXCSCm0fz37u65UmkLHdBCVebX9TnU1AQIiO4OOHJvHeb2tGYwvM1ljH4uAq
	3yQXgugVZCsDx0IQY3F8nLupgC1G10+X7C9FWBxe+pTPfO7HfXFzyvu9ZF6lGf4nSQ8vgMhpPKo
	8FN1OV9OtGW+E1gmenwavjWSZQ93G6CcKjBts7nYSYJF4a6LJan8fsaNQenpcHbZvfxe/IlxW3l
	Cb2/IVoiVY76mfxg27bUpgqKEaEX7EdSU0GPjG6QKP6HVBmgny4AoecaewXAlC9BIvh9sfQU+Qp
	3QnVnF2euL4ziISWy
X-Google-Smtp-Source: AGHT+IGs6TOHidyOdLjO/aiH4v937+mffmDnW0sidZAyNfcPHTexYT+C0CxkEqdPf2DwJcaHqEXYnw==
X-Received: by 2002:adf:ebcc:0:b0:39c:1efb:eec9 with SMTP id ffacd0b85a97d-3a06d673778mr1956533f8f.13.1745504031472;
        Thu, 24 Apr 2025 07:13:51 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:51 -0700 (PDT)
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
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [RFC PATCH 05/34] KVM: Add KVM_SET_DTB_ADDRESS ioctl to pass guest DTB address from userspace
Date: Thu, 24 Apr 2025 15:13:12 +0100
Message-Id: <20250424141341.841734-6-karim.manaouil@linaro.org>
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

Some hypervisors, such as Gunyah, require access to the guest's
device tree blob (DTB) in order to inspect and/or modify it before
starting the guest. The userspace virtual machine monitor (e.g. QEMU)
is responsible for loading the guest's DTB into memory at a guest
physical address, but the hypervisor backend must be informed of that
address and size.

To support this use case, introduce a new ioctl: KVM_SET_DTB_ADDRESS.
This allows userspace to provide the guest physical address and size
of the DTB via a `struct kvm_dtb`, which is now stored in `struct kvm`.

The ioctl allows platform-specific backends like Gunyah to retrieve
the DTB location when configuring the VM.

This patch also increments the KVM API version to 13 to reflect the
addition of this new ioctl.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 include/linux/kvm_host.h |  1 +
 include/uapi/linux/kvm.h | 14 ++++++++++----
 virt/kvm/kvm_main.c      |  8 ++++++++
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3461346b37e0..4e98c7cad2bd 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -862,6 +862,7 @@ struct kvm {
 	/* Protected by slots_locks (for writes) and RCU (for reads) */
 	struct xarray mem_attr_array;
 #endif
+	struct kvm_dtb dtb;
 	char stats_id[KVM_STATS_NAME_SIZE];
 };
 
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index c6988e2c68d5..8f8161cd61a7 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -14,7 +14,7 @@
 #include <linux/ioctl.h>
 #include <asm/kvm.h>
 
-#define KVM_API_VERSION 12
+#define KVM_API_VERSION 13
 
 /*
  * Backwards-compatible definitions.
@@ -43,6 +43,11 @@ struct kvm_userspace_memory_region2 {
 	__u64 pad2[14];
 };
 
+struct kvm_dtb {
+	__u64 guest_phys_addr;
+	__u64 size;
+};
+
 /*
  * The bit 0 ~ bit 15 of kvm_userspace_memory_region::flags are visible for
  * userspace, other bits are reserved for kvm internal use which are defined
@@ -1190,11 +1195,12 @@ struct kvm_vfio_spapr_tce {
 #define KVM_SET_IDENTITY_MAP_ADDR _IOW(KVMIO,  0x48, __u64)
 #define KVM_SET_USER_MEMORY_REGION2 _IOW(KVMIO, 0x49, \
 					 struct kvm_userspace_memory_region2)
+#define KVM_SET_DTB_ADDRESS      _IOW(KVMIO, 0x50, struct kvm_dtb)
 
 /* enable ucontrol for s390 */
-#define KVM_S390_UCAS_MAP        _IOW(KVMIO, 0x50, struct kvm_s390_ucas_mapping)
-#define KVM_S390_UCAS_UNMAP      _IOW(KVMIO, 0x51, struct kvm_s390_ucas_mapping)
-#define KVM_S390_VCPU_FAULT	 _IOW(KVMIO, 0x52, unsigned long)
+#define KVM_S390_UCAS_MAP        _IOW(KVMIO, 0x55, struct kvm_s390_ucas_mapping)
+#define KVM_S390_UCAS_UNMAP      _IOW(KVMIO, 0x56, struct kvm_s390_ucas_mapping)
+#define KVM_S390_VCPU_FAULT	 _IOW(KVMIO, 0x57, unsigned long)
 
 /* Device model IOC */
 #define KVM_CREATE_IRQCHIP        _IO(KVMIO,   0x60)
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index dbb7ed95523f..a984051e2470 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5121,6 +5121,14 @@ static long kvm_vm_ioctl(struct file *filp,
 		r = kvm_vm_ioctl_set_memory_region(kvm, &mem);
 		break;
 	}
+	case KVM_SET_DTB_ADDRESS: {
+		r = 0;
+		if (copy_from_user(&kvm->dtb, argp, sizeof(struct kvm_dtb))) {
+			r = -EFAULT;
+			goto out;
+		}
+		break;
+	}
 	case KVM_GET_DIRTY_LOG: {
 		struct kvm_dirty_log log;
 
-- 
2.39.5


