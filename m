Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DC4351112B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 08:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358128AbiD0GdZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Apr 2022 02:33:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358125AbiD0GdW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Apr 2022 02:33:22 -0400
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00DD62716
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 23:30:08 -0700 (PDT)
Received: by mail-oo1-xc2a.google.com with SMTP id g14-20020a4ab80e000000b0035ce300c25aso197941oop.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Apr 2022 23:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=ZcU95OJBm8X6qJVVZNisfeK1zEsLfj9CNZTaDh3N4nU=;
        b=ag1roHdB2K1yzlq9dFTGsJJvsffuGYEXzn6ibT2hl0TaVtdptlJphN0GDVBDxcrKBB
         ytU+7evSlbakjpAKMhrdFS72fmCiijmOTvLzSPwLdEpjJe+btGITql3SPLelFT6v57JK
         Zt3zb44LA2/nt9Ejd0wO/v/kuGBDwD3oqpAZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=ZcU95OJBm8X6qJVVZNisfeK1zEsLfj9CNZTaDh3N4nU=;
        b=zC607UEIuM8fRr8w6OpTaa6RqrRGFVzvUK7IzLeDeKaqm2K4RgYNamAz9tijxwe68k
         MGseDrWHS1DrRuTKkw1OFbR45Ed599leup7ij13wJJefz8qVGayLV0gbAFBStWkDpxS/
         bnvNbNCk48RwZD3OnTvZOPwsVifQwJJJiEZ+IgWC7dwxzFJtXAZ20NpkmqhL1gVlooVy
         swIUavqHLQhhi0tq52XC4C9UvBeHpqJ+mW+6OBCZoQVOGDPjj0dbC73vMC8YyzhO8LD8
         gVu4AbQ15W36iAtG8jTCCZFpMlGv/FUQ9my3pECwKJKmcRlel313uiS1svTp497R1WU5
         UFCQ==
X-Gm-Message-State: AOAM532/QtK+0uRxe9xLxGwQ/2igoakZ3MkdmrOdBgQCB5vN5e1PEnKb
        Py4lXBq7VVuUbH6G7WnYmQdSdbKe25mi64vWzWdzxGqlpTs=
X-Google-Smtp-Source: ABdhPJwuWwlKS8DobIkm1brTfZUBXzXzpuTAuGOyl9Q/wcEdhQNq1+7Uq+kQVZMEsCDnBy4lYpVyrB02v3hwyJXFM7g=
X-Received: by 2002:a4a:6b49:0:b0:329:99cd:4fb8 with SMTP id
 h9-20020a4a6b49000000b0032999cd4fb8mr9484974oof.25.1651041008163; Tue, 26 Apr
 2022 23:30:08 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 26 Apr 2022 23:30:07 -0700
MIME-Version: 1.0
In-Reply-To: <104b529b-946d-f171-5a82-6052aef2dbbb@quicinc.com>
References: <1649939418-19861-1-git-send-email-quic_c_skakit@quicinc.com>
 <1649939418-19861-5-git-send-email-quic_c_skakit@quicinc.com>
 <CAE-0n50HR6w-v3ub8HR_K2PsqqTTrVAaQa0pZ7QjY39WmkDyQQ@mail.gmail.com>
 <010bd223-94a0-fe8c-d1ab-39153bb68a7d@quicinc.com> <a4cbdb4c-dbba-75ee-202a-6b429c0eb390@quicinc.com>
 <104b529b-946d-f171-5a82-6052aef2dbbb@quicinc.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 26 Apr 2022 23:30:07 -0700
Message-ID: <CAE-0n532pgMKBFmK2etwCjMydKqD276X-veqqsne=WgE-sUegA@mail.gmail.com>
Subject: Re: [PATCH V10 4/9] mfd: pm8008: Add reset-gpios
To:     Satya Priya Kakitapalli <quic_c_skakit@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Satya Priya Kakitapalli (Temp) (2022-04-26 23:03:08)
>
> On 4/27/2022 10:58 AM, Satya Priya Kakitapalli (Temp) wrote:
> >
> > On 4/18/2022 10:34 AM, Satya Priya Kakitapalli (Temp) wrote:
> >>
> >> On 4/15/2022 5:40 AM, Stephen Boyd wrote:
> >>> Quoting Satya Priya (2022-04-14 05:30:13)
> >>>> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> >>>> index c472d7f..97a72da 100644
> >>>> --- a/drivers/mfd/qcom-pm8008.c
> >>>> +++ b/drivers/mfd/qcom-pm8008.c
> >>
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return PTR_ERR(chip->reset_gpio);
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpiod_set_value(chip->reset_gp=
io, 1);
> >>> Does this do anything? Does this work just as well?
> >>>
> >>> =C2=A0=C2=A0=C2=A0=C2=A0reset_gpio =3D devm_gpiod_get(chip->dev, "res=
et", GPIOD_OUT_LOW);
> >>> =C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(reset_gpio))
> >>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(reset_gpio)=
;
> >>>
> >
> > This is not working as expected. We need to add
> > "gpiod_set_value(chip->reset_gpio, 1);"=C2=A0 to actually toggle the li=
ne.
> >
>
> I checked again and it is working after using GPIOD_OUT_HIGH instead of L=
OW.
>
> reset_gpio =3D devm_gpiod_get(chip->dev, "reset", GPIOD_OUT_HIGH);
>  =C2=A0=C2=A0=C2=A0=C2=A0if (IS_ERR(reset_gpio))
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return PTR_ERR(reset_gpio);
>

What do you have in DT for the 'reset-gpios' property? GPIOD_OUT_HIGH
means the reset line is asserted, which presumably you don't want to be
the case because you typically deassert a reset to "take it out of
reset". Using GPIOD_OUT_HIGH probably works because DT has the wrong
GPIO flag, i.e.  GPIO_ACTIVE_HIGH, for an active low reset, or vice
versa.
