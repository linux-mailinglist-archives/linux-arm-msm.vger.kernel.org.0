Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDAE375E4C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 May 2021 03:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbhEGBSy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 May 2021 21:18:54 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:43921 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbhEGBSy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 May 2021 21:18:54 -0400
Received: by mail-ot1-f54.google.com with SMTP id u19-20020a0568302493b02902d61b0d29adso5828508ots.10;
        Thu, 06 May 2021 18:17:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WUocJ5cCDfbaVz74+sX8cne8tSBxA0MyTwxDjGtb0DU=;
        b=q6ec4wbAqVLTRW+J9L/JcfU8w1LFs2RshCDCk48stqK67GvqLfZqhtrHxlog1H1uy4
         t8q4Ex9isiXHuc338bLE7fX5Fb+qJ6g/ceDWFuAwY1GohTuDYq+c4x5f2UOg1IveMucw
         P8fiIVti/lpzsMC2QHpQflenzihow+vkcSNEQJQRb5zVfpBFJcyxyjxcD9qyVtGZHHSI
         K3YeSS6IhnNaR/lXHQlZbGXS/kkuk87kgPDJxIHOjN2LGRB15HqHijGwnOOovcjpXeOl
         U7ySc0NTMAMj75g+eTashSPw8lkCgKQEfFjQfv/OoS11eTrZMr/mEJKhjF33ihuzv/6A
         AmiA==
X-Gm-Message-State: AOAM530QSXkjzS7X3/Y6Q4fULkv42fhLvRJZG/87cMjZnsrq2mzy9L0H
        t/U38K3ML84kUVmCl8wQ6w==
X-Google-Smtp-Source: ABdhPJxuk5ZadS7y0lSneR99Vth/rQj3HtTpGU2HKMwkd/ql+81FQNtIUmxQK9s0jd6X3NSoWmY7NQ==
X-Received: by 2002:a05:6830:18d3:: with SMTP id v19mr6156451ote.339.1620350275010;
        Thu, 06 May 2021 18:17:55 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u207sm731643oie.56.2021.05.06.18.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 18:17:54 -0700 (PDT)
Received: (nullmailer pid 1131278 invoked by uid 1000);
        Fri, 07 May 2021 01:17:53 -0000
Date:   Thu, 6 May 2021 20:17:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
Cc:     marcel@holtmann.org, johan.hedberg@gmail.com,
        devicetree@vger.kernel.org, mka@chromium.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        hemantg@codeaurora.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, rjliao@codeaurora.org,
        hbandi@codeaurora.org, abhishekpandit@chromium.org
Subject: Re: [PATCH v3 4/5] dt-bindings: net: bluetooth: Convert Qualcomm BT
 binding to DT schema
Message-ID: <20210507011753.GB1126886@robh.at.kernel.org>
References: <1620322392-27148-1-git-send-email-gubbaven@codeaurora.org>
 <1620322392-27148-5-git-send-email-gubbaven@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1620322392-27148-5-git-send-email-gubbaven@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, May 06, 2021 at 11:03:11PM +0530, Venkata Lakshmi Narayana Gubba wrote:
> Converted Qualcomm Bluetooth binidings to DT schema.
> 
> Signed-off-by: Venkata Lakshmi Narayana Gubba <gubbaven@codeaurora.org>
> ---
>  .../devicetree/bindings/net/qualcomm-bluetooth.txt |  69 -------------
>  .../bindings/net/qualcomm-bluetooth.yaml           | 111 +++++++++++++++++++++
>  2 files changed, 111 insertions(+), 69 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.txt
>  create mode 100644 Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml


> diff --git a/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
> new file mode 100644
> index 0000000..3f3ec4d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qualcomm-bluetooth.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/qualcomm-bluetooth.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Bluetooth Chips
> +
> +maintainers:
> +  - Marcel Holtmann <marcel@holtmann.org>

This should be someone who cares about Qcom BT.

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

> +
> +description:
> +  This binding describes Qualcomm UART-attached bluetooth chips.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,qca6174-bt
> +      - qcom,qca9377-bt
> +      - qcom,wcn3990-bt
> +      - qcom,wcn3991-bt
> +      - qcom,wcn3998-bt
> +      - qcom,qca6390-bt
> +
> +  enable-gpios:
> +    maxItems: 1
> +    description: gpio specifier used to enable chip
> +
> +  clocks:
> +    maxItems: 1
> +    description: clock provided to the controller (SUSCLK_32KHZ)
> +
> +  vddio-supply:
> +    description: VDD_IO supply regulator handle
> +
> +  vddxo-supply:
> +    description: VDD_XO supply regulator handle
> +
> +  vddrf-supply:
> +    description: VDD_RF supply regulator handle
> +
> +  vddch0-supply:
> +    description: VDD_CH0 supply regulator handle
> +
> +  max-speed:
> +    description: see Documentation/devicetree/bindings/serial/serial.yaml
> +
> +  firmware-name:
> +    description: specify the name of nvm firmware to load
> +
> +  local-bd-address:
> +    description: see Documentation/devicetree/bindings/net/bluetooth.txt
> +
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,qca6174-bt
> +    then:
> +      required:
> +        - enable-gpios
> +        - clocks
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,wcn3990-bt
> +              - qcom,wcn3991-bt
> +              - qcom,wcn3998-bt
> +    then:
> +      required:
> +        - vddio-supply
> +        - vddxo-supply
> +        - vddrf-supply
> +        - vddch0-supply
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    serial {
> +
> +        bluetooth {
> +            compatible = "qcom,qca6174-bt";
> +            enable-gpios = <&pm8994_gpios 19 GPIO_ACTIVE_HIGH>;
> +            clocks = <&divclk4>;
> +            firmware-name = "nvm_00440302.bin";
> +        };
> +    };
> +  - |
> +    serial {
> +
> +        bluetooth {
> +            compatible = "qcom,wcn3990-bt";
> +            vddio-supply = <&vreg_s4a_1p8>;
> +            vddxo-supply = <&vreg_l7a_1p8>;
> +            vddrf-supply = <&vreg_l17a_1p3>;
> +            vddch0-supply = <&vreg_l25a_3p3>;
> +            max-speed = <3200000>;
> +            firmware-name = "crnv21.bin";
> +        };
> +    };
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
