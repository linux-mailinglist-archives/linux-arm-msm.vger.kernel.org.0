Return-Path: <linux-arm-msm+bounces-55409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E6DA9B05F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 16:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A29673B1912
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 14:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9062227CB21;
	Thu, 24 Apr 2025 14:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TMpYcwLk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D431D63E4
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 14:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504034; cv=none; b=naj990Z5lhbD7vvmE5XCP8sR5hJUqUBeWEXgSPtRs/Bl6IegKp+hpABGDeb7yEIXav2ILs/leju9UFuVQ/VkqRiYgV2E0wyD4B1dQmGP5t2Hzg+KMVsOTVrBT5JhX69VwTILwNZ1K8zidhcyVXHPqNorSv6CzU6xCIiVJwb0ilc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504034; c=relaxed/simple;
	bh=yHQVbNXozVjVHt5pOWEf6CFk11nfYNM4wHopdbI5gbI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r+lOvLYC7PSVNfBL2pSu3FXXwc6412t2X+396qiNGNaH96bXrlqPXwlQ6QmQl39xzFGIcLi1Rho7x97z6XqqlTDAX/nsgFnNSv1U/WQA8evdw/Zd6pBEN3mDIXlqyIOQyqTvD8tSBbRsH3wn7nF7exQ52z5Yzr4fq4QAhPdPRSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TMpYcwLk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-440685d6afcso10746705e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 07:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745504030; x=1746108830; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlljNambtbwwvkzAI4LjAz2eo7Ti1KUJrgs8M2UB6Bg=;
        b=TMpYcwLkfLTj/ATVziMuksWaNsV3xs053pw6b7Tre2eq7ME2fqLNfMFtBGsCfJ0eLv
         YaiXKTnIikVyMFLz6c8RFczV2dxEuTPlqUn0VbE8hvXxjTAi2mOelNzXjdxPAmnkSCfd
         3LifOZSqAm46lqRHFyEjsJsmzn/kOOCCpL0PCLxtWs3mOsRWSy+t7/E8RaWNKpD4LyWW
         QEM8MkS1ukD7WBR9ph7HvsZQWjM1KNmig+Vr6IRoe9cSARPdbP8NtrVV38KehoUVsO5h
         vE9r4xl6/rZ+05p1xaciTkPpWpp6a1HaUXeVGrmcWltf1wygu6Br9SLBLSbQuwtYg8jY
         0m/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745504030; x=1746108830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlljNambtbwwvkzAI4LjAz2eo7Ti1KUJrgs8M2UB6Bg=;
        b=l/7N1/fhBGXxXzP7cYBg42aedUdrT3jswCoAgelTRm65HcftNToFYz9qK8U54C1UAT
         Fs33YwvJF9y8O1sRAayozCkxHw790f6WDjpTd/uxYd5sHtPI0r2OLzl6g50dFVIwZxKF
         es/ivKXZ/jGwQ8K7j6M6f4tEG/00DVao3lsVgaj+nFxa7JLjoUCGCDv3umaGa4L9wNs4
         vGmUYFj9VJ0R8hn7b1OqpXETzjkbQOG4WA+ahe7hlw/ao6q408cGmmLxUgrggo9IW7Uk
         IKyJHCSFLYAqMtEv2kkcGU3uoqLQNOexT3Sz9+An+aBmNIGV4oaMkI1VqYKRDa7RzVZl
         g6XQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHaRdcxHHI1NkNaYRq+f8GGqj9f6UNVKFkKu09ZXGe2HkMaXCLtFrxx3OpOiQhU/ztcMceAORXSTnEXKc8@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9ZuTsdnvwmfVCOLCcOXxwJebKqLb5n8EgTBGjqrnJgjGkTkKJ
	flhTa6+C2Ut1hmt7iZZvcPE24EtQ0bRqvrv3JPWOClNiji70rs/JII3rXtoOZKIqn4lpYGm2pvm
	AddI=
