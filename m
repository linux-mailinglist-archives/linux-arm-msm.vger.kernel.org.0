Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 855AE42C75F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 19:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237886AbhJMRRv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 13:17:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233427AbhJMRRu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 13:17:50 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1F6C061570
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 10:15:46 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id o83so4788737oif.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Oct 2021 10:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W8nJn1I9+6xqCWimBgakZ0ZykoVGwL72//fXC4D2ENM=;
        b=GI2da+Yf8iRRrz33iNLPc7mzogAwHgSYE6UnW3MHkFfv7C00ULlaeRSw+ecfq1ILmK
         yJIL013x3qXks11y/cjE+AALW6awCN1OArNQUkyBQ+4mgvb0KjtqVqo+kEkh+UoCBt+H
         0WDCQuuqVuTNpZJ4fvbpMBA9HV5sEbdiL3Q3jZrxBESwug1StY1cjr8xlboSu4cmw+8j
         6pN+Le3SWffPOmsGK3waohlhvtMo927iGVjPzMVlGN/hzh9v4oBqB7lWtvtuVSYvhn99
         0dAJdEtstNq+XGfKyAf2tiglHD+mxdHxf9/Y1ZgeXqp3HaNt5gVA40RtAqLUQMUAO5CQ
         QMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W8nJn1I9+6xqCWimBgakZ0ZykoVGwL72//fXC4D2ENM=;
        b=KttiNOikninOBSTLYL2S50rug1qOY1NNsNr1z0oBn5zW4cBF4fCFVmQjlM4AyAAq6c
         IVHJ9NwrFJEqJu7mxGzKO+gLXyIRPn3ULtbQSStBN28zWJ0KbMz7bhG8c8bum80IT7Kx
         RbyXFkkmH/HZ1tiAGd6aQQWtxvw4ItK5OBrsabtxLMARL2zfad9RxcYffR2JQVrHK5Pe
         EO3LzA3R7t38xG9zZJEAnonjcsW5Gwm0h1nCozkVyKdanEKvUBIODlb8M1b9G4eCHtbW
         3bDrixu9Q2iPjJA3BwZn4mSQpZKYTCyGEZGE5VS9mAgqzxHom0gzLQ0W7H+LH7RCIW3S
         5QWw==
X-Gm-Message-State: AOAM533POwbNu1pAj1FwsO6Z9+spLrLXn5VNxVeM9RklnM2oIVIYvHxD
        FEfJPC5u0/RntqQthSDDsWaK0+aw8z0F7SfoBWJRNQ==
X-Google-Smtp-Source: ABdhPJxlYaW0DbUNDGvX1GOmNno4laeXfJ5hJQT1f9YdWbCUWCT4I+0fram+3t4Qp5MihxS84DdI0NDO7jJ4uJ+qErc=
X-Received: by 2002:a05:6808:1686:: with SMTP id bb6mr246917oib.40.1634145346288;
 Wed, 13 Oct 2021 10:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-8-bhupesh.sharma@linaro.org> <f58d549a-5ce3-a51d-c371-a3ffdc76496d@linaro.org>
In-Reply-To: <f58d549a-5ce3-a51d-c371-a3ffdc76496d@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 13 Oct 2021 22:45:35 +0530
Message-ID: <CAH=2NtzoVs5XjSn11_VioEhTiTDN9_E9iU7eSTxT2R4gR8W80A@mail.gmail.com>
Subject: Re: [PATCH v4 07/20] dt-bindings: qcom-qce: Convert bindings to yaml
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
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vladimir,

On Wed, 13 Oct 2021 at 18:35, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Bhupesh,
>
> On 10/13/21 1:55 PM, Bhupesh Sharma wrote:
> > Convert Qualcomm QCE crypto devicetree binding to YAML.
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >   .../devicetree/bindings/crypto/qcom-qce.yaml  | 67 +++++++++++++++++++
> >   1 file changed, 67 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > new file mode 100644
> > index 000000000000..b7ae873dc943
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> > @@ -0,0 +1,67 @@
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
>
> Please consider to swap the description lines, so that they'll
> be matching the dma-names below and a regular order found in
> dts files.

Ok, I will fix it in v5.

Regards,
Bhupesh

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
> >
>
> --
> Best wishes,
> Vladimir
