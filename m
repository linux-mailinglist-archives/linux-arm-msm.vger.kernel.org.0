Return-Path: <linux-arm-msm+bounces-55406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CA5A9B051
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:14:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB4CC1B667E7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:14:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94D81B0406;
	Thu, 24 Apr 2025 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d4ub933F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1A81A0B08
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504030; cv=none; b=rsZ1O3XU1d/QX+M6TYopDkNznDFy2Di3FLPBoPtKLw4KkQ1ktH9ynGTBQcfssnxeptPuG5nvbx/S51RAXYKlwwpmJbxWpuFwW1EfUihjCTgBvdJInVCx3AYUa8SWciIH+zhMg/4nY/QvHSl5aJTAlPWFKw32h/dDZVjSieOHIoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504030; c=relaxed/simple;
	bh=g59SsG0N84wb4f6piJJJcigRQ9wXVyh8p4R6BkHSxiU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s5kFjecHTJr3xP2COsbnIBAu68og4eusBJ+P4DU53LVfwEHYvd0Ciuu3DXoVu+xtlHtlYrsPyqqjuC6PKQkJh2wvTDbQk/0Uw2RUvEt30YwTNhknMFzsSVFfg8KDEcIF9XC31/yVQa3KCjhFN/xA2bUSG0vMREClPbINEK8o36Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d4ub933F; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c266c1389so744582f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504026; x=1746108826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pJfw58KOVJlcvsi2YwD0da6h5VnpsCyDZ/he/rc1kk=;
        b=d4ub933FvrTaDPxCrebBqFETW/r4aHP5Zgr0uloJ5fW2q1BgsSLYE9WfvREpVpK5Yz
         rFlJg17xycIpGpNDwGK1zzI7gb73tqT1kOVRMlGs7gMFeSid/hTjvGdK6tahBOKODrA9
         MIxU7d7+HD7laNzNMfGSRvGavpy/f6Zy7eHGHmV0O8Ii55ik8j1NGSeVDdWQlkcSaI6z
         le/xGuUuVHwERSloTou3x5Ocpx3XILcqiE2eyLPMMyRuEnmmiAM+J8jK63LuX3uz/rpZ
         y4zVZGqKyx6CMRrPLhtw2EZmfxMNZSgCyjBgTPAQ6bb1QZRnylv5EaQbwNSG0ZYHJqTG
         uOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504027; x=1746108827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9pJfw58KOVJlcvsi2YwD0da6h5VnpsCyDZ/he/rc1kk=;
        b=jH9cEj+/AJ9xI4FMxfUOOG766CuM9Zaflzm+hxlFSJXSY2Fa2DSEmfrNWIAniqN9YF
         6Z4+lFr+Pw82rAY13jrSBIn3D30Oq5dKf6YJ4U7/nEhjEf9lXs4plghbUy0ngJjUeq0e
         HlSQ48jTiOSlSERHMIiQgd87X41WSFZ5bex4Ht6BVtpkT4X90HAgP+Ric4fvoXBXVbs4
         9C38CmTcZnasvHOzk97+lxjTVugGnDsXYKm/VKhTYiGmhN/NB9B2hYyCkaPGssgztd+D
         Rs4QHEcWMnRp0Ckki0I2MmG0dLQG7zQaVwqT2nYBMkXPplpBpfKgPPr47EHdnGu29Qki
         VYuA==
X-Forwarded-Encrypted: i=1; AJvYcCV/RDx7q48UDeWjJCiGvlNYh+btNCn4HHQ/RRB3CIDw54HZKEfdqKf2hvxb/tDlcwbW/RO44Ekl5UTTjpI8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjvf1UbGiXGwX5Pj+SEQnbd7/CCgE0Mxl9SvdwFzoeO7ngFOwB
	cT8lGYE9+rPFLkhI1rtGVdRE//6uZIub1HHp7+4nIphuffH/Kr+NVuPG7bRLnro=
