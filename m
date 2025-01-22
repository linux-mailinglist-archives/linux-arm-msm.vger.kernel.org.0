Return-Path: <linux-arm-msm+bounces-45848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD45A1975A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 18:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2ECF4166FED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 17:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 005741369B4;
	Wed, 22 Jan 2025 17:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="beuzzy0x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB51215175
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 17:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737566234; cv=none; b=XATy0yw2m0dBQTlZBl0792mQcB0TxuEfblGKyPIphUJddj2wqDFNrrLiapweWg3kIILXoqnUzpZ0SUi1MAbl5VLBc99bjl5FZCL0hjPfianLYAzIMM/6qhfTyzI6uuhf/PiPWLmPvIliW7skdvlCjhw+ZSanEa1UeTACz+3y/iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737566234; c=relaxed/simple;
	bh=rFayQj9wRWaR8CO88HMKY/zcB290HuL2TiHKlw5kpQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1W5KlbTC2YpAEXfUFhlvMXRezDQu/iAyzbm25I2Ucmyumn3DxpO5O+biNylp13tSi5wdw1Mu/Dqf+sxMOKLSvSACquhXuBgJGOgocByjjtO1QKFxamkAGY2yUiBn/N5vWCs8d9iQTr6eQozhmlFSgjLu9uvQanpwBv+AAtbirM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=beuzzy0x; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-467abce2ef9so377721cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 09:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1737566232; x=1738171032; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QXocUQde967szk4UDZKkGbUbU0LoSzeIYIApGnat/VQ=;
        b=beuzzy0xYA3AAxpSCzHSvofgjKz29wm/fMv8rWArIFWmVqf7384211Py5iBnRCWLkd
         9WwIkaHbOoD6ubqsAbZYiWo63SxYnrVJnrxRTZ9s/Wy43NSdsSsAidJXYA6YMRL3lkw/
         4mSTRn/XGE8L1XroVb/DpOzuSMf+uPG8EtaKbljKZBhUaAfcriaKE6efcaKflbAp8ouc
         zaL5ODw0fA9cPksc4BQ3V4q963oXrqQam5zR/c/xuduVFt9HZG8jrfgxwd5yadBx+kow
         6JG7fcJjE3KWfXIIMeCr/1EqW/p1eInGo+0Il2e+aOF/7twhH5zk3FSceBXIHEltXukD
         YKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737566232; x=1738171032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QXocUQde967szk4UDZKkGbUbU0LoSzeIYIApGnat/VQ=;
        b=cafPjGivQE8tzNZxAVVAy0h7joYmbn6GYorm20yddq4/YTqOfyDdxDR5OYUamx9gL7
         /GfCy3QPODU5PgYJbbMMyl7rhWR32prctiHF8N0Z7YbVOwFLQEnoysrVQVITH+W8qV26
         +smlZ/e9f/HpDXpALsQ2jeOCM0UtX2m2hfcX0zfyR9KULJus6MTi139XvtbK0M4lq8WR
         PMz8xUVoDu+6UWgH0UUbjEJdvZlY1PYANzXYl6tpX7+UzyDS2hSt7vk4S7cLrJRPOvs8
         jCaDAYgqLZm4v9qhDV83IovTEleVLCtH6UbyVqzpO4V5sTX6H5p/hvJ6HtnB3ixWrifc
         30vA==
X-Forwarded-Encrypted: i=1; AJvYcCWc6ol/xL2PucKauEIijeFrLbOyNaFVqa/RWcrXsKsglyZIEVsAtQGplnvNG1yRUfoDAGRaWr+957m43Sq7@vger.kernel.org
X-Gm-Message-State: AOJu0YwhGppm8vxJpDoVJHvluSZaI+lXrQZSUMC8loOYPBpHkTTO4vy4
	rXvnRBkOZH5vEY6qsjC46MoMUTZCH5ExmX/6GFZzvA/uJIWnUu/a4QxM/rPpCYgmPiQ10IhwZok
	NYdYobE8Jtj7y1Usyo8rbMMyzBnsueEF9LLcp59kk3p+VpgVZBA0I
