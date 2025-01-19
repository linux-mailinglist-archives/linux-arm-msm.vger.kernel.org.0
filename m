Return-Path: <linux-arm-msm+bounces-45514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A2991A16241
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 15:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17B5C18843E9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 14:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E8BF1DF24A;
	Sun, 19 Jan 2025 14:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pBcAjeCU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D4C1DED70
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 14:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737297637; cv=none; b=B0us1F65LzdQ5yMlljnV/2GmrvhCOAgtnnvKMjCZF+XKbiDWt7ifQXbzvSdo+K/mN2Cy3VQ+2TVHXkvqXcWq/aecCD3LWGVMNI9O0WQRmrJq1IbC3Ik2Zk0pRt9TOKnfVP+5Cr1hu6gWqVbkM36n7P4fIyx6jkfuHlaaf42Vas0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737297637; c=relaxed/simple;
	bh=iK+QlwMaOkaHjaTHgJGJg0BIN7roOg7rWdqeebnpM5g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rv6Xy5vAovkM1WAGi1vjjRBMeGJj81vGSAD0tMVDTKqiZ1+MppyPIygpFyrna0OjWdwSRcOWjD+SSKjp3qbJuFm3T912RITDXpAuBbeR0AL3+ORB+FCcTWL+HysnWIqnNYt6SCbpUkf45ftaUM0dyhk5nPVEFa/jL5AkgggAOUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pBcAjeCU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4368a290e0dso39225e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jan 2025 06:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737297633; x=1737902433; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yozjyOOVjvWJnBqKBHEFXaWCaRf+nsltbh0VmuJU/AU=;
        b=pBcAjeCUDtnUjMsD0aTv4hHJBWRea9ag3fMUgJ/ZqrFjNdkUiPMHujfq55jvdxRK61
         0+UW4NCx8fimu7d4Oa44H6rmVsOjfaVKNdazNqiuSajt/aN2Otg1igcunYBSDQ6WW0UU
         IKAaiCxOdSh3x891qC1F/rocWdS74MkWDS2zeXDRjfVbeXTrh/nruwIiT5WcJ240qjJS
         jqU7a6k7vwqSbFbwJiJTpBZ/tjgD6kt0bai+rUOgCjTeXXZK+zZe8VHft+aLQEHqo74B
         N23BgDqj6vUwEIxexFC2YTdYMjekpOalYKjvradSFrPHSM9egZ4R3ypp+Qc6S12oUc1r
         9FvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737297633; x=1737902433;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yozjyOOVjvWJnBqKBHEFXaWCaRf+nsltbh0VmuJU/AU=;
        b=CFHqvwOA1WUe5qijMxpCNY2OHmc4DOmul/XtS12J4tMMGWt39WIBCd8T7wYlse+Sqv
         BX4ApIWA7mNlA4ZOWBjw8Be0gbFI9YH4x84vFnRjChigSI9pzZj11dwjwnJs7ZwWAaky
         hk5DakN1CLeOHlYmRMEmVHMRg0NSE21EAGm4P1q5f+9ZkvpSQfbxN49JWi9sW7JnuPeF
         +809ZTdHT9nKmv1tqilt+YyF62JbA2Be7+k1iQ9jZeufFqpYMktVQN8ASDkITCnhwTIa
         Gyz+TEvZRhEYDyoLvzzDSfQ2SaDvI9HHK57WdgijPo25VsvSgVjwML7gnMmbGJKOc1Qf
         cWxw==
X-Forwarded-Encrypted: i=1; AJvYcCXf2Kw+Ye+3sSr5IgtwFX9XrgltPk02xIlUCvnhnox1MWaGyyeBEacKeGC/AOriJZq1xnS2jR6TDk5lWoo3@vger.kernel.org
X-Gm-Message-State: AOJu0YzD4CZKbsb8qrrw04M+DSHczg1OjPWtN9lIIzxujfzks5jI3rhu
	d/t29qJlWzt7feyUgb305Un4J3HSbZmpNC56nT9Z5gwGaOL8yXkCtZZumJ+NyUnwUXTMlvLvIkK
	jNOUdJQrvLQb6dg2o03XBy6KjPOXrX1RmITxW
X-Gm-Gg: ASbGncvvo4AEXwO/sLMIyEFhLU+jViCovOPtLzz3tElK73dWLneg2xU3oBW4M6Nrto+
	W3GYxuvr6it6SnWYm9e1Q9d/YlngWpSjIfCQq1ECofZRWiO+GJA==
X-Google-Smtp-Source: AGHT+IF9OmfsYNYAh14f5gkDAcnJeYGVY4k5QEJJiVg1RDgOf/8pqrGM2vF1v1I2qBCXAIbPAuAEY0CEq6gZ99y9swk=
X-Received: by 2002:a7b:c8d0:0:b0:436:1811:a79c with SMTP id
 5b1f17b1804b1-438a0f45bc4mr1415995e9.5.1737297633182; Sun, 19 Jan 2025
 06:40:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com> <20250117163001.2326672-2-tabba@google.com>
 <20250117135917364-0800.eberman@hu-eberman-lv.qualcomm.com>
