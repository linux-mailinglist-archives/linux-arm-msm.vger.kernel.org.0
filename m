Return-Path: <linux-arm-msm+bounces-49873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7057A4A035
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 18:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59AE61898F1F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 17:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EA31F4C86;
	Fri, 28 Feb 2025 17:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0vRvbFFR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894A41F4C81
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 17:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740763372; cv=none; b=DKeI98Rq7ADjfluk/3eEt8shGLdgzVYN/OmxjOIzIMD9Jw8nEHHrLLRzVsvEijHYvOSKGfkCDWTUh6UIsorgHVhLP+8zx4u4q8PmR6el5i0tClbyZDBrqraBHTLA+Azkc65nW6SjLZNWB+fYok1nYrk/IZ8h4ILHF+eqasyu6Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740763372; c=relaxed/simple;
	bh=/EptXUak4oIDKFwY+d4BF8vrIOm7ZPyHAOn/R5h71TM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C3sbjWXcGM0YNcHET8dySdACKJqcnpGR/54rA0TfueLrrd2jboOh2ajrF0OQiXnrg5jXspzoG6qIvuVN0iKg/eBEbUEAvMJPqDN4z6+TNyrwoIyWW0eKNyNWRYK/l5ciC1RA/oAanZZ0160p2tE/BfoPcP3Me4n1cAc6w1ERJKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0vRvbFFR; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-472098e6e75so295221cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 09:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740763369; x=1741368169; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G/a2UWjgQkqdTI5HsTvQ71onwZTMNWEb7HeWzmw5uT4=;
        b=0vRvbFFRTajaAJ6kqZCh9pda+Oul3iyMpTlIpgvK6P5DMOnN+pRWPKQOBkbyNbJKb3
         ThKzDD6M4Z0Hc8CVPJLgyCGmzkWQMs634YU1bi1gNJLOaRQCN5NSW73P96wiSUrneec3
         iFTrxbFX4Xkmjx5N8OPj79xYF6GfsIQRWHHfPocjOb7DlgdnYAhPscY1E6eq9GeiDCVt
         CpHapHebITOhVs8bcOx+y11FdpRN+q//DFrPFjTSSf52tVb/JnErCYcib+d9K8+sJTKb
         oBY6WmNhb1PsVKAXw+hfzuGiHsMXW2f/XSXyQuRIWHLNt0pftck82Dm+Rvc572MGh875
         B80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740763369; x=1741368169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/a2UWjgQkqdTI5HsTvQ71onwZTMNWEb7HeWzmw5uT4=;
        b=F/kFuHNwEgvmVgjsB14loNyhJ2kcJdSQSHWlZenvBh4qaGnodLlhBG9GLBQ57wHOx2
         NNjZi3n/k4inBk+ge7fELAVKvpRO2uQ+zdED9mJ/D4n+cgUm2dF+/nom+skVu3F9J8WR
         A3j2CqyAcDUzTuLaFvb+SRuTbCOULF/N7ep/4tk6pz2BwGc8MKBOVze0+gaJL84ppLKF
         6e4q1/hzthacI1iunE7jNRuqHH/Kb5ofZStcCp4giRx6NYxGiTF+5VtSN7ivMPFeroIr
         EtpRx/gRCJp8+6srDndxlYSSWYquhovUNAbinQrTp7caQYDTKrLVHkskLeWH8Y40r1VU
         xdHg==
X-Forwarded-Encrypted: i=1; AJvYcCWHnzkQITIrCl1PXC+3UyjWx5286+La1USw7dyyXq0L8SLfDp8HICmGYGvTU5PqAh6i+JwOWC7oGq7MAfeN@vger.kernel.org
X-Gm-Message-State: AOJu0YymGs1C6P1S0OhboLoDMDI75urEVEwiYlgmwLDqOkK7vraaTnvS
	wS7ONLjwzS3VCBglV87nJBwqDt9CgwJqyYSIoKxnKZRbQJgjdiDlq4pxchChRs22AS6SDiM+EzV
	3iHSoEOYcRk3ERxkUi7aXcRwhwTCDNFdM5OIt
