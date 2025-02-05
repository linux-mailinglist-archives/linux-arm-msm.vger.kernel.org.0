Return-Path: <linux-arm-msm+bounces-46897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DB8A28037
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 01:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5E8A1888874
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 00:43:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEA24227BA9;
	Wed,  5 Feb 2025 00:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k5v+1PSS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7926A227B8C
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 00:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738716168; cv=none; b=umgc/UgYC/O9vcIMwvOYYM05jzA3cYvUqMbRQuj71WjOmn+0V+n8DXB7wSBnkhO5vTwm/mFTP1DnbR3mqPp2FW0IwC1oQ0yLdYFVFsx6nAbxJgpkHupdUH8HU4CA1umZqQHNRZhGLxJXNy86oGswGfInJEjIzDauxVM0CJSJOxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738716168; c=relaxed/simple;
	bh=+k4LG/xT//VjVjGnheLfyBH4vM/8in5IOLbtjE03/+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=re3ZFqh3nZAOv/rr1aARAV40tdXCgLd1KNLNrlSI/2rWWqJI4sapYpFlJ4tiN3sxsaObY3nwguSWYR+8YcY0/2tY73gURfoMNlZBhH6ZxG3M4tqHxcviJZTbmL7K7HlD9SRqDJ191wJajH2vvslu22b4j/ptZ9G3svh5AbsIpUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k5v+1PSS; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-544043a21eeso6293e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 16:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738716163; x=1739320963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+k4LG/xT//VjVjGnheLfyBH4vM/8in5IOLbtjE03/+4=;
        b=k5v+1PSSEjxNbX/PQIPnzj5Z7eE4vrJem52rOiiWMw+h55g2fmFHvjU/keNkJftSB+
         C7Hn4VjY6plgwdzm1PcY4lA019FGEsNlWmRQsYQoyJVlxR6PXKe7OFo4IPqZ+0TY4Bec
         NzFcQD2IyzaGgFWZNogVtaGcdTrIJI5x/lYCUg7n5vx1OH5uEdYzYScp3T0oCNrmR7o5
         OSvsm8Fv9tikMOpbtEbXU1lI29DytiML6GLucugxD0D79udvHsZSSkGIP7LNy7zurSC+
         hdBtrKU9L2C2ZT5kUDSmLSr3w7U73+1Ai0K75CloynT7/p3/WqpjVZ/HMlrUvURGomBL
         14ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738716163; x=1739320963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+k4LG/xT//VjVjGnheLfyBH4vM/8in5IOLbtjE03/+4=;
        b=Nx/FVoEP1+UGbJ48GUZPvW/9sdanjUC5qAmo6zrE+uT6sNDJjqXLookjk5vCurq42p
         YHYV7jsnqOqafAzCbM+aPc5VYT0WV385ODGB6xvvLEWUDH1BjOjyfFAqV7fVnds7Cv3Q
         HuLu9qSc2vADAjDu79peaxtIzoj+VmWcj6+S3QtuaEjZLs0jrKLdmxPZebBRE5qW2WIc
         F9fbOZVdr6Dho3ptt5ktcLiRO9gn4VkSpQibAjYOJj8mCjxvH8aIJQZoqjUuMkSlG1RQ
         z0+rLePo2DhSmiYkWgmICSWStRBEfLdS2c/PXPKQPgw8c5y1Dmkgkf2FUl5Z+b6RPTf4
         NVbg==
X-Forwarded-Encrypted: i=1; AJvYcCW2Q5lEkYlBtsFro2wJ1wQajBIfLdxNskIx+retrUhD5FccQKdhJ/c0369QSENvn+8ryeV0U3753sSvObEd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9E3T2FJVnURye4HTXj0WGirKD+tEn70HbCWh/npCtnQMdyiz4
	FqkZW2Bfh8nNhjmCY5IMrywgg1WBddsYhdT5eJHxiLmIoumw+6Mwphm0IXkT3vgMqUo+bjfY87e
	FKo/Ty8bOt3p6jFrndOIj22JA7kC/RYCl1LU+zul9JR1oEzwyag4l+JQhZw==
X-Gm-Gg: ASbGncvzFao6Tx4qua8hFRpfEvZ4O7keNvXlNU87DMjM3goGWcNxXeQuswrIjIBkZGA
	iMR3RHyetb+5GQdGlEyWL6QWoShYAvz7a4uK10zUSdnCR/yNYsgmkJ+Z8Uq/O4WYNWvZ1FhGkwG
	dLRP1k60sPVamzLU6739MSrdRk
X-Google-Smtp-Source: AGHT+IGnTx6UzLjGyk5EFTTHRVuNUcIuJg7HuQX71hjcnsPe9x8OGm1xiRttmYhFZ6m7rhIXBpjHdBpULzkf6vArrrI=
X-Received: by 2002:a05:6512:3f26:b0:542:92ee:25ec with SMTP id
 2adb3069b0e04-54400bd3692mr317361e87.1.1738716163227; Tue, 04 Feb 2025
 16:42:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250117163001.2326672-1-tabba@google.com> <20250117163001.2326672-7-tabba@google.com>
In-Reply-To: <20250117163001.2326672-7-tabba@google.com>
From: Vishal Annapurve <vannapurve@google.com>
Date: Tue, 4 Feb 2025 16:42:31 -0800
X-Gm-Features: AWEUYZkca8r5uZlJZJrsv5qE9mdpIrtFmbgbr53sT6Fli1EBF4Nt1S-XWhf5aYQ
Message-ID: <CAGtprH90zc3EWSuyqy4hE7hsmSZSYfB3JBC8KBvc1PdMcw5a4w@mail.gmail.com>
Subject: Re: [RFC PATCH v5 06/15] KVM: guest_memfd: Handle final folio_put()
 of guestmem pages
To: Fuad Tabba <tabba@google.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, mic@digikod.net, 
	vbabka@suse.cz, ackerleytng@google.com, mail@maciej.szmigiero.name, 
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
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2025 at 8:30=E2=80=AFAM Fuad Tabba <tabba@google.com> wrote=
:
>
> Before transitioning a guest_memfd folio to unshared, thereby
> disallowing access by the host and allowing the hypervisor to
> transition its view of the guest page as private, we need to be
> sure that the host doesn't have any references to the folio.
>
> This patch introduces a new type for guest_memfd folios, and uses
> that to register a callback that informs the guest_memfd
> subsystem when the last reference is dropped, therefore knowing
> that the host doesn't have any remaining references.
>
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
> The function kvm_slot_gmem_register_callback() isn't used in this
> series. It will be used later in code that performs unsharing of
> memory. I have tested it with pKVM, based on downstream code [*].
> It's included in this RFC since it demonstrates the plan to
> handle unsharing of private folios.
>
> [*] https://android-kvm.googlesource.com/linux/+/refs/heads/tabba/guestme=
m-6.13-v5-pkvm

Should the invocation of kvm_slot_gmem_register_callback() happen in
the same critical block as setting the guest memfd range mappability
to NONE, otherwise conversion/truncation could race with registration
of callback?

