Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64E82310195
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Feb 2021 01:27:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbhBEA0b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 19:26:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231728AbhBEA0a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 19:26:30 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD1DC0613D6
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Feb 2021 16:25:50 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id v1so5261490ott.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Feb 2021 16:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i/sNjGPUQcWgJ1ou2Z+VvX7lJEt0tPpGFRGnJSTZWUw=;
        b=qh8V4sd3cpeDsMoS2M2hVBUqCdX+5DaTZKbYGcSPFaY+oxDILNVgyKFq26suOLFNUd
         tFUUveEtPHgEiRU7xMhy9mKLZkMYQU0yPa8df2/ALMMDHAqUf4E0/MT5J24Bd2Ur8zxx
         v4JGBqpXlVJ/kspGGP+xeB0+68lczZ0rU98KXhBevu+2F4eCV5cEp5M/6Oka/ZdVwgQp
         b5r5j/THQz0qqfqjq2bbN5S3oda8dbiXFEDd+nZR7yl3Wi4Z02on6OMmc4J0t+vre6qd
         vENTbn90aaWAuHvTZ6XiRrRr6sGPvecYU/1RsgHbhuI3wp7Sh39AjPwn+ahZwaL34BH2
         xczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i/sNjGPUQcWgJ1ou2Z+VvX7lJEt0tPpGFRGnJSTZWUw=;
        b=B3E9sfDw7BHA6y468gUZhTnW0bKgo57xuwpHIieGcVPCInntUmghhtOcPr2stIiKab
         fe+pr4KwNpB7/EGHaMKzdbJzwy0ci4NcGtn9R1iBS+BQSvK5CcmpUat2ivTSB+ipykZZ
         7e7ur70rEMdaw3ajU4LPqjS+O0Kc6oxYkUtS1YkMk1u6Fb/jMDn9UknW20ZoiTpEiVzI
         oVgOWBFkV1tbElgCBIBuJdI2a9HTHfKrXn1ZPcCZWA1z+4RNDyubjZyVuzaB9GwOG06A
         raadbZl4p/JynEvS2S82xvZYbcEa9DeNdUAYkTnRsXIR7QP83AkpLBy2iMAHoH27T9vY
         WRcA==
X-Gm-Message-State: AOAM532qcQyOksDgaCmZcyq4nFxznK2zpWQKER70MqdXW44QYiFOCquj
        OEJeX3KhoSshLlJMZc8KjlBHBMc7blAQVg==
X-Google-Smtp-Source: ABdhPJzK+Xe8lrhuUDCohyQSuukdOaTCgv3mu/gMNZA1HuzoxV54HbqiffI5+csgiAbHGtwZwEIqwg==
X-Received: by 2002:a9d:7694:: with SMTP id j20mr1474344otl.89.1612484749644;
        Thu, 04 Feb 2021 16:25:49 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c18sm1441183oov.20.2021.02.04.16.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 16:25:48 -0800 (PST)
Date:   Thu, 4 Feb 2021 18:25:47 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250: add pinctrl for SPI using
 GPIO as a CS
Message-ID: <YByQizVTnj2uTNt2@builder.lan>
References: <20210204204904.294555-1-dmitry.baryshkov@linaro.org>
 <YBx+LcgrbyUKpYig@builder.lan>
 <CAD=FV=XOk14DfAJT9j86WbiRifxUQZFPy1grJWoz0A7Fon1edg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=XOk14DfAJT9j86WbiRifxUQZFPy1grJWoz0A7Fon1edg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 04 Feb 17:31 CST 2021, Doug Anderson wrote:
> On Thu, Feb 4, 2021 at 3:07 PM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> > On Thu 04 Feb 14:49 CST 2021, Dmitry Baryshkov wrote:
[..]
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > index 3cea28058a91..03015174ec06 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > @@ -3046,6 +3046,25 @@ config {
> > >                               };
> > >                       };
> > >
> > > +                     qup_spi0_cs_gpio: qup-spi0-cs-gpio {
> >
> > There might be others who need the same states, but I would prefer if we
> > move this to the device's dts.
> 
> This is opposite to what Stephen requested, though it was in a review
> on our gerrit and not on lists [1].  :-P
> 
> It definitely feels like a 6 of one half dozen of the other.  Unless
> you're dead set on moving them to the board dts my bias would be
> towards keeping consistent with what was done on sc7180.  If you
> really want this moved to the board file we should do it for sc7180
> too.
> 

What I dislike is the fact that we have a huge amount of these unused in
the platform.dtsi, but let's align with what I agreed to on
sc7180...Sorry for the short memory.

> 
> > > +                             mux {
> >
> > Rather than splitting the properties in {mux, cs, config} I think it
> > makes more sense to split them in {spi, cs} or something like that.
> 
> In general pinconf doesn't belong in the SoC dts file.  If there's no
> reason to change it seems like this should match what sc7180 did.
> 

Right, but I still would prefer the pinctrl state to be split by
function/pins, rather than pinmux vs pinconf. That way it's natural to
add pinconf properties to the various functional parts (i.e. bias or
drive-strength for the spi pins vs cs).

Do you have any concerns with this?

Regards,
Bjorn

> 
> [1] https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2406557/1/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
