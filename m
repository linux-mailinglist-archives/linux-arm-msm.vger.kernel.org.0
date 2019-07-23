Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 823CD71145
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 07:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbfGWFkO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 01:40:14 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:32858 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727652AbfGWFkO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 01:40:14 -0400
Received: by mail-pg1-f193.google.com with SMTP id f20so9585493pgj.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2019 22:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5nt2VugXjt5XrF3/XOR/oWFILicVPJkaeDN7wxmTV7U=;
        b=X1YvonD3R6khALL7BjDbSfmeGb+oxFB0Yn8oSaY7vanh6Hs83Ohqkwv+euiD632z1e
         WUi+KeGNsw5+gmHJ2bO3XJtc3mZljXxy/qpui12TO4jz7CXB1bJ5mp+gpodlkI/nWOGZ
         rvBzo8LIOFkvjxQPflC17XaQI+Nac3FzfcryjNzEMEa/lBJaIfFQlHbopWUR9bxrQYVe
         yyZbHJZ9JDSg1IJiGqx08/WiG2+5rN1fnAMpz9u+jrvGJ7hI0uaQVmqsi/vLyEGS+/bI
         7oTzNegr32gKDR7QbPUd95mr8UIc1mbTEL0WjBsM42uJSRveXhwWwQbwSO4QRy/U0YVd
         1o+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=5nt2VugXjt5XrF3/XOR/oWFILicVPJkaeDN7wxmTV7U=;
        b=LAzZ3JpGh6Jl848b++9r8kYlrDr8upjIBXgh1kEGibWjHk6cSonfPlJyBhqbVs/N/Z
         g/cR/1WrsH5TLTf6Gds8cTa50RT5vDVkKJDz5hl+SEigPR74G2cLxCKO3QT70GRAFclq
         9xf6WJ6JtCYazftaC1kghLiZxi0gfutNKpw5hA3IhCzXOi4Qj5aLPotSC/GiokRANliP
         IknMSv1hoycbPcw9nFm7ho8HW06mCjvmCVc32H6Jv/cN/zdpHg9glVOrj92KvrrIjqii
         YEemfneM4fMrZ/qKypbF1ezh74b7twZUPjOIRI1VLgViVjNwR2aK8xfLRey1BoqdBEvh
         eGYA==
X-Gm-Message-State: APjAAAXZo6lenxZAzQvU72hU6k9sJqpfSvj4hc6g8ZMWtP1sy3yQUxc8
        JRhCekUMxQisWCv1cV/n6ht5Dg==
X-Google-Smtp-Source: APXvYqwjjiGZqVdQpH4aZpzAsDjcY/hTViotRsKielUAYMaE/4MmwKXQ8bmTu5CBoKt30B6QXiYCJg==
X-Received: by 2002:a63:c03:: with SMTP id b3mr10469564pgl.23.1563860413423;
        Mon, 22 Jul 2019 22:40:13 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a15sm46535560pfg.102.2019.07.22.22.40.12
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 22 Jul 2019 22:40:12 -0700 (PDT)
Date:   Mon, 22 Jul 2019 22:41:36 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Amit Kucheria <amit.kucheria@verdurent.com>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sdm845-cheza: remove macro from
 unit name
Message-ID: <20190723054136.GK7234@tuxbook-pro>
References: <20190722123422.4571-1-vkoul@kernel.org>
 <20190722123422.4571-6-vkoul@kernel.org>
 <CAHLCerPC0thO9gsaDAxc+XaexinrzG6JGJ8BhB4bFFuQ-P9Jxg@mail.gmail.com>
 <20190723051426.GZ12733@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190723051426.GZ12733@vkoul-mobl.Dlink>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 22 Jul 22:14 PDT 2019, Vinod Koul wrote:

> On 23-07-19, 10:38, Amit Kucheria wrote:
> > On Mon, Jul 22, 2019 at 6:06 PM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > Unit name is supposed to be a number, using a macro with hex value is
> > 
> > /s/name/address?
> 
> Right, will fix.
> 
> > > not recommended, so add the value in unit name.
> > >
> > > arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:966.16-969.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4d: unit name should not have leading "0x"
> > > arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:971.16-974.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4e: unit name should not have leading "0x"
> > > arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:976.16-979.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x4f: unit name should not have leading "0x"
> > > arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:981.16-984.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x50: unit name should not have leading "0x"
> > > arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi:986.16-989.4: Warning (unit_address_format): /soc@0/spmi@c440000/pmic@0/adc@3100/adc-chan@0x51: unit name should not have leading "0x"
> > >
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > > index 1ebbd568dfd7..9b27b8346ba1 100644
> > > --- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
> > > @@ -963,27 +963,27 @@ ap_ts_i2c: &i2c14 {
> > >  };
> > >
> > >  &pm8998_adc {
> > > -       adc-chan@ADC5_AMUX_THM1_100K_PU {
> > > +       adc-chan@4d {
> > >                 reg = <ADC5_AMUX_THM1_100K_PU>;

When I read this define I instantly know which channel we're referring
to. The 4d above is simply there for syntactical purposes and needs only
to be cared about if the reg is ever changed.

So I like this form.

> > 
> > I'm a little conflicted about this change. If we're replacing the
> > address with actual values, perhaps we should do that same for the reg
> > property to keep them in sync? Admittedly though, it is a bit easier
> > to read the macro name and figure out its meaning.
> 
> Well this was how Bjorn suggested, am okay if we do in any
> other way. This fixes warning but keeps it bit readable too
> 
> Other way would be to make defines decimal values instead of hex
> 

While the ePAPRR states that the unit address must match the first reg,
dtc enforces that the unit address string matches "%x" of the reg.

Regards,
Bjorn

> Any better suggestions :)
> 
> -- 
> ~Vinod
