Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C68F9679BC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jan 2023 15:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234912AbjAXO1o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Jan 2023 09:27:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234895AbjAXO1n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Jan 2023 09:27:43 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7455457C8
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 06:27:37 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so11082777wmq.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jan 2023 06:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ih/T3+fE5KUNeucJG+54LWbOG3GZygM+d+54jjzk9hE=;
        b=FPnGGmxkm6sxBclrNmB5yhxrik2jqrYeqam8kwEWXT9oiUeZOdKyCdOFTUt0bpXqx3
         68c6vtSpAx5L2d7Pmr1q+ayfjPQUkeWB6E4lIx1JtwrZ1k8Fus2cuHoud3LbvfOVO3SP
         o7sBIZDhr1LdFwD5d+FXG3BLTUNIKe03Nh44niOHwJFQ18R6sVGEoJI8xk12EcW4JGLO
         mgh7dps3sIS2AtQMFoTtewTiSIsnCe/XPDxQE7qKK4P5KIQt0kVvuC6ZRtw5frgpuyxG
         Y+3sMlEtfKommoGkiszSlc/2vgQYxtDRKp6+9RZ181c3DTi/M0BJRnJF9Adli/waEHFa
         E42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ih/T3+fE5KUNeucJG+54LWbOG3GZygM+d+54jjzk9hE=;
        b=gMoGOLbpU84CO2XhT35cilcohlZYcKalEHgwIcG9l5GlG48E7GvS4bTdt4L3bR3Oll
         USZghDmDXnhlUdxIvZjEu4YC+LR34PHC2M++yq8hYXnnnCwN+vZeePvfRQxuXI+dNYrR
         8jEPojCAU6QdsKAHUIuFVodUGC/dIls8gbsVvqxMq6S3m3bqLdi0l6HvVLKFgj9rLsr6
         yzBpotEAC5gowIiOt3ZJLkduViYXlvxjk0DnfDfR+mYZWiMHzHCAYDxfAPGBY4WfkWN9
         gufdpw7lw98pUE/IfxDA6tDGsObvcTC5Q2XqRgcwAiM8wbDCovZl36oowziSvGs0ltUb
         VC5A==
X-Gm-Message-State: AFqh2koXq5w5SG7JBPa9VYuv2y7cWLYH72a4yO6vK0iuN6rt63XYfwzd
        G813dz8Q265UGwrUOKEZLIvkcA==
X-Google-Smtp-Source: AMrXdXucT9VgZdYEYX8b4F6onwRJuVez8e638q9+QZ0SzAoR2soR2zqDhz7sCxfvzsqnOKV1E7DMcA==
X-Received: by 2002:a05:600c:5409:b0:3da:f66a:e866 with SMTP id he9-20020a05600c540900b003daf66ae866mr28100113wmb.10.1674570456290;
        Tue, 24 Jan 2023 06:27:36 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bg24-20020a05600c3c9800b003d9ed40a512sm18815472wmb.45.2023.01.24.06.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 06:27:35 -0800 (PST)
Message-ID: <3b4bd60c-84f3-f545-80ce-8ebe974557eb@linaro.org>
Date:   Tue, 24 Jan 2023 15:27:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add Xiaomi Mi Pad 5 Pro
 (xiaomi-elish)
Content-Language: en-US
To:     Jianhua Lu <lujianhua000@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G . Piccoli" <gpiccoli@igalia.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20230124135318.10023-1-lujianhua000@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124135318.10023-1-lujianhua000@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/01/2023 14:53, Jianhua Lu wrote:
> Add a compatible for Xiaomi Mi Pad 5 Pro.
> 
> Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 22553637c519..c5fe81fba5b1 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -873,6 +873,7 @@ properties:
>                - qcom,qrb5165-rb5
>                - qcom,sm8250-hdk
>                - qcom,sm8250-mtp
> +              - xiaomi,elish
>                - sony,pdx203-generic
>                - sony,pdx206-generic

Not a correct order.

>            - const: qcom,sm8250

Best regards,
Krzysztof