X-Gm-Gg: ASbGncv/bIU+xyVzi5zxzE2oXR39zv1uvv1LlGbZ9ZcHXDA8dqxqxwzzi11++iS9Baa
	Hv6mmi6+Axj3EgI6+NC2EHmacAKEfyxplSTFggAB6qQKQhV6y1bpSiCS8WjShlu6u3+MJvNKmr2
	l3z0sakWfa0afJGUVFWuE9tromz96Lzp30HQzHSK0W9rWv1yO4AOIAaIY3QgEMeafC4HToaOwnE
	7SUEHcnJW4Lb+cqEZDthVUIfknJfanxMcvdsBzWPTykEVtmRxUbGnSRoc1oh6j6iDg1gBq+hWnc
	tmYQhkfS15DraE80Lu2mrWU0WJMk6P9X+rSqIDOeQRRJS1ZAYX+wmy+VXzULyYS90+pRXhE2bmI
	Hq/v+pKrgAc2VDT6L
X-Google-Smtp-Source: AGHT+IGjTSYHUF3tyGvvpZJy9ttFB+SjTk/OBEoax4K5qs9LZf6N8lXayXTA0lInN+EeJy++KbQTNQ==
X-Received: by 2002:a05:6000:18a2:b0:391:47d8:de2d with SMTP id ffacd0b85a97d-3a06cf5ed4cmr2481988f8f.23.1745504030257;
        Thu, 24 Apr 2025 07:13:50 -0700 (PDT)
Received: from seksu.systems-nuts.com (stevens.inf.ed.ac.uk. [129.215.164.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d4a8150sm2199951f8f.7.2025.04.24.07.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 07:13:49 -0700 (PDT)
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
Subject: [RFC PATCH 04/34] KVM: Add weak stubs for irqchip-related functions for Gunyah builds
Date: Thu, 24 Apr 2025 15:13:11 +0100
Message-Id: <20250424141341.841734-5-karim.manaouil@linaro.org>
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

The generic KVM core code (e.g., kvm_main.c and eventfd.c) calls into
irqchip-specific helpers such as kvm_set_irq(), kvm_irq_map_gsi(), and
kvm_irq_map_chip_pin(). These functions are defined in kvm_irqchip.c,
which is not required or compiled when porting KVM to run on top of the
Gunyah hypervisor.

To allow building the KVM core code without linking errors in such
configurations, provide weak stub implementations of these functions
in eventfd.c. These stubs return appropriate default values (e.g., -ENXIO
or -1) to indicate that the functionality is not available.

This allows the KVM core to build successfully for platforms that do
not use the in-kernel irqchip support, such as Gunyah.

Signed-off-by: Karim Manaouil <karim.manaouil@linaro.org>
---
 virt/kvm/eventfd.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/virt/kvm/eventfd.c b/virt/kvm/eventfd.c
index d6702225e7f2..2a658d8277ed 100644
--- a/virt/kvm/eventfd.c
+++ b/virt/kvm/eventfd.c
@@ -56,6 +56,26 @@ kvm_arch_irqfd_allowed(struct kvm *kvm, struct kvm_irqfd *args)
 	return true;
 }
 
+int __attribute__((weak))
+kvm_set_irq(struct kvm *kvm, int irq_source_id, u32 irq, int level,
+		bool line_status)
+{
+	return -ENXIO;
+}
+
+int __attribute__((weak))
+kvm_irq_map_gsi(struct kvm *kvm,
+		struct kvm_kernel_irq_routing_entry *entries, int gsi)
+{
+	return 0;
+}
+
+int __attribute__((weak))
+kvm_irq_map_chip_pin(struct kvm *kvm, unsigned irqchip, unsigned pin)
+{
+	return -1;
+}
+
 static void
 irqfd_inject(struct work_struct *work)
 {
-- 
2.39.5


