Return-Path: <linux-arm-msm+bounces-19558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B39998C099E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 04:06:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 670C11F22090
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 May 2024 02:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942C013C3D0;
	Thu,  9 May 2024 02:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HIFk27fG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6991810A11;
	Thu,  9 May 2024 02:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715220370; cv=none; b=rkjomwLFqlXyfEBiKmnDznvEYdm7rFYn8Cgqf8F26fzccJInNpKRqBJmDI9i0RnY+pX/pEkAi7NwL5q4Rc2qqGafUbHcRIktDRc8POx9UeNWwWyj/f2rgecIr4JKQ3nyXpwrnhHZQDv/FW3My5R9SAII7ooaGtxbzrDVL8KTHFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715220370; c=relaxed/simple;
	bh=G7cFv9cF2cnjfjAGz44Yc56GefLQLwiyJxe2ewKnFKM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOe82ZJ/W51ZnSDyhjcdCuqK2/FjlYdiYhZj84zZ5d/3ucT97y6gk1wcB3d163Ntm5SpDCtOTj1b3aWJoB2R7wDWbCi1M/XQKi83RG4yqMgJy4geJSjZENiW7wnPVGAOruYk2BdPafd3k8ZWu9pcM4mzo/5r0sagCWzDzCMmRDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HIFk27fG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED654C4AF0A;
	Thu,  9 May 2024 02:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715220369;
	bh=G7cFv9cF2cnjfjAGz44Yc56GefLQLwiyJxe2ewKnFKM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HIFk27fGvuQXEVMRzZy91iuiEyQjcTGd/3F+LVE/v2tcAYAAIAHOB0SqJ5p+6mHKH
	 Hm71icex8Xie6TrK9DbNytuDsmayLDCbM4suzT0LNOCxCYKaixYUlSbcPPW+38WOG4
	 5BIIyPQJ2jqPkuZmA2a8o1Cc1bNlw83WRkF2afJib4mTOMObnb1aiLBEP/elcSRcoF
	 zZ2MA4OVsXruvYEuvudWLfDPIrglzfBAUSm3ykIKQI317nBke33EjS7KzyZxIoQ+FU
	 2WCovFUeeg0io2DLXwDvgIcYVtnAKcXsIk9Ayv5SvZ2niiC/AaVXgHT5kIMrg6mXyb
	 L1jKwf4OL0a1w==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51ff65b1e14so302266e87.2;
        Wed, 08 May 2024 19:06:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVa+furTq9QhUZ8ikrP68f6drVNAxUlUGhCLx4+L7o27YwFM9+ZPi7ImmGOstRiDAbZcpYqt5T83Q4pxt3hVWQ473FKIYJtbUtOSacSCVTxdnSIxzJ8RPKjkjRujgwSmmzZ8+VCefSGjWvDsQ==
X-Gm-Message-State: AOJu0YyoTcB6B0XIKmf2pcdZ6yK9WwbU8ifxxqjHeImd3Co0+Go53Dml
	woYrJIxrxZL6QZgO4LYmrk5YRJoGCYGC0oCQnCxLu3Pix+1zmjOqkKKidVvzZBxROeAdTrz78Vm
	ynWM6FXd1mBELL++TlJCrjtZA+0M=
X-Google-Smtp-Source: AGHT+IG9jgW2EhldqJEU5OYVfvoRjo0wlRA5x/+WH/NBhi4EjV49pvu6Eqy1EviqeUURrwJaBPOetOpoppVu/vQSytA=
X-Received: by 2002:a05:6512:3a8c:b0:521:b2b5:5ab2 with SMTP id
 2adb3069b0e04-521b2b55ab6mr2522757e87.46.1715220367602; Wed, 08 May 2024
 19:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507230440.3384949-1-quic_abhinavk@quicinc.com> <CAD=FV=Xa6LJEWZwdUXvFVPQ0-qnDZroDi6tkZaLFHiarJ2gyew@mail.gmail.com>
In-Reply-To: <CAD=FV=Xa6LJEWZwdUXvFVPQ0-qnDZroDi6tkZaLFHiarJ2gyew@mail.gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 9 May 2024 11:05:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNARZu1Jrqibn-PvjAa=dQwikMdWVH9d9oKwpe007JeVC6Q@mail.gmail.com>
Message-ID: <CAK7LNARZu1Jrqibn-PvjAa=dQwikMdWVH9d9oKwpe007JeVC6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove python 3.9 dependency for compiling msm
To: Doug Anderson <dianders@chromium.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org, 
	Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	seanpaul@chromium.org, swboyd@chromium.org, quic_jesszhan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 9, 2024 at 9:28=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Tue, May 7, 2024 at 4:05=E2=80=AFPM Abhinav Kumar <quic_abhinavk@quici=
nccom> wrote:
> >
> > Since commit 5acf49119630 ("drm/msm: import gen_header.py script from M=
esa"),
> > compilation is broken on machines having python versions older than 3.9
> > due to dependency on argparse.BooleanOptionalAction.
> >
> > Switch to use simple bool for the validate flag to remove the dependenc=
y.
> >
> > Fixes: 5acf49119630 ("drm/msm: import gen_header.py script from Mesa")
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/registers/gen_header.py | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
>
> No idea if we're supposed to allow python as a build dependency. That
> being said, I can confirm that this fixes the problem for me since I
> ran into it too [1].
>
> Tested-by: Douglas Anderson <dianders@chromium.org>
>
> [1] https://lore.kernel.org/r/CAD=3DFV=3DXnpS-=3DCookKxzFM8og9WCSEMxfESmf=
TYH811438qg4ng@mail.gmail.com
>


I do not like Perl.

IMHO, Python should be OK if Perl is OK.
I agree that the required version should be
documented changes.rst, at least.






--=20
Best Regards
Masahiro Yamada

