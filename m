Return-Path: <linux-arm-msm+bounces-30543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3804696A323
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 17:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5377A1C231DB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 15:46:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411B117A932;
	Tue,  3 Sep 2024 15:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j7k5BSfk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A92188A1B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 15:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725378348; cv=none; b=raBuJC0Dmn011SMPiAeymTzfczMlFczZ5XG2FPDs5vCl0GFBlOI3DlzIzeKRX1EKuKRLzoAH5vwzSf8qTN1nwGY1mSFGps8kN4EgkMpz/aQfMia6A20o7HVJ2Z8Z0FgAQMfD+x+e317BRUDNyX5MTacbvscqs9+/scv3I4zQxxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725378348; c=relaxed/simple;
	bh=l2mQscuab4OPQKa1/mhIn0/gLgLRV3Jrk0oI9l9ckVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LdsV/jqFjvRLompioSBvijL/AxyNeSyHc99V30Q72eMrefRy0FoQnQW8elTJatVjrr+O1t6qGMVDj4em+btY4zKQDP8xUyNhaJqTB/zcWTZE6s27u7LfduD9hAUlVHTYPS3yia+Sc1UTSAw9gd3JOmg0o+gg86H2M1Y/soPVqPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j7k5BSfk; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f3f163e379so1924471fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 08:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725378344; x=1725983144; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lvLFRuyWoi+K6FtpRUCVpbWJKizzVnbzbq+sI/tpAWs=;
        b=j7k5BSfkFMIrMNQdbDyaiigw2igpteXpxjtqqNRbZgnB9jcf2YujYARFYwGZxKDBU3
         ncg8sWS6lHNgeWtgkAHxJiboplMr7FsAgdkdWk9NSLL0SEajqc7V0Uwj9mCtYXm9tKYU
         P0DerJOUQUBGmiKPPT7LZvZ4fP729YJnda2BtI/KG/Nrizmump2n/rUGoXeGtmrtB6Ec
         d5JFNaJr9ug+lEPpNWxt1XAeHJYTX9irYzTJu74CruAbmX6UOfb5vui6S26I4lgcuj9/
         Nu3bY3NUWxv739mQ9GG0VmaNA+zJelJZ9IfB0L5fnqxvZvPRoWwOXskI21cca0dy9w0S
         23gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725378344; x=1725983144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lvLFRuyWoi+K6FtpRUCVpbWJKizzVnbzbq+sI/tpAWs=;
        b=G57q7SFDvE8YsSedNTAHgC9d2J0AwWOsLaE/YuJ8NKXEI6mGc01MTAlgAfg2nVMO6B
         Bjw2W0MXYu7+Xaf9BuXWpCghPYkOx3AuO86sF/V4GSkHWHfh7mp8Obkg22tWk63pWLQb
         gzPBrr5w9UJtncDCpwXaXVs5liAJhrGvVy0qwo8dryrFF8Fo7qX2JCtYbrLIP6NIqjeZ
         pNhcUZc5tH7jvYGgQr/0saCecYJkImhbhlQmmdz6pNvsqH7hhdWjk33sjUn9Tlr4VyUF
         zfQYn5iiaH9HJ3a/jHu2wygTmJmPe6nB38jBXZOIc4c+4SAlpI05B7RH1XoTX3dU4fmW
         PJ6w==
X-Forwarded-Encrypted: i=1; AJvYcCXNSs7/fjVrAbuMFJYKdJEagvWIKp17iy9gTVqXSaoh96pJavqAr+cML1QpYnqifzqef8KD672It3nwo4v8@vger.kernel.org
X-Gm-Message-State: AOJu0YyAxm8BBsQ7dKs81kBwDCS9QZXCptD3FkVf1M9JPjff2vsf5E+o
	lmlhwcLJp5GudDfcociYX3igWX3brx+Gse/mMhDNFj8ijqIEuicyvfNvumLURRjEK58LSIOcK4u
	mmRvl/dfq8jljUE40SBWCqBf4M0unJt5Wc/wF0b2AjVzmywXmB0k02eYN
