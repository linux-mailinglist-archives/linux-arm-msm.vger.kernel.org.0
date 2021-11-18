Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67EDA4566A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 00:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbhKSAAi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 19:00:38 -0500
Received: from mail-oo1-f50.google.com ([209.85.161.50]:39474 "EHLO
        mail-oo1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbhKSAAi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 19:00:38 -0500
Received: by mail-oo1-f50.google.com with SMTP id d1-20020a4a3c01000000b002c2612c8e1eso3070474ooa.6;
        Thu, 18 Nov 2021 15:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JEf4wkkJLSiCgtn7KTR+KrTaS841Nm2x4yld9LFTxEc=;
        b=MKL7gG/xVKJ28q3d6M4B2cv5nCzwj50m4g3fl9IP69AXS62zIQxcaIjSc9ZLBuwm6o
         5io4ozIfG4dot83IrGZTxR6ovbOkz5y9OoF6sofVZJ1OVWHxKw+80RUTqUnf6QXil3Xj
         SYFKKtaEaLsp2QEU1QvfuhkursC2gpGD8zks5lAwnmE3unOKkC0WgrB7E/o+JoAlC1Lj
         +VMWwshTFWUcJNN1/24NI/M7WEHYkC4EBBB37m+ZABYbAP9DDziY5AphKGZZhWgAun33
         nbXq0iziqL8R8W6FMb4WIBwSHii2MvndcPEsOKznfPJklwdK6gQLti4dZ8WX9RdZr0tU
         sA/w==
X-Gm-Message-State: AOAM5313DZtpz3XKFeCXfGGj66rqO1hNzquHuEj0jRbsx2bscMxEFwGj
        uPFx2yd/sS/6VqFBcl48Ww==
X-Google-Smtp-Source: ABdhPJzZE7VtNhasAMeC3YkchxPjyv6XPCAj9aHJbn9MVVBOoNJXjDLfGbc/PlEcil7brjgzAagZIw==
X-Received: by 2002:a4a:5b85:: with SMTP id g127mr15790263oob.86.1637279857237;
        Thu, 18 Nov 2021 15:57:37 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q12sm236261otl.66.2021.11.18.15.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 15:57:36 -0800 (PST)
Received: (nullmailer pid 2028180 invoked by uid 1000);
        Thu, 18 Nov 2021 23:57:35 -0000
Date:   Thu, 18 Nov 2021 17:57:35 -0600
From:   Rob Herring <robh@kernel.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        stephan@gerhold.net, Thara Gopinath <thara.gopinath@linaro.org>
Subject: Re: [PATCH v5 09/22] dt-bindings: qcom-qce: Move 'clocks' to
 optional properties
Message-ID: <YZbobzlBNWIRNn/e@robh.at.kernel.org>
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-10-bhupesh.sharma@linaro.org>
 <YZAZxmsp5WLeOBuF@builder.lan>
 <CAH=2NtwGM0==3etkG6seV=3+xO347VNEoKghpyBs9DjZPU4xNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH=2NtwGM0==3etkG6seV=3+xO347VNEoKghpyBs9DjZPU4xNA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 15, 2021 at 11:04:31AM +0530, Bhupesh Sharma wrote:
> Hi Bjorn,
> 
> On Sun, 14 Nov 2021 at 01:32, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 10 Nov 04:59 CST 2021, Bhupesh Sharma wrote:
> >
> > > QCom QCE block on some SoCs like ipq6018 don't
> > > require clock as the required property, so the properties
> > > 'clocks' and 'clock-names' can be moved instead in the dt-bindings
> > > to the 'optional' properties section.
> > >
> > > Otherwise, running 'make dtbs_check' leads to the following
> > > errors:
> > >
> > > dma-controller@7984000: clock-names:0: 'bam_clk' was expected
> > >       arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml
> > >
> > > dma-controller@7984000: clock-names: Additional items are not allowed ('bam_clk' was unexpected)
> > >       arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml
> > >
> > > dma-controller@7984000: clock-names: ['iface_clk', 'bam_clk'] is too long
> > >       arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml
> > >
> > > dma-controller@7984000: clocks: [[9, 138], [9, 137]] is too long
> > >       arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml
> > >
> > > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > > ---
> > >  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 2 --
> > >  1 file changed, 2 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > > index 30deaa0fa93d..f35bdb9ee7a8 100644
> > > --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > > +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > > @@ -53,8 +53,6 @@ properties:
> > >  required:
> > >    - compatible
> > >    - reg
> > > -  - clocks
> > > -  - clock-names
> >
> > I would prefer that we make this conditional on the compatible. That
> > said, if this only applies to ipq6018 I think we should double check the
> > fact that there's no clock there...
> >
> > For the sake of making progress on the series, I think you should omit
> > this patch from the next version.
> 
> Without this patch, 'make dtbs_check' fails with the following error:
> dma-controller@7984000: clock-names:0: 'bam_clk' was expected
>         arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml
> 
> dma-controller@7984000: clock-names: Additional items are not allowed
> ('bam_clk' was unexpected)
>         arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

Those errors do not correspond to the change here. Adding something to 
'required' would never solve any error (other than a driver requires a 
property to function).


> which I think is making Rob bot-check fail.

dtbs_check don't have to be fixed as the message says.

> So, I think instead of dropping the patch, let's try and understand
> from the 'ipq6018 qce' documentation if the clocks are really
> 'optional' there for the qce block (as clock properties are not
> mentioned in the dts from the very first upstream version). If not, we
> can try and fix the 'ipq6018 qce' dts node itself.
> 
> Regards,
> Bhupesh
> 
