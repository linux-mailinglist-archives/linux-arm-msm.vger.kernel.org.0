Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFB17164A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 16:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjE3Ooc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 10:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbjE3Oob (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 10:44:31 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BDD89C
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 07:44:29 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51456392cbbso8857626a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 07:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685457868; x=1688049868;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tDgeJNYR1mRc99Zwj6kB5L18o06yCX2/R5yquqZiFxE=;
        b=s9B2XEAGQnToGrKy96poGs6yBxMIg2mYHKWAVzyLwmGed+drbKC3E4WkNzfMSribiD
         T4dZCqmg1eM6qB2lYjEIWvjlunTeAdG4MgUb/OCX7Js05KGquKhRl+r+fShDpW07OtWD
         tC6GsH1gTz8dkeAh7DrmtXStiLql+G+zBo/+fGoXEoOeDdqvcZK3yeJ4KMOrdVoiHFRs
         Ubxbv0ryCJKqa28BFX6eLF5vJUpFVYZS3/XVdN2e2HR7ZD/i0Xso7l9x5T6qaaGAEEN6
         nArTdsa56zvCs8SDhzENCq/7xLpsdUF7PdTC3+TxZ4iJrANS0I1jR4fJ1wzcHYAc8kQC
         FPDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685457868; x=1688049868;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tDgeJNYR1mRc99Zwj6kB5L18o06yCX2/R5yquqZiFxE=;
        b=YTDqD5be5mO86MxtY0kfwrUKTfZ1tXAdba9OiewFkE8fvu564sVEcHKb207Aik/ZCg
         jbJYfIvr7+dqmXNj2NjjFOlDZRA9Iw/3CYtQved+KAhsnWR1fdXHQIKlVY5kFG4RKuiG
         h0JrBQZw2xfCYzE8Eu5Ijq82ZxxR1Pu2MvyKs55fX+x0DNqC+Z2lS4fQOp+sRMClyDAa
         BAxhv4LwC5nL9YP7z8ri4kH6tK/WB+tPgJ+YsixqdxNf+2AE+Zs07vMi/oWFeIej10wW
         XT9F3hs0Q4SjMKyFEFcLQpKZ4D92xacceB/Iq8MVjnx3P/zIbUAw4ycfBGWjigjL45cc
         p5wA==
X-Gm-Message-State: AC+VfDwZ+3ycTUuu3dUD+6S0SAEM+zwz9tEnC5wnRbytE/qMfDlWnxZO
        9Dxhdlbb+xyGhnzT/IS2eFoL7A==
X-Google-Smtp-Source: ACHHUZ4T5PHcFnaPx8v9mzg3bIbkkS6HlPhAMlCvITGaIHWTSg5GtmcwkVpaT4RExgTL+ftHPEXFZA==
X-Received: by 2002:a17:907:7da0:b0:96f:b40a:c85f with SMTP id oz32-20020a1709077da000b0096fb40ac85fmr10682964ejc.23.1685457867760;
        Tue, 30 May 2023 07:44:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id b16-20020a170906151000b0096b15e4ffcesm7415705ejd.85.2023.05.30.07.44.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 07:44:27 -0700 (PDT)
Message-ID: <fdfc568e-703e-6e74-953e-742c00f0b5fe@linaro.org>
Date:   Tue, 30 May 2023 16:44:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: dts: qcom: ipq6018: correct the qrng node name
Content-Language: en-US
To:     Kathiravan T <quic_kathirav@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230526161138.25497-1-quic_kathirav@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230526161138.25497-1-quic_kathirav@quicinc.com>
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

On 26/05/2023 18:11, Kathiravan T wrote:
> qrng node address is mentioned incorrectly. Lets fix it.
> 
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
> ---
> Note: Only compilation and dtbs_check is checked. Also dependent on the
> below series, no functional dependencies
> https://lore.kernel.org/linux-arm-msm/20230526125305.19626-1-quic_kathirav@quicinc.com/T/#t
> 
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> index 0f6d6c6daed2..5d2cc0caf5a1 100644
> --- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
> @@ -309,7 +309,7 @@
>  			#size-cells = <1>;
>  		};
>  
> -		prng: qrng@e1000 {
> +		prng: qrng@e3000 {

This was fixed some time ago:

https://lore.kernel.org/all/20230419211856.79332-1-krzysztof.kozlowski@linaro.org/

Best regards,
Krzysztof

