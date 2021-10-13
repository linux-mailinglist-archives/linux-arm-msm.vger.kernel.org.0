Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6312E42C755
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 19:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237511AbhJMRQM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 13:16:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235869AbhJMRQL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 13:16:11 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31200C061749
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 10:14:08 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id z126so4707712oiz.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 10:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+LSoIBe2LzP0UwOBCcPVd1fUoIWgL1sW4RPSfZpM9q8=;
        b=WFKXUDZ8jBh2gD74dPcpCF63O6JDnnCvmjZF0+jubnKuHXNOu8TUtAJ5fO9ZKFYeU5
         9bNHFuM36EHiFDmcT2A37/U0Ssd+rbb7+cOLDLi1LXKVKlyTm/I1JXr2sv4PbYO6JyI/
         eLxvhKOZlsrauTsh8zdNGmY1YuzXKldkUezjBExRRCRv/ZGZHQAsIi0c6zPVA6WP8dRu
         SdluVqNv1OHeTwhH+99yCLyDgzXVp4I8hKxEeeefXxIXJGKZsRFFgJgXaIsSvpj4/INm
         qa6lkpTtLC/Ur/RtUAPGafb/its3Tm96hHI5pazmSbpra5XLSDzUr7UIELX1nSp/Q3ZZ
         /eEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+LSoIBe2LzP0UwOBCcPVd1fUoIWgL1sW4RPSfZpM9q8=;
        b=AW4SIrjgvwAAukt2+tQY7ykn6HNF1RunSvVvrbzDeZfGPTELvtHo6JlRSgruGzOqWH
         FmtxtRZ+fdx2zm65wXjYpNF+Sin9VzOD8MOyh2iw1asLmGZq+f/otvxbSCWxdG8QYyy+
         RAU7Rj/n8g5FfOnrWbIWWX5CJPFb5B9Mn3NTdngDCOftaXESTCiMpPicq0ZEOU8SOW7h
         RV0O1vi6FghQQWgz6MUdzHwaUZIO06iS0+hD0DGUuehGAIaT/Ei1QeF8XNSHtp6PpUmE
         j6EuStmjEE1u32zbN7DZ00tlsHg840rZ3hO7IkS4xeu1IEWExGU2cCFC6hJxdWyZrIjk
         Bo5w==
X-Gm-Message-State: AOAM533pJE2Tcbeiu0YHxDGXPtkWTd3Z0n5YtaOmo5K3N1rq2HCwOYmC
        gcslPtY8cpangC6lpr6fYZEMS0mFIaZ9XwrWzxYPvA==
X-Google-Smtp-Source: ABdhPJzptIma6qxp1r8w4g+Oz1v1vi23o/wdCIXMarxIt3ectQcRK7CuFatBRslmuBnBbW9vmoV0Qs68tD+Dl/2lhEo=
X-Received: by 2002:a05:6808:1686:: with SMTP id bb6mr240224oib.40.1634145247377;
 Wed, 13 Oct 2021 10:14:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-5-bhupesh.sharma@linaro.org> <b41ba845-5f28-8405-0cd0-2342e4b6b372@linaro.org>
In-Reply-To: <b41ba845-5f28-8405-0cd0-2342e4b6b372@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 13 Oct 2021 22:43:56 +0530
Message-ID: <CAH=2NtzVvUVYCTpyzj65=aPYRnQQvhd5xG1pCbFwbsXpCfGRzw@mail.gmail.com>
Subject: Re: [PATCH v4 04/20] dt-bindings: qcom-bam: Convert binding to YAML
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vladimir,

Thanks for your review.
Please see my replies inline:

