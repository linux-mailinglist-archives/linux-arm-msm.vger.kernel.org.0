Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9BE6C0121
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 12:54:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230370AbjCSLyI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 07:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbjCSLyH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 07:54:07 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3FD4211D9
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:53:23 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id eg48so36582434edb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679226801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJ71UDInAz2+CNmE5eVPSJ2zDxiBEWELzNsS0i5CpL4=;
        b=WBnHf0woIwzgC5KR7R/kbJMoc7SZfnsX0Ki+X/H6pdmWNCEzYb2n23kFpZIf/IT9k0
         thhHBs1OmMidkKdyb7FrCb0R/dJc9o6GTCstsF+Au1CDpECPXySQTUJWhjqozR+Y5u0c
         aUN59qhb3ILBeOa5REstedSGG8bMRtB4AhlblDCwBkoilBR27DrSwJ1ZCsWrS+xQ3d+q
         SWyaCuvPor3iVfqyZuSkLoOcAwM144b/nyg1GS+SuNNwZXbs+xkUASUDzcc8po6A1Euj
         yfJv4PRrZmLGj5Rbp1c3h7ZJZubNrjRN+CYk1fxqkqmhKGlJIq2SZ/TCvl24InWvPbHN
         dhXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJ71UDInAz2+CNmE5eVPSJ2zDxiBEWELzNsS0i5CpL4=;
        b=F2HNoPC42J4me7w1RojMJKhfl8DMuV/R1oPCMSRmCtmy7Jzw5Chh8vZRm7kmPBumHE
         XPYXmLeeaLmTg4VDXGEMOXkssLWaIhB51AM5MDeKSnQcadp//bsX7gPWDiGIksRDJxl1
         stUWkea8Ah2ErtuKoj2erEWGRfofkG0flO1GwlUEX4ZRTAGAZVTcxdjRU71Bue+GYgFb
         d3Dgiw630I2cqHHgJdblKzUtvr/PuAbNvNEmosr8AG7oGognHOA7+vZk+jKIRC0V5D7o
         xmBhbaqo6YZpTSg6i1WyqKjvf58khrkbDYRtVFfRUEi0DSoZWSXwLx6PUuC6/UaXvWvo
         JdBA==
X-Gm-Message-State: AO0yUKXoBYbOen9pzzWi/wyJruxKqsfl47baMzZpcrpxRaw/8hdl/24D
        pZStC5bMn3KKC7wHjj4rPwk9xg==
X-Google-Smtp-Source: AK7set91lCPN0CRx6z0v5QqXthAALYQL5WdtyRFFsupOKS8YjFY6OYJd/GbTXejyBYE8XNdzAZHsBg==
X-Received: by 2002:a17:907:7629:b0:8a9:f870:d259 with SMTP id jy9-20020a170907762900b008a9f870d259mr5169565ejc.48.1679226800986;
        Sun, 19 Mar 2023 04:53:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id g13-20020a170906198d00b008c16025b318sm3153143ejd.155.2023.03.19.04.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:53:20 -0700 (PDT)
Message-ID: <7adffc56-cbce-b8a3-5265-1cc24931b1f5@linaro.org>
Date:   Sun, 19 Mar 2023 12:53:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 06/18] dt-bindings: usb: Add Qualcomm PMIC Type-C
 controller YAML schema
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-7-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230318121828.739424-7-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/03/2023 13:18, Bryan O'Donoghue wrote:
> Add a YAML binding for the Type-C silicon interface inside Qualcomm's
> pm8150b hardware block.
> 
> The Type-C driver operates with a pdphy driver inside of a high level
> single TCPM device.
> 
> Based on original work by Wesley.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/usb/qcom,pmic-typec.yaml         | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> new file mode 100644
> index 0000000000000..d87bbab88d8be
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-typec.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/qcom,pmic-typec.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes.

> +
> +title: Qualcomm PMIC based USB type C Detection Driver

Drop "Driver"

> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |
> +  Qualcomm PMIC Type C Detect

Drop description - it is useless here - or make it something more, a
proper description.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pm8150b-typec
> +
> +  reg:
> +    maxItems: 1
> +    description: Type C base address

Drop description

> +
> +  interrupts:
> +    items:
> +      - description: Bitmask of CC attach, VBUS error, tCCDebounce done and more
> +      - description: VCONN Powered Detection
> +      - description: CC state change
> +      - description: VCONN over-current condition
> +      - description: VBUS state change
> +      - description: Attach Deteach notification
> +      - description: Legacy cable detect
> +      - description: Try.Src Try.Snk state change

These are the same as binding headers, thus it suggests header change is
meaningless.

> +
> +  interrupt-names:
> +    items:
> +      - const: or-rid-detect-change
> +      - const: vpd-detect
> +      - const: cc-state-change
> +      - const: vconn-oc
> +      - const: vbus-change
> +      - const: attach-detach
> +      - const: legacy-cable-detect
> +      - const: try-snk-src-detect
> +
> +  vdd-vbus-supply:
> +    description: VBUS power supply.

The name is usually vbus-supply.

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - vdd-vbus-supply
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/usb/typec/qcom,pmic-typec.h>
> +    pm8150b {

Node names should be generic, so pmic.
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +


Best regards,
Krzysztof

