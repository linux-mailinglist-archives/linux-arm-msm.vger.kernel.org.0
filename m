Return-Path: <linux-arm-msm+bounces-27699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB86D94475B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 11:02:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F5BCB23EAC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 09:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168B813D602;
	Thu,  1 Aug 2024 09:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZHbFy7Dh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FADC170A3E
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Aug 2024 09:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722502906; cv=none; b=JmWPg1tUdF9AawNBQMG0S74p0U7GlUWYqNzbERCKMUiEbDsXIxvny5nQ5UyEu/m14hdLg/bBgsIH18x8DOqRHYyx3i7MLGjpeRt9bZ5lgxqsVpkeGfzkyxKBcdJ7/gM9c36oTjqr9sZyIiYrKDeF2OV14Dpxl0Y1VgMpY1G+vf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722502906; c=relaxed/simple;
	bh=q5IFhmTRn0cgQ8n1AC7LRcSHCxEBQI8JJxFLv3GwqRI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oKkqHXYfy6t48KgBXrcdvpFw/DdaM/2O7yPc28/yYJhrd0kryUtbCdTGpEX7u0Y0ZptaL32d+j35WjQTiob2+ZCYg+Ieg90HC+P6JA6LhhaIQg8W+/ENLgHYZ326XiuaWCW5NdApL3DZZ+gL3vBJO75KeDzX2Tt0c9y8u88rkZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZHbFy7Dh; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-a7ab4817f34so586824366b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Aug 2024 02:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722502903; x=1723107703; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zLFB4vtfe+Qz1MMVjY77NoMcItZ1noXdllMM80GyRW8=;
        b=ZHbFy7Dh2DNCjKdxQMTGQA2shnaozzRFcaoINBnMg+kUBfLpioLLdpj8szNTQ8UqR4
         rmDsGHh3r07+WlDcRy6/FPEu/BD8adGIakyy7V4vEWZKXVSCR2C1qFX5GycDUL+TYHvu
         PtEowTeEim7bn8TmxcQHaHePJht/P3OOoJkamF7Va2e7ORryXjlxA1+DKfYL2nf/wVEF
         wsaTb9Mqq810qBRDWL5de7YcW+1CVoxwbOXCnTVJAw1z/OPYV4lAkyyHPAHRePiDoq29
         JBkSCIuBJP4hCvWKEuDdR77TA8LwbuJn6DKt7Dt5l53/hcEGSjvMmXupiKjM42+HXeRH
         cEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722502903; x=1723107703;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLFB4vtfe+Qz1MMVjY77NoMcItZ1noXdllMM80GyRW8=;
        b=KtsvOPiFz5Lm5hkHqVN7w1dObKrhEorqWM/iLzwNNz/SLv+hDZs8ey5FbtKZmlRmdG
         1YlEsSJAeoXwwhjwzrGWUdZri1T4LU4VIX9Z/NLT6IebQ5voVAS+mGZ0NGIVHkSC/heB
         fXQFnMJQYSS60hp0JoAKCKFBMH6H9OpForvr3lzQNKa/nxH4h3ZW4Z0DSMlGFV0Dz/6c
         GH1/r2IYM6mITZvDcj0ahu2KlC4EGSDZN+8r02zG36WWvJCB8HdIEclpkcS6cNOMssgB
         wy62v06dwctnzzLRWd/EMPe5jNOYWZ41W0xBmTpprGh/JDE6gSHfwa5//mfPYWcKZbXn
         K4EA==
X-Forwarded-Encrypted: i=1; AJvYcCVzQJps8sdaIASdL1y4JnpXAqhqlMQl9ETqBzypSlKPvPgXBrDjPLK1v7qT28Pw6zL3mIfF9cW6uEYu7oAcEUUqOpcaL9tCjO6TSURRPw==
X-Gm-Message-State: AOJu0YwGWWlIVyNsY0oT01qjMcRInGCh9VywftBcXK6GFgoTmlwQbLvm
	Kb88CRQCXE3gkylIM4y320s7bNjuGl++Wpf2R1lFrXfbp5zU2MYj3VOprrqROPiE4hz3KU4QvQ=
	=
X-Google-Smtp-Source: AGHT+IHTzLe8RYDoIu4Q6eNF/9ig1sSQFAYVxHVp/NRIu780LrDluXUfDxDxS5ts3clkl+0Fh9PskkCJDQ==
X-Received: from fuad.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1613])
 (user=tabba job=sendgmr) by 2002:a17:906:3415:b0:a7a:aa12:100a with SMTP id
 a640c23a62f3a-a7daf11ce02mr180366b.0.1722502902501; Thu, 01 Aug 2024 02:01:42
 -0700 (PDT)
Date: Thu,  1 Aug 2024 10:01:16 +0100
In-Reply-To: <20240801090117.3841080-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240801090117.3841080-1-tabba@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240801090117.3841080-10-tabba@google.com>
Subject: [RFC PATCH v2 09/10] KVM: arm64: arm64 has private memory support
 when config is enabled
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Implement kvm_arch_has_private_mem() in arm64, making it
dependent on the configuration option.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 36b8e97bf49e..8f7d78ee9557 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1414,4 +1414,7 @@ bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu);
 		(pa + pi + pa3) == 1;					\
 	})
 
+#define kvm_arch_has_private_mem(kvm)					\
+	(IS_ENABLED(CONFIG_KVM_PRIVATE_MEM) && is_protected_kvm_enabled())
+
 #endif /* __ARM64_KVM_HOST_H__ */
-- 
2.46.0.rc1.232.g9752f9e123-goog


