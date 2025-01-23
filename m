Return-Path: <linux-arm-msm+bounces-45915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A31A1A05A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 10:09:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8A497A644E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 09:09:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5A420C47E;
	Thu, 23 Jan 2025 09:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j946HJd4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD1F20C004
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 09:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737623383; cv=none; b=UhA9vTDIaB+/RIXss2hzn1hDqw8qvdRpAetlpByGGrDm8GcFpWGiX9scq/TbKCDdU5vTNLWqw4GvqdFfw6KerSmrgoXPpE7hGwqXe97HO5RxwHua6UqEAV8QN3hDHaYqHoBsMYTXaaSAi3gQrroDTbyWUs528QXp+iOM7XPvUHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737623383; c=relaxed/simple;
	bh=VyjK8LjhHKge7tdxTMJHOwhS4aSCTHVe4TTOSEy0RjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZiNTuADaoWEBwWVLBMmLMoJPu2h9QyX2RSomtbjoNWbogEtY/jlkWqrOpv/UtKyQhRdMsW9EYJFiLRdcCZcsXoVY+tXgYgJOBRANdOkfaFXEmvmXMhVcNcwjS1x4/tm/3Zl+xAMa39W/SSXYel/q8tTweNc6fnfCPycj4qe18U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j946HJd4; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467896541e1so202371cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 01:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737623381; x=1738228181; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=523HWJnbK4uBXJjGY93omTen6Flka4M5EaUf21RzWGA=;
        b=j946HJd4SzVbsJahDTxRSfZ5tzjfy5ZqLUINAPrLTnnZqY9oMgQJAndmUHrNVCaICD
         cL0QXyPPQKuawcoAH3IChXgCgAvkrA5/1wovlEP0zAbQodCtjKb39MfZWXcYqCHOPyL4
         83PkLMlkjRALNzbpbt3Wuh9F4hTCU74PZjEuDKNMe9jSD+RcGNyf0qZQUeczkAjYcFJd
         YolYEYb7pKRxrs5B1EykLvp0esYniu6mztqE0cW3SZHSB7TJ/6jpxiN4xHV0x6dBOK7f
         rQ7FeJZkRSYpIYxiCPClkL6OfxQNpL2Lh+adGHL86TmwlbVBWUmXRCFwGOlpuaDUXSz0
         f5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737623381; x=1738228181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=523HWJnbK4uBXJjGY93omTen6Flka4M5EaUf21RzWGA=;
        b=gDaY/BZsDH2isqRXXnxjG8sWqfI3wU5dUT5xAgEAiaVY20fK3F9gCE2VGfJybin141
         IWayoV5dz3U3N9vOCqqiIHmYK/7npwE/rF+nHiigMnz/3rmeiMX5Vtljuy4zhZlTKOTS
         i1l25sqmPuOqeqVC9mOIYZBWwmldVIVE1czgfFp3y1P4i+HkzHHJl1sxUaJQoRUP/NXC
         64SZOpJeikqT02qEueRZtFil/ADh/BZ8wR9CQkiwLhN1hdEG3XZ3wkCbh7brpaFsnFNH
         lyT7Krk2+96GsPPwiPvtXsjYMatWbz4L7yIOxOjbTWlnB07DtjhRX2cMneyKtu2A8O/x
         JKkw==
X-Forwarded-Encrypted: i=1; AJvYcCULevOtrzRmi/Y19717v09r10nxPn/9WyflWil5Jgz+RDlHtl3H0Ig3FMGqcuPw964a3oAgLi+caqrXXoMn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1/Pg9BfArpa4puv7ZBotcz0B6OVroviNTEnp/yvqAXnXMOOXs
	7RQwsU+OP1mhjvAJLhmXl1ZZ4k4S6Bu7BPBeg0Ktxnn8eoG19uEOaT08dky7dH1+GyPUmxQ4fpK
	do12w3hNzC5BCtDv1uvdf7SM2Dat8+/TagZ66
X-Gm-Gg: ASbGncs4GtEFAglEN8GHTMTclxhW6IHRHFw64YhqbMefoLopkW5+TfHNj/FQu282+Yh
	fT6URJ36GSwKzAw7d3BSCW7DB9Xzi8Ba7z0tjtbxtyiBXeypwvLXkEXEM2d3/J1WUOHJt7VxwgY
	NeFoko6kXd8FpKOQ==
