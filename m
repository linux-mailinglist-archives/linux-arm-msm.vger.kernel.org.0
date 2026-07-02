Return-Path: <linux-arm-msm+bounces-116011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gRNJJc1bRmpzRgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116011-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:38:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3150D6F7B71
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:38:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YfjRFUXE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116011-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116011-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F315301D044
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:17:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8DF47CC69;
	Thu,  2 Jul 2026 12:17:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754183563F0;
	Thu,  2 Jul 2026 12:17:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782994621; cv=none; b=g4d5Szp9beIcBwuLfCCrsLMt1eqsKNgy6Og5esqhT4CGJoGgzb5yF03AzAkMjoLF+Qq/jBlaYHZ+dGebXaUpbKZUb/DAwAC61nxn2USpDxcOEDeuZ5YIhLdSSTsrXkEHw1zczwM7rhtUFLdEro8baufWUOlWBHa0gUL+vQmir4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782994621; c=relaxed/simple;
	bh=4h/zoa0EO0oEjCowB1soFdJQhwwlc7WmH55lSMsp9ng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SbRPk3fVgANmq8O61HVYKQoMM0+OX1sMfYbyl+f5ebfHx9tx5HrXyEQhkmZpfNDWRtMovdrN2KOAD9fLdlkaKneL+Gs0KlTvlCD9Pa5CCeHptV+kQxZOpdr9iI62R7sgsBaUxR6HTfTsH7zBdD9omNCweJRRJVi2ghYaIEhXMOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YfjRFUXE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE691F000E9;
	Thu,  2 Jul 2026 12:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782994620;
	bh=SmrhXKb/tICfou2fB2Dbzvn0JaPripZ9jvu2bmh8Jik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YfjRFUXEBU2dRmuBpB4h+tQRBLbIKpZBr7Vf/wGNH8GIbYIoOZ2+iJacKSoCbpVtS
	 nLyO5ja5AytCvhqwDq0QenPxKrMKslV49oH6XBSjalGtxG47SJjiMV7MT+tzXio6ce
	 JdlM4siO5IwFaYVLcm4KaNHxCA6hmUqsbOTyo9nlQqZd4lEWBGt33GCh9LZqRUfBBn
	 mcQd1A7BvVsZSb2TQuY2xdCzCh+UDajG+SL5GXiJNr7mmSLrWTVjj9rBrdT9z87G/T
	 Vy7FJvYKgcFqj/cL9xNXF6QvQ5MobsDT2Zofpc5Qxh41lYF1oSGL+QhpzzXdyRSPWv
	 bIXuhAyMKtIcQ==
Date: Thu, 2 Jul 2026 13:16:38 +0100
From: Lorenzo Stoakes <ljs@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Russell King <linux@armlinux.org.uk>, Dinh Nguyen <dinguyen@kernel.org>, 
	Simon Schuster <schuster.simon@siemens-energy.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Ian Abbott <abbotti@mev.co.uk>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>, Lucas Stach <l.stach@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, Ankit Agrawal <ankita@nvidia.com>, 
	Alex Williamson <alex@shazbot.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Matthew Wilcox <willy@infradead.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Steven Rostedt <rostedt@goodmis.org>, SeongJae Park <sj@kernel.org>, Miaohe Lin <linmiaohe@huawei.com>, 
	Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org, linux-sgx@vger.kernel.org, 
	etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, kvm@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, linux-mm@kvack.org, 
	iommu@lists.linux.dev, linux-perf-users@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, kasan-dev@googlegroups.com, damon@lists.linux.dev, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>
Subject: Re: [PATCH 20/30] mm/vma: introduce vma_assert_can_modify()
Message-ID: <akZNWNuyBU4xDDyf@lucifer>
References: <cover.1782735110.git.ljs@kernel.org>
 <23c7602c58cacc23ef22618a27af9a2d54addf58.1782735110.git.ljs@kernel.org>
 <akZHWwVgJfqCwA2W@pedro-suse.lan>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akZHWwVgJfqCwA2W@pedro-suse.lan>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116011-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:pfalcato@suse.de,m:akpm@linux-foundation.org,m:linux@armlinux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:l.stach@pengutronix.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:patrik.r.jakobsson@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:tomi.valkeinen@ideasonboard.com,m:thierry.reding@kernel.org,m:mperttunen@nvidia.com,m:jonathanh@nvidia.com,m:christian.koenig@amd.com,m:ray.huang@amd.com,m:ankita@nvidia.com,m:alex@shazbot.org,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:djbw@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:david@kernel.org,m:surenb@google.com,m:liam@infradead.org,m:willy@infradead.org,m:m.szypr
 owski@samsung.com,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:mhiramat@kernel.org,m:oleg@redhat.com,m:rostedt@goodmis.org,m:sj@kernel.org,m:linmiaohe@huawei.com,m:hughd@google.com,m:rppt@kernel.org,m:kees@kernel.org,m:pbonzini@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-parisc@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:etnaviv@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:linux-tegra@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:nvdimm@lists.linux.dev,m:linux-mm@kvack.org,m:iommu@lists.linux.dev,m:linux-perf-users@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:damon@lists.linux.dev,m:riel@surriel.com,m:harry@kernel.org,m:jannh@google.com,m:patrikrjakobsson@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,armlinux.org.uk,kernel.org,siemens-energy.com,hansenpartnership.com,gmx.de,redhat.com,alien8.de,linux.intel.com,mev.co.uk,visionengravers.com,pengutronix.de,gmail.com,ffwll.ch,suse.de,oss.qualcomm.com,ideasonboard.com,nvidia.com,amd.com,shazbot.org,zeniv.linux.org.uk,linux.dev,google.com,infradead.org,samsung.com,goodmis.org,huawei.com,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,lists.linux.dev,kvack.org,googlegroups.com,surriel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ljs@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3150D6F7B71

