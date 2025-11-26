Return-Path: <linux-arm-msm+bounces-83445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D81E2C896F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 12:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96EB43B14D0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 11:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3100030170B;
	Wed, 26 Nov 2025 11:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B7gtE4Th"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 410811E5207
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 11:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764155174; cv=none; b=fS8HjQoU3GzBp7alscx4KxwF5w3Pd8Mz7JZcyu/YHf8U0tODHHmBG1d0J0J0G5KFf9z4W1ANs3Irb5JzbAEOA0Hw+sYRq4EniFsJ4eNEqrm6kbWxnVUeXApcMSoGGXfuuKPVP862HhyVvPv70G43WBbVF08yhJ0DYNiqv8HLCoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764155174; c=relaxed/simple;
	bh=2bIZIjS4HrmO7R9uzDSsHgXFV053PstE/sLYADP/ZlA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u0dWp4a9gqJfMSNqdlpcRPTxXwhcjp3omk4sDZJB+5tqzxYVm9BPk57kMDTgdFaRjX9hA+Bsq4dq1eyZt9EMG+ROW4vnuwmzskHk6GFSNWnI27yxxnuUiIOZO4/Z/Jbjy/L0Z/HuRDVT1Vdbj+Cfchwky17kDo8lqlRWqR6uI5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B7gtE4Th; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5959187c5a9so5293427e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 03:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764155169; x=1764759969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lz2Tsdt3UtcXOJMvCpZToro/2G6vjP28nuVWXusvERk=;
        b=B7gtE4ThioJXd0tP1IrVic+AxeusAEAcS3iuYN0cU0YdGggNp4b5N0XK/k0Nhqwmjk
         dLoCd3KxmF19/ls9dXPCuWrTsqV+tmFcbfPLsmrEq+TtaXUNrxN3f2UzKx8NFUu1zazH
         fPiD40CDH4tPngSaDRm91eduyMv0PDVhI5CYyveJOIV0TSO2Fm0qvhT+4poDL4CObozP
         uMvlJPBB68u944b6KPC7EshEACF47aKmOlelcmrhdqbt/zcrwz/18uxjNBJyXzA0s1nG
         pGtBxX7rS8W7ryOOFP87/38qLleilNrvlI4VmRQfMvOTvxudgi3X84gR9NCIcJt52ze9
         SXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764155169; x=1764759969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lz2Tsdt3UtcXOJMvCpZToro/2G6vjP28nuVWXusvERk=;
        b=Glu8yZKIYUCC+G61pXhhCz0Z0cQQzWyVpv/I2kPihQCh2BqXIGMVxCvfubLD1XZRiS
         nWle/31DSMPYfLIMFhfa4aBZn1EUbL1OeeCZCq/y65I+ImCEpW+PRiF5WuRIyKBfOmbT
         3nLsG163d7mMBRJ7/U5KZ+EQR8IyRx+dOEHVc3OhqQ3b6TDjojclbSOiYAH6rQrBUT7a
         /bx4qHugppqYEjILOw12GPFFzv6UvBPmLSmDrfB6MtvelDhnMwDH4iFM1Gq5ApxQV4rp
         wdRCAbNRM0VbR3TVghsTLlQ9MMnx34xaKAzWqnmj0Jw3MUhDiuvis7Z3z+e9f+Mah0Kx
         p2vA==
X-Forwarded-Encrypted: i=1; AJvYcCUwzUdjjlLa5O6eI1uh4smycmt6tWlpz0CYzPrZODfG7rHaOljUo/Kk/b7HN3vCV2WP2DZhZi/AIBecD1Ov@vger.kernel.org
X-Gm-Message-State: AOJu0YzPHlQQcQKWlebxe8b2YPe1uoITE51LA9s8tfbisxnocr13zAsS
	RjNSwvME/cZxraPOSMka8gx67lhu19fW5tQbsz8di6fI4H2mfUBGu5UAwBLjt4ICr1nCYlb0gzN
	7iK5AXZVHAHtFK9u4zhFL3UMtOgPCwmws8nxicb1hrQ==
X-Gm-Gg: ASbGncse/drtZl2t4TjssNBdkuSMzLeQ36royzdvt4oyO7w+Sz+Wn4yjsinLsCDDRM1
	J9YfxOE8l7xA29HgKA+DimulikVWn9p2jRE7tgSDuGkcnOtzMHT2PnqV3jlqZhjjIiJWKMKXjrM
	fSRLYxjRPEZYEG0CxfsSpc3at0Cwo0maGEYQqq3SJ8iGz+DdvRnjuRPMSGhq+D71ncnvpmDKnsZ
	73IpOmnSn84N49HN+43EbIJyDNqHeFzW7vHMX4peHMUfuLaeLPoo2KIrO2JGvsSYoaQPOBeW44+
	kM/I2tmxxhQMyd+NySDErOnBgx3GWBBzCfxFhQ==
X-Google-Smtp-Source: AGHT+IGi+XjKDYKdMYaNEz2loytks0cbhZsdm3MRuNtdJ1OW69fREkEouQw+A7ueTMLHwQgAPi4dSH8ZmI1nf3UNyIw=
X-Received: by 2002:a05:6512:104a:b0:595:90ee:f476 with SMTP id
 2adb3069b0e04-596a3edab46mr7870935e87.28.1764155169023; Wed, 26 Nov 2025
 03:06:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-reset-gpio-add-devlink-v1-1-a1909fef227b@linaro.org>
 <c478f7a0f3b91585618ec8e5ee57c5c4efd59f32.camel@pengutronix.de>
 <CAMRc=Mf7CMeZSUJLnteC9Xk5WvG_EKn3vx+jzcWNaWAvpvT00Q@mail.gmail.com> <ac9132249e594001801c2bbbc4245ff2e40c7a62.camel@pengutronix.de>
In-Reply-To: <ac9132249e594001801c2bbbc4245ff2e40c7a62.camel@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Nov 2025 12:05:55 +0100
X-Gm-Features: AWmQ_blpDO0Nz72Jem-BMA7OsiFWQMI_A-FiX2dE_bS8IDWiLp7IgmgFw-wAMpw
Message-ID: <CAMRc=MdA0e8=aFuy-zsbFJg+BcRGb23ZBqaMib1mi4r-iK85FQ@mail.gmail.com>
Subject: Re: [PATCH] reset: gpio: add a devlink between reset-gpio and its consumer
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Val Packett <val@packett.cool>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 11:38=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix=
.de> wrote:
>
> [...]
> > > > +     consumer =3D get_dev_from_fwnode(of_fwnode_handle(np));
> > >
> > > If called via __reset_control_get(), this just reconstructs the devic=
e
> > > from dev->of_node. I think it would be better to move the linking int=
o
> > > __reset_control_get() and use the passed in consumer device directly.
> > >
> >
> > That would affect all users, do we want this? In most cases they will
> > already have a link with different flags. I don't think this is
> > correct.
>
> Right. We could also pass an optional dev into __of_reset_control_get()
> and then just go
>
>         if (gpio_fallback)
>                 device_link_add(dev, rcdev->dev, DL_FLAG_STATELESS);
>
> at the end.

I think I'll do the conversion to fwnode first and see about adding
this next. I'm facing a different issue that may make it harder to use
devlinks in gpiolib-shared than I expected.

Let's leave this for now.

Bart

