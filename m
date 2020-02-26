Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 720221709F6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2020 21:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727461AbgBZUok (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Feb 2020 15:44:40 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45689 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727471AbgBZUoj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Feb 2020 15:44:39 -0500
Received: by mail-pg1-f194.google.com with SMTP id r77so221099pgr.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2020 12:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NtpPkpQDZT+pJZPdvz0AVAUgEevNc4RHJ07rwsTIU0M=;
        b=i2P1YnExsto4uvDRMuruKyZouRRovAaR9wPEPO0+u8A8n/4zbDubzGVoJ6QmMnH1IE
         O5fUObW3f9TFkJi/1rT/FrBtnytktYQgW8i1SNi0wbxW5n9FRiGmININ83Qz6J3vaelx
         8y1rVkVpT58qeAyf15iyCSzs3gzoG6Cf+AW8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NtpPkpQDZT+pJZPdvz0AVAUgEevNc4RHJ07rwsTIU0M=;
        b=lWrSAfxSc9ZufLqPbjkgNFGeK9xskSCjHd+2YjobzWl/ghgM3WPHmHkXT8DV1JTsBC
         BdwHyGWhNchiEpgf/MhxSmB1WAAvhDp1i9oYvQQSZhH56Lcd+78rT0a8HnFp73938G0X
         b9JAJMzDkjMk4917iRoVQKoTN+pF7d/aGbecRq4D4BuU5rupvPBpC695AQ1XBOx1yXPF
         adCczNotNg6cEtANcyybqh1GwrXLddkZWawNJmuKX+IzrytqdJ50z1l4PSFA0aRade4m
         2+CL4ZuNpoWqt80OHKTBKc7bOC9SWxvBTV21vtCZ4V8/GPjyH0abW2IaoyEBfVb65DTK
         bNWA==
X-Gm-Message-State: APjAAAV8HqZn/mgWiAcv5ow45UjeroGXKPeLO6dcJFSOAMVgYLhgdn6r
        rtJLGEeMRMXQNDnzqsS+dU9VJQ==
X-Google-Smtp-Source: APXvYqwgmGRxpTLeAYtuLJ/SMdK3LWfjHffWSsiX8VSwT3RkwBv1ncv3qNpXEvr4DRbnNjELoDomGA==
X-Received: by 2002:aa7:8e85:: with SMTP id a5mr547358pfr.24.1582749878750;
        Wed, 26 Feb 2020 12:44:38 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id 17sm4061627pfv.142.2020.02.26.12.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2020 12:44:37 -0800 (PST)
Date:   Wed, 26 Feb 2020 12:44:36 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: sc7180: Move venus node to the correct
 position
Message-ID: <20200226204436.GG24720@google.com>
References: <20200226114017.1.I15e0f7eff0c67a2b49d4992f9d80fc1d2fdadf63@changeid>
 <CAD=FV=UMptkb9ni0KFWp96BycU32kchYs9+uS-7H+Q9ounHy2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=UMptkb9ni0KFWp96BycU32kchYs9+uS-7H+Q9ounHy2g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 26, 2020 at 12:40:23PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Wed, Feb 26, 2020 at 11:40 AM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Per convention device nodes for SC7180 should be ordered by address.
> > This is currently not the case for the venus node, move it to the
> > correct position.
> >
> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > ---
> >
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi | 52 ++++++++++++++--------------
> >  1 file changed, 26 insertions(+), 26 deletions(-)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > index 253274d5f04c..5f97945e16a4 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -1332,6 +1332,32 @@ system-cache-controller@9200000 {
> >                         interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
> >                 };
> >
> > +               venus: video-codec@aa00000 {
> > +                       compatible = "qcom,sc7180-venus";
> > +                       reg = <0 0x0aa00000 0 0xff000>;
> > +                       interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
> > +                       power-domains = <&videocc VENUS_GDSC>,
> > +                                       <&videocc VCODEC0_GDSC>;
> > +                       power-domain-names = "venus", "vcodec0";
> > +                       clocks = <&videocc VIDEO_CC_VENUS_CTL_CORE_CLK>,
> > +                                <&videocc VIDEO_CC_VENUS_AHB_CLK>,
> > +                                <&videocc VIDEO_CC_VENUS_CTL_AXI_CLK>,
> > +                                <&videocc VIDEO_CC_VCODEC0_CORE_CLK>,
> > +                                <&videocc VIDEO_CC_VCODEC0_AXI_CLK>;
> > +                       clock-names = "core", "iface", "bus",
> > +                                     "vcodec0_core", "vcodec0_bus";
> > +                       iommus = <&apps_smmu 0x0c00 0x60>;
> > +                       memory-region = <&venus_mem>;
> > +
> > +                       video-decoder {
> > +                               compatible = "venus-decoder";
> > +                       };
> > +
> > +                       video-encoder {
> > +                               compatible = "venus-encoder";
> > +                       };
> > +               };
> > +
> >                 usb_1: usb@a6f8800 {
> >                         compatible = "qcom,sc7180-dwc3", "qcom,dwc3";
> >                         reg = <0 0x0a6f8800 0 0x400>;
> 
> Maybe try one more time?
> 
> >>> print [hex(x) for x in sorted([0x0aa00000, 0x0a6f8800])]
> ['0xa6f8800', '0xaa00000']
> 
> ...makes me convinced that the codec should come _after_ the USB node, no?

indeed, thanks for catching it!
