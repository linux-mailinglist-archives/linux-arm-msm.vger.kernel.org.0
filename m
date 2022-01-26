Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECA3249C29C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 05:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230354AbiAZEWO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jan 2022 23:22:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbiAZEWN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jan 2022 23:22:13 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4C4C061747
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 20:22:13 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id j38-20020a9d1926000000b0059fa6de6c71so8729798ota.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jan 2022 20:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/wEMvNKfZ61RgYDVfLTFcPt3WrnbrMTpMmjz55ciZ2A=;
        b=nsuIMZVFIf9Jirq+8DvN7dZ3cl5AoDcrCzbezjkzaeHgY/X7GAD6ztasYPLOcdVdov
         7k0Gk5jC8Kji6c4uWFTj2oIrKo5sAYNaPxxIOPxmPlS/74oLQJ9LTFRTXIHQGvQ5dEpR
         w+i7dQQ3YgPuG8A2vh9L7S7FXPEXSP/WzGCKAMhCnrHKZrGqTvNuSVoR9DiTin/eJvRI
         YdJzTLYjogCYm7zQn41nHGeTfzIumnmYBiMCFqyOCN1tSN+yTamjr7GU5Ypb/U0DVQII
         Zq1USnyfqZBNW3ovcXKOP/zBv9zHH+ZkruIwn0P1iuqvCJAaNYgT/VCxh3fXcDg6WKvq
         92VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/wEMvNKfZ61RgYDVfLTFcPt3WrnbrMTpMmjz55ciZ2A=;
        b=tDR82TZzHIT3rUyCYpOgDSuSogjPUcL7IqN8tmn05sUcBXFa1PzAyrKVDWTk1/wk8E
         MnQnO+yvoEe0+wV4DQeWNe3cgssY/uCBmRv4x/ZP+DdFC1RB7jX/f0X6XDBqDbVcIj7Y
         kWL8SlGU4fqGJ1eoI6RczvUa0GcDcQLk0mA9DLp19MpqMEyklxu0d+uMjtyid6mAm82l
         1mOIxNJ/Aq8JffkvVoiLRHZXjTAPjmM480wi2v+zK5tfTI8714x221/X2Z3s7wHakKhs
         h9htiWwV+2D9wD+8AzhjguwUqHHtfHnjvlY5k38h8z8KmnY1O8eFo/nvLCqQe3Cc04gX
         F47g==
X-Gm-Message-State: AOAM532m/Db6r0Qnr7sAmoqTYQGy/7jiUijyo+NhDU4bjoKX4Dg0GJjK
        ZOe2ms2jEKYAIW9+BVzCREvTNQ==
X-Google-Smtp-Source: ABdhPJyRuivCIa4BbI+T71amibtowNPrAFyYolrudFrjgGWxkSkC3KZhkrgvF4xqODbPTDY98Y733w==
X-Received: by 2002:a9d:d0b:: with SMTP id 11mr12645840oti.255.1643170931675;
        Tue, 25 Jan 2022 20:22:11 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id k3sm7923062otl.41.2022.01.25.20.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 20:22:11 -0800 (PST)
Date:   Tue, 25 Jan 2022 22:22:09 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, pure.logic@nexus-software.ie,
        greg@kroah.com, robh@kernel.org, linux-kernel@vger.kernel.org,
        quic_tsoni@quicinc.com, quic_psodagud@quicinc.com,
        quic_satyap@quicinc.com, quic_pheragu@quicinc.com,
        quic_rjendra@quicinc.com, quic_sibis@quicinc.com,
        quic_saipraka@quicinc.com
Subject: Re: [PATCH V4 1/6] dt-bindings: Add the yaml bindings for EUD
Message-ID: <YfDMcbjyrotI6ZgK@builder.lan>
References: <cover.1642768837.git.quic_schowdhu@quicinc.com>
 <91c61d815123fb0b7e067e368d784e3434997068.1642768837.git.quic_schowdhu@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91c61d815123fb0b7e067e368d784e3434997068.1642768837.git.quic_schowdhu@quicinc.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 21 Jan 07:53 CST 2022, Souradeep Chowdhury wrote:

> Documentation for Embedded USB Debugger(EUD) device tree
> bindings in yaml format.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 77 ++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> new file mode 100644
> index 0000000..c98aab2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,eud.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> +
> +title: Qualcomm Embedded USB Debugger
> +
> +maintainers:
> +  - Souradeep Chowdhury <quic_schowdhu@quicinc.com>
> +
> +description:
> +  This binding is used to describe the Qualcomm Embedded USB Debugger, which is
> +  mini USB-hub implemented on chip to support USB-based debug capabilities.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - qcom,sc7280-eud
> +      - const: qcom,eud
> +
> +  reg:
> +    items:
> +      - description: EUD Base Register Region
> +      - description: EUD Mode Manager Register
> +
> +  interrupts:
> +    description: EUD interrupt
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      These ports are to be attached to the endpoint of the DWC3 controller node
> +      and type C connector node. The controller has the "usb-role-switch"
> +      property.
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: This port is to be attached to the DWC3 controller.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: This port is to be attached to the type C connector.
> +
> +required:
> +  - compatible
> +  - reg
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    eud@88e0000 {
> +           compatible = "qcom,sc7280-eud","qcom,eud";
> +           reg = <0x88e0000 0x2000>,
> +                 <0x88e2000 0x1000>;
> +           ports {
> +                   #address-cells = <1>;
> +                   #size-cells = <0>;
> +                   port@0 {
> +                           reg = <0>;
> +                           eud_ep: endpoint {
> +                                   remote-endpoint = <&usb2_role_switch>;
> +                           };
> +                   };
> +                   port@1 {
> +                           reg = <1>;
> +                           eud_con: endpoint {
> +                                   remote-endpoint = <&con_eud>;
> +                           };
> +                   };
> +           };
> +    };
> --
> 2.7.4
> 
