Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C58A639689
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Nov 2022 15:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiKZOjR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Nov 2022 09:39:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiKZOjP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Nov 2022 09:39:15 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C8D1B1FA
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 06:39:14 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id r12so10948631lfp.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 06:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z2npeoW1fUYvgot8LGOdczcXpNyjWUXUEKt73WEmiAM=;
        b=y9PdNFgEdpOcvo1nWI9PTjNGq/DgMEyJBwKggVmJQMslyUvgKfY8DQt+eDaaD5NLxc
         pidH3J66+48Y7Ft0/cGJ02GDdOeC9hQLjmmxlUaE7LI6ZUJg9VzKYgSOmH3MLDc5EzeH
         FsbXECnOFOfxImvJW5q6jXS54VX0C3Uxak3HvGzeWx2tJ+vT/8SeQLVmZKc9Apnkm0r/
         eq+EgouUmvYTCRqut/TvGxJOjdLbRBY9CpjBDiOGfFB56AtkiNfa1VGvgybhEFi7U/6t
         qJrfbqU791YEtkaYp9nACehigIFzxEg/fPLQsm9+Xsn0QKtsGzQ0jMU1Uedv8KyVxsim
         vIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2npeoW1fUYvgot8LGOdczcXpNyjWUXUEKt73WEmiAM=;
        b=ylpoqaQFenbou66wKX6En8f7lhvE8AWDTao0SQ3GNlwo3AUlEKBaKu4GwxwYRrbRIn
         m1d82otPPLjaemRH548+51PurdbGZAMD3O9FrEOJUDPKZMQlindl2EeAA7+vIPDoKizN
         S7gJcvCenV0jx4JnjKEmPOJPcIhcUzGDkWcSAvIH4fXbg3zP2C4/QuH7J1eOWD/3Igo+
         Rr3MSnVFy2SrCefY91q7amP8mD0eLPf6bI0lhGzV20Bh9DYobTk/r1lIGyn2D09+wRMu
         Psft9lJt3HY52PcD0ar20l0uqw+wOuOjtsAgnunqGaJz1Jc/0IdZCub/bElLmGzz3r2h
         wTcA==
X-Gm-Message-State: ANoB5pmUwN2swRv84UVLqtY/P3y3TWdp2NZ0fFn1tsSOsLU9Cq077iJu
        XWGYU4i0uNjlXvQBoxrY8kAlxw==
X-Google-Smtp-Source: AA0mqf6pIhEjjCxmaDZ1mnUD6cLA91tLZOX0a2JYnwJ60QhlMlhj5MG22U1/Fp5c+BCi+krhFIN10Q==
X-Received: by 2002:a05:6512:a88:b0:4a0:2b7b:3f27 with SMTP id m8-20020a0565120a8800b004a02b7b3f27mr14167476lfu.443.1669473552868;
        Sat, 26 Nov 2022 06:39:12 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u4-20020ac248a4000000b0049944ab6895sm934026lfg.260.2022.11.26.06.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 06:39:12 -0800 (PST)
Message-ID: <130b23da-1cf5-126d-11b4-bffb766bd2eb@linaro.org>
Date:   Sat, 26 Nov 2022 15:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 04/18] dt-bindings: msm: dsi-controller-main: Add
 compatible strings for every current SoC
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
 <20221124004801.361232-5-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124004801.361232-5-bryan.odonoghue@linaro.org>
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

On 24/11/2022 01:47, Bryan O'Donoghue wrote:
> Currently we do not differentiate between the various users of the
> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
> compatible string but, the hardware does have some significant differences
> in the number of clocks.
> 
> To facilitate documenting the clocks add the following compatible strings
> 
> - qcom,apq8064-dsi-ctrl
> - qcom,msm8916-dsi-ctrl
> - qcom,msm8974-dsi-ctrl
> - qcom,msm8996-dsi-ctrl
> - qcom,sc7180-dsi-ctrl
> - qcom,sc7280-dsi-ctrl
> - qcom,sdm630-dsi-ctrl
> - qcom,sdm660-dsi-ctrl
> - qcom,sdm845-dsi-ctrl
> - qcom,sm8250-dsi-ctrl
> 
> Each SoC dtsi should declare "qcom,socname-dsi-ctrl", "qcom,mdss-dsi-ctrl";

You need to test the bindings before sending them. Such change needs
updates in examples.

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml        | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 67d08dc338925..c4da7179999d2 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -14,9 +14,20 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,mdss-dsi-ctrl
> -      - qcom,qcm2290-dsi-ctrl

You need to mention changes to existing compatibles in the commit msg.

> +    items:
> +      - enum:
> +          - qcom,apq8064-dsi-ctrl
> +          - qcom,msm8916-dsi-ctrl
> +          - qcom,msm8974-dsi-ctrl
> +          - qcom,msm8996-dsi-ctrl
> +          - qcom,qcm2290-dsi-ctrl


Best regards,
Krzysztof

