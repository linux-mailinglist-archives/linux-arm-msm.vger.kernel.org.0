Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60080793A9D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Sep 2023 13:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236685AbjIFLF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Sep 2023 07:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234351AbjIFLFW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Sep 2023 07:05:22 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C22ACFF
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Sep 2023 04:05:16 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-501bd6f7d11so2888440e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Sep 2023 04:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693998314; x=1694603114; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q4sjMrr0GyerSKhCFsPRDpQJS6Uaeprbbt5G9jrR7bk=;
        b=RcInhUhKEaghQzDOuu+RA86UVTafExtfRT4aXPHlEhPMaHUGGLYwKVeGiO9tyWOCjf
         0Q+7tT/JDx+ExIYk3uLMKAOCup7dS2TGUeOkTmzvwiZtMEWxe6G3hrrgjxHZ4hd0Tx1X
         BBFm6nn+WpPrdhm3fKsLWDOlRGr4uQwxQX+vnTUInOz8e5q1ehLlW+iqeroZrosAuf7I
         RfvD8HiooVQzDMVdfQQ2o3F0v18+TZRXDRETHL5HMkJCEAQYFEyq2SaafwhhL1fj/Ftu
         NVuvttLrz634JwuFjFXButAPO26vXYExvAATUh7BZ+b+GIjGBdpazEKQnWtURVcqn9WT
         CeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693998314; x=1694603114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4sjMrr0GyerSKhCFsPRDpQJS6Uaeprbbt5G9jrR7bk=;
        b=FIMvF+eSllbNc94neZBEipNGOXdaZ3YoCg8fopAk4dx/zdpUI4NrGPS7RI7gyLVmDB
         GpS+xc2oMg5HaqIsvWEi/cTDwYqOACNOjbOJsYDmVZRCVYrYeQsxJZaAbRN+HKEkjL2I
         gY8QX0+GtnP4T9vSbRG9AkIgtbha8Iiq//syK4uzjV5Hi4uvYRF43pG+7sM/nVKwAuvi
         I+6HbgXEimM9rdZBLBf+dLQV54upoEC1fJM3TW3Rzkqbku2+J2RqaAauxhLNCwpulGSc
         TPcSbzVUIcu6QM5y3G0hjsHVQOhYO7UApZDFcYJ06dxNuYow1AXel8shb472AH0xkp8t
         LDgw==
X-Gm-Message-State: AOJu0Yy2laQrjyN//SmcH2TZ/NIAw/TzS0UF2X+CALfJZrHVZSp4/CC5
        U+DCQ3hGCLO3ct73CX+gb8+ZLA==
X-Google-Smtp-Source: AGHT+IEeKdFy4EhNZP6OwJIuj7M35TsPaFul8Wo2DCOR7CpQmRyrt2SWbiETwUbYhzcgokvo4T+zYg==
X-Received: by 2002:ac2:5501:0:b0:4f1:4cdc:ec03 with SMTP id j1-20020ac25501000000b004f14cdcec03mr1609818lfk.18.1693998314528;
        Wed, 06 Sep 2023 04:05:14 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id ja8-20020a170907988800b0099bd5d28dc4sm8775909ejc.195.2023.09.06.04.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 04:05:13 -0700 (PDT)
Message-ID: <7bca9767-1112-4817-aac1-e6d720e92817@linaro.org>
Date:   Wed, 6 Sep 2023 14:05:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: qcom: qrb2210-rb1: Swap UART index
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230906-topic-rb1_features_sans_icc-v1-0-e92ce6fbde16@linaro.org>
 <20230906-topic-rb1_features_sans_icc-v1-1-e92ce6fbde16@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230906-topic-rb1_features_sans_icc-v1-1-e92ce6fbde16@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/09/2023 12:24, Konrad Dybcio wrote:
> Newer RB1 board revisions have a debug UART on QUP0. Sadly, it looks

Nit: I think this is '.. revisions should have...'. Because I was told 
that the board I got is the final design / production.

> like even when ordering one in retail, customers receive prototype
> boards with "Enginering Sample" written on them.
> 
> Use QUP4 for UART to make all known RB1 boards boot.
> 
> Fixes: e18771961336 ("arm64: dts: qcom: Add initial QTI RB1 device tree")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> index eadba066972e..5cda5b761455 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> @@ -13,7 +13,7 @@ / {
>   	compatible = "qcom,qrb2210-rb1", "qcom,qrb2210", "qcom,qcm2290";
>   
>   	aliases {
> -		serial0 = &uart0;
> +		serial0 = &uart4;
>   		sdhc1 = &sdhc_1;
>   		sdhc2 = &sdhc_2;
>   	};
> @@ -357,7 +357,7 @@ key_volp_n: key-volp-n-state {
>   };
>   
>   /* UART connected to the Micro-USB port via a FTDI chip */
> -&uart0 {
> +&uart4 {
>   	compatible = "qcom,geni-debug-uart";
>   	status = "okay";
>   };
> 

-- 
With best wishes
Dmitry

