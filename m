Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 294A957043E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 15:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiGKN1Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 09:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbiGKN1Y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 09:27:24 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDEE833436
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 06:27:22 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id r3so8692983ybr.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 06:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=mT4Qh8A8Far+/DHPkE8F6kYcr+1vuSwNz43sCniZGvU=;
        b=aTdG9RqicfXRk8QirsPR1TgUrG2JX+zX/MS3fXg9wA5Ip69866xHCZgx/TBHHDxL3R
         NBMN4eWpE8Ge+/e+vmz9I59XFs+MbMN/IOgeodb2bts8rUDQS+uFtY4cAMuOW3vHqf3t
         yP7Mon8IqFwnlC7GzXR2TOxklIdTQv2W+AlaFNGcEq7DWWmIunGkJUlW40aWO+EJf8jF
         Cf6EHAYAlFxKBbWXQRcZx2UtX0qL0+n6qyVlL/sfXaYC87f+/Qg7/gjoJhzBJ+45YZz9
         iX+UcKtPDUPiIY8Lk19hvY9QP6aN8Zjbew7/WZkSUXmiTrl0uqLcg8Md1E2yw4BLEA5a
         BXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=mT4Qh8A8Far+/DHPkE8F6kYcr+1vuSwNz43sCniZGvU=;
        b=vYnUenZPsTyFHv2g/AAhIm/qtxQW3GyDaSoMC4rZ1Z4XSYX4atLHjBCE9L2Jf9yhHI
         Nc/MFgDXBUM6eZbIsMHvJ9UVWNIHzEwiovwseE5u7bBgXrRmtrc1IoPv6KFpjNDunLZM
         /wi0DKgYpXnuMlH2JvWcVXCxGw6V9Ps5JKYzkgLngNrV+eGuePyFe2dhWrqu7IG6jwfx
         miEPDPSWeSXYuG5b5Srs5HFxnTHz04zeywizvkqBwYFuYCaIWGx8lVQep220p4uHcR6j
         dvqci7KZDEl//ba6N4M/lzum3/SOapAnLYklPmLJE8RaqQla4K2VJapNv23wpDCKmdM/
         PMTw==
X-Gm-Message-State: AJIora99/2tH2k7ZWxN4g7PCRmdA0FNj1w0GAU1bAWI0gSPgO5F91iEv
        oScrPptVf5Y2/Lr3W4oAX28yyaCoCU8586SX04aZQg==
X-Google-Smtp-Source: AGRyM1v11fP7aHOUKGOnDmZAX6+MyM2Y7NTmnHeu2fIYqKgRzak17zP6jC8EDr2oDfXE08vqsyjH/zheAxI7AeAvzjY=
X-Received: by 2002:a25:4046:0:b0:66e:ddca:2ff5 with SMTP id
 n67-20020a254046000000b0066eddca2ff5mr15258549yba.492.1657546042064; Mon, 11
 Jul 2022 06:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211125213451.62010-1-dominikkobinski314@gmail.com>
 <20211125215310.62371-1-dominikkobinski314@gmail.com> <CACRpkdau+wHpoWa1JrLt35dnCHJejs8HZkkzZCrrcnRCx3SinQ@mail.gmail.com>
 <9a925f87-a78b-0164-bdaf-99e14dc943cd@gmail.com>
In-Reply-To: <9a925f87-a78b-0164-bdaf-99e14dc943cd@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 11 Jul 2022 15:27:10 +0200
Message-ID: <CACRpkdZeAQyidT11Vs_EsmANogStfQWK_TmAWe9zHrNScmmvGA@mail.gmail.com>
Subject: Re: [PATCH v2,1/5] pinctrl: qcom: spmi-gpio: Add pm8226 compatibility
To:     =?UTF-8?Q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc:     Dominik Kobinski <dominikkobinski314@gmail.com>,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 8, 2022 at 9:43 PM Matti Lehtim=C3=A4ki
<matti.lehtimaki@gmail.com> wrote:
>
> On 26.11.2021 2.49, Linus Walleij wrote:
> > On Thu, Nov 25, 2021 at 10:53 PM Dominik Kobinski
> > <dominikkobinski314@gmail.com> wrote:
> >
> >> Add support for pm8226 SPMI GPIOs. The PMIC features
> >> 8 GPIOs, with no holes inbetween.
> >>
> >> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> >> Suggested-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> >> Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
> >
> > I applied this to the pinctrl tree.
> >
> > Is there anything else I should be applying?
> >
> > Yours,
> > Linus Walleij
>
> I noticed that this patch was never applied into kernel while the other
> patches such as the device tree documentation were applied. Maybe it was
> missed accidentally? I checked also the pinctrl tree and didn't find the
> commit there either in the branches for the upcoming releases.

Weird I applied it now.

Yours,
Linus Walleij
