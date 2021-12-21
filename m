Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7B4F47BE6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Dec 2021 11:50:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236628AbhLUKuS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Dec 2021 05:50:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231815AbhLUKuS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Dec 2021 05:50:18 -0500
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF6F7C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 02:50:17 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id o10so12051814qvc.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Dec 2021 02:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TzZdj4RX/QXxZrZ1GTU0Kqu/1JYRTtnFGSwn3iVsJlg=;
        b=dXgcxeYccBnxvOokgg5QB22+5nqzF3W549vxLnmbT3fAH/EMs906NbQ2vx3/xz7cwf
         58KzJ7WmMLWHH+D/gWPdusd3S3op6GPJUO9ZZoTGgcX/PWtWb+NuSIKsW3uB0KImW7Td
         miHSx6SmXXWw3h4l6ySU+rzWX4mNwIryvJ9F6QeYBpB3AB+L/lth6bBhOZFVmqYjICMt
         ADRK3/Vv0YWl+rQ0pkC9Z402cZ0UeJ4KYbGC6IUh43ZzdMtGmHKQ5LvGGkLtsDt831/J
         mS9wk+xeaEuhawQA4k8mZpv44asE59qtbq9xZwgUkIo5uc0G6wDWoZmhaEm+P/pfJ8jm
         CHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TzZdj4RX/QXxZrZ1GTU0Kqu/1JYRTtnFGSwn3iVsJlg=;
        b=7NWsg2tIDDOwjJMdVUZOHJihj+dhaNuS7rMDHhbBL9FyEFFXFSSM66+3AwI0A98iQb
         Sf3JoNmfwP4SkxcsuqHAyrcjAm0rhOHsJADs2YHi3WxjaDL8RVaqGl5lHslA7ruJBoQA
         aSyp28/6IcH3gjNuXI/hKZkzFWJ/JFLV0RXLtZ3NNqPMxvVmfs1RXB6N72hKwjlKuhh7
         fwdZ8KGHq4YLILeebH5gyeLe/NXuVHnINPqurxVipYxD6/9Md3G+YBr/jK6W/ZARBT6/
         lMm8L38cYGjSt1qoaVnMADB373I0E3uEpN8zYB1jXbfq09A4PIkq3TDQM4QtHn1wxPJu
         EgAw==
X-Gm-Message-State: AOAM530H4XxS9BCWKBH+lNo6BxeEijIMeTzSlds6dkg8w5dC9EdYtarN
        uywqOpCy67+KHfJ8w2EOJQtlm/UFthQeFN2wrpEewA==
X-Google-Smtp-Source: ABdhPJyjCP3r718zG2y9rZym1LLMLwBnbmF9KhPbfuMqZPHscN0Q1b4k3vZAe7XJuxJxP1nL312NQCDnvnIjGTXGHQY=
X-Received: by 2002:a05:6214:d0d:: with SMTP id 13mr1681130qvh.73.1640083817001;
 Tue, 21 Dec 2021 02:50:17 -0800 (PST)
MIME-Version: 1.0
References: <20211221101319.7980-1-jose.exposito89@gmail.com>
In-Reply-To: <20211221101319.7980-1-jose.exposito89@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 21 Dec 2021 13:50:06 +0300
Message-ID: <CAA8EJpqJ-tWmb5Ba6XSK59toCtLb3nRRmVH8da4Ud_rrRYytmw@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add missing format_mod_supported functions
To:     =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>
Cc:     robdclark@gmail.com, maarten.lankhorst@linux.intel.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        tzimmermann@suse.de, maxime@cerno.tech, mripard@kernel.org,
        wens@csie.org, jernej.skrabec@gmail.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 21 Dec 2021 at 13:13, Jos=C3=A9 Exp=C3=B3sito <jose.exposito89@gmai=
l.com> wrote:
>
> Hi all,
>
> When setting IN_FORMATS, implementing the
> "drm_plane_funcs.format_mod_supported" function is mandatory to avoid
> exposing a bogus blob.
>
> This patchset adds a bit of documentation and fixes the issue in a
> couple of drivers affected by the bug.
>
> I reviewed all the other drivers and I didn't find more instances of
> the issue.
>
> Jose
>
> Jos=C3=A9 Exp=C3=B3sito (3):
>   drm/plane: Mention format_mod_supported in IN_FORMATS docs
>   drm/msm/mdp4: Add format_mod_supported function
>   drm/sun4i: Add format_mod_supported function
>
>  drivers/gpu/drm/drm_plane.c                | 7 +++++--
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_plane.c | 8 ++++++++

You missed mdp5_plane.c here. But I assume that the proposed fix is
not correct, see my comments on patch 1.

>  drivers/gpu/drm/sun4i/sun8i_ui_layer.c     | 7 +++++++
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c     | 7 +++++++
>  4 files changed, 27 insertions(+), 2 deletions(-)
>
> --
> 2.25.1
>


--=20
With best wishes
Dmitry
