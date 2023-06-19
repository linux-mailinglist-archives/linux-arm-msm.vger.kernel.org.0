Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBEC735148
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 11:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbjFSJ7P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 05:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231785AbjFSJ65 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 05:58:57 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06E512D57
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:58:07 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f871c93a5fso894274e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687168673; x=1689760673;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=shaQi0BVn1BxhqN9COT+jcDWVwBTRzmN4I4qbi6wbsI=;
        b=Y81hMYF+OM3/3qDZSz7A7k2OjaPh4aenG9JJvSaZ4FEBGPc8sxRfXkaCVuY/mCXN5x
         sWKluVOIT2UtfzGFczvFBS5y7oh6cgzNkZPJ3D20PkZMtGdSDLSTjhjIt6PAEOz3ZhVO
         x8qWXiBtQZ9E3JumVihts1oPuj9G1QxIFXQ90qZBsXs5uphCUXv8meD7emwK/ucXJqKI
         uLVQmfmF84MbbYLk/MBIY23VO6oRN2BF9rjKGtztHh+LBVyouYey5x/nfdurGVerieU7
         zChN23sovI7qTioXLBtHRke7wqTpTUUrpEwZvf5CAi1Y+AVcsreaGvdfMo9WF+iW7KSr
         jN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687168673; x=1689760673;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=shaQi0BVn1BxhqN9COT+jcDWVwBTRzmN4I4qbi6wbsI=;
        b=aPn6yPU+tYop1ZJ/TqGTLf9wZZdZAE166HjYd74O38WkMmuA26ZYNkCUO9fb7tlx7F
         fAmLhurn70M7PYfgD5V4bNXhpbDMAgKIzab6h3rubveWmV6IYQZ6DqaNsjWp6yALkVI5
         pYgPL+fvfhp0xY5zr/+SAYVn6XJoFMbVVijJ4hmrXQQBVj/xDHPsVkT50g7V//jExpQm
         JSOrCiHSJ8ajwkAEFWalx9nnKwI+Uztq/w2cbzcSPGpb3nUSb9fIMELP3G8SDw9zG7kv
         oHWhslGmx9r4xXapAY15I/bWQspdfbxQ72YdxGvWHMchMr1z8i6VeWQJAFYYc3HxGKCI
         pZ6g==
X-Gm-Message-State: AC+VfDw/ezu2FOak3UF8RzAyvPR2ijJ7TR/SQxGCqzAQwgdH5cEAKB2m
        WmQ7Rvyf+YQQPzIdf5FPFgGX4Q==
X-Google-Smtp-Source: ACHHUZ4UoQQq2loQjBjVAlRT9hjmVjwsO0FbmIvoSn4t/Q6ZX8UR+ZxHxheQdxpgG/yc7UtY2HTR7A==
X-Received: by 2002:a19:e059:0:b0:4f8:67aa:4f03 with SMTP id g25-20020a19e059000000b004f867aa4f03mr2059960lfj.1.1687168673398;
        Mon, 19 Jun 2023 02:57:53 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id q28-20020ac25a1c000000b004f3b4d17114sm4173296lfn.144.2023.06.19.02.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 02:57:53 -0700 (PDT)
Message-ID: <6d62cc6a-23ca-25a3-03b7-fb6f6c27cb6d@linaro.org>
Date:   Mon, 19 Jun 2023 11:57:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/7] arm64: dts: qcom: sm8250-edo: correct ramoops
 pmsg-size
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20230618114442.140185-1-krzysztof.kozlowski@linaro.org>
 <20230618114442.140185-7-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230618114442.140185-7-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18.06.2023 13:44, Krzysztof Kozlowski wrote:
> There is no 'msg-size' property in ramoops, so assume intention was for
> 'pmsg-size':
> 
>   sm8250-sony-xperia-edo-pdx206.dtb: ramoops@ffc00000: Unevaluated properties are not allowed ('msg-size' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> index 8ab82bacba81..9f3ea8d8d798 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> @@ -112,7 +112,7 @@ ramoops@ffc00000 {
>  			reg = <0x0 0xffc00000 0x0 0x100000>;
>  			record-size = <0x1000>;
>  			console-size = <0x40000>;
> -			msg-size = <0x20000 0x20000>;
> +			pmsg-size = <0x20000>;
>  			ecc-size = <16>;
>  			no-map;
>  		};
