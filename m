Return-Path: <linux-arm-msm+bounces-55438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6B3A9B0BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:26:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7A141943360
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F13296D30;
	Thu, 24 Apr 2025 14:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="atJfyX5S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC75B2957DB
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504073; cv=none; b=C602nOkIE5agjh1CK3yKCLzsKzCMoyXUh4MiWfZY8nqOI7el7qCCo8sk94nWocwJyH8wrqKiLdnM+9mggaGVQJKtI+dL9gVQ1wTMH+QEpsRLr5x7ZPCSSDammhWOsoAJ1BD/JtA/jSUfkOx2ARsF/s/119oE7fYAP2VxakBGu60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504073; c=relaxed/simple;
	bh=fw0dWabNAHpVG50PP6u8LJhYKTqtfzfYN79tONhSgqw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mf1FMgBxBPxEgJnk6wivspOjWrCJJvPwVajjSye6LBKzSdwkmQm6bI0t+jkXTVIT8HWqQCSLlv2RtqsJh0wMqGBi/BYQXHUoaBTetMe7bq+HiIW45VD5VcGjYhAf3iq2Tlo1l4nLqJoqQMUevU27AK6iIPDeEua3E0ncB8+jz5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=atJfyX5S; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1251811f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504069; x=1746108869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IXvNlcutyMXVdoUVJkL/Ta8/a2mdxRJrpPZQuCyEfUg=;
        b=atJfyX5SL9JWC3DgDFlzekyvtegoru7FHIeAWSer2RL8B2oqSTeEBPso/EErYNOhQw
         GynviIERB4+BRDCddxvnf5ZCrI8grdjdTFpReSNrTo8VEm0rZiWwjGEH99jdgs5R06Lp
         LeHZywumUi1xcYgi6paPqbga8qvUrr1g/fVzUT81Y3L9HboF/2Tgz1mXQ4MPE/2Wmc5i
         Bg0nTbpM/ouQA/kVbVZv5Fqu3zPOuOWbDbYh24xIqR6POCxXJL9suBsRwyHAc6YjawCF
         XL99SLseyGwrOaccFlYJkNoQCSqhmkmoinrLnp2DUtF6gMUMGvfoCTSSZhaCCfro4ix0
         m69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504069; x=1746108869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IXvNlcutyMXVdoUVJkL/Ta8/a2mdxRJrpPZQuCyEfUg=;
        b=OfB6eDr61sbF6LxaQdBjUGsjYXyOTXvSfJlvp84UMw2/e3Je+RijZWsRgH1s3U9LPM
         EU0x+euP7sBjIkstOAWtfk/wgGazoKvysMTMY2879XF4KSo0W1Ri9ahzjs4Am1qchXLw
         T7nep5K/WjGX5AySI0Jh4CDDEomfIW9MfAIgVfE/nugENYzl0WY78iTeMzMRlCWo0FF1
         aV0D/L10vpqX/HMR9qp5ymd1NEjq5yxH/YnwWZDBmmIOrHmBiwX/0r/np1YSfw/oLLcl
         LfyTd/NBx8B+zLH6bZV1IfqslTTHN3wqFSy21pyknTk3u5sxn2bxzRH95eLdUqAuckP0
         eLWw==
X-Forwarded-Encrypted: i=1; AJvYcCWU5St5ePIKB/iLscvvI095jftE6gxEXdq4BF4KTS40U3aFyz7vIPTb72zCRIgcr7/NnKvyz2umR4sHsYHr@vger.kernel.org
X-Gm-Message-State: AOJu0YwXHyOinbLPVu5cGVkoxmrPSsLQDJ7CSZrSbdL4uTDYV/SJqQjQ
	Pwj+ryokZPnNrJZpkTzhhiFQTBdbZp2fBHpKCHYiJneA7NM3tyCozN7JRevUU6A=
X-Gm-Gg: ASbGncsTQ54LuXe1i27Yokop+ZWhIGRyW+mN4GX4BQ2chiyC4sWcQJb0kFjHiyZP4Ky
	YxvE7JBYasvXTbUcEo/rXjdiFAHeTKibbbChry6ZJAi+9irnaqehf4M3O55WOzLXndXNXnxd8Y7
	8p8G8wXFqfhpx/kBiArMB8RCHJb3fM4+rAhjnxK8FI/ZwEP6Nu4Utvgry7nK416dlxIFEysA0cK
	HU++927CGvKKXxFV6X3wAbEo9tS652XvwhX9dt7qG5z6BOMWVYv5vXPLhequiK/0BS89Ra8obU6
	9nlfXm5md1Cc9hixg6YLmOWTKoufctWAalW6GHJrxVfYFvi8vcycuQglMkf0KSzsJk91y/eUExK
	pzhhRH1uAvifOLjct
X-Google-Smtp-Source: AGHT+IH0tCAHy+56/cv4ZEG1Nkj43NDfif06A0s6QNH24+K7YCAgJ/1BfT2MGE/c41oOF+y78aq+Lw==
X-Received: by 2002:a5d:4092:0:b0:39a:c80b:8288 with SMTP id ffacd0b85a97d-3a06cf635f7mr2018268f8f.33.1745504069033;
        Thu, 24 Apr 2025 07:14:29 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:14:28 -0700 (PDT)
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
Subject: [RFC PATCH 33/34] KVM: gunyah: Implement irqfd interface
Date: Thu, 24 Apr 2025 15:13:40 +0100
Message-Id: <20250424141341.841734-34-karim.manaouil@linaro.org>
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