X-Google-Smtp-Source: AGHT+IEiopQzghyBQuDH+Z++hOyFjaoNNkb3x+F2+vhgN1PyZLbHVj2spWUPREsDCxcgT7MJWxEvinVLGZnXpKHGf2A=
X-Received: by 2002:a05:622a:182a:b0:466:8c7c:3663 with SMTP id
 d75a77b69052e-46e5da99a92mr1957191cf.5.1737623380443; Thu, 23 Jan 2025
 01:09:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122152738.1173160-1-tabba@google.com> <c15c84f2-bf19-4a62-91b8-03eefd0c1c89@redhat.com>
 <03bbcd00-bd5e-47de-8b20-31636e361f52@redhat.com> <CA+EHjTyGgs_Sp0b6OqeS7oVskhVG+S1cHhVRb5Z6mPAwGwmqFA@mail.gmail.com>
 <f801219f-96e1-4b52-85aa-f5a331e06183@redhat.com>
In-Reply-To: <f801219f-96e1-4b52-85aa-f5a331e06183@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 23 Jan 2025 09:09:03 +0000
X-Gm-Features: AWEUYZl_93Hq5l5bhZIehxAbE7u4IasyYqkuXI1uqKIBhVj8G0Cw3XXVO_3GyD4
Message-ID: <CA+EHjTwhKHcywxtg-ODioOcA79hBjwvx0fHKW2VMxXVpA1LnDw@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/9] KVM: Mapping of guest_memfd at the host and a
 software protected VM type
To: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, vannapurve@google.com, ackerleytng@google.com, 
	mail@maciej.szmigiero.name, michael.roth@amd.com, wei.w.wang@intel.com, 
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

On Wed, 22 Jan 2025 at 21:42, David Hildenbrand <david@redhat.com> wrote:
>
> On 22.01.25 18:16, Fuad Tabba wrote:
> > Hi David,
> >
> > On Wed, 22 Jan 2025 at 15:41, David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 22.01.25 16:35, David Hildenbrand wrote:
> >>> On 22.01.25 16:27, Fuad Tabba wrote:
> >>>> The purpose of this series is to serve as a potential base for
> >>>> restricted mmap() support for guest_memfd [1]. It would allow
> >>>> experimentation with what that support would be like, in the safe
> >>>> environment of a new VM type used for testing.
> >>>>
> >>>> This series adds a new VM type for arm64,
> >>>> KVM_VM_TYPE_ARM_SW_PROTECTED, analogous to the x86
> >>>> KVM_X86_SW_PROTECTED_VM. This type is to serve as a development
> >>>> and testing vehicle for Confidential (CoCo) VMs.
> >>>>
> >>>> Similar to the x86 type, this is currently only for development
> >>>> and testing. It's not meant to be used for "real" VMs, and
> >>>> especially not in production. The behavior and effective ABI for
> >>>> software-protected VMs is unstable.
> >>>>
> >>>> This series enables mmap() support for guest_memfd specifically
> >>>> for the new software-protected VM type, only when explicitly
> >>>> enabled in the config.
> >>>
> >>> Hi!
> >>>
> >>> IIUC, in this series, there is no "private" vs "shared" distinction,
> >>> right? So all pages are mappable, and "conversion" does not exist?
> >
> > You're right. This is a simplified version of my series that allows
> > mmaping of the new KVM_VM_TYPE_ARM_SW_PROTECTED vms to use for
> > experimentation.
> >
> > Cheers,
> > /fuad
> >
> >>
> >> Ah, I spot:
> >>
> >> +#define kvm_arch_private_mem_inplace(kvm)              \
> >> +       (IS_ENABLED(CONFIG_KVM_GMEM_MAPPABLE) &&        \
> >> +        ((kvm)->arch.vm_type & KVM_VM_TYPE_ARM_SW_PROTECTED))
> >>
> >> Which makes me wonder, why don't we need the same way of making sure all
> >> references/mappings are gone (+ new page type) when doing the shared ->
> >> private conversion? Or is this somewhere in here where I didn't spot it yet?
> >
> > This is new to this series. The idea, based on a request from Patrick
> > Roy, was to have a VM in arm64 we could use to experiment with. Since
> > it allows the unconditional mmaping, it's only useful for experiments
> > or for non-confidential VMs that want to use guest_memfd.
> >
> > This series isn't meant to replace the other one, more to supplement
> > it and facilitate experimentation while that's going.
>
> Heh, so "kvm_arch_private_mem_inplace" in this series means "no
> conversion at all" ? :)

Yes, just for experimenting with the protected software VM.

Thanks,
/fuad

> --
> Cheers,
>
> David / dhildenb
>