In-Reply-To: <20250117135917364-0800.eberman@hu-eberman-lv.qualcomm.com>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 19 Jan 2025 14:39:56 +0000
X-Gm-Features: AbW1kvYFuoqqzdPWDUOJX5ZIcY6cxxqPuz3h9GeI5OeA0p3MfrZ12_kY3H6B7Hw
Message-ID: <CA+EHjTxQ5r_ybMhKBQvj9ep4pZnHo2K+aLMT+9uVyfanV_bZxw@mail.gmail.com>
Subject: Re: [RFC PATCH v5 01/15] mm: Consolidate freeing of typed folios on
 final folio_put()
To: Elliot Berman <elliot.berman@oss.qualcomm.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
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
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jan 2025 at 22:05, Elliot Berman
<elliot.berman@oss.qualcomm.com> wrote:
>
> On Fri, Jan 17, 2025 at 04:29:47PM +0000, Fuad Tabba wrote:
> > Some folio types, such as hugetlb, handle freeing their own
> > folios. Moreover, guest_memfd will require being notified once a
> > folio's reference count reaches 0 to facilitate shared to private
> > folio conversion, without the folio actually being freed at that
> > point.
> >
> > As a first step towards that, this patch consolidates freeing
> > folios that have a type. The first user is hugetlb folios. Later
> > in this patch series, guest_memfd will become the second user of
> > this.
> >
> > Suggested-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  include/linux/page-flags.h | 15 +++++++++++++++
> >  mm/swap.c                  | 24 +++++++++++++++++++-----
> >  2 files changed, 34 insertions(+), 5 deletions(-)
> >
> > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > index 691506bdf2c5..6615f2f59144 100644
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -962,6 +962,21 @@ static inline bool page_has_type(const struct page *page)
> >       return page_mapcount_is_type(data_race(page->page_type));
> >  }
> >
> > +static inline int page_get_type(const struct page *page)
> > +{
> > +     return page->page_type >> 24;
> > +}
> > +
> > +static inline bool folio_has_type(const struct folio *folio)
> > +{
> > +     return page_has_type(&folio->page);
> > +}
> > +
> > +static inline int folio_get_type(const struct folio *folio)
> > +{
> > +     return page_get_type(&folio->page);
> > +}
> > +
> >  #define FOLIO_TYPE_OPS(lname, fname)                                 \
> >  static __always_inline bool folio_test_##fname(const struct folio *folio) \
> >  {                                                                    \
> > diff --git a/mm/swap.c b/mm/swap.c
> > index 10decd9dffa1..6f01b56bce13 100644
> > --- a/mm/swap.c
> > +++ b/mm/swap.c
> > @@ -94,6 +94,20 @@ static void page_cache_release(struct folio *folio)
> >               unlock_page_lruvec_irqrestore(lruvec, flags);
> >  }
> >
> > +static void free_typed_folio(struct folio *folio)
> > +{
> > +     switch (folio_get_type(folio)) {
>
> I think you need:
>
> +#if IS_ENABLED(CONFIG_HUGETLBFS)
> > +     case PGTY_hugetlb:
> > +             free_huge_folio(folio);
> > +             return;
> +#endif
>
> I think this worked before because folio_test_hugetlb was defined by:
> FOLIO_TEST_FLAG_FALSE(hugetlb)
> and evidently compiler optimizes out the free_huge_folio(folio) before
> linking.
>
> You'll probably want to do the same for the PGTY_guestmem in the later
> patch!

Thanks Elliot. This will keep the kernel test robot happy when I respin.

Cheers,
/fuad

>
> > +     case PGTY_offline:
> > +             /* Nothing to do, it's offline. */
> > +             return;
> > +     default:
> > +             WARN_ON_ONCE(1);
> > +     }
> > +}
> > +
> >  void __folio_put(struct folio *folio)
> >  {
> >       if (unlikely(folio_is_zone_device(folio))) {
> > @@ -101,8 +115,8 @@ void __folio_put(struct folio *folio)
> >               return;
> >       }
> >
> > -     if (folio_test_hugetlb(folio)) {
> > -             free_huge_folio(folio);
> > +     if (unlikely(folio_has_type(folio))) {
> > +             free_typed_folio(folio);
> >               return;
> >       }
> >
> > @@ -934,13 +948,13 @@ void folios_put_refs(struct folio_batch *folios, unsigned int *refs)
> >               if (!folio_ref_sub_and_test(folio, nr_refs))
> >                       continue;
> >
> > -             /* hugetlb has its own memcg */
> > -             if (folio_test_hugetlb(folio)) {
> > +             if (unlikely(folio_has_type(folio))) {
> > +                     /* typed folios have their own memcg, if any */
> >                       if (lruvec) {
> >                               unlock_page_lruvec_irqrestore(lruvec, flags);
> >                               lruvec = NULL;
> >                       }
> > -                     free_huge_folio(folio);
> > +                     free_typed_folio(folio);
> >                       continue;
> >               }
> >               folio_unqueue_deferred_split(folio);
> > --
> > 2.48.0.rc2.279.g1de40edade-goog
> >

