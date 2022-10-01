Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23FC35F1B86
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Oct 2022 11:43:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbiJAJnt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 1 Oct 2022 05:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbiJAJni (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 1 Oct 2022 05:43:38 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 271FD40BEF
        for <linux-arm-msm@vger.kernel.org>; Sat,  1 Oct 2022 02:43:36 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id g1so10223048lfu.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Oct 2022 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=+BcMde9iqTG0NgZIkDOw61cc104nrKj0MeB80A7RRT0=;
        b=aeiG2AGdrpDU+Fx50iTCqwDez5tHEVWfKFEoeY8XR3hMI2c6A9BHcXE9wcNInZO+Z8
         R/fHvxMVjSX8frspWPg8Dd0QxMK1uR86jeI4CxTIcVg0p35WVy5XBM+eDrN0XhcsZhEs
         6iQ4Lv3PHISSUd9I0TCbmLMX6Mt3eUvZX6ngz2gB5IXlqzYantcveQBHAanDkDK8Cg1T
         QdHd+wNivamuJyfIQSF+40E2/vGPQYdKpDtJV/ndDRoDUW/m9Vtt6ZiIDYpsh6IHnXXk
         OPU67PAcZjjPiu6rc/gCB8MhOHn/4Vidj+mDwL7Vp4lPRLeuKPA9cUJXBtMhog5IVLG0
         EklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=+BcMde9iqTG0NgZIkDOw61cc104nrKj0MeB80A7RRT0=;
        b=xVRxJzc850+hKm1uUQNLXfcmtvTuaZHOS+zVt+GXJ8Bsn7ha88LdMDnMrdGoitOuHS
         6XXl53SxoekO41ueK+z0L0r/96f70WznHdK5leQCo7WiJqrPwvVj0wIr+/Y1XJlIYkHs
         Zbr5Pq8MqeaC+NZMauzMkaJ0UTUOOKIbpsz/De5joMv2pABkjK9vH/0Rn0yvIp1Rz8jg
         eAEDC/7Gj0k9Aw/F0SYH06lukKg6PW2i8UKpSBi1AbY0upu8/NOW8lpJmA0FrKfdT1cW
         4Ecklpsu3AfFlmhoNy/SlyOVqp1HFJv6fZN/eHy5EUjBeqjirXplEU2vFGr7ESOP9rUO
         iBtg==
X-Gm-Message-State: ACrzQf30Tk9u9mHxphS3q4hKF+WtEPYvaSs8hvapcRDVY7OVmtXwJzFG
        uMC0uIP6Oi+G/BzN7SXe9Upgyg==
X-Google-Smtp-Source: AMsMyM7URN5IQv/AvVi2fZ4uNCbokWfGfei5qvrEKpOsirTEicR9uYZapMdogX+bE5Vo1Dy+hQjTyQ==
X-Received: by 2002:a05:6512:3ca0:b0:49f:f620:b826 with SMTP id h32-20020a0565123ca000b0049ff620b826mr5111040lfv.375.1664617414347;
        Sat, 01 Oct 2022 02:43:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g12-20020a05651222cc00b00492b0d23d24sm706287lfu.247.2022.10.01.02.43.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Oct 2022 02:43:33 -0700 (PDT)
Message-ID: <d1a26c97-75db-5d09-4c4f-77ed4fed1683@linaro.org>
Date:   Sat, 1 Oct 2022 11:43:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: YAML-ify SSBI bindings
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220930212052.894834-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/09/2022 23:20, Dmitry Baryshkov wrote:
> Convert arm/msm/ssbi.txt yo YAML, moving it to the directory with SoC
> bindings (soc/qcom/).

I think this should go to "bus" instead. Actually we could put there as
well GSBI and few others...

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/arm/msm/ssbi.txt      | 18 ------
>  .../bindings/soc/qcom/qcom,ssbi.yaml          | 63 +++++++++++++++++++
>  2 files changed, 63 insertions(+), 18 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/msm/ssbi.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,ssbi.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/msm/ssbi.txt b/Documentation/devicetree/bindings/arm/msm/ssbi.txt
> deleted file mode 100644
> index 54fd5ced3401..000000000000
> --- a/Documentation/devicetree/bindings/arm/msm/ssbi.txt
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -* Qualcomm SSBI
> -
> -Some Qualcomm MSM devices contain a point-to-point serial bus used to
> -communicate with a limited range of devices (mostly power management
> -chips).
> -
> -These require the following properties:
> -
> -- compatible: "qcom,ssbi"
> -
> -- qcom,controller-type
> -  indicates the SSBI bus variant the controller should use to talk
> -  with the slave device.  This should be one of "ssbi", "ssbi2", or
> -  "pmic-arbiter".  The type chosen is determined by the attached
> -  slave.
> -
> -The slave device should be the single child node of the ssbi device
> -with a compatible field.
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,ssbi.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,ssbi.yaml
> new file mode 100644
> index 000000000000..6154f7222899
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,ssbi.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/soc/qcom/qcom,ssbi.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes from both above.

> +
> +title: Qualcomm Single-wire Serial Bus Interface (SSBI)
> +
> +description:
> +  Some Qualcomm MSM devices contain a point-to-point serial bus used to
> +  communicate with a limited range of devices (mostly power management
> +  chips).
> +
> +maintainers:
> +  - Andy Gross <agross@kernel.org>
> +  - Bjorn Andersson <andersson@kernel.org>
> +
> +properties:
> +  compatible:
> +    const: qcom,ssbi
> +
> +  reg:
> +    maxItems: 1
> +
> +  qcom,controller-type:
> +    description:
> +      Indicates the SSBI bus variant the controller should use to talk
> +      with the slave device. The type chosen is determined by the attached
> +      slave.
> +    enum:
> +      - ssbi
> +      - ssbi2
> +      - pmic-arbiter
> +
> +  pmic:
> +    type: object

This is quite unspecific... Can we make it a ref to some PMICs schemas?

> +
> +required:
> +  - compatible
> +  - reg
> +  - qcom,controller-type
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    ssbi@c00000 {
> +        compatible = "qcom,ssbi";
> +        reg = <0x00c00000 0x1000>;
> +        qcom,controller-type = "pmic-arbiter";
> +
> +        pmic {
> +            compatible = "qcom,pm8821";
> +            interrupt-parent = <&msmgpio>;
> +            interrupts = <76 IRQ_TYPE_LEVEL_LOW>;
> +            #interrupt-cells = <2>;
> +            interrupt-controller;
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +        };
> +    };
> +...

Best regards,
Krzysztof

