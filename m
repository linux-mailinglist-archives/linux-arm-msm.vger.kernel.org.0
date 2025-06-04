Return-Path: <linux-arm-msm+bounces-60225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B52ACDDFD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 14:32:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EF1B87A7B5A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 12:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBAD61E522;
	Wed,  4 Jun 2025 12:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oO3/jRh4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB234C92
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 12:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749040335; cv=none; b=PwZtdYAdDT69o05Sefb6d8QV6QjE2M4e/5WQwrWy8V+c9qEJ0BkI20qIBfgOw+8z7Xw8PIrA7apPyby0wJqOI5pwFD3HHN2WgmoxDvvkYoHNLgcfPRLzevhdIKMgSwvPQlF+KzToNoCK028w1RPxwISpgZKCNpckTtgx3KeRx0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749040335; c=relaxed/simple;
	bh=WLxNBt7Dufi6jhnzyvUlXwUWDXQTAhBL1a0bv7H5+Rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AcVDodTNvErNLMBfkzX99Q8L/tNKee7xGWEfxi0hwaa/bXFJ1y/zMSjB3jaVNh2t6BpExzlvYAxFWfVbNdIyxaywO+cFcOgej59B7j8KcUbj/ulofadEfLSDNhQIH78tyQab2vZx2Bp+aYUypnrDsT5Cgtks1XecOiARvmrfMxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oO3/jRh4; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47e9fea29easo383581cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 05:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749040333; x=1749645133; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oycp2DysTZTgsSQN7AQGA8/4fiD8DvR35ri7QGVd1xY=;
        b=oO3/jRh4zQFreouI3cWJSyJbuQtqlpZ5MvLjtQZr6fLTu95BOMJzoqgeUXdi5lybTK
         98VN9vqnDRpRTPt6rQAebxwhwZBSJY+sOnsWusG3KMeGyH1r0kBJwl+lwK6aWrxVp4qC
         yvU8dp87qmemx2g8z4HbIRyzLs9x3uVbuTq9XZP9gDCVvy6aKIpQzDBF80UMgFZAHuwy
         jYqsxEuW7VZO9bZxmMMkfzz2zjA0lC62E2DOM/FXujH0UXzn/SlqSpuxwdXnlnKxeN9z
         xyeZriUNPsldnroqEC4MPjJNNwNIGFH1CsSsGe8CmQbG3lw8je30vwJp6DZu5ihpUad0
         90oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749040333; x=1749645133;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oycp2DysTZTgsSQN7AQGA8/4fiD8DvR35ri7QGVd1xY=;
        b=u/f/LyMHCgLNNZwz+enYjkogBH0mZgLBSt3vslq3OXAlyjaLai9iIl5LWo24J2OGyQ
         n1wHdnRyfkFNT2+6WeHiWutsn4VBw1XaXhM9Y2Mmaj8v6ZVHxHYQtH/UgCU1G9Mcu+Jq
         wE34OtBP2ibV1rYJ8wO8lakQ74ti0rgAC1XxAHU1QUIOwp+ySlc7BZvF9UkdFcGYkE35
         GtCTte8oLJuUMg/mnXvY1dk+ELSizyhWiKJ4tvUikHyp3nvmAz7h3A31/oK1eVAl/XER
         VOEAQ5fwzbh2arsQB8/ZxpWevkSw81jljoN57sGURnoMYpQCTerSXcxHEnJQC/CVgHdL
         tFPw==
X-Forwarded-Encrypted: i=1; AJvYcCVWxsmyR2ZJfpLTTNQ+DJsu/4f5m8+3uu0llNq7cbWwmMjCUq9dtntscc8jc75B/2wXtG6P7SMUeatssXAL@vger.kernel.org
X-Gm-Message-State: AOJu0YzG4hO78Ge3YL+NW643x4sUQ9iugVS0fv1CAG6O6GlWI0x01ySe
	8TJXxmODchmYghGpCcz0R9Normbx2VJieyFQB0j/vpzoZXowfjiXAmHb70DvetY67sLlB1Apbr/
	2ECOEf+eMbGFRNBnOouxFn1Yv9pE841+KqzepLd8cE7v0T7geLaoxjJLbFZUC8W7/
X-Gm-Gg: ASbGncveHBO6xtg2YBxE3pNITwqHS8/qVyMFlATfsJHc1tmbkYx9IrMDKj66GDJWmvd
	Qm1Cd7W2o5FJW7vwgLIZRM/4OI9dw83Y5WiLAuKTqq3VJyMXYxKexHMoWI23LCNWFQjqICmE+DN
	+wgsFIq1uNKiSfktp3ihkMtLt7KKAuH4m58qjfWOB9nmFJLyiNgbJzLtvYi4f9OE1F4PhibEMUN
	rYgFsuwsA==
X-Google-Smtp-Source: AGHT+IG3L6mqoQoAVI94cLa7Ir+MBMDlUg7HjPA78hOi8RtusDiX4fUH4PfN6jsw7EgzxNzZlEXWTTF/eVJa7Ll7G64=
X-Received: by 2002:a05:622a:a0e:b0:486:c718:1578 with SMTP id
 d75a77b69052e-4a5a52d641cmr3709391cf.22.1749040332675; Wed, 04 Jun 2025
 05:32:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527180245.1413463-1-tabba@google.com> <20250527180245.1413463-10-tabba@google.com>
 <d6a86151-ab7d-4da7-8dde-a9ff84c80945@redhat.com>
In-Reply-To: <d6a86151-ab7d-4da7-8dde-a9ff84c80945@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 4 Jun 2025 13:31:36 +0100
X-Gm-Features: AX0GCFtQkOaG8vC3W7Pt65KUSQEh4Kx0R_oAJds8qIizcawQAXuvpXqZaNOzgzg
Message-ID: <CA+EHjTx1FGwvsOM9B5ZdEGofvL7FaYooomGY+WZq2Yydjs6y9w@mail.gmail.com>
Subject: Re: [PATCH v10 09/16] KVM: guest_memfd: Track shared memory support
 in memslot
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com, peterx@redhat.com, 
	pankaj.gupta@amd.com, ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Jun 2025 at 13:25, David Hildenbrand <david@redhat.com> wrote:
>
> On 27.05.25 20:02, Fuad Tabba wrote:
> > Track whether a guest_memfd-backed memslot supports shared memory within
> > the memslot itself, using the flags field. The top half of memslot flags
> > is reserved for internal use in KVM. Add a flag there to track shared
> > memory support.
> >
> > This saves the caller from having to check the guest_memfd-backed file
> > for this support, a potentially more expensive operation due to the need
> > to get/put the file.
> >
> > Suggested-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   include/linux/kvm_host.h | 11 ++++++++++-
> >   virt/kvm/guest_memfd.c   |  8 ++++++--
> >   2 files changed, 16 insertions(+), 3 deletions(-)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index ba83547e62b0..edb3795a64b9 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -54,7 +54,8 @@
> >    * used in kvm, other bits are visible for userspace which are defined in
> >    * include/uapi/linux/kvm.h.
> >    */
> > -#define KVM_MEMSLOT_INVALID  (1UL << 16)
> > +#define KVM_MEMSLOT_INVALID          (1UL << 16)
> > +#define KVM_MEMSLOT_SUPPORTS_SHARED  (1UL << 17)
>
> Should there be a "GMEM" in there?

I'll change it to KVM_MEMSLOT_SUPPORTS_GMEM_SHARED. I thought of
adding _MEM as well, but it starts getting too long :)

Thanks,
/fuad


> --
> Cheers,
>
> David / dhildenb
>