X-Gm-Gg: ASbGnct5M5d4rjJ4iBkrvTV9F5QtuF2dQE5VaGREaH5xVT+9yzR4IAXKEG6DGf6vLIw
	x5SnjSSLkXjVsYvCJozFytAuEKXJFxW2fudisLL5tMtLhxFso2AeW3J0KQjJmh2fuY/r3jkWnDU
	mUDyM=
X-Google-Smtp-Source: AGHT+IGNihhgUrLxmnJiX8xoYuYEMEiLXOH8BXsKbEk/ejEZR6+wx/qspqpTF/usmPvMS/jdjbhGGnmO2UD7DWsi/6M=
X-Received: by 2002:a05:622a:54f:b0:471:939c:a304 with SMTP id
 d75a77b69052e-474bc08cbd6mr4750931cf.8.1740763369149; Fri, 28 Feb 2025
 09:22:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218172500.807733-1-tabba@google.com> <20250218172500.807733-5-tabba@google.com>
 <Z8HjG9WlE3Djouko@x1.local>
In-Reply-To: <Z8HjG9WlE3Djouko@x1.local>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 28 Feb 2025 09:22:12 -0800
X-Gm-Features: AQ5f1JpBi7_Gh4he9ov3als6nZxEfCC0aiYVThqoBIKa6XINpRRls12Z7Yy9QT4
Message-ID: <CA+EHjTy60QBnJtMeZsVjOypZxUm5KW0r-Hm6_bEN7On0MLmxjw@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] KVM: guest_memfd: Add KVM capability to check if
 guest_memfd is shared
To: Peter Xu <peterx@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
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

Hi Peter,

On Fri, 28 Feb 2025 at 08:24, Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Feb 18, 2025 at 05:24:54PM +0000, Fuad Tabba wrote:
> > Add the KVM capability KVM_CAP_GMEM_SHARED_MEM, which indicates
> > that the VM supports shared memory in guest_memfd, or that the
> > host can create VMs that support shared memory. Supporting shared
> > memory implies that memory can be mapped when shared with the
> > host.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  include/uapi/linux/kvm.h | 1 +
> >  virt/kvm/kvm_main.c      | 4 ++++
> >  2 files changed, 5 insertions(+)
> >
> > diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> > index 45e6d8fca9b9..117937a895da 100644
> > --- a/include/uapi/linux/kvm.h
> > +++ b/include/uapi/linux/kvm.h
> > @@ -929,6 +929,7 @@ struct kvm_enable_cap {
> >  #define KVM_CAP_PRE_FAULT_MEMORY 236
> >  #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
> >  #define KVM_CAP_X86_GUEST_MODE 238
> > +#define KVM_CAP_GMEM_SHARED_MEM 239
>
> I think SHARED_MEM is ok.  Said that, to me the use case in this series is
> more about "in-place" rather than "shared".
>
> In comparison, what I'm recently looking at is a "more" shared mode of
> guest-memfd where it works almost like memfd.  So all pages will be shared
> there.
>
> That helps me e.g. for the N:1 kvm binding issue I mentioned in another
> email (in one of my relies in previous version), in which case I want to
> enable gmemfd folios to be mapped more than once in a process.
>
> That'll work there as long as it's fully shared, because all things can be
> registered in the old VA way, then there's no need to have N:1 restriction.
> IOW, gmemfd will still rely on mmu notifier for tearing downs, and the
> gmem->bindings will always be empty.
>
> So if this one would be called "in-place", then I'll have my use case as
> "shared".

I understand what you mean. The naming here is to be consistent with
the rest of the series. I don't really have a strong opinion. It means
SHARED_IN_PLACE, but then that would be a mouthful. :)

> I don't want to add any burden to your series, I think I can still make
> that one "shared-full"..  So it's more of a pure comment just in case you
> also think "in-place" suites more, or any name you think can identify
> "in-place conversions" use case and "complete sharable" use cases.
>
> Please also feel free to copy me for newer posts.  I'd be more than happy
> to know when gmemfd will have a basic fault() function.

I definitely will. Thanks for your comments.

Cheers,
/fuad

> Thanks,
>
> --
> Peter Xu
>

