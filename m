Return-Path: <linux-arm-msm+bounces-28024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBC99498FA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 22:23:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A26171C22A08
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 20:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89FC156F57;
	Tue,  6 Aug 2024 20:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QZH/TLUw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC99154456;
	Tue,  6 Aug 2024 20:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722975774; cv=none; b=Ev6cMy1dkCZhLKB6yp1R40Hi1IGgjWUjU+0YR6WeqfyrVpUCR9k7BU44GPibhjE9Gt/YnwAAv6kvTIgteoyjIuE0J6B2PgwucY8A8THHo6Y/ffmpvTDYxNjdLRv9DTZYGUQnfX+9MSgLr5idY/jfYzkL2yGt2B4tQfFZ/eceeuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722975774; c=relaxed/simple;
	bh=TY6f8pNd0cr+QT8C1kohEVZIzfafZi6S11iUn1oYBhY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRjUA7MZLfse5dsx3EaamKZsKZSVoMw8eYIube9H+svtxv0UyAZCyyXTipRmh4n6VhPLM9kiYtMpHQr7CzJxq53KYTjcmye2CR9sGxDrOb/XIo2e/M7bXwn3xvnZMWwOgCt13qoOhmuIaX0ySAiZu2gezS2W138MVLJfKYuGYIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QZH/TLUw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 476H6PwF021367;
	Tue, 6 Aug 2024 20:22:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BBlTeFnE7JwT289WHX8R8uc1
	yM9udBv+d/JlHuiwrMA=; b=QZH/TLUwARRS7w6uXMmmihBOpBl0WZZOu6XMzsGA
	wEO5lZQC81r5+CRmSbw51kj+zobRTp0pUfdv1Tk/L0dxbAsyfLdafguX+wxPYd/3
	ieJyZiNsbYfa16D51tvjjXPVqbaN4STAzijYTf2Blp5EXTHhpw4T2nTXcaUNu+n1
	6/dgBOI7HNaN1CmCoLWe4JgsbcFH6M5072nqw0EIzYLvmu36r3e1McP5kpBJGEGf
	DpV7EFT7QT72pWj944NJ7rBdnRg0hF1hDP5xjvpoy8iwIJMKBekfaeIEGv9OyiF5
	So39b0K0wrQFIIXYO2aQsa/ErB+/hK94gOyQPNWYVegTpQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40sbgs0m9r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Aug 2024 20:22:39 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 476KMc4T019264
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Aug 2024 20:22:38 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 Aug 2024 13:22:38 -0700
Date: Tue, 6 Aug 2024 13:22:37 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Patrick Roy <roypat@amazon.co.uk>
CC: Andrew Morton <akpm@linux-foundation.org>,
        Paolo Bonzini
	<pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Fuad Tabba
	<tabba@google.com>, David Hildenbrand <david@redhat.com>,
        <qperret@google.com>, Ackerley Tng <ackerleytng@google.com>,
        <linux-coco@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mm@kvack.org>,
        <kvm@vger.kernel.org>, James Gowans <jgowans@amazon.com>,
        "Kalyazin, Nikita"
	<kalyazin@amazon.co.uk>,
        "Manwaring, Derek" <derekmn@amazon.com>,
        "Cali,
 Marco" <xmarcalx@amazon.co.uk>
Subject: Re: [PATCH RFC 4/4] mm: guest_memfd: Add ability for mmap'ing pages
Message-ID: <20240806131414227-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240805-guest-memfd-lib-v1-0-e5a29a4ff5d7@quicinc.com>
 <20240805-guest-memfd-lib-v1-4-e5a29a4ff5d7@quicinc.com>
 <6660faa6-4cea-4ddc-a378-ab9da9139ee9@amazon.co.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6660faa6-4cea-4ddc-a378-ab9da9139ee9@amazon.co.uk>
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mdSPtmW9SHd5qJ3JZs6gl0Ehu-m8G6s1
X-Proofpoint-GUID: mdSPtmW9SHd5qJ3JZs6gl0Ehu-m8G6s1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-06_16,2024-08-06_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408060142

