Return-Path: <linux-arm-msm+bounces-60208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C4439ACDB66
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 11:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BC673A32EE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jun 2025 09:49:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A3E028C871;
	Wed,  4 Jun 2025 09:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EpaJCwXy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC7C22F770
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jun 2025 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030572; cv=none; b=boe6s4flDCilcPNTKIO6DwiNsvSdItzoOhym8B3Lfu9i9IWofRy+USXNq0D2y+/e/vYv7TdxzYCQEwh4Mr7gy2HFZihmyatkcLqDX+PC5xyMQpGXEZMsq6xtC2w2syCRRblDYdsxJXAYAz3RAwIq31TrqeldbCdVRyrx7IxwtFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030572; c=relaxed/simple;
	bh=A4P3xXjgEKpG93bR9ZQ0tJGCdAOQomBfcQ2wFu2Y+FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WEyvTk2njImvDCyO30cl+qhvOrnbsu5L8v4g3qAhZVwnQ31fiuudZoBBZay8b/tKJp3PG9Vd/9Zjh+ivRzUZ6IosJGVfWgFIL20PlZJgBTAhJdBDLmKbRsAA+ExclMCZ9Fgq6sa4C2s9iK/559+Ha9tkmEzigSR8Kt+PJqfY/ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EpaJCwXy; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4a433f52485so374381cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jun 2025 02:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749030569; x=1749635369; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yRqGtqvuCY8NPo0IKdzXRFxKLlQ9NCrC/cAzc6lecqo=;
        b=EpaJCwXyUAuweuf6Q/iZSFrefjbLevHIBSAoHO5dYk18NlxVkc5KB++1+sI682M66z
         6z070o55vl2gIwr60WnoRzWmRLsHQ6JbbsB+ABn9e7cbHKg2UjdowF8+fOs0qC4okwAw
         d/uJtpkKbmehayZNMq7QifFwJ9EwxfBrrZaUAn806BKKv/Xae3S+vksImMr3WJgahfJu
         lZ6iyjlcgQfxC3MK+T4X1SggpAsncWdvUeyZ9cmNCJcWxIDl4K1SOM5lExvqiQF6P73v
         qdQpZ6TyWayrQFExXF42poLt9M2irfrMLfqVBpGVI02l1yKvTNshcGF/zUNdTeLsDamo
         7Wzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030569; x=1749635369;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yRqGtqvuCY8NPo0IKdzXRFxKLlQ9NCrC/cAzc6lecqo=;
        b=WgcgDp5sIcmE8rjcvVRgHYXP/iGtSPRIRUOl7e2TPBvQlew6FM+5UiAeoxmabpKqbm
         ONIU82MgiorwdFcPxtRUdxBPIyOm4VqptH8sfqlwVtxvA3mhRxHPQAfTvqHk+biHbqaQ
         N6fT77BHp+rWIdATUUig3ZyzEl86TcuDtL7drOTtVd++hClaKH9iEEIYHX94bTXTbIlL
         Klob+YS69dxj3AzWvF3dyuM0Q2qf2yC/e3Itp/DvAMyiWx9pU+zMUIBUWLeOChu2RRD4
         DqL86BJfP+QFFfZaRD82VfromhuAN98lQ77jzRWNdknvvvk12yquij3CQ7gsPT4mM9E/
         qLzA==
X-Forwarded-Encrypted: i=1; AJvYcCUSIjlbOHAAcYFPQYP/R0inkLIb7ChrOAO8Bv25jRPaukj6PQoc9rnk11DCr+usr2TuxnBqmgfnLwRRPqR+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjq3E8rYEwVQX1vLsjMAh4gvGU4VmeIU3E4i3wHm9utrqXySdo
	wi+1FiiXhZdj8oXjF3042hnDNRGiftZix9g0YTMZ7tsOsto79DvO6EOai7762NMedSGPUj/J8zk
	p2uXVjJyOU0k1que2D/E1zatF407HC12e46vMbPme
X-Gm-Gg: ASbGncvDO4HAjem/O2iw5LwOpKZdsdCbTVu2W/YfdxFdTWs7K2N+g04cHxxnhZtAUws
	Ycs7N9FMI61/vwvdVAGEjNmzLgEhdJIfc/7XMIHMAq2E7t8blKc4ffEzwlV8myalYbMFNb5w6ou
	HioRUqHy+x3M2D9Tm4MtVqNJolQrLyZFe2GH1J3tXMHc01gBxw6Dww3/S7BnmfQvAHZEyID8o=
