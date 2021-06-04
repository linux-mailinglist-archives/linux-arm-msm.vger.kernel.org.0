Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724DB39B10F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 05:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229934AbhFDDnx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 23:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229936AbhFDDnv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 23:43:51 -0400
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C5BEC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Jun 2021 20:41:53 -0700 (PDT)
Received: by mail-ot1-x32f.google.com with SMTP id r26-20020a056830121ab02902a5ff1c9b81so7828583otp.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Jun 2021 20:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qDKqotNOGIxidneZCpCOFm1Xj7iQGtbVhRVMvdBpFyw=;
        b=FrW4olx7vH1AWpZD4jiByfMBDwVT9dg4znQeN7xlFnmHlgwgZfuneJl36K8INWvP7S
         RnDudy0d7iVbU2l1xvdenvPuV4HuItSIRlA7CG2/qt4ye3I/DpVYkTSoy2/+I6DD7GoF
         HS2ctFuqsS6vAHeld+orfNCC61pfw9MV9kCV6agFhqpAUXNZB8vv2Rw0vD2m/0t+VJnA
         InK5jZr0vsAfHSeonW30O07YgBryNQ/HtsPAipgo8nzhzJYV6MdIlHkQF23DZdseVV42
         x0dJycPdpgaJJ7v4skSAm5C4Y4mGWs5ZxHIjZVvri/joAxcFeY75eTIS5mcCbIGk1BLX
         c5HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qDKqotNOGIxidneZCpCOFm1Xj7iQGtbVhRVMvdBpFyw=;
        b=MCw24mvVm2NEE4JlK67EebcwkbuAsuQWH9F11JCpJp4LIvynFQcaEij9wuOSj8DEPK
         VRM0stfnQKbrRTCgY+EqD7T9btsbHZfzoqzFHnOs+nQ35LT3AlGtJ1/0dZ5d1BjYghQo
         iUn8zmuASPeUXBPjt2LtD+93Bojns0GLRfOe4rPKI9urMxcN0eHXsoY9tM6zns9rj6W+
         ele2G3kMg0vICkkfl/X77zlv16NM89eJM2oboAmzYtUj+QpVPp8WXjtMAEnO2Q0A2gyz
         FsqpQHnACaHo1hUF/vEERvWiI51t3zWgD4GY9m38bcsb1UPlhEScIkvc3mG+nylyXUh8
         Rzqg==
X-Gm-Message-State: AOAM532ytz/Py0OhIhJLz+dip3Wxo3aGL8EMkxGDtbZmTcHjwsn3jBcf
        eVeYBoUwQyTwmJ2VRd/eBGSCuVSeqAruEChggpj3WQ==
X-Google-Smtp-Source: ABdhPJyBlwS4ywW9sYM/BIc6j44E7w/DxEwFdwnUPP5GI2rf2VfVa1kQMxnDXRQPbeqMJpbsxfrDhGUQO3gEMNTgd6s=
X-Received: by 2002:a9d:4f15:: with SMTP id d21mr2107757otl.155.1622778112475;
 Thu, 03 Jun 2021 20:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143700.27392-1-bhupesh.sharma@linaro.org>
 <20210519143700.27392-5-bhupesh.sharma@linaro.org> <20210521014547.GA2469643@robh.at.kernel.org>
