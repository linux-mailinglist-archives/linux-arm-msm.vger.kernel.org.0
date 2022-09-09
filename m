Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 288CF5B3D17
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 18:36:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbiIIQgZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 12:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231826AbiIIQgW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 12:36:22 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFC3713EE67
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 09:36:18 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a14so393943ljj.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 09:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ikSj/h9KXYQejYz2/gZqgy9KvssOv1uE9EU7dQis/ig=;
        b=vE6GYiyy9/fJpiVxMDgdq/MMKetIZ16Y+qTbClAKaRqd3eiX4AApKmm8LUt0xcZ9/N
         KvurFZWSRuupu07hQVffQRI4STEx1z9NDZPx2aJx00Dl6tChUV/gqD07FOHDfBwwTFrZ
         PgkOPZUXrpaCNh1QIiA7yUuKn8yO0vo9hC2rXJoUxIeyI3lOlRlwTtMGsfEWETRnXx46
         SFCdMF59o6Sfa9GyfdjMNKxE4sPkM8tX28NHwsrmgkt8S5MlsROimQH4q49dX7UHmxdt
         Va3v7GdBzeB40sjFHH3t1pZb+ADE+PUmRK8aCsOyqIVsuL+S5/gpkJbk1j1HO24jth5f
         Wt0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ikSj/h9KXYQejYz2/gZqgy9KvssOv1uE9EU7dQis/ig=;
        b=HXq8AoG7NYmp7FjFeLKPU55UhUGLbKqmgiLYNYTHNy2Kzo5GA09M+xe5YcB1cb4F0F
         A3zIh2vyFHSqSStIX1yeAD7WZGOfpFGCtA3CDbnQpQqXh14I4J01gPjkkUd04x5WHyoz
         jV2KMUTYymbuUsXGyjtm7o+xjjS1AaH79ylH9/nEBRZNbemCJUPGAViWdcwnzk87AWLd
         cM1mf0beokw3iVFscF0S5nNqw4svn+aadpcWHJyiBRW36HczInpObWBtKG92IFguaeXY
         cf0Kv6mgxnOlokQc6t/04WXROrJaMmN+CduEpE/uFn/T4rPTORPxdI90zO7jE9Rct4Xz
         iQ+A==
X-Gm-Message-State: ACgBeo1RiStSm8kh2IrMoj0I4YCrNt+0XdLq5PPYst++JygWqzjseIXa
        CdukyIzy3Nf4kFrw6F7h7p7x/A==
X-Google-Smtp-Source: AA6agR69ALAic+GTVS5V8A4DCbhoCquXh3pdxsT5LZSyJCf5LqmI+fqRUXS8ukB74ENZGbE2NQ1Xvg==
X-Received: by 2002:a2e:a5c2:0:b0:261:d23a:2009 with SMTP id n2-20020a2ea5c2000000b00261d23a2009mr4053035ljp.303.1662741376947;
        Fri, 09 Sep 2022 09:36:16 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y14-20020ac2420e000000b004977e865220sm146457lfh.55.2022.09.09.09.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:36:16 -0700 (PDT)
Message-ID: <e67e888c-ba40-7e72-39d1-98d02416d8b8@linaro.org>
Date:   Fri, 9 Sep 2022 18:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/1] ASoC: dt-bindings: Mark old binding
 qcom,cpu-lpass-apq8016 as deprecated
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220909163416.1021551-1-bryan.odonoghue@linaro.org>
 <20220909163416.1021551-2-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909163416.1021551-2-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2022 18:34, Bryan O'Donoghue wrote:
> We've had some discongruity in the compatible string of the lpass for 8916
> for a while.
> 
> Mark the old compat as deprecated. New SoC additions such as msm8936 and
> msm8939 should use the compat string "qcom,apq8016-lpass-cpu".
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/sound/qcom,lpass-cpu.yaml    | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> index ef18a572a1ff3..bb6f0c5dd4e8b 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> @@ -18,11 +18,13 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,lpass-cpu
> -      - qcom,apq8016-lpass-cpu
> -      - qcom,sc7180-lpass-cpu
> -      - qcom,sc7280-lpass-cpu
> +    oneOf:
> +      - const: qcom,lpass-cpu
> +      - const: qcom,apq8016-lpass-cpu
> +      - const: qcom,sc7180-lpass-cpu
> +      - const: qcom,sc7280-lpass-cpu

We talked and I gave you the expected code with enum. I also explained
why other schema (Odroid sound) is done differently. The code here is
correct, but I find more readable and common to use enum. Please make
these entries as enum.

> +      - const: qcom,lpass-cpu-apq8016
> +        deprecated: true
>  
>    reg:
>      minItems: 1


Best regards,
Krzysztof
