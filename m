Return-Path: <linux-arm-msm+bounces-45472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 248EEA15C28
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jan 2025 10:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 142AF3A7289
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jan 2025 09:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D3F1802DD;
	Sat, 18 Jan 2025 09:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mYnnss2f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A81DA32
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jan 2025 09:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737192521; cv=none; b=dum/jWuSuVNazxmBI4+ArTMkvgvJzUC/U+kXRgNYg+R5oKWjTHeXmiVFSiYcBRxxI1lEWbKvDyouRx4N86sW9xWAAe8D84BjNyJJNt1s2gDiB/j5TOfuZAP4Fyw28gIys3aO1Z7HHSda/nV449n8MrQV+Ew+QEWbdQuLWffD2LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737192521; c=relaxed/simple;
	bh=rturNvl80AUJHCDAYmjkvF6F8ZHEWla0MxyqsDZNS7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dt2yfXw9a/m4gDKVrfgom9R8tERkOSGN/MqQ/pptYlBefYqqewgI00IXzjIen+O7Ujx7Play8G4JaZtvelm2IqCQjHwlwBuPX/y5CuatKupbk4lUNESq8ATTyeYizTAqB3HYfzqsjcfa9WcC/nbUFL2yQV09MU3YduHsFUldunw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mYnnss2f; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53df80eeeedso2927154e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jan 2025 01:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1737192517; x=1737797317; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csgVZxqfohIyYdReDwtAW9Joq8w156+EEReipSS2JAI=;
        b=mYnnss2fP9zlKm/wn+S/gLGGDyNv95utlyQw+JKx5M72T9u7ZEug196B8qbRMcQy98
         AH93NnkyCv2BobKVOpneLQmm7uWy6vma2/xUtEJ5zMrsneNSQgXZc08Eq512eMjaRyc6
         i9dMpU/xxYj+GTFNy3tTppxYqmQteddVquI2Sgu/Vw1w5sAB7eL2pJOM5GZZ47+njyTW
         d1DspmtA9CXHuOvxq2Bl5QKgK2arJyfFrUNqFn/1VOyvN1LSOIpgMxl4/60uPH1WntQC
         9WLFPvk/LIJzLbLiEO8KkXcoYWqYAIdi1cmNDPlaPw9hTglRqzh2HQvF6Fj3gI1tR5eD
         kv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737192517; x=1737797317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=csgVZxqfohIyYdReDwtAW9Joq8w156+EEReipSS2JAI=;
        b=EIkIazloIN/EFYmaFKNHgTslDSGZ7R2Y38ldAaWas678FaXIkgSFOYVgxeWylvIIrc
         9/KYp6d8WivXpBdpE+sypxVxXTj/DJD15cAu/T9AAFbkdeKc/1t6Dma+B0fx9kmdq5It
         ABOKG7r35I9CcSQbB2RgG13vboUOfhHaCkhKoyufbZ4qkBSBOHj4t35T/zDeT/6UVU8q
         /0FcFNrqdE1UGqQ0s3k8o7jMgU57icozmh4SdI+dMoq3qyF5RQKyLeBwFPLUwZA/tPao
         uVvD93SmFUa5lVWS17HgxhE+IiESJfA43RIIRbk0yxN4MrLmR0pHmuIlZvkDfyGmpBff
         RVUg==
X-Forwarded-Encrypted: i=1; AJvYcCWNbw8GJu+zxe3se56+Fuks2fbE2He1e2HUl8RUPPbueZdmLt7292LY9RTCtf7s+DsHuJAowCk0oW0UVhzp@vger.kernel.org
X-Gm-Message-State: AOJu0YzRuGLb1XYesuD2/6Jn2jrGMJbo3IzlOucGuFL7NEfw6ISiDxMb
	ghfjrXVpQBh0hAcz6z/y+GeSvgXVmgAR3+OCKNItxhZN6Bq0qehWNxu/gTelnDukkme2uR2wE29
	yUaD256bOjQsR06VLZTqXvMc8G9A23w/Xfdk1Ew==
