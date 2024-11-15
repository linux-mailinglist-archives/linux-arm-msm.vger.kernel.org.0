Return-Path: <linux-arm-msm+bounces-37950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF41D9CD707
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 07:23:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 882631F217F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 06:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80A131865EA;
	Fri, 15 Nov 2024 06:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bpaXvYwt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DAE18593B
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 06:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731651816; cv=none; b=hFqWNz23FSeBwuvxQsNdhhCbCN5IdzoIZSF18jdGjapUxH8epsB+0M6kWxWnLoR+UTG+DKqLL1+onQFoNt/lpeFk518AKAgO7qoHCn2EiBrbSZl2CJtQQqN3k1nJPYUBdAmc1vDJGVf/O6s0FJGMJbzYTmLP33XNz74hYF76QsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731651816; c=relaxed/simple;
	bh=HDIsR4fluZYtTeIoaii/gTwhxDf8U6dUROcngneS9PQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcxW+Oj+AlPoChvNtqfOvEqGynLBmC5tOJO5B8Q544C+gNH+9uRstTRWaJ8uWhxMZylhdxqUuYfkSsiRJdFTvHl0vTT8j+yavid0TiirxpsxlEyF1q2NdlHQE/r45WW4BbmQPw2WFE9uR/a34oc1l7TyEb+wGGZ55zRk7h24+Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bpaXvYwt; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53da5a27771so1575605e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 22:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1731651813; x=1732256613; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/chBSo/Ph0swDkMZqbxpKHgwAyER7f2Ug328BGT3Kc=;
        b=bpaXvYwtrUXLp2d1NuJjviVWYWVK78XI0EFqhwmVqMvR2cCU3tzm+QU8ledHQjQhu2
         V4XaYYHEemgJQ8t5JdHD+GH25M7UHi1RUC9EGNMY+/V6ncT3NG2joGt2x6DTgBcQm6j1
         uBvUF/QFhVA1SyCFRs7hQTXVO3BbO5hkudLujn0Of8rJB7VpB5E30Xx3vTLddxP7/pHf
         qDbfoySw/9FxfAF4xgXHwgAJkNy69/iIUYtO9KUSZ8Upsb+Ls9E9BegNLPjy+7Zlneri
         JbVOcIUxWsbXRheiKDgKykivLITIkpHt5PlwFxoVbJVxQYw0ZJN0KUjCdu+AF42m59Aj
         kilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731651813; x=1732256613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z/chBSo/Ph0swDkMZqbxpKHgwAyER7f2Ug328BGT3Kc=;
        b=d97AOYuHUyOMmm/wl6yBh3/am5F0Ejy7SLcry07ggMWflMVl+u0gvmNkA3yGkPDajZ
         3AvCyuNYVFhiYlBufDL8d0EUFp2MIGddcnt+pe+rF0IDFE1m3RkUbPPRdUHcVsiFC07X
         p9cB6/xhYJqWGULzEU/BZ+FcjQ/zRTCBIe8e6Wzh98iaroi5FEMMQxZEzYmIa1Y7u74n
         F6uv318syAgHxB83RYdHzbr03hVJmeD6YbfwqB5Cy07/Kj6sGIdbCkRxvhnOew/hhMjv
         wwX9jmioWtGtYnTn8wozb1pDsDSnVAlmS3+5CHSHRUJjBpo9kUg5h2gz5CFrGL46HTwr
         FJjA==
X-Forwarded-Encrypted: i=1; AJvYcCXdlTakk5gJEwyLHqljEcFtl2NaY1XrE/LPeQ4OuqwdygjPlBiRpRgWyslTjK+tBnPmHXYRjEb7NlSUH/o/@vger.kernel.org
X-Gm-Message-State: AOJu0YywavcP+63T2JywP3vrLJtkl1heDKuAY7eSBEadJzbDkb6wK/Cj
	knAcudsQ405upp5msGHCwIQlZMgXfdeHOqfIqdYRAYojj69a6hVWIb+kT41PpIrMZdJ9FzLxF2d
	9+BgkecRtsCh5LMVu3BQkDzOygbT7pii6Cs6jSg==
X-Google-Smtp-Source: AGHT+IFCglpifdMxdVcqfiIEjCrQDyKPs0b3O4KUOnVgdSPNxABQK4FbRhYOa9ftpiAuv6TIl0kyBRGahAttwj1uxy8=
X-Received: by 2002:a05:6512:239f:b0:536:9f02:17b4 with SMTP id
 2adb3069b0e04-53dab2b3c51mr433886e87.40.1731651812466; Thu, 14 Nov 2024
 22:23:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008160947.81045-1-brgl@bgdev.pl> <173151232541.92239.8233789832026323394.b4-ty@linaro.org>
 <yce7vswjat2bhda2l4c4ji4idtozo24c7tbmpahz56tmedmpw7@fn2h2t4hv7dd>
In-Reply-To: <yce7vswjat2bhda2l4c4ji4idtozo24c7tbmpahz56tmedmpw7@fn2h2t4hv7dd>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Nov 2024 07:23:21 +0100
Message-ID: <CAMRc=Mdt0D4L17St06nn=mCuObG=e3btf42NHfsuTEOQepB6bQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: qup: use generic device property accessors
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 14, 2024 at 11:52=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, Nov 13, 2024 at 04:39:23PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> >
> > On Tue, 08 Oct 2024 18:09:47 +0200, Bartosz Golaszewski wrote:
> > > There's no reason for this driver to use OF-specific property helpers=
.
> > > Drop the last one in favor of the generic variant and no longer inclu=
de
> > > of.h.
> > >
> > >
> >
> > Applied, to the GPIO tree as the maintainer has been unresposive for tw=
o
> > months and the change is trivial.
> >
> > [1/1] i2c: qup: use generic device property accessors
> >       commit: 400913bd4edd76ef1775bfd95543846bd6f5ed71
>
> I think it's a bad idea to pull unrelated patches just because you have
> a GPIO tree.
>

I know. I dropped it. But I have no idea what the recourse is if you
have reviewed trivial refactorings that get stuck on the list forever
because the maintainer whose address otherwise doesn't bounce and who
is active on the list just chooses not to respond for weeks. There
don't seem to be written rules on this.

Greg: Can you take it instead?

Bart

