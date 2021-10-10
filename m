Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28EBD4283F6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Oct 2021 00:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhJJWGW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Oct 2021 18:06:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbhJJWGW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Oct 2021 18:06:22 -0400
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com [IPv6:2607:f8b0:4864:20::831])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12BFCC061570
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Oct 2021 15:04:23 -0700 (PDT)
Received: by mail-qt1-x831.google.com with SMTP id t16so2562045qto.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Oct 2021 15:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/5ObYAYd+03W3YBA6Pn4wWGWrRT1oHT143L5O16ds/c=;
        b=iixu0wmaF8IUA/xgeB9L8/92WlYvhOjmVUz0NDhb7kc/TIkwUAvwGCjxbIEzhrY/US
         1Tstm41AyFKwl9H9laUcb6Fn/MF0aEdslMb3FioJKkqXR8tbPLlETMQx//2ilxqsYqsB
         0KsvVU1zlidSTC672lVuh3XkD2H9S9Lo7LXjpOuwoJzO05nXbbL3yTNglVHRUHqDu36o
         80V0HkaB6g70lrKGIwq6IU65xFwxRRebxM70QpwYUeWz8dF225DqIMYUAVNNjdJ22urD
         v3BovLFWSW5j+qpi3Ui9NMFgQDnTY3k14oG4t/Qhudz04dy3vj0sBi/0+mzok/dFnZ2f
         TWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/5ObYAYd+03W3YBA6Pn4wWGWrRT1oHT143L5O16ds/c=;
        b=k7Sf+l9I+1yJMY17nCUWu5NeMkn0qw+M4wsyJ5CVHyJ6z1jpFT6Dht29+z/rK2mRrO
         dbEHXYTdktq8t6Wt3iamqUaZ/Y7bYa6mROYlXupdzh4Q9JRXXe91VjD/+JcrUxGhqS79
         kJ+vXXy0i4NJdHbMYM4nYTmF9kUYy7WcA4jjsDkczl2xjjLU3DbsjKMIO43Cyxzy0B1u
         1V353l5DJ9S0SEeD2ybnCUMGbQrv+WMQpGXpWpchPD9F+OqzcvAwkFmeoSOa6EwUZkk6
         WXcVaZ/uW4n9v60goXHTOpQkeXsqw//34hABcsu3tO8OnBIzPQhU1ZWIwAFJeCrsXHe4
         mRrw==
X-Gm-Message-State: AOAM532vpztmN1w28b0m+3Ru0+Q/LsrxiZGOBM0tXL5lzxLGRxb0zciU
        OWrS86g4Ghs0qTT7SmzRXM6s42nKyVvHuwwEa464NA==
X-Google-Smtp-Source: ABdhPJywgah7MRxRl8oRmiYWPWnUYFa6xvG6BmWJ9xvv5CRsXI3mGQPiMXd8S0SIeI6iXs311/kDxlBcrKOgV+4Dhn4=
X-Received: by 2002:a05:622a:409:: with SMTP id n9mr11463895qtx.153.1633903462263;
 Sun, 10 Oct 2021 15:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211009203806.56821-1-dmitry.baryshkov@linaro.org> <YWMj8Yj5XM7YUPqs@ravnborg.org>
In-Reply-To: <YWMj8Yj5XM7YUPqs@ravnborg.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 11 Oct 2021 01:04:11 +0300
Message-ID: <CAA8EJppqiGa4sgLVNxCO5w0FksfO-a+w_EwFEdjkZ05vU7Jr9Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add support for Sharp LS060T1SX01 panel
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 10 Oct 2021 at 20:33, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dmitry,
>
> On Sat, Oct 09, 2021 at 11:38:04PM +0300, Dmitry Baryshkov wrote:
> > Add driver to support Sharp LS06T1SX01 6.0" FullHD panel found e.g. in
> > the kwaek.ca Dragonboard Display Adapter Bundle.
> >
> > Changes since v4:
> >  - Use MIPI_DSI_MODE_NO_EOT_PACKET instead of the old name
> >
> > Changes since v3:
> >  - Replaced small msleeps with usleep_range
> >
> > Changes since v2:
> >  - Add missing power supplies used by the panel according to the
> >    datasheet
> >
> > Changes since v1:
> >  - Fix the id in the schema file
> >
> > ----------------------------------------------------------------
> > Dmitry Baryshkov (2):
> >       dt-bindings: add bindings for the Sharp LS060T1SX01 panel
> >       drm/panel: Add support for Sharp LS060T1SX01 panel
>
> Applied to drm-misc-next and this time on purpose.
> Thanks for the quick fixes.

Thank you and sorry for the confusion/mess during the merge.

-- 
With best wishes
Dmitry
