Return-Path: <linux-arm-msm+bounces-46917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FD6A28360
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 05:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFA9E18852FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 04:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14CE221518A;
	Wed,  5 Feb 2025 04:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qxRdh40v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCCC20AF77
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Feb 2025 04:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738729920; cv=none; b=q5slQLg/LQdHrHxA+DWJOE/N3Sp7qkSnsjYfLGuFCpNp6RG4RXt67CQmftyMqZnWeMVHBTc+3IIAwOLUsAT2oQx6R50QLLl67u5vRLO/qQoZtnFS9K3QY5tSlEnHsTsB4Xt6uiD9+QPcn9qWdkcCGn2d+kzRvOPNF2s3we5APQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738729920; c=relaxed/simple;
	bh=JE8go6R1VpRIPO7yBC5BBAyXsPGOwpgj7jmfJ1zIgCw=;
	h=Date:In-Reply-To:Mime-Version:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=brchtbKIZyxjW1YIRac/DueYlfceyI/bqWmWl05FWbd9UsugZtkZCAxjzr6hVcLK/ofByiPPKI06gw0mK+1YCeRgpKb5vlsy6sLYWzwgVfJWmSRS72vYn7vu2eR14ndK+Kf4yHEV1RrqVsUl6sn8tBBkIr2CA62Ci8Ap0XXr//Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qxRdh40v; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21f078fc592so34545885ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Feb 2025 20:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738729918; x=1739334718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtAIjBOFFeafVFBhyEOiFEMQllzc64d/EBT8ds1/JA8=;
        b=qxRdh40v88qBqKw22bUdLanCqfUTWZU6cL/kTQ9Mm10XmvkZ/gv2DReOt+VnDzU6Np
         Ndfj+lbiRq6xsWPsO8fynkNMYYjfzGBCB3q4Qb4dsJWGp5PsPluNBEpPLv9X9l1rOP29
         hUE75+0H38Z9OPkolxe3rwSwOzVFZBfxa9Cr1SN7gFEhZA+lgGDle+W+InMIMh5GwNSe
         TZV54mrvOjQU62Oqs1pd3Y5AchMuZqOrg9NBSplK6a/WG8IxQhbwzTPtbO0nDqBUY2V9
         +8hdmhw4phOb2GTlvxiwC7QZkzKtAo+TB3Bw6/g+px/wPRbgLnt7k4abXU4l1d6+IwTY
         KDww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738729918; x=1739334718;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZtAIjBOFFeafVFBhyEOiFEMQllzc64d/EBT8ds1/JA8=;
        b=YFF1r/M+YHCfGEWZNW7kHVppnu/rJFui//ULC61tPZEtD6RcJmS5sVmtUkOXHl+lqm
         x3ZFrTRH9kBvmpTWXnCiquTcbcURO5YdtwfZP5rFjyuArDO75ZKaO9E1rk8xw5OK4MzG
         6nh4iVpTIAyyUsLfOARujnBtNFwVEDuvkEGCh76Wvo6HGGQC+m9e6OBXLwX0713wx32F
         l7wodJIiCgiklCbwebXUWsFayGmeF+AluugDjTmcHemVNbr3qVNujjXcQscuy0KD4UdI
         F6hZccC76SORq+FQ8etqcQGF0UO+lDw2i2F638TeG2aiROfBv4isIpr3Qz5f85rHHjA7
         mYgw==
X-Forwarded-Encrypted: i=1; AJvYcCUn9FwveDVL9dtBYn/NyVqpvKXsv7mmqwZLDeN8VB4it1soZaOFzohkHjTbsleQcM3HIIbv+GHydtLcxLBG@vger.kernel.org
X-Gm-Message-State: AOJu0YyLegTWN/Z2+Xj+VyWFKFfEkyeojWcw0MYkj2LWyGxsUctJTav4
	bQJp9q6+uWjnInTGmxk/xqoRfSmT1RRpeRpGSLwZxveZHkFGeB1L8rBxSED0ru1+p/LzEO83PeR
	cjvYzZaf2yLbf2xbPbcLaUw==
X-Google-Smtp-Source: AGHT+IEUGAEXsyrkT7DjTRUy8A7fBT8adorRd83c8M0VQOASQHQWG4hYdiwBaNDxKPtPTZ7XijwVU7oj/MkuobrlOg==
X-Received: from pfde7.prod.google.com ([2002:aa7:8c47:0:b0:725:f376:f548])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:100c:b0:1e0:d1c3:97d1 with SMTP id adf61e73a8af0-1ede88b3b5fmr2567882637.29.1738729917642;
 Tue, 04 Feb 2025 20:31:57 -0800 (PST)
Date: Wed, 05 Feb 2025 04:31:53 +0000
In-Reply-To: <CAGtprH-Ryn6Xqs-3_VBMkk3ew74Rf9=D8S_iHVmq2DE-YFk2-w@mail.gmail.com>
 (message from Vishal Annapurve on Tue, 4 Feb 2025 17:28:08 -0800)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Message-ID: <diqzldulovuu.fsf@ackerleytng-ctop-specialist.c.googlers.com>
