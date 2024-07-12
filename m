Return-Path: <linux-arm-msm+bounces-26068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BBA93025C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jul 2024 01:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B0A01F21677
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jul 2024 23:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6ED1304BD;
	Fri, 12 Jul 2024 23:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IPfM0js4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AB012FF84
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 23:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720826981; cv=none; b=ba5sRLBl8ZyahNzVKreWHbuLDiprxi+wmZS9HVeG+CAb6cUQgQwC9+KLBRkGSZRDlw7MSp6qC3MMnB258Yczgxe1oLSzuOv9Vxoh37rDu6wBcDGh5v4VDFBpV8seM7PAxPWo6FphPu+iuwyb53c1v9UY6dllNfSPdfKMpkVQ1RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720826981; c=relaxed/simple;
	bh=HKSa+I+v6n4xxFPIipr5CjiQVuzATXIb8SNaZMvPPFw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qXe0my0L1a+hwv2ZaIVZ+N82c98C4r+XgRQJtRT0ERYAzs+Q9k++Jz5VAI4AYEs+UIToa/yTWlf6AsxyvzgQm9ksIv8so8n+f2N0FzJ1bxfeD3hQIYJlXl4qD4ARZMMpB1JTKu+n9of+YnC7ZtAVmvxa5ZWlGXKrR9gfKWbqUBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IPfM0js4; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1fb1c206242so19581695ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Jul 2024 16:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720826979; x=1721431779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ZzMQzTcLNpWOotcGFmeiz3+1hsAd4h/kpmJZcUSiZY=;
        b=IPfM0js4s7fPTGbccQn11d5v9vxOECC6K+AtHve/uWYw25RlCGdCfsAK2ksc2uAD/c
         G/6RkUAYXNlJruSSgXGxJQs/bIPzhEkHqzuZtTxLGTv4v86dHOCdaLwCpB2vTIzaQyl2
         SauMlRXU0FLmVgFt/IEmzVmTEKVUs0hjTF8NBrBdsWDFLrWcRof1RCJYhZc9D0TVEYk+
         Xp+gv1CyR+8k7Eq8n4vWjoNp/T7K4HgWw1C7sOaTJTC+BMCKXNArS1bVTFUpKhJVbB+A
         bbVS07YuEPiaSW0Rk/eFpDDE9YYOvYYinxhbYZl4izNcgHacHt/mnuf9PcJLkMRgMhyb
         6ORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720826979; x=1721431779;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3ZzMQzTcLNpWOotcGFmeiz3+1hsAd4h/kpmJZcUSiZY=;
        b=ZFwSh/mpS9lZ69/wnD7xrRP3lHfT0TOHGi8xc8f0gK1sUN6YAhEoiYGR5p/BPjCJ0Q
         urnBpRo6EA79NxMdr4BKxQiAx5EqqK9adm3SZoplUgNCxshuf2lO7g1I21HiX3w2aROe
         JdFT86Mn+k/XHynSSpk5dTdIZILQCZJHvyUaGDp4fjLLKQ2TK1GJrYcesFR7V8o9ziva
         3NoDhOfly9XOxkn8zSafeGpUymQ9uBQcMVZ2wLoBsPdcaNOTOZfPiq+J/fOk610YMSIh
         3gUqEne7hDSXgpjU+qzFi0gSxV2WqcAWLdidDehFM1HIC6p8r0N7fjLU45VwCEsYvMSi
         pzRw==
X-Forwarded-Encrypted: i=1; AJvYcCWy4TUq3bSjkUxGT41QLSTtMHubCqw0Akoc0PeuPxD2IG1N7bdDKTT9/y0ZN9vs19+i5TCKrNU2ZeaD54TNxh/9v48VxridooLrKTxJCg==
X-Gm-Message-State: AOJu0YziYnXOg7wqS4DLMAIGV8keqQeFrpWQFbKqJPmgcWpfx5zTcyuA
	QyYfu7MORgIDNtxVAedSgff9FxNerlXlgyrTX8uwu3l4IRB71t1kfcL1ai1KOI351O4vIAAz+Lw
	O7xmlBf1rjfuktwfsFdFHxw==
X-Google-Smtp-Source: AGHT+IFQY3bFW+Ec1W/jbxkBChGtxIDhrDnXJSKahhJ1TSz9fMywWTZ933D5uxR+un98Rl9u18eV+KxVPn9D87FWqw==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a17:902:c405:b0:1f7:3763:5ff0 with
 SMTP id d9443c01a7336-1fbb6cd4279mr6343705ad.1.1720826979113; Fri, 12 Jul
 2024 16:29:39 -0700 (PDT)
