Return-Path: <linux-arm-msm+bounces-52780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 294CFA74DC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 16:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 081E9188CB57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Mar 2025 15:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DFC11474B8;
	Fri, 28 Mar 2025 15:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k+3SuEOj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEB93594A
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 15:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743175898; cv=none; b=bsLec6Gb08xtj4h0Upf64u6k92MudryksQAk3YVBaEaszaUmz/nAjYI1OHvGZ1JlG0dQAV4SzZDLCPDYD9MPrhx1WlLpW70Lvn8VZljgVtMw8eGOXcRjXx2g9pxwUy0aVis1fyJ6ke21EaW2SWjt3H0j1JyrryYP0VryuRTBDLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743175898; c=relaxed/simple;
	bh=/lopUriMFmqdGHgTVjn/5HugLQVHqP3ccfVTWpfXd9k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=BJNw3VV4PAenW9PPaZuqrLTK2dXQQgTP0BUZAPzuujn7dLKXtRI2PFe6ZLHYjeeLEj1qXbDtcSa/50U/MeGnnLqoUDPygKqDYSPsECINqRNmrOyXTSawrvYCxK35OB3TS1LRMlrBDO55Xz6iWkfalJaCT4uhW6nln32pWh8SDyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k+3SuEOj; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tabba.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so18607325e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Mar 2025 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743175895; x=1743780695; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WH/C05nvDNqMnE3kS0mS/gTslSRnvh3DBqNQsX8ayiE=;
        b=k+3SuEOjWY/RlTFtjP0Gc1Ptzb1a17bxvQPpvbXrLKoFrLxnwIhFdafa4TvrbSxpZ1
         OSx3sbRKvBUCOVui+mqLiPja5p/JuRkQ2TkN9FCrA+MAHlW1cjP4Mg0hFN3zfC0CK7iS
         vgGbAQxx764GYzhm2FAqTBfGOVPtaMlVc2qWnkAotc/fHnYocdVLAtOPT/KZgwbgU3iI
         Wuk76KqSad1h4E7YnyRI5Ij69DTDgSDr1LeDq40nhaqXMQquxoThg8TWnyzZMzByzJBY
         kuEr5PEQwgydj/ukTOtQxgc4Gb/Im4eOntsGBk1OTlppBwa05ArFo/vax9cSPj89RoT2
         y5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743175895; x=1743780695;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WH/C05nvDNqMnE3kS0mS/gTslSRnvh3DBqNQsX8ayiE=;
        b=qVRN2Ca+wasI98aAZGuItxbYoGwDOASqQ4a2TpMclJ3DFJ560shEDGsMPE5I6mk/SM
         nkpwzcSHYqIZqUI0xybJLIXJnDNHwtWP0WTLq7BMdd1DNMGVjgKEJ1hT/C+Si2hDpz8g
         Zo3cnJzolCg33VAJ79wk2UOvHev9CXllVvlvYl8y9td8lgjvNSWxeAW1eiAcTpDaogIi
         naiExU6YCB9gYZy95vceDqQ5sk/5OASbpq13VOL8gyTC3GxV3YmbmPV1qfuJ7z6OXJrM
         9pX0LM5xJGfvIoz0QUn4v2IUU06u/x0JZuJAcqCGoP87jjVcGgAS8UAbHTjSq8e0VkLM
         Vb6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwP/JkBzzNOkYBAZ6qLJDb2oz5X00Qe5q/kfj1EAVWvNsiIpZ3f4PqRtDRwcqMNKbFMWQtmoNYi1IIlLgh@vger.kernel.org
X-Gm-Message-State: AOJu0Yyybd85ZAomOD8JQaJbRZ/J46WHh2OEjIsxg+1blUGLPYC1j10Q
	CTvsKAnEUFjApZHCl6kG1+4KgZPSHbE6xE91fT8LzguozeyXWSCRhXJ3jPufFwVkGz4TPbhqvw=
	=
