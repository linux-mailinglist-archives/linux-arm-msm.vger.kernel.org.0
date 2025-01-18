Return-Path: <linux-arm-msm+bounces-45470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DEAA15BDA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jan 2025 09:06:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 041933A7EE8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jan 2025 08:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AAA915573F;
	Sat, 18 Jan 2025 08:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8u6KYPZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C084136E;
	Sat, 18 Jan 2025 08:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737187567; cv=none; b=VW3aG7Q2s/JreYN3+IxM8DQBh4ZunNJTllA5I/mKoW5+0ulE+sf1b+pBXkzCsQ1Qs/J8V+AT8Ms5vgjFb3qecK09ZGfj63H3ACcpdn/p8dRUL5oHrNk3yFiq9Z9cT1Of+V+8LJ+hKcghSporx3TXjdw5xCrdqBcxap91R3D3DCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737187567; c=relaxed/simple;
	bh=gHlaMoqb6TODfh9fjSx5Da+VTfnJxIZohAUAWmv4Q4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2hAtIkrH3MR0mO5FKICM1tKesnAS6weV2tX9T54x8TVB7gzQticye1DI8oPf2Q2XpgG4xNo3FuBuCyvZNUrrR3DH1Gsks4SREfbudJHBfmym/ifTCZ/ZVTCrISCYKPRmitHheM/P3K2OEln/CoQ5ybfCwDu4kqnE0KT+pPOBZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8u6KYPZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D2CC4CED1;
	Sat, 18 Jan 2025 08:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737187566;
	bh=gHlaMoqb6TODfh9fjSx5Da+VTfnJxIZohAUAWmv4Q4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l8u6KYPZOWuRFRLIhKc1m8NEYDTcEmh0iyqp0jG3aFLJ2HbgOgmPtfnqqmvSy3b2t
	 UHOAt7JWQR3v7z2Lnwxeq/ugAMNrtW8HX0AkbqeS5eF7fWRLuEdTCr/S63LW7o5uJb
	 3/JrdcHu4bM/9w9rLKgAtMGgli4IeIbkRRx4Lg1cPRfp5eNb8g2SR+blQPzsXs9aSW
	 9L/ETZh6UFGavmzsnuoVM+cMnAq8hoj+lc7PS3A8OupCNW9ToGnOWZbbp39hkajWFt
	 kLXtHT9ug4jaQL8mbrXp1/FMRkHYruCdew0T/61L7D7UD+y38vu+9RXDLRIEERzskU
	 THxxO171By7OQ==
Date: Sat, 18 Jan 2025 00:06:04 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: neil.armstrong@linaro.org, linux-crypto@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH 9/9] crypto: qce - switch to using a mutex
Message-ID: <20250118080604.GA721573@sol.localdomain>
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
 <20241203-crypto-qce-refactor-v1-9-c5901d2dd45c@linaro.org>
 <d6220576-eaf5-4415-b25f-b5984255ab78@linaro.org>
 <CAMRc=MevaM4tUNQUs_LjFYaUtDH=YqE-t2gBponGqtK5xE9Gpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MevaM4tUNQUs_LjFYaUtDH=YqE-t2gBponGqtK5xE9Gpw@mail.gmail.com>

On Tue, Dec 03, 2024 at 10:10:13AM -0500, Bartosz Golaszewski wrote:
> On Tue, 3 Dec 2024 14:53:21 +0100, neil.armstrong@linaro.org said:
> > On 03/12/2024 10:19, Bartosz Golaszewski wrote:
> >> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >>
> >> Having switched to workqueue from tasklet, we are no longer limited to
> >> atomic APIs and can now convert the spinlock to a mutex. This, along
> >> with the conversion from tasklet to workqueue grants us ~15% improvement
> >> in cryptsetup benchmarks for AES encryption.
> >
> > Can you share on which platforms you did the tests and the results you got ?
> >
> 
> Sure, I tested on sm8650 with the following results (they vary from
> one run to other but are more or less in this range):

