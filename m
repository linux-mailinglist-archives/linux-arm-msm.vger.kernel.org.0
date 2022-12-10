Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 20C926490AB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Dec 2022 21:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbiLJUmP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Dec 2022 15:42:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiLJUmO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Dec 2022 15:42:14 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A7215FE8;
        Sat, 10 Dec 2022 12:42:13 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id c17so7643399edj.13;
        Sat, 10 Dec 2022 12:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=e+2T2ToMLVzXZFpRAJTLeRIzrBiNyXhhwmgEK6d84vo=;
        b=qeq101M273s8G+iiaAmPhuugHLVfB6fgaii1ocPTKcovpKX5p6sBMW5jqPlkyiNAFq
         kVSKAaLEWSusL19BDf9Hfak/7BY32itehYahDME8RpwTapOTADKoLAxaxLG05l9k47MB
         Dnxdzq2uruwajspytDcR19fZvnZ8VGOPFu6jpmiidoYZoA36+HZOsGkUBWHOhnIJhuic
         oD8oUe3+mojkWzw8QRV7ND8zzwFzfbkFELRqEdyHCFpCxXPOJMcpghEf6IYM9JS7bKK8
         9Wu5iMtDJKP8QsZe1CMNiwW0Uap5VHgLek5Z5wsUmzreprif0q+nbFJMknK555ye9NIb
         +Xyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+2T2ToMLVzXZFpRAJTLeRIzrBiNyXhhwmgEK6d84vo=;
        b=ippa8QjC7gGo9IsodRETc51/jsoNO8Wku57H7dnmL8OggBOd4NS4AzzA18wjrzeDih
         SZ8bwTeBWf30w21pQFk1pNhhq0W03XIN8lENG9nnF5KN3o2FRRQlm7JkaIrJPJJRqt1j
         a9ahAsk57Qy78NC3EHIuOeXHm1fHr1i/jfaPyI0XsUIH8pYFQd/zYU7zfdW30mDq2iKy
         q5wLvOEKe/kH4LTpj5EYgx6+GEbbJB7XXP0RtALv1a5ZBPNHi+yRp7IoEobc5/F8knpm
         ZFtxotsbnsbo3RBGDviUO6F/6Wb8oD8ySMghe/WSxRDmkqHESn6uRzalzMi1wFgXV4uG
         MyKQ==
X-Gm-Message-State: ANoB5pmJS+eIxF6iBXEnKGboFAmeC1TNa8efRwU8nzTHbd2EElyNd9OB
        UdXoStvIHG16Q4W5DCP/ZeZtBc54vWq3lIumOTQ=
X-Google-Smtp-Source: AA0mqf7gs1cbmvAaowS4MErbt8H5/3FTntJ5kKGswoGEkxfeXhcGO0gnaFFjQXuWwElmLi29s6diG6dvC6zWmf9T38Y=
X-Received: by 2002:aa7:d555:0:b0:464:6485:419b with SMTP id
 u21-20020aa7d555000000b004646485419bmr72226563edr.382.1670704931976; Sat, 10
 Dec 2022 12:42:11 -0800 (PST)
MIME-Version: 1.0
References: <20221210134059.342423-1-dominikkobinski314@gmail.com> <3672bc8b-926d-1020-aff5-3753affac4a6@linaro.org>
In-Reply-To: <3672bc8b-926d-1020-aff5-3753affac4a6@linaro.org>
From:   Petr Vorel <petr.vorel@gmail.com>
Date:   Sat, 10 Dec 2022 21:41:58 +0100
Message-ID: <CAB1t1Czi7ORRuyNPECmzZavhQHMq1NSK1BUNOHMiyH+iCqaZ+g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: bullhead: add memory hole region
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Dominik Kobinski <dominikkobinski314@gmail.com>,
        linux-arm-msm@vger.kernel.org, pevik@seznam.cz, agross@kernel.org,
        alexeymin@postmarketos.org, quic_bjorande@quicinc.com,
        bribbers@disroot.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, 10 Dec 2022 at 20:36, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 10.12.2022 14:40, Dominik Kobinski wrote:
> > Add region for memory hole present on bullhead in order to
> > fix a reboot issue on recent kernels
> >
> > Reported-by: Petr Vorel <petr.vorel@gmail.com>
> > Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
> > ---
> It'd be better if the commit title said msm8992-bullhead instead of
> just -bullhead.
>
> >  arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> > index 71e373b11de9d8..3cf40d8cfdf6eb 100644
> > --- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
> > @@ -2,6 +2,7 @@
> >  /* Copyright (c) 2015, LGE Inc. All rights reserved.
> >   * Copyright (c) 2016, The Linux Foundation. All rights reserved.
> >   * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
> > + * Copyright (c) 2022, Dominik Kobinski <dominikkobinski314@gmail.com>
> >   */
> >
> >  /dts-v1/;
> > @@ -50,6 +51,11 @@
> >                       reg = <0 0x03400000 0 0x1200000>;
> >                       no-map;
> >               };
> > +
> > +             removed_region: memory@5000000 {
> The memory node should not be named "memory", but something more
> specific, "reserved" would fit this case. I know most DTs have
> them as "memory", but that turned out to be just what we *aren't*
> supposed to do :P

Hi Dominik, Konrad,

Konrad, thanks a lot for correcting us. I guess Dominik will send v2,
LGTM otherwise.

Kind regards,
Petr

>
> Konrad
> > +                     reg = <0 0x05000000 0 0x2200000>;
> > +                     no-map;
> > +             };
> >       };
> >  };
