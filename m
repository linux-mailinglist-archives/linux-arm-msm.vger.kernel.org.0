Return-Path: <linux-arm-msm+bounces-57266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DABE0AAFC9A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 16:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DA0C504015
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 14:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D5101D6DDD;
	Thu,  8 May 2025 14:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zp704B47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D612A253947
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 14:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713524; cv=none; b=Wg3SO0tYewayTyAl0a5q1vbw/bLRHxdJnm5+u1S166G03IkZWHxlLpbS0WDQu4VDctaIPFtQlO5hYvo0AdNKKMv1U4cLe+pFoBF9XkoKTRpfdRNfDra/lemzgPhELb0UQdWUANz11ZkStlPTnsjHaLlzR8I9pvDLujsVgEV8WsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713524; c=relaxed/simple;
	bh=PlbaLP2T9N4iQF/W7BMyZJgCbkcEVYT7EYg35D1Lv00=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aNAm2XIXfHmaQS/YE+OuyvB953jPc1FmVnw7vj9w8odJrQhieeyUPEXNDQ06hBMH6dcX8VVSK0LNZy83auVIfktL48qmMbe+pAAY9iwGqB2UD4gRvSJ5CO4tSg6KgH+zGAa6dsl+8xow/Sl9jFFjgobuHovcIa3iE37ZOpRq0cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zp704B47; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7420109e56dso215925b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 07:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746713522; x=1747318322; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgaNCnZNuwkRUDo4J1p26KpwcTten0pYWFPzOF6z51E=;
        b=Zp704B47Tdg6LCvX8GuROfeGbkfCwmYs92U0VrxZJ+qXlMQhug0WomOwh/sLYV1zPm
         5yttTap2KSavMFrMwfk8KA5of6XgaV66AahEKyBpzqkbBRmBF3vGRCY0Ud6uUYBq18Pk
         J79vlfeYMW6ySckd/2IxR0mXykV54vEQBdvO8Y+w3luMW1K+zlO57gWrJ9gqf7p/w12B
         cU+IhhIV5/emr9QGfQG1APwf3mAAbhH39uz5fPRPD/i5qTLGsmeDLzJy4lgBU+F5Y1YJ
         5AgMdBcOoOdrHmSXEVuvkOpGs76M3gQ1sCqk0/Eq52QZCoT9Zu5hJUBSggoyKPMrYzNN
         PViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713522; x=1747318322;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZgaNCnZNuwkRUDo4J1p26KpwcTten0pYWFPzOF6z51E=;
        b=ocmEgHiOvWZMF+sIBQu9hyP7rHLiyfgnou94xxfofoWJODGqczNRWzUlnayHWKQcJP
         Nh64aPxxiWqyP1mm7+d5B0eecx7Byjdrnb+xURw0fyvcP3QMH6ceD6yJjwZtoFnyUyAe
         tuCCu30YIvtcYAyXl5Zc9izpDHWixejflY9C9Sfr3Kl+C482CKcW4/JN1CJD/nqgjnao
         NZXuktVlTPRHStL643pNFd8hTeeB/Suz5fLtY16ltC3F77XGTp3KtF+y3is9NBkLGnDG
         W3kd/2+znyhN1VDSdfrFj8Y6GanIFn1RcVkvi6ZX6Dq+QViMW5WVBE8mQbqdZBnXmS6e
         Agmw==
X-Forwarded-Encrypted: i=1; AJvYcCUMIo6xBvZjSCPTX9O5+q1MoPwo9kQ44SEiMHusnnJombJEhQo4pZPwQ1Emmb+OyC6Oh+m83JbeAGEVDsss@vger.kernel.org
X-Gm-Message-State: AOJu0YypdkBZcpkXkblce+/GyfV6ripAeAFG0LINqsvkEL4y/QG1+Kxx
	XURKRDpIwXz7InBRK3liePm/6WQAzBs1YLlQxYq4REnq4VDHpU78WAd41DJcMRE6GPgJPQXti2h
	kxQ==
X-Google-Smtp-Source: AGHT+IF71T/JgBcv+9pVVDvfD6Bh8QHnMVGHojYXE6GwevcOxLdiFS6jTOGkbQxj2jdTv+V8f5wxpjKby+s=
X-Received: from pffk15.prod.google.com ([2002:aa7:88cf:0:b0:730:90b2:dab])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9085:b0:73e:2dca:f91b
 with SMTP id d2e1a72fcca58-740a9a6a78cmr5220026b3a.18.1746713521980; Thu, 08
 May 2025 07:12:01 -0700 (PDT)
Date: Thu, 8 May 2025 07:12:00 -0700
In-Reply-To: <diqzh61xqxfh.fsf@ackerleytng-ctop.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <386c1169-8292-43d1-846b-c50cbdc1bc65@redhat.com>
 <aBTxJvew1GvSczKY@google.com> <diqzjz6ypt9y.fsf@ackerleytng-ctop.c.googlers.com>
 <7e32aabe-c170-4cfc-99aa-f257d2a69364@redhat.com> <aBlCSGB86cp3B3zn@google.com>
 <CAGtprH8DW-hqxbFdyo+Mg7MddsOAnN+rpLZUOHT-msD+OwCv=Q@mail.gmail.com>
 <CAGtprH9AVUiFsSELhmt4p24fssN2x7sXnUqn39r31GbA0h39Sw@mail.gmail.com>
 <aBoVbJZEcQ2OeXhG@google.com> <39ea3946-6683-462e-af5d-fe7d28ab7d00@redhat.com>
 <diqzh61xqxfh.fsf@ackerleytng-ctop.c.googlers.com>
Message-ID: <aBy7sE9ymKof7LeL@google.com>
Subject: Re: [PATCH v8 06/13] KVM: x86: Generalize private fault lookups to
 guest_memfd fault lookups
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: David Hildenbrand <david@redhat.com>, Vishal Annapurve <vannapurve@google.com>, 
	Fuad Tabba <tabba@google.com>, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
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

On Tue, May 06, 2025, Ackerley Tng wrote:
> Sean, David, I'm circling back to make sure I'm following the discussion
> correctly before Fuad sends out the next revision of this series.

Honestly, just send the next version.  Try to review a description of code is an
exercise in frustration.  More versions of a series isn't inherently bad.

