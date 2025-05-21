Return-Path: <linux-arm-msm+bounces-58871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 62257ABF028
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 11:39:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCA4E7A5771
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 09:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1AE82512E2;
	Wed, 21 May 2025 09:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZU40fYya"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95AE24888C
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 09:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747820369; cv=none; b=p2ms6Qh7I4u37Tmy3gAeBjr565oIOI3TAnQxZHibyGKShAGponWPVUpaHpd7iOBOZzXhhb//Mkh+K8mZbxqeenBXmnBF8if3s52AhEO+SozRN7dgwqH9ZHUHxNQFEu/FjHP4jqb+327G0ye+28rcMv45+XwYkrfrdk3K7O4g2Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747820369; c=relaxed/simple;
	bh=etMJ5Ka8ftNDd+fW/9Yy5SQQ2sfKAQb6WhvSd3cHKQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XDUOyD5sDDUJfBGK43iaoHYTa7TBcmgDLjmkKeMBiENMDOH8Uwjh/CBlpjpqpUNvPlF+MJIPLgRa/G9PaHyLddgMdylSGSoEf9BnYH/QD/FHNMc2/TQ+EohbkApu1cF6OI/Sg1fQLdCSfVKs82l6kJTTPEYnwuhvik/wfxadB0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZU40fYya; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-47e9fea29easo1616641cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 May 2025 02:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747820367; x=1748425167; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hGDbphIguy1iKM6+xTy++Xz3vkmQN6/WjmqnDv6L9nE=;
        b=ZU40fYyakP77u1LrdmTdhA1BHqmxKq4JTziZzdrt5gJRvrrP0OnECRvxF8AlI8nsCz
         Cf6eLw475expg323t/lFqmabFNrIn7Aeb1evCIshULvsSva3/FkWhGyttPo1s0fc31n4
         zjyKTKvJ5KOYkdYquXVlcG5/EqsGPRqha/K7/gatcyWa5Lmn/knvKBK6dYDn4AQ43Yvj
         2UfgfDW3CHZyAZzbesMHlI/n7ImykM/laQW/vQq2nCLq5ljXgb5ZIAjYBl1GQc0hmKV/
         Z6qsTK1b04vS/ystfoyB8jtbi5TwpZjQ0xCUHQpgo6+Ebi/mf0M57pTH4yD5a3pcqXDu
         XjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747820367; x=1748425167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGDbphIguy1iKM6+xTy++Xz3vkmQN6/WjmqnDv6L9nE=;
        b=TP1+noniYI0a24JooTEANOtKo2JbdSOAIllChaPsOniu3La9Et4dXa9JXPO7YE6vnW
         nJf6kWDAP0ur7rFOHbEHupTzL0ML8qsEc20H9BAi0iV5iy4FC3urgvlLmgmpaBcLHkgd
         OtL49Q1Hfmqmg5nEmi+eHPXBPXMUDX2ZXcgH/0G7384O4QbJxJk9RbtZL8CraX+f58m9
         HeoneIevo8vTFjjI2YI6deZ4aPIOk3S365lpXRGwyhMiauMLGxxxVzTQQ5yj5fZ9RnpN
         yZLIbZokAlAPGUqX5cMz5VBzQ5c16EqhpiUnBHzhAnQFSWwPeo2+StBHPeUI8F2N7AWX
         Vhvg==
X-Forwarded-Encrypted: i=1; AJvYcCVxBBAIgIcWosRZ22O2ahz9C5V35pkuqmNqtFSY3JN+tFnI+20UNvmmcr6Jy2XhNRPmyY3/tIKkAm7TTmfO@vger.kernel.org
X-Gm-Message-State: AOJu0YxBsWvOi6ScjKze49XnnHF02Izie3H3uktuzwpF9xN4S46xenay
	c4V7o6X22fThwannKhJOKc3Zd/6I2AP30hoaYGMiH6iJ3Hawuh6uSwkZUKzk9gX5nr9El0jAyCG
	EoDaGEnCUKiq6iIv/Q0fwTGY4gqppuHDmOcrsWmyR
X-Gm-Gg: ASbGnct7gWP9kWpBl56y9aFUeF9KXUEjN5n9v+qCE1ND8h4T8gWv9+llgj33qtUNS9o
	bjtybHCRKqIom47XE4VrVf0DCt3mOshdJQyRFJyjjmfeEQ67lQ/dUUPg3HAt50erLaKdZH5Gvg+
	4NNvF+G0G9k3lu9MH+n3j2Gnd89JWalzlkbatORKN5e1vNs1FBAQSkvwVEmFI2cmvwBBfnoEO2M
	8Pry71JdE0=
