Return-Path: <linux-arm-msm+bounces-60294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DDBACEC43
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 10:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 901DC3AB26A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 08:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 802484A0C;
	Thu,  5 Jun 2025 08:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="X4y+H1Kk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB0A13AD05
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jun 2025 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749113120; cv=none; b=kTUrv5o79gA4x93xGPl2cgM+bz0WYbjajgvhhnhhpfep/0csb4wvcZmeQM74mkFGlxiZvJKMuvWPw4UmZg5d1OY1P3ovBaO9t5GmWQHAkcvjouuAaO2XykbvIWwu1mlgOkvLEif1JLSOJ5X1YnroZCTGPlbGR5H2KcEp9ke8bBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749113120; c=relaxed/simple;
	bh=lZjR6l58LPOXxIlWey2rFPrDe6qtvVUwJd6LixHUXmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hQzoYOoE6rnb1p2JmhY9JjLHrL033wDOWFtsTA3L1OElT9Sz9rgeACYpCdsZACuZyfIG4xMTqwWX9GgsYcsIWPX4maskekk+zA20idCbSzzMgKoxmtwoe2VI1TisQD1zqIYhVoUh2iyBQmZXzHpeE0yTtqFegM09mGegWaosShE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=X4y+H1Kk; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4a58ef58a38so418911cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jun 2025 01:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749113117; x=1749717917; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JnbBtZ4D2hBh9y3M0ZCCLMOg59INFuW1YRX08XTCyio=;
        b=X4y+H1Kk0n9rCZeUngB5zxsK5u01kzmvnV8rfZzCP8687XWpfTP5NBx6QYBIKa8zYl
         uK1gN1akKiFTlZNjfuBSMTUHFaofh6O2o2A6H9c7af73tISHTNxRqg3+ZbyoO35wUbe7
         HE4YJ4/WasPZpa1BwM96+TugJziUMCjMQmqU/WTPSzadpDyBPR/bzglNZSrRxHrvarT9
         I4P7DKgdU8uOnw/288o/RNCqeFyRJQzOMJ5y+oz11Y5tcuib/vLljyev51XPM3gOe+1E
         Vc2bHeRATiJj5MGJUUUKiNRj2/M5DGvaccC2rMSaS1Ti0wB1DiewHz0QZLjk7BXtJj8o
         f4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749113117; x=1749717917;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JnbBtZ4D2hBh9y3M0ZCCLMOg59INFuW1YRX08XTCyio=;
        b=p2ZBGIjOksC+eP8VniNPmFOo/kTSAr5KUl9Za6Xma4eOq+w3yXddv0/O5MVbaqNLXv
         +bcpTU7xsD0aidcxVDRykglNj2HixlJMKLEUu7i9TrnsUp63bDxZJZgA7tfnpPS4vKSF
         IIhwZGNALcW7vLPlqJjmVe3C4qGDZj5Fvl2Y5re/GKI7y2c6tJI++kFlROlFM5H68DJO
         E2QQoeet3QAHdSZh2r9UASnh2v0XRNdxS5qfZ6O98YitvBxUUDnNVt9+85dEpG3X64j1
         VNj5uX8cua/auZGNKVvzy31QqKuHXYANJg+Z/76MVsqD8KA9FMm3kFXeY1x5I9lxmhIy
         aCjA==
X-Forwarded-Encrypted: i=1; AJvYcCU8DAwWi4pZI5dT3ALJaB4Ybl52f2Bznn+Dd/GrqLZPPOoC1llOLriChsmJXHtZQtcfyUuby2EQsZmtOHXh@vger.kernel.org
X-Gm-Message-State: AOJu0Yym2+jwCqRpq1GYY/p43FHX5THbOD+6PHL43tFk5ULsYV94IP2I
	HjuWzG9VfR02Mp4iEmRtjBZFgXFUgbqfJG9cKDVBGhEZU/kJZpJNkPv4qolFc2KFlxJoJ3P6F18
	gAH7OBG0iG0DmWfilPRapK5o937WnbdAb00ovZslP
X-Gm-Gg: ASbGnctgDadF3BOdHmDJDj+QfO2cIvXWoJ1d59y55hpb1cf1jkCzNLpB/BeruFo+x9Z
	+W4MeqI0irbrhg9/PN3b6Dt2POOtsxy050dZhEaoV2jphWIHUyvdcE2p/7+pepsazmZhzN3aUxz
	0TfIh+OJtPBOpVlHGONgxWWE15t6Rar5JsKZNCz8F0XdzOlK/UayL44Q==
X-Google-Smtp-Source: AGHT+IHsByj8V2+IKDkWqLinrRR0R/u33USxHEReIJl4YsqveAQKYfVjMUv5hgFvz6GOyokpXtjWXSJq0G3sAdxhDJ0=
X-Received: by 2002:a05:622a:1c0c:b0:497:75b6:e542 with SMTP id
 d75a77b69052e-4a5af46d35emr2910511cf.10.1749113117103; Thu, 05 Jun 2025
 01:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527180245.1413463-1-tabba@google.com> <20250527180245.1413463-9-tabba@google.com>
 <b2bef336-4ad3-4106-ace4-5d677afb9d3f@suse.cz>
In-Reply-To: <b2bef336-4ad3-4106-ace4-5d677afb9d3f@suse.cz>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 5 Jun 2025 09:44:40 +0100
X-Gm-Features: AX0GCFugMIh1YPooIeoODj-4bgJGXFKwzjZX0F6CPJdRrHBnuFlUmoXPsINMIGU
Message-ID: <CA+EHjTwEyoU1KpHjJ++HJjmMaNtqzUU2PgR3kVa8ahzFTx8J=g@mail.gmail.com>
Subject: Re: [PATCH v10 08/16] KVM: guest_memfd: Allow host to map guest_memfd pages
To: Vlastimil Babka <vbabka@suse.cz>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vannapurve@google.com, 
	ackerleytng@google.com, mail@maciej.szmigiero.name, david@redhat.com, 
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

Hi Vlastimil

On Thu, 5 Jun 2025 at 09:28, Vlastimil Babka <vbabka@suse.cz> wrote:
>
> On 5/27/25 20:02, Fuad Tabba wrote:
> > This patch enables support for shared memory in guest_memfd, including
> > mapping that memory at the host userspace. This support is gated by the
> > configuration option KVM_GMEM_SHARED_MEM, and toggled by the guest_memfd
> > flag GUEST_MEMFD_FLAG_SUPPORT_SHARED, which can be set when creating a
> > guest_memfd instance.
> >
> > Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
>
> <snip>
>
> > diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> > index 559c93ad90be..df225298ab10 100644
> > --- a/virt/kvm/Kconfig
> > +++ b/virt/kvm/Kconfig
> > @@ -128,3 +128,8 @@ config HAVE_KVM_ARCH_GMEM_PREPARE
> >  config HAVE_KVM_ARCH_GMEM_INVALIDATE
> >         bool
> >         depends on KVM_GMEM
> > +
> > +config KVM_GMEM_SHARED_MEM
> > +       select KVM_GMEM
> > +       bool
> > +       prompt "Enable support for non-private (shared) memory in guest_memfd"
>
> Due to this "prompt" line, the toggle for this appears on the front page on
> make menuconfig, or is asked during make oldconfig etc.
> Seems not intended, no other options in this Kconfig have prompts, and the
> later patch selects this option. So the prompt should be removed, otherwise
> it's a Linus yelling hazard :)

Ack, and thanks for the reviews!

Cheers,
/fuad