On Thu, Jul 02, 2026 at 12:16:32PM +0100, Pedro Falcato wrote:
> On Mon, Jun 29, 2026 at 01:23:31PM +0100, Lorenzo Stoakes wrote:
> > vma_assert_write_locked() and vma_assert_attached() are useful for their
> > own purposes, however VMA code absolutely does allow the modification of
> > non-write locked VMAs if they are at that point detached (i.e. unreachable
> > from anywhere).
> >
> > It's therefore useful to be able to assert that a VMA is either
> > detached (modification doesn't matter) or write locked (you're explicitly
> > locked for modification).
>
> Hmm, I was wondering why detached does not imply write_locked, and then

For one obviously when detaching they are also write locked (see
vma_mark_detached()) but yeah the point of this is when you have a VMA allocated
which doesn't hold the appropriate lock.

> realized that new VMAs aren't write-locked. Could we do it by default?
> Like a simple:
>
> 	vma->vm_lock_seq = __vma_raw_mm_seqnum(vma);
>
> might do the trick. I don't see why it wouldn't work? Is there some other
> case I am not considering?

Firstly, I'd rather not rework the VMA lock logic as part of this series. It's
subtle and such changes are tricky.

I'm trying to achieve the minimum changes while adding extra validation as I can
in preparation for the scalable CoW work.

And I'm not sure wanting to alter the fundamentals of VMA locks is a good reason
not to ack a patch :)

But since you bring it up...

There's subtleties here too.

- At what point do you do this assignment? If it's the VMA allocation logic,
  it's not obvious then that you even have the mmap write lock necessarily. Now
  you're making assumptions that might be broken, or broken in future.

  Now everybody who allocates a VMA has to 'just know' that they need to assign
  an mm and mark it write-locked (but in a special new VMA way) before setting
  the pgoff.

- Detached means it is not currently in any tree, nor belongs necessarily to any
  mm. So the concept of it being write locked is meaningless.

- It's broken to perform actions on a new VMA that is not yet linked into any
  tree that would require the VMA write lock. Currently the code _explicitly_
  asserts that a detached VMA is not attempted to be write locked.

- So we have a good way of catching people doing stupid or broken stuff to VMAs
  that are not in the correct state (we currently _don't_ do that for detached
  VMAs that _were_ in the tree, probably we should change that...!)

- You'd have to create a new function to do this since we explicitly disallow
  doing this right now, and that's more complexity and then you're then
  creating a whole new meaning as to what VMA write lock acquisition is,
  which is even more added complexity.

- create_init_stack_vma() would break, so would hugetlb (lol) and static gate
  VMAs explicitly do not belong to an mm, so there's simply no concept of them
  being VMA write locked anyway.

- I'm not sure violating the invariant of seqnum = 0 = no write locked VMAs is
  safe.

- Things get quite horrendous on fork (prior to us taking tmp's VMA write lock)
  - you'd have to assign this field after duplicating the VMA midway through
  attaching it to the new mm, where that mm has a new seqnum. But the new mm has
  a seqnum of 0... so now you're having to duplicate it but alter what
  vma_lock_init() does to reset the seqnum to 0 but then what if the
  'duplication' logic asserts VMA write locked?

It's very chicken and egg - on VMA duplication you want to be able to write the
very fields that you need to do anything with the VMA prior to it being linked
in anywhere.

And we probably don't want to bake in the assumption that to change fundamental
fields requires that you always hold the write lock as a consequence.

>
> >
> > Therefore introduce vma_assert_can_modify() for this purpose.
> >
> > While we're here, make vma_is_attached() available generally - if
> > !CONFIG_PER_VMA_LOCKS, then there's no sense in which a VMA is
> > detached (vma_mark_detached() is a noop), so have this default to true in
> > this case.
> >
> > Signed-off-by: Lorenzo Stoakes <ljs@kernel.org>
> > ---
> >  include/linux/mmap_lock.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/include/linux/mmap_lock.h b/include/linux/mmap_lock.h
> > index 04b8f61ece5d..d513286d8160 100644
> > --- a/include/linux/mmap_lock.h
> > +++ b/include/linux/mmap_lock.h
> > @@ -506,6 +506,8 @@ static inline __must_check
> >  int vma_start_write_killable(struct vm_area_struct *vma) { return 0; }
> >  static inline void vma_assert_write_locked(struct vm_area_struct *vma)
> >  		{ mmap_assert_write_locked(vma->vm_mm); }
> > +static inline bool vma_is_attached(struct vm_area_struct *vma)
> > +		{ return true; }
> >  static inline void vma_assert_attached(struct vm_area_struct *vma) {}
> >  static inline void vma_assert_detached(struct vm_area_struct *vma) {}
> >  static inline void vma_mark_attached(struct vm_area_struct *vma) {}
> > @@ -530,6 +532,12 @@ static inline void vma_assert_stabilised(struct vm_area_struct *vma)
> >
> >  #endif /* CONFIG_PER_VMA_LOCK */
> >
> > +static inline void vma_assert_can_modify(struct vm_area_struct *vma)
> > +{
> > +	if (vma_is_attached(vma))
> > +		vma_assert_write_locked(vma);
> > +}
> > +
> >  static inline void mmap_write_lock(struct mm_struct *mm)
> >  {
> >  	__mmap_lock_trace_start_locking(mm, true);
> > --
> > 2.54.0
> >
>
> --
> Pedro

Thanks, Lorenzo

