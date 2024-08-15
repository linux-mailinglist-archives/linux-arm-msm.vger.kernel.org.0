Return-Path: <linux-arm-msm+bounces-28591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A24279529D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 09:25:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5503D1F21E4E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 07:25:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DD617ADE3;
	Thu, 15 Aug 2024 07:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JEFEUfOa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5745A15E5D4
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 07:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723706712; cv=none; b=OGkdbuvQAeWdw41aNf6KmJo+blsnTF8wSOujvNC3h3ONnFFD4qcimworIaWG1s9ooOur8Hl0xb5Ir5BlxTltUL926CR0B8LhUNQjZIYyVdtmgMYuC19/UPsplfRw9Fo+kU/DD8CKr0zFmbpXtLy02vu8mcUbwai1/NX8YV03adQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723706712; c=relaxed/simple;
	bh=Ow1/2PM/XA+bt7tPUEZgVaKKbLuhy2wTsjK7gDnB3a8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tWkjvVUvUTDUNMAjwOP/5hupXZUFqioRq58GjFNRrZTZT/nh9sSTo0H7hcT9IdggpDG1NjKHEgi2th3jWEJ1Lq42d925wuOrvUFr1k98KE9GKkE52u+p18d54HyvOudhwDep6PlzN4+MByEqlhNISkgYvYrhgBeI5H0nwdc1PD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JEFEUfOa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4281c164408so3600905e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2024 00:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723706710; x=1724311510; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fz7V9Tu3EtjBhPrJHgxXfRiSyngyRtnzUolHcCZqMic=;
        b=JEFEUfOaPVL/CGLz6q4MtIptjf31pzDPOz48Cq0lSXWWwkkePefrvzEZovygOTkoUG
         6047gj+inLwyjaP/IyD4nFPXMcGv9mUBuLj5+4l+tDDCOAA0NauqH5yjzUTzaYjOrxtu
         2jiSrtuAjz93pm3sqzE/7dehhpPlm7+IvPK0fvwa1SYLCGMc9/Kl9n02THEjoMf7RQUu
         O4YO7mxmpgvhRpfprMdQtKvSMW7+eGoFPzwhc5jUTgs9Sc5hU8cgJOA9NMDuJH2bcAY8
         KdyeAClNVdzI79jVDDNazGkpSb/DgwKTFe6aF9tL/GE+drvRRLqQRR3F6Dj8CAUm2JfR
         Cj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723706710; x=1724311510;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fz7V9Tu3EtjBhPrJHgxXfRiSyngyRtnzUolHcCZqMic=;
        b=PuYO/L6JDxXSozAmnBERJlrZM7OHer49VGPmlb0ISaVw63eA+eMNpSV0DRgNzORhNE
         OXZqT0jU7cdsIuyRh2FZvQhSU+zMBgXoZShnlKZ0u6z6Di2DHrrf89ScAhHa/2wScX8O
         pPyrB6sqO+uXktzCy6rvoiBfmbVaKxZTDLPW81xaM85d0z0BqBQTsOG7NealnAV5z1jC
         CxLdZzPnkEsTrpQHmDRvVJpjaTLXHcLp+1x4JzyWD/fBb56vCkd0ITFvsNIKR0ruPoIv
         S6ZjzGhLa3Wjakbd/K326YLbBOBd6NTxOBuMTkRTk3qkqj/afHfr+UkM8aVEgOdhHGw5
         9Bkw==
X-Forwarded-Encrypted: i=1; AJvYcCWcFOHzRNIopNliCafPu0XGQatVaAx2bpI1vv7NCwcjUAYtLwPgxmr5cDnu4Of3Jw/Bczvo3tawSvF+TR6i2uz4EyNuSBtXIwWz5E4rJw==
X-Gm-Message-State: AOJu0YzcyN74NzXTz1x9Qd3cJtRdrCoVYFeQsAHatFhLWCZ3uhq45ocd
	/kcanAxHIgxOzB0F5LJaZ7oWAhYMatkzcG94uJ3DoxQ+1DVlIndCXl8JmtSFQRG7NWzh4l0+le8
	azvCjMA0F01owVRBWNbfyPlauTKJSShEMtGAE
X-Google-Smtp-Source: AGHT+IFDY+rlRX/qSGEGOl7eRG+hjtAxUiHzOwQTJK7cDbUC27G98FAuS1SlS95X/zfj/rFIWeJixLWpZK/CGw0VdqU=
X-Received: by 2002:a5d:660b:0:b0:36d:341d:6ba8 with SMTP id
 ffacd0b85a97d-37177821d90mr2579225f8f.63.1723706709402; Thu, 15 Aug 2024
 00:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240805-guest-memfd-lib-v1-0-e5a29a4ff5d7@quicinc.com>
 <20240805-guest-memfd-lib-v1-4-e5a29a4ff5d7@quicinc.com> <4cdd93ba-9019-4c12-a0e6-07b430980278@redhat.com>
In-Reply-To: <4cdd93ba-9019-4c12-a0e6-07b430980278@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 15 Aug 2024 08:24:32 +0100
Message-ID: <CA+EHjTxNNinn7EzV_o1X1d0kwhEwrbj_O7H8WgDtEy2CwURZFQ@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] mm: guest_memfd: Add ability for mmap'ing pages
To: David Hildenbrand <david@redhat.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Patrick Roy <roypat@amazon.co.uk>, qperret@google.com, 
	Ackerley Tng <ackerleytng@google.com>, linux-coco@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, 6 Aug 2024 at 14:51, David Hildenbrand <david@redhat.com> wrote:
>
> >
> > -     if (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP) {
> > +     if (!ops->accessible && (gmem_flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)) {
> >               r = guest_memfd_folio_private(folio);
> >               if (r)
> >                       goto out_err;
> > @@ -107,6 +109,82 @@ struct folio *guest_memfd_grab_folio(struct file *file, pgoff_t index, u32 flags
> >   }
> >   EXPORT_SYMBOL_GPL(guest_memfd_grab_folio);
> >
> > +int guest_memfd_make_inaccessible(struct file *file, struct folio *folio)
> > +{
> > +     unsigned long gmem_flags = (unsigned long)file->private_data;
> > +     unsigned long i;
> > +     int r;
> > +
> > +     unmap_mapping_folio(folio);
> > +
> > +     /**
> > +      * We can't use the refcount. It might be elevated due to
> > +      * guest/vcpu trying to access same folio as another vcpu
> > +      * or because userspace is trying to access folio for same reason
>
> As discussed, that's insufficient. We really have to drive the refcount
> to 1 -- the single reference we expect.
>
> What is the exact problem you are running into here? Who can just grab a
> reference and maybe do nasty things with it?

I was wondering, why do we need to check the refcount? Isn't it enough
to check for page_mapped() || page_maybe_dma_pinned(), while holding
the folio lock?

Thanks!
/fuad

> --
> Cheers,
>
> David / dhildenb
>