X-Google-Smtp-Source: AGHT+IEaR8nkSZ4ebS0MnjWCalWsKA4925IL28TSB+txPZ5jDYV7DZsBg1PYzG4zSeytRn+FRVTppE9G8dOcLB0elGQ=
X-Received: by 2002:a05:622a:124d:b0:466:8c23:823a with SMTP id
 d75a77b69052e-4a5a60dd1e0mr2633951cf.17.1749030568738; Wed, 04 Jun 2025
 02:49:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250527180245.1413463-1-tabba@google.com> <20250527180245.1413463-17-tabba@google.com>
 <025ae4ea-822b-44a1-8f78-38afc0e4b07e@redhat.com>
In-Reply-To: <025ae4ea-822b-44a1-8f78-38afc0e4b07e@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 4 Jun 2025 10:48:51 +0100
X-Gm-Features: AX0GCFs-Uw3oDxWOt32n9EpuZI00mJHU4fbd3lIo12rblTCXGnb5EKJ8brnMtMM
Message-ID: <CA+EHjTyfrPw0FEfaiAkmDhyE1N9hm1fXoFwKrbxv3kiPiyZQaA@mail.gmail.com>
Subject: Re: [PATCH v10 16/16] KVM: selftests: guest_memfd mmap() test when
 mapping is allowed
To: Gavin Shan <gshan@redhat.com>
Cc: kvm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-mm@kvack.org, 
	pbonzini@redhat.com, chenhuacai@kernel.org, mpe@ellerman.id.au, 
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
	ira.weiny@intel.com
Content-Type: text/plain; charset="UTF-8"

Hi Gavin,

On Wed, 4 Jun 2025 at 10:20, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Fuad,
>
> On 5/28/25 4:02 AM, Fuad Tabba wrote:
> > Expand the guest_memfd selftests to include testing mapping guest
> > memory for VM types that support it.
> >
> > Also, build the guest_memfd selftest for arm64.
> >
> > Co-developed-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >   tools/testing/selftests/kvm/Makefile.kvm      |   1 +
> >   .../testing/selftests/kvm/guest_memfd_test.c  | 162 +++++++++++++++---
> >   2 files changed, 142 insertions(+), 21 deletions(-)
> >
>
> The test case fails on 64KB host, and the file size in test_create_guest_memfd_multiple()
> would be page_size and (2 * page_size). The fixed size 4096 and 8192 aren't aligned to 64KB.

Yes, however, this patch didn't introduce or modify this test. I think
it's better to fix it in a separate patch independent of this series.

