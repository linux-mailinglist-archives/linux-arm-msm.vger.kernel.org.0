Return-Path: <linux-arm-msm+bounces-45961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EE1A1A38A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 12:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4EB3162406
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 11:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED8B20CCCF;
	Thu, 23 Jan 2025 11:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vLGh5QmU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B41E20DD51
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 11:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737632855; cv=none; b=IKBdVv7km/q8yMxZMnv3tQxE6TciAJ+c55gj/Nh9aAN6/25y1anWWSuQP6bzktPKngO9UqIF0mJ1tiiZj3AkkWQ3NHYYGIaf08O1q0h1qmQeJ2j6RfjcdV6128LEbFhqEHY1BNn0PE9YWV5vRMqIRStUWoromP04Q/YwddQS5FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737632855; c=relaxed/simple;
	bh=3qbMM9Et/g9UUeXHn4xDax+QCA/WtNsET+jFuXVQ1xA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4SwUXUDnuIAJ2DDrfx6hfYdNd47z9nlQkQIfxJP6iNXVIdUwEMunXMa0sx33/n4g2cGELcB4sky4jY3C0G9IlgUclfefI/LCFglcsV/Cmhoo7816SB2g95ZrqhI0EFHKhnc1a4cpBrywmIal/688/4Kabp+OcrA3tCN7yLFM8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vLGh5QmU; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-467896541e1so230441cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jan 2025 03:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737632852; x=1738237652; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oUVqFVxmb1EAaOFebcx8Nr0q/gpw1Rr4Fc7f6JrHKEo=;
        b=vLGh5QmUuQy/dz4lIE0VRFEfadCjlzXzkLBINlp1T5p2Gm918EXH2VqL01RtD7Q5ep
         UzpdzKfIfkSOisGsX57KceGGh3gh8SjlTmxtDSK7i5sOO0oVJijJglFsN4mN+tB0JRfN
         kATBaGSYhf2Zi6UVBkNagZVC4BSL8YmnaiLsr63b4y9xq3iOKGXBsmN7SA4dhYjWpAac
         JURSPdRHqLhUhGaG9ayixeNjCFXGz/DjsB8NUzPdbaNxBSKg7ye1rQi6HuMqyal6i6Fp
         g129Knti9gMZrjNi7vdKp+3M1o2mKrbVTcljrbRf04WXfaAIjMJ4HvMUGshRBzMCt3fc
         IMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737632852; x=1738237652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oUVqFVxmb1EAaOFebcx8Nr0q/gpw1Rr4Fc7f6JrHKEo=;
        b=o71U6VpOVSAdZXQ3uHKco3dIE2IKIR7/dV3dWlgF8iCXU9gmpswb2g5EL+kE+vmVSN
         4MN3l9mqt49rbFDrPPkQvDjtX3ZYlSAYDk7FkwGbO3Fn6dWTc7p9qMMnqFv4rF5LKN+j
         F5YyBemk/yBI9sVkPwV5EJBRhuYo+c9HGSBIZY3XTLsn1w8E+Fpg6JknBrgwBzhdzgBN
         VFC5+rXRQ5D2s5cZ/21imR0RBxKGJMuj3uUgMO+Ca48j2dDuskUwb22wDplQyIaEwHMM
         Uj35asTXNWIEPJKzLfEVRdWyjo2Xu48vkT1t9dIuIzSs++EawE4BGY1DBnNZjCg4Ynrr
         thWA==
X-Forwarded-Encrypted: i=1; AJvYcCWaS+3h24y4VQ4QeD5BX+MQMs1lymitshjD07N3YZ0e/uOvYgXRgsdNGpqy9FthuiLKhNEEJZgiFtjvv14m@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf5e66CfAJBWeYvYz/1sRzj3TbVTIPtVY7DSREBXMuX5GQXT2O
	bR+NGqwF6xIk6Zb2iwI2/nTmaetJPpl1OMjHUkE9Ejbc+UDPDN+WRw+AIfghHC6exCYcFFS4iXw
	UhNf4pt8xmd2oLv3db4HBqzs3TUCptSNTGf4C
X-Gm-Gg: ASbGnctMkLJv7DG9fLn2UGx9oWiGKHhxi36iXgHgz4VfQ22wf7QgC56dA+H3VMDP0Aq
	O6l2apfcWmPfaUMctHJzBYErVdU9wC8ZvKSw1P/KN33PMF/zvNgOsdBdZNc4kWsfXdJxXg1GZbP
	xbtDdxsiWEZubxZg==
X-Google-Smtp-Source: AGHT+IHrf2fO0f+3GeRPXsuikbZb1z5AoQaJbM5kT+yCrejX2PdJr1+/J//roRLkhL2uZ7DlYSC4SJvq5n/tuVKBP1g=
X-Received: by 2002:a05:622a:1494:b0:46c:7252:67dd with SMTP id
 d75a77b69052e-46e5c11175emr3394461cf.14.1737632852098; Thu, 23 Jan 2025
 03:47:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122152738.1173160-1-tabba@google.com> <20250122152738.1173160-4-tabba@google.com>
 <b3568243-5154-424b-9114-9c28588be588@redhat.com>
In-Reply-To: <b3568243-5154-424b-9114-9c28588be588@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 23 Jan 2025 11:46:54 +0000
X-Gm-Features: AWEUYZnHHqoWM7UI1GKFfRLElevYk4_AcCzNeEaQaSf-Dbe3feBq5a9ziJStCUg
Message-ID: <CA+EHjTyhPaVAr1SKq23YJM9PDuEgc00-8owrcyCxg0Cd7meVag@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/9] KVM: guest_memfd: Add KVM capability to check
 if guest_memfd is host mappable
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

On Thu, 23 Jan 2025 at 11:42, David Hildenbrand <david@redhat.com> wrote:
>
> On 22.01.25 16:27, Fuad Tabba wrote:
> > Add the KVM capability KVM_CAP_GUEST_MEMFD_MAPPABLE, which is
> > true if mapping guest memory is supported by the host.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   include/uapi/linux/kvm.h | 1 +
> >   virt/kvm/kvm_main.c      | 4 ++++
> >   2 files changed, 5 insertions(+)
> >
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index 502ea63b5d2e..021f8ef9979b 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -933,6 +933,7 @@ struct kvm_enable_cap {
> >   #define KVM_CAP_PRE_FAULT_MEMORY 236
> >   #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
> >   #define KVM_CAP_X86_GUEST_MODE 238
> > +#define KVM_CAP_GUEST_MEMFD_MAPPABLE 239
>
> Maybe similarly consider calling this something like
>
> KVM_CAP_GUEST_MEMFD_SHARED_MEM
>
> No strong opinion on this one, though.

Ack. That would make the naming consistent.
/fuad

> --
> Cheers,
>
> David / dhildenb
>

