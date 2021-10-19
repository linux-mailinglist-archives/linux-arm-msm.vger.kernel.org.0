Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3512243400A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 22:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhJSU7d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 16:59:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbhJSU7c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 16:59:32 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1A47C06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 13:57:19 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so3613837otb.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Oct 2021 13:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bCvmWzHQrYIfnO0ni9WAgMr+c10EzSFOwZC7pgW4XHI=;
        b=uiCrBAiRW2zOddDPJJEsxpT1djYlOt7sAS8zE/E6GGuHPVZOiSEQPa2Nicjk5NGnDS
         inye6mIny+cC380QqBW7vlpo8qwc8TZNbfskz/jOD6HvnbqQ2clH7C/mgWj/8evaxOmC
         VUPXz5bEVkcojmwV9hfKJl61c6wPtshobWJXVYEzkqXcpTqZzztEAjYgRbLMjFylCtIQ
         /bULOvTGm6JPbHw4B49Mlvfd83GeinfF3giG0vW87248ZYHyC/j9uOGBZJySHlpoSbT+
         26M8b8bIM/wtGlM+0TzgzdkSJ8z7u94AzAybdG3u1raDZXlGMP3S4yyMztmcAkvxiMtm
         U3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bCvmWzHQrYIfnO0ni9WAgMr+c10EzSFOwZC7pgW4XHI=;
        b=uTeSZ1yFBRtcmzly2ryqo7U1T0IDxqCqMSaJwO4ItJTNY1vzWm+R3kwKS0xNwu+5qq
         Z7AGe45UWUhlVPppDRuRqTfYZckL3rT+CJhteRdIyCngDnkCnyjBaOR/+uMZH/ar04qW
         JLra0NoyF25by/xcDOhLWD9QJYPmgiaTtxSSnBQVU0Oo/GX+FEVtjziUQu8OGAPCAPts
         JzWTd3K0f3NDKcNeDjGxzFSMy8wUgDdQyZv0B1BlY+CCLkkTkaUp+Zfm0A8oEvCwk/zn
         gGIwEYKkpefAIvxrC/ynuQel6+QW0lb3xxHcfKIv/1V2SDOOe7lqpX8ehuizGd5PHk7S
         Dk7Q==
X-Gm-Message-State: AOAM533JvGJYZ0vqGlvbNeto1VxclPVfCuGbfpLx5epjtgzCvpaqOzR5
        quRWJKqyI3hdh0W6qdgwCpyuhg==
X-Google-Smtp-Source: ABdhPJxYKbXVgJME4uWfjnB1za8f5xBVAtcttFEGbUiN1i8iAO/vSf6B027OrhcBA1UCQTNb1JZjIw==
X-Received: by 2002:a05:6830:24a9:: with SMTP id v9mr7189676ots.326.1634677038861;
        Tue, 19 Oct 2021 13:57:18 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id e23sm29938oih.40.2021.10.19.13.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 13:57:18 -0700 (PDT)
Date:   Tue, 19 Oct 2021 13:59:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Arnd Bergmann <arnd@kernel.org>,
        Rajesh Patil <rajpat@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        msavaliy@qti.qualcomm.com, satya priya <skakit@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH V10 8/8] arm64: dts: sc7280: Add aliases for I2C and SPI
Message-ID: <YW8xl0fLnQE5o3AQ@ripper>
References: <1632399378-12229-1-git-send-email-rajpat@codeaurora.org>
 <1632399378-12229-9-git-send-email-rajpat@codeaurora.org>
 <CAK8P3a3KuTEAXbSTU+n3D_fryquo8B-eXSF2+HrikiNVn6kSSg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3KuTEAXbSTU+n3D_fryquo8B-eXSF2+HrikiNVn6kSSg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 19 Oct 13:43 PDT 2021, Arnd Bergmann wrote:

> On Thu, Sep 23, 2021 at 2:18 PM Rajesh Patil <rajpat@codeaurora.org> wrote:
> >
> > Add aliases for i2c and spi for sc7280 soc.
> >
> > Signed-off-by: Rajesh Patil <rajpat@codeaurora.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> 
> I saw this in the pull request, can this please be reverted?
> 

Yes, this can certainly be corrected.

> Putting the aliases into the .dtsi file is really silly, as there are
> likely boards that
> don't connect every single one of those, and then will have to
> override and renumber
> them.
> 
> Please only list the aliases that are actually connected on a particular
> board.
> 
>         Arnd
> 
> > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > index c26647a..e5fefd1 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > @@ -26,8 +26,40 @@
> >         chosen { };
> >
> >         aliases {
> > +               i2c0 = &i2c0;
> > +               i2c1 = &i2c1;
> > +               i2c2 = &i2c2;
> > +               i2c3 = &i2c3;
> > +               i2c4 = &i2c4;
> > +               i2c5 = &i2c5;
> > +               i2c6 = &i2c6;
> > +               i2c7 = &i2c7;
> > +               i2c8 = &i2c8;
> > +               i2c9 = &i2c9;
> > +               i2c10 = &i2c10;
> > +               i2c11 = &i2c11;
> > +               i2c12 = &i2c12;
> > +               i2c13 = &i2c13;
> > +               i2c14 = &i2c14;
> > +               i2c15 = &i2c15;
> >                 mmc1 = &sdhc_1;
> >                 mmc2 = &sdhc_2;
> 
> The mmc ones should probably go away as well.
> 

I should have paid more attention when applying this patch, because the
commit message should have stated why any of these were introduced.


@Rajesh, can you please help me understand the need for any of these and
prepare a patch that introduce the specific ones needed in the
individual board dts(i) files - with reasoning for the aliases in the
commit message.

Thanks,
Bjorn

> > +               spi0 = &spi0;
> > +               spi1 = &spi1;
> > +               spi2 = &spi2;
> > +               spi3 = &spi3;
> > +               spi4 = &spi4;
> > +               spi5 = &spi5;
> > +               spi6 = &spi6;
> > +               spi7 = &spi7;
> > +               spi8 = &spi8;
> > +               spi9 = &spi9;
> > +               spi10 = &spi10;
> > +               spi11 = &spi11;
> > +               spi12 = &spi12;
> > +               spi13 = &spi13;
> > +               spi14 = &spi14;
> > +               spi15 = &spi15;
> >         };
> >
