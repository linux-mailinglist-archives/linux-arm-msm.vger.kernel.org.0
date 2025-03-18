Return-Path: <linux-arm-msm+bounces-51778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E89BA6790A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 17:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CA691764AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 16:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD6021149C;
	Tue, 18 Mar 2025 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EXyD+uPE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBBF21147A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742314716; cv=none; b=a2XLH8UAIV3zqPV60SMEfrKl/eEPcevLWqnV5tAhG1LwHKAGsGPJl6/Fo3VB2XwtSBBPYH2VzB7XXaCtUhJVPkjQF3kwk8ipzSGVTnmK2xygHVZDG2kvnlnctTGmRi/1t0ChaEv8HvoyxfIcHmA6x3isoP/zhNNcdnpFWSk3g/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742314716; c=relaxed/simple;
	bh=VThRx3xXCNs1De0U3v1PjAl8DRWbDmLzde3CVZrAVGc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=POup6mBIssJA0PfalTWfButSQ1QmYmmAuLK9dpQ8gYc8IjvfeDA5TVkcn5GNXX58SsPvj0xUQirM6/hF+z0gmg48Jjpl+yW0UuWgI7yIzT8qbRQS0aZ0yPwdeyKttVMeZAZUsJeyOFbqO3VKrY0Mc1QQl/8N3YqQ+HPCnwkBUeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EXyD+uPE; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ab5baf62cso31869415e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 09:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742314713; x=1742919513; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/EcAixsmdhk6bmV6ZGX7oCYFqnhwEUpezZCWTXKhO+8=;
        b=EXyD+uPELE6tZpMFjFPv0JuTDMTB6EYiVaQRYJcipuHRAS8VWDNDPA1DpnmcY+bKVV
         Azs0KG6M13rKTRzkQZX/vpjTlx7Dq0WpsYG7tNNSj3KEC7HGJa6wnbS5CACspO9xLsaQ
         8d2UlEStBxEhxxRTYdufGwiOMjvSUOGma65pwl1aTxErYWdpE/eXAI1/JqqybbGgs+aV
         WLtY0xoSsFH7eKE6fah9XPlrR2NjZ6/Nt1CqE2oYm90/izllAvX76wPS/l3+Xp/OcPRd
         e+X8+we29pRMaUM/0dX7SRH+O4H5x6E4ti6hLguS28EhhVe0ACzqGkb6d9koWAVlIz9B
         hSQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742314713; x=1742919513;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/EcAixsmdhk6bmV6ZGX7oCYFqnhwEUpezZCWTXKhO+8=;
        b=WbSPxqX8aK3KjoEBuWdsg4GRij+CmQ5OezSofY6NiFJ5AnH8awuFTjyGAizVFLXBpN
         MTuI3sRc3opxtpFXnmJxznLegxcA6UTI/CMiPJbz3tjtzkMpZ/87PIeSZvJ7C4Tmcia9
         I+wj76tdGHED6nfdTUQJxrX1cQHklHoSto6dCrIQAOL/IH+hOLM34tm2Wjm7biqHUB16
         hUVdF9dXRYuyYQUmcsavBcMCIC9ZeDDpdFrZuQV/JfPUFwaXXwgaiL4SFzUs/DVXDV4U
         ZJ6DcwGkAN1L64jQL+U8PTtTuV903u5EKPXCbOyzJtXfF/ssLXVY72YPie/YK6pRy+sV
         R93Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRuy79idywQ67J9yG5UlicTvSf0Uk7EFHz4DlGqnLxCMGHD4M30pZljMdbCl3hZvA3B9uT84mlaz3/CKA9@vger.kernel.org
X-Gm-Message-State: AOJu0YzAeD5NF/kxeXakaa5GiGVKvqwJdWhLCzVgzUtjub3oWzZnmk/C
	53xBGt8xSJdePWaAB0wp69aLeHMvHnPqfThSxdjzTMy41m6oPMtQqoU138FedtvhZb5hZGjvKA=
	=
X-Google-Smtp-Source: AGHT+IFuB0YnKL6kUm38tBS/6LJDBkvMlWqrQgPpMVTZtzFsku07rNUNUVUMU/c13cdgLnKM1DZebVk/ow==
X-Received: from wmcn5.prod.google.com ([2002:a05:600c:c0c5:b0:43c:f316:abd1])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3d85:b0:43c:f6b0:e807
 with SMTP id 5b1f17b1804b1-43d3ba30defmr34291435e9.31.1742314712952; Tue, 18
 Mar 2025 09:18:32 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:18:18 +0000
In-Reply-To: <20250318161823.4005529-1-tabba@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250318161823.4005529-1-tabba@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318161823.4005529-5-tabba@google.com>
Subject: [PATCH v7 4/9] KVM: guest_memfd: Handle in-place shared memory as
 guest_memfd backed memory
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
	david@redhat.com, michael.roth@amd.com, wei.w.wang@intel.com, 
	liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, peterx@redhat.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

For VMs that allow sharing guest_memfd backed memory in-place,
handle that memory the same as "private" guest_memfd memory. This
means that faulting that memory in the host or in the guest will
go through the guest_memfd subsystem.

Note that the word "private" in the name of the function
kvm_mem_is_private() doesn't necessarily indicate that the memory
isn't shared, but is due to the history and evolution of
guest_memfd and the various names it has received. In effect,
this function is used to multiplex between the path of a normal
page fault and the path of a guest_memfd backed page fault.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 include/linux/kvm_host.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 601bbcaa5e41..3d5595a71a2a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2521,7 +2521,8 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 #else
 static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
 {
-	return false;
+	return kvm_arch_gmem_supports_shared_mem(kvm) &&
+	       kvm_slot_can_be_private(gfn_to_memslot(kvm, gfn));
 }
 #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */
 
-- 
2.49.0.rc1.451.g8f38331e32-goog


