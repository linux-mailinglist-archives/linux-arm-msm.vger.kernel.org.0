Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ABFD20253C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2020 18:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727871AbgFTQ13 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 20 Jun 2020 12:27:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726976AbgFTQ13 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 20 Jun 2020 12:27:29 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A731C06174E;
        Sat, 20 Jun 2020 09:27:29 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id m21so10150700eds.13;
        Sat, 20 Jun 2020 09:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/BMMpD7qtU5pkOn7Z4pc22pm3d3A2SjW9M7WNCHeAiY=;
        b=QVIIupKxa71Or8M1ClPfavFaWT0DeX7jreTr2LyxDbUbYAeTT4y0fkSdjacNshjutr
         BeMoZok/aRl/E36YP4z8utRYnCpQeJ5Aosyto1cXGGEwZB9Gra6J+qWzl386BId7q3Kb
         8zIuaryYutyw+jQVByn0gym1OPyOV3sBKxcJyokF47KHEjiSyBh68bw3mluJMNUxiviE
         l2IIgYY1n6WTEeHI9b0DBJl/ZMaQPepwgGW+9b4jLj3L9tvm3gZwBORH5uWTbppWk5Vy
         fg8a4rck24+F1awR4f3zwPG04llDWfBqgeOfpU4yIasIHqci9y8XaLPxj/eXRtObYhOw
         GO5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/BMMpD7qtU5pkOn7Z4pc22pm3d3A2SjW9M7WNCHeAiY=;
        b=byhBf2i3HQB11iFD1Ehd64JruTwni738Y8id1NWsU6SfoumLnQFZdOhoe3Ovs8vrCA
         saHfJrXHFR/rIuDHfsbqvPVEnuva4v0HJ97lysKfACPHSus7IvlfoWNcIAmX3+5xH53/
         nVp9jsLakGdQfgjBnm4gkf6P/G5nIP8nk9TWGVW9KFjr979bITpKw57jQKBHbFKybGTQ
         LQfpQII14Wkj4/hDH/m3NbSQJXm8oGdUSo29WY1WCfISf8eHJIr65PiRwp9gbNMB6EbL
         dBeBEaxdCDy4ji4y+eu9YItw1lUcYNqQ7Y4qehAKYJnpsYP6PgPoyzdwzW3l2lZbvACc
         29IA==
X-Gm-Message-State: AOAM530hgI0tXsUSXQSX8aHvz3ZX4ILf72kpjHz5WM6vrGKGbuoI2zvp
        espR7NuaNKo1Hux8kLYc6VYGGvOxkKtL0CZKD6U=
X-Google-Smtp-Source: ABdhPJypOsgdt+fPQZQTGg7oTELjjmivaxGQ2UlMWlYWToihFkcE5WrbmvWFN/dybafH1Uk8WYjOZIkXCWzA5J5yOUI=
X-Received: by 2002:aa7:d952:: with SMTP id l18mr8585130eds.151.1592670447699;
 Sat, 20 Jun 2020 09:27:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200528130816.1670-1-yuzenghui@huawei.com> <f1357380-9e98-4c1e-c1bf-a0a95bb5910d@huawei.com>
In-Reply-To: <f1357380-9e98-4c1e-c1bf-a0a95bb5910d@huawei.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 20 Jun 2020 09:27:56 -0700
Message-ID: <CAF6AEGun5DgsTzLRswxt2NRG9P+HVake0hQUKPR6czcNvc5LxQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix usage of ERR_PTR()
To:     Zenghui Yu <yuzenghui@huawei.com>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        wanghaibin.wang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jun 20, 2020 at 3:26 AM Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> ping for this obvious fix...

Hi, thanks, but there is already a similar fix in msm-next:

commit aa472721c8dbe1713cf510f56ffbc56ae9e14247
Refs: v5.7-rc5-33-gaa472721c8db
Author:     Chen Tao <chentao107@huawei.com>
AuthorDate: Mon Jun 8 09:48:59 2020 +0800
Commit:     Rob Clark <robdclark@chromium.org>
CommitDate: Thu Jun 11 20:07:21 2020 -0700

    drm/msm/dpu: fix error return code in dpu_encoder_init

    Fix to return negative error code -ENOMEM with the use of
    ERR_PTR from dpu_encoder_init.

    Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
    Signed-off-by: Chen Tao <chentao107@huawei.com>
    Signed-off-by: Rob Clark <robdclark@chromium.org>


BR,
-R

>
> On 2020/5/28 21:08, Zenghui Yu wrote:
> > ERR_PTR() is used in the kernel to encode an usual *negative* errno code
> > into a pointer.  Passing a positive value (ENOMEM) to it will break the
> > following IS_ERR() check.
> >
> > Though memory allocation is unlikely to fail, it's still worth fixing.
> > And grepping shows that this is the only misuse of ERR_PTR() in kernel.
> >
> > Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> > Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index a1b79ee2bd9d..a2f6b688a976 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -2173,7 +2173,7 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
> >
> >       dpu_enc = devm_kzalloc(dev->dev, sizeof(*dpu_enc), GFP_KERNEL);
> >       if (!dpu_enc)
> > -             return ERR_PTR(ENOMEM);
> > +             return ERR_PTR(-ENOMEM);
> >
> >       rc = drm_encoder_init(dev, &dpu_enc->base, &dpu_encoder_funcs,
> >                       drm_enc_mode, NULL);
> >
