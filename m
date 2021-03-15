Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B47A33C8CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Mar 2021 22:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233711AbhCOVtx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Mar 2021 17:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232014AbhCOVtc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Mar 2021 17:49:32 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94A6BC06175F
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 14:49:31 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id l15so8576847qvl.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 14:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CFeSJS/MRHlKtItdRjinPI+VLJU1JVPOY38JbLtHXag=;
        b=oEtzhfheH12wp/ca7p21OEaxExfRoiHNdT6o/p3p23Ws/jJ3D1GK7+kCr/hbGBXR50
         Dy1yFg8C/fDxgdwaA+veTFn++A32/JJ+rfknledpTJxlE7LaSQpzot0JTIkn5p0ovbfO
         1bNq3gCpOr+5/q+VZuq/wp3Yzs9uHRYCvzFog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CFeSJS/MRHlKtItdRjinPI+VLJU1JVPOY38JbLtHXag=;
        b=DQeOt4bErSuRlgYmHgn3NzcGvIYPU8Grk+eOrdzwxpwTBcKpE4kGgiKlQQZvRSJQr2
         4o9Ux1d/VVGcKWwLQcJBBYSsmvfv0lCgW5c0+R+OAG6rl8G9aPuBKzaok6EB60d31Wt1
         5k7YpLBpvFJwPwStkayC8ko6iURSTJpq4B3lSNJ8pe2rilcRACLhExyVKyWI14N5f5jw
         WTwg5sDntMO1UfX2fm7vsRPonJHsVmBPdn3xRM9wpTU3kC127h+epJHUEUs0claFAPLy
         DeMRkUUGs1H3Kfrj3h0iljo8QCF+OUqCvhGQ6MkDmY1uQheYLRA44spDUAqXtiJgj9+Q
         rgBw==
X-Gm-Message-State: AOAM533TZ6lYFxGrElqOSqorWtyu2mmNj++mas3cPgzJfEitBWbjFSHT
        XatcVn58BeFGE8DUfJe8Z8AyMYDuHROSxA==
X-Google-Smtp-Source: ABdhPJz0Ai29PyCFYyi1awQ+JL9mWmsSUt4ahsiFwDw2sPFIj2fIUvoywrOyFGgdBUyc1QuQt9ftdw==
X-Received: by 2002:ad4:44a9:: with SMTP id n9mr13037600qvt.60.1615844969924;
        Mon, 15 Mar 2021 14:49:29 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id d19sm5343145qtn.96.2021.03.15.14.49.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 14:49:20 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id p193so34756981yba.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Mar 2021 14:49:16 -0700 (PDT)
X-Received: by 2002:a25:cf88:: with SMTP id f130mr2592963ybg.476.1615844956124;
 Mon, 15 Mar 2021 14:49:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210312183228.550779-1-mka@chromium.org> <20210312103211.v2.3.I95b8a63103b77cab6a7cf9c150f0541db57fda98@changeid>
In-Reply-To: <20210312103211.v2.3.I95b8a63103b77cab6a7cf9c150f0541db57fda98@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 15 Mar 2021 14:49:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xq4bd8j3_to_9rJmyqWTi-78OWVCd0meaJ9e_pmOH+Rg@mail.gmail.com>
Message-ID: <CAD=FV=Xq4bd8j3_to_9rJmyqWTi-78OWVCd0meaJ9e_pmOH+Rg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sc7180: Add CoachZ rev3
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Mar 12, 2021 at 10:32 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> CoachZ rev3 uses a 100k NTC thermistor for the charger temperatures,
> instead of the 47k NTC that is stuffed in earlier revisions. Add .dts
> files for rev3.
>
> The 47k NTC currently isn't supported by the PM6150 ADC driver.
> Disable the charger thermal zone for rev1 and rev2 to avoid the use
> of bogus temperature values.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v2:
> - added CoachZ rev3
> - updated subject and commit message
>
>  arch/arm64/boot/dts/qcom/Makefile              |  2 ++
>  .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts |  9 +++++++++
>  .../dts/qcom/sc7180-trogdor-coachz-r2-lte.dts  |  4 ++--
>  .../boot/dts/qcom/sc7180-trogdor-coachz-r2.dts | 13 +++++++++++--
>  .../dts/qcom/sc7180-trogdor-coachz-r3-lte.dts  | 18 ++++++++++++++++++
>  .../boot/dts/qcom/sc7180-trogdor-coachz-r3.dts | 15 +++++++++++++++
>  6 files changed, 57 insertions(+), 4 deletions(-)

So what you have here is good and we could land it. Feel free to add
my Reviewed-by tag if you want.

...but I want to propose an alternative. It turns out that these days
coachz-r1 and coachz-r2 are actually the same. The only reason both
exist is because <https://crrev.com/c/2733863> ("CHROMIUM: arm64: dts:
qcom: sc7180: add dmic_clk_en back") wasn't the proper inverse of
<https://crrev.com/c/2596726> ("CHROMIUM: arm64: dts: qcom: sc7180:
remove dmic_clk_en").

It sorta squashes two changes into one, but if you combined your
change with one that folded "-r1" into "-r2" it would actually make a
smaller / easier to understand change, essentially, it would be:
- just a rename of the "-r2" file to be "-r3"
- add "-rev2" into the list of compatibles in "-r1" file.
- add the "disable" into the "-r1" file.

Anyway, I'll leave it up to you.


-Doug