X-Gm-Gg: ASbGncuBcheG3b0/XS8yBA4aqOc+L3YNKAB8ZjC2JX/13OIZ1rgLmTvFP8pqZA+jq9f
	hAo/yFPwWoPfqfNtsUarVOiV3+xjNGDQ9brNRUf9ns0I1VT1olw==
X-Google-Smtp-Source: AGHT+IEQsOWG2CkfKJ5UyjyXVqUUaT5f122S2WjK08hXSlhtFa/31FlP+R15S32f6Ry3deFJL8wt7Zw3P8vlYMOWh9A=
X-Received: by 2002:ac8:5891:0:b0:467:8416:d99e with SMTP id
 d75a77b69052e-46e51478e5dmr3961311cf.21.1737566231990; Wed, 22 Jan 2025
 09:17:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122152738.1173160-1-tabba@google.com> <c15c84f2-bf19-4a62-91b8-03eefd0c1c89@redhat.com>
 <03bbcd00-bd5e-47de-8b20-31636e361f52@redhat.com>
In-Reply-To: <03bbcd00-bd5e-47de-8b20-31636e361f52@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 22 Jan 2025 17:16:35 +0000
X-Gm-Features: AWEUYZkG3SbCfMQ8gaycX4XPR7s2V8NDn4-WP1692u2hJ8637NJ27roODZTv50s
Message-ID: <CA+EHjTyGgs_Sp0b6OqeS7oVskhVG+S1cHhVRb5Z6mPAwGwmqFA@mail.gmail.com>
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

Hi David,

On Wed, 22 Jan 2025 at 15:41, David Hildenbrand <david@redhat.com> wrote:
>
> On 22.01.25 16:35, David Hildenbrand wrote:
> > On 22.01.25 16:27, Fuad Tabba wrote:
> >> The purpose of this series is to serve as a potential base for
> >> restricted mmap() support for guest_memfd [1]. It would allow
> >> experimentation with what that support would be like, in the safe
> >> environment of a new VM type used for testing.
> >>
> >> This series adds a new VM type for arm64,
> >> KVM_VM_TYPE_ARM_SW_PROTECTED, analogous to the x86
> >> KVM_X86_SW_PROTECTED_VM. This type is to serve as a development
> >> and testing vehicle for Confidential (CoCo) VMs.
> >>
> >> Similar to the x86 type, this is currently only for development
> >> and testing. It's not meant to be used for "real" VMs, and
> >> especially not in production. The behavior and effective ABI for
> >> software-protected VMs is unstable.
> >>
> >> This series enables mmap() support for guest_memfd specifically
> >> for the new software-protected VM type, only when explicitly
> >> enabled in the config.
> >
> > Hi!
> >
> > IIUC, in this series, there is no "private" vs "shared" distinction,
> > right? So all pages are mappable, and "conversion" does not exist?

You're right. This is a simplified version of my series that allows
mmaping of the new KVM_VM_TYPE_ARM_SW_PROTECTED vms to use for
experimentation.

Cheers,
/fuad

>
> Ah, I spot:
>
> +#define kvm_arch_private_mem_inplace(kvm)              \
> +       (IS_ENABLED(CONFIG_KVM_GMEM_MAPPABLE) &&        \
> +        ((kvm)->arch.vm_type & KVM_VM_TYPE_ARM_SW_PROTECTED))
>
> Which makes me wonder, why don't we need the same way of making sure all
> references/mappings are gone (+ new page type) when doing the shared ->
> private conversion? Or is this somewhere in here where I didn't spot it yet?

This is new to this series. The idea, based on a request from Patrick
Roy, was to have a VM in arm64 we could use to experiment with. Since
it allows the unconditional mmaping, it's only useful for experiments
or for non-confidential VMs that want to use guest_memfd.

This series isn't meant to replace the other one, more to supplement
it and facilitate experimentation while that's going.

Cheers,
/fuad

> --
> Cheers,
>
> David / dhildenb
>

