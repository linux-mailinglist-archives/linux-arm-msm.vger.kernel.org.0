Return-Path: <linux-arm-msm+bounces-76108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6FCBBF35D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 22:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 515DE34B3E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 20:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFAED2DECD3;
	Mon,  6 Oct 2025 20:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLcuykQW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE352DCF5D
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 20:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759782911; cv=none; b=OhaUzWi2IK0snAzEOxvVovlhoWTDRXfbzlmO5w3LEawRy5QbhYlCxv/g+3Uc3hqowa7pXPhU8lBkyQJLKej8dATr4jxE9lyR/BnStrBDOMihhzIPmHwHNdvYtTd8S7sPgE0viYMRBC6YkV5k2ST5VCd83TEk4JCzZ7yU7fRdymQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759782911; c=relaxed/simple;
	bh=wRqM1wL0rtVZzWbUB1vZjAZ//+DX1ksR98VvmNXh1Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XRXQpzGAMSgimUeQY9QBX0tcN5k9tBXtK7cCbu2xsq3WLj7oZAspR7B58I737TVOvwB39D7d8ljQRErmw5iynSnVrOdTSq2mYBC2P3KvbeZCaj1rDUqhXww06hcA0ytVqdhd0qjIO/jBuHsJMfsU9uEDnmAIjianELYiS5gXUsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLcuykQW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e6674caa5so28173665e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 13:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759782907; x=1760387707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w8A8mrbjHOp4I+EQv9aLZuINyxZFXeZgTqLUL4/gbts=;
        b=JLcuykQWTX1qhWoGcyL4rEQ654Dn8fEafHNnYaDb6dJmDejlYhMexc8dmKE0V+67KA
         VXeK/+jdcGamwSsNrowIARdasb/A3kfrVP+mYMrjG2fMDyohKFx1OR/CBHF/NQieDvTm
         nYhYkQLV5FmuVpoGFvxSlH9sEY7KtEtF6AA69dHyfafQLyW7FbgGfvjK7QzAsZKhJRxF
         6b1Bh3dSp4xPjBWSZAhhNHoWPX4ZTv1vyvmhV1EfLHKX0+BMy3LeCJPJ/qPM7TxeZzUu
         gAvPPXnbv8/OFMtna0TOzl2h/DsQ3zNdQkpQ+LVjhXyApki4ODJMjXgeiBA/a3ojS0nY
         rm8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759782907; x=1760387707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w8A8mrbjHOp4I+EQv9aLZuINyxZFXeZgTqLUL4/gbts=;
        b=etc3Zd2jOtdx9qMV3x2dCMj2QymssnsuaGmdGY1C6YgubgBxYLpd+CHwpGgUGcSI3r
         lzvubHCkrrc3Ge4ot5nzxzCs6EEkd5e7+4xGuNwbrtUb+vfc8bpT9mtxAWB2BFxLYmj5
         U1s3p3xxMffpKB/tT9G0erRDiDwAbQERcetLgkaE2ICE/vLVXLS+PXO7TMPEeEe7qMgR
         v/ci+29E7OgHeYKoN4SXoQ3JDNdsTmOo+r7icq1ssYk9X+MQ33JPaq43MmE6q8TQ49X1
         PQeVNHFuxHIWLG62b23WsX5CaNCkyf5KbCR4glLkqgKfc3aiASt/DE8aik4Pa/D4hZJR
         ONxA==
X-Forwarded-Encrypted: i=1; AJvYcCWaso1fA707ycjMuI0Xl3C9GKansyMbo1wEfpu6k7cwr7+hcBjvWwMTTARLzhXacIdYTvKz1u/XPcoQsYZi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh4GDILpkBXEZv0mdwSyYhAK/co9VQIIxDL7aNlhbPFG3JfBCy
	gy0VFwkJYiQT39NQqaSTBPJhqaKB3TOPBbLeWjWkAUkbCTWLM1UaG4c9
X-Gm-Gg: ASbGncvXDpM6rRC+7RsqmXraJKUnho0r4EQ7B4Wqdibpd7LFs289Lvlkzy2z3nHJdIg
	Yeg9v28CuN1F13/BR0CQ6Oq1OaaRa2/5bXdBoWOrSfRV6YU3XUStsn7djqI6kkOc1rKDcyS7GHU
	pA1lqXWL2SMQ3ANwXysj+00mO7gxwsAqA6cKag3rTIdZqV21R8XOFvcGUlV+8DTP6QdD/4VRdOR
	NbbsRGxxvyLPnPs25atbXNzZiWrrSOAoKGAyPv+fHUtKIn3h3zqGrix5g+8fR3uZin5swKDC7+u
	7OXYseoqfQ6sxYo7MVmkWoqmGTaTfeXKpBQosVXrBeQKcHx5U+zB77hi319OlNkhhWunjv1EMwa
	63kB0coecihnU1Ub1MdRdIlLMSdvyJFU1h4+xcVcL27/e6RmgNLPSqXfaxF9VDSz25puEhuuS7X
	gLMCuA8zaAQa7c
X-Google-Smtp-Source: AGHT+IEnzSpQE+ROtayFnE2b4dPjTQF2CaZO9TdUfVNFcX6ejR4aNYCswD7XdVH/ajIMwYylIXY+YQ==
X-Received: by 2002:a05:600c:2287:b0:45d:d86b:b386 with SMTP id 5b1f17b1804b1-46fa29f13dfmr4596085e9.14.1759782906754;
        Mon, 06 Oct 2025 13:35:06 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e723591fcsm172334545e9.10.2025.10.06.13.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 13:35:06 -0700 (PDT)
