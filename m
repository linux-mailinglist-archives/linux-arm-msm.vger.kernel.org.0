Return-Path: <linux-arm-msm+bounces-45591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B157A16DB3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 14:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94E977A28BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 13:46:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD1CA372;
	Mon, 20 Jan 2025 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="glF0BiAO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0DB1DFD8
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 13:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737380816; cv=none; b=HxBcs8Z5Qk3hBT1Fg0p9/YB9KSfov6zmBtixeUtSODZFmTPLIlcMYpQnfT4VzmjQuUjDobAQS0cmrGNwGAXoHZ3w4wf5/kcTAXAcc7MIFK8DVb7EQFcXDP/GHxzepZNChPj2BOSmNZBEphTH/sX4NUpvXcFu1qlqCW4zOuNPZig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737380816; c=relaxed/simple;
	bh=vdaZayPM67nF/4Tn0WCZcfScGglX0NHRO8C3emddbL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DdQTY6MuZgTVv7thOB9JT6kkBQvtStdPyUiC3jrX62O7/ioWhqQ+YUyfyGmDvWa5F4mnKIR2VgGcSarPze5H/52yrq/4uqspy0GgDiHpv5/1peJyMFtEBKrcOOuBt3O10v1QmdQLiiUdy/xjT5SWvUYDScH3lWqmiaAa90tZj2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=glF0BiAO; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3061f1e534bso44863641fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 05:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1737380813; x=1737985613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O7uWym8aviUECTT7NP343rKz7l6AiGEcMJ6zJloUFKk=;
        b=glF0BiAOrO09M02qRo93wBo2eSSg925tV8xA011LlxTUkk4hS/8DkLMvp+a+B9pVHj
         rxsJpc4NPsPhyUud+srxrdSIGoJmak0gzqFdVB5cyGiBrPKrGGcyvO1xdo5/ouhgaV2T
         ui42LVJBOHSx9sjxtiunxtQmF4B6OtZmwipO9l8OmYFC/wyY3rDNCj4cEYC0Po2bS7kP
         YPwlKRXThhSyEluIkeSe7Xg/dzUqNHF/Ia3U3KcameXlWFV4xgPDvP6Pdt2SMUzDPldt
         Oh1Z1zU3B6Xcy9Sfd3zitpDCwOlWADKsdOES5rKaJGHhJEud0aueLDsOqZ+Z9LiVUdSo
         P3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737380813; x=1737985613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O7uWym8aviUECTT7NP343rKz7l6AiGEcMJ6zJloUFKk=;
        b=igH3fEds7S44NN149pFWdFQMxjdjE0juDKEzByc5c0CxrOp2SNGBHwSKy2AW/Raz6V
         Q1wmouWZRPrLw1tvExL0u5FX9JYfR2KLCkcSxUWQJA148RY8RbLPzHxoNO4NOiSKPAG4
         rFOvEfnbXZe2M/Ai2kKPNaOroMbVhGdWn+cgzd8TBtmBdITBKxGjphhTFBRRirVtjKN/
         F/qWPNjLeyWTICDmCjSJcjWv0+T1+2dL85Vhjt1od9D9UPYPY7u9DkuPORQgJWJI2dzB
         jV88XlY2AcwMgw4/oDrmqQ1wMRHUwD2/ypwHSXchWTvHzs4tbWJ2DsGhNpaWmOdJAsOv
         Wfiw==
X-Forwarded-Encrypted: i=1; AJvYcCVXyRhKIlnPu5Po6rNbjXYnLUDdnGzMX4uHt1jNJDuHkkVFDsIvD2/quZZZfGnB3jkJphWwreq+gf/spgKC@vger.kernel.org
X-Gm-Message-State: AOJu0YwNeP4Hgin9rnZquc/0h95Mh8Qr3rb6Bx9kvpZJVcebNynbO0Xg
	tj3k++63b+jp84WSJ6zOYauJ5PhI+JYEyPF4QKSGiy6gAsLTMOtvnr889K5CyNSfvanfnU9vCqe
	jqvvn0rNCIBVjrZPvmnH+XriFOgDNlT3cQhvZcg==