FYI, when I test this driver on sm8650 with linux-next there are lots of test
failures, including ones where the driver straight out returns wrong hashes:

[    6.330656] alg: skcipher: xts-aes-qce setkey failed on test vector 0; expected_error=0, actual_error=-126, flags=0x1
[    6.347196] alg: self-tests for xts(aes) using xts-aes-qce failed (rc=-126)
[    6.347200] alg: self-tests for xts(aes) using xts-aes-qce failed (rc=-126)
[    6.784951] alg: skcipher: ctr-aes-qce encryption test failed (wrong output IV) on test vector 4, cfg="in-place (one sglist)"
[    6.810709] alg: self-tests for ctr(aes) using ctr-aes-qce failed (rc=-22)
[    6.941639] alg: skcipher: cbc-3des-qce setkey failed on test vector "random: len=16 klen=24"; expected_error=0, actual_error=-126, flags=0x1
[    6.947029] alg: self-tests for ctr(aes) using ctr-aes-qce failed (rc=-22)
[    6.954394] alg: self-tests for cbc(des3_ede) using cbc-3des-qce failed (rc=-126)
[    6.975348] alg: self-tests for cbc(des3_ede) using cbc-3des-qce failed (rc=-126)
[    7.454433] alg: skcipher: ecb-3des-qce setkey failed on test vector "random: len=32 klen=24"; expected_error=0, actual_error=-126, flags=0x1
[    7.454482] alg: self-tests for ecb(des3_ede) using ecb-3des-qce failed (rc=-126)
[    7.454493] alg: self-tests for ecb(des3_ede) using ecb-3des-qce failed (rc=-126)
[    8.593828] alg: ahash: hmac-sha256-qce test failed (wrong result) on test vector "random: psize=0 ksize=80", cfg="random: may_sleep use_finup src_divs=[<reimport>100.0%@+1800] key_offset=7"
[    8.627337] alg: self-tests for hmac(sha256) using hmac-sha256-qce failed (rc=-22)
[    8.639889] alg: self-tests for hmac(sha256) using hmac-sha256-qce failed (rc=-22)
[    8.933595] alg: ahash: hmac-sha1-qce test failed (wrong result) on test vector "random: psize=0 ksize=56", cfg="random: inplace_one_sglist use_finup nosimd_setkey src_divs=[100.0%@+3969] key_offset=71"
[    8.952885] alg: self-tests for hmac(sha1) using hmac-sha1-qce failed (rc=-22)
[    8.965096] alg: self-tests for hmac(sha1) using hmac-sha1-qce failed (rc=-22)

Also a KASAN error:

[    9.420862] CPU: 3 UID: 0 PID: 393 Comm: cryptomgr_test Tainted: G S      W          6.13.0-rc7-next-20250117-00007-g58182eb6d73d #12
[    9.420881] Tainted: [S]=CPU_OUT_OF_SPEC, [W]=WARN
[    9.420886] Hardware name: Qualcomm Technologies, Inc. SM8650 HDK (DT)
[    9.420891] Call trace:
[    9.420895]  show_stack+0x18/0x24 (C)
[    9.420918]  dump_stack_lvl+0x60/0x80
[    9.420937]  print_report+0x17c/0x4d0
[    9.420960]  kasan_report+0xb0/0xf8
[    9.420983]  kasan_check_range+0x100/0x1a8
[    9.421001]  __asan_memcpy+0x3c/0xa0
[    9.421020]  swiotlb_bounce+0x1b4/0x340
[    9.421034]  swiotlb_tbl_map_single+0x2ac/0x5a0
[    9.421050]  iommu_dma_map_page+0x2b8/0x4cc
[    9.421063]  iommu_dma_map_sg+0x2e8/0xb3c
[    9.421072]  __dma_map_sg_attrs+0x11c/0x1b0
[    9.421086]  dma_map_sg_attrs+0x10/0x20
[    9.421097]  qce_aead_async_req_handle+0x784/0x1aa0
[    9.421125]  qce_handle_queue+0x20c/0x3e8
[    9.421139]  qce_async_request_enqueue+0x10/0x1c
[    9.421153]  qce_aead_crypt+0x1f0/0x81c
[    9.421168]  qce_aead_encrypt+0x14/0x20
[    9.421182]  crypto_aead_encrypt+0xa0/0xe0
[    9.421194]  test_aead_vec_cfg+0x84c/0x1be8
[    9.421207]  test_aead_vs_generic_impl+0x530/0x850
[    9.421219]  alg_test_aead+0x7c8/0xe40
[    9.421230]  alg_test+0x1f4/0xb0c
[    9.421241]  cryptomgr_test+0x50/0x80
[    9.421251]  kthread+0x378/0x678
[    9.421272]  ret_from_fork+0x10/0x20

