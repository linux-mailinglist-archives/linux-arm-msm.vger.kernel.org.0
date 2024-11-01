Return-Path: <linux-arm-msm+bounces-36751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0B19B92FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 15:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658741F20F63
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 14:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16FD028FC;
	Fri,  1 Nov 2024 14:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2Z4NhUY5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9B53BBE5
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730470838; cv=none; b=WdT8iq17MQDTlsQ1WjVFU10AIOy9klYhng8rBw123hYCK+MyD6gX5FdIFDzXQeMuGcrWLqZRFMW8A7kJdKcP1s1JQQH3KQD/+iazo6n3fRnzcCujxR7oDuyEusx1A832UJpvXCD5KLkup7e7VU3cd5FzkY5aYBrbRGtcLpYnkxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730470838; c=relaxed/simple;
	bh=SpczMR6nx/oWPuZT5o6+BrOM5WEoNQKWg1cEOXxRN1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dPWcX//IriDtvNJ9LKH5M7QA+Moyu93Db///SxaBwUyzY3WlPd+CkWmcKJ9nditM1FwuwoOwXcY8PSyc0SI3AMPJUNkGtCkRPy8Tw2wal6PApvqseU0twekR574+xUEVw2kcIqC1T7vUraCqQYu7xm3059EO8RY5aiueN6T7fOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2Z4NhUY5; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso29782931fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 07:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730470834; x=1731075634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpczMR6nx/oWPuZT5o6+BrOM5WEoNQKWg1cEOXxRN1I=;
        b=2Z4NhUY53Lmil8ahX2WMKh7JnMY6kswwwQr+OXd7iWL3qgah9cJYqWRZVZl3MaTAIN
         MW9Mc5ePud6bJZwuWcmX/ktYghOEbyZWR0WKPwuTDbhM82yQpzaR40RRMLh4RzAzXC3B
         NQYQEN5QgaumydnImSVgF8q76dUKDhwLEMKeJXFaoS+Diopz42ybO9ALMjd8WrT0KCY+
         FS5RVr43qHoqbLQqNDtNkh9Vdbs17nJVvphNG/9UnPJql5gy4e6G+JVxpvHeEmfaKT5E
         /e0FB30zhPTDu9l7b9/dDsmXE+umlnfg75ZbsSfBOIYotTyrGCCcjbdEtSb2xRc+NK44
         rWoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730470834; x=1731075634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SpczMR6nx/oWPuZT5o6+BrOM5WEoNQKWg1cEOXxRN1I=;
        b=pz6AROlMnsynwLFXZY4xV5fZGxNH63bGrL6LLt3go47+z35KMXqBvP3zwJCSvCA06S
         htVhCDamMFzqaxlkPmpEDB7KJ9qrcKmkmACg49Dnunplx60uwBv8Ki1b9mfDuqEIh88b
         d03YkFT+NS/4cXGOYukgw/Hb4xSt1yhzz3cCw2AEo4F3oh31kY6wKc35+ZecgdLpHEN5
         YN0h+4FwSIciuZ72P35HxrBUgsGA88zmndC18luyvsNiwb41b9/JX2E1P/bNqezWlck1
         YrSd6m6Bw3GjPpnaZwgjc+eaoz/OiZ5wd5PlvAgZZxCfw6KVgcGN92CarNe2K84ImvNN
         2eEg==
X-Gm-Message-State: AOJu0Yz3zwUMFFUxBgWG8ZwFUaGnzUMc2d2fY6Dv4r76aSgS6m95gRJz
	gsu/Sq4Lwh2heoxTJt4jNylhEa7KjhgiQ843IMD4YRUw6d0o/rhrjzg/+imE011lhkaXrJvnXIp
	ka75ewyGt9qj/WiUNDiue5YEJMKqIgbS7Z50+Oo8Z4jKV+INk
X-Google-Smtp-Source: AGHT+IF2TM3oiIogWGwTtPTIHeQw0ihU8hZ8YlPTABHC0UPMTqspAY5qIJMjN3x5nVciOTAOj5hnvbrzPN/BlAYo8DQ=
X-Received: by 2002:a05:651c:19a5:b0:2fa:de13:5c34 with SMTP id
 38308e7fff4ca-2fedb7c7ad4mr31067371fa.19.1730470834049; Fri, 01 Nov 2024
 07:20:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241008160947.81045-1-brgl@bgdev.pl> <55ecee09-196a-4c7a-b7cf-61c19737735b@linaro.org>
 <CAMRc=MeTgFaySBFya2e=CYnrXL6R7s9D1DRq+RxKcsf56xMc+g@mail.gmail.com>
In-Reply-To: <CAMRc=MeTgFaySBFya2e=CYnrXL6R7s9D1DRq+RxKcsf56xMc+g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 1 Nov 2024 15:20:22 +0100
Message-ID: <CAMRc=MdVUtff7wLV7mxsoXEBY7pUvULuJH1GvJCJgCRj0OpCBg@mail.gmail.com>
Subject: Re: [PATCH] i2c: qup: use generic device property accessors
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 10:04=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> On Tue, Oct 22, 2024 at 2:05=E2=80=AFPM <neil.armstrong@linaro.org> wrote=
:
> >
> > On 08/10/2024 18:09, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > There's no reason for this driver to use OF-specific property helpers=
.
> > > Drop the last one in favor of the generic variant and no longer inclu=
de
> > > of.h.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > LGTM
> >
> > Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>
> Andi, can you pick this up, please?
>
> Bart

Any reason why this simple change cannot be picked up?

Bartosz

