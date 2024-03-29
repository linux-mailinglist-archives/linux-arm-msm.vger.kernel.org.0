Return-Path: <linux-arm-msm+bounces-15684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8348916AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 11:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBC781C216F7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 10:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAB252F89;
	Fri, 29 Mar 2024 10:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="D5nmmMwQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E4A39FD1
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 10:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711707737; cv=none; b=cvfpLSnY3nRRdBcEXsvhp7eW6Pst65MbOC/Du0B/iwhWgMZvbFFq+vvimjTRS0143mmqbWATcBYV/CeTJPjUbKDZtqJec1+AsA9THi7I3h06lUAJ7aCuj03Jo8FnZ96ICwpRDE/iE4zXdMCf2hsE9sRHa8U5FNcEwwRi8AzOXqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711707737; c=relaxed/simple;
	bh=5iGLeKg1B+c+xy7usHfD7DuolFxdePCGQGv5moChJAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=POJdbvkQrbZRKOu3LArM2pvl2+ftUcOsKNLhZCXShH4jmKfb/iWRSJPCklgFiJAlCevBFWNPCX8yMQocxcvKdu8rUR6XzoIIPNXe+GP2imjpOUUM+sBkLAR+BFqNo96vEbmdmNo7I5P6waoKBveOT7s7Ws3jpAiYfi0FqcMHCGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=D5nmmMwQ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-515d44d2101so38906e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711707733; x=1712312533; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/J6gP3oWZ32r+n62bhK72ncVvhRHUkReUApoR4TBfF0=;
        b=D5nmmMwQBHIiDlqLVRDTEsQLdm1ly5ZHftIyHaPe8srZRdnuGX+n96g8iKxNVrUFeD
         0g0R55AGwWIXOppIRnwfxG8n5FLVIWRTeHPOAhU7WmD6LCUDf37VdquWLcfTTf09e3pi
         YTXapUgA0utZLEpAzs2ol+4mKyjSA2FGcUtqSBHE3kST0wv0y0Mo/ShyZTBgi9OUZaN3
         OZsjSFr3EY8qICdJq6zkAGq0W37g2CylDcFM+jbq0eN4X9lkeHLm5f0dqtDIFKygBnm1
         RFyK/C0b2RTdWcErBeKUQl0KCj8hCa46piyyHkjYw4yW/NGQm+TZf1Rf6RuS5CqBqToc
         lVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711707733; x=1712312533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/J6gP3oWZ32r+n62bhK72ncVvhRHUkReUApoR4TBfF0=;
        b=J9DVyF7tftEnfmBZxDeaQhgW+1Lv1V98gUbXCRJbf4JxJ1i+qfJLs2E1oybAJM7vPH
         6xPfe92WTLzcxEeHe9s56/ChLKUGt3DNe17SW4kDk1md7avKX6HWFGycaygM4oG+vjxf
         59ppBg3XtadotCH311u7cWweHbLLaKOAlz8Q5kSWV09OvTj3vBsy4Q6yoQ5AGYsoPcBn
         SuG7AnRa9WGvMTG/VZwsd+KCXEfuGWRadppl0Z5mxLA6+z3/uGdNyqAAqG2Sk2RI1LyA
         fmNZGfvN7OBsqV6ZtScBG79yqur9pry/9zUEA8hdM8A5uBv4k1kdodtSVkxqgYxWcIUy
         83lg==
X-Forwarded-Encrypted: i=1; AJvYcCUu1BW+YLAO7AXGsD+X07E7NgvGQdZbprhVfHlTIPs/NQzoPsPofTkp5n/pDtEbgsnNXYdS2O6qtpqMIIBqlisXxJIkmjnc1oXRijEZGQ==
X-Gm-Message-State: AOJu0Yy+1gwMgyJjiVIr1PTODHT7PL8NUd53p/0bfMk/kwvnEfzx59/2
	79UTNtyHFjXWwpIC0qLMSavl2AWf30NeX9hZdV4nGqHtVnWfz3j2p4CpwNX4xzM4gkUD6MG9vne
	XnXCwkF38YyY7p7X6x9pxwP5nXCeDsOaeyl4vsA==
X-Google-Smtp-Source: AGHT+IFR4sAXfJH8jLEP1t7TjlkcUZ9XMDWJPhv7FUv8k9zXllRTrbpTxelFPbzAnEHArC8D9K4FgriWWJSfYZnh8xk=
X-Received: by 2002:a05:6512:6cd:b0:513:5e6b:a191 with SMTP id
 u13-20020a05651206cd00b005135e6ba191mr1439757lff.50.1711707733433; Fri, 29
 Mar 2024 03:22:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325100359.17001-1-brgl@bgdev.pl> <56e1c63a-4c09-4d92-9ef2-aad5390879cc@gmail.com>
 <CAMRc=Mf_pvrh2VMfTVE-ZTypyO010p=to-cd8Q745DzSDXLGFw@mail.gmail.com>
In-Reply-To: <CAMRc=Mf_pvrh2VMfTVE-ZTypyO010p=to-cd8Q745DzSDXLGFw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 29 Mar 2024 11:22:02 +0100
Message-ID: <CAMRc=MfsVWcoMC-dB-fdxy332h-ucUPTfEUMAnCt5L-q3zJxWg@mail.gmail.com>
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

On Thu, Mar 28, 2024 at 7:55=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Thu, Mar 28, 2024 at 5:50=E2=80=AFPM Maximilian Luz <luzmaximilian@gma=
il.com> wrote:
> >
> > If I understand correctly, it enters an atomic section in
> > qcom_tzmem_alloc() and then tries to schedule somewhere down the line.
> > So this shouldn't be qseecom specific.
> >
> > I should probably also say that I'm currently testing this on a patched
> > v6.8 kernel, so there's a chance that it's my fault. However, as far as
> > I understand, it enters an atomic section in qcom_tzmem_alloc() and the=
n
> > later tries to expand the pool memory with dma_alloc_coherent(). Which
> > AFAIK is allowed to sleep with GFP_KERNEL (and I guess that that's the
> > issue here).
> >
> > I've also tried the shmem allocator option, but that seems to get stuck
> > quite early at boot, before I even have usb-serial access to get any
> > logs. If I can find some more time, I'll try to see if I can get some
> > useful output for that.
> >
>
> Ah, I think it happens here:
>
> +       guard(spinlock_irqsave)(&pool->lock);
> +
> +again:
> +       vaddr =3D gen_pool_alloc(pool->genpool, size);
> +       if (!vaddr) {
> +               if (qcom_tzmem_try_grow_pool(pool, size, gfp))
> +                       goto again;
>
> We were called with GFP_KERNEL so this is what we pass on to
> qcom_tzmem_try_grow_pool() but we're now holding the spinlock. I need
> to revisit it. Thanks for the catch!
>
> Bart

Can you try the following tree?

    https://git.codelinaro.org/bartosz_golaszewski/linux.git
topic/shm-bridge-v10

gen_pool_alloc() and gen_pool_add_virt() can be used without external
serialization. We only really need to protect the list of areas in the
pool when adding a new element. We could possibly even use
list_add_tail_rcu() as it updates the pointers atomically and go
lockless.

Bart

