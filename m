Return-Path: <linux-arm-msm+bounces-15754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 643CF8923D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 20:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C61101F22FF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 19:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 671E36A010;
	Fri, 29 Mar 2024 19:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zxu6Ok3S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA2785C43
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 19:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711739244; cv=none; b=ioN86Meoe7+B3SjilxwVo3+eRj34y2LIX4JP6y87IWoFxx5XNCl2IlKUut7n4LXkoc4mMHy17c+X5c+EuYHup6uREMg9gbVhP7RAaHnJiGURmtfxuG19bJSM1u9Gd4BwlyJU7WWJhUEEM5h5tRyF3QkWbZxLj61ts/vofx0Svtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711739244; c=relaxed/simple;
	bh=Fiz7j7M49zhe+tECsOMRO0HilNSxFrTJwPrSXI1ehPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bd5EKI+bawe6Mt5p6XCorozQl/eKzIjnydUWR74DrYfnEh2rqTf8S15v71FUPvrcsJ4V0i4bQ8COXyoW7N4gxvMG3+TpdmRLUMEWTPVNYNz1hZQ4utpTnmpZvRFvVJDmglL5QFNl62auZlP1NA5uOtqbL/VXWNKf+3fOFEA9FE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zxu6Ok3S; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-515b43b39fdso1964325e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 12:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711739241; x=1712344041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsdBG0vRP2yUpfQaPKhnal9fapiJWVoX07rz+DB9uPU=;
        b=zxu6Ok3StkBnsAIssjxaNZ8kNsISb+zJZCbaUQI4cH4Gr4TJltDTuyVgN+bFGWxwNd
         7kGQSpGY0EnCyi+GWhE4464AO1bbwbpK98xb7ymp4ICZ+yJznUrqykt6ofAYdILZpHde
         Twm21r8sF3InKiEZsjl3BIbDBUN4SG4WuZ2qD8qiYKVqugvGfq7Xo5W1zcxubquCsyIY
         SUjhUJw9f151Kh651q3WrVVQ7xepz+QFtUSOi+hOdMYUrqRzktT0OxMBVv+MwycdcRYg
         t3Wid8Ktekrxi9FpHFcLm8sm9OZX38eEgygQNz7WfcDWmBKF84yO8409Ge9dCzrm+Z0q
         lf3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711739241; x=1712344041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jsdBG0vRP2yUpfQaPKhnal9fapiJWVoX07rz+DB9uPU=;
        b=CJFQ4V4765bhAeVaiUY2UDUZcENJSssrUEyods93iAnfVEWCeYyA4CELtSZgy3O9aS
         EM/hJp32/gq+3pVZ7jw3rBCD/CFxgkDZTb+pmhMU9Bl+R3IIDG5XLl3VJpPq7Ysa21zw
         LHOvqLJUuKVt3skYEir5dRCYRa0Uqx0cZq9a0d80Rd2C5EQPP7CIsr2yUWs59/0jQidQ
         lxCIZlh+EH4/rdZEbGg4H2GbBUhkxszQSoT1jjvCuKZCIfhdRwlr+jUSO0RJ4/baEml9
         MTO160pexSHn0mgKfQSM/XeRZZIklJLKCoWA8vZ1qJND6HNPRMpBhrOMsgazFUmRv0n9
         31iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr3X8QCHTcpniM787gOtNX/fj7GcXKoAtoz2dfxbghed+EuF8nDySdL+uBEsKMPz4gsc3B84HO5E6juDo4J6cb5gG2JEE5wAYcxoa3Kw==
X-Gm-Message-State: AOJu0Yxegs5SlpSPKDxNLjGMwJvnWPS/YWMarxiQkadreJtFjcezx65s
	vsF4B5nosCWBKr2smnNnd4bQm0ZqBCcnwY+iyzBVCjPNqHINxCLmlp3rigYftTvMMP0xlqKz2W9
	ECpb4jgXBwBmwy/LLvzphMqm8xqQC/t+iWqKtyQ==
X-Google-Smtp-Source: AGHT+IHDWRMoxcd1Mlgu1tyGjFBl2EBCV2TtX1HZvUeiaGduYEhnrGywQ/gnvwpFytuqrMbJ58lOACD5ROn1xGB+f74=
X-Received: by 2002:ac2:5f70:0:b0:515:d3e4:4581 with SMTP id
 c16-20020ac25f70000000b00515d3e44581mr566058lfc.30.1711739240427; Fri, 29 Mar
 2024 12:07:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325100359.17001-1-brgl@bgdev.pl> <56e1c63a-4c09-4d92-9ef2-aad5390879cc@gmail.com>
 <CAMRc=Mf_pvrh2VMfTVE-ZTypyO010p=to-cd8Q745DzSDXLGFw@mail.gmail.com>
 <CAMRc=MfsVWcoMC-dB-fdxy332h-ucUPTfEUMAnCt5L-q3zJxWg@mail.gmail.com>
 <82f94b54-82d1-49b9-badf-63d948b347fc@gmail.com> <97e1f121-9e84-4e63-9c9c-57e2de0b29d7@gmail.com>