On Wed, 13 Oct 2021 at 18:26, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Bhupesh,
>
> On 10/13/21 1:55 PM, Bhupesh Sharma wrote:
> > Convert Qualcomm BAM DMA devicetree binding to YAML.
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >   .../devicetree/bindings/dma/qcom_bam_dma.txt  | 50 -----------
> >   .../devicetree/bindings/dma/qcom_bam_dma.yaml | 89 +++++++++++++++++++
> >   2 files changed, 89 insertions(+), 50 deletions(-)
> >   delete mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> >   create mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt b/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> > deleted file mode 100644
> > index cf5b9e44432c..000000000000
> > --- a/Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> > +++ /dev/null
> > @@ -1,50 +0,0 @@
> > -QCOM BAM DMA controller
> > -
> > -Required properties:
> > -- compatible: must be one of the following:
> > - * "qcom,bam-v1.4.0" for MSM8974, APQ8074 and APQ8084
> > - * "qcom,bam-v1.3.0" for APQ8064, IPQ8064 and MSM8960
> > - * "qcom,bam-v1.7.0" for MSM8916
> > -- reg: Address range for DMA registers
> > -- interrupts: Should contain the one interrupt shared by all channels
> > -- #dma-cells: must be <1>, the cell in the dmas property of the client device
> > -  represents the channel number
> > -- clocks: required clock
> > -- clock-names: must contain "bam_clk" entry
> > -- qcom,ee : indicates the active Execution Environment identifier (0-7) used in
> > -  the secure world.
> > -- qcom,controlled-remotely : optional, indicates that the bam is controlled by
> > -  remote proccessor i.e. execution environment.
> > -- num-channels : optional, indicates supported number of DMA channels in a
> > -  remotely controlled bam.
> > -- qcom,num-ees : optional, indicates supported number of Execution Environments
> > -  in a remotely controlled bam.
> > -
> > -Example:
> > -
> > -     uart-bam: dma@f9984000 = {
> > -             compatible = "qcom,bam-v1.4.0";
> > -             reg = <0xf9984000 0x15000>;
> > -             interrupts = <0 94 0>;
> > -             clocks = <&gcc GCC_BAM_DMA_AHB_CLK>;
> > -             clock-names = "bam_clk";
> > -             #dma-cells = <1>;
> > -             qcom,ee = <0>;
> > -     };
> > -
> > -DMA clients must use the format described in the dma.txt file, using a two cell
> > -specifier for each channel.
> > -
> > -Example:
> > -     serial@f991e000 {
> > -             compatible = "qcom,msm-uart";
> > -             reg = <0xf991e000 0x1000>
> > -                     <0xf9944000 0x19000>;
> > -             interrupts = <0 108 0>;
> > -             clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
> > -                     <&gcc GCC_BLSP1_AHB_CLK>;
> > -             clock-names = "core", "iface";
> > -
> > -             dmas = <&uart-bam 0>, <&uart-bam 1>;
> > -             dma-names = "rx", "tx";
> > -     };
> > diff --git a/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml b/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
> > new file mode 100644
> > index 000000000000..32b47e3b7769
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/dma/qcom_bam_dma.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: QCOM BAM DMA controller binding
> > +
> > +maintainers:
> > +  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > +
> > +description: |
> > +  This document defines the binding for the BAM DMA controller
> > +  found on Qualcomm parts.
> > +
> > +allOf:
> > +  - $ref: "dma-controller.yaml#"
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,bam-v1.4.0 # for MSM8974, APQ8074 and APQ8084
> > +      - qcom,bam-v1.3.0 # for APQ8064, IPQ8064 and MSM8960
> > +      - qcom,bam-v1.7.0 # for MSM8916
>
> would it be better to sort the list above by IP version?

Sure, I did not want to alter the ordering kept in the .txt version of
the device-tree bindings, but I have no strong objection to changing
and keeping the above sorted as per IP version  as well.

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    const: bam_clk
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 31
> > +
> > +  num-channels:
> > +    maximum: 31
> > +    description: |
> > +      Indicates supported number of DMA channels in a remotely controlled bam.
>
> A comment about YAML specifics, I'm not sure, if it makes sense to set a control
> to enable literal style of the given multiline description, since it is a one-liner.
>
> My main observation though is that all actually multi-line descriptions in the
> schema are different and of the folded style ("pipe" symbol is not set).
>
> Probably it's good enough just to remove the "pipe" above.

Ok.

> > +
> > +  "#dma-cells":
> > +    const: 1
> > +    description: The single cell represents the channel index.
> > +
> > +  qcom,ee:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Indicates the active Execution Environment identifier (0-7)
> > +      used in the secure world.
>
> Would it make sense to add here
>
>    minimum: 0
>    maximum: 7

Ok, will try and if it passes 'make dtbs_check', will fix in v5.

Regards,
Bhupesh

> > +
> > +  qcom,controlled-remotely:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      Indicates that the bam is controlled by remote proccessor i.e.
> > +      execution environment.
> > +
> > +  qcom,num-ees:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 31
> > +    default: 2
> > +    description:
> > +      Indicates supported number of Execution Environments in a
> > +      remotely controlled bam.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - "#dma-cells"
> > +  - qcom,ee
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,gcc-msm8974.h>
> > +    dma-controller@f9984000 {
> > +        compatible = "qcom,bam-v1.4.0";
> > +        reg = <0xf9984000 0x15000>;
> > +        interrupts = <0 94 0>;
> > +        clocks = <&gcc GCC_BAM_DMA_AHB_CLK>;
> > +        clock-names = "bam_clk";
> > +        #dma-cells = <1>;
> > +        qcom,ee = <0>;
> > +    };
> >
>
> --
> Best wishes,
> Vladimir
