Return-Path: <linux-arm-msm+bounces-48026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D06D8A35EB2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 14:19:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BDDFC189961E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 13:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A47526560F;
	Fri, 14 Feb 2025 13:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pe2KXrxL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A744264FB2
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 13:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739538757; cv=none; b=H1vpVwddRB1MFP3npvGCv9T0xJLxusojlhVdePyC5QyzEUtwG1w83EcFwzrzgq/fcy3X8iH49lMTwje0Lt9ar0LR9fRV4mbCuAVNTDbm2KCw3U5jJOqTAyCrIWXEom9M6cuCA//8n4EO/zzxtU8/62uC/KXzjrgK+cchBsrtqzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739538757; c=relaxed/simple;
	bh=zNi5WLr0Xv0TwHaaZJqiogAW1THAfheVtXEohY4nxzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nDRoXSIHAeNVZkGLxNh8xIGYKQRh4mpQaC2Y4CReeGLWVMoEaIH6Sm4kFGpCCfccQXEpmCcqHD/adOqaw8JWUFUXJuj7SVe+cwi/om1tvUXoWqJbtUP5/7fe2+LmKxo/+/7CienlJDZyWoVFnO0XqbfcGzQSoPUNFMp5A884CtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pe2KXrxL; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-471c9947bb5so213991cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 05:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739538754; x=1740143554; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zNi5WLr0Xv0TwHaaZJqiogAW1THAfheVtXEohY4nxzo=;
        b=pe2KXrxL4t3tpGcOcG3N09BQenxSX6Qtwa8O/4YZb5o5FNKmxhzjYA86DhzHHsXU07
         BqIFjvjI52qak7QsuSPH96mJVeyNs1n0nLWJKmRObrG8V/4OgmO+bjfXBIedLX2oEGq+
         1McjZLSdS83/OA45WDzEMHEWlsfH2l5SJ8hGe7nIgIB/LpcW/Hmb7ttdZBSJ1KAKC86K
         ZcEgrULZRl87DNrjg6hHPjxXhkr7GrJgp3+qWeJDvkyBnEcN4HquwGuSCEPM8QeJlHgo
         +J+wNmSuSEhzHBTUvplI3NLO5U6QGkJ0bi15wSC/MrilNs0c45LcYznqDeODUjE/PtFk
         BQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739538754; x=1740143554;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zNi5WLr0Xv0TwHaaZJqiogAW1THAfheVtXEohY4nxzo=;
        b=mE6rQGIInq/NRxEsWxEB6K1efulmRSL1LcHdw2ORfcHd8gMfwIui2CO45JSgPWTNkb
         Q76xptYS1htSpXtlqOPHoyjksTkVyrRV9JC6yQdwJ+MntVm6jOKs69ui7FEAfzjMSA+Z
         Crjnmxvw1Y41jbzYWmCL+toxt5loH0iCYAyWXBSaRixt9EdRG3Ro5neL6MavElirA4Tw
         TNkq/i3vJurvUbDgZ0T5ifpjHPr8xSem/uquygnTSwUcpK7TBmFv8O2gGXxYrWamDukD
         bxzYOKTUmyF3fz3rMTkN8G+obNldR5EgrKLpknebLrMRAqLZQAnd5/buOlUPBvVkPuaY
         Ku0w==
X-Forwarded-Encrypted: i=1; AJvYcCU4JwreknF+WgB6LirKtNN6NIDZUej8Bkjonh2tkY34A3anYLweG44ZviItpqaLZdS4yeD3XJC9RVMdPWN/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8S2HWS+4H71D6PVhmrRYsqMAq1s6sCMoPtp2jN42kLLViGkEo
	q12krtBEBVOIA5qJqXRqkwRM8hK+NMqjl45Ba30oW+pqxZ1Ormvpai2uKYZF/TmVdJeN+k48S+Y
	tW3AXhU9YgyaenduB0xZA4Txpi74hGerhw0iK
X-Gm-Gg: ASbGncvfzJHCTq8VaBxdFPNQ3V43WSlzxn5Ml0hdU0SBo+jh6+9Zxe4fgQZMHO1B/Ti
	ko26jpZqwrslKFouYOBgM0GDx/OGTpj3LVnJQqbb86tHAocbfrAJk5pOhr0Gn5OaZVp8gjJw=
X-Google-Smtp-Source: AGHT+IHfVH3XaWPCkKWV6hxZjYre5tjBmvsTWSU9Jq1gOifZbOjP1USFXc0eACKKDkgOPq5Fn5G8l9QQjOM1vmE8scQ=
X-Received: by 2002:a05:622a:1812:b0:471:812b:508 with SMTP id
 d75a77b69052e-471ce8ef5f7mr3094321cf.14.1739538753745; Fri, 14 Feb 2025
 05:12:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211121128.703390-1-tabba@google.com> <20250211121128.703390-10-tabba@google.com>
 <Z6t227f31unTnQQt@google.com> <CA+EHjTweTLDzhcCoEZYP4iyuti+8TU3HbtLHh+u5ark6WDjbsA@mail.gmail.com>
 <Z6t6_M8un1Cf3nmk@google.com> <d9645330-3a0d-4950-a50b-ce82b428e08c@amazon.co.uk>
 <Z6uEQFDbMGboHYx7@google.com> <Z68lZUeGWwIe-tEK@google.com>
 <CA+EHjTz=d99Mz9jXt5onmtkJgxDetZ32NYkFv98L50BJgSbgGg@mail.gmail.com> <ebbc4523-6bec-4f4f-a509-d10a264a9a97@amazon.co.uk>