X-Gm-Gg: ASbGnctB8HEBfvzta/ppgrgzZ/u62FOkzJuFOGfNlueogQGSnpgmmJbZGbKxCDLVqK/
	bqLEW3ttfn6vJp3DSCpi1kgcJYhn57lInBVdkiSTqwkortSZ5+6+rvrXtK9yP53K/UJG/YSYiXI
	yeLq75zjI=
X-Google-Smtp-Source: AGHT+IGLDxqLUJgeIkJ7U6biEHmAQuWJpjtyJYodsgwZVm2YSht1mS+nKDF60ru7FwvGKeElGW2X7wHTQUuGB0YyXOA=
X-Received: by 2002:a05:6512:3b9d:b0:540:1be6:f15f with SMTP id
 2adb3069b0e04-5439c1bfd49mr2117200e87.0.1737192517345; Sat, 18 Jan 2025
 01:28:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
 <20241203-crypto-qce-refactor-v1-9-c5901d2dd45c@linaro.org>
 <d6220576-eaf5-4415-b25f-b5984255ab78@linaro.org> <CAMRc=MevaM4tUNQUs_LjFYaUtDH=YqE-t2gBponGqtK5xE9Gpw@mail.gmail.com>
 <20250118080604.GA721573@sol.localdomain>
In-Reply-To: <20250118080604.GA721573@sol.localdomain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 18 Jan 2025 10:28:26 +0100
X-Gm-Features: AbW1kvaq5mXie-wkGH7lleBrCxfRjW7OBK2i53kmWCa9VCguJUG4c9Tz8dGbZpY
Message-ID: <CAMRc=MeFMYzMY4pU9D6fEpg9bQuuzqg4rQhBU8=z_2eMU+Py-g@mail.gmail.com>
Subject: Re: [PATCH 9/9] crypto: qce - switch to using a mutex
To: Eric Biggers <ebiggers@kernel.org>
Cc: neil.armstrong@linaro.org, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Stanimir Varbanov <svarbanov@mm-sol.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2025 at 9:06=E2=80=AFAM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Tue, Dec 03, 2024 at 10:10:13AM -0500, Bartosz Golaszewski wrote:
> > On Tue, 3 Dec 2024 14:53:21 +0100, neil.armstrong@linaro.org said:
> > > On 03/12/2024 10:19, Bartosz Golaszewski wrote:
> > >> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >>
> > >> Having switched to workqueue from tasklet, we are no longer limited =
to
> > >> atomic APIs and can now convert the spinlock to a mutex. This, along
> > >> with the conversion from tasklet to workqueue grants us ~15% improve=
ment
> > >> in cryptsetup benchmarks for AES encryption.
> > >
> > > Can you share on which platforms you did the tests and the results yo=
u got ?
> > >
> >
> > Sure, I tested on sm8650 with the following results (they vary from
> > one run to other but are more or less in this range):
>
> FYI, when I test this driver on sm8650 with linux-next there are lots of =
test
> failures, including ones where the driver straight out returns wrong hash=
es:
>
> [    6.330656] alg: skcipher: xts-aes-qce setkey failed on test vector 0;=
 expected_error=3D0, actual_error=3D-126, flags=3D0x1