In-Reply-To: <20210521014547.GA2469643@robh.at.kernel.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Fri, 4 Jun 2021 09:11:41 +0530
Message-ID: <CAH=2Ntz4x08UZp2guT4YX6A1UPKDk9nThuBtbj=vARMO2AK84w@mail.gmail.com>
Subject: Re: [PATCH v3 04/17] dt-bindings: qcom-qce: Convert bindings to yaml
To:     Rob Herring <robh@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On Fri, 21 May 2021 at 07:15, Rob Herring <robh@kernel.org> wrote:
>
> On Wed, May 19, 2021 at 08:06:47PM +0530, Bhupesh Sharma wrote:
> > Convert Qualcomm QCE crypto devicetree binding to YAML.
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: David S. Miller <davem@davemloft.net>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: dmaengine@vger.kernel.org
> > Cc: linux-clk@vger.kernel.org
> > Cc: linux-crypto@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: bhupesh.linux@gmail.com
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  .../devicetree/bindings/crypto/qcom-qce.txt   | 25 -------
> >  .../devicetree/bindings/crypto/qcom-qce.yaml  | 69 +++++++++++++++++++
> >  2 files changed, 69 insertions(+), 25 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.txt
> >  create mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.txt b/Documentation/devicetree/bindings/crypto/qcom-qce.txt
> > deleted file mode 100644
> > index fdd53b184ba8..000000000000
> > --- a/Documentation/devicetree/bindings/crypto/qcom-qce.txt
> > +++ /dev/null
> > @@ -1,25 +0,0 @@
> > -Qualcomm crypto engine driver
> > -
> > -Required properties:
> > -
> > -- compatible  : should be "qcom,crypto-v5.1"
> > -- reg         : specifies base physical address and size of the registers map
> > -- clocks      : phandle to clock-controller plus clock-specifier pair
> > -- clock-names : "iface" clocks register interface
> > -                "bus" clocks data transfer interface
> > -                "core" clocks rest of the crypto block
> > -- dmas        : DMA specifiers for tx and rx dma channels. For more see
> > -                Documentation/devicetree/bindings/dma/dma.txt
> > -- dma-names   : DMA request names should be "rx" and "tx"
> > -
> > -Example:
> > -     crypto@fd45a000 {
> > -             compatible = "qcom,crypto-v5.1";
> > -             reg = <0xfd45a000 0x6000>;
> > -             clocks = <&gcc GCC_CE2_AHB_CLK>,
> > -                      <&gcc GCC_CE2_AXI_CLK>,
> > -                      <&gcc GCC_CE2_CLK>;
> > -             clock-names = "iface", "bus", "core";
> > -             dmas = <&cryptobam 2>, <&cryptobam 3>;
> > -             dma-names = "rx", "tx";
> > -     };
> > diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > new file mode 100644
> > index 000000000000..a691cd08f372
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm crypto engine driver
> > +
> > +maintainers:
> > +  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > +
> > +description: |
> > +  This document defines the binding for the QCE crypto
> > +  controller found on Qualcomm parts.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,crypto-v5.1
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: |
> > +      Specifies base physical address and size of the registers map.
>
> Yep, that's every 'reg'. Drop.
>
> With that dropped,
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Ok, I will drop this in v4.

Thanks,
Bhupesh

> > +
> > +  clocks:
> > +    items:
> > +      - description: iface clocks register interface.
> > +      - description: bus clocks data transfer interface.
> > +      - description: core clocks rest of the crypto block.
> > +
> > +  clock-names:
> > +    items:
> > +      - const: iface
> > +      - const: bus
> > +      - const: core
> > +
> > +  dmas:
> > +    items:
> > +      - description: DMA specifiers for tx dma channel.
> > +      - description: DMA specifiers for rx dma channel.
> > +
> > +  dma-names:
> > +    items:
> > +      - const: rx
> > +      - const: tx
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - dmas
> > +  - dma-names
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,gcc-apq8084.h>
> > +    crypto-engine@fd45a000 {
> > +        compatible = "qcom,crypto-v5.1";
> > +        reg = <0xfd45a000 0x6000>;
> > +        clocks = <&gcc GCC_CE2_AHB_CLK>,
> > +                 <&gcc GCC_CE2_AXI_CLK>,
> > +                 <&gcc GCC_CE2_CLK>;
> > +        clock-names = "iface", "bus", "core";
> > +        dmas = <&cryptobam 2>, <&cryptobam 3>;
> > +        dma-names = "rx", "tx";
> > +    };
> > --
> > 2.31.1
> >
