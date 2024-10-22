Return-Path: <linux-arm-msm+bounces-35406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B099AA14A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 13:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 408C9283CB2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 11:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166D819B5B4;
	Tue, 22 Oct 2024 11:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="w3pkMXVB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DF2154426
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 11:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729597441; cv=none; b=WfmKtJh2y4CjS4+DKs/gdoXtMnj7D0w8wDUi5M4VJlSSGbdVhO2Vb0JqTjjbFxKIKcN2FZos7ocx79Nm+42JYug7d1xy9R22vlVdDtCHz1mWNiWNPDvYtNCTr2OihOx4thecuBfm2ertMaW3ez/QDsahvKGDc+A874oDHAlF/Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729597441; c=relaxed/simple;
	bh=eBU03LmBOctVGp3oQT568nIvHtsc4hRjT+IESSBuhGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BJU+37Nl6b0HF4sRlLeEshESnXMoY4QlcYxnX4pPsNX3Nu3fV9ioWx8AVwgsd5yb6dE/1XTgMphUNf9OKAnMhMNf2JTS+oqsDxjn34T2g7BW1XsRs2mBE357NWJbl6/iT8ArdVRqQoAiQ1Q547+kb9cC0bdYOjVEr4owqjhMel8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=w3pkMXVB; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb518014b9so47573501fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 04:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729597437; x=1730202237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBU03LmBOctVGp3oQT568nIvHtsc4hRjT+IESSBuhGY=;
        b=w3pkMXVBMOj8FFJsS1BfBAs6LPmi6Z5zx9/+7Td3p8ahd7GgOnAD6ftGnQRAryDK/x
         qKPAHLFHJzNpIBNGPPYNWqObSKIpYbBC4zkP/xWgmN3/KESuEiMxE+cZOc1rcw9lzNCV
         YdvC5mfrrpINcgRLf2cx6lzCoU6E2ZYNqjqiQF6TfTMEC0yQyQzx34sK3oyHvgC8bLF6
         tNBxRRq+57pviehJChEmgAzAjM+z2NE9RvtcAEWCvLDGZH71CJRB2wAqLQQMsPN9PpBX
         EuIh4EJPnc3KzCGZdq56LrtsTvLEwrWZGq5QYcdCqwtDfrxFW4sgBaCMZ4lbsEEFry5/
         z8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729597437; x=1730202237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBU03LmBOctVGp3oQT568nIvHtsc4hRjT+IESSBuhGY=;
        b=RkJFK1Lx4gODJNi0rwRTuV8jrgtogcA5LQbPySFvFKgeiXEE8juyqr7z1aB9TNSSu7
         LHvf9uU1a2IGqCQS9snnbiMnUZ6ykUw+jFJHZ0ekLzmhWueTWO4L0APC0l3CEfhih4qO
         JC/ZKUSiQoYKxvitm2RsRSvxIX+w8y736QHtjqFSb1Qii+ZZUY9gcgIJ8pALha+wBdlm
         axCnVV/X+M9DJHv1k7Yy0vxlVRC34Ja2FuJS+ZkO8sr8Dq8g+BDGd0pKsrBYwrY26tvz
         sbpOLCKqL3PKOVfJDYgNBvpVpfyMa8hQMF1cennB1YtzHy8QxH3aPUjJ2amdcvZYr77h
         hsyg==
X-Gm-Message-State: AOJu0YwnIFM0zmHHuYWbHNDWo47OXe3x99ww+SIqrEL4Z0Ww5Lx7lg5u
	PB5PDt7HibVgAd/78i2yHsx2DTdDG8/GAEZAVsjRWPXSj8rz60DXdWHwqZSOlEJz9mqVUR4OuBX
	xkZYXiDl/V2ezXqI+6ZGXbFrxRqmG7gQlRg5oRw==
X-Google-Smtp-Source: AGHT+IHv0JU0J9PGLy6ffpUD6D75+O0gIi950/5GHBOoWR6xI0HvKP8Mmi0qw9gOuB95udIKzZNZU/BQNe7LaDl6Z0M=
X-Received: by 2002:a05:6512:b01:b0:539:e776:71f2 with SMTP id
 2adb3069b0e04-53a154d04a7mr7743012e87.52.1729597437395; Tue, 22 Oct 2024
 04:43:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008160947.81045-1-brgl@bgdev.pl>
In-Reply-To: <20241008160947.81045-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 22 Oct 2024 13:43:45 +0200
Message-ID: <CAMRc=McL8DzSeiYm2C6f8NeyGFtZ6FZ2rycx8y2OrenNCEH7hQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: qup: use generic device property accessors
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 8, 2024 at 6:09=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There's no reason for this driver to use OF-specific property helpers.
> Drop the last one in favor of the generic variant and no longer include
> of.h.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

It's been two weeks. Ping?

Bart

