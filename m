Return-Path: <linux-arm-msm+bounces-23530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E02911CE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 09:33:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 856B81C23575
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 07:33:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B6216B750;
	Fri, 21 Jun 2024 07:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xc4JgbPl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3105B16B722
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 07:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718955167; cv=none; b=LXXhWJiRW9V0NZfTHX5EXc9TzYmWQMkHq/cIgk4TclNRPp+zxo7feDdzjclNEUu8YIlXC846ChmD68GhIu/Ghu3iGnd7aZOsoLVYXz4nL2zXq6BMDHP3C7HSIiZ/MqIjtnoT2zcS3IpW01IuEIB+b4QoyDLv+pBY2XUxilu6IDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718955167; c=relaxed/simple;
	bh=mAkyVAfjwU9JX2bFu681SWPgxd7Q8ZRlIEpIvbijX04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pskw5DJ+ZaMbSnHbjiztbycIiJ2c0c1ZLPJ2Jmgpe9/73WGR8LwLuaDdXqaSwjXb/0qjjbeZHAQU9sCXUIBbcDvKFfi3SPGbVoRtDHhRrKANzdntY83vACm5/+3FWSjfFvDqAqNkVzeR0KHzMkgIkans7rlzoMuWZqRLlIh5nFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xc4JgbPl; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57cf8880f95so1922002a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 00:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718955164; x=1719559964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e1fAFm+e+fwl4p3avvK+TEsJDfR37gnsqnlBJ9746Co=;
        b=Xc4JgbPl3y5oGzKX12XBWBud6X8fJommiMj9JlNe6V7f7reZOtXM4zzQaV6k4hP94k
         RoJ7iptEF7kDd7yloBtHNpu9PfzFQeB9QUXquUg+oi29Sj+MjT0H9ILMjTMEK8jmBRzQ
         QQes7Qfl1sDrqJqvZtRHVlM8iPrurpanmdb5eIp5/KBtNDo4HkTRAYsKU1EUq+tpvjj9
         C7TtVhnjzMPVbtalvhKjDI+mZJYel+9CqqCMrRMltlAsbEn8+lwDdkQN623UrIT1PZPg
         of9wFVF70XA+5pSt9pxpnrXaCn/u88mIj8Cg9Qv21gGal4xm39hpc7Rjto/pNv7KvAqA
         A73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718955164; x=1719559964;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1fAFm+e+fwl4p3avvK+TEsJDfR37gnsqnlBJ9746Co=;
        b=a7w/Hl6TznbNgMy6Oppjf4wDGEPOHLzSMpoCxni46I5ZMu6NC0vuSWeUvRsAt+h8Yc
         36eNoPuCYiXNh+jkD6aghHZBzOdiE8T287TVlcZJRQG7X4iVxkmtKA+oUt5MF90pL4Xe
         PenW88ntHYUpQVX81t96b4TIly5ElkkEQJs7nzsEGzq/6tjBoFDUdLyaLezp02QQyzIu
         da9sm2yhKcxtj4i0PttxCYZwS8kh0GW4MXa+UT8bJgB5OZvrLYqzrQyG/HYMbYUuetbs
         JWdhNTt8evBfNNSO0rAyrmTyWRc8pidnzLeuUWTkn+UQS1tu12JLpEIJtVEOzr44yrP/
         5vGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmFKrz9UCYejiTl+emaTLR+VCAr7yqH2Hbf4b5ZqsZuCLUv92W1mSCcMzibhEe7JxqthDv7dO3wJqSfyOpTxkB34Z2WFfUXwO26k3NNw==
X-Gm-Message-State: AOJu0Yx5pVd4Q+3BBoAYAUUncR2wqnbwRuq4lIVp+oux0iL7S2y3FFwT
	amgpeu0VOKJ7RkjEGczofcpTw1BNAc412mmYz4A8NNI5sHMBYL+WqiJaq3g3gw==
X-Google-Smtp-Source: AGHT+IGQUGmgU0uXOViTqXbPvvn37qtzDP+kkZ4bvmoG0/DYSamWSm6G++bLxYcqakW19CJtXkx5Qw==
X-Received: by 2002:aa7:d153:0:b0:57d:7ef:573b with SMTP id 4fb4d7f45d1cf-57d07ef576amr5115522a12.38.1718955164162;
        Fri, 21 Jun 2024 00:32:44 -0700 (PDT)
Received: from google.com (118.240.90.34.bc.googleusercontent.com. [34.90.240.118])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303d7b10sm550126a12.15.2024.06.21.00.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 00:32:43 -0700 (PDT)
Date: Fri, 21 Jun 2024 07:32:40 +0000
From: Quentin Perret <qperret@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Elliot Berman <quic_eberman@quicinc.com>,
	David Hildenbrand <david@redhat.com>, Fuad Tabba <tabba@google.com>,
	Christoph Hellwig <hch@infradead.org>,
	John Hubbard <jhubbard@nvidia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Matthew Wilcox <willy@infradead.org>,
	maz@kernel.org, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, pbonzini@redhat.com
