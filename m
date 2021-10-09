Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC00427BE4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Oct 2021 18:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhJIQYk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Oct 2021 12:24:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhJIQYj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Oct 2021 12:24:39 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830E6C061570
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Oct 2021 09:22:42 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id o13so8346737qvm.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Oct 2021 09:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ps7DiQtOW0yxAPEQdZyI3WtmSKsINX3O22ig4yrRkE0=;
        b=KzlqXDDtk47pPSC9GsMmBzmf0IOh6D1Wcti108dAkQdpZd3NdNTFOpp6HBtqRizfC1
         p1AGFQXVSP0TU4XlTlXrsywxgYv4sMRSvwwY1MU+c4QOqn1doef7DUUcZIcgUO+xBI3t
         UMbr2b+fPYdo3DWT1uKjaLvE2CHqwI2TqQl8sKiMyukknM+51UUBxL3EmfDM717VGwSO
         UbY4OE78Gw2aG0lSjuKDZe/XA77HMe6/iiMQaSTpS0Mn7uObsnZV2kRCf9oYbVe4AOL7
         vKwrJ1ZvVLTj0770a3GgR/Whp34ZdScZLoaLoJ2xq0YrCQdovB0oerOr7msSwpViC4zW
         WySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ps7DiQtOW0yxAPEQdZyI3WtmSKsINX3O22ig4yrRkE0=;
        b=bau1xZzljL5UNEPLdnUIP6nzNISQSq3rQnP4+AlIM7VGAzJPUugk9WwBFVcR/vkr0S
         Peiu5FAX2a51qv9ETdex13/uF8zUxg+JTtD0jg4eQ6gUd4DQ7j9YpcCSC7Cda09S2hag
         cN3JP3RnI8OaeYY/LamKePN+q8PFP01bj1gK1SDEmVEc9QW1u0rtE1CQmm+tF5PTzXmO
         KlxpJ80XN1kBQUswdJkg7V2cwEKEwCDV5Fgleo7QWs+kh928HzxZTg7gKcvtNHsuorpy
         0BVKCpeCEBLIhVGSccnOXGBAo0s7VC0SsiE8Pb+h445SgTLraGJba/UfZFFtG3Z62INV
         98+A==
X-Gm-Message-State: AOAM532NGOgCtUb7lnz2YSRclP093NUYiDtwOgm5bFXYCtL8mnwqMnpg
        wrlhMAfYvwu5uXPnx489dIzlqVm2kaJUyF7456Dy+iujQWE=
X-Google-Smtp-Source: ABdhPJyzMbqYmICxCJiO0kJAwrdaVGemEC/CVJakJfw0G7PzEcywRdikyCTJ7DRm4WhyRdmW4SyQq2iRexvTKx8A0pA=
X-Received: by 2002:a05:6214:70f:: with SMTP id b15mr15970638qvz.16.1633796561708;
 Sat, 09 Oct 2021 09:22:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210926001005.3442668-1-dmitry.baryshkov@linaro.org>
 <20210926001005.3442668-3-dmitry.baryshkov@linaro.org> <YWG3oC7Bp54tIYkN@ravnborg.org>
In-Reply-To: <YWG3oC7Bp54tIYkN@ravnborg.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 9 Oct 2021 19:22:30 +0300
Message-ID: <CAA8EJppeW=s8ngS59hvUyCqmhodtTO3f8k7Aof=-umudCvs2jA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] drm/panel: Add support for Sharp LS060T1SX01 panel
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

On Sat, 9 Oct 2021 at 18:39, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Dmityry,
>
> On Sun, Sep 26, 2021 at 03:10:05AM +0300, Dmitry Baryshkov wrote:
> > Add driver to support Sharp LS06T1SX01 FullHD panel. The panel uses
> > nt35695 driver IC. For example this LCD module can be found in the
> > kwaek.ca Dragonboard Display Adapter Bundle.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> The driver looks fine. It would have been nicer could you have used
> regulator_bulk - but I guess timing constraints prevents that - right?

Yes, there are explicit timing constraints in the datasheet, so I had
to follow them and to turn regulators on and off one by one.

>
> Please address the following checkpatch warnings:
>
> -:181: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
> #181: FILE: drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c:129:
> +       msleep(1);
>
> -:187: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
> #187: FILE: drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c:135:
> +       msleep(10);
>
> -:193: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
> #193: FILE: drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c:141:
> +       msleep(10);
>
> -:210: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
> #210: FILE: drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c:158:
> +       msleep(10);
>
> -:241: WARNING:MSLEEP: msleep < 20ms can sleep for up to 20ms; see Documentation/timers/timers-howto.rst
> #241: FILE: drivers/gpu/drm/panel/panel-sharp-ls060t1sx01.c:189:
> +       msleep(10);
>

Ack, I'll fix the msleep's and send the v4.

>
> I expect patches to be checkpatch --strict clean - or it is mentioned in
> the changelog otherwise.
>
>         Sam



-- 
With best wishes
Dmitry
