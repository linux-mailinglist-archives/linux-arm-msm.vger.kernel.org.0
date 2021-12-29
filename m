Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 382A148147C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Dec 2021 16:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240566AbhL2PdE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Dec 2021 10:33:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233920AbhL2PdD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Dec 2021 10:33:03 -0500
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47A9DC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Dec 2021 07:33:03 -0800 (PST)
Received: by mail-ot1-x334.google.com with SMTP id a26-20020a9d6e9a000000b0058f37eeb861so26277639otr.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Dec 2021 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bEVREXqmH89MbzmWrN4QA+dq6opc4nWIdeFIogoG25s=;
        b=RTFfsdB2uHBYB6NExwweLLpzosyKhW44qS26y7DFowJZzwMDzXBlFLOYojA2LkuTIN
         EceuNyl22Trg1sHmMGE3IHbMM6/MVvXgD3oVBSPCcN6nzf/uAg17aEOyGQTYCRALPt/u
         aM0ClQSaFnUhFy8Dn/Tml4jDWiQnxOXACQxWt2JsjdfoPN96zGlG60/CPdWcLP2xLOz0
         gQUDQd600NHbXxaihims1Dfmwec9qVhYCtq1SlkYoV1gGq7alR4H4BBMRhUlUVBOssML
         x/3ZqEDPP/zCL8eL0/NKyOxLva4I1gWkrAO5flxh3zg1zQ0fCEzmu4Vc+E0XXhs24Saw
         CzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bEVREXqmH89MbzmWrN4QA+dq6opc4nWIdeFIogoG25s=;
        b=dc1z8iESTgcfMOsM6n3q++QJS/hqP2Ycp8xjfPodBF9Dhbigz6pO1ROyQuLFahXq9U
         ED160O6JyS50DiYpByylSHaL/Bu7I1Gxf8p1fDzJJRFZb6sB+rAB8mZ+r3QWQ+oCWUCr
         vRfu5+b+sXEudpg6r+czmvCHQP4rHA420MjbCnM8qbpLSMLVxJ4m3NuhAdrHy4Byu6Yr
         1iFIq7cfeA8HB4f6wvql6okicAz7C8HG1gdl4CiQ0Uko0OurcYJdSWOoeVN0UH32F4Sz
         CMWA3ByFrPFJMD4OPjt5FApctjfTWNQPJDdDJ9nAPIuuJchrqX9YXPppCcXMwh3FGaho
         AikA==
X-Gm-Message-State: AOAM531Zoq41QMO5C8fkYIl9XnyVmOwgnUx5WO8ePjUpPra7VTmS2y3n
        +Q6TwC9usAWouq5FbCUzueLMgw==
X-Google-Smtp-Source: ABdhPJz7bIQYwCUhTRuh/qTGG0rfJw4FKVSoZoVnl9SZrPB35j1RqA4/G6fChoJwqmI09cwCo+YPbg==
X-Received: by 2002:a9d:6a56:: with SMTP id h22mr19063881otn.135.1640791982466;
        Wed, 29 Dec 2021 07:33:02 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r5sm3408543ote.53.2021.12.29.07.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 07:33:02 -0800 (PST)
Date:   Wed, 29 Dec 2021 07:34:02 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     David Heidelberg <david@ixit.cz>
Cc:     Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        ~okias/devicetree@lists.sr.ht, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: convert Qualcomm USB HS phy to yaml
Message-ID: <Ycx/6gXhd6hnYJqP@ripper>
References: <20211224170242.57816-1-david@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211224170242.57816-1-david@ixit.cz>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 24 Dec 09:02 PST 2021, David Heidelberg wrote:

> Conversion of Qualcomm USB HS phy documentation to yaml.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Very nice to see your efforts in this area David!

Just some minor nits below.

[..]
> diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> new file mode 100644
> index 000000000000..202c42754188
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,usb-hs-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm's USB HS PHY binding description
> +
> +maintainers:
> +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,usb-hs-phy-apq8064
> +          - qcom,usb-hs-phy-msm8916
> +          - qcom,usb-hs-phy-msm8974
> +      - const: qcom,usb-hs-phy
> +
> +  clocks: true
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - const: ref
> +          - const: sleep
> +      - items:
> +          - const: sleep
> +          - const: ref

Can't we just pick one of them?

> +
> +  resets: true
> +
> +  reset-names:
> +    oneOf:
> +      - items:
> +          - const: por
> +      - items:
> +          - const: phy
> +          - const: por

How about doing the:

items:
  - const: por
  - const: phy
minItems: 1

> +
> +  v1p8-supply: true
> +
> +  v3p3-supply: true
> +
> +  extcon: true
> +
> +  "#phy-cells":
> +    const: 0
> +
> +  qcom,init-seq:
> +    $ref: /schemas/types.yaml#/definitions/uint8-array

It's better to use the uint8-matrix, as that allows you to describe the
value pairs as well. See e.g. st,adc-diff-channels in
iio/adc/st,stm32-adc.yaml as an example.

> +    description: |

I think you can omit the '|'.

Regards,
Bjorn

> +      Should contain a sequence of ULPI address and value pairs to
> +      program into the ULPI_EXT_VENDOR_SPECIFIC area. This is related
> +      to Device Mode Eye Diagram test. The addresses are offsets
> +      from the ULPI_EXT_VENDOR_SPECIFIC address, for example,
> +      <0x1 0x53> would mean "write the value 0x53 to address 0x81".
> +
> +required:
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    otg: usb-controller {
> +      ulpi {
> +        phy {
> +          compatible = "qcom,usb-hs-phy-msm8974", "qcom,usb-hs-phy";
> +          #phy-cells = <0>;
> +          clocks = <&clk 0>, <&clk 258>;
> +          clock-names = "ref", "sleep";
> +          resets = <&gcc 10>, <&otg 0>;
> +          reset-names = "phy", "por";
> +          v3p3-supply = <&pm8941_l24>;
> +          v1p8-supply = <&pm8941_l6>;
> +          extcon = <&smbb>;
> +          qcom,init-seq = /bits/ 8 <0x1 0x63>;
> +        };
> +      };
> +    };
> -- 
> 2.34.1
> 