> [    6.347196] alg: self-tests for xts(aes) using xts-aes-qce failed (rc=
=3D-126)
> [    6.347200] alg: self-tests for xts(aes) using xts-aes-qce failed (rc=
=3D-126)
> [    6.784951] alg: skcipher: ctr-aes-qce encryption test failed (wrong o=
utput IV) on test vector 4, cfg=3D"in-place (one sglist)"
> [    6.810709] alg: self-tests for ctr(aes) using ctr-aes-qce failed (rc=
=3D-22)
> [    6.941639] alg: skcipher: cbc-3des-qce setkey failed on test vector "=
random: len=3D16 klen=3D24"; expected_error=3D0, actual_error=3D-126, flags=
=3D0x1
> [    6.947029] alg: self-tests for ctr(aes) using ctr-aes-qce failed (rc=
=3D-22)
> [    6.954394] alg: self-tests for cbc(des3_ede) using cbc-3des-qce faile=
d (rc=3D-126)
> [    6.975348] alg: self-tests for cbc(des3_ede) using cbc-3des-qce faile=
d (rc=3D-126)
> [    7.454433] alg: skcipher: ecb-3des-qce setkey failed on test vector "=
random: len=3D32 klen=3D24"; expected_error=3D0, actual_error=3D-126, flags=
=3D0x1
> [    7.454482] alg: self-tests for ecb(des3_ede) using ecb-3des-qce faile=
d (rc=3D-126)
> [    7.454493] alg: self-tests for ecb(des3_ede) using ecb-3des-qce faile=
d (rc=3D-126)
> [    8.593828] alg: ahash: hmac-sha256-qce test failed (wrong result) on =
test vector "random: psize=3D0 ksize=3D80", cfg=3D"random: may_sleep use_fi=
nup src_divs=3D[<reimport>100.0%@+1800] key_offset=3D7"
> [    8.627337] alg: self-tests for hmac(sha256) using hmac-sha256-qce fai=
led (rc=3D-22)
> [    8.639889] alg: self-tests for hmac(sha256) using hmac-sha256-qce fai=
led (rc=3D-22)
> [    8.933595] alg: ahash: hmac-sha1-qce test failed (wrong result) on te=
st vector "random: psize=3D0 ksize=3D56", cfg=3D"random: inplace_one_sglist=
 use_finup nosimd_setkey src_divs=3D[100.0%@+3969] key_offset=3D71"
> [    8.952885] alg: self-tests for hmac(sha1) using hmac-sha1-qce failed =
(rc=3D-22)
> [    8.965096] alg: self-tests for hmac(sha1) using hmac-sha1-qce failed =
(rc=3D-22)
>

I was testing with kcapi-speed and cryptsetup benchmark. I've never
seen any errors.

Is this after my changes only or did it exist before? You're testing
with the tcrypt module? How are you inserting it exactly? What params?

> Also a KASAN error:
>
> [    9.420862] CPU: 3 UID: 0 PID: 393 Comm: cryptomgr_test Tainted: G S  =
    W          6.13.0-rc7-next-20250117-00007-g58182eb6d73d #12