[    9.550765] Allocated by task 393:
[    9.554279]  kasan_save_stack+0x3c/0x64
[    9.558252]  kasan_save_track+0x20/0x40
[    9.562221]  kasan_save_alloc_info+0x40/0x54
[    9.566641]  __kasan_kmalloc+0xb8/0xbc
[    9.570515]  __kmalloc_noprof+0x188/0x410
[    9.574669]  qce_aead_async_req_handle+0xbd4/0x1aa0
[    9.579701]  qce_handle_queue+0x20c/0x3e8
[    9.583841]  qce_async_request_enqueue+0x10/0x1c
[    9.588607]  qce_aead_crypt+0x1f0/0x81c
[    9.592577]  qce_aead_encrypt+0x14/0x20
[    9.596547]  crypto_aead_encrypt+0xa0/0xe0
[    9.600776]  test_aead_vec_cfg+0x84c/0x1be8
[    9.605097]  test_aead_vs_generic_impl+0x530/0x850
[    9.610039]  alg_test_aead+0x7c8/0xe40
[    9.613911]  alg_test+0x1f4/0xb0c
[    9.617345]  cryptomgr_test+0x50/0x80
[    9.621124]  kthread+0x378/0x678
[    9.624473]  ret_from_fork+0x10/0x20

[    9.629738] The buggy address belongs to the object at ffff5c7440d1cc00
                which belongs to the cache kmalloc-32 of size 32
[    9.642426] The buggy address is located 0 bytes inside of
                allocated 22-byte region [ffff5c7440d1cc00, ffff5c7440d1cc16)

[    9.656672] The buggy address belongs to the physical page:
[    9.662409] page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x880d1c
[    9.670646] flags: 0xbfffe0000000000(node=0|zone=2|lastcpupid=0x1ffff)
[    9.677371] page_type: f5(slab)
[    9.680624] raw: 0bfffe0000000000 ffff5c7440002780 dead000000000100 dead000000000122
[    9.688595] raw: 0000000000000000 0000000080400040 00000000f5000000 0000000000000000
[    9.696560] page dumped because: kasan: bad access detected

[    9.703854] Memory state around the buggy address:
[    9.708796]  ffff5c7440d1cb00: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
[    9.716227]  ffff5c7440d1cb80: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
[    9.723660] >ffff5c7440d1cc00: 00 00 06 fc fc fc fc fc fa fb fb fb fc fc fc fc
[    9.731092]                          ^
[    9.734959]  ffff5c7440d1cc80: fa fb fb fb fc fc fc fc 00 00 06 fc fc fc fc fc
[    9.742392]  ffff5c7440d1cd00: 00 00 06 fc fc fc fc fc fa fb fb fb fc fc fc fc
[    9.749824] ==================================================================


I personally still struggle to understand how this driver could plausibly be
useful when the software crypto has no issues, is much faster, and is much
better tested.  What is motivating having this driver in the kernel?

- Eric

