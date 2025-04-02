Return-Path: <linux-arm-msm+bounces-53062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDFAA79832
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Apr 2025 00:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B7C03B287C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 22:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA0E51F4168;
	Wed,  2 Apr 2025 22:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J2H73Lmw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422D71F4295
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Apr 2025 22:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743632730; cv=none; b=aH2q5Rlz8nKp7pKIg7o+sBVQenTNgRZH4X2CGBiUm6rJVZRIaDhe3ZLH6BKmFAqhCTVHNdI+bFa+UcR/iQjPcOVCjCeZKMU588U+4n2j3NhDWjG1B8WD00rE5OlvEu2fOXno8aGu7uVm9tzB7FV77FL7v0DYAFDBCTs0i9Ntdgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743632730; c=relaxed/simple;
	bh=HQPFBCaJ5Qm9FY7mTC8LOnkYNfXTCoz5Iw7Mb6idx6g=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=ZqSFPbh7tAoPwfZu2VrlznLADqgD+RemhEX5E7Je5YlAbtSc2a/7ldCpvsgN2ChShl+DWOB/EWLGwdo3+b6eioKAwszTmPDrqZdL57KUNM8sKFWOcmEUxCxx7XCKAgcoGunHZ7qLSRdRPol8fvONHip6aKbOuy6Fcjc5G6edoqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J2H73Lmw; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7394792f83cso170433b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Apr 2025 15:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743632728; x=1744237528; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A6WcvdR6WqAMHzvGxAbwSacD4Wb/rLMAXYVnrZz6qbg=;
        b=J2H73LmwW4Z4PvkUTqjry7rUQn3y/bmK3VDCDsvTWdONnDBJcmrCyCLUThRjTdisWX
         2BVZ4hQKs6Nx5Znp//QizKi1pZJdO57HrKVqAnJJjuqw8owBlX5mAaXiYCod4LHxt81Z
         fii6i/HzvQnBa73d3Cui9usJ5B/gGF69W0/RugxdpGQVCOf5KN2BlvBzSJEcxBvXE2ot
         DpPJGdV1tIaGhpZcp5O9f4Sso3GU/obzuF55TgX2NI61EgyC2sy6DCSdBLZ+6dG8QZlM
         y/QgUOs8g7Uch+U6MZt9cFre2jdcADs31oDIPC0QuO0xvzqbAD95bBzKECBLIUzLs5t9
         UKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743632728; x=1744237528;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A6WcvdR6WqAMHzvGxAbwSacD4Wb/rLMAXYVnrZz6qbg=;
        b=j7mUn4bG6DGOeRhYDUldgF+gDaAMhe34B7JIt1OPWC17HTe66ZRqcnupfAX4EUpQa/
         wWz2mMMvYAzN9cfTNBJtxfOLQrIFVfeuc+kW2sEN1eBK3Gme49yUnnoZuJOWx68NZEjz
         0KSLLJLcY+X9G0XDhsPuayOVB8DOJGV1F+Ntk5mC08+PHo0xDm/FUY7NGl+kmmfGJTvQ
         PquEhUAknCR1N6oY9iA6TfOTVVNvVCdcta/bL2luLPO73DRV5ifGUaYDOTfb5WEPlQGR
         J5zpreZIPgQPw3BQut3/wHEioXH3JPLWvKAM6sn8dtR4We91Z4xjtOcSYHTA4lOyRL7o
         ZJxw==
X-Forwarded-Encrypted: i=1; AJvYcCWwNei5rOw6CmpNQOf+K64Tm+k/NvuKq4b+8w0yh35B7G1DNMGVnewgIBG12qpAo85ARuN1TpC5Zml//uuw@vger.kernel.org
X-Gm-Message-State: AOJu0YzTpOnyosOTfLttnvFeKlh4DfucN1P0esnhBpRDLun7JcepcGPC
	zOY4ht59ZPCIVbvCt3idU5yA2WuwzrFIH/bUyO9Tgpnrho1htsuMQrG73P8pFMOm7S/7u7IcaxY
	N2RuKGQaa7R8kS04kmHbNFA==
X-Google-Smtp-Source: AGHT+IGMP1M5dr+i5RR5wshPuL6my2/PghcE1DIyVKMYQME2SB4PdP1R+1Hd6RdA1YQ7XI2HJR0mJC1nwnB0LvRPjA==
X-Received: from pfbci14.prod.google.com ([2002:a05:6a00:28ce:b0:736:a055:1ce3])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:80d:b0:736:d6da:8f9e with SMTP id d2e1a72fcca58-739c7511323mr5458330b3a.0.1743632728406;
 Wed, 02 Apr 2025 15:25:28 -0700 (PDT)
