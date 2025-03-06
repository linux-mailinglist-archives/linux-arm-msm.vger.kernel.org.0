Return-Path: <linux-arm-msm+bounces-50423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C6BA53EC9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 01:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE5D116B64A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Mar 2025 00:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C7628E3F;
	Thu,  6 Mar 2025 00:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RArCYBHJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DFB1F95A
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Mar 2025 00:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741219321; cv=none; b=a9+Pj5cI5VGnV6heWd0hoU+Rlc+50k84dJIor8H2y34npXyfCU1fntwIYFK0tsBhPQQxnm30DZswwnvS78jIr0ZMh6RA+iWkcZrX3y6NpVOkbmKtsFzYfo9yYJJ1ItcBlFgnIA7Or3JF+i5bz1JKLdmaefMywKrrCrspX9FEUrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741219321; c=relaxed/simple;
	bh=qJemjvKpicpp1fb2vOExLOIaNYkqsEKWLsn7chUtgG0=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Buv1PaSm9dY81z3ehVHmqlJZG8XsJ+73Gkt8/e8v7HAIqa+EY4Q4jjooQ58L/IOHDL2uqxSfUE5De0wF/dlgOdZWlflDSFaRt/69npBehve/fOvyqdHD2X21vHPbD1RJ4u2ntBXbT0lryXWWZZNtwIAyvBaBqQv9ns9NIEAOzMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RArCYBHJ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-22380b74cfcso700295ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 16:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741219319; x=1741824119; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=56oJ12Bp4zx+P97DlMZ4Tn8DtYif33Fhe6HEZDkqc4g=;
        b=RArCYBHJ9d/hR2hV1ZoL5oU38v+KezhgdtQb8mD7lUwe0svHH29e4x8GwegCIovWtV
         dsQABuYDVj4G4FkluMEG9ExfVx7u6xNbaEfPpIJDGmvQ3T++oeO8WiynnV+q0l+ucCEG
         3EnLH/Y9wQlxg2HtflKUjgcn61rgtDOWP9u+htDSIEvqvolEoJupMHG8gCPciJbOpJwV
         CxaFcYJKgb7xqZDz0WS0A2k8PieR+ixs8zHeQWreIhnpzAhcL4T+r/la91Dq3UlQzVdn
         NxcQ8/cjFa3yA1GoUD7xAw9iZLUGiUfDW1dEubo0rbGQMq2PxdenWONtVWe4gcgpsYX6
         i5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741219319; x=1741824119;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56oJ12Bp4zx+P97DlMZ4Tn8DtYif33Fhe6HEZDkqc4g=;
        b=YYVNCSo5zqsAkpAPcUM7u3127Bu1KfFwUDJxNiYcZ4lUNN3Rw1unrpy77CSyk+YFzZ
         Q453F+iz63Aciceb6Cw3wNwRcmm+1NpYrkZ265vAPIZJkzFlQAnQG9bzHF3fPcCs0+9M
         O6jJe3FM+57A1ZNNXoaRvxOsSnoitBU0NeBSi+2JQFp6FfLxIxuTH37hhCiAQmHSYVRN
         1yd7tpU6VTOOJR+eMDoPtlF83kKgg2q4RwDiCzwWRU52Zq+berRP2mGv8W6BJe6BS2R0
         F+2N4mpl/uvrBZ4ipUIfF7F4PgYuGePPRecS0Gzuq3r+7oDX8RqqTIziYCCs0qV9YNE0
         aDJA==
X-Forwarded-Encrypted: i=1; AJvYcCWJLf+q0ZsD/5u7tZlCs5MOdZBB2aBuyjj7Xu06gNdXLUfFZF3Q+Upmt33oW/7+jDUqMWD4fmVYtxxrxz7F@vger.kernel.org
X-Gm-Message-State: AOJu0YzCNzhS3MkhgZuxqz0NW6EwVGBHsJ+b5O3Qf6W83xc3lKPeeEEo
	2dkAtflKRrvrWB6aS/7tQaWaXER1nxLhtMH7iDsxEmsHwCjJQufgdpyv4MJMwnkImh8enRT305p
	UqAL0bouFGw847TWpsiXIqw==
