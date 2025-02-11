Return-Path: <linux-arm-msm+bounces-47617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50459A31115
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 17:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DE2F3A8CC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 16:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A4B1EF09B;
	Tue, 11 Feb 2025 16:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ii8GHy6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5368426BD8E
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 16:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739290684; cv=none; b=jtPCIxZm8S2YY9TJ2RluHC6HSGamL/Dd5GxtJNumHon4TgeZfQtkBQqbUsGivRDWgECvo1Jejk70r3r+FJ8Ln7ro5+T6GEm/e7kg1pHmOytVq4nAKYMnPfgw28jiiKnVvSfhRfLRDzRD4UNqrjfgQMv2/XGf17GRaurlLIILjQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739290684; c=relaxed/simple;
	bh=LSv6a+u7Lt1JiVvr6OWPVvCg/C3ZTrOfw5Ft3zJjZAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3e+8DmY6MWoibrkWwD8YlGW8dwK8+1pyvrKwuI2O8nYGlHxSCdlxlndySBf6I2aOwKF5E+LJX9GkB5rqa+XqjG3fqNvRkTg2aOy1c9BdGun7kpvUNnXlsypvjYgemTA0PH/O64rcFn5Qin4+HUnEUFCGRp1ZnFwiP/Dw2tMe+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ii8GHy6d; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4718e224eb1so184291cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 08:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739290682; x=1739895482; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1P6rPw9a5wgRlWQeCB5ce6X5jA7i7I59rEFbE9TxC38=;
        b=ii8GHy6dnabdqbUzxFEhEkf3f4vS6B6iidzdKDFxN6n8umpj71FPLejBrXBXj/accK
         UubzAl0VdVpbmXnmM7QFRrbAggy06xnjeACXBIS15SfTx87oEac0pduSgHQB9/mYE2gB
         qId9UMC2Q8F8tQq1dbpKZKriZ1r/nnzujTOxdGhEw1QFVpp7UHEX3faX+XxheA/fXdax
         Xfa9Ix0VVF9p08mMsrMSaL3OT8bnULRAegx7L0+rl9YdN9DZiq7dCgtqRB6Wf/uCB8Fn
         KrBSsGQXmcfAOsr7fi5lnugWkGARUK0BopEijo+QU4O4lh3trWZ6pDA17kN3guFxAVMj
         F7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739290682; x=1739895482;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1P6rPw9a5wgRlWQeCB5ce6X5jA7i7I59rEFbE9TxC38=;
        b=tNHqPggPWJDCAiVm0bPUajvG8RF5L2P4iTAvbBwwERVWha3Z+OVhLRSrb7LXFQ0hAr
         PMVDL18G2FTe6knqiAmXc3FIPCCOcXkfk8Fi5oiuqWKz6iRbShxTyJS8oLKhIlXbddIf
         NUIPXL7owkddGx+uRa1WUpv4NNAMXDHjg2pUYMqWSy5jdaPBYRDgbK/JiZOqTq7kp2dQ
         OO2LOnhO0ODkG1gDD/CYMVft//FL9OykWDryWKNwkSin8P7mDXRt6qbLShhKQyKq7cBJ
         9NAxSF7qeHSqTPabbXhcG0E0siWIfTiLp5uPWWpoJtg4dW/oeO3xuBUwqpmYst83WvKC
         iNIw==
X-Forwarded-Encrypted: i=1; AJvYcCV0MBHYrc9BrhjGWsdmvlWe7M0TiRp1Ig7Bs7ApKORBKUUE6MKQ7srV8SnGSgrHJJ33xuPbcBaLJM1rbKfm@vger.kernel.org
X-Gm-Message-State: AOJu0YydINpDw18+Qajqj8Qrkb2MKPgEMajP/5xXEj7pM8/WCrH/Asm4
	Vs3LClv1OmpViu8Pg93HuI8o2E7DPCaR5IzH10WWJx+xMlrIR+NV8vAl1OoyE1XOTNPKvocUfzX
	Fg313ilxJOdlC67HMP9KLksLjipQwUwXTqumu
