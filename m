Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFC78573913
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 16:43:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236584AbiGMOnX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 10:43:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236499AbiGMOnW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 10:43:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 381372ED73
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 07:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657723399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=H4v+SMT4YyFBFqIk3h1YXOzJcv6SHCw5As/1u7zBjaA=;
        b=LKMXwz6t+bXlOs+f3FjAGEtlxyCU/R5qSUTsWkDW6r4+bJFwFWX/CCe8+EgIbG8j9m4hl4
        RWE8H0V/C4du/neHGPSYtKi+se7xi7D42bY0No5e79O8y7kw11M72IknuJeN0tLdwhOCoe
        S7K4SuwjI9sycJ+c5aX5A6AjbUwvLKw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-oSp1kxVpNYuX-pJqZ3suJQ-1; Wed, 13 Jul 2022 10:43:18 -0400
X-MC-Unique: oSp1kxVpNYuX-pJqZ3suJQ-1
Received: by mail-qv1-f71.google.com with SMTP id mh1-20020a056214564100b00472fcc5ae9eso3856791qvb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 07:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H4v+SMT4YyFBFqIk3h1YXOzJcv6SHCw5As/1u7zBjaA=;
        b=hhMUoldH3ZYGJYHegv4cwSrdFJWv815nRk8EGNST4sV8sibzVRncf8r8mS6oAAeiuG
         QhyweDBKEGOqOP9KEiVkDXpZzdSqO7hGKvesrvivxrAPHStfSC6JJlFPHE7SNGoEmzqM
         VWZIXkVD/3WOPmTdfC1NetwUD3jQarrPHYRGkXmkie5w+b0ofD/bUAKNUJ+mTq/LNmni
         MIU/Uyy1v/IEAEmr3SzwEUuss+MD+vBB63QCVz4uMs9XAYWvImQteF0MpXPCXL9zRS3m
         UATKn9pGIqnCP8wE6R21H7PkH0LeCadkF3DjKmhkZFPYnSIn4F+mSI/8LqMKPfM8iaVE
         rMvQ==
X-Gm-Message-State: AJIora+793um/Y3IZ++xDc9nAlAtsAhRiuFqsNYvaFRWFkkCTwAe0Few
        STAzUbGKi/2MzFoZrJlgFxfdazwEIr1FA9ekgqDRemZu2N4HykOPwcxT1YG9mDxBgY2GBxSYnJ1
        pgBgxF4iwclMwLOjNEqT7lt1tIQ==
X-Received: by 2002:a05:6214:d0a:b0:473:584f:273d with SMTP id 10-20020a0562140d0a00b00473584f273dmr3178901qvh.127.1657723398348;
        Wed, 13 Jul 2022 07:43:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vVehCzGhVquOdqnAhdxWfZLL8LwuEOx6uq5tz/bi4ruQ+Vc8Bgb4U7OGBQUaph9+ojKaRgbw==
X-Received: by 2002:a05:6214:d0a:b0:473:584f:273d with SMTP id 10-20020a0562140d0a00b00473584f273dmr3178858qvh.127.1657723397983;
        Wed, 13 Jul 2022 07:43:17 -0700 (PDT)
Received: from halaneylaptop ([2600:1700:1ff0:d0e0::2e])
        by smtp.gmail.com with ESMTPSA id s7-20020a05620a254700b006a6b374d8bbsm12386760qko.69.2022.07.13.07.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 07:43:17 -0700 (PDT)
Date:   Wed, 13 Jul 2022 09:43:10 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sc8280xp: fix USB interrupts
Message-ID: <20220713144310.kehfuqvfhsjb36ri@halaneylaptop>
References: <20220713131340.29401-1-johan+linaro@kernel.org>
 <20220713131340.29401-6-johan+linaro@kernel.org>
 <20220713141228.5z5rmgepj6mepjyp@halaneylaptop>
 <Ys7YKkRAAI0Vbseh@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ys7YKkRAAI0Vbseh@hovoldconsulting.com>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 13, 2022 at 04:35:22PM +0200, Johan Hovold wrote:
> On Wed, Jul 13, 2022 at 09:12:28AM -0500, Andrew Halaney wrote:
> > On Wed, Jul 13, 2022 at 03:13:38PM +0200, Johan Hovold wrote:
> > > The two single-port SC8280XP USB controllers do not have an hs_phy_irq
> > > interrupt. Instead they have a pwr_event interrupt which is distinct
> > > from the former and not yet supported by the driver.
> > > 
> > > Fix the USB node interrupt names so that they match the devicetree
> > > binding.
> > > 
> > > Fixes: 152d1faf1e2f ("arm64: dts: qcom: add SC8280XP platform")
> > > Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 12 ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > > index 45cc7d714fd2..4a7aa9992f3a 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> > > @@ -1875,8 +1875,10 @@ usb_0: usb@a6f8800 {
> > >  					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
> > >  					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
> > >  					      <&pdc 138 IRQ_TYPE_LEVEL_HIGH>;
> > > -			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
> > > -					  "dm_hs_phy_irq", "ss_phy_irq";
> > > +			interrupt-names = "pwr_event",
> > > +					  "dp_hs_phy_irq",
> > > +					  "dm_hs_phy_irq",
> > > +					  "ss_phy_irq";
> > >  
> > >  			power-domains = <&gcc USB30_PRIM_GDSC>;
> > >  
> > > @@ -1925,8 +1927,10 @@ usb_1: usb@a8f8800 {
> > >  					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
> > >  					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
> > >  					      <&pdc 136 IRQ_TYPE_LEVEL_HIGH>;
> > > -			interrupt-names = "hs_phy_irq", "dp_hs_phy_irq",
> > > -					  "dm_hs_phy_irq", "ss_phy_irq";
> > > +			interrupt-names = "pwr_event",
> > > +					  "dp_hs_phy_irq",
> > > +					  "dm_hs_phy_irq",
> > > +					  "ss_phy_irq";
> > 
> > For this specific change to pwr_event:
> > 
> >     Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> > 
> > That being said, I was reviewing this against the (fairly old)
> > downstream release I have, and the IRQs defined there look like this:
> > 
> > 		interrupts-extended = <&pdc 12 IRQ_TYPE_EDGE_RISING>,
> > 				<&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
> > 				<&pdc 136 IRQ_TYPE_LEVEL_HIGH>,
> > 				<&pdc 13 IRQ_TYPE_EDGE_RISING>;
> > 		interrupt-names = "dp_hs_phy_irq", "pwr_event_irq",
> > 				"ss_phy_irq", "dm_hs_phy_irq";
> > 
> > The part I want to highlight is that the "pwr_event" irq downstream maps
> > to <&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>, but the current upstream
> > devicetree I'm looking at has it mapped to <&intc GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>
> > 
> > Do you happen to have any source you can also check to confirm if this
> > is a bug or not?
> 
> Good catch! I believe this is another copy-paste error when creating
> base dtsi based on some vendor source (or perhaps an error carried over
> from an earlier version).
> 
> The vendor devicetree I have access to also has 811 here, which matches
> the pattern for usb_0 (dwc3 interrupt + 1).
> 
> Do you mind if I fold a fix for that into a v2 of this patch?
> 
> Thanks for reviewing!

Sounds good, feel free to add my R-B with that change as well!

> 
> Johan
> 

