Return-Path: <linux-arm-msm+bounces-47728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 910A3A32208
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 10:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 942A21886E1C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 09:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B983E2046A1;
	Wed, 12 Feb 2025 09:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oa7sql/i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7DED205E36
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739352275; cv=none; b=m2LUE0dogaF9auw4N53WHXMByfAOi8+5iheDIXiPTfbLv7xS7eSj1WDHqT5FeQapg5PoprXJjIx/7p/z3XHXPJJwITVbLd9wi9+sJPBrYSvSz7X+sDJch+V3dHUhicxqNwSQW6ljoSzdxeGkpRHt5+Vt7C6MBRcYIM65OEOKF0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739352275; c=relaxed/simple;
	bh=wgrVFTFnOMl1lbhU6THPXTQUTlt6qpr2q1PW7QzymIw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jJMD69QpeH7Xkc+NrnabbD6iWJUDfLXdF8Y9w49PrPaNSeINklGolgjHb1nDfGC1CqxH89jBEerjGOPWxORyP8S4bOACDx/eG22PU4RMKuhz5c9JFQJntdG9WYGATkEKfMguFtDppJmCW2OBR81GA3fJR82ux7GvwQ2oezdLcNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oa7sql/i; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4718e224eb1so123631cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Feb 2025 01:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739352271; x=1739957071; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ygZ+ykZUGXo+ghQO8/iDuCOuoQ9uPQROyXsAFRhKFU0=;
        b=oa7sql/iHWc+kv2P2lnVF+Vjn3qk2NRuVNgBRhi0ixk2AE5v2264HIwl68dtjk5sJY
         bgfHorHXCQztfbVAvQWXzEtpJflYX4XB7Ara5sdXeuhac3ZrjpPY+6JVzZrVs0adjpMW
         i6k7Tj7bqp3z/fRegAN49HCMQVHyjn7GrYz6AUhK33R+QHl5laGrb8fsLRORzpMNJgDS
         I5uu1LPg3uFTbfvjYEeN30VHi+25XB8ib61jPO/MtfjSorunK3x0xTLn0DxiFmjZxaL3
         8kLNkN5TcIp4zNaHKy3MbbERQT97YZjXM/3chS382ilDJMC1B2d/rxsxTY+0t4H1aAzn
         sO0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739352271; x=1739957071;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ygZ+ykZUGXo+ghQO8/iDuCOuoQ9uPQROyXsAFRhKFU0=;
        b=SXUdQP0R0IyP516wPRjzhDPcG1/soYGbq53JFPUus9WX6gPBXlRCLkV2HVkP7tdLt0
         SapiDw8uOLkt569eCRAfrumFoKuhNeDDrla/9oLD1n2VWywGwUOIF1OQnWioxuWpxgEf
         CI58XqyG2EKWyjndjvhEubvpl3fCDUCoKlMkyXL9NQoyn2EkUTAZa9RN7IxP19tXxYzg
         HfkERXfcswp0ybKGlEMDZO9zSY4iaytEig5irjQOWO8YEpnYl8aDqPm+83qayS33QwLn
         f0ezk2XFAjKM9iA7Gr8Y/Dk6Ujn+HviuHkobvzR3OetwTGxAl31j2UHmTejLIVTx03+k
         GBjg==
X-Forwarded-Encrypted: i=1; AJvYcCUzMQxd/EwREUwT2dIUr5thu/sEbXFoj46H4oxKdET5fzbfpJ10JZQXfj9Gw+7Szp1F6AJ4zhmtaqTMqv15@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9ujnOIZ1QYkM3T26Pw2R1ZBVYiBeyemeJT/ricEWEwAw2XL2T
	t42rWKGuzswzUY/KEwAK6L92Y2dBKLwTD/cwFEGhx2UrslKWDU0GtUtaxM58rI6uzqOU2tsqfbg
	MmoVFQfjqyxGd0CXcVVbXJ/j1VCDgrGNPhryE
X-Gm-Gg: ASbGncsM491xgam3DqrmBwa2KbMdnr4RJAikNd170B+pKjYfzANOAvPDzUBKJbIuL0y
	wuDF06in+JIOWzSweFpP/TJRFS6rSMJEsnmywuW/MHo0ubOU8lALu/H1Y5FPAF6UrHuAwPCG6VF
	3hL9W+YUQTD3NOmArG4z3/mCSAOQ==
X-Google-Smtp-Source: AGHT+IH0MGBH1wbXmpKqOTa38xCr+F5lULEXEpEmWTgKUlomn2kZYLWxS8V6z3W5XVKksUIXSMwWGhpoTDuH2GiN2j8=
X-Received: by 2002:a05:622a:4893:b0:46c:78e4:a9cc with SMTP id
 d75a77b69052e-471b1e3ee78mr2602041cf.25.1739352271281; Wed, 12 Feb 2025
 01:24:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211121128.703390-6-tabba@google.com> <diqzh65081cc.fsf@ackerleytng-ctop.c.googlers.com>
In-Reply-To: <diqzh65081cc.fsf@ackerleytng-ctop.c.googlers.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 12 Feb 2025 09:23:54 +0000
X-Gm-Features: AWEUYZmGdlfRAPQIp-gV7T21UQk0_Xr9eEyUSfbJ4EqrwW15zpIk1JjIyMqdHd4
Message-ID: <CA+EHjTyGhHdDsH=U9QUni3vrbF+-bxXVX30QFBumk6-19UtaLA@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] KVM: guest_memfd: Handle in-place shared memory
 as guest_memfd backed memory
To: Ackerley Tng <ackerleytng@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, mail@maciej.szmigiero.name, 
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
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Ackerley,

On Wed, 12 Feb 2025 at 00:15, Ackerley Tng <ackerleytng@google.com> wrote:
>
> Fuad Tabba <tabba@google.com> writes:
>
> > For VMs that allow sharing guest_memfd backed memory in-place,
> > handle that memory the same as "private" guest_memfd memory. This
> > means that faulting that memory in the host or in the guest will
> > go through the guest_memfd subsystem.
> >
> > Note that the word "private" in the name of the function
> > kvm_mem_is_private() doesn't necessarily indicate that the memory
> > isn't shared, but is due to the history and evolution of
> > guest_memfd and the various names it has received. In effect,
> > this function is used to multiplex between the path of a normal
> > page fault and the path of a guest_memfd backed page fault.
> >
>
> Thanks for this summary! It has always been confusing and this really
> helps.
>
> Is there any chance we could rename the functions in KVM, or maybe add a
> comment at the function definitions? The name of the userspace flag will
> have to remain, of course.

Actually, I was thinking of doing that in V4. Rename, or at least add
an alias, as a separate patch, to see what the community thinks.
Since, even with this comment, it is still confusing (as
evidenced by Quentin's comment on the later patch).

Cheers,
/fuad


> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  include/linux/kvm_host.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index 438aa3df3175..39fd6e35c723 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -2521,7 +2521,8 @@ static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> >  #else
> >  static inline bool kvm_mem_is_private(struct kvm *kvm, gfn_t gfn)
> >  {
> > -     return false;
> > +     return kvm_arch_gmem_supports_shared_mem(kvm) &&
> > +            kvm_slot_can_be_private(gfn_to_memslot(kvm, gfn));
> >  }
> >  #endif /* CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES */

