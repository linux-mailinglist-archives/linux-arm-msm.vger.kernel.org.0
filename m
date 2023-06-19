Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C068973513C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 11:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231851AbjFSJ6m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 05:58:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231898AbjFSJ63 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 05:58:29 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 941C21BF0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:57:28 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b46a06c553so25440421fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 02:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687168644; x=1689760644;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LpHX1fmN3DTRSpAykI4rhLo9MiY3b3NnMZAHeKuMek4=;
        b=r6jpUqT5d/x+xutQmzIonYIAvHXBFJb7qabyNApYcfDQFWPljngcybstwhrBqDUNlT
         MlHlY8rGaVVy1vVFt0Q+vVEWMcfV8qF4RjBnQqxcfhRgUibaDqqtVNWCDPdi0lNSoV5G
         lpKDi0kZbylhqLr4IAF9ALzkPF1bIYLwUTUjGGdObpTHjg1UMmev3d6Pdh0MbgtuGN5G
         5vTgaJNip9PcLQBnMEH+UW2nqfXWEsKdOb4xi3rW10e0E5hoFwmRRhUXemQQ3AuTFGX+
         J9l0rHyVIsOp6TpVm9y468y/nO3SeOIklWlGMmxS5YWZk2j80j9zI81nnY7qdHWaLKCt
         tJJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687168644; x=1689760644;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LpHX1fmN3DTRSpAykI4rhLo9MiY3b3NnMZAHeKuMek4=;
        b=PqHCfpu4grS3YSrJbseE1SE1VcDh0JkRqFov+bI76Jnl22LUPz3CxepQTm6iaB1rOB
         KJtpRqOZxFA8CuYNMhh7S5M2UEvkEFcGWwv82MB2fW2HduG8IfEYcVpKvYtKb0V9IIqk
         t6OpQIVJrf5EYilkogEPRsspvZaK+dHdEQooY1CxlZDh3vCh3nsGwxB5KF7q18LwtNsv
         Gt8VtBQA8PJRjg6VK6ZjyIw5R4K9qtE2p1k9xe30FFeIlqBO8icYsS/TKUmW+OJQsawQ
         mHA8nC2a3pJno5tUVockLYdasTy3N9RATCBvlz90IW+MlZ4uCS8T/i4zSYa9yFw2x8lp
         1Puw==
X-Gm-Message-State: AC+VfDzzAD5kIq+OFp6VhWPtbITC2FOConFTt2Ct+2zeIn1KLOGoUOWJ
        VNUEYGFYFXs9y/NB21JrqXJuJw==
X-Google-Smtp-Source: ACHHUZ6ds0P+y6EM4avr8guXf49p3UjRCiiSfiOoJ7FZWmQdRL00escnWp6qRTCZaBaPYaSB3eKO2A==
X-Received: by 2002:a05:651c:224:b0:2ad:bdb7:b4c3 with SMTP id z4-20020a05651c022400b002adbdb7b4c3mr6056735ljn.22.1687168644690;
        Mon, 19 Jun 2023 02:57:24 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id x5-20020a2e9c85000000b002b216ef9f5dsm5080170lji.43.2023.06.19.02.57.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 02:57:24 -0700 (PDT)
Message-ID: <4a756490-5c59-5d10-cdbb-1e5ba98653a4@linaro.org>
Date:   Mon, 19 Jun 2023 11:57:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm6350: correct ramoops pmsg-size
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
 <20230618114442.140185-5-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230618114442.140185-5-krzysztof.kozlowski@linaro.org>
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
>   sm6350-sony-xperia-lena-pdx213.dtb: ramoops@ffc00000: Unevaluated properties are not allowed ('msg-size' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> index 30e77010aed5..698171bda9fa 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
> @@ -673,7 +673,7 @@ ramoops: ramoops@ffc00000 {
>  			reg = <0 0xffc00000 0 0x100000>;
>  			record-size = <0x1000>;
>  			console-size = <0x40000>;
> -			msg-size = <0x20000 0x20000>;
> +			pmsg-size = <0x20000>;
>  			ecc-size = <16>;
>  			no-map;
>  		};
