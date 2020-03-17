Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE190188BF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 18:27:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbgCQR1M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 13:27:12 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:37270 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgCQR1K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 13:27:10 -0400
Received: by mail-vs1-f67.google.com with SMTP id o3so4377124vsd.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 10:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kYxhd4YbdvKna+Hk3H++oy2r+2XxoGCrQ2OcQrBquQI=;
        b=VWLDmipX7IFDQ/yHjCAzFxlk/+VluSSJwe4qv5jpHr4e6B0U7gp1YOW3C9Csk4kZHd
         NXgx0kZ6qhPzwcHQS3y9Qvp7AMowj6bjIngubmHTjWmVhTh0fc8O7LbAKQh0NHGA4pJV
         mU73ACIJwkVyGoLSZZRtAPc2yjx+8+foKjquI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kYxhd4YbdvKna+Hk3H++oy2r+2XxoGCrQ2OcQrBquQI=;
        b=S0Q1sifpfIhsJ2tysym8/OIShHdgZN2Z6+IFEJ+QnNU2T8LUoJtCMjVHIe7Z4UV36P
         NQ5VHXiK4Dew4fWtci7SM8ixXKdYkwAlDh3020GWFet2OoKjOhHW+oTyyQ8OkGZk6AGF
         AuLd4Wvlrzij9/iBR5S8us7w8ulEEsp0BYx+DIMlcQx0svVGW+d/gSapqivHQAeA+DIP
         HZ+yShwElAkLKQeCXyh6zh5LrwemocchDBi88ZP+Z4IPXSxT+XDitLAg3b25XsbunI/s
         /PkzzzhdsL4iDACe7rsMzDIB11TJ1Cfq14XJPqBmUxRRawSsgqkEw7V95xxqS1Zvf6bu
         GXSA==
X-Gm-Message-State: ANhLgQ17Nr0pFu4BHUVjm7fq1TyUaF/tWaqTSjlHL3voThnKK02Jc/iL
        /1gjkhpD6RwOTN2b6EdzvYQZVIfn/0M=
X-Google-Smtp-Source: ADFU+vtKZuPLIyO4qVncNcDjj1b9cMWFlaNGJ4VQPcyG94EX9xEbh6PdFDfViF1FIjYBUeapmiTiDA==
X-Received: by 2002:a67:87cd:: with SMTP id j196mr21207vsd.98.1584466029198;
        Tue, 17 Mar 2020 10:27:09 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a13sm1596946vsq.28.2020.03.17.10.27.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 10:27:08 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id p7so12247674vso.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2020 10:27:07 -0700 (PDT)
X-Received: by 2002:a67:e951:: with SMTP id p17mr22233vso.106.1584466026884;
 Tue, 17 Mar 2020 10:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200315194239.28785-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200315194239.28785-1-christophe.jaillet@wanadoo.fr>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 17 Mar 2020 10:26:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WrncW_y+dtXHU7Lj1J0Lh7w8Kw+d28KZF52-OMs=0pSQ@mail.gmail.com>
Message-ID: <CAD=FV=WrncW_y+dtXHU7Lj1J0Lh7w8Kw+d28KZF52-OMs=0pSQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix an error handling path 'msm_drm_init()'
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Mar 15, 2020 at 12:42 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> If this memory allocation fails, we have to go through the error handling
> path to perform some clean-up, as already done in other other paths of
> this function.
>
> Fixes: db735fc4036b ("drm/msm: Set dma maximum segment size for mdss")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

This has already been posted as:

https://lore.kernel.org/r/20200309101410.GA18031@duo.ucw.cz
