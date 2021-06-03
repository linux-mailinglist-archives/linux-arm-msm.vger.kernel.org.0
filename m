Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E002B39981C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 04:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbhFCCqa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 22:46:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbhFCCqa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 22:46:30 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EE15C061756
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jun 2021 19:44:46 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id c3so4818477oic.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 19:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZZQYKNjkzbXDm9CIMxGhmOJ08FkC41qsAMnb0o1Bjxs=;
        b=RgmSNlHKZ4fxhOVgzUIKQnKC6KAXoEYn2tb6HQBdFU84JbJrOkZ5dz4BlNToJLPlKS
         mcF9s+xJzVC3oKtTR0TshLDyHMTrAogZ1+DlIJ+4Gu4wzhgAW2nYqsOjudeh/0Rcye7R
         P6lH7cd2Z0BgP/houfZYs3LAv1w7lR4Nj2mGj8Vao3+7x8QlrKAiRqtpJ7qhgD9l3WxE
         Z4UFAg4TFDt01v1w17duqgAQaJR9RTa993ESYgM5kqSCJoKSigvEUZi5bbiufFv4yvY2
         h7aobkWFvg4wi6hHGNGNW9/HjPxE1Wc0LiAtBNrnJ0Bvr81akcULkAjUYq1QCcEMdPMA
         6wcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZZQYKNjkzbXDm9CIMxGhmOJ08FkC41qsAMnb0o1Bjxs=;
        b=Rgv9xT193UjiXIha11VlrxLMQaJdFr2VcYc4KHCLnGNDcYnHaOv083yPiTUONFH98t
         Rp6T7cJQ1tqfrbiLliDzejN6pNF//hTHBuY2QSjETsjDCXGwjeUdYkvrhgb80fHyz+fQ
         6PRzjMXsQyasg/vFGOow1u7MZET9ezdKiCtuvB3+qJdZCDDwLL6Cqf/PiBS+q2VNB3V5
         H2CGKlKqIRcQJUoJskgc5I46fo7wFEMbYh/EH9by/ksKQCOV3QUk0Rs1LzU7Uu+YcBMk
         tJ/cgl6Rt0DaFfivB+M1XoP0RXee+MKN4mCK0CdZdUOPhPWereqq13VY3BEuU3rzy1ag
         dczA==
X-Gm-Message-State: AOAM533GD012VJ/DObPSB26uy07C+aliVS0aU5yBU31TSK1ck2FNN9lk
        e0qmlxMWlfR40ugzAKx3TD+gPA==
X-Google-Smtp-Source: ABdhPJw6sYb54WexwW6J95QUpKdekjtsw1V+SnInNWc6uSj7hBZ3jhLGszsEKSNzU3VDIM1bm7ldXg==
X-Received: by 2002:aca:4bd6:: with SMTP id y205mr6134307oia.5.1622688283169;
        Wed, 02 Jun 2021 19:44:43 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v8sm410008oiv.5.2021.06.02.19.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 19:44:42 -0700 (PDT)
Date:   Wed, 2 Jun 2021 21:44:40 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Maulik Shah <mkshah@codeaurora.org>, evgreen@chromium.org,
        mka@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, linux@roeck-us.net, rnayak@codeaurora.org,
        lsrao@codeaurora.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v8 3/5] arm64: dts: qcom: sc7180: Enable SoC sleep stats
Message-ID: <YLhCGC/qgP6ESNl7@yoga>
References: <1621596371-26482-1-git-send-email-mkshah@codeaurora.org>
 <1621596371-26482-4-git-send-email-mkshah@codeaurora.org>
 <CAE-0n53ySKwDwzRYFYjnQnqVAujVrkik2U-PeCuS61xQU-hbWA@mail.gmail.com>
 <YLUjbwFSJOSWS0IV@builder.lan>
 <CAE-0n53hdd1tEmYwTL0CNi=S6CUxRhWnkJz-KoTj2UnedNKXmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n53hdd1tEmYwTL0CNi=S6CUxRhWnkJz-KoTj2UnedNKXmg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 02 Jun 19:26 CDT 2021, Stephen Boyd wrote:

> Quoting Bjorn Andersson (2021-05-31 10:57:03)
> > On Wed 26 May 18:30 CDT 2021, Stephen Boyd wrote:
> >
> > > Quoting Maulik Shah (2021-05-21 04:26:09)
> > > > Add device node for SoC sleep stats driver which provides various
> > > > low power mode stats.
> > > >
> > > > Also update the reg size of aoss_qmp device to 0x400.
> > > >
> > > > Cc: devicetree@vger.kernel.org
> > > > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> > > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 7 ++++++-
> > > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > index 6228ba2..889d04d 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > > > @@ -3215,7 +3215,7 @@
> > > >
> > > >                 aoss_qmp: power-controller@c300000 {
> > > >                         compatible = "qcom,sc7180-aoss-qmp";
> > > > -                       reg = <0 0x0c300000 0 0x100000>;
> > > > +                       reg = <0 0x0c300000 0 0x400>;
> > > >                         interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
> > > >                         mboxes = <&apss_shared 0>;
> > > >
> > > > @@ -3223,6 +3223,11 @@
> > > >                         #power-domain-cells = <1>;
> > > >                 };
> > > >
> > > > +               rpmh-sleep-stats@c3f0000 {
> > > > +                       compatible = "qcom,rpmh-sleep-stats";
> > > > +                       reg = <0 0x0c3f0000 0 0x400>;
> > > > +               };
> > > > +
> > >
> > > Does this need to be in DT? Can the sc7180-aoss-qmp driver use the
> > > aux-bus and stick the sleep stats device on there?
> > >
> >
> > The AOSS memory space has N chunks of "message ram", one is used for the
> > QMP protocol (presumably the APSS specific one), a different one is used
> > for the sleep stats.
> >
> > I presume we could have come up with a binding for the entire AOSS/AOP
> > and then describe (either implicit or explicitly) the QMP and
> > debug-stats under that.
> >
> > But we'd also have to come up with the same container-device for the RPM
> > case.
> 
> Because the rpm node doesn't include this region of memory today? I
> still fail to see why we're changing the existing binding and adding a
> DT node for this new region that is basically a debug feature.

We're not changing the binding, the memory region for the "AOSS QMP"
thing was never larger than 0x400.

0x100000 is the size of all the AOSS "msg_ram" regions. We don't have
this whole thing described in a binding and we don't have an
implementation for the whole thing.

If we're going for that we'd need to extend the binding to indicate
which of the msg_ram regions are used for APSS QMP and for debug stats
on particular platform (either by compatible, explicit properties or as
some subnodes).


That said, as I looked into my other objection, for the RPM
(non-hardened) case it seems that we're actually describing the RPM
region. So there it would make sense to describe it as such in DT - but
we don't have any other code (that I'm aware of) that would implement
the "qcom,<platform>-rpm".

Regards,
Bjorn