X-Google-Smtp-Source: AGHT+IEjpOP/Wjl0soyGnkaTnhki4yqOQAJMvMYNKzU+1gICchyohzEwQvzUEmiM/rlr5qBvpAcs/G+6lcFLOH+FSQ==
X-Received: from plbmq6.prod.google.com ([2002:a17:902:fd46:b0:220:ddee:5ee])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d50a:b0:224:1001:6787 with SMTP id d9443c01a7336-22410016aaamr1718525ad.4.1741219319186;
 Wed, 05 Mar 2025 16:01:59 -0800 (PST)
Date: Thu, 06 Mar 2025 00:01:57 +0000
In-Reply-To: <20250303171013.3548775-4-tabba@google.com> (message from Fuad
 Tabba on Mon,  3 Mar 2025 17:10:07 +0000)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqzr03bt4ay.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH v5 3/9] KVM: guest_memfd: Allow host to map guest_memfd() pages
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
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"

Fuad Tabba <tabba@google.com> writes:

> <snip>
>
> +static vm_fault_t kvm_gmem_fault(struct vm_fault *vmf)
> +{
> +	struct inode *inode = file_inode(vmf->vma->vm_file);
> +	struct folio *folio;
> +	vm_fault_t ret = VM_FAULT_LOCKED;
> +
> +	filemap_invalidate_lock_shared(inode->i_mapping);
> +
> +	folio = kvm_gmem_get_folio(inode, vmf->pgoff);
> +	if (IS_ERR(folio)) {
> +		switch (PTR_ERR(folio)) {
> +		case -EAGAIN:
> +			ret = VM_FAULT_RETRY;
> +			break;
> +		case -ENOMEM:
> +			ret = VM_FAULT_OOM;
> +			break;
> +		default:
> +			ret = VM_FAULT_SIGBUS;
> +			break;
> +		}
> +		goto out_filemap;
> +	}
> +
> +	if (folio_test_hwpoison(folio)) {
> +		ret = VM_FAULT_HWPOISON;
> +		goto out_folio;
> +	}
> +
> +	/* Must be called with folio lock held, i.e., after kvm_gmem_get_folio() */
> +	if (!kvm_gmem_offset_is_shared(vmf->vma->vm_file, vmf->pgoff)) {
> +		ret = VM_FAULT_SIGBUS;
> +		goto out_folio;
> +	}
> +
> +	/*
> +	 * Only private folios are marked as "guestmem" so far, and we never
> +	 * expect private folios at this point.
> +	 */

I think this is not quite accurate.

Based on my understanding and kvm_gmem_handle_folio_put() in this other
patch [1], only pages *in transition* from shared to private state are
marked "guestmem", although it is true that no private folios or folios
marked guestmem are expected here.

> +	if (WARN_ON_ONCE(folio_test_guestmem(folio)))  {
> +		ret = VM_FAULT_SIGBUS;
> +		goto out_folio;
> +	}
> +
> +	/* No support for huge pages. */
> +	if (WARN_ON_ONCE(folio_test_large(folio))) {
> +		ret = VM_FAULT_SIGBUS;
> +		goto out_folio;
> +	}
> +
> +	if (!folio_test_uptodate(folio)) {
> +		clear_highpage(folio_page(folio, 0));
> +		kvm_gmem_mark_prepared(folio);
> +	}
> +
> +	vmf->page = folio_file_page(folio, vmf->pgoff);
> +
> +out_folio:
> +	if (ret != VM_FAULT_LOCKED) {
> +		folio_unlock(folio);
> +		folio_put(folio);
> +	}
> +
> +out_filemap:
> +	filemap_invalidate_unlock_shared(inode->i_mapping);
> +
> +	return ret;
> +}
>
> <snip>

[1] https://lore.kernel.org/all/20250117163001.2326672-7-tabba@google.com/

