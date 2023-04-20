Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED1E96E90C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234951AbjDTKrJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235016AbjDTKqp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:46:45 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 209E876B6
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:45:53 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id h8so2291921ljf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681987552; x=1684579552;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1G5pOiPck55G2xKq6rWJE5J2T8IFIvNTwgb2mwK2KxI=;
        b=rrQo8xN/pMhgu9nl/p4hMJaPlEvCAXw2kGH8+4Z6SrgfYwWralGDfRRBkXbJ3xiXci
         Bv6iv8cmFFTFNk9ZigycRghaG5MMaKaMAy820Bv86gJaMol6jiqMHu1FLZIDAMm9871d
         UWp/E7+kusj1EmRsvy2+2nni/uWDWeu1NjBSLZ09X1lvHCFvZFu3y1nRLK0laLvhvIva
         qBCuBNaOI4Pc7f4doyeqTjtgO5WqGRxmtO1KaimLPY0WwQOf1GVwlz1kn2v7S3laYf+D
         FtuzvRs2P8oRzQiNbADauCWO0IYc1f52ZI/wTsrEpsdVnAo+TbmvsNDR+Rcr6sZgy8ry
         iY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681987552; x=1684579552;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1G5pOiPck55G2xKq6rWJE5J2T8IFIvNTwgb2mwK2KxI=;
        b=NBmKP1HEb2OrP/viez09X3WAvEopzUOhyEsnqtCIoW9WsQ5X67u/vbIlDlixKvuGXU
         2cE2S6FhSs3g3H6ry3VG9HlS9OAsW5XuFPz2yDlPKyr/6dwR5FJaxqqsKshUo4BUFC4P
         YKqr17Sh7ZmZAAF9kdn5yV30beIEcpeYOvAH8DpFVKC6zAspi1K+5kYwINAu4sI9Ipmt
         K3rSCrrBUFu9m9QAorqfehSCRoe7Dm+t3W15pPFZHk340VufTUpU9M9nKcJ3tlIJWWTd
         DACK/9Giz+hj7Qy6HHz1QF0lvzT4HkO3Nnu6p99yKyTo7EqIwzJ5B5zojZaW9nenWwGb
         6W5w==
X-Gm-Message-State: AAQBX9d9/fkYI1p+qnkzWNbGD40VfzvPNDFazrF6bok5uzNipQk10XfT
        KegQ7uPThxwmto30Of62g7kjhw==
X-Google-Smtp-Source: AKy350YgjAbMLBOkHlkyLhVFoVWmsjP6RWVgk8GEAMfrdvtR+Hkt2jWk8QcI4bp8YKSecxpujOrYqQ==
X-Received: by 2002:a2e:878d:0:b0:293:4ff0:678a with SMTP id n13-20020a2e878d000000b002934ff0678amr316873lji.22.1681987552126;
        Thu, 20 Apr 2023 03:45:52 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id o20-20020ac24354000000b004e843d6244csm176445lfl.99.2023.04.20.03.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:45:51 -0700 (PDT)
Message-ID: <40ebcbf4-5334-1cbf-7a42-1d6a801087f5@linaro.org>
Date:   Thu, 20 Apr 2023 12:45:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 02/10] ARM: dts: qcom: sdx55: correct rsc unit-address
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
 <20230420075053.41976-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230420075053.41976-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.04.2023 09:50, Krzysztof Kozlowski wrote:
> Match unit-address to reg entry to fix dtbs W=1 warnings:
> 
>   Warning (simple_bus_reg): /soc/rsc@17840000: simple-bus unit address format error, expected "17830000"
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-sdx55.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> index 72d82a9a6cc5..06c2646dd673 100644
> --- a/arch/arm/boot/dts/qcom-sdx55.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> @@ -792,7 +792,7 @@ frame@17829000 {
>  			};
>  		};
>  
> -		apps_rsc: rsc@17840000 {
> +		apps_rsc: rsc@17830000 {
>  			compatible = "qcom,rpmh-rsc";
>  			reg = <0x17830000 0x10000>, <0x17840000 0x10000>;
>  			reg-names = "drv-0", "drv-1";
