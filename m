Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AEE6C6DB481
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 21:54:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjDGTyH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 15:54:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjDGTyG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 15:54:06 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7B8976D
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 12:54:05 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-54c12009c30so100135817b3.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 12:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1680897242; x=1683489242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrOIisSFZPNWCByFT5woSVh3MP9puEjylwTuN1wcUU0=;
        b=Hm3wXNUYtgb92h2GrSrdaDeM23KBQ6T5btlKTrZcHl9apmKhVLjulmhxiib705qd26
         RzzLkHW7szbTDKUrWf2w9IFFTYoRqqIa6wWixy4X0PuChpv/G/S8BGjLqoRXPdFpytB2
         CPkpi2lPWdsIDCuPzbLQuZqiBc3kChl2AX0e0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680897242; x=1683489242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrOIisSFZPNWCByFT5woSVh3MP9puEjylwTuN1wcUU0=;
        b=RpgFVBq0WCQoTgZ8ata1rOu2txknlYa0m+paK5k7/jMQGc1+MW+6OyFwfBWiiwEJeJ
         CfS2ZRO/juvYGIXRUdHoPdR9Ay8NAkcjzzEkrYQQGIxUbBu+8Vcc/OCLrmWhGM6WYVIj
         tyE5+h87W52e8nbaVnhjyRQvqTbYMB0EvHy7fgSFh2U38L+gIybPnqJq6Au0X+OQ8VqT
         cLke3adkAc+UWm5nDTEiKYcdjf2LITnKUwptccyje4OEaCX21hUwc8nygT4723TDFv+V
         ahEaAse+j5bm5JS45+1IH8lN5A29HOl5OvvXUmt7mVw/VkxInloulIq4rQrwUWAI3yiZ
         gTfw==
X-Gm-Message-State: AAQBX9cqOM+C0AggUb7cyYVqHixPP9ds5tvM5BgQ1lv54dy5I/DZQ6Iq
        CJZ3wk791bR9/q/8k5VsOTi2XZ+EMdL3duQynt8=
X-Google-Smtp-Source: AKy350acFNK189dZMUMJZH8yKtnfEpG2OVs+hjpZMvlIFkoreJqyniSEFUSArDsS6gtUOxMIt5SMqQ==
X-Received: by 2002:a81:92cc:0:b0:54c:29d6:bba4 with SMTP id j195-20020a8192cc000000b0054c29d6bba4mr3062588ywg.28.1680897242112;
        Fri, 07 Apr 2023 12:54:02 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id cj3-20020a05690c0b0300b00545a08184b9sm1208754ywb.73.2023.04.07.12.53.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Apr 2023 12:54:00 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5416698e889so813392467b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 12:53:59 -0700 (PDT)
X-Received: by 2002:a81:e20a:0:b0:54d:4a49:ba22 with SMTP id
 p10-20020a81e20a000000b0054d4a49ba22mr1345371ywl.7.1680897239277; Fri, 07 Apr
 2023 12:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230323173019.3706069-1-dianders@chromium.org>
 <20230323102605.12.I6f03f86546e6ce9abb1d24fd9ece663c3a5b950c@changeid> <43b74b3f-e607-ba55-a5fa-326fb4b5519d@linaro.org>
In-Reply-To: <43b74b3f-e607-ba55-a5fa-326fb4b5519d@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 7 Apr 2023 12:53:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VvgbPKQsOirMa-k0PE-KAvjWy+iMWd0TCbysYirwEH7w@mail.gmail.com>
Message-ID: <CAD=FV=VvgbPKQsOirMa-k0PE-KAvjWy+iMWd0TCbysYirwEH7w@mail.gmail.com>
Subject: Re: [PATCH 12/14] arm64: dts: qcom: sc7180: Fix trogdor qspi pin config
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-gpio@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, Andy Gross <agross@kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 7, 2023 at 11:11=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 23/03/2023 18:30, Douglas Anderson wrote:
> > In commit 7ec3e67307f8 ("arm64: dts: qcom: sc7180-trogdor: add initial
> > trogdor and lazor dt") we specified the pull settings on the boot SPI
> > (the qspi) data lines as pullups to "park" the lines. This seemed like
> > the right thing to do, but I never really probed the lines to confirm.
> >
>
>
> >  &qup_i2c2_default {
> > @@ -1336,6 +1340,22 @@ p_sensor_int_l: p-sensor-int-l-state {
> >               bias-disable;
> >       };
> >
> > +     qspi_sleep: qspi-sleep-state {
> > +             pins =3D "gpio63", "gpio64", "gpio65", "gpio68";
> > +
> > +             /*
> > +              * When we're not actively transferring we want pins as G=
PIOs
> > +              * with output disabled so that the quad SPI IP block sto=
ps
> > +              * driving them. We rely on the normal pulls configured i=
n
> > +              * the active state and don't redefine them here. Also no=
te
> > +              * that we don't need the reverse (output-enable) in the
> > +              * normal mode since the "output-enable" only matters for
> > +              * GPIO function.
> > +              */
> > +             function =3D "gpio";
> > +             output-disable;
>
> Doug,
>
> I acked some of your patches, but I assumed you tested all this. It
> turns out you never run dtbs_check on the patches you sent.

I'm fairly certain that I ran dtbs_check and confirmed that no new
errors were introduced on the device tree files that this patch series
cleaned up. Did I miss one? I did not try to go through and fix all
examples of people using "input-enable" across all Qualcomm device
trees, though. Those old device trees still work even if they're using
the now-deprecated bindings. When deprecating something my
understanding is that it's not required to go back and immediately
transition all old device tree files.

If having the "input-enable: false" in the bindings is causing huge
problems we could do a blank search-and-replace to rename it to
"output-disable", at least for places under "tlmm". Even if there are
cases where it's superfluous it would at least make the bindings
validate.

-Doug