Subject: Re: [RFC PATCH v5 06/15] KVM: guest_memfd: Handle final folio_put()
 of guestmem pages
From: Ackerley Tng <ackerleytng@google.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: tabba@google.com, kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mm@kvack.org, pbonzini@redhat.com, chenhuacai@kernel.org, 
	mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, seanjc@google.com, 
	viro@zeniv.linux.org.uk, brauner@kernel.org, willy@infradead.org, 
	akpm@linux-foundation.org, xiaoyao.li@intel.com, yilun.xu@intel.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, amoorthy@google.com, 
	dmatlack@google.com, yu.c.zhang@linux.intel.com, isaku.yamahata@intel.com, 
	mic@digikod.net, vbabka@suse.cz, mail@maciej.szmigiero.name, david@redhat.com, 
	michael.roth@amd.com, wei.w.wang@intel.com, liam.merwick@oracle.com, 
	isaku.yamahata@gmail.com, kirill.shutemov@linux.intel.com, 
	suzuki.poulose@arm.com, steven.price@arm.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_tsoni@quicinc.com, quic_svaddagi@quicinc.com, 
	quic_cvanscha@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	catalin.marinas@arm.com, james.morse@arm.com, yuzenghui@huawei.com, 
	oliver.upton@linux.dev, maz@kernel.org, will@kernel.org, qperret@google.com, 
	keirf@google.com, roypat@amazon.co.uk, shuah@kernel.org, hch@infradead.org, 
	jgg@nvidia.com, rientjes@google.com, jhubbard@nvidia.com, fvdl@google.com, 
	hughd@google.com, jthoughton@google.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Vishal Annapurve <vannapurve@google.com> writes:

> On Thu, Jan 23, 2025 at 1:51=E2=80=AFAM Fuad Tabba <tabba@google.com> wro=
te:
>>
>> On Wed, 22 Jan 2025 at 22:16, Ackerley Tng <ackerleytng@google.com> wrot=
e:
>> >
>> > Fuad Tabba <tabba@google.com> writes:
>> >
>> > Hey Fuad, I'm still working on verifying all this but for now this is
>> > one issue. I think this can be fixed by checking if the folio->mapping
>> > is NULL. If it's NULL, then the folio has been disassociated from the
>> > inode, and during the dissociation (removal from filemap), the
>> > mappability can also either
>> >
>> > 1. Be unset so that the default mappability can be set up based on
>> >    GUEST_MEMFD_FLAG_INIT_MAPPABLE, or
>> > 2. Be directly restored based on GUEST_MEMFD_FLAG_INIT_MAPPABLE
>>
>> Thanks for pointing this out. I hadn't considered this case. I'll fix
>> in the respin.
>>
>
> Can the below scenario cause trouble?
> 1) Userspace converts a certain range of guest memfd as shared and
> grabs some refcounts on shared memory pages through existing kernel
> exposed mechanisms.
> 2) Userspace converts the same range to private which would cause the
> corresponding mappability attributes to be *MAPPABILITY_NONE.
> 3) Userspace truncates the range which will remove the page from pagecach=
e.
> 4) Userspace does the fallocate again, leading to a new page getting
> allocated without freeing the older page which is still refcounted
> (step 1).
>
> Effectively this could allow userspace to keep allocating multiple
> pages for the same guest_memfd range.

I'm still verifying this but for now here's the flow Vishal described in
greater detail:

+ guest_memfd starts without GUEST_MEMFD_FLAG_INIT_MAPPABLE
    + All new pages will start with mappability =3D GUEST
+ guest uses a page
    + Get new page
    + Add page to filemap
+ guest converts page to shared
    + Mappability is now ALL
+ host uses page
+ host takes transient refcounts on page
    + Refcount on the page is now (a) filemap's refcount (b) vma's refcount
      (c) transient refcount
+ guest converts page to private
    + Page is unmapped
        + Refcount on the page is now (a) filemap's refcount (b) transient
          refcount
    + Since refcount is elevated, the mappabilities are left as NONE
    + Filemap's refcounts are removed from the page
        + Refcount on the page is now (a) transient refcount
+ host punches hole to deallocate page
    + Since mappability was NONE, restore filemap's refcount
        + Refcount on the page is now (a) transient refcount (b) filemap's
          refcount
    + Mappabilities are reset to GUEST for truncated range
    + Folio is removed from filemap
        + Refcount on the page is now (a) transient refcount
    + Callback remains registered so that when the transient refcounts are
      dropped, cleanup can happen - this is where merging will happen
      with 1G page support
+ host fallocate()s in the same address range
    + will get a new page

Though the host does manage to get a new page while the old one stays
around, I think this is working as intended, since the transient
refcounts are truly holding the old folio around. When the transient
refcounts go away, the old folio will still get cleaned up (with 1G page
support: merged and returned) to as expected. The new page will also be
freed at some point later.

If the userspace program decides to keep taking transient refcounts to hold
pages around, then the userspace program is truly leaking memory and it
shouldn't be guest_memfd's bug.

