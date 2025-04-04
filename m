Return-Path: <linux-arm-msm+bounces-53263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BD2A7C5BD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 23:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F09C3AD966
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 21:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25651A317A;
	Fri,  4 Apr 2025 21:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FBvfhNrM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C01A19E99E
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Apr 2025 21:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743803314; cv=none; b=iTLB0+5Mv8Zh717b9FOY4H8Aa4DOFSTLttDP1V4/E2hoxRe93VyrKLgi+vr3L/OsbdYgceCSHXArauEJ3lxhwQf8CMkBXk1jsMxORmmk4Q2x54nzgGBQLVN13+8ZNdi0flHkuIPQ9IWxyRCKP+/ir01elGcJrHEReeeWyEAQPgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743803314; c=relaxed/simple;
	bh=0dmKkwKNseqfD2qXy02Zh4cyweoIQw5GpiuHXslkeaQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I8gkFQ97KxE7YMfrp/FbqToaPOWi5LsYQnP7bu7PlzdhxtIidqWaynHjb9h0ZlxjQqgJCnq6drDxPKaNzAoVxXT8dG52IXYGOpmV5mhEg3/Xk0wKoFkF9XJ3D/syho32H2SW04dpAieiO/BYvt07nCgtBuGNKxRva2zpXANpyYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FBvfhNrM; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff7f9a0b9bso2364164a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Apr 2025 14:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743803313; x=1744408113; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3cf9fSAlA9wA6PdkDcxtivqGkWoshv2pw9Tz3F/yjKA=;
        b=FBvfhNrMGEji1IVT03oAumisn1NUQow9p8lwSFBadfxEktIHNI2cKgnHpPEW482yNr
         XV05QTYGS3btx6ffLRRvwD5RTWB3D/GJ8ld1lpbALQJGfXscBQPvb4rGvhdDUVkKE3hL
         xDTqKThSEHh5Poxq47f0wm44/Rkn+vykwEabhR53qco0JtgI/nN/vdKOxlbCw98+QQlR
         8w1TB5FntQ8x0haz5MEBP/MyTDPOkfSpyKldaZegpYPn3XwJyQNzK7baH1UWSzDvLBW3
         1DJIU+1VKnDLrByZhi7AEbb2ct98qTJ0wiJgQSCeoHNOFSYp43jxTjvHZOERYKUsRUvy
         qscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743803313; x=1744408113;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3cf9fSAlA9wA6PdkDcxtivqGkWoshv2pw9Tz3F/yjKA=;
        b=rlg2A/LDMdxv6EOw7rv/c1gR39U5ca7SSBwZ5UUPWympsZc6SkSTRRszGdW06U9QkG
         D32ta4RL3HowhJHbkv+mOBEPhp9kksUGP6kYzcR1Flv/DzRayHd/UpjXLtpMrQ4y07kj
         Gy3pwJxyqDwQGqX8uk4ZuxlwQOYxcjfjlXt77DucG4DuCGDMWss59ixyn7Xt+7ETS2uw
         xkQ+/VT9OdzoL1ec0LA42b+peSUyPcPAzOE+rD2dW5oB7kNB10EDQT6yjC+j8/Ee2aqw
         UQ3RPLYRPigOm5bZ8bQkB4mKrWyL1yf1+LTzJaqhZFVND/dX+GHJZ4SB/uMbt4jkAPzb
         /hbw==
X-Forwarded-Encrypted: i=1; AJvYcCUC/rZOBVse4oKv8m52WfUoZPelU9WLqWkBZeCEoLcL5Hny+VCAqBnqtF6pBOvWLuiGc8WhjILFTcW2H5EP@vger.kernel.org
X-Gm-Message-State: AOJu0YyIk0IAiOcZqVANR32jdTNmHGXFNyAH4Z/1qBVzcNoXnlbwmD9S
	OfEBu5Jhp+iR8ehNdUKhajmlQhT44FYRnEILOFK0xV8p0dQJDJ5QPbtRUW+injTxb8ZPBapBrrS
	iZg==
X-Google-Smtp-Source: AGHT+IGnpdNYuWzpbuLbwm0d2ujiOyaHHb+qDWV50749XtRBO5rwC9BebHoC4cuO0ouBPGpi5P4M3hT5gBU=
X-Received: from pjbsw8.prod.google.com ([2002:a17:90b:2c88:b0:2ff:4be0:c675])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5150:b0:2fe:afa7:eaf8
 with SMTP id 98e67ed59e1d1-306a4860a8amr6236253a91.13.1743803312668; Fri, 04
 Apr 2025 14:48:32 -0700 (PDT)
Date: Fri, 4 Apr 2025 14:48:31 -0700
In-Reply-To: <894eb67c-a9e4-4ae4-af32-51d8a71ddfc4@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250328153133.3504118-1-tabba@google.com> <egk7ltxtgzngmet3dzygvcskvvo34wu333na4dsstvkcezwcjh@6klyi5bjwkwa>
 <894eb67c-a9e4-4ae4-af32-51d8a71ddfc4@redhat.com>
Message-ID: <Z_BTr9EbC0Vz1uo7@google.com>
Subject: Re: [PATCH v7 0/7] KVM: Restricted mapping of guest_memfd at the host
 and arm64 support
From: Sean Christopherson <seanjc@google.com>
To: David Hildenbrand <david@redhat.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, pbonzini@redhat.com, 
	chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, isaku.yamahata@intel.com, mic@digikod.net, 
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
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 04, 2025, David Hildenbrand wrote:
> On 04.04.25 20:05, Liam R. Howlett wrote:
> > But then again, maybe are are not going through linux-mm for upstream?
> 
> [replying to some bits]
> 
> As all patches and this subject is "KVM:" I would assume this goes through
> the kvm tree once ready.

Yeah, that's a safe assumption.

> > It looks like a small team across companies are collaborating on this,
> > and that's awesome.  I think you need to change how you are doing things
> > and let the rest of us in on the code earlier.
> 
> I think the approach taken to share the different pieces early makes sense,
> it just has to be clearer what the dependencies are and what is actually the
> first thing that should go in so people can focus review on that.

100% agreed that sharing early makes sense, but I also 100% agree with Liam that
having multiple series flying around with multiple dependencies makes them all
unreviewable.  I simply don't have the bandwidth to track down who's doing what
and where.

I don't see those two sides as conflicting.  Someone "just" needs to take point
on collecting, squashing, and posting the various inter-related works as a single
cohesive series.

As you said, things are getting there, but I recommend prioritizing that above
the actual code, otherwise reviewers are going to continue ignoring the individual
series.

FWIW, if necessary, I would much prefer a single massive series over a bunch of
smaller series all pointing at each other, at least for the initial review.

