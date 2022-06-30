Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6CA56224E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 20:47:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236752AbiF3Srh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 14:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235957AbiF3Srh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 14:47:37 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3086A3E5DA
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 11:47:36 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id z19so24277edb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 11:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eVJf+csww7NgU7sUXv/h8AbxcDBzbGKo87FnaDBx4Cs=;
        b=LGe0vDF7k6UISWYS2d9ThHRH2Z84OcezJQrQ3AkjfHeW5trDgbh3ggig7VShrL7opF
         TAx0r57qOPCQBtI262bGVJ1AB5iCef3Ttm7aDqQplr4FFNNn1wtpBz75x3msz2Dz/RmA
         tHvV3x9R+PF2mqIiJyaH0d8m4+DGRUPl9QdZj01JRbnQ+sQfsSNTEJ2APQEiWn4OG2Og
         qtBUjrCMy5bAcmwMh4Z2CRa58lIk11DZIa5aZUvyQp8yNOrYWhNXlzjN1p0cgQ7r6YNR
         lHqEgD+ImM5U7fhixyu8yMpn5mjRk3iaTPXrkrY3a1IPdi3gNuXwweQJpHGz2Qf7ushU
         fsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eVJf+csww7NgU7sUXv/h8AbxcDBzbGKo87FnaDBx4Cs=;
        b=Kffz6nuJNTEyFxKx/YzKEhyzxka30F0gjunG2FihglpsfcXnzyShVeE7YdelCF9Gr3
         fYGydOTLgC9B/iAQdJPx2dHbaDk71S9BEZ9yrK7VTJlrJncJaj+x4PWqEkqnpDEPb8ml
         vs0JCS5KMHiYlOOiqkJ0sd0o/siRw0jiZXJaqVjnkincynli42GCKnE5KR4/3rRZQOMD
         JoUJnZyIBaHtDgnT/ppSBsls0aOMkS/8EwzLwiNlrNQkpJPkoVzkLbf9aNVk0aiwKJR5
         aThDllmpjjhSLZQ1Rmype0UNDakTd1M3uD7DYqyTriVs2j/snwkicizJXqV2ZMJyhzvZ
         kiFw==
X-Gm-Message-State: AJIora+JmmwBoOYlTQaikSisI2afDLtI1/jnmj0BPuGZm/jbJSAVdB+D
        wwwKbXakOH7zcUQVTlUbSTE0F9hKGbZKnQ==
X-Google-Smtp-Source: AGRyM1uKfwX7D58VjkiBSEl6rDEaCCrFmkc4BWirvW22vmo/yYLHVHephUtX7i2yaEbh9/oP31T9Rw==
X-Received: by 2002:a05:6402:5256:b0:435:9017:e5d3 with SMTP id t22-20020a056402525600b004359017e5d3mr13593629edd.258.1656614854784;
        Thu, 30 Jun 2022 11:47:34 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x10-20020a170906298a00b00722e8f4b459sm9525826eje.93.2022.06.30.11.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 11:47:34 -0700 (PDT)
Message-ID: <7a3efafc-71b2-c474-bb73-6959c701f459@linaro.org>
Date:   Thu, 30 Jun 2022 20:47:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: pm8941-misc: Fix usb_id and usb_vbus
 definitions
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, myungjoo.ham@samsung.com,
        cw00.choi@samsung.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, gurus@codeaurora.org,
        aghayal@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220630042357.3308128-1-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630042357.3308128-1-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2022 06:23, Bryan O'Donoghue wrote:
> dts validation is throwing an error for me on 8916 and 8939 with
> extcon@1300. In this case we have usb_vbus but not usb_id.
> 
> Looking at the pm8941-misc driver we can have usb_id, usb_vbus or both at
> the same time.

Implementation is not the best reason to change bindings. Implementation
can change, bindings should not.

> 
> Expand the definition with anyOf to capture the three different valid
> modes.
> 
> Fixes: 4fcdd677c4ea ("bindings: pm8941-misc: Add support for VBUS detection")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> index 6a9c96f0352ac..1bc412a4ac5e6 100644
> --- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> +++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
> @@ -27,10 +27,14 @@ properties:
>  
>    interrupt-names:
>      minItems: 1
> -    items:
> -      - const: usb_id
> -      - const: usb_vbus
> -
> +    anyOf:
> +      - items:
> +          - const: usb_id
> +          - const: usb_vbus
> +      - items:
> +          - const: usb_id

I don't think you can have ID connected and VBUS disconnected, therefore
is it even possible to have missing VBUS interrupt?

> +      - items:
> +          - const: usb_vbus
>  required:
>    - compatible
>    - reg


Best regards,
Krzysztof
