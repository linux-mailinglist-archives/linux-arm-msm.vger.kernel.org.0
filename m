Return-Path: <linux-arm-msm+bounces-28187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C53994C4E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 20:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FB7C1C2327D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 18:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BC814EC62;
	Thu,  8 Aug 2024 18:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v8JN1Ah7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7C513D63E
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Aug 2024 18:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723143079; cv=none; b=QaDAFJpTerHjp11tsOhR7QST+T+KflCk1EmVL/aeveCm/PVmhK/tTREFGeuWI0X1Cx5xbQ2fZMRw8iq2JHBBzVEQQ9gHxkTivpu2qPqXcfx1hjlD9+o2xd+ZkhfwpiIUmt+wqmZPaetBVW+gwD7M2k/zuQ/JDEvuO0JD6Oq27EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723143079; c=relaxed/simple;
	bh=HisdoPQ3ufUq0Bsxr5WN1JnYKaQE8dTsbl30zp8Axw0=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=ep6EYihNDXmNe/1BMdlT3EW2jEsP8gUIRRpPAEEyw2PX7rH5HQBheFcWPvUMG+3HE1gIWjDqg+0iKHNGH49+wujGGIwRlMNeCJ89AmYZJEJakIuVIEJ/uhniYz4WjrTZ9nCDm7UyJA3UpfJrXzVJcJ+wSoH7xiAd5Pgn/7ddKxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v8JN1Ah7; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-68d1d966c06so29290037b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Aug 2024 11:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723143075; x=1723747875; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=919ShyHXnz4ZPgDMjJG3RZAqRy1mIJY8sd8tW4tTOc4=;
        b=v8JN1Ah7JkQ+OT/XDBx0PeCiDAyyCqgqUJ1v4ytOUVu25P0+vcrxaSIEeWJ3BsbXX6
         6MfqHo2JhMOIJiixWY9c/y5lc/tJctCkiFziKRP6FnVGDtPom7K4ovLtr7Fi3+WHx9nV
         a/3zUZ/tvWY0WfW+5akmjz8zRtS7gq93B4tPz6CuqlBWgpEP63PwrkTaT4a7kCIdYc5D
         tvUCHJpVvQjVXlcMFl6cI7A6LYUvSbr2Q016YKUl0L9ab/f1v40Vq140tSqcW1xJZ9Nc
         vOg065BS/uyRtIBZw/oilxr0oTRP8mnJyzaKDvoLIzHo6cDyOe5zF16i3rfygT+SbKY7
         Rp4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723143075; x=1723747875;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=919ShyHXnz4ZPgDMjJG3RZAqRy1mIJY8sd8tW4tTOc4=;
        b=FwcsFMBvobZYvqF4dBfasRnFv0naqst3r9edLNC1yRgceLXHvvf/2wYOlOctWTlFJN
         9beXiNcxWa8mXE2qm3YWs9PA7QPDX2ffiibvSU/ReZg46aUk3WscjxCHf1snL+UXs01I
         iIcaACoxAx09N/Vy+PrJPpdPBN7JOKbBrq2gQFL5M8i0R2o9zSS2jVmMxBTS1OR5LUL1
         A1A0wVpUqZycglxm3iZh8JdQOFaeYxMGMUqntHktl/iNgxdqj2SEZpVQdx2lAMFC6n5h
         cOidm+JPXjyKfVjkRys/uZekotlOL2+TGX2WG6gG1wgNWCAYNYjo2RDQJsYTTGVxWyoS
         qwXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZwTuV4zj8n4EpZW+yEYlNa06YGWKtS5d86Snp4uv8UL0R6VEnR+V2QYvono5u210/rt/peerD+sQ0I8yYibPfm/S8h9OskYAneslfMA==
X-Gm-Message-State: AOJu0YyDSfxhmIXw514aCZMEHCeuwKeJdcaPX9qLa5WGoISsYjenNiNQ
	dUaDGsi9uN3ON2TJyFt5+lVL7FhfRejpPWMPAOSEPx0JN4G2oaGGvP+cBoe7AP+Dt9tYKe2GlCn
	QDLqqt1H6aZ61xUpp0sVC5g==