On Tue, Aug 06, 2024 at 04:48:22PM +0100, Patrick Roy wrote:
> On Mon, 2024-08-05 at 19:34 +0100, Elliot Berman wrote:
> > Confidential/protected guest virtual machines want to share some memory
> > back with the host Linux. For example, virtqueues allow host and
> > protected guest to exchange data. In MMU-only isolation of protected
> > guest virtual machines, the transition between "shared" and "private"
> > can be done in-place without a trusted hypervisor copying pages.
> > 
> > Add support for this feature and allow Linux to mmap host-accessible
> > pages. When the owner provides an ->accessible() callback in the
> > struct guest_memfd_operations, guest_memfd allows folios to be mapped
> > when the ->accessible() callback returns 0.
> 
> Wouldn't the set of inaccessible folios always match exactly the set of
> folios that have PG_private=1 set? At least guest_memfd instances that
> have GUEST_MEMFD_FLAG_NO_DIRECT_MAP set, having folios without direct
> map entries marked "accessible" sound like it may cause a lot of mayhem
> (as those folios would essentially be secretmem folios, but this time
> without the GUP checks). But even more generally, wouldn't tracking
> accessibility via PG_private be enough?
> 

Mostly that is what is happening. The ->accessible() test allows
guest_memfd to initialize PG_private to the right value and to attempt
to convert private back to shared in the case of host trying to access
the page.

