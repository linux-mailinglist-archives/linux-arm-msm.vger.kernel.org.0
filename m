Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84D406D1B07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 11:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230147AbjCaJAB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 05:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231159AbjCaJAA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 05:00:00 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C25FD4C13
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 01:59:53 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id cn12so86940625edb.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 01:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1680253192; x=1682845192;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Yu3f2V+e4EaAUzQwuZ3S/oppL0PlLG/aTOTVG2SOQI=;
        b=YUP4PKRsSoQMh0PPFqhOKgoI3m1ystsRho+dQI8mv7YXsmpBc5oqws9E4jekOggY2M
         WlLaek7XOC3tzkuNr4E8adUiz7cj8/DbQnx9Pha6M+TDztwQan/W3a/f6MSTKTTB7IHn
         uFQJ41FJEBLht4kQn5l3XWVoKmbSvD+XKAv0YQgTly0n6jMK5UTT2cxm0xm8JlQMMIHI
         60y4dluzbYTVjn+a8CXnJqJ45agTqTsvNUgne2qG/l1WZH3TP65cfNV/XSDlqQH4Dmkx
         iGcDlzXMpDSbOhqVj5rszbpYpIScfvGpXtReqSsGa2krXBIzJdQHe/l5NW/duIkCHiZr
         CiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680253192; x=1682845192;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Yu3f2V+e4EaAUzQwuZ3S/oppL0PlLG/aTOTVG2SOQI=;
        b=xoUGrQyp9sNJHrYvn0cInsvPXh3o3Vc3dBOB37peWys3Do/Q4SKn3unEvCPhyCJGvB
         COuHoll0lTSl6GW752cILFwG1dazM2ZUJRth859fOTvGz+gifWHhLp58bey5HGstff6h
         YXV5b8dOB6+sFOdqNdg2MEyhdrQ08v/r7juRyS/wB2No8I8BJIV0EkKurOXLvmZaG6Tj
         dN5buEHOL9N3f0R5VsApnkhMy6cuir3AM25sXQ8pErJaD3uiC6d5EtTIoUnO+wSp3VH+
         kmbn0BChZjJ63PXKchoI38Cl4qXrnszD33w+zSRfwjWwEsLBkOatTj0xcTgsWX8vZPQH
         loYg==
X-Gm-Message-State: AAQBX9d1X09rBLc6/KBOOFq3mO9sKi0ux3lfKF9RACkE/imchaXbII6Y
        m4YNjq7b8iW2DUXVl6cnuWjHwQ==
X-Google-Smtp-Source: AKy350YBwpfyk+6HKlyijM9+lp3Jh5ac2jw1m0U30EJa9zB5cCVu3moTygvhNoBUvM6J1lK2j89FRg==
X-Received: by 2002:a17:906:138e:b0:92f:dcf7:9434 with SMTP id f14-20020a170906138e00b0092fdcf79434mr7621783ejc.9.1680253192262;
        Fri, 31 Mar 2023 01:59:52 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id m11-20020a170906160b00b00938041aef83sm742828ejd.169.2023.03.31.01.59.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 01:59:52 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Fri, 31 Mar 2023 10:59:51 +0200
Message-Id: <CRKG1O4FKEAM.1629YG20LFZBN@otso>
Cc:     "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: configure
 flash LED
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Pavel Machek" <pavel@ucw.cz>,
        "Fenglin Wu" <quic_fenglinw@quicinc.com>
X-Mailer: aerc 0.14.0
References: <20221209-fp4-pm6150l-flash-v1-0-531521eb2a72@fairphone.com>
 <20221209-fp4-pm6150l-flash-v1-3-531521eb2a72@fairphone.com>
 <Y5S+6j1yJ62RJU/v@duo.ucw.cz> <COZW5FAXA36Z.175ARPIESQSLL@otso>
 <ab314039-2c69-8afa-cfb2-e5876ac6afe2@quicinc.com>
 <ZByucIecBARC/2X2@duo.ucw.cz>
In-Reply-To: <ZByucIecBARC/2X2@duo.ucw.cz>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Pavel,

On Thu Mar 23, 2023 at 8:54 PM CET, Pavel Machek wrote:
> Hi!
>
>
> > > > I'm pretty sure the flash is not yellow.
> > >=20
> > > The marketing term is Dual LED flash or Dual-tone flash, one LED is a
> > > blue-ish white and one is a yellow-ish white, but from what I can tel=
l,
> > > in the original code it's always referred to as white and yellow so I
> > > also followed that here.
> > >=20
> > > Also the LEDs are right next to each other so in practise for torch j=
ust
> > > both go on, and for camera flash I cannot really tell you but I guess
> > > it's doing something there with the camera tuning.
> > >=20
> > > See also this picture:
> > > https://shop.fairphone.com/media/catalog/product/cache/b752d78484639b=
19641a8560800d919d/p/_/p_5b_main_camera_back.jpg
> > >=20
> > Hi Pavel,
> >=20
> > Luca is right. It is normally called dual CCT (Correlated Color Tempera=
ture)
> > flash LED. It has 2 LEDs, one is with higher CCT (~6000K) so it looks l=
ike a
> > white LED, another is with lower CCT (~2000K) and it looks like a yello=
w
> > LED. I am not an expert of this but my understanding is the camera tuni=
ng
> > process normally adjusts the brightness of the two LEDs and enables the=
m to
> > get different CCT for different snapshots.
>
> I believe this is normally called "warm white" and "cool white", no?
> Yellow would be monochromatic light at cca 575nm, see
> https://en.wikipedia.org/wiki/Shades_of_yellow .

I don't really have any more information I can provide right now. If you
feel it should be called warm white and cool white, feel free to send a
patch changing it.

I'm personally okay with it being called white & yellow since that seems
to be the term used in (downstream) software for these kinds of leds.

Regards
Luca

>
> If we need to add some defines for that, lets do that.
>
> BR,
> 									Pavel
> --=20
> People of Russia, stop Putin before his war on Ukraine escalates.