X-Gm-Gg: ASbGncvmRaPOYD4ZpjhvHUQz3IxzSiDOnz0Zob2AHzL+4owteUuBXmDEWFDzPEBOjXd
	j/2p+h7So7SQ/L1LLaJoPXJ+x055LFyrP+vh0oJ9URRHjvEPMoshu40rM20yKdvx7OyBqXHcPdg
	TkLqWzyew=
X-Google-Smtp-Source: AGHT+IGQFrCMm8vyRK8vl4hzwtqFf/36t7jhpPxV0M0zp0y+Zz7oKVbBwOYsm8AIgJwc3bHgZHJIcWkIRU9kVfObBko=
X-Received: by 2002:a2e:8e76:0:b0:2ff:c67f:5197 with SMTP id
 38308e7fff4ca-3072ca6a6bfmr38519261fa.13.1737380812745; Mon, 20 Jan 2025
 05:46:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
 <20241203-crypto-qce-refactor-v1-9-c5901d2dd45c@linaro.org>
 <d6220576-eaf5-4415-b25f-b5984255ab78@linaro.org> <CAMRc=MevaM4tUNQUs_LjFYaUtDH=YqE-t2gBponGqtK5xE9Gpw@mail.gmail.com>
 <20250118080604.GA721573@sol.localdomain> <CAMRc=MeFMYzMY4pU9D6fEpg9bQuuzqg4rQhBU8=z_2eMU+Py-g@mail.gmail.com>
 <20250118175502.GA66612@sol.localdomain>
In-Reply-To: <20250118175502.GA66612@sol.localdomain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 20 Jan 2025 14:46:41 +0100
X-Gm-Features: AbW1kvadA5qf4pLYrGVbYIj86oGONAxbZ9gOjq4aNXiA4bcW9hoyMMQqNC0e_GE
Message-ID: <CAMRc=MdR-8AnwAsMzHn8zj2awZUumO32C_S1-CkjBEqbuKPdeg@mail.gmail.com>
Subject: Re: [PATCH 9/9] crypto: qce - switch to using a mutex
To: Eric Biggers <ebiggers@kernel.org>
Cc: neil.armstrong@linaro.org, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Stanimir Varbanov <svarbanov@mm-sol.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 18, 2025 at 6:55=E2=80=AFPM Eric Biggers <ebiggers@kernel.org> =
wrote:
>
> On Sat, Jan 18, 2025 at 10:28:26AM +0100, Bartosz Golaszewski wrote:
> > I was testing with kcapi-speed and cryptsetup benchmark. I've never
> > seen any errors.
> >
> > Is this after my changes only or did it exist before? You're testing
> > with the tcrypt module? How are you inserting it exactly? What params?
>
> Those are all benchmarks, not tests.  The tests run at registration time =
if you
> just enable the kconfig options for them:
>
>     # CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
>     CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=3Dy
>
> The test failures and KASAN error occur on mainline too, so yes they occu=
r
> before your patchset too.
>
> > >
> > > I personally still struggle to understand how this driver could plaus=
ibly be
> > > useful when the software crypto has no issues, is much faster, and is=
 much
> > > better tested.  What is motivating having this driver in the kernel?
> >
> > We want to use it in conjunction with the upcoming scminvoke (for
> > loading TAs and invoking objects - used to program the keys into the
> > QCE) to support the DRM use-case for decrypting streaming data inside
> > secure buffers upstream.
>
> Notably lacking is any claim that any of the current features of the driv=
er are
> actually useful.
>

Noted. I'm still quite early into working on the upstream-bound code
supporting the streaming use-case but I will consider a proposal to
remove existing features that are better provided by ARM CE.

Thanks,
Bartosz