Subject: Re: [PATCH RFC 0/5] mm/gup: Introduce exclusive GUP pinning
Message-ID: <ZnUsmFFslBWZxGIq@google.com>
References: <14bd145a-039f-4fb9-8598-384d6a051737@redhat.com>
 <CA+EHjTxWWEHfjZ9LJqZy+VCk43qd3SMKiPF7uvAwmDdPeVhrvQ@mail.gmail.com>
 <20240619115135.GE2494510@nvidia.com>
 <ZnOsAEV3GycCcqSX@infradead.org>
 <CA+EHjTxaCxibvGOMPk9Oj5TfQV3J3ZLwXk83oVHuwf8H0Q47sA@mail.gmail.com>
 <20240620135540.GG2494510@nvidia.com>
 <6d7b180a-9f80-43a4-a4cc-fd79a45d7571@redhat.com>
 <20240620142956.GI2494510@nvidia.com>
 <20240620140516768-0700.eberman@hu-eberman-lv.qualcomm.com>
 <20240620231814.GO2494510@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620231814.GO2494510@nvidia.com>

On Thursday 20 Jun 2024 at 20:18:14 (-0300), Jason Gunthorpe wrote:
> On Thu, Jun 20, 2024 at 03:47:23PM -0700, Elliot Berman wrote:
> > On Thu, Jun 20, 2024 at 11:29:56AM -0300, Jason Gunthorpe wrote:
> > > On Thu, Jun 20, 2024 at 04:01:08PM +0200, David Hildenbrand wrote:
> > > > Regarding huge pages: assume the huge page (e.g., 1 GiB hugetlb) is shared,
> > > > now the VM requests to make one subpage private. 
> > > 
> > > I think the general CC model has the shared/private setup earlier on
> > > the VM lifecycle with large runs of contiguous pages. It would only
> > > become a problem if you intend to to high rate fine granual
> > > shared/private switching. Which is why I am asking what the actual
> > > "why" is here.
> > > 
> > 
> > I'd let Fuad comment if he's aware of any specific/concrete Anrdoid
> > usecases about converting between shared and private. One usecase I can
> > think about is host providing large multimedia blobs (e.g. video) to the
> > guest. Rather than using swiotlb, the CC guest can share pages back with
> > the host so host can copy the blob in, possibly using H/W accel. I
> > mention this example because we may not need to support shared/private
> > conversions at granularity finer than huge pages. 
> 
> I suspect the more useful thing would be to be able to allocate actual
> shared memory and use that to shuffle data without a copy, setup much
> less frequently. Ie you could allocate a large shared buffer for video
> sharing and stream the video frames through that memory without copy.
> 
> This is slightly different from converting arbitary memory in-place
> into shared memory. The VM may be able to do a better job at
> clustering the shared memory allocation requests, ie locate them all
> within a 1GB region to further optimize the host side.
> 
> > Jason, do you have scenario in mind? I couldn't tell if we now had a
> > usecase or are brainstorming a solution to have a solution.
> 
> No, I'm interested in what pKVM is doing that needs this to be so much
> different than the CC case..

The underlying technology for implementing CC is obviously very
different (MMU-based for pKVM, encryption-based for the others + some
extra bits but let's keep it simple). In-place conversion is inherently
painful with encryption-based schemes, so it's not a surprise the
approach taken in these cases is built around destructive conversions as
a core construct. But as Elliot highlighted, the MMU-based approach
allows for pretty flexible and efficient zero-copy, which we're not
ready to sacrifice purely to shoehorn pKVM into a model that was
designed for a technology that has very different set of constraints.
A private->shared conversion in the pKVM case is nothing more than
setting a PTE in the recipient's stage-2 page-table.

I'm not at all against starting with something simple and bouncing via
swiotlb, that is totally fine. What is _not_ fine however would be to
bake into the userspace API that conversions are not in-place and
destructive (which in my mind equates to 'you can't mmap guest_memfd
pages'). But I think that isn't really a point of disagreement these
days, so hopefully we're aligned.

And to clarify some things I've also read in the thread, pKVM can
handle the vast majority of faults caused by accesses to protected
memory just fine. Userspace accesses protected guest memory? Fine,
we'll SEGV the userspace process. The kernel accesses via uaccess
macros? Also fine, we'll fail the syscall (or whatever it is we're
doing) cleanly -- the whole extable machinery works OK, which also
means that things like load_unaligned_zeropad() keep working as-is.
The only thing pKVM does is re-inject the fault back into the kernel
with some extra syndrome information it can figure out what to do by
itself.

It's really only accesses via e.g. the linear map that are problematic,
hence the exclusive GUP approach proposed in the series that tries to
avoid that by construction. That has the benefit of leaving
guest_memfd to other CC solutions that have more things in common. I
think it's good for that discussion to happen, no matter what we end up
doing in the end.

I hope that helps!

Thanks,
Quentin

