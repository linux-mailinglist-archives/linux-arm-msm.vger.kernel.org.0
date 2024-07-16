Return-Path: <linux-arm-msm+bounces-26364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A06932F26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 19:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0ED91C213B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 17:35:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44D619FA89;
	Tue, 16 Jul 2024 17:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Eb/zTCU5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E8C19E832
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721151299; cv=none; b=gOCn31blMUf7K/x0qJWTt5DSdIMA6vAXnNg1oTKjQVwjyGX54LBDCGGUqiVeeolSBISB4q+NcvVZIS4AcZ3gTFKYmlgwTGbyivs6FFmG2/IZenqc6zLtaHh25+xpT2WuwZPu/CCm8ZhyMhILy2eJS9a7NoBDrXxTt+qPw+L+RJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721151299; c=relaxed/simple;
	bh=3M0QByp5nIuBwkxRifE56E0QWbZdgARiPYYVK/zs0M4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qHVCgpKI7tLjxEQ+SWG9vml2RxLFdJHm+eLhcaGiTDT3TshPqwXOsDURrGbM6cIgrEFd5v1j6aozSrpA/bfMv+uegaI/YNFXyNUkVsNnBmo052VVibjqzo6Ccs+BGcghu8nGTURAxn92FksCwTAfjOQ/4Yc4HD/V2CVFjkAOibs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Eb/zTCU5; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2c95c80c6f7so5094027a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 10:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721151297; x=1721756097; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzncl9L3e27llWjrAt0uSGnBBcBzotmsp09OvMIhHpc=;
        b=Eb/zTCU5kPhzS0/bk11Payd+5kyJ5P2aPcU0yqX7V8Y4LtmgT0sDl/yHktUTM0Mb7e
         z5CaMMry8WZjMr5ZtlxQ87ORckr2HKdH4DQNITPpw9aS71YoA9TgD07EukwUOenFSQpo
         7sE/rSzawBqGFpZSZo33IEuluLPX35cCdKe/yMWDsQypYBEBvgsBkxJB62ksxnOWSts9
         9mv2eGtomZymF8HSMD+UFj7wZifkS1l1Fc0HLYVkEQlqKTJsMosmVePzRZhL8EqitXyK
         tTYiarBJJM/8pKKq28QrQMz57hDBMA2kBG28/SP+ikuUyjJw6ZV/0skeTvjYY9C/Unpv
         u+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721151297; x=1721756097;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzncl9L3e27llWjrAt0uSGnBBcBzotmsp09OvMIhHpc=;
        b=hm8ypRzSfOqAtfSEWRZvTzoLV4Xmv5a+dKXxNZemoR5QeNef7/VdtQqjOPLGMMDqtp
         sJUQtLqo9PBLk6TLzb/tl+2yC1zbLRP8LAnC2sTLpj/55h2s6svZI+oMBs03ut9evyk4
         AtoC7MrGGp9hb5aRFKQT8t6K2FM3UaT5xet/axCk+EbCdPcM4U28O8AUbhS1Rrfe7F8i
         J30K+cM8uFSi9UxeHOSr34rGcKChSDemWIcdTzm5IW9q5wR1EnfGHQfACZ4onCm2NC2t
         FimlpvVY2ElmHHbXIL98nrz8zAvwaL6dBdzy/n/+gRWmrdfC9EdVmrGcJw4+FGP5c8eS
         THBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjNy5cOoKOmbJtwYbiA89IGItqdSS1yazPeWKjqq4fLOjTRpnPK96olEVDWySg5/8Oq7WA10vK7hVY3o/NRObOO5mRNB8EYH4jPUTeFQ==
X-Gm-Message-State: AOJu0Ywxp1xJkYRkJ4MI82W1r55OsIJsBq23OsJf1rRe7hhR4Ep7q0Ig
	tG1Jmal0HTZ0oynoJC3TzYQR8DUyBICh27VPjcS4wY623VyM/O/NmnctEYCqFBsyIXDraFx7PDw
	Skw==
X-Google-Smtp-Source: AGHT+IG32VHtdxdaUsDDPJunrvckiTWNO91gPhz+tHm9yc4gkYSQ85JHqlVjFo5Nvdj8OgpwD3v6pjKH7w4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90a:b96:b0:2c9:ba2b:42ac with SMTP id
 98e67ed59e1d1-2cb36d483c4mr6722a91.4.1721151297229; Tue, 16 Jul 2024 10:34:57
 -0700 (PDT)
Date: Tue, 16 Jul 2024 10:34:55 -0700
In-Reply-To: <20240716160842.GD1482543@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240618-exclusive-gup-v1-0-30472a19c5d1@quicinc.com>
 <20240712232937.2861788-1-ackerleytng@google.com> <ZpaZtPKrXolEduZH@google.com>
 <20240716160842.GD1482543@nvidia.com>
Message-ID: <ZpavP3K_xAMiu4kE@google.com>
Subject: Re: [PATCH RFC 0/5] mm/gup: Introduce exclusive GUP pinning
From: Sean Christopherson <seanjc@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Ackerley Tng <ackerleytng@google.com>, quic_eberman@quicinc.com, 
	akpm@linux-foundation.org, david@redhat.com, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, maz@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, tabba@google.com, willy@infradead.org, 
	vannapurve@google.com, hch@infradead.org, rientjes@google.com, 
	jhubbard@nvidia.com, qperret@google.com, smostafa@google.com, fvdl@google.com, 
	hughd@google.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Jul 16, 2024, Jason Gunthorpe wrote:
> On Tue, Jul 16, 2024 at 09:03:00AM -0700, Sean Christopherson wrote:
> 
> > > + To support huge pages, guest_memfd will take ownership of the hugepages, and
> > >   provide interested parties (userspace, KVM, iommu) with pages to be used.
> > >   + guest_memfd will track usage of (sub)pages, for both private and shared
> > >     memory
> > >   + Pages will be broken into smaller (probably 4K) chunks at creation time to
> > >     simplify implementation (as opposed to splitting at runtime when private to
> > >     shared conversion is requested by the guest)
> > 
> > FWIW, I doubt we'll ever release a version with mmap()+guest_memfd support that
> > shatters pages at creation.  I can see it being an intermediate step, e.g. to
> > prove correctness and provide a bisection point, but shattering hugepages at
> > creation would effectively make hugepage support useless.
> 
> Why? If the private memory retains its contiguity seperately but the
> struct pages are removed from the vmemmap, what is the downside?

Oooh, you're talking about shattering only the host userspace mappings.  Now I
understand why there was a bit of a disconnect, I was thinking you (hand-wavy
everyone) were saying that KVM would immediately shatter its own mappings too.

> As I understand it the point is to give a large contiguous range to
> the private world and use only 4k pages to give the hypervisor world
> access to limited amounts of the memory.
> 
> Is there a reason that not having the shared memory elevated to higher
> contiguity a deal breaker?

Nope.  I'm sure someone will ask for it sooner than later, but definitely not a
must have.

