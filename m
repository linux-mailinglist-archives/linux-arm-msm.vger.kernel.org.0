Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5BFEFA3ECD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2019 22:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728230AbfH3UKX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Aug 2019 16:10:23 -0400
Received: from mail-qk1-f193.google.com ([209.85.222.193]:33531 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728143AbfH3UKX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Aug 2019 16:10:23 -0400
Received: by mail-qk1-f193.google.com with SMTP id w18so7313432qki.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2019 13:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ykdpZ3lP39dlVnbQ5KDoe1TuBSHZwyVocsneznT9rQE=;
        b=XihncdPfw8Y5WDsLRhGs6fYzbisVgMxlyPdg3ot2eXeQARM6P5zBldtANv5/CC7tTZ
         I7VeOV+dAfznnv1tOjZKqMAtD/BGGyE3UY7Cz+pJ2FGkovFzyna4dY2kTANicHk3KnSj
         qowoCxS3+BeN6WKTh7yjuvkbIumJldeCEaD1Ay39TArzYNQmwTG/OCNQ16bsflwtQ/yt
         SObq3auat+mGZten0jcpsswKU/GuKEaqfzbkS0Rs4vhlltiVvRfZOaFkcDPJ9JQ6NHJf
         GjOH85aABntGnH/QQ1nLRjH2MMpg9XjSmu6upJUUvcZtWDD9PdvM9q4N02NuTTensx7R
         +Puw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ykdpZ3lP39dlVnbQ5KDoe1TuBSHZwyVocsneznT9rQE=;
        b=Z4H7RN1YtrWNawrcrPxQy/r8V3OhVE57ZW9sP6bSkyKZxaF7Fuc1cOG32uwc7xM1ZP
         lQNoy1foaTmk+j85sRwTNR8v7CG2BXuc8U6EamfA2RxYG7E98cQ325URI8KGau9FQ4OU
         z3PuEVExqSZc6Jgcg9Y/VCGlZv8avxhVP81YMBQ5i38QXm4lBckV+YnoXxBqiIDVqFwz
         t2DWysf3xRgcLY8OqM15nqlvPyv4S94P+GYA8vjEScBNnfvio8usQoy3VGeLcrqE8eLK
         ZqNF0+yIc+bcaOr6EEzfQLvknR6Wmi4ojCK3KzkbENOXYhIh0vAWBI/bMGl3i3JyAbSG
         i2nw==
X-Gm-Message-State: APjAAAVfac8BD0pk1hG6IigevkZ/qu35uMpbiUVvOfFJ5FAgg8cQHETs
        XytzSBQvKntQpBVigMKsxlDbEDWtarluGSr8tAocdw==
X-Google-Smtp-Source: APXvYqzDwXEeJpjBAbUVp7P1xM0YAYYCf1VtkMTqM0lrwSFZEhZXYIV6mkwoFCy10QW66IskEuQfvlBu/ePB7p183PE=
X-Received: by 2002:a05:620a:143b:: with SMTP id k27mr16695729qkj.127.1567195822193;
 Fri, 30 Aug 2019 13:10:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1566907161.git.amit.kucheria@linaro.org>
 <1cb5ab682bce53d32f3a73b5b29cc6c3e800bfcc.1566907161.git.amit.kucheria@linaro.org>
 <5d65cc4a.1c69fb81.376b6.2486@mx.google.com>
In-Reply-To: <5d65cc4a.1c69fb81.376b6.2486@mx.google.com>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Sat, 31 Aug 2019 01:40:10 +0530
Message-ID: <CAP245DX1PfszgyL4JB60zqbFynusXUjATrkUr1_Ps6NG-fRx=g@mail.gmail.com>
Subject: Re: [PATCH v2 09/15] arm64: dts: msm8996: thermal: Add interrupt support
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Brian Masney <masneyb@onstation.org>,
        DTML <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Aug 28, 2019 at 6:05 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Amit Kucheria (2019-08-27 05:14:05)
> > Register upper-lower interrupts for each of the two tsens controllers.
> >
> > Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi | 60 ++++++++++++++-------------
> >  1 file changed, 32 insertions(+), 28 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > index 96c0a481f454e..bb763b362c162 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> > @@ -175,8 +175,8 @@
> >
> >         thermal-zones {
> >                 cpu0-thermal {
> > -                       polling-delay-passive = <250>;
> > -                       polling-delay = <1000>;
> > +                       polling-delay-passive = <0>;
> > +                       polling-delay = <0>;
>
> Is it really necessary to change the configuration here to be 0 instead
> of some number? Why can't we detect that there's an interrupt and then
> ignore these properties?

AFAICT, the thermal core currently depends on the passive and
polling_delay being set to 0 to avoid setting dispatching polling work
to a workqueue. If we leave the values to set, we'll continue to poll
inspite of an interrupt. See
thermal_core.c:thermal_zone_device_set_polling()

But I agree, the core should detect the presence of an interrupt
property and ignore the polling intervals. I'll see if I can fix this
up later.

Regards,
Amit
