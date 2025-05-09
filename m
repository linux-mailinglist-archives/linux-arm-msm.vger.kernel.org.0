Return-Path: <linux-arm-msm+bounces-57491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40636AB1EAC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 23:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7027A1C07EC0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 21:05:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1C925F792;
	Fri,  9 May 2025 21:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0O0EgNtu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581A325EFB9
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 May 2025 21:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746824708; cv=none; b=FJX+vyTzu8+tB1LXgV8p97yegJpFEHCUSAyi0GmBaPwqF5+TkMHMUUyaC2FxuWR7XfuinlPNyX+rL8KSkLCnuvGw+WsNZwt+eitsxvIgbWz8tJ3LEP4TaJv6rOCYr74sfHFQGKYRvKqG0XS2eU6lYn/kCEAmM0zK7980EVFPJ4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746824708; c=relaxed/simple;
	bh=WzlPx2wx92IpbZi7oSppPudAmMNDYm9nx6hsnSZ/ffs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWckc3xzdKPg6WFXpRHFhPwCZNcp0qZ7dyjcGSx3QFV4UHbqfUDwbtf8ZrKtAqULXddEo7H6cjw0uJTAkJQR1vgGm4mpYc6aoHjk6BLTsTuJdR9K+fihZgBDqimloRcsSGNFwUmgY+EHRroaGni4uO62ftSXTZQCzQpKTjsWQYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0O0EgNtu; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e78e13d7fa7so2560168276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 May 2025 14:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746824706; x=1747429506; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbUr+ARGfp2CFrrjK1HudWa34JyUBpgm4c/0fuAkbDg=;
        b=0O0EgNtutKxbYGXl9EE4g+NL/baWC0PjGDRPU5aPHy9JRd7IU2GRIPPC1LbfDzsORE
         qODMUiuFw2HG2+aowc7dIIUKb3/yKZXY3vY08h/Jg6RnMhw0Jk0FNgK8rv3hk+m7FuXO
         HX/0JYIeADCOgM1BKBDbrpHMK3qB+9Tj8AjB4bkcBMedGv//OxyzwgWqSibHQWQleE5N
         2rNm8kGehDMsc+vU8iBqaAccfqiHniiT9HkZi05Ne7W2i/sMJmQJMPcvE06DSmTjMKJj
         mg3fLMg0qe0A/INrqrZChtOJ3UrkA11AOEYjVsyEWOgdfafgjwxuZF3ms5syrxZIoS/s
         xzrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746824706; x=1747429506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbUr+ARGfp2CFrrjK1HudWa34JyUBpgm4c/0fuAkbDg=;
        b=tj8mkRMbdCwWPUGVUVGm5g3YnR2G8hwvoOCx/b3EzkbjVkeDn6tcprse5DyCsY4wdj
         QFJwDF0su0wnIBrxJ+Ym1/K/OEgHJqoQp1UOLW/hBtq4QqbQi1+woRofFxNb8ynp9bf6
         y1E18lCqPIPvk6umn5Yt4KtHA++hcQdHko4Q2fjSIfnwfU4U48lW86zgZOvHhNPuWK1a
         lta8pcHAlSnzc93kZrhB+7C98n0jB3UafNQikVVgkqcv7GOaC7BU6LorhQHFUQ1gUnGE
         UWtNCCopWhW+mOKw1d3ORQK9sX4vYIfg/Yp7t5UuNgX5lpt9a5xm+71e2FJd1TDRNgJP
         J9dg==
X-Forwarded-Encrypted: i=1; AJvYcCU0gbnXFhgpYOhdTEnzcwzTqrBgtPOcuoHsMoipTIAHk8zilubL8PmdGrxdrSD7CcZCpWWHUW/WMAO10sBt@vger.kernel.org
X-Gm-Message-State: AOJu0YxcF4KSVCNEFX37W1G3RqomKQiKeM1ifnTKYDXpz+zs2kRmR2oT
	4J8RtTEvpH2g+sh+nazkXYNwb6aTUE0SH7QsxTKj9q+6bejVBhz2WFFCrnqejKCmFbLhQZYj/i+
	WEmxbJk9GyI/SiodMmrEGknECsMjuTs5fm1O1
