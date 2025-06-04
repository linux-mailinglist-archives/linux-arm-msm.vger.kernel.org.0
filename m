Return-Path: <linux-arm-msm+bounces-60226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FB6ACDE11
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 14:34:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE3EB18909C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 12:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A667928F52D;
	Wed,  4 Jun 2025 12:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yu8Cf81q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1130228F950
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 12:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749040388; cv=none; b=sXTlnoYPdlYTcI6fkQsHPjjfw2cVYHvYm5jWKoGdzBhSv3IGNK7r3XG08RTDa4MxLgBu6ivfEHLyJN+IDwx8iVAMZlKF28zU0Li/JpYNH/nsL3B0mcgTTI1Qn6mHaR3yaR/Kj+M2EOpMa5jnynLXtbhQ3RQi4Ppp+oHDgsSRo6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749040388; c=relaxed/simple;
	bh=PNxkQMjljGCMfYZMFze/3YnCjPMdLHqa/E35rO4cx44=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hoRcKgxuV4y+pvIDRCjaNJdwXcsb3gr1ekvYNGGrPAlW+aozp6qOlIQa0lb2bgf4DA8yAx8ABnflkDfkbKpkOuZbg6BeMi9hju+adsdY4JDnerxHTllIX6yrCFP8pg9x4z4QYuLdbuNLseFEjGfkVCwoq1a7Oies8YLlbW2Y5ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yu8Cf81q; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a58197794eso206821cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 05:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749040386; x=1749645186; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WCH7JTlHPIX4cor7h7uynG9xI7XEAXoD7cY9UZvCFjo=;
        b=Yu8Cf81qC+7T7xSoJFDt6/UiqKhJtckJ1+TpbP7kjHxSBJTqgfziykV7aAobOA4MfD
         tUNhQeDKfpQ3l1odHJkg7bW8hQLoqzPJGemvKegX+sgAH82m6TOfYqkGwLDYoVIBF5IZ
         t4L5x2b6XlsahUe/pxkFLvAy7yjFrAZdlhZSvOBnHYIMBPnNpugFzoKfg79l9wRdw3B5
         su18ac54S/DYWOSrMdEzgygU4SWqShJBdlD4fk+kSjCBSo3NLu+peBU007ID2DQ1MBc3
         hFVOHZoCQc4SYUp76YZMz0eqA3O5eseKYmMCvN/4OTQ2Rv4LZkPMxGogfh3OkjeRInRw
         Umuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749040386; x=1749645186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WCH7JTlHPIX4cor7h7uynG9xI7XEAXoD7cY9UZvCFjo=;
        b=oRBxP64OFmOziNYWkrGWS57pYJw5HG7355Yi4DYHrflT5a+fIKjheKzAKGSoWN6uH3
         nseKfu8JmIoJbiglF0JLBq9Bm8DcNKmCpqp0sVPy3NraDPW8MOZVGplYx3IsiibLTPOE
         d6FHnje2Fsxzo4EX0ZxycEOoWMJBBTvmYOWHYDi6+s7jlWHZ9Z1JLOLPzzJMHck31puu
         IA5CCzN5p+dm+ngPkUnSLZZfCCegLIAaX15L6kp1caTmWDpooFqecDk1cpHUwgtt0m9z
         86hxm/m9E20tDOIVhiCQXdmKyIN4aoUDAqJJWGLkZnUpAtH4bIjPmvx7iSNGBqGAS6M3
         PVwA==
X-Forwarded-Encrypted: i=1; AJvYcCXTABr3kl1libxiZEYeL/a2Tsu+z9iUITk3jsE2MNaaMCcieWD2uHD9+7h6Q5yaFnHAniX3G+ZlQWiCVKTr@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxnsv69Gt5jNTKDUF9g7oP53JVCTUo2jwQf9hvlw5yJAWt8cRR
	2QeE6z3Wx1/iiQhmWPfWOaaB386cj1UytwOEuj5Lk8mAFEFDON1QVGtnHV4q+MTVqIOIp46L1dP
	DubziAhHXtkQkWdM7k43SWWWPcUSE8dsBtEDNfnGb
X-Gm-Gg: ASbGncusVVsqAFwTBbmkIrHgjYbEy42jT6R2+DnpJrfmjgaAPaLI33AiRKpXGaM39vr
	gGVKlyjOmpebfU7rQX6B29hYyludaBIyKMyFUEG0jVoVr7+CR04RyrvC0oT4NWiZMXiJmaSR1zW
	Zf5Fi9WIrBGdHYaputw0T41sHvkOGXe4sHgHIhEOfhyPWsgYxH3AmfKwbWkdUSokNd+dH3BcLqL
	r/GUquXkA==
X-Google-Smtp-Source: AGHT+IHe+XLWAXMlUsmBBn6elB084F/VX6TN68TGb9laVJKFwCoMFVWmGT+cuEL77yIufMAz11o/8tPr1bxxvE18d7U=
X-Received: by 2002:a05:622a:8c5:b0:467:8416:d99e with SMTP id
 d75a77b69052e-4a5a60fa2c6mr3374461cf.21.1749040385659; Wed, 04 Jun 2025
 05:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527180245.1413463-1-tabba@google.com> <20250527180245.1413463-9-tabba@google.com>
 <b497b0aa-a8bc-45b9-9059-71dbbe551ebb@redhat.com>
In-Reply-To: <b497b0aa-a8bc-45b9-9059-71dbbe551ebb@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 4 Jun 2025 13:32:29 +0100
X-Gm-Features: AX0GCFtnDy4s9hot8G8fHYRMdVgN8tfT_4nhimPKbxNeDk3MM4Myo7ijDtgqfcE
Message-ID: <CA+EHjTztT_MhXpAZvmv53vDOO89fW4fq86gZqgip97T05YTE3w@mail.gmail.com>
Subject: Re: [PATCH v10 08/16] KVM: guest_memfd: Allow host to map guest_memfd pages
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

Hi David,

On Wed, 4 Jun 2025 at 13:26, David Hildenbrand <david@redhat.com> wrote:
>
> On 27.05.25 20:02, Fuad Tabba wrote:
> > This patch enables support for shared memory in guest_memfd, including
> > mapping that memory at the host userspace. This support is gated by the
> > configuration option KVM_GMEM_SHARED_MEM, and toggled by the guest_memfd
> > flag GUEST_MEMFD_FLAG_SUPPORT_SHARED, which can be set when creating a
> > guest_memfd instance.
> >
> > Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   arch/x86/include/asm/kvm_host.h | 10 ++++
> >   arch/x86/kvm/x86.c              |  3 +-
>
> Nit: I would split off the x86 bits. Meaning, this patch would only
> introduce the infrastructure and a x86 KVM patch would enable it for
> selected x86 VMs.

Will do.

Thanks,
/fuad
>
> --
> Cheers,
>
> David / dhildenb
>

