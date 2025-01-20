Return-Path: <linux-arm-msm+bounces-45571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB92A16AF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 11:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 45C903A4E35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 10:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 075971B4F15;
	Mon, 20 Jan 2025 10:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P0GktQo7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3175C14387B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 10:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737369689; cv=none; b=fbMtQAH48D92aXMyad1iBJM7fymv1qiJKGfDFyvxHYDSWRznXci8Ojzr+fDk0ZR8xukkN/d+4mjPv19mSJasaoJPArvLmnLnbvWspVPleEB2dK/N7l4dN3OiVXm48MX9ojMpetdXynqSDFubAoocz1AUVkeckUJEvauMAflrZPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737369689; c=relaxed/simple;
	bh=X6rzbi/DOyJt96CiJTUfqNxFG+FmcgUKxIxrzmRXXAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bqv+WAG3j9CrQw8wXjlh9P0UHXRYkgooj7ua2/tzSMWa+k1Ub/zAsdnPJeVpl55SakK1G28EMgr2zjGx1eCAOP4w4TluNM2EIaDgCL5RoLJSAO8rChrR0dF8ehrj6ASgv2waH2MblJxLTN8jot83AH2lAdY9Il2ICKjDzT8f588=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P0GktQo7; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43621d2dd4cso74815e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 02:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737369686; x=1737974486; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wa8U7ekwRqzLAwTlgofMJWDrrrDutQV4QhHlQEndWGc=;
        b=P0GktQo70YZrnF3DFzME+2I73sivY8UF7L86bpdiFSvMB3qT5satnYvBnzij8HzNxl
         WErIC8GdWZ0dsenVyWl+aUA4VFEdmosmR5+tduKEEt9YBomywfqTYHfQQzzU/xisSD7Q
         nEsjXN8cCny0y2ei0MwAzD9h/6JFhEi6FbeeH38H9vlOg5G5Vjf1cGMQ3zWL8Z0b6Viu
         YMNTkeKnkwH1ToYjzMQk/QI4y0WSSNV8Nfcorcmjo9jVPwe6zkemckAczLj0Yc8uJlY/
         Xy3xkAOLsz6V8xbLuf9mnpHbr+VGOEnTBpzmwAnEPwFEdI47/DYPvBr1fC1/E1MKfImX
         amxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737369686; x=1737974486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wa8U7ekwRqzLAwTlgofMJWDrrrDutQV4QhHlQEndWGc=;
        b=Vh3YAMsEfY6su3/EPnz8Lcs7JD9FNjs2Egm2VIfCEO3yKadZUcF+wto+uiMw7k9c5p
         VoYhoiU+NGWxyMLRFXsHcwQ5qYb6Gb/CXx4KlTuQlexCwzJO3zDEvuJID4HqT0k9BDLn
         Yfi7FHQiGX9S35PyhfiWKxIbok9+xWNG8syJDdgwPIsw+EsYRxSNDXaJ+a8BWIrr9wN5
         UV0YEbFREaz5lXtWz8+0H8kbNo0ioX3Z+zTPqlekzdCzcnRzX7jp7qi79BWa6b9WLag/
         /Sq/EH4qToJL4xRuYOJRYPfP1WojIjnI+JtUtgvy81XTZLZ0qOXRexc9i9lQ7CKRMfuK
         2tyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMT9vUuLNY1QQMaxFM8DUS0jkJCz1j92jBnisxFg8ad2bWMh1UjTD6SosIrcpYkY9U5SflnSmaoAgBGbf4@vger.kernel.org
X-Gm-Message-State: AOJu0Yz98i04USYShY63/21vEJlNd0XvSiLOTvwKJ9nd493/FwNykBmM
	MIma6MRKY8RvedgcnjTvcJRqa2zBAoUXNsAvaA3EMWgZJdo4igN1Lm0NpV2QzEb+VT4nhBW9we5
	1uxgXbL19zNRhFXMl1eZcxNuxin6pj5kuXFQY
X-Gm-Gg: ASbGnctV7AX/u9OCaBAFDAWxeS1U2DX+8ku/nAyk7Ejv6Ui/MOIsz3mECvhG1Fo/pg9
	Va8jM9i7cXNvA7dEyj8bCBi7/XPojAF160S70tqtuu0bJ4nOoqA==
