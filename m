Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E924373B740
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jun 2023 14:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbjFWMb5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Jun 2023 08:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbjFWMb4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Jun 2023 08:31:56 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5337483
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 05:31:54 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f9189228bcso6459205e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jun 2023 05:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687523513; x=1690115513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XgzDLcXuxZvPzDXTcXShPjq83v8v5x+qH2Z62iL4DPg=;
        b=CD+qIGYvt+dSmpznE82wTIGr4VptpJ/PIixLD99ZuOBsha/Jq9ouAFjL58nrH0dBxy
         zfBzaz0xgNKbkIRHM9tX9uNEr1tTDXMr4AwPe1G+ONtNpSzXGNa3VSWq0DVAvTUwdc1Q
         rh2+hc8fh/gbSyrYA1rgITta0tFAxGxtDJDrIYapoGgmRzFP33WSSB3NnVdOPPidsNxX
         JLR9t1ISQyqWq0Dp57CJze9kcRWeNxAfmSrBeY+tvN4HhudyjxQktJc1HCXs98D7qGlN
         XbEkzduwUNeghh5R0helD2Vgvg1972rl08aOOhc9hf0XrjoVV03J4f8HudUCwMRXN1Zh
         6ezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687523513; x=1690115513;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XgzDLcXuxZvPzDXTcXShPjq83v8v5x+qH2Z62iL4DPg=;
        b=RTnVJyu4/jEyJJSgy9/gfEVlWmfRvMYIEPf2e8vJTGP2sKFHJVKdgsOtPE9qn3UL5M
         NdlysBxEi00kOEumHIdWrRFz2CJzXj0YEo/0gYXDsXDk6nV5Op5IsyEt191fZ8RVyfMV
         FBq0DKWlzOl0wRuaXIu2ctcmPXQ1TasdjCR3P69QU9LDTqrzfvZ7Jl8gEvsCEQhkm0HD
         iir4yJM8wGUH2OmDFC4DDAEBu9859JAkRXibcu1NJGRnvwj13/cTK3mzOc6TQ+v2Nox9
         NMVutxroHV02Ca6NNRWM0sc7R5fGq1LxcTePOpKFVJke+giNB4q3EFj/H1oAMm43cnw7
         18FA==
X-Gm-Message-State: AC+VfDzJWR1h2fWvgLa4l3wOWvosL6BSfODsZfXZ+D2nb4jgxKJt3XDD
        nPwHmqM2vjS83aUKlwxhHO7LXA==
X-Google-Smtp-Source: ACHHUZ5e6B4A10qr4sU19GSEERbThxTSpkM5Nxxs2SbsMRH0g1fPLSc0U76ji2Me1MW1Q0bA5+BR2g==
X-Received: by 2002:a05:600c:ad9:b0:3fa:7db9:86b0 with SMTP id c25-20020a05600c0ad900b003fa7db986b0mr951097wmr.37.1687523512696;
        Fri, 23 Jun 2023 05:31:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id x13-20020a1c7c0d000000b003f9c859894esm2273353wmc.7.2023.06.23.05.31.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 05:31:52 -0700 (PDT)
Message-ID: <cd84b8c6-fac7-ecef-26be-792a1b04a102@linaro.org>
Date:   Fri, 23 Jun 2023 14:31:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 5/5] scsi: dt-bindings: ufs: qcom: Fix warning for sdm845
 by adding reg-names
Content-Language: en-US
To:     Abel Vesa <abel.vesa@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20230623113009.2512206-1-abel.vesa@linaro.org>
 <20230623113009.2512206-6-abel.vesa@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623113009.2512206-6-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/06/2023 13:30, Abel Vesa wrote:
> There is a warning on dtbs check for sdm845, amongst other platforms,
> about the reg-names being unevaluated. Fix that by adding reg-names to
> the clocks and reg properties check for such platforms.
> 
> Fixes: 462c5c0aa798 ("dt-bindings: ufs: qcom,ufs: convert to dtschema")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> index 0209713d1f88..894b57117314 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> @@ -166,6 +166,10 @@ allOf:
>          reg:
>            minItems: 2
>            maxItems: 2
> +        reg-names:
> +          items:
> +            - const: std
> +            - const: ice

reg-names looks like a new property, so it should be defined in
top-level and just constrained per-variant.

Also there was similar approach:
https://lore.kernel.org/all/20221209-dt-binding-ufs-v2-2-dc7a04699579@fairphone.com/

but I guess no resends and it can be superseded.

Best regards,
Krzysztof