X-Google-Smtp-Source: AGHT+IHWH5Tjt5x64X9b3qAbjbESX9nJkabmYe84FVCGBi3KXSuMcKDcCXU1/ib7EYl+2HrOV4hRy25CAxS7nOs7o0g=
X-Received: by 2002:ac8:590b:0:b0:494:763e:d971 with SMTP id
 d75a77b69052e-49601267b5dmr13456331cf.23.1747820366438; Wed, 21 May 2025
 02:39:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513163438.3942405-1-tabba@google.com> <20250513163438.3942405-17-tabba@google.com>
 <7bbe7aea-3b17-444b-8cd3-c5941950307c@redhat.com>
In-Reply-To: <7bbe7aea-3b17-444b-8cd3-c5941950307c@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 21 May 2025 10:38:49 +0100
X-Gm-Features: AX0GCFt9zXqqAnIt7HzaSTXaS5kbrEo0MrX_mNwm9FWo1ZMmUlTVqovdzb8I4RA
Message-ID: <CA+EHjTzGMw_mJWTy=87MNrL8XUfJk=JGJ=SDAh900j0bO28AtQ@mail.gmail.com>
Subject: Re: [PATCH v9 16/17] KVM: selftests: guest_memfd mmap() test when
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

On Wed, 21 May 2025 at 07:53, Gavin Shan <gshan@redhat.com> wrote:
>
> Hi Fuad,
>
> On 5/14/25 2:34 AM, Fuad Tabba wrote:
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
> >   .../testing/selftests/kvm/guest_memfd_test.c  | 145 +++++++++++++++---
> >   2 files changed, 126 insertions(+), 20 deletions(-)
> >
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
> > index ce687f8d248f..443c49185543 100644
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
> > +     memset(mem, val, total_size);
> > +     for (i = 0; i < total_size; i++)
> > +             TEST_ASSERT_EQ(mem[i], val);
> > +
>
> The last memset() and check the resident values look redudant because same
> test has been covered by the first memset(). If we really want to double
> confirm that the page-cache is writabble, it would be enough to cover the
> first page. Otherwise, I guess this hunk of code can be removed :)

My goal was to check that it is in fact writable, and that it stores
the expected value, after the punch_hole. I'll limit it to the first
page.

>
>         memset(mem, val, page_size);
>         for (i = 0; i < page_size; i++)
>                 TEST_ASSERT_EQ(mem[i], val);
>
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
> > +             fd = __vm_create_guest_memfd(vm, size, guest_memfd_flags);
> >               TEST_ASSERT(fd == -1 && errno == EINVAL,
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
> > @@ -170,30 +197,108 @@ static void test_create_guest_memfd_multiple(struct kvm_vm *vm)
> >       close(fd1);
> >   }
> >
> > -int main(int argc, char *argv[])
> > +static void test_with_type(unsigned long vm_type, uint64_t guest_memfd_flags,
> > +                        bool expect_mmap_allowed)
> >   {
> > -     size_t page_size;
> > +     struct kvm_vm *vm;
> >       size_t total_size;
> > +     size_t page_size;
> >       int fd;
> > -     struct kvm_vm *vm;
> >
> > -     TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD));
> > +     if (!(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(vm_type)))
> > +             return;
> >
>
> The check seems incorrect for aarch64 since 0 is always returned from
> kvm_check_cap() there. The test is skipped for VM_TYPE_DEFAULT on aarch64.
> So it would be something like below:
>
>         #define VM_TYPE_DEFAULT         0
>
>         if (vm_type != VM_TYPE_DEFAULT &&
>             !(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(vm_type)))
>                 return;

Ack.

Thanks for this, and for all the other reviews.

Cheers,
/fuad

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
> > +     if (!(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(vm_type)))
> > +             return;
>
> Same as above

Ack.

> > +
> > +     vm = vm_create_barebones_type(vm_type);
> > +
> > +     for (flag = BIT(0); flag; flag <<= 1) {
> > +             fd = __vm_create_guest_memfd(vm, page_size, flag);
> > +
> > +             if (flag & expected_valid_flags) {
> > +                     TEST_ASSERT(fd > 0,
> > +                                 "guest_memfd() with flag '0x%lx' should be valid",
> > +                                 flag);
> > +                     close(fd);
> > +             } else {
> > +                     TEST_ASSERT(fd == -1 && errno == EINVAL,
> > +                                 "guest_memfd() with flag '0x%lx' should fail with EINVAL",
> > +                                 flag);
>
> It's more robust to have:
>
>                         TEST_ASSERT(fd < 0 && errno == EINVAL, ...);

Ack.

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

