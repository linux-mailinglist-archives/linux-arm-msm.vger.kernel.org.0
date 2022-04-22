Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C258F50B543
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 12:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1388868AbiDVKjl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 06:39:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1446771AbiDVKjj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 06:39:39 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE6255206
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 03:36:39 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id b26so8081704ybj.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 03:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4zcLXpCy7SBjHdgWPDMiVMAfSv9GgL9PPHTJHm95g50=;
        b=TlZWQKiYpTuDxECbeXwF6tJvJGze7xTFNWlQD4B2jRWUPyNtSO32rIHpFbOH95KpZM
         s26ARO9kRKdZUXaE9W+5GAk4Biz6ra37er4NWm9KQgbRawLZiJ4N62G0EB9Mm35+FIPt
         VE0ppUmp9NOUmWczcYULL7OuU3fw+9RKxiZaP87uqLCwucSFLVBH5/tryhvBmqajwmoC
         dy7swc3bCfD7Q+nwTUg1K9U7fgliOrmqEuFIfYXlrNb6gziSxffXs9/Ac4SEgpIBkQwS
         hko+HrFRO72KcUP7tdIswvVyCkaDPDTJTQ4qtmZ3iuoFZRelgls7PmWUdYDm57FAvOFe
         jd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4zcLXpCy7SBjHdgWPDMiVMAfSv9GgL9PPHTJHm95g50=;
        b=j4AJoGWA8VeKEjak1FueVk/noIhVbiD0EX0ckD+o0ac7DtvbeQ96+gOaQWvUhEfUIK
         QVASZAY1U6lnIXacn+3EcCmTDpf7fTwHAwqh/b8Nn5O8PcCsRq4GDqlpFNMKkLU8ynxQ
         CVte4SO374PV+ncEjXOMXUDDk9Bt++nNfVKkrC6BLalK+Vv0bXhCnGNULEpfDZBTdkiF
         PL7ddfvEfznAgY/WxwJ6iumRryoF7XesFXkmdhhfETx3b4WlZb/xZxzuTQMFQVmi1JG4
         n3FYHjyMqwD+1EjWioU6ROkdaQoIeFQOKgJKyUVTlViUme14Aky17uU83HfS/+LY3Y5u
         Gcgw==
X-Gm-Message-State: AOAM532394/KdzPvDfEaSpKfYs0DMF5x0AIW2Pwm6S0ayHAo4+st9YIz
        oOSrl6bjrOLSW5opypCbUPxc4onLe9NdII5OPHpU/A==
X-Google-Smtp-Source: ABdhPJz/ZFLFWoRZflZmG53V5oTsUDnKFJ76SRaHRYdcW5SRnzL6Jxlv23hnpEE1sIZLnoSq3Xe3/OdvM8uV/u46Xk0=
X-Received: by 2002:a25:84c1:0:b0:63e:7733:f95a with SMTP id
 x1-20020a2584c1000000b0063e7733f95amr3370991ybm.234.1650623798744; Fri, 22
 Apr 2022 03:36:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220421102041.17345-1-johan+linaro@kernel.org>
 <20220421102041.17345-3-johan+linaro@kernel.org> <55d6e32b-9cf4-384c-1036-1adfb867ece8@linaro.org>
 <YmJ+Ti81el2MzsHG@hovoldconsulting.com>
In-Reply-To: <YmJ+Ti81el2MzsHG@hovoldconsulting.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 22 Apr 2022 13:36:27 +0300
Message-ID: <CAA8EJpq25Oi8scffT_u9kGN5CYM7nK4Wxh0Kep+eRFg8xngiHg@mail.gmail.com>
Subject: Re: [PATCH RFC 2/5] arm64: dts: qcom: sc7280: move pipe mux handling
 to phy
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Prasad Malisetty <quic_pmaliset@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 22 Apr 2022 at 13:07, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Apr 21, 2022 at 01:59:04PM +0300, Dmitry Baryshkov wrote:
> > On 21/04/2022 13:20, Johan Hovold wrote:
> > > The QMP PHY pipe clock remuxing is part of the PHY, which is both the
> > > producer and the consumer of the pipe clock.
> > >
> > > Update the PCIe controller and PHY node to reflect the new binding.
> > >
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sc7280.dtsi | 18 ++++++------------
> > >   1 file changed, 6 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > index c07765df9303..b3a9630262dc 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > @@ -1837,11 +1837,7 @@ pcie1: pci@1c08000 {
> > >                                     <0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>,
> > >                                     <0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>;
> > >
> > > -                   clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
> > > -                            <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
> > > -                            <&pcie1_lane 0>,
> > > -                            <&rpmhcc RPMH_CXO_CLK>,
> > > -                            <&gcc GCC_PCIE_1_AUX_CLK>,
> > > +                   clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
> > >                              <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
> > >                              <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
> > >                              <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
> > > @@ -1849,11 +1845,7 @@ pcie1: pci@1c08000 {
> > >                              <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
> > >                              <&gcc GCC_DDRSS_PCIE_SF_CLK>;
> > >
> > > -                   clock-names = "pipe",
> > > -                                 "pipe_mux",
> > > -                                 "phy_pipe",
> > > -                                 "ref",
> > > -                                 "aux",
> > > +                   clock-names = "aux",
> > >                                   "cfg",
> > >                                   "bus_master",
> > >                                   "bus_slave",
> > > @@ -1910,8 +1902,10 @@ pcie1_lane: lanes@1c0e200 {
> > >                                   <0 0x01c0e600 0 0x170>,
> > >                                   <0 0x01c0e800 0 0x200>,
> > >                                   <0 0x01c0ee00 0 0xf4>;
> > > -                           clocks = <&gcc GCC_PCIE_1_PIPE_CLK>;
> > > -                           clock-names = "pipe0";
> > > +                           clocks = <&gcc GCC_PCIE_1_PIPE_CLK>,
> > > +                                    <&gcc GCC_PCIE_1_PIPE_CLK_SRC>,
> > > +                                    <&rpmhcc RPMH_CXO_CLK>;
> > > +                           clock-names = "pipe0", "mux", "ref";
> >
> > This will not be compatible with earlier DTB files, which was a problem
> > up to now.
>
> That depends. The above wasn't added until 5.16 so we may still be able
> to fix it.

That would depend on Rob/Krzyshtof. But the whole process should be described.
The driver can nod depend on the clocks being there.

>
> The NAK you got from Rob earlier was when you removed clocks that have
> been in the devicetree for several years:
>
>         https://lore.kernel.org/all/YgQ+tGhLqwUCsTUo@robh.at.kernel.org/
>
> and would still be needed by older kernels.
>
> Worst case, we need to keep both sets for sc7280 (i.e. like we need to
> do with the pipe clocks that have been around for years).
>
> Johan



-- 
With best wishes
Dmitry