Date: Mon, 6 Oct 2025 21:35:03 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Eliav Farber <farbere@amazon.com>, dave.hansen@linux.intel.com,
 peterz@infradead.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 x86@kernel.org, hpa@zytor.com, james.morse@arm.com, rric@kernel.org,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, sean@poorly.run, jdelvare@suse.com,
 linux@roeck-us.net, linus.walleij@linaro.org, dmitry.torokhov@gmail.com,
 maz@kernel.org, wens@csie.org, jernej.skrabec@gmail.com, agk@redhat.com,
 snitzer@redhat.com, dm-devel@redhat.com, davem@davemloft.net,
 kuba@kernel.org, mcoquelin.stm32@gmail.com,
 krzysztof.kozlowski@canonical.com, malattia@linux.it, hdegoede@redhat.com,
 mgross@linux.intel.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 sakari.ailus@linux.intel.com, clm@fb.com, josef@toxicpanda.com,
 dsterba@suse.com, jack@suse.com, tytso@mit.edu, adilger.kernel@dilger.ca,
 dushistov@mail.ru, luc.vanoostenryck@gmail.com, rostedt@goodmis.org,
 pmladek@suse.com, senozhatsky@chromium.org,
 andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
 minchan@kernel.org, ngupta@vflare.org, akpm@linux-foundation.org,
 yoshfuji@linux-ipv6.org, dsahern@kernel.org, pablo@netfilter.org,
 kadlec@netfilter.org, fw@strlen.de, jmaloy@redhat.com,
 ying.xue@windriver.com, shuah@kernel.org, willy@infradead.org,
 sashal@kernel.org, quic_akhilpo@quicinc.com, ruanjinjie@huawei.com,
 David.Laight@aculab.com, herve.codina@bootlin.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, linux-edac@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 platform-driver-x86@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-mm@kvack.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, tipc-discussion@lists.sourceforge.net,
 linux-kselftest@vger.kernel.org, stable@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH v2 07/19 5.15.y] minmax: simplify and clarify
 min_t()/max_t() implementation
Message-ID: <20251006213242.3462e746@pumpkin>
In-Reply-To: <2025100648-capable-register-101b@gregkh>
References: <20251003130006.41681-1-farbere@amazon.com>
	<20251003130006.41681-8-farbere@amazon.com>
	<2025100648-capable-register-101b@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 6 Oct 2025 12:47:45 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

(I've had to trim the 'To' list to send this...)

> On Fri, Oct 03, 2025 at 12:59:54PM +0000, Eliav Farber wrote:
> > From: Linus Torvalds <torvalds@linux-foundation.org>
> >=20
> > [ Upstream commit 017fa3e89187848fd056af757769c9e66ac3e93d ]
> >=20
> > This simplifies the min_t() and max_t() macros by no longer making them
> > work in the context of a C constant expression.
> >=20
> > That means that you can no longer use them for static initializers or
> > for array sizes in type definitions, but there were only a couple of
> > such uses, and all of them were converted (famous last words) to use
> > MIN_T/MAX_T instead.
> >=20
> > Cc: David Laight <David.Laight@aculab.com>
> > Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Eliav Farber <farbere@amazon.com> =20
>=20
> Eliav, your testing infrastructure needs some work, this patch breaks
> the build on this kernel tree:
>=20
> In file included from ./include/linux/kernel.h:16,
>                  from ./include/linux/list.h:9,
>                  from ./include/linux/wait.h:7,
>                  from ./include/linux/wait_bit.h:8,
>                  from ./include/linux/fs.h:6,
>                  from fs/erofs/internal.h:10,
>                  from fs/erofs/zdata.h:9,
>                  from fs/erofs/zdata.c:6:
> fs/erofs/zdata.c: In function =E2=80=98z_erofs_decompress_pcluster=E2=80=
=99:
> fs/erofs/zdata.h:185:61: error: ISO C90 forbids variable length array =E2=
=80=98pages_onstack=E2=80=99 [-Werror=3Dvla]
>   185 |         min_t(unsigned int, THREAD_SIZE / 8 / sizeof(struct page =
*), 96U)
>       |                                                             ^~~~

That constant seems to get (renamed and) changed to 32 in a later patch.
I'm not sure of the rational for the min() at all.
I think THREAD_SIZE is the size of the kernel stack? Or at least related to=
 it.
The default seems to be 8k on x86-64 and 4k or 8k on i386.
So it is pretty much always going to be 96.

Linus added MIN() that can be used for array sizes.
But I'd guess this could just be changed to 32 - need to ask the erofs guys.

	David


> ./include/linux/minmax.h:49:23: note: in definition of macro =E2=80=98__c=
mp_once_unique=E2=80=99
>    49 |         ({ type ux =3D (x); type uy =3D (y); __cmp(op, ux, uy); })
>       |                       ^
> ./include/linux/minmax.h:164:27: note: in expansion of macro =E2=80=98__c=
mp_once=E2=80=99
>   164 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
>       |                           ^~~~~~~~~~
> fs/erofs/zdata.h:185:9: note: in expansion of macro =E2=80=98min_t=E2=80=
=99
>   185 |         min_t(unsigned int, THREAD_SIZE / 8 / sizeof(struct page =
*), 96U)
>       |         ^~~~~
> fs/erofs/zdata.c:847:36: note: in expansion of macro =E2=80=98Z_EROFS_VMA=
P_ONSTACK_PAGES=E2=80=99
>   847 |         struct page *pages_onstack[Z_EROFS_VMAP_ONSTACK_PAGES];
>       |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
>=20
>=20
> I'll drop this whole series, please do a bit more testing before sending
> out a new version.
>=20
> thanks,
>=20
> greg k-h
>=20