Enables support for injecting interrupts into guest vCPUs via KVM's
irqfd interface. Irqfds are requested from userspace via KVM_IRQFD
ioctl. kvm_arch_irqfd_init() implementation, in Gunyah, then creates
a resource ticket for the irqfd. The userspace must also create a
devicetree node to create a doorbell with the corresponding label.
Later after VM configuration (in gunyah_vm_start()), the resource ticket
will be populated and the irqfd instance will be bound to its
corresponding doorbell (identified with a capability id). When userspace
asserts the irq line, irqfd->set_irq() callback is called to inject an
interrupt into the guest via a hypercall.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 arch/arm64/kvm/gunyah.c | 100 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/kvm/gunyah.c b/arch/arm64/kvm/gunyah.c
index df922be2429e..23b9128bf5b1 100644
--- a/arch/arm64/kvm/gunyah.c
+++ b/arch/arm64/kvm/gunyah.c
@@ -29,6 +29,14 @@
 #define WRITE_TAG (1 << 0)
 #define SHARE_TAG (1 << 1)
 
+struct gunyah_irqfd {
+	struct gunyah_vm *ghvm;
+	struct gunyah_resource *ghrsc;
+	struct gunyah_vm_resource_ticket ticket;
+	struct kvm_kernel_irqfd irqfd;
+	bool level;
+};
+
 static int gunyah_vm_start(struct gunyah_vm *ghvm);
 
 static enum kvm_mode kvm_mode = KVM_MODE_DEFAULT;
@@ -852,6 +860,98 @@ static int gunyah_start_paging(struct gunyah_vm *ghvm)
 	return ret;
 }
 
+static bool gunyah_irqfd_populate(struct gunyah_vm_resource_ticket *ticket,
+				  struct gunyah_resource *ghrsc)
+{
+	struct gunyah_irqfd *irqfd =
+		container_of(ticket, struct gunyah_irqfd, ticket);
+	int ret;
+
+	if (irqfd->ghrsc) {
+		pr_warn("irqfd%d already got a Gunyah resource", irqfd->ticket.label);
+		return false;
+	}
+
+	irqfd->ghrsc = ghrsc;
+	if (irqfd->level) {
+		/* Configure the bell to trigger when bit 0 is asserted (see
+		 * irq_wakeup) and for bell to automatically clear bit 0 once
+		 * received by the VM (ack_mask).  need to make sure bit 0 is cleared right away,
+		 * otherwise the line will never be deasserted. Emulating edge
+		 * trigger interrupt does not need to set either mask
+		 * because irq is listed only once per gunyah_hypercall_bell_send
+		 */
+		ret = gunyah_hypercall_bell_set_mask(irqfd->ghrsc->capid, 1, 1);
+		if (ret)
+			pr_warn("irq %d couldn't be set as level triggered."
+				"Might cause IRQ storm if asserted\n",
+				irqfd->ticket.label);
+	}
+
+	return true;
+}
+
+static void gunyah_irqfd_unpopulate(struct gunyah_vm_resource_ticket *ticket,
+				    struct gunyah_resource *ghrsc)
+{
+}
+
+static int gunyah_set_irq(struct kvm_kernel_irqfd *kvm_irqfd)
+{
+	int ret;
+	struct gunyah_irqfd *irqfd =
+		container_of(kvm_irqfd, struct gunyah_irqfd, irqfd);
+
+	if (irqfd->ghrsc) {
+		if (gunyah_hypercall_bell_send(irqfd->ghrsc->capid, 1, NULL)) {
+			pr_err_ratelimited("Failed to inject interrupt %d: %d\n",
+					irqfd->ticket.label, ret);
+			return -1;
+		}
+	} else {
+		pr_err_ratelimited("Premature injection of interrupt\n");
+		return -1;
+	}
+
+	return 1;
+}
+
+struct kvm_kernel_irqfd *kvm_arch_irqfd_alloc(void)
+{
+	struct gunyah_irqfd *irqfd;
+
+	irqfd = kzalloc(sizeof(struct gunyah_irqfd), GFP_KERNEL);
+	if (!irqfd)
+		return NULL;
+
+	return &irqfd->irqfd;
+}
+
+void kvm_arch_irqfd_free(struct kvm_kernel_irqfd *kvm_irqfd)
+{
+	struct gunyah_irqfd *irqfd = container_of(kvm_irqfd, struct gunyah_irqfd, irqfd);
+
+	gunyah_vm_remove_resource_ticket(irqfd->ghvm, &irqfd->ticket);
+	kfree(irqfd);
+}
+
+int kvm_arch_irqfd_init(struct kvm_kernel_irqfd *kvm_irqfd)
+{
+	struct gunyah_vm *ghvm = container_of(kvm_irqfd->kvm, struct gunyah_vm, kvm);
+	struct gunyah_irqfd *irqfd = container_of(kvm_irqfd, struct gunyah_irqfd, irqfd);
+
+	kvm_irqfd->set_irq = gunyah_set_irq;
+
+	irqfd->ghvm = ghvm;
+
+	irqfd->ticket.resource_type = GUNYAH_RESOURCE_TYPE_BELL_TX;
+	irqfd->ticket.label = kvm_irqfd->gsi;
+	irqfd->ticket.populate = gunyah_irqfd_populate;
+	irqfd->ticket.unpopulate = gunyah_irqfd_unpopulate;
+
+	return gunyah_vm_add_resource_ticket(ghvm, &irqfd->ticket);
+}
+
 int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
 {
 	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-- 
2.39.5