> # ./guest_memfd_test
> Random seed: 0x6b8b4567
> ==== Test Assertion Failure ====
>    guest_memfd_test.c:178: fd1 != -1
>    pid=7565 tid=7565 errno=22 - Invalid argument
>       1 0x000000000040252f: test_create_guest_memfd_multiple at guest_memfd_test.c:178
>       2  (inlined by) test_with_type at guest_memfd_test.c:231
>       3 0x00000000004020c7: main at guest_memfd_test.c:306
>       4 0x0000ffff8cec733f: ?? ??:0
>       5 0x0000ffff8cec7417: ?? ??:0
>       6 0x00000000004021ef: _start at ??:?
>    memfd creation should succeed
>
> > diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
> > index f62b0a5aba35..ccf95ed037c3 100644
> > --- a/tools/testing/selftests/kvm/Makefile.kvm
> > +++ b/tools/testing/selftests/kvm/Makefile.kvm
> > @@ -163,6 +163,7 @@ TEST_GEN_PROGS_arm64 += access_tracking_perf_test
> >   TEST_GEN_PROGS_arm64 += arch_timer
> >   TEST_GEN_PROGS_arm64 += coalesced_io_test
> >   TEST_GEN_PROGS_arm64 += dirty_log_perf_test
> > +TEST_GEN_PROGS_arm64 += guest_memfd_test
> >   TEST_GEN_PROGS_arm64 += get-reg-list
> >   TEST_GEN_PROGS_arm64 += memslot_modification_stress_test
> >   TEST_GEN_PROGS_arm64 += memslot_perf_test
> > diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
> > index ce687f8d248f..3d6765bc1f28 100644
> > --- a/tools/testing/selftests/kvm/guest_memfd_test.c
> > +++ b/tools/testing/selftests/kvm/guest_memfd_test.c
> > @@ -34,12 +34,46 @@ static void test_file_read_write(int fd)
> >                   "pwrite on a guest_mem fd should fail");
> >   }
> >
> > -static void test_mmap(int fd, size_t page_size)
> > +static void test_mmap_allowed(int fd, size_t page_size, size_t total_size)
> > +{
> > +     const char val = 0xaa;
> > +     char *mem;
> > +     size_t i;
> > +     int ret;
> > +
> > +     mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> > +     TEST_ASSERT(mem != MAP_FAILED, "mmaping() guest memory should pass.");
> > +
>
> If you agree, I think it would be nice to ensure guest-memfd doesn't support
> copy-on-write, more details are provided below.

Good idea. I think we can do this without adding much more code. I'll
add a check in test_mmap_allowed(), since the idea is, even if mmap()
is supported, we still can't COW. I'll rename the functions to make
this a bit clearer (i.e., supported instead of allowed).

Thank you for this and thank you for the reviews!
/fuad

> > +     memset(mem, val, total_size);
> > +     for (i = 0; i < total_size; i++)
> > +             TEST_ASSERT_EQ(mem[i], val);
> > +
> > +     ret = fallocate(fd, FALLOC_FL_KEEP_SIZE | FALLOC_FL_PUNCH_HOLE, 0,
> > +                     page_size);
> > +     TEST_ASSERT(!ret, "fallocate the first page should succeed");
> > +
> > +     for (i = 0; i < page_size; i++)
> > +             TEST_ASSERT_EQ(mem[i], 0x00);
> > +     for (; i < total_size; i++)
> > +             TEST_ASSERT_EQ(mem[i], val);
> > +
> > +     memset(mem, val, page_size);
> > +     for (i = 0; i < total_size; i++)
> > +             TEST_ASSERT_EQ(mem[i], val);
> > +
> > +     ret = munmap(mem, total_size);
> > +     TEST_ASSERT(!ret, "munmap should succeed");
> > +}
> > +
> > +static void test_mmap_denied(int fd, size_t page_size, size_t total_size)
> >   {
> >       char *mem;
> >
> >       mem = mmap(NULL, page_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> >       TEST_ASSERT_EQ(mem, MAP_FAILED);
> > +
> > +     mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
> > +     TEST_ASSERT_EQ(mem, MAP_FAILED);
> >   }
>
> Add one more argument to test_mmap_denied as the flags passed to mmap().
>
> static void test_mmap_denied(int fd, size_t page_size, size_t total_size, int mmap_flags)
> {
>         mem = mmap(NULL, total_size, PROT_READ | PROT_WRITE, mmap_flags, fd, 0);
> }
>
> >
> >   static void test_file_size(int fd, size_t page_size, size_t total_size)
> > @@ -120,26 +154,19 @@ static void test_invalid_punch_hole(int fd, size_t page_size, size_t total_size)
> >       }
> >   }
> >
> > -static void test_create_guest_memfd_invalid(struct kvm_vm *vm)
> > +static void test_create_guest_memfd_invalid_sizes(struct kvm_vm *vm,
> > +                                               uint64_t guest_memfd_flags,
> > +                                               size_t page_size)
> >   {
> > -     size_t page_size = getpagesize();
> > -     uint64_t flag;
> >       size_t size;
> >       int fd;
> >
> >       for (size = 1; size < page_size; size++) {
> > -             fd = __vm_create_guest_memfd(vm, size, 0);
> > -             TEST_ASSERT(fd == -1 && errno == EINVAL,
> > +             fd = __vm_create_guest_memfd(vm, size, guest_memfd_flags);
> > +             TEST_ASSERT(fd < 0 && errno == EINVAL,
> >                           "guest_memfd() with non-page-aligned page size '0x%lx' should fail with EINVAL",
> >                           size);
> >       }
> > -
> > -     for (flag = BIT(0); flag; flag <<= 1) {
> > -             fd = __vm_create_guest_memfd(vm, page_size, flag);
> > -             TEST_ASSERT(fd == -1 && errno == EINVAL,
> > -                         "guest_memfd() with flag '0x%lx' should fail with EINVAL",
> > -                         flag);
> > -     }
> >   }
> >
> >   static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
> > @@ -170,30 +197,123 @@ static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
> >       close(fd1);
> >   }
> >
> > -int main(int argc, char *argv[])
> > +#define GUEST_MEMFD_TEST_SLOT 10
> > +#define GUEST_MEMFD_TEST_GPA 0x100000000
> > +
> > +static bool check_vm_type(unsigned long vm_type)
> >   {
> > -     size_t page_size;
> > +     /*
> > +      * Not all architectures support KVM_CAP_VM_TYPES. However, those that
> > +      * support guest_memfd have that support for the default VM type.
> > +      */
> > +     if (vm_type == VM_TYPE_DEFAULT)
> > +             return true;
> > +
> > +     return kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(vm_type);
> > +}
> > +
> > +static void test_with_type(unsigned long vm_type, uint64_t guest_memfd_flags,
> > +                        bool expect_mmap_allowed)
> > +{
> > +     struct kvm_vm *vm;
> >       size_t total_size;
> > +     size_t page_size;
> >       int fd;
> > -     struct kvm_vm *vm;
> >
> > -     TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
> > +     if (!check_vm_type(vm_type))
> > +             return;
> >
> >       page_size = getpagesize();
> >       total_size = page_size * 4;
> >
> > -     vm = vm_create_barebones();
> > +     vm = vm_create_barebones_type(vm_type);
> >
> > -     test_create_guest_memfd_invalid(vm);
> >       test_create_guest_memfd_multiple(vm);
> > +     test_create_guest_memfd_invalid_sizes(vm, guest_memfd_flags, page_size);
> >
> > -     fd = vm_create_guest_memfd(vm, total_size, 0);
> > +     fd = vm_create_guest_memfd(vm, total_size, guest_memfd_flags);
> >
> >       test_file_read_write(fd);
> > -     test_mmap(fd, page_size);
> > +
> > +     if (expect_mmap_allowed)
> > +             test_mmap_allowed(fd, page_size, total_size);
> > +     else
> > +             test_mmap_denied(fd, page_size, total_size);
> > +
>
>         if (expect_mmap_allowed) {
>                 test_mmap_denied(fd, page_size, total_size, MAP_PRIVATE);
>                 test_mmap_allowed(fd, page_size, total_size);
>         } else {
>                 test_mmap_denied(fd, page_size, total_size, MAP_SHARED);
>         }
>
> >       test_file_size(fd, page_size, total_size);
> >       test_fallocate(fd, page_size, total_size);
> >       test_invalid_punch_hole(fd, page_size, total_size);
> >
> >       close(fd);
> > +     kvm_vm_release(vm);
> > +}
> > +
> > +static void test_vm_type_gmem_flag_validity(unsigned long vm_type,
> > +                                         uint64_t expected_valid_flags)
> > +{
> > +     size_t page_size = getpagesize();
> > +     struct kvm_vm *vm;
> > +     uint64_t flag = 0;
> > +     int fd;
> > +
> > +     if (!check_vm_type(vm_type))
> > +             return;
> > +
> > +     vm = vm_create_barebones_type(vm_type);
> > +
> > +     for (flag = BIT(0); flag; flag <<= 1) {
> > +             fd = __vm_create_guest_memfd(vm, page_size, flag);
> > +
> > +             if (flag & expected_valid_flags) {
> > +                     TEST_ASSERT(fd >= 0,
> > +                                 "guest_memfd() with flag '0x%lx' should be valid",
> > +                                 flag);
> > +                     close(fd);
> > +             } else {
> > +                     TEST_ASSERT(fd < 0 && errno == EINVAL,
> > +                                 "guest_memfd() with flag '0x%lx' should fail with EINVAL",
> > +                                 flag);
> > +             }
> > +     }
> > +
> > +     kvm_vm_release(vm);
> > +}
> > +
> > +static void test_gmem_flag_validity(void)
> > +{
> > +     uint64_t non_coco_vm_valid_flags = 0;
> > +
> > +     if (kvm_has_cap(KVM_CAP_GMEM_SHARED_MEM))
> > +             non_coco_vm_valid_flags = GUEST_MEMFD_FLAG_SUPPORT_SHARED;
> > +
> > +     test_vm_type_gmem_flag_validity(VM_TYPE_DEFAULT, non_coco_vm_valid_flags);
> > +
> > +#ifdef __x86_64__
> > +     test_vm_type_gmem_flag_validity(KVM_X86_SW_PROTECTED_VM, non_coco_vm_valid_flags);
> > +     test_vm_type_gmem_flag_validity(KVM_X86_SEV_VM, 0);
> > +     test_vm_type_gmem_flag_validity(KVM_X86_SEV_ES_VM, 0);
> > +     test_vm_type_gmem_flag_validity(KVM_X86_SNP_VM, 0);
> > +     test_vm_type_gmem_flag_validity(KVM_X86_TDX_VM, 0);
> > +#endif
> > +}
> > +
> > +int main(int argc, char *argv[])
> > +{
> > +     TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
> > +
> > +     test_gmem_flag_validity();
> > +
> > +     test_with_type(VM_TYPE_DEFAULT, 0, false);
> > +     if (kvm_has_cap(KVM_CAP_GMEM_SHARED_MEM)) {
> > +             test_with_type(VM_TYPE_DEFAULT, GUEST_MEMFD_FLAG_SUPPORT_SHARED,
> > +                            true);
> > +     }
> > +
> > +#ifdef __x86_64__
> > +     test_with_type(KVM_X86_SW_PROTECTED_VM, 0, false);
> > +     if (kvm_has_cap(KVM_CAP_GMEM_SHARED_MEM)) {
> > +             test_with_type(KVM_X86_SW_PROTECTED_VM,
> > +                            GUEST_MEMFD_FLAG_SUPPORT_SHARED, true);
> > +     }
> > +#endif
> >   }
>
> Thanks,
> Gavin
>

