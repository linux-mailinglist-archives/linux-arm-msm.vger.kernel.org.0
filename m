Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 968A66C012F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Mar 2023 12:56:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230373AbjCSL4J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Mar 2023 07:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbjCSL4H (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Mar 2023 07:56:07 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F19F6E9C
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:55:47 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id fd5so36684191edb.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Mar 2023 04:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679226945;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W86ni2fvopCMREDkQgNbfIsjEmzHedwnrGMI3OaiZas=;
        b=Ksq21zw6Ubc1diC9TKxCmhC35sYpZgqIxyW7Bs+SP1mp9NhckPOu2uwcQcmokYLdu9
         knQ/LphhssU4pK2eItK/IdCUMg1ce5kdmZb7Oao7nPHCNlonIkrNyzvnftF5E7Y6ndIg
         s4LDKzMm8QbDLlM2myEgnG46HrzNUJCLXIGnn3vEHnqAPNINAtpPr7vWZ25qaDflT8PR
         R/w03t6A38Xw6nISCVBvl0SIpx/6j8kMJbAmM89JxjXQwRqRK8XjTUA0vxWr+tQEr1og
         FHNSCtFT1NpDgJqLvBPNrRr2bNjvdIxDTiC7E20xdpJ8mkDJCpWJpwrmpR9sl38QZOGs
         lbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226945;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W86ni2fvopCMREDkQgNbfIsjEmzHedwnrGMI3OaiZas=;
        b=Mizo8Na82pranQTf7Shz4F1b1RvUKhw5wtf3t9aBS3pdBsAooIeJpfmyaziS5O4JtC
         S6ielGw/vZAApbQgNwI5H9ouH0P7zO7aMvieWYaCDZtTGCGtd+jLzWnnLgoGWWLluvd6
         yekF4Ri3VBu7MsHKxcO6Th1ivT2WUDRrM3xExruKTJOyQHFt1JOEUB1Atj4KH00npcCQ
         60cG93l005EwVOy8Uk4DScPxK9V08pS7LdOK9kS79ZNFXLlbIx0xCdsFo8HMNEd3TQco
         HW2oxlL0lQUVSr0c81+szrPIXfYZv9Aw5wny2WaUQ5GWmwAe0ZlnMGzORv43bDbln1ED
         /9wQ==
X-Gm-Message-State: AO0yUKXfyKYgiirL+lDzC0Fo90wPpBj/7aeRboWjDRzTfJ0ZRbYmLJpu
        tNOQGPOxRqDBg7iyK4Zzmn6WJo2I1LL/4IbJFGk=
X-Google-Smtp-Source: AK7set+eNYxnR5pVVFUZqFSv3njTPNiiYD2G7A3voAQ+/TrwVON9wiIIpRcDcAkhgLV+aJiltLeZhg==
X-Received: by 2002:a17:906:d555:b0:8b1:7de3:cfaa with SMTP id cr21-20020a170906d55500b008b17de3cfaamr6796442ejc.3.1679226945716;
        Sun, 19 Mar 2023 04:55:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id w1-20020a05640234c100b004f1e91c9f87sm3391702edc.3.2023.03.19.04.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:55:45 -0700 (PDT)
Message-ID: <9a0764fe-2c8c-9101-10a7-5722a98b734f@linaro.org>
Date:   Sun, 19 Mar 2023 12:55:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 08/18] dt-bindings: usb: Add Qualcomm PMIC PDPHY
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
 <20230318121828.739424-9-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230318121828.739424-9-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/03/2023 13:18, Bryan O'Donoghue wrote:
> Add a YAML binding for the power-delivery PHY silicon interface inside
> Qualcomm's pm8150b hardware block.

Subject: drop second/last, redundant "YAML schema". The "dt-bindings"
prefix is already stating that.

This applies to other patches as well.


> 
> The pdphy driver operates with a type-c driver inside of a high level
> single TCPM device to provide overall TCPM functionality.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/usb/qcom,pmic-pdphy.yaml         | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml b/Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
> new file mode 100644
> index 0000000000000..79318e3da41e6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/qcom,pmic-pdphy.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/usb/qcom,pmic-pdphy.yaml#"
> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

All comments from previous patch apply

> +

> +title: Qualcomm PMIC based USB PDPHY driver
> +
> +maintainers:
> +  - Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> +
> +description: |
> +  Qualcomm PMIC Power Delivery PHY driver
> +

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/usb/typec/qcom,pmic-pdphy.h>
> +
> +    pm8150b {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pm8150b_pdphy: pdphy@1700 {

I guess: phy@
(and drop the label)

Best regards,
Krzysztof