In-Reply-To: <ebbc4523-6bec-4f4f-a509-d10a264a9a97@amazon.co.uk>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 14 Feb 2025 13:11:56 +0000
X-Gm-Features: AWEUYZkNr2Uul6_iPp94OYAFbo8pAAh3UwwAo4NKDmUwU_-sBj6dQOexcTIaJvw
Message-ID: <CA+EHjTyiRAun3XbRUZA52Pq2kSk+gHFt_PksJcCh7P1V3-J3_A@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] KVM: arm64: Introduce KVM_VM_TYPE_ARM_SW_PROTECTED
 machine type
To: Patrick Roy <roypat@amazon.co.uk>
Cc: Quentin Perret <qperret@google.com>, seanjc@google.com, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, 
	mic@digikod.net, vbabka@suse.cz, vannapurve@google.com, 
	ackerleytng@google.com, mail@maciej.szmigiero.name, david@redhat.com, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, keirf@google.com, 
	shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, rientjes@google.com, 
	jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Patrick,

On Fri, 14 Feb 2025 at 12:37, Patrick Roy <roypat@amazon.co.uk> wrote:
>
>
>
> On Fri, 2025-02-14 at 11:33 +0000, Fuad Tabba wrote:
> > Hi Quentin,
> >
> > On Fri, 14 Feb 2025 at 11:13, Quentin Perret <qperret@google.com> wrote:
> >>
> >> On Tuesday 11 Feb 2025 at 17:09:20 (+0000), Quentin Perret wrote:
> >>> Hi Patrick,
> >>>
> >>> On Tuesday 11 Feb 2025 at 16:32:31 (+0000), Patrick Roy wrote:
> >>>> I was hoping that SW_PROTECTED_VM will be the VM type that something
> >>>> like Firecracker could use, e.g. an interface to guest_memfd specifically
> >>>> _without_ pKVM, as Fuad was saying.
> >>>
> >>> I had, probably incorrectly, assumed that we'd eventually want to allow
> >>> gmem for all VMs, including traditional KVM VMs that don't have anything
> >>> special. Perhaps the gmem support could be exposed via a KVM_CAP in this
> >>> case?
> >>>
> >>> Anyway, no objection to the proposed approach in this patch assuming we
> >>> will eventually have HW_PROTECTED_VM for pKVM VMs, and that _that_ can be
> >>> bit 31 :).
> >>
> >> Thinking about this a bit deeper, I am still wondering what this new
> >> SW_PROTECTED VM type is buying us? Given that SW_PROTECTED VMs accept
> >> both guest-memfd backed memslots and traditional HVA-backed memslots, we
> >> could just make normal KVM guests accept guest-memfd memslots and get
> >> the same thing? Is there any reason not to do that instead? Even though
> >> SW_PROTECTED VMs are documented as 'unstable', the reality is this is
> >> UAPI and you can bet it will end up being relied upon, so I would prefer
> >> to have a solid reason for introducing this new VM type.
> >
> > The more I think about it, I agree with you. I think that reasonable
> > behavior (for kvm/arm64) would be to allow using guest_memfd with all
> > VM types. If the VM type is a non-protected type, then its memory is
> > considered shared by default and is mappable --- as long as the
> > kconfig option is enabled. If VM is protected then the memory is not
> > shared by default.
> >
> > What do you think Patrick? Do you need an explicit VM type?
>
> Mhh, no, if "normal" VMs support guest_memfd, then that works too. I
> suggested the VM type because that's how x86 works
> (KVM_X86_SW_PROTECTED_VM), but never actually stopped to think about
> whether it makes sense for ARM. Maybe Sean knows something we're missing?
>
> I wonder whether having the "default sharedness" depend on the vm type
> works out though - whether a range of gmem is shared or private is a
> property of the guest_memfd instance, not the VM it's attached to, so I
> guess the default behavior needs to be based solely on the guest_memfd
> as well (and then if someone tries to attach a gmem to a VM whose desire
> of protection doesnt match the guest_memfd's configuration, that
> operation would fail)?

Each guest_memfd is associated with a KVM instance. Although it could
migrate, it would be weird for a guest_memfd instance to migrate
between different types of VM, or at least, migrate between VMs that
have different confidentiality requirements.


> Tangentially related, does KVM_GMEM_SHARED to you mean "guest_memfd also
> supports shared sections", or "guest_memfd does not support private
> memory anymore"? (the difference being that in the former, then
> KVM_GMEM_SHARED would later get the ability to convert ranges private,
> and the EOPNOSUPP is just a transient state until conversion support is
> merged) - doesnt matter for my usecase, but I got curious as some other
> threads implied the second option to me and I ended up wondering why.

My thinking (and implementation in the other patch series) is that
KVM_GMEM_SHARED (back then called KVM_GMEM_MAPPABLE) allows sharing in
place/mapping, without adding restrictions.

Cheers,
/fuad

> Best,
> Patrick
>
> > Cheers,
> > /fuad
> >
> >> Cheers,
> >> Quentin

