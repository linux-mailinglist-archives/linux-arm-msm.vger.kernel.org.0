Return-Path: <linux-arm-msm+bounces-40146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3144B9E2D57
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 21:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB9322832F9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 20:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1D21205AB4;
	Tue,  3 Dec 2024 20:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WEJrD98M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BAB1F12FF
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 20:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733258401; cv=none; b=Jem/eFo8Nls9SFR06DEv+2cIsh/HIh+7r1oGwn92GpH2TpWsOmk+63fgt28w47ynE279P3nZx2kvk6UYaM447dCIuLHxqWb+r7giVrpU/daZWrdexO4D2yq9Y6GYq5uOk1Pneo3txCFzs3sD1fgHsXGgbQTOPjirP8HHFJypOGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733258401; c=relaxed/simple;
	bh=oGoSypF6Nb9qJ7rrwxSTT3DF21fkJ5FrknVtmVX7pUg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SvnEXw340zsLWnrnZCzGvFVXFiah/lK5gdnPwIzpI0ESdmcH4AVpZxwxeqmzk1X+zYlm8+wFv7vQKHM6lvqRR7JG+UJ0rKrMNroDHk/X7aLWRLgetxQynJ9KepXBHxqLlbQuptxJI93bc7ycrHv7A1UBph3xIPfkwrFnFUkwPN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WEJrD98M; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53df1e0641fso6763964e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 12:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733258398; x=1733863198; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGoSypF6Nb9qJ7rrwxSTT3DF21fkJ5FrknVtmVX7pUg=;
        b=WEJrD98MrzvxFAI0/0QJ4+9fmwYrgmGJSzu8lc0EtlmhbsfOQNC8Z/jivFQSPgJuZa
         fP7tyRiCnBDxzIPhQNs+f+SLsss22qIDAWhXnNHWdI/JXFhNiP7AMywEqn5veU5IZy7K
         j6VEiAwfpAGczd+jRTxkLimg4CLn0iAkVIkuTxAdm3T8OFxD8yP54jq5kovLDz8Fiw4G
         3k/rivSEDqqNeAzqouKJLvnTYVoqOz3xIgQeuYeTIEzqVHGbMfObmVbWAAOrZOQtXo7u
         ldvff4jv/YPiHihNTHGXnTKvPjwIV8FWy3obqC9+tXwGMKrDxt2i1NXbcpzEh8J4bYW3
         GCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733258398; x=1733863198;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGoSypF6Nb9qJ7rrwxSTT3DF21fkJ5FrknVtmVX7pUg=;
        b=S1i7dXma05ng1nQ8YhDKkt2yw03Ee+uXIgXcjxV5el+SCoHp/LIwT1q149NL2Hf/TX
         2dO4Evwx5X6lRe53qbrumQFgkFSDcdunPjzrUbW6g668EZVo7bZmSY/T8iupF+gdAT56
         uiXtjWwQm/bzNbTfKGq7k2ZocbUJ1Qk29v2XJpH6Xz41uNl9TlQpVFmT5KPLYlX+KcLS
         S68q2WWVtlTRxqxruAbqHtt1NMcbDONLXrMtIWoVuwW7LVfzmOq3zqqrRMrFMNXSD+jk
         FPtRhyUt9k4pzsI7HuTAY+lTVZ2UI6g9JLiLcHjmn/TzZYxzPgMDCTTcYFeYZf3fXGba
         Nsew==
X-Forwarded-Encrypted: i=1; AJvYcCVi844AfzqdpSsiZg1NXuia0jvXrKnqaaTGWRmq0MoW70IiupxPeYXTaRx77S7j/buu7kASce6Mk86gTsMU@vger.kernel.org
X-Gm-Message-State: AOJu0YxAxnO8glgl/+EMLn9kxJyNR+JVD7vyhMfzAW4oZ/eklWhdLDMw
	6L+fElLX5OYNGOoa0FJwGuo/Bbojia8v58hMTNUrYAc61YvO+vEBObg6qlZB9/1wHd3+GFES1p1
	XV1NA04tbLWGA7aCX6BRt+hH4suYISEyFcO2oKLAQspBa0d78H78=
X-Gm-Gg: ASbGncsSU0QtDTycM0iPrNeysMbbMEqo2xdeuoxx+XNg/gSjciRP/bxDExVX7ugWmVT
	n7qt37z64X4am5hFwws4MnIig2riRenw=
X-Google-Smtp-Source: AGHT+IHs2kOoD67qnZoGYzGcGvII8H8UKDPSFKPhN1JA8u+CpxL+jZyLKT7Qu/Y07T3Md+eJ+XvBG6AUCbksUWPiZUI=
X-Received: by 2002:ac2:5ed1:0:b0:53e:12a6:af08 with SMTP id
 2adb3069b0e04-53e12a6af7amr1577595e87.12.1733258398039; Tue, 03 Dec 2024
 12:39:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203-crypto-qce-refactor-v1-0-c5901d2dd45c@linaro.org>
 <20241203-crypto-qce-refactor-v1-4-c5901d2dd45c@linaro.org> <Z09OX3vnMC8bB6LG@linaro.org>
In-Reply-To: <Z09OX3vnMC8bB6LG@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Dec 2024 21:39:47 +0100
Message-ID: <CAMRc=MeMK-=-qk+tmKpJXk7v-wCA4ZG1rMPH2NThp0stveSBjg@mail.gmail.com>
Subject: Re: [PATCH 4/9] crypto: qce - shrink code with devres clk helpers
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 7:32=E2=80=AFPM Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Tue, Dec 03, 2024 at 10:19:32AM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use devm_clk_get_optional_enabled() to avoid having to enable the clock=
s
> > separately as well as putting the clocks in error path and the remove()
> > callback.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> FWIW: Ideally, the driver shouldn't keep on the clock all the time in
> the first place, since this will prevent reaching deeper low power
> states. So while this cleanup is nice, I think it will have to be
> reverted again once someone fixes that.
>
> If you're working on refactoring this rarely cared for driver, is there
> any chance you could add some form of runtime PM while you're at it? :-)
>

Sure, I will most likely be doing more work on this in the future, I
can think about it. This patch was about code shrink, not functional
changes so I prefer to keep it as is.

Bart

