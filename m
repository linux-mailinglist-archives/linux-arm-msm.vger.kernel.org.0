Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 737A264F1F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Dec 2022 20:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbiLPTtN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 14:49:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbiLPTtL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 14:49:11 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF345747D3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 11:49:09 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id y4so3222809ljc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 11:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6z9OvKI51ihySsgu93liVf6+X1We62nP+OEGmpfLqbY=;
        b=fqe6OZr4BK1cJGFNLwq7ZfnbVfw7pE1NnMU/JaCOq6aNEAhaKopG1a5VaBHBUAaZKQ
         TLf4y1u9f6yQjYM18vKbj15CKtWeuLFbKm4+FJoypzbQweGHY+Q3OvJdqxhwUEcNwn8X
         I3sCSqMekAImG75HER1U8aFaO1+KFS08Ilr4TKwq79ef6ZcSTIJzfXWYhCGYGHHEMF57
         p+SZ078o5fL56L6Pue6cgyeu2R0tnIPOlHYNbGn65YaT5rEzdVAKFPloKbveTBdjQeNK
         5BRRoiJB11+DwiUjFZK1t9nIHyV6TqLmgm/6cf5xjqn4mHYeIvH8Kw74KdH23Ws8ay71
         +6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6z9OvKI51ihySsgu93liVf6+X1We62nP+OEGmpfLqbY=;
        b=6sQyESpsqOsk05gS1Yq+sL5M4nackyuQu/8Y3TwmEBz38KkC1iGpyuhDQaIO+e43vL
         pU3uihsTMZecIojnT0LCGIe53Usz4QHh5vAPsz5ye9B82nJsADWdw+vnyhvhanYS+McD
         DJCH8L/bLgpS2cWlJ7JJJn9CDaJbhLPsoeKof6hcK+t5f8ZySMv8FRgBipclPe+Vveaw
         EjEr9LHr+3dlUYxmXlR5FLIwCMqBVoO+1BiRxN/vbEDu0Yu7eIYIliHpUB4OiND1mQF+
         YfISzxcRYtWK8JM64Kpnj9YLiTnUImt2PxV9k26ZNDgOBiYBVvFMKkkoV/JmVw4PJu4C
         eY9A==
X-Gm-Message-State: ANoB5pkq/BuB5tHP0/g4WlrWcF/jsG/VvKSNmPmZ5Qo6PWsyhYZJGuP+
        2ZuxyU5gylh+pu3o3mbqxddCHg==
X-Google-Smtp-Source: AA0mqf43nHEgnTKkJx8PkGAY9Wz0D+UjxFUfVyEoYTgUfRFTw+weO1PR9gXva6El7Qb+jnUwh8hm5A==
X-Received: by 2002:a05:651c:1144:b0:277:1888:cfb3 with SMTP id h4-20020a05651c114400b002771888cfb3mr8207285ljo.16.1671220148357;
        Fri, 16 Dec 2022 11:49:08 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id p5-20020a2eb985000000b0027a00aab48fsm220337ljp.66.2022.12.16.11.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 11:49:07 -0800 (PST)
Message-ID: <acbdfbf6-f0e7-7c89-e5a3-effcc4e3e453@linaro.org>
Date:   Fri, 16 Dec 2022 21:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v14 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        devicetree@vger.kernel.org, airlied@gmail.com
Cc:     quic_abhinavk@quicinc.com, quic_sbillaka@quicinc.com,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1671217893-17496-1-git-send-email-quic_khsieh@quicinc.com>
 <1671217893-17496-3-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1671217893-17496-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/12/2022 21:11, Kuogee Hsieh wrote:
> To increase the flexibility of supporting different DP main link configuration
> at different platform, add both data-lanes and link-frequencies property
> into endpoint so that different platform can specify its own main link
> combination of both data lanes and max supported link rate.
> 
> Changes in v7:
> -- split yaml out of dtsi patch
> -- link-frequencies from link rate to symbol rate
> -- deprecation of old data-lanes property
> 
> Changes in v8:
> -- correct Bjorn mail address to kernel.org
> 
> Changes in v10:
> -- add menu item to data-lanes and link-frequecnis
> 
> Changes in v11:
> -- add endpoint property at port@1
> 
> Changes in v12:
> -- use enum for item at data-lanes and link-frequencies
> 
> Changes in v13:
> -- revised changes at port@0
> -- use correct ref schemas for both port@0 and port@1
> -- mark both port@0 and port@1 are required
> -- add line between data-lanes and link-frequencies properties
> 
> Changes in v14:
> -- add "unevaluatedProperties: false: to endpoint at port@1
> -- remove unnecessary quote to $ref
> -- re store "$ref: /schemas/graph.yaml#/properties/port" to port@0
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   .../bindings/display/msm/dp-controller.yaml        | 26 ++++++++++++++++++++--
>   1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index f2515af..1f008ca 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -81,6 +81,7 @@ properties:
>   
>     data-lanes:
>       $ref: /schemas/types.yaml#/definitions/uint32-array
> +    deprecated: true
>       minItems: 1
>       maxItems: 4
>       items:
> @@ -99,11 +100,30 @@ properties:
>       properties:
>         port@0:
>           $ref: /schemas/graph.yaml#/properties/port
> -        description: Input endpoint of the controller

Why?

>   
>         port@1:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base
>           description: Output endpoint of the controller
> +        properties:
> +          endpoint:
> +            $ref: /schemas/media/video-interfaces.yaml#
> +            unevaluatedProperties: false
> +            properties:
> +              data-lanes:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum: [ 0, 1, 2, 3 ]
> +
> +              link-frequencies:
> +                minItems: 1
> +                maxItems: 4
> +                items:
> +                  enum: [ 1620000000, 2700000000, 5400000000, 8100000000 ]
> +
> +    required:
> +      - port@0
> +      - port@1
>   
>   required:
>     - compatible
> @@ -193,6 +213,8 @@ examples:
>                   reg = <1>;
>                   endpoint {
>                       remote-endpoint = <&typec>;
> +                    data-lanes = <0 1>;
> +                    link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;

Is the alignment correct in the patch above? It might be my client not 
displaying the patch correctly, but it doesn't look correct.

>                   };
>               };
>           };

-- 
With best wishes
Dmitry