> > To safely make inaccessible:
> > 
> > ```
> > folio = guest_memfd_grab_folio(inode, index, flags);
> > r = guest_memfd_make_inaccessible(inode, folio);
> > if (r)
> >         goto err;
> > 
> > hypervisor_does_guest_mapping(folio);
> > 
> > folio_unlock(folio);
> > ```
> > 
> > hypervisor_does_s2_mapping(folio) should make it so
> > ops->accessible(...) on those folios fails.
> > 
> > The folio lock ensures atomicity.
> > 
> > Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> > ---
> >  include/linux/guest_memfd.h |  7 ++++
> >  mm/guest_memfd.c            | 81 ++++++++++++++++++++++++++++++++++++++++++++-
> >  2 files changed, 87 insertions(+), 1 deletion(-)
> > 
> > diff --git a/include/linux/guest_memfd.h b/include/linux/guest_memfd.h
> > index f9e4a27aed67..edcb4ba60cb0 100644
> > --- a/include/linux/guest_memfd.h
> > +++ b/include/linux/guest_memfd.h
> > @@ -16,12 +16,18 @@
> >   * @invalidate_end: called after invalidate_begin returns success. Optional.
> >   * @prepare: called before a folio is mapped into the guest address space.
> >   *           Optional.
> > + * @accessible: called after prepare returns success and before it's mapped
> > + *              into the guest address space. Returns 0 if the folio can be
> > + *              accessed.
> > + *              Optional. If not present, assumes folios are never accessible.
> >   * @release: Called when releasing the guest_memfd file. Required.
> >   */
> >  struct guest_memfd_operations {
> >         int (*invalidate_begin)(struct inode *inode, pgoff_t offset, unsigned long nr);
> >         void (*invalidate_end)(struct inode *inode, pgoff_t offset, unsigned long nr);
> >         int (*prepare)(struct inode *inode, pgoff_t offset, struct folio *folio);
> > +       int (*accessible)(struct inode *inode, struct folio *folio,
> > +                         pgoff_t offset, unsigned long nr);
> >         int (*release)(struct inode *inode);
> >  };
> > 
> > @@ -48,5 +54,6 @@ struct file *guest_memfd_alloc(const char *name,
> >                                const struct guest_memfd_operations *ops,
> >                                loff_t size, unsigned long flags);
> >  bool is_guest_memfd(struct file *file, const struct guest_memfd_operations *ops);
> > +int guest_memfd_make_inaccessible(struct file *file, struct folio *folio);
> > 
> >  #endif
> > diff --git a/mm/guest_memfd.c b/mm/guest_memfd.c
> > index e9d8cab72b28..6b5609932ca5 100644
> > --- a/mm/guest_memfd.c
> > +++ b/mm/guest_memfd.c
> > @@ -9,6 +9,8 @@
> >  #include <linux/pagemap.h>
> >  #include <linux/set_memory.h>
> > 
> > +#include "internal.h"
> > +
> >  static inline int guest_memfd_folio_private(struct folio *folio)
> >  {
> >         unsigned long nr_pages = folio_nr_pages(folio);
> > @@ -89,7 +91,7 @@ struct folio *guest_memfd_grab_folio(struct file *file, pgoff_t index, u32 flags
> >                         goto out_err;
> >         }
> > 
> > -       if (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP) {
> > +       if (!ops->accessible && (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)) {
> >                 r = guest_memfd_folio_private(folio);
> >                 if (r)
> >                         goto out_err;
> > @@ -107,6 +109,82 @@ struct folio *guest_memfd_grab_folio(struct file *file, pgoff_t index, u32 flags
> >  }
> >  EXPORT_SYMBOL_GPL(guest_memfd_grab_folio);
> > 
> > +int guest_memfd_make_inaccessible(struct file *file, struct folio *folio)
> > +{
> > +       unsigned long gmem_flags = (unsigned long)file->private_data;
> > +       unsigned long i;
> > +       int r;
> > +
> > +       unmap_mapping_folio(folio);
> > +
> > +       /**
> > +        * We can't use the refcount. It might be elevated due to
> > +        * guest/vcpu trying to access same folio as another vcpu
> > +        * or because userspace is trying to access folio for same reason
> > +        *
> > +        * folio_lock serializes the transitions between (in)accessible
> > +        */
> > +       if (folio_maybe_dma_pinned(folio))
> > +               return -EBUSY;
> > +
> > +       if (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP) {
> > +               r = guest_memfd_folio_private(folio);
> > +               if (r)
> > +                       return r;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static vm_fault_t gmem_fault(struct vm_fault *vmf)
> > +{
> > +       struct file *file = vmf->vma->vm_file;
> > +       struct inode *inode = file_inode(file);
> > +       const struct guest_memfd_operations *ops = inode->i_private;
> > +       struct folio *folio;
> > +       pgoff_t off;
> > +       int r;
> > +
> > +       folio = guest_memfd_grab_folio(file, vmf->pgoff, GUEST_MEMFD_GRAB_UPTODATE);
> > +       if (!folio)
> > +               return VM_FAULT_SIGBUS;
> > +
> > +       off = vmf->pgoff & (folio_nr_pages(folio) - 1);
> > +       r = ops->accessible(inode, folio, off, 1);
> > +       if (r) {
> 
> This made be stumble at first. I know you say ops->accessible returning
> 0 means "this is accessible", but if I only look at this if-statement it
> reads as "if the folio is accessible, send a SIGBUS", which is not
> what's actually happening.
> 

I'll change it to return a bool :)

> > +               folio_unlock(folio);
> > +               folio_put(folio);
> > +               return VM_FAULT_SIGBUS;
> > +       }
> > +
> > +       guest_memfd_folio_clear_private(folio);
> > +
> > +       vmf->page = folio_page(folio, off);
> > +
> > +       return VM_FAULT_LOCKED;
> > +}
> > +
> > +static const struct vm_operations_struct gmem_vm_ops = {
> > +       .fault = gmem_fault,
> > +};
> > +
> > +static int gmem_mmap(struct file *file, struct vm_area_struct *vma)
> > +{
> > +       const struct guest_memfd_operations *ops = file_inode(file)->i_private;
> > +
> > +       if (!ops->accessible)
> > +               return -EPERM;
> > +
> > +       /* No support for private mappings to avoid COW.  */
> > +       if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) !=
> > +           (VM_SHARED | VM_MAYSHARE))
> > +               return -EINVAL;
> > +
> > +       file_accessed(file);
> > +       vma->vm_ops = &gmem_vm_ops;
> > +       return 0;
> > +}
> > +
> >  static long gmem_punch_hole(struct file *file, loff_t offset, loff_t len)
> >  {
> >         struct inode *inode = file_inode(file);
> > @@ -220,6 +298,7 @@ static int gmem_release(struct inode *inode, struct file *file)
> >  static struct file_operations gmem_fops = {
> >         .open = generic_file_open,
> >         .llseek = generic_file_llseek,
> > +       .mmap = gmem_mmap,
> >         .release = gmem_release,
> >         .fallocate = gmem_fallocate,
> >         .owner = THIS_MODULE,
> > 
> > --
> > 2.34.1
> > 

