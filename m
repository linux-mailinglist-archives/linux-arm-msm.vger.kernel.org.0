Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3B9144FFC2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 09:07:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234749AbhKOIKh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 03:10:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbhKOIJc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 03:09:32 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC7FC061204
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 00:06:10 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id o4so33189241oia.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Nov 2021 00:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vInCllpdZJK8HYx6VQyYUDaprqkzpWu+HmJAPYn2v50=;
        b=HxgSxKIntchJ9V+1j6TZ6/zSWnalYU4SllF6Qtl1TAmuWiQD/m8ic51slAuG0LR6uO
         fnkH9OnHkBaQ+nyG2iYWLHXgWdRQHf0SFhhxZ9rU7G6tsGP/aQSD/vUOk57r8bO5BLVm
         ktc2j7bpxi22rL+/rsWaQDWZS1eM59ibUf9gvizDgXrVa3Kx+fZKFhx4HaBZ4eVjLK4/
         298CTDz2iJ58wlGFsU1O6ltqWSWRP/t3sVL086mcW+rdJYI6JUAtKWw6kH1hnPHOtkRC
         HbeqEbqmRupAq0sMu/prFcPer60b1uIFdnXjh3t2f7XNaGfDnGRLdQxRxZSWWSOICyk6
         nVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vInCllpdZJK8HYx6VQyYUDaprqkzpWu+HmJAPYn2v50=;
        b=2ozS1eohvxNGsFX0stx/2+X5llypxNgTZ50uXyEmQ8ZBa0busfJGpNOQxPmIMn+4Nm
         h3o+pdT48a7A3xaeWTB5E7fxH77yjURZvswlRZpWetmjsNrlj3/FlZOlCHonRvsWMSeW
         qEK+YMTo4OWMZq2upnD60Bi4SVP0GLFtRRlKdye1GOIc0wNoDXjjjANZSf/1kmk8GkKj
         LyocJdmqAgT94O+ut/KpFeczDDSlZ2uvXqeGh9PQnN8od4x66VuXMi3ObWLwLVS3S75z
         BHv9mawo7SlXe80v2KPnrSSfIOa/qfEV6lAf6QMU0RRMr5r9B6m1kHjeeo4MoBlJuF13
         UfyA==
X-Gm-Message-State: AOAM531roCcSbRKkYrRQdu897KP+juJSESUzUmITd8vbpcvmo9RNK/B7
        xqFKTbb1F4z7xg0eNpjoDHGMrUs4VT3iCgoK7WWPbg==
X-Google-Smtp-Source: ABdhPJzMEV2wPO87eb6zhBFjYr/AyoSofRxeiCu2JqzFVwV7tOI9z0eR69HajfWSWZZKHbGj2TJxsuZDqRt54wsuiwY=
X-Received: by 2002:a05:6808:b08:: with SMTP id s8mr5206631oij.126.1636963569363;
 Mon, 15 Nov 2021 00:06:09 -0800 (PST)
MIME-Version: 1.0
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-4-bhupesh.sharma@linaro.org> <YZAOTCQ0yIJUJTYO@builder.lan>
In-Reply-To: <YZAOTCQ0yIJUJTYO@builder.lan>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 15 Nov 2021 13:35:58 +0530
Message-ID: <CAH=2Ntw=GC0a2iscffe--6_UpnCkdpnNO=7bZSAgFQonuK-4BA@mail.gmail.com>
Subject: Re: [PATCH v5 03/22] dt-bindings: qcom-bam: Convert binding to YAML
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

On Sun, 14 Nov 2021 at 00:43, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 10 Nov 04:59 CST 2021, Bhupesh Sharma wrote:
>
> > Convert Qualcomm BAM DMA devicetree binding to YAML.
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  .../devicetree/bindings/dma/qcom_bam_dma.txt  | 50 ----------
> >  .../devicetree/bindings/dma/qcom_bam_dma.yaml | 91 +++++++++++++++++++
> >  2 files changed, 91 insertions(+), 50 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.txt
> >  create mode 100644 Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
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
> > index 000000000000..3ca222bd10bd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/dma/qcom_bam_dma.yaml
> > @@ -0,0 +1,91 @@
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
> > +      - qcom,bam-v1.3.0 # for APQ8064, IPQ8064 and MSM8960
> > +      - qcom,bam-v1.4.0 # for MSM8974, APQ8074 and APQ8084
> > +      - qcom,bam-v1.7.0 # for MSM8916
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
>
> The old binding uses the wording "the one interrupt" and at least the
> Linux implementation indicates that there's only a single interrupt.
>
> So I think this should just be maxItems: 1
>
> > +
> > +  num-channels:
> > +    maximum: 31
> > +    description:
> > +      Indicates supported number of DMA channels in a remotely controlled bam.
> > +
> > +  "#dma-cells":
> > +    const: 1
> > +    description: The single cell represents the channel index.
> > +
> > +  qcom,ee:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 7
> > +    description:
> > +      Indicates the active Execution Environment identifier (0-7)
> > +      used in the secure world.
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
>
> While the txt->yaml conversion should retain the original content, I
> think it's okay to fix this line up while you're at it; and make it:
>
>         interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;

Sure, will do this in v6.

Regards,
Bhupesh

> > +        clocks = <&gcc GCC_BAM_DMA_AHB_CLK>;
> > +        clock-names = "bam_clk";
> > +        #dma-cells = <1>;
> > +        qcom,ee = <0>;
> > +    };
> > --
> > 2.31.1
> >