X-Google-Smtp-Source: AGHT+IH8V90wUWmza7AHfIRy6XGoAOzH/BHgH1iFvRMewjUCt2v1FkW0WfzG9YSgoTPWS8RLVSaEKE3KU2xpoH2YkDs=
X-Received: by 2002:a05:600c:160a:b0:42c:9e35:cde6 with SMTP id
 5b1f17b1804b1-438a08f2f4amr2342115e9.2.1737369686185; Mon, 20 Jan 2025
 02:41:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com> <20250117163001.2326672-6-tabba@google.com>
 <r425iid27x5ybtm4awz3gx2sxibuhlsr6me3e6e3kjtl5nuwia@2xgh3frgoovs>
In-Reply-To: <r425iid27x5ybtm4awz3gx2sxibuhlsr6me3e6e3kjtl5nuwia@2xgh3frgoovs>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 20 Jan 2025 10:40:49 +0000
X-Gm-Features: AbW1kvY0Ctf9m93HrlbiEv-nOB8N3ILayL1LhKZu0dv-V19y4dKMdkR14DjXPsg
Message-ID: <CA+EHjTzRnGoY_bPcV4VFb-ORi5Z4qYTdQ-w4A0nsB91bUAOuAg@mail.gmail.com>
Subject: Re: [RFC PATCH v5 05/15] KVM: guest_memfd: Folio mappability states
 and functions that manage their transition
To: "Kirill A. Shutemov" <kirill@shutemov.name>
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

On Mon, 20 Jan 2025 at 10:30, Kirill A. Shutemov <kirill@shutemov.name> wrote:
>
> On Fri, Jan 17, 2025 at 04:29:51PM +0000, Fuad Tabba wrote:
> > +/*
> > + * Marks the range [start, end) as not mappable by the host. If the host doesn't
> > + * have any references to a particular folio, then that folio is marked as
> > + * mappable by the guest.
> > + *
> > + * However, if the host still has references to the folio, then the folio is
> > + * marked and not mappable by anyone. Marking it is not mappable allows it to
> > + * drain all references from the host, and to ensure that the hypervisor does
> > + * not transition the folio to private, since the host still might access it.
> > + *
> > + * Usually called when guest unshares memory with the host.
> > + */
> > +static int gmem_clear_mappable(struct inode *inode, pgoff_t start, pgoff_t end)
> > +{
> > +     struct xarray *mappable_offsets = &kvm_gmem_private(inode)->mappable_offsets;
> > +     void *xval_guest = xa_mk_value(KVM_GMEM_GUEST_MAPPABLE);
> > +     void *xval_none = xa_mk_value(KVM_GMEM_NONE_MAPPABLE);
> > +     pgoff_t i;
> > +     int r = 0;
> > +
> > +     filemap_invalidate_lock(inode->i_mapping);
> > +     for (i = start; i < end; i++) {
> > +             struct folio *folio;
> > +             int refcount = 0;
> > +
> > +             folio = filemap_lock_folio(inode->i_mapping, i);
> > +             if (!IS_ERR(folio)) {
> > +                     refcount = folio_ref_count(folio);
> > +             } else {
> > +                     r = PTR_ERR(folio);
> > +                     if (WARN_ON_ONCE(r != -ENOENT))
> > +                             break;
> > +
> > +                     folio = NULL;
> > +             }
> > +
> > +             /* +1 references are expected because of filemap_lock_folio(). */
> > +             if (folio && refcount > folio_nr_pages(folio) + 1) {
>
> Looks racy.
>
> What prevent anybody from obtaining a reference just after check?
>
> Lock on folio doesn't stop random filemap_get_entry() from elevating the
> refcount.
>
> folio_ref_freeze() might be required.

I thought the folio lock would be sufficient, but you're right,
nothing prevents getting a reference after the check. I'll use a
folio_ref_freeze() when I respin.

Thanks,
/fuad

> > +                     /*
> > +                      * Outstanding references, the folio cannot be faulted
> > +                      * in by anyone until they're dropped.
> > +                      */
> > +                     r = xa_err(xa_store(mappable_offsets, i, xval_none, GFP_KERNEL));
> > +             } else {
> > +                     /*
> > +                      * No outstanding references. Transition the folio to
> > +                      * guest mappable immediately.
> > +                      */
> > +                     r = xa_err(xa_store(mappable_offsets, i, xval_guest, GFP_KERNEL));
> > +             }
> > +
> > +             if (folio) {
> > +                     folio_unlock(folio);
> > +                     folio_put(folio);
> > +             }
> > +
> > +             if (WARN_ON_ONCE(r))
> > +                     break;
> > +     }
> > +     filemap_invalidate_unlock(inode->i_mapping);
> > +
> > +     return r;
> > +}
>
> --
>   Kiryl Shutsemau / Kirill A. Shutemov