X-Gm-Gg: ASbGncsGWsyvfJZJpwp1JuymvIZ8VMdgMRTuKrgaKbfscstGpqubdgl4fC1y00PocE1
	MooysNo5v8BwmM3kUK1zv4u11FBU4UvbhXs39PSA33rXBWwVGm4Ki07/MIEqvGdDegnBceIE=
X-Google-Smtp-Source: AGHT+IGRp/t/qyZgBNNs9uDbWDmGbv+wSRNshXJ/1B7IsIgm6NNprZWeBInojuq3Er9SgY46w7AA1qT4RgWppbOxFXI=
X-Received: by 2002:a05:622a:1a8a:b0:465:18f3:79c8 with SMTP id
 d75a77b69052e-471a40eca3amr3647231cf.13.1739290681809; Tue, 11 Feb 2025
 08:18:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211121128.703390-1-tabba@google.com> <20250211121128.703390-10-tabba@google.com>
 <Z6t227f31unTnQQt@google.com>
In-Reply-To: <Z6t227f31unTnQQt@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 11 Feb 2025 16:17:25 +0000
X-Gm-Features: AWEUYZleK4-0g5_ZXLVnzOqYNfblXwrznWvqo5s0DcKLyDLPZbzlg5mmY8W_67k
Message-ID: <CA+EHjTweTLDzhcCoEZYP4iyuti+8TU3HbtLHh+u5ark6WDjbsA@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] KVM: arm64: Introduce KVM_VM_TYPE_ARM_SW_PROTECTED
 machine type
To: Quentin Perret <qperret@google.com>
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
	maz@kernel.org, will@kernel.org, keirf@google.com, roypat@amazon.co.uk, 
	shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com, 
	jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Quentin,

On Tue, 11 Feb 2025 at 16:12, Quentin Perret <qperret@google.com> wrote:
>
> Hi Fuad,
>
> On Tuesday 11 Feb 2025 at 12:11:25 (+0000), Fuad Tabba wrote:
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index 117937a895da..f155d3781e08 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -652,6 +652,12 @@ struct kvm_enable_cap {
> >  #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK        0xffULL
> >  #define KVM_VM_TYPE_ARM_IPA_SIZE(x)          \
> >       ((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
> > +
> > +#define KVM_VM_TYPE_ARM_SW_PROTECTED (1UL << 9)
>
> FWIW, the downstream Android code has used bit 31 since forever
> for that.
>
> Although I very much believe that upstream should not care about the
> downstream mess in general, in this particular instance bit 9 really
> isn't superior in any way, and there's a bunch of existing userspace
> code that uses bit 31 today as we speak. It is very much Android's
> problem to update these userspace programs if we do go with bit 9
> upstream, but I don't really see how that would benefit upstream
> either.
>
> So, given that there is no maintenance cost for upstream to use bit 31
> instead of 9, I'd vote for using bit 31 and ease the landing with
> existing userspace code, unless folks are really opinionated with this
> stuff :)

My thinking is that this bit does _not_ mean pKVM. It means an
experimental software VM that is similar to the x86
KVM_X86_SW_PROTECTED_VM. Hence why I didn't choose bit 31.

From Documentation/virt/kvm/api.rst (for x86):

'''
Note, KVM_X86_SW_PROTECTED_VM is currently only for development and testing.
Do not use KVM_X86_SW_PROTECTED_VM for "real" VMs, and especially not in
production.  The behavior and effective ABI for software-protected VMs is
unstable.
'''

which is similar to the documentation I added here.

Cheers,
/fuad



> Thanks,
> Quentin
>
> > +#define KVM_VM_TYPE_MASK     (KVM_VM_TYPE_ARM_IPA_SIZE_MASK | \
> > +                              KVM_VM_TYPE_ARM_SW_PROTECTED)
> > +
> >  /*
> >   * ioctls for /dev/kvm fds:
> >   */
> > --
> > 2.48.1.502.g6dc24dfdaf-goog
> >

