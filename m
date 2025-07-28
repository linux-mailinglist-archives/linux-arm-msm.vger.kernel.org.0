Return-Path: <linux-arm-msm+bounces-66815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14677B1354E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 09:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 77E3E3A6DAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 07:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB5F221704;
	Mon, 28 Jul 2025 07:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ijItCgtA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDFD220F5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 07:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753686344; cv=none; b=iI6dvlVe/hBdLHDZRZhUQVbyb9DjG1usMGCdhvNaXmzOz+WNf5P2IVsLI/ipgqUDb5MDApXa+qj5QxuxJycppi9Twm2vGDhb5nOek2byu0dlrPdpZWMimEA4dvSmfoParxEuKo+42uOwntQtaSNGjGPLmA3aBfrcyiL3kgoWsWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753686344; c=relaxed/simple;
	bh=kQwpUu3pdIcVVkEM6j2jRU78dQ5txh+ni/j6a59ryYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3V4rsslHaLPTDUu1rSg0cc0G5E46IDOfrPwL5jkk1ita72HxqdWwgzPHeyT+j0IQSvlX7OiaRbrPNNOybfVZkV+t9F/5EJVSLByHXCXSYS1f7IkV8pcSvOZXU+B2MgrVNvepL3mxqk+nHeKTRa1O6vfposiix16c9XLPH7XV0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ijItCgtA; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553a66c3567so6818e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 00:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753686341; x=1754291141; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ABzFGAudwjHSpGmDKnmCejI++sq8wZtuTDnQk4QEthU=;
        b=ijItCgtAXOr/Sn1hwkyD8P+i0hXjQoCMDPDzDdbbgvoOJrLsXL0yF8d69MDjgp6Bt8
         dj/h0ORS2K8JEa5X3cOlIoRla+QROz5BEfWqHHWFMe++7tBhpcAQU3YBS9EHxgX9Dhb1
         Cr9HYYz5RQ38mDvYUs93AKyKcxuvFcMy0WkoxCAl+aVUv8X1SKbLnpkS0MuWQFPZVjk6
         Lm+WuPJ3YN2Lgz2Ntco+ooWj4AFlY1hNepZK00VZDdNYMw9So45M9MoxTDoo2PpnrGGH
         4dq7XIWsWOgdyBKYLDSY9AzY6lThlUBRpQXycWst1ejCZhEprt5b0Abvo5dpvYXkrhSH
         S1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753686341; x=1754291141;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABzFGAudwjHSpGmDKnmCejI++sq8wZtuTDnQk4QEthU=;
        b=gvFDNCOU6FYqPtte9V14MuRS7Mx0bwfMjO4Yf/4heRfqa/I7dlKT+6tOjmwvHNy6yM
         vvFJ9vTff//r35wbzNXpAC1NDF6+AZYKQOTvkuo53VncBnxUK35PazhjLXBcyRbGeW+3
         fxD66Z0FnqU/VsRUD25iUwim7TjMx8sVcAX4omJ/p30BDqHjJPLpXaLhUVTl1+Vh/EfN
         tE8R3KtDWKDxU3LL6lpaj16sqBWKSdWq70P7b9RYUW8A5vJ17TONlFkP2F8NdPpxJhZs
         Fg/UscM3ChR71N4lnLM3BR6cRA6Ts9uM3Vj/XUE+IhT3BBScpATLVCumWVRxS4rFN+bA
         uHBA==
X-Forwarded-Encrypted: i=1; AJvYcCU1Cp/XtvmTkratKqXlSRd/K6KcbkAikD7mqjAIPNG2gQeWlZn6Z+BLWgyUAXBnX5nZifuBQ3HjCWDP29fc@vger.kernel.org
X-Gm-Message-State: AOJu0YztnSVITltHrD+zZa/L50x2SJx90Sj3Y7vrOTq/PPWmonqAGbUG
	HQcpyhw40YcGrDmBN4flUqvXgDOpnVVNzB6iVyDIIw/2kmImWOd8iZR05Id8mrH7ek+0Jz0YYmd
	EGzhEPsfpE2faIeQ9jZhl1iRnZy1AtjY+oqGkwJ3V
X-Gm-Gg: ASbGnctW/fFq4m9P0IcoIGUiPQG5Vp4ejvebqqehmQIKBkZW56U1M8fJ0GCXct8QX01
	A6Ii4IfeHcpNq82jKa1K7kWwvaQQvLiwjgbpkU1KJcsS+jEqXpimlgsaotcf0bstuk/gjzvXNcT
	y2eHGzLtK9CtxVQKNE5yT5uSwfduFVnYB2WWsd6hDaUU9o58AnM3oXygfPoRnehFGC/a3s13FTs
	Co20AsA3Iqqw4GrXQ==
X-Google-Smtp-Source: AGHT+IH+nhG03vhszpw4SpGxLBcsItXrblXPXI/Z3jowcjOUQPpqAObstdzHVPgpSKZxUwqvLJJMux8lmEFM7MWk230=
X-Received: by 2002:a05:6512:2117:b0:55b:5e22:dfb2 with SMTP id
 2adb3069b0e04-55b63a96040mr246280e87.0.1753686340942; Mon, 28 Jul 2025
 00:05:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250723104714.1674617-1-tabba@google.com> <diqz4iv1dudx.fsf@ackerleytng-ctop.c.googlers.com>
 <aIObJH439LQWjnqq@google.com>
In-Reply-To: <aIObJH439LQWjnqq@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 28 Jul 2025 08:05:01 +0100
X-Gm-Features: Ac12FXyVGBddx8pm5Wrn9wDW0AE2GoOgT_q7kkPWz9XW40HNA-igFWzzFSoA1tE
Message-ID: <CA+EHjTyhSU0WiAc7GhwrdZjoUe0w5Uk-gGxd_AD6SRmezYNROQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] KVM: Enable host userspace mapping for
 guest_memfd-backed memory for non-CoCo VMs
To: Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	willy@infradead.org, akpm@linux-foundation.org, xiaoyao.li@intel.com, 
	yilun.xu@intel.com, chao.p.peng@linux.intel.com, jarkko@kernel.org, 
	amoorthy@google.com, dmatlack@google.com, isaku.yamahata@intel.com, 
	mic@digikod.net, vbabka@suse.cz, vannapurve@google.com, 
	mail@maciej.szmigiero.name, david@redhat.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, suzuki.poulose@arm.com, steven.price@arm.com, 
	quic_eberman@quicinc.com, quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_cvanscha@quicinc.com, 
	quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, catalin.marinas@arm.com, 
	james.morse@arm.com, yuzenghui@huawei.com, oliver.upton@linux.dev, 
	maz@kernel.org, will@kernel.org, qperret@google.com, keirf@google.com, 
	roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, jgg@nvidia.com, 
	rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, hughd@google.com, 
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Sean,

On Fri, 25 Jul 2025 at 15:56, Sean Christopherson <seanjc@google.com> wrote:
>
> On Thu, Jul 24, 2025, Ackerley Tng wrote:
> > Fuad Tabba <tabba@google.com> writes:
> >
> > [snip]
> >
> > Did the patch [1] for x86/mmu that actually allows faulting when
> > kvm_memslot_is_gmem_only() get dropped by accident?
>
> Ah shoot, it did get dropped.  I have a feeling Fuad read "drop the helper" as
> "drop the patch" :-)
>
> Faud, given the growing list of x86-specific goofs, any objection to me sending
> v17?  I'd also like to tack on a selftest patch to verify that KVM can actually
> fault-in non-private memory via a guest_memfd fd.

Whatever you prefer. No objection from me for you sending out a v17.

Thanks!
/fuad

