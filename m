Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1A2621E4D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 22:12:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbiKHVMK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 16:12:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229550AbiKHVMH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 16:12:07 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BCE53C6EE
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 13:12:06 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id z24so22965940ljn.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 13:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HVjkux3cMwAxtEY/edHmZbgZZbL5KTdoZT7aFc5Nogw=;
        b=dbYV2VcOWcvtdXJeZS+WpMJdos1rClEv4l9pAMufctBzG2GcWGpxOy7nQA+Hea/m03
         SDIljuQ01BtW/oHZr7z+1as1K1GNVkjpIw0FFshiVH64g85I6zjS8IVbfj1q71gXNLn9
         si+8IuB+wzSudkQTUgLp0UJsVlwDKy3Feqwc6BpkXkFqfjAJNU4DemYABJtj8O4MD55b
         QOkisRpCLDbj23IoBuI3SJXiRXFxaLrvCJlUqKDMTBDZnl4xupRC4gvjtT0TKkFDYido
         umwwftIezMunFx15wDEgy/PQi0Itzw97t2gXRooZivOfGaIp3IXnwI9DdcyGCCRpBIOF
         rRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HVjkux3cMwAxtEY/edHmZbgZZbL5KTdoZT7aFc5Nogw=;
        b=1jq5+P2fuWHrVPqBGLMHemk0ukH0fjMbUk6AhD60U6a3VB55irf/BBPU4TgcsjeEBk
         s2t/9CuHG8wXj/NZ4EoN7Ov4uEV62kTx09qzG7zwPJYb5zygsBAWmheRoj7Gx1nr5SQ5
         zME8E+ap8XLxhMjIya6cJ8Y9l+wvs5gEsR6HIiEKVnnvRbspIPymXwk0I5NMtlR29eRX
         QZgaXRCMDpuyMLrDT7e4HOJFBCWiCDMV2/ERbKqPmYBF3ei+8HM5y9qTEis4c95UPSdg
         PiuC88dwtkDvHenWX1a76dfI7Vu2BrsJwrl09WNkzbuhvJJDlmf76N+FBJbOVL9pdy0a
         PwHw==
X-Gm-Message-State: ACrzQf1LQVjcONss+6+tIOsDlasFmOKXIvBKmQaoTU1d4/Ool3yCvlCV
        j8orkUbjgGPd0FBIFK2Rx5zsDA==
X-Google-Smtp-Source: AMsMyM5xlFqWOoqod0wnpXrCUnHoB0Up1jQ/+andB9sQZbg3hz+hkC/To36ahRaWgJQbAmcI3XRq6w==
X-Received: by 2002:a05:651c:1682:b0:277:1d5b:74b with SMTP id bd2-20020a05651c168200b002771d5b074bmr7029770ljb.522.1667941924622;
        Tue, 08 Nov 2022 13:12:04 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id a17-20020a056512201100b004a26b9cea32sm1926651lfb.271.2022.11.08.13.12.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 13:12:03 -0800 (PST)
Message-ID: <18e16410-2f20-96c5-1e9c-1ccb6c58c1b3@linaro.org>
Date:   Tue, 8 Nov 2022 22:12:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 03/18] dt-bindings: msm: dsi-controller-main: Add vdd*
 descriptions back in
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-4-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107235654.1769462-4-bryan.odonoghue@linaro.org>
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

On 08/11/2022 00:56, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml we didn't include descriptions for the
> existing regulator supplies.
> 
> - vdd
> - vdda
> - vddio
> 
> Add those descriptions into the yaml now as they were prior to the
> conversion. Mark the supplies as required as was previously the case in the
> .txt implementation.
> 
> Warnings about missing regulators can be resolved by updating the relevant
> dtsi files to point to fixed always-on regulators where appropriate.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index cf782c5f5bdb0..0f7747e55b9be 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -124,6 +124,18 @@ properties:
>        - port@0
>        - port@1
>  
> +  vdd-supply:
> +    description:
> +      Phandle to vdd regulator device node

Drop "Phandle to" and "device node", so just "VDD regulator". You
describe hardware rather (when applicable), not Devicetree syntax.

The same in other places and with that:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

