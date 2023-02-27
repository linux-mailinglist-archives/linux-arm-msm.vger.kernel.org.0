Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 889316A3E03
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Feb 2023 10:13:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbjB0JNv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Feb 2023 04:13:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbjB0JNh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Feb 2023 04:13:37 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4CF2BEC7
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 01:06:13 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id ec43so22669228edb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Feb 2023 01:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CH6ZpU+JOFCafQhSsbHQ0xgVRdIPci60OVF8oWU+Tfc=;
        b=T/pef4aQhpHKVXdjEoStsvQDncMiQZ78J8GsUOpjLcFNNAgYA6i3hXoQhn+6dPp+T2
         txgQ5E/uAtEXWxyXTjzhItOlpX7ux9sCS+EWmdHbnIJTwO75aZ+XsPJLSF6dMZnTtOET
         k5BUloRtinJVwCJeBO57hUuZ1U/J2fnNpDuAkkbTc5LNyVnN34NI0JaLohx1qcLeBXJV
         NzQ2hYeH9dqj4cPqXFtZ2i8JEKSKU8v+WF90Jl3Gh8eEQZGqchF5hJAn/vXfh0jz1+AV
         zfLQaMoBFUFOWKcHb/48tQPIFYnakC1cCtsH9ygQnu2dMhSfjvvAQdGlyElfgODA5bC2
         sa5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH6ZpU+JOFCafQhSsbHQ0xgVRdIPci60OVF8oWU+Tfc=;
        b=HP0EtdQ2XyLaRbvFO9kCWhv7C0Dr9z4mzGxtOkUyaOqlpyIaFFJoNBZdaS5aTjhIf5
         bib/LC9A6dP2zH1YBbfd2kL2lNrbnQ7NyHZxchenl6+2D5zKM87/2kqpNmbqsaitgHeg
         jCkcYZxZvci5kw0NfIxJwrvOHZcBslDJxe+b7ums+cp4J996DE8Ws0emABRqHtM5Pgei
         vOGIZbIOywe3ZDtoHGkMJMFA3hgbg0too159gxpjCvZNmZCIJrhyPCMnZ4uN/IaYOgpL
         s6d4cgThPO4iz7Nt3OV9q3u3buvFJ+9cVDcn8Lqa48DyTgrPWpZRW0mUjHMH2talcDdj
         lhvw==
X-Gm-Message-State: AO0yUKW8f4fc2Hh2TvBxacECXeyMtV002rBzn/94XLS8CTNiFBwsqt3Z
        6XMiGj6q6p2F1MfAMunx1t650Yop5MmrPmhaVjE=
X-Google-Smtp-Source: AK7set/XHFbsiCWEKMN5AeluxjBJDiNmFSbdklmpDlrCTPFxXBb6ozXrUsXvjirmXJjqO7SbPtCbDQ==
X-Received: by 2002:a5d:6782:0:b0:2ca:19c1:1d4b with SMTP id v2-20020a5d6782000000b002ca19c11d4bmr3928716wru.54.1677486411314;
        Mon, 27 Feb 2023 00:26:51 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id p2-20020adfe602000000b002c561805a4csm6482320wrm.45.2023.02.27.00.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 00:26:50 -0800 (PST)
Message-ID: <45737a29-8279-cb40-8d22-6a5052361061@linaro.org>
Date:   Mon, 27 Feb 2023 09:26:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v11 07/10] arm64: dts: qcom: sm8550: add QCE IP family
 compatible values
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230222172240.3235972-1-vladimir.zapolskiy@linaro.org>
 <20230222172240.3235972-8-vladimir.zapolskiy@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230222172240.3235972-8-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 22/02/2023 18:22, Vladimir Zapolskiy wrote:
> Add a family compatible for QCE IP on SM8550 SoC, which is equal to QCE IP
> found on SM8150 SoC and described in the recently updated device tree
> bindings documentation, as well add a generic QCE IP family compatible.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index ff4d342c0725..05ab0d5014c6 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1861,7 +1861,7 @@ cryptobam: dma-controller@1dc4000 {
>   		};
>   
>   		crypto: crypto@1de0000 {
> -			compatible = "qcom,sm8550-qce";
> +			compatible = "qcom,sm8550-qce", "qcom,sm8150-qce", "qcom,qce";
>   			reg = <0x0 0x01dfa000 0x0 0x6000>;
>   			dmas = <&cryptobam 4>, <&cryptobam 5>;
>   			dma-names = "rx", "tx";

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