Date: Fri, 12 Jul 2024 23:29:37 +0000
In-Reply-To: <20240618-exclusive-gup-v1-0-30472a19c5d1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240618-exclusive-gup-v1-0-30472a19c5d1@quicinc.com>
X-Mailer: git-send-email 2.45.2.993.g49e7a77208-goog
Message-ID: <20240712232937.2861788-1-ackerleytng@google.com>
Subject: Re: [PATCH RFC 0/5] mm/gup: Introduce exclusive GUP pinning
From: Ackerley Tng <ackerleytng@google.com>
To: quic_eberman@quicinc.com
Cc: akpm@linux-foundation.org, david@redhat.com, kvm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, maz@kernel.org, 
	pbonzini@redhat.com, shuah@kernel.org, tabba@google.com, willy@infradead.org, 
	vannapurve@google.com, hch@infradead.org, jgg@nvidia.com, rientjes@google.com, 
	seanjc@google.com, jhubbard@nvidia.com, qperret@google.com, 
	smostafa@google.com, fvdl@google.com, hughd@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Here=E2=80=99s an update from the Linux MM Alignment Session on July 10 202=
4, 9-10am
PDT:

The current direction is:

+ Allow mmap() of ranges that cover both shared and private memory, but dis=
allow
  faulting in of private pages
  + On access to private pages, userspace will get some error, perhaps SIGB=
US
  + On shared to private conversions, unmap the page and decrease refcounts

+ To support huge pages, guest_memfd will take ownership of the hugepages, =
and
  provide interested parties (userspace, KVM, iommu) with pages to be used.
  + guest_memfd will track usage of (sub)pages, for both private and shared
    memory
  + Pages will be broken into smaller (probably 4K) chunks at creation time=
 to
    simplify implementation (as opposed to splitting at runtime when privat=
e to
    shared conversion is requested by the guest)
    + Core MM infrastructure will still be used to track page table mapping=
s in
      mapcounts and other references (refcounts) per subpage
    + HugeTLB vmemmap Optimization (HVO) is lost when pages are broken up -=
 to
      be optimized later. Suggestions:
      + Use a tracking data structure other than struct page
      + Remove the memory for struct pages backing private memory from the
        vmemmap, and re-populate the vmemmap on conversion from private to
        shared
  + Implementation pointers for huge page support
    + Consensus was that getting core MM to do tracking seems wrong
    + Maintaining special page refcounts for guest_memfd pages is difficult=
 to
      get working and requires weird special casing in many places. This wa=
s
      tried for FS DAX pages and did not work out: [1]

+ Implementation suggestion: use infrastructure similar to what ZONE_DEVICE
  uses, to provide the huge page to interested parties
  + TBD: how to actually get huge pages into guest_memfd
  + TBD: how to provide/convert the huge pages to ZONE_DEVICE
    + Perhaps reserve them at boot time like in HugeTLB

+ Line of sight to compaction/migration:
  + Compaction here means making memory contiguous
  + Compaction/migration scope:
    + In scope for 4K pages
    + Out of scope for 1G pages and anything managed through ZONE_DEVICE
    + Out of scope for an initial implementation
  + Ideas for future implementations
    + Reuse the non-LRU page migration framework as used by memory ballonin=
g
    + Have userspace drive compaction/migration via ioctls
      + Having line of sight to optimizing lost HVO means avoiding being lo=
cked
        in to any implementation requiring struct pages
        + Without struct pages, it is hard to reuse core MM=E2=80=99s
          compaction/migration infrastructure

+ Discuss more details at LPC in Sep 2024, such as how to use huge pages,
  shared/private conversion, huge page splitting

This addresses the prerequisites set out by Fuad and Elliott at the beginni=
ng of
the session, which were:

1. Non-destructive shared/private conversion
  + Through having guest_memfd manage and track both shared/private memory
2. Huge page support with the option of converting individual subpages
  + Splitting of pages will be managed by guest_memfd
3. Line of sight to compaction/migration of private memory
  + Possibly driven by userspace using guest_memfd ioctls
4. Loading binaries into guest (private) memory before VM starts
  + This was identified as a special case of (1.) above
5. Non-protected guests in pKVM
  + Not discussed during session, but this is a goal of guest_memfd, for al=
l VM
    types [2]

David Hildenbrand summarized this during the meeting at t=3D47m25s [3].

[1]: https://lore.kernel.org/linux-mm/cover.66009f59a7fe77320d413011386c3ae=
5c2ee82eb.1719386613.git-series.apopple@nvidia.com/
[2]: https://lore.kernel.org/lkml/ZnRMn1ObU8TFrms3@google.com/
[3]: https://drive.google.com/file/d/17lruFrde2XWs6B1jaTrAy9gjv08FnJ45/view=
?t=3D47m25s&resourcekey=3D0-LiteoxLd5f4fKoPRMjMTOw