X-Gm-Gg: ASbGncv51MZ6lDEQP1ogGVwndgZ+SMzc3lQJOQiSNGgC1W4oFfLaLcAhWNcCR7z9i9c
	HgcBAPkTuJuzxECBG3ECDI0rllr/9RKddluElpN1AohN4E2YCy2sjLzI9B7y+8c2AVb364ABe6C
	gHHx9VeIDmthe+7J/iEq9zaqT7f8m41zykIEM3HXbd3UnRIJj2WbaHlEkJx7lC3Oc=
X-Google-Smtp-Source: AGHT+IFlK+yC5lgOv11bmhC+bVjGZ3bX7IBXVoaQbIwYaU7KQJR4oxZrRbUoNAVwfkFpzhpAbBPeDKRzVihbwxVGZvo=
X-Received: by 2002:a05:690c:6181:b0:6fb:b1dd:a00d with SMTP id
 00721157ae682-70a3fb0f629mr70163017b3.30.1746824705902; Fri, 09 May 2025
 14:05:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <diqz7c31xyqs.fsf@ackerleytng-ctop.c.googlers.com>
 <386c1169-8292-43d1-846b-c50cbdc1bc65@redhat.com> <aBTxJvew1GvSczKY@google.com>
 <diqzjz6ypt9y.fsf@ackerleytng-ctop.c.googlers.com> <7e32aabe-c170-4cfc-99aa-f257d2a69364@redhat.com>
 <aBlCSGB86cp3B3zn@google.com> <CAGtprH8DW-hqxbFdyo+Mg7MddsOAnN+rpLZUOHT-msD+OwCv=Q@mail.gmail.com>
 <CAGtprH9AVUiFsSELhmt4p24fssN2x7sXnUqn39r31GbA0h39Sw@mail.gmail.com>
 <aBoVbJZEcQ2OeXhG@google.com> <39ea3946-6683-462e-af5d-fe7d28ab7d00@redhat.com>
 <diqzh61xqxfh.fsf@ackerleytng-ctop.c.googlers.com>
In-Reply-To: <diqzh61xqxfh.fsf@ackerleytng-ctop.c.googlers.com>
From: James Houghton <jthoughton@google.com>
Date: Fri, 9 May 2025 14:04:29 -0700
X-Gm-Features: AX0GCFuCWbYwnP1AwYVXy2ElKQAoD2B95TUeHHXsalKtgwvYczk2esQtcrZ5wXs
Message-ID: <CADrL8HWHAzfYJktatQraUV6n661=rU4q4+f+tYRB8Q5xwdSY_Q@mail.gmail.com>
Subject: Re: [PATCH v8 06/13] KVM: x86: Generalize private fault lookups to
 guest_memfd fault lookups
To: Ackerley Tng <ackerleytng@google.com>
Cc: David Hildenbrand <david@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Vishal Annapurve <vannapurve@google.com>, Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, mail@maciej.szmigiero.name, michael.roth@amd.com, 
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

On Tue, May 6, 2025 at 1:47=E2=80=AFPM Ackerley Tng <ackerleytng@google.com=
> wrote:
> From here [1], these changes will make it to v9
>
> + kvm_max_private_mapping_level renaming to kvm_max_gmem_mapping_level
> + kvm_mmu_faultin_pfn_private renaming to kvm_mmu_faultin_pfn_gmem
>
> > Only kvm_mmu_hugepage_adjust() must be taught to not rely on
> > fault->is_private.
> >
>
> I think fault->is_private should contribute to determining the max
> mapping level.
>
> By the time kvm_mmu_hugepage_adjust() is called,
>
> * For Coco VMs using guest_memfd only for private memory,
>   * fault->is_private would have been checked to align with
>     kvm->mem_attr_array, so
> * For Coco VMs using guest_memfd for both private/shared memory,
>   * fault->is_private would have been checked to align with
>     guest_memfd's shareability
> * For non-Coco VMs using guest_memfd
>   * fault->is_private would be false

I'm not sure exactly which thread to respond to, but it seems like the
idea now is to have a *VM* flag determine if shared faults use gmem or
use the user mappings. It seems more natural for that to be a property
of the memslot / a *memslot* flag.

Sean, Fuad, what do you think? I don't see any downsides, and it seems
strictly more flexible.

> [1] https://lore.kernel.org/all/20250430165655.605595-7-tabba@google.com/
> [2] https://lore.kernel.org/all/diqz1pt1sfw8.fsf@ackerleytng-ctop.c.googl=
ers.com/

