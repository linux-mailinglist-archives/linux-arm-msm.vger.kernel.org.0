Return-Path: <linux-arm-msm+bounces-55408-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFACDA9B05A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:14:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB66F7AB05E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2F02253B7;
	Thu, 24 Apr 2025 14:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJZId15e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDAB31A072C
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504032; cv=none; b=uVKL/Ms/fzrTDFqiLC4jCMci0YI2BtJJJaHnP4Az4UlDep5VoiOROiG5ailCdB8T9wEShjckBhDqSFOvtigWGDIwZeJz3nhUj9BzjP6osF3D+M+zV2TRJmAUEZHIwu9pc/4ZtaNMKRoGdXHG/Uoen2ajJYYuWK66Casa+xZ+0og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504032; c=relaxed/simple;
	bh=wzaNO/FV98NvOhVwcurDeWV9o2lzkiDEMgzO9vOQkfc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cglXseCeQv31UJ2WRFoykt9TPoErkci5tYixzvUyoEeAtCGdLpOCyVj+nZ0x5VjMfaFaRDlVBu/xBVElq2g62LkQytILUoxwXDBEyXe8AL7qEUNjTwQ63E8OY8CIv/HefpHSbvSMoLZaVZEu7ULgK9MKVP83KG/IK0igdU+unSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJZId15e; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39ee651e419so653747f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504029; x=1746108829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Hk5UBQTvuxPsQW0619Tu3I4qsqkftwTtmBE5Ybb85g=;
        b=AJZId15e7pdgeqWr+FMAv4lLCiYL8lS9X4n246zeYuB5IaR/DGRrpcovPDeJif1ult
         pCCP+lQCy1PBuRRsue4enbNhuItViUP50zrTPxmT0nYVJuKw/mn8cCZ5OQlhg6eDHW9M
         a05wR8Ubv3dLoceKbyhzZ/riusaGcx+r9eKtqhXZP/YlnDIR6V5OqRyMhOR7PXfzMpu9
         bd39oniRh5fAZXnOSJ6Smcyyg/jnOY7Ep8YHqXr5Ac8Lg6Ki8jPdYS6b+DDfyDjPiHA+
         KmVtSGfJ5KzOQuk2U26Ugg9Q5sqD/HC/WlFq2brgPR9T1soyDON1tKSxraJ1r6NZZ3nr
         p44Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504029; x=1746108829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Hk5UBQTvuxPsQW0619Tu3I4qsqkftwTtmBE5Ybb85g=;
        b=FSNkpKcZ2ZmCvc7zZbEU7Y3or8RvC+1htiCWVY9os/pZh54Oc79di3xdaqQXHvupLw
         SPxobCF5h+tZs8r+u2odC8e0pH2+jbbbwJdLI5QeJW2THXo5ACQlaemblGuXUSpSHpNf
         ixxYpanvfTtodXOjD7BGABW90RZI1CRm562oUFog8+on26+5y+dUJad17ouGf8RhcOXw
         UeGulNe8HIi+VVe/vYdY3yjxPZER7a/0U8jj9LzIwwk1htpW3i7Ob/1Vv4jrjgylGgM8
         BjVcS41YV5OckD3t/K7DrqxNDDqvxtdpBZ0muQ525rDGwd5Y9aGJfDaFIaEG7wJPTbJC
         LS5g==
X-Forwarded-Encrypted: i=1; AJvYcCXbO+myVrXNQZ9hLpseTm/EOgkl4DeBEBL90h8vj/93JWk2BsC/hyo2zYZVZnwWWWUrsPIG3a7Rlj0s9cMB@vger.kernel.org
X-Gm-Message-State: AOJu0YwpZO/xy7wC+IhUIwAJNI+h2KVb1oaQpeXQbGIxw37W6xFvo8nw
	0eSWCbUnUK414vT+RorsUtaFPhrinN4Eph3kyxxdg+rkIWaJ/GYASHxcvmVSj7E=
X-Gm-Gg: ASbGncuHLmQyj/DOZnBOIIG839AC8yi1hXuq+QE1/Ld1KxNPn3zusyajcrORWYM7+xS
	DUNPQzipdSX5LqqwHz/J2aQdaVEnu6gyKVmJnA65SqKcYtNoBb7c0Utt6m1muozNSdAVwklMZYe
	RAlTwMsqjSOVlA0Pv8st3pihxSrQ4Ms8xcXf7AdpmtTNF9KsGIXUHDJS6toFAVZh2IuPni4oRSh
	CTtZx1EkRsX8bpvC72nzZu+ZO3mZuXMCuTa1Pfmf++7mrh14xj/Qs1NdTDC2HCIN7rC6p37QO98
	K24LlgXMcPy/1DLkLZ+QytGtt0DNEVe/J4myTxVXAnJrs+TmgdwIwIjCYaq8knfGcTQW6BerNYe
	ekPnPFrISU5f/sZz8BHl8YfhZEAY=
X-Google-Smtp-Source: AGHT+IEX65fw+AuwIbm8DfCqVPIwMLBPu7X4mEmOAObvmlxgMqJT5rSe8ZZGCXBt4CgJFkEQIJbeNw==
X-Received: by 2002:a05:6000:1a85:b0:391:39fb:59c8 with SMTP id ffacd0b85a97d-3a06cf61418mr2487543f8f.25.1745504029007;
        Thu, 24 Apr 2025 07:13:49 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:48 -0700 (PDT)
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
Subject: [RFC PATCH 03/34] KVM: irqfd: Allow KVM backends to override IRQ injection via set_irq callback
Date: Thu, 24 Apr 2025 15:13:10 +0100
Message-Id: <20250424141341.841734-4-karim.manaouil@linaro.org>
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

Some KVM backends, such as Gunyah, require custom mechanisms to inject
interrupts into the guest. For example, Gunyah performs IRQ injection
through a hypercall to the underlying hypervisor.

To support such use case, this patch introduces a new optional callback
field `set_irq` in `struct kvm_kernel_irqfd`. If this callback is set,
irqfd injection will use the provided function instead of calling
kvm_set_irq() directly.

The default behavior is unchanged for existing users that do not override
the `set_irq` field.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 include/linux/kvm_irqfd.h | 1 +
 virt/kvm/eventfd.c        | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/include/linux/kvm_irqfd.h b/include/linux/kvm_irqfd.h
index e8d21d443c58..7d54bc12c4bf 100644
--- a/include/linux/kvm_irqfd.h
+++ b/include/linux/kvm_irqfd.h
@@ -46,6 +46,7 @@ struct kvm_kernel_irqfd {
 	/* Used for level IRQ fast-path */
 	int gsi;
 	struct work_struct inject;
+	int (*set_irq)(struct kvm_kernel_irqfd *);
 	/* The resampler used by this irqfd (resampler-only) */
 	struct kvm_kernel_irqfd_resampler *resampler;
 	/* Eventfd notified on resample (resampler-only) */
diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index 5f3776a1b960..d6702225e7f2 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -63,6 +63,11 @@ irqfd_inject(struct work_struct *work)
 		container_of(work, struct kvm_kernel_irqfd, inject);
 	struct kvm *kvm = irqfd->kvm;
 
+	if (irqfd->set_irq) {
+		irqfd->set_irq(irqfd);
+		return;
+	}
+
 	if (!irqfd->resampler) {
 		kvm_set_irq(kvm, KVM_USERSPACE_IRQ_SOURCE_ID, irqfd->gsi, 1,
 				false);
-- 
2.39.5


