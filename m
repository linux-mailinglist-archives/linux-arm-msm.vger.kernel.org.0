Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 039812ABDE9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Nov 2020 14:55:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729706AbgKINz2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Nov 2020 08:55:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729320AbgKINz1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Nov 2020 08:55:27 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C35FC0613D3
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2020 05:55:27 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id y25so9486190lja.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2020 05:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lqe5HrIHoZLKJYdgktbLvnJ7WzCQkZi69agPba5hbSs=;
        b=N94TB+YLkY2zbd2qs/JZiN2GasG9bvVVY4+qr0qm28m37JUwCxHLgcQhFLqdiwG6wP
         36p80N800qtZO5Y5/54aZ3Ds3GAdrT9imWS8aZb8ep4LsnRqxn28rWQ0L4kka52r8KUG
         Y2WqlS12ZqNcQ/DS/XYF4A0rpu58FzeiaQhUG5lkWFp1nZDw4XW7skWOaX2w4Q67UGUV
         s40AMt4lrMVcsuOScsZYctM2DZ32eM3D7zQHgRHReNxiC06jnVgWx6g3kZ4JP9zfkx+S
         5/PrEpERodbnK0pJW7+SRxRRp4I/b2YxzIp3RZBBGl+I+yAbWCR+Um/ECXQr4LTJ/X/9
         eI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lqe5HrIHoZLKJYdgktbLvnJ7WzCQkZi69agPba5hbSs=;
        b=Tc0rw6W5adtwB8kNUK5gG39/uuBOp/lXRynpWHu3TPwocuRevaYcgQaqT3onYMlkdC
         2T1ffpgS6fUGSQGiPkvhbR6Uy9gmZo2RNAuNFW+z1YX06ccOJ+imBEY55AOOnHJaUJNw
         MykAJ6R7QESTvc9quR26Oc1/iiGlq3/a4cfZJ1RZwgdLYQIB5SIgPhcUrq7FAcsC6AWg
         mWh8J/41C8gNte2vMYWEUusFm46oCujGjQo6sjMJbI2cJvc8qJ2YdkUC/fuVcm9qrcE0
         HGeuKQtCgDjBuOrFkq4bAofOOyo1tedYlKV2d8wwuQWXFulM4kYg3EogwgSAEPSaDZr5
         DtWw==
X-Gm-Message-State: AOAM531QrqsG8QaPtgu5EmB17RkqJRdNBNAmFpCWSrA8SMpIMlDKaEJI
        BEPi05VgYyre8bfHNyDPAuLP90qpG0mxs0vQBfHKxQ==
X-Google-Smtp-Source: ABdhPJz3iQtflkEPiWk1FMPU1/Pd2p7uJeOvrzUebarKW+NuNnCZ6Uh/UONYKo/x7LVUoyml/JF+BdvydSLnid3qOuA=
X-Received: by 2002:a2e:b54a:: with SMTP id a10mr5875868ljn.139.1604930125511;
 Mon, 09 Nov 2020 05:55:25 -0800 (PST)
MIME-Version: 1.0
References: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
 <20201106061433.1483129-2-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20201106061433.1483129-2-ajye_huang@compal.corp-partner.google.com>
From:   Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date:   Mon, 9 Nov 2020 21:55:14 +0800
Message-ID: <CALprXBZmC=Qxk5fkGn=QJ4xW4tSGMZxb9LFUbqfMge0vLcP-dQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/2] ASoC: google: dt-bindings: modify machine bindings
 for two MICs case
To:     Ajye Huang <ajye.huang@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Rohit kumar <rohitkr@codeaurora.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        Patrick Lai <plai@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Cheng-yi Chiang <cychiang@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        ALSA development <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi, Rob

I follow your suggests that adding (maxItems: 1) for dmic-gpis property,
and keep one example of adding dmic-gpios property in it

Could you please kindly review it ?

Thank you so much
Ajye

On Fri, Nov 6, 2020 at 2:14 PM Ajye Huang <ajye.huang@gmail.com> wrote:
>
> Add a property "dmic-gpios" for switching between two MICs.
>
> Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
> ---
>  .../devicetree/bindings/sound/google,sc7180-trogdor.yaml  | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> index efc34689d6b5..ce050a9dec94 100644
> --- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> +++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
> @@ -34,6 +34,10 @@ properties:
>    "#size-cells":
>      const: 0
>
> +  dmic-gpios:
> +    maxItems: 1
> +    description: GPIO for switching between DMICs
> +
>  patternProperties:
>    "^dai-link(@[0-9])?$":
>      description:
> @@ -83,7 +87,7 @@ examples:
>    - |
>      sound {
>          compatible = "google,sc7180-trogdor";
> -        model = "sc7180-rt5682-max98357a-1mic";
> +        model = "sc7180-rt5682-max98357a-2mic";
>
>          audio-routing =
>                      "Headphone Jack", "HPOL",
> @@ -92,6 +96,8 @@ examples:
>          #address-cells = <1>;
>          #size-cells = <0>;
>
> +        dmic-gpios = <&tlmm 86 0>;
> +
>          dai-link@0 {
>              link-name = "MultiMedia0";
>              reg = <0>;
> --
> 2.25.1
>
