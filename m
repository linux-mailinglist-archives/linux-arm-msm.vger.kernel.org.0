Return-Path: <linux-arm-msm+bounces-14760-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B61885C5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 16:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7CD71F21998
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Mar 2024 15:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D5186246;
	Thu, 21 Mar 2024 15:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A47I8TVF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65AE85278
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711035820; cv=none; b=qcMDze9E2OyUfvbwRAvwReZ6iQygJGchrokPEezoMGtaI+/4eESDhMU7IIAhhNYk2iHC/N0Dj6ydNEwO6HFM1/mNjxvUWwUb5Xf/B6cmcNm47mCBDAlo3sPUgvV/RTuS8U6EA7SHYgnvazclY1SiJY3scbwFrTUoaSO4vswMSBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711035820; c=relaxed/simple;
	bh=UpgzR9qYFt2DVUXh+ZlrB3kv/cSpRH2o+XXZxpbADmA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=daG0GJxhRSj64bAAu7GnbUc65Yg5zCq2dPUE0L5uL1YuyPwTqzA6oZCo/E0ydF/j6PuUmUAN1fuQwFB28r55q2a0VrOWMUYqApLE73MczpYQ/ki5WOcBFgs5ERvJKSNJRgqvF/QcjqeUmwtLcvx7zhggsdIO7VcHfXbroTMKv2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A47I8TVF; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc74e33fe1bso1136621276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Mar 2024 08:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711035818; x=1711640618; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UpgzR9qYFt2DVUXh+ZlrB3kv/cSpRH2o+XXZxpbADmA=;
        b=A47I8TVFY++vYuiuIaXh1tUlk7NTpPs8rwdGVtCdPjwvNbQx5JnILbGTftKxNJ0ewk
         ZAqp0jaNr6dYNqU+IvtggyzLUQTcHcrPKxoMq3Yx71RXS/VxwGi/b1ny/eDi6J1o48xm
         43pPp023pJTYlccgp83ZQe68dG2G9a4IxQRws3CJ/RfCqoT8mk7GhR4jFVS/7DSHGo7W
         jxTZMSOpG7tR6MHJetDooSSQPrLVl8+jh+ywxirhOVFizrh4reEG4QUo/sybYmyf0pou
         /crpHpqcMBdKADMb21vL//OzZCKkbfq2ofbnYhZuwsigdM2wUdDvIHcQB/DGl5w8E+/B
         lVqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711035818; x=1711640618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UpgzR9qYFt2DVUXh+ZlrB3kv/cSpRH2o+XXZxpbADmA=;
        b=fNSC3hI0FojlQlBzYjuSErvoM32UPEkYXvEEqPe/RdomHIwxrd+gXZOg0QUQWzFdx2
         JLJEURJdvkIqHZcB0ww1X5kHpkPS29geFd975yxRSKOubFSKb7vp+zfIGNSvaARVmSca
         EvdE+4nDJRS2KEQWLDsz3DnI3Z4/SUoae2gbvQ38U4KOx4eOMuwxFo9LcOkH0y8txoDA
         Dkb8S8S4kTyaFy1d7kV3RTdpUKGwcAboseH7mpXKeYk2wXAZa9U8LmNjXClJ+mhq63Bw
         waEmufGcuknekmYJ0ugUDnqVBezfXUQixyhNzVUlq5iilNlay/ujKXm3msX3wNMPidsz
         M8qg==
X-Forwarded-Encrypted: i=1; AJvYcCXzQcu8xxPBxAxvDsok+3wCoh8iY6jhetfy8VM4x7OFOoVrGauDf/AtUQqKXWWlHqVtfOu6cRqacK0kObC1gjyATTqghWh5WtRZWXd/Fg==
X-Gm-Message-State: AOJu0YypjgAr3FOrSTE49qfYF/SPP30dHRNFw84xUXKoi8oJOJjKrNyx
	AYSGC9uz/IiVTVKC1nxUvaTxK365iaSxqoQaVjfY8kvxGCcuaDp4b5FfkYVLNyxRfhGiufcNSel
	SIu2ZB4mIJQfojRcmj4BO74vpitsUQXgF9qX4Ngwyo4QnaetPZDs=
X-Google-Smtp-Source: AGHT+IHvO2gpoo35hpbPazduMDS3YRusSo/Zx0sw5zMx7Ip/e9xHwuH2gpf2tlgkpO9357jnNImek1UHtxy3YWbuZJY=
X-Received: by 2002:a25:b213:0:b0:dcf:bc86:1020 with SMTP id
 i19-20020a25b213000000b00dcfbc861020mr8347225ybj.53.1711035817909; Thu, 21
 Mar 2024 08:43:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222-fd-dpu-yv16-yv24-v1-1-4aa833cdc641@linaro.org> <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com>
In-Reply-To: <6334793a-1204-85b3-4f91-7859b83f79ed@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Mar 2024 17:43:26 +0200
Message-ID: <CAA8EJpqxkY=Bk8_iAq6Yj6VGNO2UYmF2Hm6XOeE5EhJFKUpaPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: add support for 4:2:2 and 4:4:4 planar YCbCr
 plane formats
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Feb 2024 at 22:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/22/2024 3:43 AM, Dmitry Baryshkov wrote:
> > The DPU driver provides support for 4:2:0 planar YCbCr plane formats.
> > Extend it to also support 4:2:2 and 4:4:4 plat formats.
> >
>
> I checked myself and also internally on this. On sm8250, the DPU planes
> do not support YUV444 and YUV422 (and the corresponding YVU formats).
>
> May I know what was the reference to add these formats to DPU
> considering that even downstream sources didn't add them?
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Full-screen (1080p@60) YV24 gave me underruns on SM8250 until I bumped
> > the clock inefficiency factor from 105 to 117. I'm not sure that it is a
> > correct way to handle it, so I'm sending this as an RFC. If we agree
> > that bumping the .clk_inefficiency_factor is a correct way, I'll send
> > v2, including catalog changes.
> >
> > I had no such issues for the YV16/YU16 formats.
>
> We don't support this too on sm8250. But interesting it worked.

I have been cross-checking DPU formats list against the format list
from the display overview docs.
The DPU (and SDE FWIW) drivers supported NV16/61 and
UYVY/YUY2/YVYU/VYUY formats for ages, although overview does not
mention these semi-planar formats at all and interleaved YUV formats
are marked as unsupported.

For reference, NV24 and NV42 also seem to work.


--
With best wishes
Dmitry

