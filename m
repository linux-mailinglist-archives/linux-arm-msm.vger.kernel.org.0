Return-Path: <linux-arm-msm+bounces-64711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F42B0303A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 10:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 517637B29EF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jul 2025 08:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EA1B254873;
	Sun, 13 Jul 2025 08:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xbxAcRYU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8C022A4CC
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 08:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752396207; cv=none; b=Kp3gdp7c/qPg6zhZ6gaWFPwmgLOg7hn+ix7LwVZYM6VQDtIrcmmOZBbpzKBNRf7RyyxGQBIJgQ3rF9HOlEHDG1J+cmFF5vBtLe+/KvOIjXhs8aF7ZHYSKUov0h+ShObvzBZ2UrFzOJF7K3auClHi7Q7Qj3hkmB788r68atcsGc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752396207; c=relaxed/simple;
	bh=teFEt5VYoV+y5Dd7IIHlSpW2pgBGTG1QedDMUy1wx8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTJNDgpSwmrQ8WiPIvdalZevsrpUcV+e2J34B3UWk5yVqK69UtJaARzpW6Qxv0Fn1uaDBum4TkVuQCPs/7jP5xGWbuNKyBYsXG4LMmD7xb/P5Bgwp0wYcqAcLoBN0UFSvESekASMEnVh4lm2S2aVwAUk0gF+a9MR1/EQvbaEYcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xbxAcRYU; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5562838ce68so3153637e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Jul 2025 01:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752396204; x=1753001004; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=teFEt5VYoV+y5Dd7IIHlSpW2pgBGTG1QedDMUy1wx8U=;
        b=xbxAcRYUidJVofzk3N9o884D0j/xmj+1Mntya2TAmL5rMyomrvxwJYe8GFF9QKNOyZ
         aQm2gAUmEih5QTagIMA8js6hCnpRco1TlffNb8gj8FayfHQPFfTNyCjjcdys2QPf3rzU
         vn2qkQnvFTeeR+p8NjRiWsbcItVACaTrshEo9DgFf78b/Mm1irZ11p4QoJvtnXHT7EEU
         H+XN30jyWGbDDDfnZtlhZCjjV6OumnoxLLDHMfUOywy/A0AYdcypMslyi1WoLXqtQyvH
         /w4BBM+XMlPz8rvOi28k43tNGgtElv7T4G+rCLF1osJbtqnjhPa6efNGPsggMiVwKATG
         2cPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752396204; x=1753001004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teFEt5VYoV+y5Dd7IIHlSpW2pgBGTG1QedDMUy1wx8U=;
        b=hnOjLP07GOVLXb+xXsK7eLpRY2n3KrV1zUtuVfTSI2fXIaCX1Xn5aMwrMjuqG6oEE9
         151LHJzkqIRnDp+iVuMArZFZeC4qURqOY0FQzgNTuVHMHWvUP3pxQUNBbZ7my34MovCL
         D6MAL1KV4LVChcoiRoD05vkotbVngijBNih8sSPG+HGGddBQEIxaCCPaTYYyLGw7Mjjl
         coSQJNopDEUSamtI77/pRMOE4FRxSgW9WboV2XFuwEidfuptgUelhABt0Ani3aRYNFi6
         TWT4XpbgkDpTzOVA+FkaUzLpg2WkwWCqLx9dtEYLA7sQzLlPa59sT+ahVJxzQ/PwPa9s
         bEwg==
X-Forwarded-Encrypted: i=1; AJvYcCWlZ0oMpU+IQ7luBzyWZrPTWQeOIv4oNPOjI9iA+WEttea/0/BFjbyIBePt4qn2sSpNPaWArBaMuCghXbbi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3UNWMspj7lxESIOtI8XFjy2WcxNhv7gL2HLcaDt4sd3h1hiaf
	j/MFw/0EQa0RoLG3B8lUqOJg38qEipTSTe/nvKlsWzvdZGEDfNpGnfh5si+93GLDfbYFmI3kFPk
	xV5fXfuYsU/LX1MeYDrJK9EmWr9IoUpzrJzf4IXG6Cg==
X-Gm-Gg: ASbGncsSfEIHBT+7NHnLgJdvfMz4iYdOyC3yfwc5SVOrIqukg/I3fLDCE0t6ZcmxHfX
	1ZC3q2k4tDrG3S1yWFsbvkAfyxusr66DnGWGEugEtxsU9RRZ9JG9SWvXlC1YwwaawZNbTP9E1uk
	bHIcrVg+piXJjR333OyUSmjqpVkuQxYc78zpWCQsY7sobLZzEYkDzef7GK/VOplCxIPeu7QnYO2
	ZYxyKG0bgpkxeSsxSm7ZaVWLZHSX8qjfm2iWv2ZV78dTqx6LA==
X-Google-Smtp-Source: AGHT+IHBAbCKD5IYxg9QHbex64TGGdl/hyMZx/O9ZBosB5HyqtSevaVoy0zG6SyjrmS/Wv0vBuuPHSN0g6Rcj3+48Xc=
X-Received: by 2002:a05:6512:1114:b0:553:d884:7922 with SMTP id
 2adb3069b0e04-55a04668194mr2741453e87.48.1752396203838; Sun, 13 Jul 2025
 01:43:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709-pinctrl-gpio-pinfuncs-v2-0-b6135149c0d9@linaro.org>
 <20250709-pinctrl-gpio-pinfuncs-v2-8-b6135149c0d9@linaro.org> <CACRpkdYfRv-B=p61tVThFkjoqDGfcqOjmHxmj4wv-NYyky2-kg@mail.gmail.com>
In-Reply-To: <CACRpkdYfRv-B=p61tVThFkjoqDGfcqOjmHxmj4wv-NYyky2-kg@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sun, 13 Jul 2025 10:43:12 +0200
X-Gm-Features: Ac12FXyIRZr_PZFqMr5GkGp0O9WQSutVaydnaLLulDe-fCJJJZygxCd1lTC-X0M
Message-ID: <CAMRc=Me561DEHio+zN6oX9oqD6ue7z-y9E+cO_7_Z3L4taQd_A@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: use generic pin function helpers
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 8:37=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Wed, Jul 9, 2025 at 4:39=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use the existing infrastructure for storing and looking up pin function=
s
> > in pinctrl core. Remove hand-crafted callbacks.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Needless to say I'm a big fan of this patch set and it seems only
> this patch 8/12 has outstanding comments.
>
> Do you think you can do a quick iteration of it or does it require
> a lot of time?
>

I don't want to rush it. Let's make it v6.18 material as I want the
changes to spend some more time in next and not break anything. It
affects literally all qualcomm platforms after all.

> I am tempted to simply apply patches 1-7 to make your life
> easier past v6.17, should I do this?
>

Yes, please, they carry no functional change, it will be less baggage
for the future.

Bart