X-Google-Smtp-Source: AGHT+IEQ5328hwjTps5oONpSGlg1a6NprZPK1p18tP35idYNnnBAOTa7CiEvSSWe9UK3Repz5BAXsBLnBKJASbX0QA==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a0d:c1c4:0:b0:648:3f93:68e0 with SMTP
 id 00721157ae682-69bfbf94870mr995347b3.6.1723143075568; Thu, 08 Aug 2024
 11:51:15 -0700 (PDT)
Date: Thu, 08 Aug 2024 18:51:14 +0000
In-Reply-To: <20240805-guest-memfd-lib-v1-4-e5a29a4ff5d7@quicinc.com> (message
 from Elliot Berman on Mon, 5 Aug 2024 11:34:50 -0700)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqzr0ayn90d.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [PATCH RFC 4/4] mm: guest_memfd: Add ability for mmap'ing pages
From: Ackerley Tng <ackerleytng@google.com>
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: akpm@linux-foundation.org, pbonzini@redhat.com, seanjc@google.com, 
	tabba@google.com, david@redhat.com, roypat@amazon.co.uk, qperret@google.com, 
	linux-coco@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org, 
	quic_eberman@quicinc.com
Content-Type: text/plain; charset="UTF-8"

Elliot Berman <quic_eberman@quicinc.com> writes:

> Confidential/protected guest virtual machines want to share some memory
> back with the host Linux. For example, virtqueues allow host and
> protected guest to exchange data. In MMU-only isolation of protected
> guest virtual machines, the transition between "shared" and "private"
> can be done in-place without a trusted hypervisor copying pages.
>
> Add support for this feature and allow Linux to mmap host-accessible
> pages. When the owner provides an ->accessible() callback in the
> struct guest_memfd_operations, guest_memfd allows folios to be mapped
> when the ->accessible() callback returns 0.
>
> To safely make inaccessible:
>
> ```
> folio = guest_memfd_grab_folio(inode, index, flags);
> r = guest_memfd_make_inaccessible(inode, folio);
> if (r)
>         goto err;
>
> hypervisor_does_guest_mapping(folio);
>
> folio_unlock(folio);
> ```
>
> hypervisor_does_s2_mapping(folio) should make it so
> ops->accessible(...) on those folios fails.
>
> The folio lock ensures atomicity.

I am also working on determining faultability not based on the
private-ness of the page but based on permission given by the
guest. I'd like to learn from what you've discovered here.

Could you please elaborate on this? What races is the folio_lock
intended to prevent, what operations are we ensuring atomicity of?

Is this why you did a guest_memfd_grab_folio() before checking
->accessible(), and then doing folio_unlock() if the page is
inaccessible?

