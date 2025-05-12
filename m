Return-Path: <linux-arm-msm+bounces-57585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B6408AB3041
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 09:09:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 288513B51DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 May 2025 07:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CDE5255F54;
	Mon, 12 May 2025 07:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OTjxxVDt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB6E248F51
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 07:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747033772; cv=none; b=HJCWrAKYcEB3xxAZiYHY6ECo6wPhGKJaZzjo//FU+OCbJtESq1YPaqUZqeJLr9VZpsXeUzNP9L/vLJdL7k7nGH06aPJnzPCGY1gbiChwz9sA8GXs3nrzXA2YJtCmNTJ7Xg9THIPEAB78a2KkXcMgw8FPOG+orxNenFHR8YWr+Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747033772; c=relaxed/simple;
	bh=+0UL+4ECd5ggGsQ+5dDpr+JU2V8Gxp3IpSWXJSEWr7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4e6X2/KvzXxxUqeRrT9LOcV9q5hdFrjR/qObeHxvupgzt6JUxMd10SAni2pgWLxpTcgs9orYu7zf1kf4z6YRChPQsKdI5lqzzsavyA9AhK9flxlbW9JuKSaHBegxoAiJ/pbU7dQwhhS+IbFlp1EAAkHW+zI+RcNfXoLemjCNS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OTjxxVDt; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4774611d40bso431631cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 May 2025 00:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747033769; x=1747638569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSmTOYCiVv7/OshHrbhVrhF4ObIKGNu6xZWV2038bpM=;
        b=OTjxxVDt+73t5r0FKcHN4JPf5zRpnDJjlmNn08R0FPbBgTEz7MQQvobSMkubRS0T2g
         S9adq9hcwNYAuNfrnl5WRU+U17EMvBlp/Ow7X/eJ5e1eq998TnbaKOKq+bZJhNYVuNfz
         5CD2IHXQKGBq5B3+k+cHlTjBQXWtnjjbIKnAWNDin5vOc5Awo2WBe9FGFbR2AZXgjqcC
         VhIT/mkbrIVmKJO6NqlTCwDJFh2+cKU3ukHyJu++YLwbpWYylbjBrLUrOqHx3pfcEDx/
         9WUDIFQPAWVevMtWryK+P5yhTBH/JCuqDJ7f+IlKbC8mEF7GOApNao7WUSa8PqjfDG+w
         5kbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747033769; x=1747638569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XSmTOYCiVv7/OshHrbhVrhF4ObIKGNu6xZWV2038bpM=;
        b=hUdgeDVeb50yyHn6+noSADLWhWdiaREg9EWpVkhp+vCuI3lPsfthKWsnpdfXju//Y+
         FzJAj8jD0igdmPplipPGZOfYYMdaJ+Vr7UOGfrkeHk2YNMEloo0EtOnFJewHP3uKHzI0
         d1Ylum+JWzfBKQYcrkq0YgRSdI6P1jEmxgxXZ8CJu6Z6f2DYdSkEUXZLOlJk9JefHu7k
         NpGzTWZ5+mrHPoagGdUb9WsL+LG7Qn7/jSAidI8bGEBvAnXBINd468Ip+ta8aJTecF5W
         TgB49uo+fbFrMD+ieKNDmHEb0GvANc7oydhhRftxYSDzK16imTy0WJde8u5acTWWuik+
         CroQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVlEMuYu9mBBwQVNSgtmcFOKMH+dBTxpDl3w01xYuOor6497Zrx37YSD/qfuMvGqO1kTDxSwxXeRP7nEZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyIAhLCfHOR/r2Y1TvdJIxib+nbyXVaOUoaNp6nL5W3JeUK2Hs+
	RafgbLUfXmdaiQ5XqSGByUgztM+u5ibHH8ukUFfhIRhzDk53E2xHQ7T1zHZpf+GK31RtIZ/dWqz
	BeX5/4wbOJ7XPmj7h9lJ7/pIGfxNOVvOYnIwN
