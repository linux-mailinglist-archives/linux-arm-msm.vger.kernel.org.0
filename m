Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE21944FE6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 06:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229661AbhKOFhi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 00:37:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbhKOFhi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 00:37:38 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70A6C061766
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 21:34:42 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id o15-20020a9d410f000000b0055c942cc7a0so25519988ote.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 21:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0v+LGI2uk93QWh0zE0VchiXosnpImd7/fjmzIO4RhH4=;
        b=ljdiFAqtZ9NPKkvltzxH4bg3ngROQECeo8ejU0Y6tHLuMP3wi1QCPrFvplPgDFWNzf
         15JJjBoHIQ8Isk/aYpGaqQLD/wk9IR2Q97xUbnp1IKi5niLXS6HBKX8qZSJ1SU3r//Tl
         XZ+f37jt3IOPdJRdRTpEAwdIaoi/JorESwGeobXlgr+s/VRJJCTYulzOtybsIRhk59Rr
         BgHLjxs2DRdrE09uIGldzbPF0aoXjwJjsZeca+b3C08tzAP4YvPlF8kwL3N0I0Uz/zoD
         AMBiVM6cFv5bOrwWvDR2XrfqqvtUIDYmHXkVu0UQfon2XyM4HV/noyNefHz5dU+Fb02e
         NzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0v+LGI2uk93QWh0zE0VchiXosnpImd7/fjmzIO4RhH4=;
        b=yN5gZee4wnsgqVlpwhASIFtk/XYf0R1HhRv+j7bmMEx3FXrJcGjuLUfGTe2jJgffMd
         Tiu0LwOqexY1jMobX0pxcC5gD6am7NmObCTP/dHvYrSP5RYAYocuENkfpuDzzt8GQJWr
         MoftZ9zEhwWKD9vTpkO+4fzcEzANH217zeIWdRHzEFLEyobLmH+tJ0X/AMiAE+RE/ON1
         E1/49Tiz8CMP18FFUUxlPwcA/w1LPTfg3jMw+4p62f2H4IPNAfyDDaEDGmIBWcIzLlxS
         8n37O+FRtPBS+XYIRtV8anJwj4LqMx8r6aQuoc33lHT2eDwjZVv9FjVSACSAaCRXBHg8
         faRQ==
X-Gm-Message-State: AOAM530uKUf/fARMTfPbMwUFfui/xy9kzhcbRimgRN0g3NbhRW16euPd
        bHpcahfiGERFQX6AwIUV9LXaNLSL20vZSwvmJF5Kyg==
X-Google-Smtp-Source: ABdhPJwHFd1VM2HzkhZ7fd6WbE+aZtyX+zR0/Z8uF68YjNe5BDchdN2S4CXJSImAUK2bAuhAc0W+NfpsQA6yL2f8HY0=
X-Received: by 2002:a05:6830:34a0:: with SMTP id c32mr30374599otu.379.1636954482214;
 Sun, 14 Nov 2021 21:34:42 -0800 (PST)
MIME-Version: 1.0
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-10-bhupesh.sharma@linaro.org> <YZAZxmsp5WLeOBuF@builder.lan>
In-Reply-To: <YZAZxmsp5WLeOBuF@builder.lan>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 15 Nov 2021 11:04:31 +0530
Message-ID: <CAH=2NtwGM0==3etkG6seV=3+xO347VNEoKghpyBs9DjZPU4xNA@mail.gmail.com>
Subject: Re: [PATCH v5 09/22] dt-bindings: qcom-qce: Move 'clocks' to optional properties
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        stephan@gerhold.net, Thara Gopinath <thara.gopinath@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bjorn,

On Sun, 14 Nov 2021 at 01:32, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 10 Nov 04:59 CST 2021, Bhupesh Sharma wrote:
>
> > QCom QCE block on some SoCs like ipq6018 don't
> > require clock as the required property, so the properties
> > 'clocks' and 'clock-names' can be moved instead in the dt-bindings
> > to the 'optional' properties section.
> >
> > Otherwise, running 'make dtbs_check' leads to the following
> > errors:
> >
> > dma-controller@7984000: clock-names:0: 'bam_clk' was expected
> >       arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml
> >
> > dma-controller@7984000: clock-names: Additional items are not allowed ('bam_clk' was unexpected)
> >       arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml
> >
> > dma-controller@7984000: clock-names: ['iface_clk', 'bam_clk'] is too long
> >       arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml
> >
> > dma-controller@7984000: clocks: [[9, 138], [9, 137]] is too long
> >       arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 2 --
> >  1 file changed, 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > index 30deaa0fa93d..f35bdb9ee7a8 100644
> > --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > @@ -53,8 +53,6 @@ properties:
> >  required:
> >    - compatible
> >    - reg
> > -  - clocks
> > -  - clock-names
>
> I would prefer that we make this conditional on the compatible. That
> said, if this only applies to ipq6018 I think we should double check the
> fact that there's no clock there...
>
> For the sake of making progress on the series, I think you should omit
> this patch from the next version.

Without this patch, 'make dtbs_check' fails with the following error:
dma-controller@7984000: clock-names:0: 'bam_clk' was expected
        arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

dma-controller@7984000: clock-names: Additional items are not allowed
('bam_clk' was unexpected)
        arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dt.yaml

which I think is making Rob bot-check fail.

So, I think instead of dropping the patch, let's try and understand
from the 'ipq6018 qce' documentation if the clocks are really
'optional' there for the qce block (as clock properties are not
mentioned in the dts from the very first upstream version). If not, we
can try and fix the 'ipq6018 qce' dts node itself.

Regards,
Bhupesh