>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  include/linux/guest_memfd.h |  7 ++++
>  mm/guest_memfd.c            | 81 ++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 87 insertions(+), 1 deletion(-)
>
> diff --git a/include/linux/guest_memfd.h b/include/linux/guest_memfd.h
> index f9e4a27aed67..edcb4ba60cb0 100644
> --- a/include/linux/guest_memfd.h
> +++ b/include/linux/guest_memfd.h
> @@ -16,12 +16,18 @@
>   * @invalidate_end: called after invalidate_begin returns success. Optional.
>   * @prepare: called before a folio is mapped into the guest address space.
>   *           Optional.
> + * @accessible: called after prepare returns success and before it's mapped
> + *              into the guest address space. Returns 0 if the folio can be
> + *              accessed.
> + *              Optional. If not present, assumes folios are never accessible.
>   * @release: Called when releasing the guest_memfd file. Required.
>   */
>  struct guest_memfd_operations {
>  	int (*invalidate_begin)(struct inode *inode, pgoff_t offset, unsigned long nr);
>  	void (*invalidate_end)(struct inode *inode, pgoff_t offset, unsigned long nr);
>  	int (*prepare)(struct inode *inode, pgoff_t offset, struct folio *folio);
> +	int (*accessible)(struct inode *inode, struct folio *folio,
> +			  pgoff_t offset, unsigned long nr);
>  	int (*release)(struct inode *inode);
>  };
>  
> @@ -48,5 +54,6 @@ struct file *guest_memfd_alloc(const char *name,
>  			       const struct guest_memfd_operations *ops,
>  			       loff_t size, unsigned long flags);
>  bool is_guest_memfd(struct file *file, const struct guest_memfd_operations *ops);
> +int guest_memfd_make_inaccessible(struct file *file, struct folio *folio);
>  
>  #endif
> diff --git a/mm/guest_memfd.c b/mm/guest_memfd.c
> index e9d8cab72b28..6b5609932ca5 100644
> --- a/mm/guest_memfd.c
> +++ b/mm/guest_memfd.c
> @@ -9,6 +9,8 @@
>  #include <linux/pagemap.h>
>  #include <linux/set_memory.h>
>  
> +#include "internal.h"
> +
>  static inline int guest_memfd_folio_private(struct folio *folio)
>  {
>  	unsigned long nr_pages = folio_nr_pages(folio);
> @@ -89,7 +91,7 @@ struct folio *guest_memfd_grab_folio(struct file *file, pgoff_t index, u32 flags
>  			goto out_err;
>  	}
>  
> -	if (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP) {
> +	if (!ops->accessible && (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)) {
>  		r = guest_memfd_folio_private(folio);
>  		if (r)
>  			goto out_err;
> @@ -107,6 +109,82 @@ struct folio *guest_memfd_grab_folio(struct file *file, pgoff_t index, u32 flags
>  }
>  EXPORT_SYMBOL_GPL(guest_memfd_grab_folio);
>  
> +int guest_memfd_make_inaccessible(struct file *file, struct folio *folio)
> +{
> +	unsigned long gmem_flags = (unsigned long)file->private_data;
> +	unsigned long i;
> +	int r;
> +
> +	unmap_mapping_folio(folio);
> +
> +	/**
> +	 * We can't use the refcount. It might be elevated due to
> +	 * guest/vcpu trying to access same folio as another vcpu
> +	 * or because userspace is trying to access folio for same reason
> +	 *
> +	 * folio_lock serializes the transitions between (in)accessible
> +	 */
> +	if (folio_maybe_dma_pinned(folio))
> +		return -EBUSY;
> +
> +	if (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP) {
> +		r = guest_memfd_folio_private(folio);
> +		if (r)
> +			return r;
> +	}
> +
> +	return 0;
> +}
> +
> +static vm_fault_t gmem_fault(struct vm_fault *vmf)
> +{
> +	struct file *file = vmf->vma->vm_file;
> +	struct inode *inode = file_inode(file);
> +	const struct guest_memfd_operations *ops = inode->i_private;
> +	struct folio *folio;
> +	pgoff_t off;
> +	int r;
> +
> +	folio = guest_memfd_grab_folio(file, vmf->pgoff, GUEST_MEMFD_GRAB_UPTODATE);

Could grabbing the folio with GUEST_MEMFD_GRAB_UPTODATE cause unintended
zeroing of the page if the page turns out to be inaccessible?

> +	if (!folio)
> +		return VM_FAULT_SIGBUS;
> +
> +	off = vmf->pgoff & (folio_nr_pages(folio) - 1);
> +	r = ops->accessible(inode, folio, off, 1);
> +	if (r) {
> +		folio_unlock(folio);
> +		folio_put(folio);
> +		return VM_FAULT_SIGBUS;
> +	}
> +
> +	guest_memfd_folio_clear_private(folio);
> +
> +	vmf->page = folio_page(folio, off);
> +
> +	return VM_FAULT_LOCKED;
> +}
> +
> +static const struct vm_operations_struct gmem_vm_ops = {
> +	.fault = gmem_fault,
> +};
> +
> +static int gmem_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +	const struct guest_memfd_operations *ops = file_inode(file)->i_private;
> +
> +	if (!ops->accessible)
> +		return -EPERM;
> +
> +	/* No support for private mappings to avoid COW.  */
> +	if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) !=
> +	    (VM_SHARED | VM_MAYSHARE))
> +		return -EINVAL;
> +
> +	file_accessed(file);
> +	vma->vm_ops = &gmem_vm_ops;
> +	return 0;
> +}
> +
>  static long gmem_punch_hole(struct file *file, loff_t offset, loff_t len)
>  {
>  	struct inode *inode = file_inode(file);
> @@ -220,6 +298,7 @@ static int gmem_release(struct inode *inode, struct file *file)
>  static struct file_operations gmem_fops = {
>  	.open = generic_file_open,
>  	.llseek = generic_file_llseek,
> +	.mmap = gmem_mmap,
>  	.release = gmem_release,
>  	.fallocate = gmem_fallocate,
>  	.owner = THIS_MODULE,

