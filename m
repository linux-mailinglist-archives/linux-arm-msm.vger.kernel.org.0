Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7622758838
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jul 2023 00:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbjGRWGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jul 2023 18:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbjGRWGf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jul 2023 18:06:35 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1495F2125
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 15:06:16 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b73564e98dso95874841fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Jul 2023 15:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689717965; x=1690322765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fw0nFX/fe3uOfziao1TwEAT5+JrlGsI5lSuoy2n9tBA=;
        b=hDWc2AUJzQ07ReGrR9QzoD1bK5CxJFbwb6tMUeWdEZH9ulfIK3oJ5sNqZE2YwsdVkY
         fBKne73uv9V8fmHcnhfdLe2oHV9STUropH2Eh2RvDcjWxFpdIwfm/38kSqDRiEDIjGnl
         HzSKj/AXg98gs2Mviyay/eSmxXBWU3OPDs/FFHHAVfEAxC7oaI2lY5BPJpLbAa/pUZuW
         v+mK5yh1P08TRXMvOF5m/GBi7VPTYtepmuIdBJ9GTs4DMZKKtKdCRylWz0mS7t+Mthbi
         F6NJ1e52wQ3FJA5GUBS9VahZ06OZyTT17HhdFjZgcn0u0sJxOo2ZXzhZ2H1Px6gd3LLg
         QqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689717965; x=1690322765;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fw0nFX/fe3uOfziao1TwEAT5+JrlGsI5lSuoy2n9tBA=;
        b=B/5mPU67Z2cY3dEaH0dPbW8g5KHNO/07S41KglCnoMoo18TwvBYzEkWXo1LI5GgIZF
         DJFoF+RaJ54atiT+Jj4ADa8tMg2t8BGbeRLCnjhms6BvMIB6S6Bp8jswz49dd27ossSX
         ujBwlxZOPcqJR0ucXlmyk17rSomsmED0bHsvvzQdkc027WrGdAk6Fws7EV8cL6x5YwQZ
         Mj+G01eFJo19vXAKbWrcK8dPgwpqYkGMlm6jOynGYE70+aqWPJDwrWq0eyczD+vKzbdF
         KH1IMhtVALigRwt55gspX0ad8THbhbjHhX4FvpOhPzn9VYLlNCNMXyof66oYOi3X4gKI
         /uLg==
X-Gm-Message-State: ABy/qLblumEp4e20OwlzYB2L3Z7zqn8mjDLgeJGvyQTbnwLmzTSdWHLq
        uGzE+bTK4wqgUspoAC1RJelqKw==
X-Google-Smtp-Source: APBJJlFUHOXrYvXL54F5FwWX6WaokAPWGX+iRFN+3v7wQZ8Z23s/9SURLXYMPk0WyuY3+4IW2m7geg==
X-Received: by 2002:a2e:b052:0:b0:2b6:d9da:3d7e with SMTP id d18-20020a2eb052000000b002b6d9da3d7emr392042ljl.45.1689717965146;
        Tue, 18 Jul 2023 15:06:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id s6-20020a2e83c6000000b002b71a928c63sm695068ljh.115.2023.07.18.15.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 15:06:04 -0700 (PDT)
Message-ID: <3ce19d8f-97d8-15b6-5148-78e200b112e9@linaro.org>
Date:   Wed, 19 Jul 2023 01:06:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 06/15] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6125
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>,
        Rob Herring <robh@kernel.org>
References: <20230718-sm6125-dpu-v3-0-6c5a56e99820@somainline.org>
 <20230718-sm6125-dpu-v3-6-6c5a56e99820@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230718-sm6125-dpu-v3-6-6c5a56e99820@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/07/2023 00:24, Marijn Suijten wrote:
> SM6125 is identical to SM6375 except that while downstream also defines
> a throttle clock, its presence results in timeouts whereas SM6375
> requires it to not observe any timeouts.  This is represented by
> reducing the clock array length to 6 so that it cannot be passed.  Note
> that any SoC other than SM6375 (currently SC7180 and SM6350) are
> unconstrained and could either pass or leave out this "throttle" clock.

Could you please describe, what kind of timeouts do you observe? Is this 
the DSI underruns issue? If so, it might be fixed by the MDSS 
interconnect fix ([1]).

[1] https://patchwork.freedesktop.org/series/116576/

> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   .../devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml   | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
> index 630b11480496..37f66940c5e3 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
> @@ -15,6 +15,7 @@ properties:
>     compatible:
>       enum:
>         - qcom,sc7180-dpu
> +      - qcom,sm6125-dpu
>         - qcom,sm6350-dpu
>         - qcom,sm6375-dpu
>   
> @@ -73,6 +74,19 @@ allOf:
>           clock-names:
>             minItems: 7
>   
> +  - if:
> +      properties:
> +        compatible:
> +          const: qcom,sm6125-dpu
> +
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 6
> +
> +        clock-names:
> +          maxItems: 6
> +
>   examples:
>     - |
>       #include <dt-bindings/clock/qcom,dispcc-sc7180.h>
> 

-- 
With best wishes
Dmitry