In-Reply-To: <97e1f121-9e84-4e63-9c9c-57e2de0b29d7@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 29 Mar 2024 20:07:09 +0100
Message-ID: <CAMRc=McLJFGcy-A6PZNmjgDXnvx8z0J4k-Dbak-txvWnycHG2A@mail.gmail.com>
Subject: Re: [PATCH v9 00/13] firmware: qcom: qseecom: convert to using the TZ allocator
To: Maximilian Luz <luzmaximilian@gmail.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Elliot Berman <quic_eberman@quicinc.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Guru Das Srinagesh <quic_gurus@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>, 
	Alex Elder <elder@linaro.org>, Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 7:56=E2=80=AFPM Maximilian Luz <luzmaximilian@gmail=
.com> wrote:
>
>
>
> On 3/29/24 7:53 PM, Maximilian Luz wrote:
> > On 3/29/24 11:22 AM, Bartosz Golaszewski wrote:
> >> On Thu, Mar 28, 2024 at 7:55=E2=80=AFPM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:
> >>>
> >>> On Thu, Mar 28, 2024 at 5:50=E2=80=AFPM Maximilian Luz <luzmaximilian=
@gmail.com> wrote:
> >>>>
> >>>> If I understand correctly, it enters an atomic section in
> >>>> qcom_tzmem_alloc() and then tries to schedule somewhere down the lin=
e.
> >>>> So this shouldn't be qseecom specific.
> >>>>
> >>>> I should probably also say that I'm currently testing this on a patc=
hed
> >>>> v6.8 kernel, so there's a chance that it's my fault. However, as far=
 as
> >>>> I understand, it enters an atomic section in qcom_tzmem_alloc() and =
then
> >>>> later tries to expand the pool memory with dma_alloc_coherent(). Whi=
ch
> >>>> AFAIK is allowed to sleep with GFP_KERNEL (and I guess that that's t=
he
> >>>> issue here).
> >>>>
> >>>> I've also tried the shmem allocator option, but that seems to get st=
uck
> >>>> quite early at boot, before I even have usb-serial access to get any
> >>>> logs. If I can find some more time, I'll try to see if I can get som=
e
> >>>> useful output for that.
> >>>>
> >>>
> >>> Ah, I think it happens here:
> >>>
> >>> +       guard(spinlock_irqsave)(&pool->lock);
> >>> +
> >>> +again:
> >>> +       vaddr =3D gen_pool_alloc(pool->genpool, size);
> >>> +       if (!vaddr) {
> >>> +               if (qcom_tzmem_try_grow_pool(pool, size, gfp))
> >>> +                       goto again;
> >>>
> >>> We were called with GFP_KERNEL so this is what we pass on to
> >>> qcom_tzmem_try_grow_pool() but we're now holding the spinlock. I need
> >>> to revisit it. Thanks for the catch!
> >>>
> >>> Bart
> >>
> >> Can you try the following tree?
> >>
> >>      https://git.codelinaro.org/bartosz_golaszewski/linux.git
> >> topic/shm-bridge-v10
> >>
> >> gen_pool_alloc() and gen_pool_add_virt() can be used without external
> >> serialization. We only really need to protect the list of areas in the
> >> pool when adding a new element. We could possibly even use
> >> list_add_tail_rcu() as it updates the pointers atomically and go
> >> lockless.
> >
> > Thanks! That fixes the allocations for CONFIG_QCOM_TZMEM_MODE_GENERIC=
=3Dy.
> > Unfortunately, with the shmbridge mode it still gets stuck at boot (and
> > I haven't had the time to look into it yet).
> >
> > And for more bad news: It looks like the new allocator now fully expose=
s
> > a bug that I've been tracking down the last couple of days. In short,
> > uefisecapp doesn't seem to be happy when we split the allocations for
> > request and response into two, causing commands to fail. Instead it
> > wants a single buffer for both. Before, it seemed to be fairly sporadic
> > (likely because kzalloc in sequence just returned consecutive memory
> > almost all of the time) but now it's basically every call that fails.
> >
> > I have a fix for that almost ready and I'll likely post it in the next
> > hour. But that means that you'll probably have to rebase this series
> > on top of it...
>
> Forgot to mention: I tested it with the fix and this series, and that
> works.
>

Both with and without SHM bridge?

If so, please Cc me on the fix.

Bart

