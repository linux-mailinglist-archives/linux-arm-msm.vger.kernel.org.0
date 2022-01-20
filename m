Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E38749491B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jan 2022 09:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358755AbiATIGn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jan 2022 03:06:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239073AbiATIGi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jan 2022 03:06:38 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E124BC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jan 2022 00:06:37 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id g2so4928193pgo.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jan 2022 00:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6MotDTbNoN+oGigz2Dz9rqju7rJ74CQrGAnlMebYt5c=;
        b=hLleXYpeLhpaDeDq/oDeNwtbvrt0c+0QWgy/dMDtxzTabc5WeILbNkkw5MKZ6hzPWN
         qZQbFjaVDo1gf4cd4j8yiWZCmD95Xj6f/aZOJnCP6qAOiyUsLdHUOb9wcC4d9NYnANMO
         kt4RAIiT0xDXHrbgkX0x2DoACnMubdKZUq1Tg9FveQG2TLokBu942+Jvw/90HSyxgwwm
         gpEMATjqKQg1pFewOWyUEuKig9rGRADl8hG4Jylx+6aIe78Fo8/aS692ZxpTNyDaJo4t
         ODck2xCNzCedAdzkRaLGAzVebQBm75lj8t3Axim3iDyPDXL7xlr0faJGBA5VM/jXB/Kz
         4yHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6MotDTbNoN+oGigz2Dz9rqju7rJ74CQrGAnlMebYt5c=;
        b=lLu54DB4RgfhuyAt1eGwSlhLvjg1jCCcRMdL6dGSUdON/Rpg9bh29L7KbhEZp9U1EB
         WmQ07zxGVWNGamR1PMi8glZVRzbga8JWzhDDkg9UlfxM46TjVY9C8HoE8oykrlZaAMrq
         hEEdMnbyHA0irdCqPGVor6mmHeZeKgrDTfLHs+cc8hxRsGOCLLPw0pjy//t7wYq8SHwL
         r9tJR1y4Tu8jc05nN7VEZfRZey4OTc8rOPXV5cQqRLQIhcTKy3NNmxU2LveyI8XcvmmA
         pJGFSOv8dL/je15c6+sB0lvGDGHUy1H/cRCtezxrFg5KJG764Z8A7OoKH0t3nmfqGf8u
         DF6A==
X-Gm-Message-State: AOAM530l3C1R38pFpc1DSUM0eNjtiKVNo7doTkHUGFLyIgaTLiu8ZcXA
        prV2YiNT1oXgvRqUAemqmA8Oa59si4R9Y1QVmOp5xw==
X-Google-Smtp-Source: ABdhPJxgpiGuRUSH63K0vKEsBNswrtEsWqarymPitjrPi16y/PfJsIWUrmIXZZT3gS/dQgxnGCwBphY0K2qZa6Q/wM8=
X-Received: by 2002:a63:2a57:: with SMTP id q84mr6221003pgq.167.1642665997308;
 Thu, 20 Jan 2022 00:06:37 -0800 (PST)
MIME-Version: 1.0
References: <1642586079-12472-1-git-send-email-loic.poulain@linaro.org> <CAA8EJpro3OQB4bcXu78xfP=MUfLbh8Spkb4Kh_NyQbnEo+d5vQ@mail.gmail.com>
In-Reply-To: <CAA8EJpro3OQB4bcXu78xfP=MUfLbh8Spkb4Kh_NyQbnEo+d5vQ@mail.gmail.com>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Thu, 20 Jan 2022 09:18:19 +0100
Message-ID: <CAMZdPi82PjPOQ5_jGteu0YjBRf9g4-aoV+HKJ8Rubx-vaabgTw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dsi: Fix byte clock interface rate for 14nm PHY
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     robdclark@gmail.com, sean@poorly.run, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dm

On Wed, 19 Jan 2022 at 11:45, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 19 Jan 2022 at 12:42, Loic Poulain <loic.poulain@linaro.org> wrote:
> >
> > According to downstream driver, byte intf clk rate should be half the
> > byte clk only with DSI PHY verion above 2.0 (14nm):
> > https://source.codeaurora.org/quic/la/platform/vendor/opensource/display-drivers/tree/msm/dsi/dsi_display.c?h=LA.UM.8.12.3.1#n3991
>
> This is a bit strange. We have other 14nm DSI PHYs, which are thought
> to be working (msm8996, sdm660). Not tested by me, though.
> And msm8916 has 28nm-lp, which according to CAF's patch should also use

Yes, It's not clear to me if this clock configuration is just a
recommendation or a requirement. All I can say is that it fixes DSI
issue on QCM2290 14nm, so maybe I should be more conservative and
restrict this behaviour to QCM2290 phy only?

[...]
> > diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> > index 7414966..f4849e6 100644
> > --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> > +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> > @@ -897,6 +897,9 @@ static int dsi_pll_14nm_init(struct msm_dsi_phy *phy)
> >
> >         phy->vco_hw = &pll_14nm->clk_hw;
> >
> > +       /* For PHY version <= 2.0 (14nm), byte_intf_clk = byte_clk */
> > +       phy->no_byte_intf_clk_div = true;
>
> This setting can go into constant phy configuration instead. And also
> note that there are other <= 2.0 PHYs (20nm, 28nm).
> Do they share this property?

According to downstream, yes, but I can not test on other PHYs.

Regards,
Loic
