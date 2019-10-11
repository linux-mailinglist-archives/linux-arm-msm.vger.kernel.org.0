Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32C8DD4595
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2019 18:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbfJKQir (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Oct 2019 12:38:47 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:45681 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728486AbfJKQiq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Oct 2019 12:38:46 -0400
Received: by mail-pl1-f194.google.com with SMTP id u12so4685180pls.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2019 09:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=d9D6lFg9ebu4gPBMPEW9KZsZlytCnwresNqqZUf2J+s=;
        b=J6lWuLfdFVrlUVULxk+l2etb6PL+JArTgXdVjR2JIBUwGb/1F//pIFHsbTBggMGu7u
         7uYmw8ml94Oc+9RtrlJiLMtEKPibq8uL7foy4JBqRmV16ZfKPit2mCFTdEQIGd3ohbHp
         lQT0UnAVpVKzUtwbD/Dicpx0cP0FzJh9lPo4TnewZoC2OWmmZiKMfas82zlCz15GzBzs
         HHYmgTgcP+G5MosjX/6xny/IdNZAbal2pwIooduCmGKDRFRDOz5Wb9Leyl0Xb9EtbKAF
         4gVL3weoN1jf4nH4c+HWVSlpHQI5563+0Kee6U611wurfGwlcI0IsOC3+P3I2SxCxrYC
         vHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d9D6lFg9ebu4gPBMPEW9KZsZlytCnwresNqqZUf2J+s=;
        b=YlkHIFMPKC7kM0JEfZXbNY0MclQ9B0AGITv915gMJeaUBhsRh8Bxl8SL2WSCIvgaXQ
         MetMBz7BA4MCvqbm6DCA4jK0gLBOOKkJDQw8YFqshqkn+JjfPZpVnEbIqDOG+J88zj6d
         WJEU/BVcxkh1sbEK2D+p1bOfUjBqNEBe3/y3S/VSuIFri0TO2yJXV/YuTwRRJUPESiMv
         mU0u6itl4WLKgyc+i514QCPOy/TBwxflQdpnz+SxxMCFPoEUcuMIYMD6r39sKFeNRzrz
         u0NwhzAm/P8zXEyleikefEj9wq91s6bku4E2JC4q9nkxg2WcjOy/P3WGV8cwlraDS/39
         qSVQ==
X-Gm-Message-State: APjAAAUBUiVJIeW/LGTTUxDxz1ZKzXaDcXJVI4dOf7u4MOj53F8aXw7z
        ga1XhhtYD6pfoNFXFlG3hD6c2Q==
X-Google-Smtp-Source: APXvYqx+MSSduwRPhQ5pAr+oDEo555huaEW2g0mklAaMnapke/+c90o5c+w9qkpcKVjCWHPtYZKDfg==
X-Received: by 2002:a17:902:a5c9:: with SMTP id t9mr14578581plq.99.1570811925126;
        Fri, 11 Oct 2019 09:38:45 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id i16sm8215488pfa.184.2019.10.11.09.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2019 09:38:44 -0700 (PDT)
Date:   Fri, 11 Oct 2019 09:38:41 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Doug Anderson <dianders@chromium.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, jhugo@codeaurora.org,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Paolo Pisati <p.pisati@gmail.com>,
        Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH] arm64: dts: apq8096-db820c: Increase load on l21 for
 SDCARD
Message-ID: <20191011163841.GR6390@tuxbook-pro>
References: <1544634806-1037-1-git-send-email-loic.poulain@linaro.org>
 <8c92dc30-cfbe-00e2-ae70-243455549ecd@codeaurora.org>
 <CAMZdPi8-9d11FXKJinpJkJyhi8fcysbYVDjG8aDwbY3s=mLarw@mail.gmail.com>
 <aea60b4c-f651-5e5a-c363-f7da9a8ed838@codeaurora.org>
 <CAD=FV=WeS5h6SEe01ey8zEOs=1DqO5-31iZWazARtrp4xM3wkA@mail.gmail.com>
 <CAMZdPi8VpY82JWT1pstsgPV=P3ZuXnX7P=oTdTVJGdYr+DzBKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi8VpY82JWT1pstsgPV=P3ZuXnX7P=oTdTVJGdYr+DzBKA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 11 Oct 05:55 PDT 2019, Loic Poulain wrote:

> Hi Andy, Rob,
> 
> Could any of you take this patch?
> 

I've applied the patch now.

Thanks,
Bjorn

> On Thu, 13 Dec 2018 at 20:14, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, Dec 13, 2018 at 6:46 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> > >
> > > On 12/13/2018 12:55 AM, Loic Poulain wrote:
> > > > Hi Jeffrey,
> > > >
> > > >
> > > > On Wed, 12 Dec 2018 at 18:23, Jeffrey Hugo <jhugo@codeaurora.org
> > > > <mailto:jhugo@codeaurora.org>> wrote:
> > > >
> > > >     On 12/12/2018 10:13 AM, Loic Poulain wrote:
> > > >      > In the same way as for msm8974-hammerhead, l21 load, used for SDCARD
> > > >      > VMMC, needs to be increased in order to prevent any voltage drop
> > > >     issues
> > > >      > (due to limited current) happening with some SDCARDS or during
> > > >     specific
> > > >      > operations (e.g. write).
> > > >      >
> > > >      > Fixes: 660a9763c6a9 (arm64: dts: qcom: db820c: Add pm8994
> > > >     regulator node)
> > > >      > Signed-off-by: Loic Poulain <loic.poulain@linaro.org
> > > >     <mailto:loic.poulain@linaro.org>>
> > > >      > ---
> > > >      >   arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 2 ++
> > > >      >   1 file changed, 2 insertions(+)
> > > >      >
> > > >      > diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> > > >     b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> > > >      > index 104cad9..c15e2c0 100644
> > > >      > --- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> > > >      > +++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
> > > >      > @@ -634,6 +634,8 @@
> > > >      >                               l21 {
> > > >      >                                       regulator-min-microvolt =
> > > >     <2950000>;
> > > >      >                                       regulator-max-microvolt =
> > > >     <2950000>;
> > > >      > +                                     regulator-allow-set-load;
> > > >      > +                                     regulator-system-load =
> > > >     <200000>;
> > > >      >                               };
> > > >      >                               l22 {
> > > >      >                                       regulator-min-microvolt =
> > > >     <3300000>;
> > > >      >
> > > >
> > > >     I'm curious, why not update sdhci-msm to set the load on the regulator?
> > > >
> > > >
> > > > Yes you're right, and I saw that there is ongoing work:
> > > > https://patchwork.kernel.org/patch/10630731/
> > > >
> > > > Howerver I thought this change would be a quicker fix and easier to
> > > > backport in stable trees.
> > > > I assume all the device-tree vmmc loads will be removed at some point
> > > > when driven from sdhci.
> > > >
> > >
> > > I hadn't seen that.  Ok, seems good to me.
> >
> > NOTE: I'm personally not convinced that adding the "set_load" calls
> > into the SDHCI driver actually makes any sense.  I believe it adds
> > complexity for no benefit.  The only time you ever need to should ever
> > be fiddling with "set_load" calls is if the rail you're controlling
> > has some hope of being able to run at a lower power mode.  If there's
> > no hope of it being at a lower power mode then the constraints on the
> > rail should just force it to high power mode and be done with it.  The
> > patch here (using regulator-system-load) is one way to force it to a
> > high power mode and seems fine, but there are other ways.  See a
> > previous discussion [1].
> >
> > NOTE: IIRC the "ongoing work" patch you pointed at always sets the
> > load to a fixed level to turn it to "high power mode" when the
> > regulator is turned on and undoes that set_load when the regulator is
> > turned off.  That's no longer needed as of commit 5451781dadf8
> > ("regulator: core: Only count load for enabled consumers").  If
> > someone comes up with a case where it's useful to keep the SD card
> > rail turned on but in "low power mode" _then_ we should actually
> > consider adding set_load to the SD card driver.
> >
> > [1] https://lkml.kernel.org/r/CAD=FV=V4WFYoKLQ72pico4HCGgLDTae7xougivv6VWOSoPhLpg@mail.gmail.com
> >
> > -Doug