X-Google-Smtp-Source: AGHT+IEklU/ZV+hKzr9cbGA3y+PEsrGla1v/uPYOXg27lpCKZhOozAIPswwosIyxAl/R6E8+WUPR1Ll4gg==
X-Received: from wrwl7.prod.google.com ([2002:a5d:6747:0:b0:391:4172:373f])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:598d:0:b0:394:ef93:9afc
 with SMTP id ffacd0b85a97d-39ad1741b23mr7586212f8f.18.1743175895094; Fri, 28
 Mar 2025 08:31:35 -0700 (PDT)
Date: Fri, 28 Mar 2025 15:31:26 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250328153133.3504118-1-tabba@google.com>
Subject: [PATCH v7 0/7] KVM: Restricted mapping of guest_memfd at the host and
 arm64 support
From: Fuad Tabba <tabba@google.com>
To: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org
Cc: pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
	anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, seanjc@google.com, viro@zeniv.linux.org.uk, 
	brauner@kernel.org, willy@infradead.org, akpm@linux-foundation.org, 
	xiaoyao.li@intel.com, yilun.xu@intel.com, chao.p.peng@linux.intel.com, 
	jarkko@kernel.org, amoorthy@google.com, dmatlack@google.com, 
	isaku.yamahata@intel.com, mic@digikod.net, vbabka@suse.cz, 
	vannapurve@google.com, ackerleytng@google.com, mail@maciej.szmigiero.name, 
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
	jthoughton@google.com, peterx@redhat.com, pankaj.gupta@amd.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"

This series adds restricted mmap() support to guest_memfd, as well as
support for guest_memfd on arm64. Please see v3 for the context [1].

Main change since v6 [2]:
Protected the shared_offsets array with a rwlock instead of hopping on
the invalidate_lock. The main reason for this is that the final put
callback (kvm_gmem_handle_folio_put()) could be called from an atomic
context, and the invalidate_lock is an rw_semaphore (Vishal).

The other reason is, in hindsight, it didn't make sense to use the
invalidate_lock since they're not quite protecting the same thing.

I did consider using the folio lock to implicitly protect the array, and
even have another series that does that. The result was more
complicated, and not obviously race free. One of the difficulties with
relying on the folio lock is that there are cases (e.g., on
initilization and teardown) when we want to toggle the state of an
offset that doesn't have a folio in the cache. We could special case
these, but the result was more complicated (and to me not obviously
better) than adding a separate lock for the shared_offsets array.

Based on the `KVM: Mapping guest_memfd backed memory at the host for
software protected VMs` series [3], which in turn is based on Linux
6.14-rc7.

The state diagram that uses the new states in this patch series,
and how they would interact with sharing/unsharing in pKVM [4].

Cheers,
/fuad

[1] https://lore.kernel.org/all/20241010085930.1546800-1-tabba@google.com/
[2] https://lore.kernel.org/all/20250318162046.4016367-1-tabba@google.com/
[3] https://lore.kernel.org/all/20250318161823.4005529-1-tabba@google.com/
[4] https://lpc.events/event/18/contributions/1758/attachments/1457/3699/Guestmemfd%20folio%20state%20page_type.pdf

Ackerley Tng (2):
  KVM: guest_memfd: Make guest mem use guest mem inodes instead of
    anonymous inodes
  KVM: guest_memfd: Track folio sharing within a struct kvm_gmem_private

Fuad Tabba (5):
  KVM: guest_memfd: Introduce kvm_gmem_get_pfn_locked(), which retains
    the folio lock
  KVM: guest_memfd: Folio sharing states and functions that manage their
    transition
  KVM: guest_memfd: Restore folio state after final folio_put()
  KVM: guest_memfd: Handle invalidation of shared memory
  KVM: guest_memfd: Add a guest_memfd() flag to initialize it as shared

 Documentation/virt/kvm/api.rst                |   4 +
 include/linux/kvm_host.h                      |  56 +-
 include/uapi/linux/kvm.h                      |   1 +
 include/uapi/linux/magic.h                    |   1 +
 .../testing/selftests/kvm/guest_memfd_test.c  |   7 +-
 virt/kvm/guest_memfd.c                        | 613 +++++++++++++++++-
 virt/kvm/kvm_main.c                           |  62 ++
 7 files changed, 706 insertions(+), 38 deletions(-)


base-commit: 62aff24816ac463bf3f754a15b2e7cdff59976ea
-- 
2.49.0.472.ge94155a9ec-goog