X-Gm-Gg: ASbGncsv8/47Qr6cYOJPrDXqKLZyp92DF8zy+msUOgda5rJezvSDtGDxxUJn/VZmTTf
	GXRYHnSk+kwFkFG3AC0EMbX/iBwaWl05E8C+N8i246630+L0ODxn2rVO/TfzyKju2ny0vhlOmyv
	dyFKsin1mDwwD8XmjVCnAvAkj1HDRpXJbK2giRpi4dIx8jp/MC6o8kU6dTI14tckwtRARcXfG3I
	EouO0QSlCRw3Kt6R16ttvIrCjVG1PXypt83FcMjgPRZrj4I+zRcrq8l9vkWowGn4fg2mf2P2hLH
	35gaEIP68xN4Fn884+YgQzsGdntvvDyucWJnJRIsVVbLwopWAxVek9OYADXFRfXuBa4kgeFNOyk
	nUEYMJVkd4hPUqGcN
X-Google-Smtp-Source: AGHT+IGfRrIJRrexUH30juVxzQxuzQYHkS7hGTbMmJLV2Lp0+vmOpc/tkASkqUk2GbTXQepziYNH6A==
X-Received: by 2002:a05:6000:2510:b0:391:304f:34e7 with SMTP id ffacd0b85a97d-3a06cfab9abmr2560733f8f.44.1745504026564;
        Thu, 24 Apr 2025 07:13:46 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:46 -0700 (PDT)
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
Subject: [RFC PATCH 01/34] KVM: Allow arch-specific vCPU allocation and freeing
Date: Thu, 24 Apr 2025 15:13:08 +0100
Message-Id: <20250424141341.841734-2-karim.manaouil@linaro.org>
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

Gunyah KVM backend [1] requires custom vCPU allocation to associate
architecture-specific state with each virtual CPU. The generic KVM
core currently allocates vCPUs directly using the kvm_vcpu_cache slab,
which does not allow architecture code to intervene in the allocation
process.

Introduce two weakly-defined functions, kvm_arch_vcpu_alloc() and
kvm_arch_vcpu_free(), which default to using kmem_cache_zalloc()
and kmem_cache_free() respectively. Architectures can override
these functions to implement custom vCPU allocation behavior.

Replace all direct allocations and frees of vCPUs in kvm_main.c
with calls to these helper functions to allow arch-specific
substitution.

This change is required to support architectures such as Gunyah
that must allocate architecture-private state along with the vCPU.

[1] https://github.com/quic/gunyah-hypervisor

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 16 +++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 1dedc421b3e3..3461346b37e0 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1581,6 +1581,8 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id);
 int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu);
+struct kvm_vcpu *kvm_arch_vcpu_alloc(void);
+void kvm_arch_vcpu_free(struct kvm_vcpu *vcpu);
 
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
 int kvm_arch_pm_notifier(struct kvm *kvm, unsigned long state);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 69782df3617f..dbb7ed95523f 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -476,7 +476,7 @@ static void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
 	put_pid(vcpu->pid);
 
 	free_page((unsigned long)vcpu->run);
-	kmem_cache_free(kvm_vcpu_cache, vcpu);
+	kvm_arch_vcpu_free(vcpu);
 }
 
 void kvm_destroy_vcpus(struct kvm *kvm)
@@ -4067,6 +4067,16 @@ static void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu)
 }
 #endif
 
+struct kvm_vcpu __attribute__((weak)) *kvm_arch_vcpu_alloc(void)
+{
+	return kmem_cache_zalloc(kvm_vcpu_cache, GFP_KERNEL_ACCOUNT);
+}
+
+void __attribute__((weak)) kvm_arch_vcpu_free(struct kvm_vcpu *vcpu)
+{
+	return kmem_cache_free(kvm_vcpu_cache, vcpu);
+}
+
 /*
  * Creates some virtual cpus.  Good luck creating more than one.
  */
@@ -4103,7 +4113,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 	kvm->created_vcpus++;
 	mutex_unlock(&kvm->lock);
 
-	vcpu = kmem_cache_zalloc(kvm_vcpu_cache, GFP_KERNEL_ACCOUNT);
+	vcpu = kvm_arch_vcpu_alloc();
 	if (!vcpu) {
 		r = -ENOMEM;
 		goto vcpu_decrement;
@@ -4182,7 +4192,7 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, unsigned long id)
 vcpu_free_run_page:
 	free_page((unsigned long)vcpu->run);
 vcpu_free:
-	kmem_cache_free(kvm_vcpu_cache, vcpu);
+	kvm_arch_vcpu_free(vcpu);
 vcpu_decrement:
 	mutex_lock(&kvm->lock);
 	kvm->created_vcpus--;
-- 
2.39.5