X-Gm-Gg: ASbGncvtbATNSnYrfLQp5wDxN6zpcFIDXrKdUxzf/JHF4bBuNEh3fMJ4lJPcGzc5zKr
	NPUiG6RVwwDECRqUtwyngvovRueQElIyVJPhjqNHL2N2h4f4rQiePUROvzmHe7ZoCBEV+OB/pth
	7KPnpOAmzcJ22b9wkI8Cl4IUh2gJ9/pz/58r8Voa2HLxjy
X-Google-Smtp-Source: AGHT+IFWkn43x0P4nlxGLXdV3CrSVT40wPdseY7NOjafRyvqEjQ9QNxnsrVcDogvYXeKprPQ5Mqc/SYgP14o+2RK6eY=
X-Received: by 2002:ac8:5889:0:b0:494:5923:8bcd with SMTP id
 d75a77b69052e-49462d40c04mr6781711cf.3.1747033769418; Mon, 12 May 2025
 00:09:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430165655.605595-1-tabba@google.com> <20250430165655.605595-9-tabba@google.com>
 <CADrL8HVO6s7V0c0Jv0gJ58Wk4NKr3F+sqS4i2dFw069P6ot7Fg@mail.gmail.com> <702d9951-ac26-4ee4-8a78-d5104141c2e4@redhat.com>
In-Reply-To: <702d9951-ac26-4ee4-8a78-d5104141c2e4@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 12 May 2025 08:08:52 +0100
X-Gm-Features: AX0GCFv-MyXwz1MDe12JSf9b8ojiBGKwn87SyNuOsfPf6zdJXpwsIjIp3k07lFM
Message-ID: <CA+EHjTyCQJccwGim_xe5xSv7ihLANRdcrwhrMAib+ByBzVAwSg@mail.gmail.com>
Subject: Re: [PATCH v8 08/13] KVM: guest_memfd: Allow host to map
 guest_memfd() pages
To: David Hildenbrand <david@redhat.com>
Cc: James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	seanjc@google.com, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	willy@infradead.org, akpm@linux-foundation.org, xiaoyao.li@intel.com, 
	yilun.xu@intel.com, chao.p.peng@linux.intel.com, jarkko@kernel.org, 
	amoorthy@google.com, dmatlack@google.com, isaku.yamahata@intel.com, 
	mic@digikod.net, vbabka@suse.cz, vannapurve@google.com, 
	ackerleytng@google.com, mail@maciej.szmigiero.name, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	peterx@redhat.com, pankaj.gupta@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi James.

On Sun, 11 May 2025 at 09:03, David Hildenbrand <david@redhat.com> wrote:
>
> On 09.05.25 22:54, James Houghton wrote:
> > On Wed, Apr 30, 2025 at 9:57=E2=80=AFAM Fuad Tabba <tabba@google.com> w=
rote:
> >> +static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vm=
a)
> >> +{
> >> +       struct kvm_gmem *gmem =3D file->private_data;
> >> +
> >> +       if (!kvm_arch_gmem_supports_shared_mem(gmem->kvm))
> >> +               return -ENODEV;
> >> +
> >> +       if ((vma->vm_flags & (VM_SHARED | VM_MAYSHARE)) !=3D
> >> +           (VM_SHARED | VM_MAYSHARE)) {
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       vm_flags_set(vma, VM_DONTDUMP);
> >
> > Hi Fuad,
> >
> > Sorry if I missed this, but why exactly do we set VM_DONTDUMP here?
> > Could you leave a small comment? (I see that it seems to have
> > originally come from Patrick? [1]) I get that guest memory VMAs
> > generally should have VM_DONTDUMP; is there a bigger reason?
>
> (David replying)
>
> I assume because we might have inaccessible parts in there that SIGBUS
> on access.

That was my thinking.

> get_dump_page() does ignore any errors, though (returning NULL), so
> likely we don't need VM_DONTDUMP.

In which case I'll remove this from the next respin.

Thanks,
/fuad

> --
> Cheers,
>
> David / dhildenb
>