X-Google-Smtp-Source: AGHT+IFZ2z10mUsHuIeTi5fGP7ImtWV0HNYj0otnbACk3A17lbvrUv4JGfz1TWIR0kU9riHTx1cIgtjOKQUelny19Sc=
X-Received: by 2002:a05:651c:b0f:b0:2f3:e9fb:6d5a with SMTP id
 38308e7fff4ca-2f6105d755amr166291761fa.13.1725378344000; Tue, 03 Sep 2024
 08:45:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-2-bdb05b4b5a2e@linaro.org>
 <rspuwp3zpnzwfe26hv2yezy5ad5o7wliq7ucpobyaheytvcs3j@qtshf6cewb2f> <p6xw4newsbrpog5ftclvgi2mpg3hn3ujfukmtilqewz7kbjhqh@6geosjawh3ul>
In-Reply-To: <p6xw4newsbrpog5ftclvgi2mpg3hn3ujfukmtilqewz7kbjhqh@6geosjawh3ul>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 23:45:31 +0800
Message-ID: <CABymUCOji3BUyBhSRz-FXh0tge=kwUTiRN5aLhf=O4MUh_4Y3g@mail.gmail.com>
Subject: Re: [PATCH 02/21] drm/msm/dsi: fix DSC width for the bonded DSI case
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marijn Suijten <marijn.suijten@somainline.org> =E4=BA=8E2024=E5=B9=B49=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=BA=8C 19:51=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2024-09-03 11:50:36, Marijn Suijten wrote:
> > On 2024-08-29 18:17:31, Jun Nie wrote:
> > > From: Jonathan Marek <jonathan@marek.ca>
> > >
> > > For the bonded DSI case, DSC pic_width and timing calculations should=
 use
> > > the width of a single panel instead of the total combined width.
> >
> > When this patch was originally proposed we already discussed [1] that t=
his is
> > **not** universally true.  On my hardware a single bonded panel always =
receives
> > the full width, at least on downstream kernels, and it works [2].
> >
> > [1]: https://lore.kernel.org/linux-arm-msm/eanx45rnasj7lu3r2tfhtg4qkqkc=
idd6zctsz6ci6jlklu4fgi@3nf73w2ka4li/T/#u
> > [2]: https://gitlab.freedesktop.org/drm/msm/-/issues/41
> >
> > Can we please figure this out before landing this patch?
>
> For completeness I've picked this patch, together with the following
> mis-squashed change from patch 03/21:
>
>         diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm=
/msm/dsi/dsi_host.c
>         index 7a4d9c071be5a..5abade8f26b88 100644
>         --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>         +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>         @@ -953,7 +953,7 @@ static void dsi_timing_setup(struct msm_dsi_h=
ost *msm_host, bool is_bonded_dsi)
>                                 return;
>                         }
>
>         -               dsc->pic_width =3D mode->hdisplay;
>         +               dsc->pic_width =3D hdisplay;
>                         dsc->pic_height =3D mode->vdisplay;
>                         DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_heig=
ht);
>
> And this is what it looks like on a bonded DSI CMD-mode display:
> https://gitlab.freedesktop.org/drm/msm/-/issues/41#note_2553207
> https://gitlab.freedesktop.org/-/project/2206/uploads/dc5c53d09ecb635fdc9=
f190fbc9b37ac/1000027079.jpg
>
> That's a clear regression :)
>
> - Marijn

Surely we should figure out what's going on here before we land this
patch. Please help me to understand
your setup first. Your panel works well on mainline kernel with
2:2:2(?) topology, and you see issue with applying
the change here, right?
There are several parameter that impact the issue, video/command DSI
mode, single panel with 2 DSI vs
2 panels with single DSI on each panel, 4:4:2 topology on my device vs
your topology. Let's list all of them
before further discussion.

-Jun