Date: Wed, 02 Apr 2025 15:25:26 -0700
In-Reply-To: <20250328153133.3504118-4-tabba@google.com> (message from Fuad
 Tabba on Fri, 28 Mar 2025 15:31:29 +0000)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqz1puanquh.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v7 3/7] KVM: guest_memfd: Track folio sharing within a
 struct kvm_gmem_private
From: Ackerley Tng <ackerleytng@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, mail@maciej.szmigiero.name, david@redhat.com, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, 
	pankaj.gupta@amd.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

> From: Ackerley Tng <ackerleytng@google.com>
>
> Track guest_memfd folio sharing state within the inode, since it is a
> property of the guest_memfd's memory contents.
>
> The guest_memfd PRIVATE memory attribute is not used for two reasons. It
> reflects the userspace expectation for the memory state, and therefore
> can be toggled by userspace. Also, although each guest_memfd file has a
> 1:1 binding with a KVM instance, the plan is to allow multiple files per
> inode, e.g. to allow intra-host migration to a new KVM instance, without
> destroying guest_memfd.
>
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> Co-developed-by: Vishal Annapurve <vannapurve@google.com>
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> Co-developed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  virt/kvm/guest_memfd.c | 58 ++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 53 insertions(+), 5 deletions(-)
>
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index ac6b8853699d..cde16ed3b230 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -17,6 +17,18 @@ struct kvm_gmem {
>  	struct list_head entry;
>  };
>  
> +struct kvm_gmem_inode_private {
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> +	struct xarray shared_offsets;
> +	rwlock_t offsets_lock;

This lock doesn't work, either that or this lock can't be held while
faulting, because holding this lock means we can't sleep, and we need to
sleep to allocate.

One of these config options must have helped throw a BUG

CONFIG_DEBUG_ATOMIC_SLEEP=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_DEBUG_LOCKDEP=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_LOCKDEP=y
CONFIG_LOCK_STAT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_PROVE_LOCKING=y
CONFIG_PROVE_RAW_LOCK_NESTING=y
CONFIG_PROVE_RCU=y
CONFIG_RCU_CPU_STALL_CPUTIME=y
CONFIG_TRACE_IRQFLAGS_NMI=y
CONFIG_TRACE_IRQFLAGS=y
CONFIG_UNINLINE_SPIN_UNLOCK=y

with ./guest_memfd_test

[  161.255012] BUG: sleeping function called from invalid context at ./include/linux/sched/mm.h:321
[  161.257350] in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 254, name: guest_memfd_tes
[  161.259662] preempt_count: 1, expected: 0
[  161.260884] RCU nest depth: 0, expected: 0
[  161.262119] 3 locks held by guest_memfd_tes/254:
[  161.263470]  #0: ffff8883064c3c80 (&mm->mmap_lock){++++}-{4:4}, at: lock_mm_and_find_vma+0x29/0x140
[  161.265932]  #1: ffff88830dedbc10 (mapping.invalidate_lock#4){++++}-{4:4}, at: kvm_gmem_fault+0x3d/0x1f0
[  161.268507]  #2: ffff88830d510d30 (&private->offsets_lock){.+.+}-{3:3}, at: kvm_gmem_fault+0x45/0x1f0
[  161.270992] CPU: 2 UID: 0 PID: 254 Comm: guest_memfd_tes Tainted: G        W          6.14.0-rc7-00016-g174a15c15f96 #1
[  161.270995] Tainted: [W]=WARN
[  161.270996] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[  161.270997] Call Trace:
[  161.270998]  <TASK>
[  161.271000]  dump_stack_lvl+0xa7/0x100
[  161.271005]  __might_resched+0x261/0x280
[  161.271009]  prepare_alloc_pages+0xe5/0x1e0
[  161.271013]  __alloc_frozen_pages_noprof+0xbc/0x2a0
[  161.271019]  alloc_pages_mpol+0x111/0x1d0
[  161.271025]  alloc_pages_noprof+0x7e/0x120
[  161.271028]  folio_alloc_noprof+0x14/0x30
[  161.271030]  __filemap_get_folio+0x189/0x380
[  161.271036]  kvm_gmem_fault+0x5e/0x1f0
[  161.271041]  __do_fault+0x42/0xc0
[  161.271045]  handle_mm_fault+0xf37/0x1c90
[  161.271047]  ? handle_mm_fault+0x3c/0x1c90
[  161.271053]  ? mt_find+0x208/0x2a0
[  161.271088]  do_user_addr_fault+0x3c0/0x740
[  161.271095]  exc_page_fault+0x69/0x110
[  161.271099]  asm_exc_page_fault+0x26/0x30
[  161.271102] RIP: 0033:0x419fb0
[  161.271104] Code: 48 8d 3c 17 48 89 c1 48 85 d2 74 2e 48 89 fa 48 29 c2 83 e2 01 74 13 48 8d 48 01 40 88 71 ff 48 39 cf 74 17 66 0f 1f 44 00 00 <44> 88 01 48 83 c1 02 44 88 41 ff 48 39 cf[  161.271105] RSP: 002b:00007fffd695b568 EFLAGS: 00010246
[  161.271107] RAX: 00007f4f395a0000 RBX: 00007fffd695b590 RCX: 00007f4f395a0000
[  161.271108] RDX: 0000000000000000 RSI: 00000000ffffffaa RDI: 00007f4f395a4000
[  161.271109] RBP: 0000000000000005 R08: 00000000ffffffaa R09: 0000000000000000
[  161.271109] R10: 0000000000000001 R11: 0000000000000246 R12: 0000000000001000
[  161.271110] R13: 000000002e03ab40 R14: 00007f4f395a0000 R15: 0000000000004000
[  161.271119]  </TASK>

> +#endif
> +};
> +
> +static struct kvm_gmem_inode_private *kvm_gmem_private(struct inode *inode)
> +{
> +	return inode->i_mapping->i_private_data;
> +}
> +
>  #ifdef CONFIG_KVM_GMEM_SHARED_MEM
>  void kvm_gmem_handle_folio_put(struct folio *folio)
>  {
> @@ -324,8 +336,28 @@ static pgoff_t kvm_gmem_get_index(struct kvm_memory_slot *slot, gfn_t gfn)
>  	return gfn - slot->base_gfn + slot->gmem.pgoff;
>  }
>  
> +static void kvm_gmem_evict_inode(struct inode *inode)
> +{
> +	struct kvm_gmem_inode_private *private = kvm_gmem_private(inode);
> +
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> +	/*
> +	 * .evict_inode can be called before private data is set up if there are
> +	 * issues during inode creation.
> +	 */
> +	if (private)
> +		xa_destroy(&private->shared_offsets);
> +#endif
> +
> +	truncate_inode_pages_final(inode->i_mapping);
> +
> +	kfree(private);
> +	clear_inode(inode);
> +}
> +
>  static const struct super_operations kvm_gmem_super_operations = {
> -	.statfs		= simple_statfs,
> +	.statfs         = simple_statfs,
> +	.evict_inode	= kvm_gmem_evict_inode,
>  };
>  
>  static int kvm_gmem_init_fs_context(struct fs_context *fc)
> @@ -553,6 +585,7 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
>  						      loff_t size, u64 flags)
>  {
>  	const struct qstr qname = QSTR_INIT(name, strlen(name));
> +	struct kvm_gmem_inode_private *private;
>  	struct inode *inode;
>  	int err;
>  
> @@ -561,10 +594,20 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
>  		return inode;
>  
>  	err = security_inode_init_security_anon(inode, &qname, NULL);
> -	if (err) {
> -		iput(inode);
> -		return ERR_PTR(err);
> -	}
> +	if (err)
> +		goto out;
> +
> +	err = -ENOMEM;
> +	private = kzalloc(sizeof(*private), GFP_KERNEL);
> +	if (!private)
> +		goto out;
> +
> +#ifdef CONFIG_KVM_GMEM_SHARED_MEM
> +	xa_init(&private->shared_offsets);
> +	rwlock_init(&private->offsets_lock);
> +#endif
> +
> +	inode->i_mapping->i_private_data = private;
>  
>  	inode->i_private = (void *)(unsigned long)flags;
>  	inode->i_op = &kvm_gmem_iops;
> @@ -577,6 +620,11 @@ static struct inode *kvm_gmem_inode_make_secure_inode(const char *name,
>  	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
>  
>  	return inode;
> +
> +out:
> +	iput(inode);
> +
> +	return ERR_PTR(err);
>  }
>  
>  static struct file *kvm_gmem_inode_create_getfile(void *priv, loff_t size,

