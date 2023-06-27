Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 114F173FAFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 13:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230113AbjF0LWZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 07:22:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjF0LWY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 07:22:24 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1412B19BA
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:22:23 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4faaaa476a9so3866519e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687864941; x=1690456941;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M99pKLa1dMw9umueIB7De3e5gFOW9rmOQmfIRey36Nw=;
        b=V7w4BJuJ3TXgsWySkOaPC+NLsZlPalDWbyo7dn7mf2IyluvRX/mzbP5fRw2jHMDh2T
         2K2N0Uq2nqMHoIjdLDdpVvps9uKI54UO8M5AKRn66O3ytYAIEKbaJHTDs9dKgcpI0hft
         wOTnNhsref00Pq9EU+YPqM85ZJA87YYyWXmqhg0Nr8rqS7mI707eaNHzJLSOAuvUlkLb
         4Doi/owkak6rC6+dgtj03I/ZAeg84T3Hyj9SSg57UcJoUOL7eGt+M9r2TwNDChYu6vMM
         LIk+Q+QlgCQHqoptu6FlTJ6ttHrCbjocfOQb0saLmeoNUQuen6HZsYDfJNFUpbDwDCYN
         0fsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687864941; x=1690456941;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M99pKLa1dMw9umueIB7De3e5gFOW9rmOQmfIRey36Nw=;
        b=l6M+bfXcixa6q/dQa7gZ84pk1W1pVG6tfXs7BwzCVJ2sL5EJiWEgFjj1hTKBbt74hq
         /A7/npx/YRevVseKdL8rzyPtJYObj+0aryaWEOFKRl/CyV3vkdne6qyaamW6N/8h9UOi
         hAyqK19WHRRLUJKCfP+d2IbHVhgep0Q3MzecfPIgFI7hQUtUJJKANSqoYXN6+yaJucbJ
         TmWLO3MSmNSqp42JYgvqDi8WHFoC8JY6hFZXOEQKzgF2a7BZI7dnO8a8T6DGKODHVxWS
         Ob6Sq1QquZsDIzq8PovqI0kbmVFp1Onn9iVNjiwa2xms1m2WLN70+0KJp0dumJrJKp/3
         Vung==
X-Gm-Message-State: AC+VfDzf+42PZdlcFMQoDzFKWhrxM5aKdrKtWgxCmDjlPS1gAm2tKI91
        SQxiiqx4BZ1ZH2fnTgrxu0d1zQ==
X-Google-Smtp-Source: ACHHUZ6YWyYhbzuNiaXs74xBRbKuOYKASIrNmQbTaXuGGa6OWJXEfINRX00Ix8kerlwRvu8xVuXljw==
X-Received: by 2002:a05:6512:3d16:b0:4f8:7325:bcd4 with SMTP id d22-20020a0565123d1600b004f87325bcd4mr5522881lfv.0.1687864941114;
        Tue, 27 Jun 2023 04:22:21 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id b27-20020ac247fb000000b004f8703fbd80sm1501051lfp.57.2023.06.27.04.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 04:22:20 -0700 (PDT)
Message-ID: <67ffd988-dbe9-92c5-f279-462250e1966d@linaro.org>
Date:   Tue, 27 Jun 2023 13:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 15/15] ARM: dts: qcom: msm8960: drop useless rpm
 regulators node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
 <20230627012422.206077-16-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230627012422.206077-16-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27.06.2023 03:24, Dmitry Baryshkov wrote:
> The set of regulators available over the RPM requests is not a property
> of the SoC. The only msm8960 board file (qcom-msm8960-cdp) also defines
> this node together with the compatible string. Drop the useless device
> node.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> index 8157236f249d..b25cd58003e2 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> @@ -200,10 +200,6 @@ rpm: rpm@108000 {
>  				     <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
>  				     <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>;
>  			interrupt-names = "ack", "err", "wakeup";
> -
> -			regulators {
> -				compatible = "qcom,rpm-pm8921-regulators";
> -			};
>  		};
>  
>  		acc0: clock-controller@2088000 {