> [    9.420881] Tainted: [S]=3DCPU_OUT_OF_SPEC, [W]=3DWARN
> [    9.420886] Hardware name: Qualcomm Technologies, Inc. SM8650 HDK (DT)
> [    9.420891] Call trace:
> [    9.420895]  show_stack+0x18/0x24 (C)
> [    9.420918]  dump_stack_lvl+0x60/0x80
> [    9.420937]  print_report+0x17c/0x4d0
> [    9.420960]  kasan_report+0xb0/0xf8
> [    9.420983]  kasan_check_range+0x100/0x1a8
> [    9.421001]  __asan_memcpy+0x3c/0xa0
> [    9.421020]  swiotlb_bounce+0x1b4/0x340
> [    9.421034]  swiotlb_tbl_map_single+0x2ac/0x5a0
> [    9.421050]  iommu_dma_map_page+0x2b8/0x4cc
> [    9.421063]  iommu_dma_map_sg+0x2e8/0xb3c
> [    9.421072]  __dma_map_sg_attrs+0x11c/0x1b0
> [    9.421086]  dma_map_sg_attrs+0x10/0x20
> [    9.421097]  qce_aead_async_req_handle+0x784/0x1aa0
> [    9.421125]  qce_handle_queue+0x20c/0x3e8
> [    9.421139]  qce_async_request_enqueue+0x10/0x1c
> [    9.421153]  qce_aead_crypt+0x1f0/0x81c
> [    9.421168]  qce_aead_encrypt+0x14/0x20
> [    9.421182]  crypto_aead_encrypt+0xa0/0xe0
> [    9.421194]  test_aead_vec_cfg+0x84c/0x1be8
> [    9.421207]  test_aead_vs_generic_impl+0x530/0x850
> [    9.421219]  alg_test_aead+0x7c8/0xe40
> [    9.421230]  alg_test+0x1f4/0xb0c
> [    9.421241]  cryptomgr_test+0x50/0x80
> [    9.421251]  kthread+0x378/0x678
> [    9.421272]  ret_from_fork+0x10/0x20
>
> [    9.550765] Allocated by task 393:
> [    9.554279]  kasan_save_stack+0x3c/0x64
> [    9.558252]  kasan_save_track+0x20/0x40
> [    9.562221]  kasan_save_alloc_info+0x40/0x54
> [    9.566641]  __kasan_kmalloc+0xb8/0xbc
> [    9.570515]  __kmalloc_noprof+0x188/0x410
> [    9.574669]  qce_aead_async_req_handle+0xbd4/0x1aa0
> [    9.579701]  qce_handle_queue+0x20c/0x3e8
> [    9.583841]  qce_async_request_enqueue+0x10/0x1c
> [    9.588607]  qce_aead_crypt+0x1f0/0x81c
> [    9.592577]  qce_aead_encrypt+0x14/0x20
> [    9.596547]  crypto_aead_encrypt+0xa0/0xe0
> [    9.600776]  test_aead_vec_cfg+0x84c/0x1be8
> [    9.605097]  test_aead_vs_generic_impl+0x530/0x850
> [    9.610039]  alg_test_aead+0x7c8/0xe40
> [    9.613911]  alg_test+0x1f4/0xb0c
> [    9.617345]  cryptomgr_test+0x50/0x80
> [    9.621124]  kthread+0x378/0x678
> [    9.624473]  ret_from_fork+0x10/0x20
>
> [    9.629738] The buggy address belongs to the object at ffff5c7440d1cc0=
0
>                 which belongs to the cache kmalloc-32 of size 32
> [    9.642426] The buggy address is located 0 bytes inside of
>                 allocated 22-byte region [ffff5c7440d1cc00, ffff5c7440d1c=
c16)
>
> [    9.656672] The buggy address belongs to the physical page:
> [    9.662409] page: refcount:0 mapcount:0 mapping:0000000000000000 index=
:0x0 pfn:0x880d1c
> [    9.670646] flags: 0xbfffe0000000000(node=3D0|zone=3D2|lastcpupid=3D0x=
1ffff)
> [    9.677371] page_type: f5(slab)
> [    9.680624] raw: 0bfffe0000000000 ffff5c7440002780 dead000000000100 de=
ad000000000122
> [    9.688595] raw: 0000000000000000 0000000080400040 00000000f5000000 00=
00000000000000
> [    9.696560] page dumped because: kasan: bad access detected
>
> [    9.703854] Memory state around the buggy address:
> [    9.708796]  ffff5c7440d1cb00: fa fb fb fb fc fc fc fc fa fb fb fb fc =
fc fc fc
> [    9.716227]  ffff5c7440d1cb80: fa fb fb fb fc fc fc fc fa fb fb fb fc =
fc fc fc
> [    9.723660] >ffff5c7440d1cc00: 00 00 06 fc fc fc fc fc fa fb fb fb fc =
fc fc fc
> [    9.731092]                          ^
> [    9.734959]  ffff5c7440d1cc80: fa fb fb fb fc fc fc fc 00 00 06 fc fc =
fc fc fc
> [    9.742392]  ffff5c7440d1cd00: 00 00 06 fc fc fc fc fc fa fb fb fb fc =
fc fc fc
> [    9.749824] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>

Hmm, I am running with KASAN on, never seen this How would I run
tcrypt to trigger it? By default the module doesn't load with no
params and gives me:

modprobe: ERROR: could not insert 'tcrypt': Resource temporarily unavailabl=
e

>
> I personally still struggle to understand how this driver could plausibly=
 be
> useful when the software crypto has no issues, is much faster, and is muc=
h
> better tested.  What is motivating having this driver in the kernel?

We want to use it in conjunction with the upcoming scminvoke (for
loading TAs and invoking objects - used to program the keys into the
QCE) to support the DRM use-case for decrypting streaming data inside
secure buffers upstream.

Bart

