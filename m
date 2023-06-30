Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C22DB7436AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 10:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232068AbjF3IMF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 04:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230233AbjF3IME (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 04:12:04 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584181997
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:12:03 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fb761efa7aso2496187e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688112721; x=1690704721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W50uLn6Ipi70lC/DeI/GySvcCDeVU856F9ShXora3ZI=;
        b=Yrs49uEJbMD5MhAn1DXhB74/uAyzr/tOtnJWJ2HtFIr2j8hHW8hL8qQaA4gnGoTJ76
         utjCZDqgrkVUaBobsQ6bqZ/ne4HpTWQLwNb4y+OFSC9dY6fYXNXxQa4yXf8kGMNKbgTQ
         Nt6nIH+XE7w0TJSM4DUqGQ6OHRAKWh0CGDeftnLqiTrXoaT+r7w0Dr03xRDS0qcmoiU9
         ZVn5p/k/T48r2nv5GglxCMlSF4SdiLUGNRj3251k/0SiZglVikleVXFGgxPnmmeg1Zck
         NcuBQdEc5GRPGl/DYg7oFUlOofTplPdqzgV6kUmSb07aZvLG+flkxGS/Ym6Virw2S9Lc
         m7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688112721; x=1690704721;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W50uLn6Ipi70lC/DeI/GySvcCDeVU856F9ShXora3ZI=;
        b=WFBbj2z3hNWjKyVgaLkDrputWQDVtuSiBZuVEpZ5ndn6N2T59BeVU79TqcsAqd8Jye
         DoIbuxNhqOwX4fhhVtbaAa2Ac+FBhrYTx0+k0f941nWJZkLU3WZmesG39KdmBhFA8I/b
         LLIPCyXymw5VhL1XLXJ9FGS8XL9wypDE+tVD3y40alDd/soarCeunBk2fDk0zeZpZgNB
         HhWP+QCIv2y/ECMK/XQoBNtKeGvAegBW4DR25TDghfXPZPUO5tLFP3ZTcRVB9kxYa1rW
         2e8/VISyBEUAd38ZGVQAZqNNXul4gyyt3zB1u41mQfjVFvB+H2eUior7iKuHAAiiUyUy
         l4VQ==
X-Gm-Message-State: ABy/qLYIpoJS/DDduetiVaO1Q8FfGa4KxWTtw28y29or3szW5k28p9JL
        wHPH7CiyWtPW/aZ042vurokaJpYumoZvvlVlwhI=
X-Google-Smtp-Source: APBJJlGxxL98aLwwuTk5vmsAR7f0XS7WyoNT0B7KwzqSleenSL4gE2AKotsmq6VFp+9Y0KkVSK967A==
X-Received: by 2002:a05:6512:2397:b0:4fb:a0ec:983f with SMTP id c23-20020a056512239700b004fba0ec983fmr2149167lfv.14.1688112721528;
        Fri, 30 Jun 2023 01:12:01 -0700 (PDT)
Received: from [192.168.1.101] (abyj222.neoplus.adsl.tpnet.pl. [83.9.29.222])
        by smtp.gmail.com with ESMTPSA id d13-20020ac241cd000000b004f62fdf61fdsm2632501lfi.204.2023.06.30.01.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 01:12:00 -0700 (PDT)
Message-ID: <e340e0f2-9eee-8f77-0144-123dce1653a0@linaro.org>
Date:   Fri, 30 Jun 2023 10:11:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/7] arm64: dts: qcom: pm8350: fix thermal zone name
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
 <20230630061315.4027453-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230630061315.4027453-2-dmitry.baryshkov@linaro.org>
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

On 30.06.2023 08:13, Dmitry Baryshkov wrote:
> The name of the thermal zone in pm8350.dtsi (pm8350c-thermal) conflicts
> with the thermal zone in pm8350c.dtsi. Rename the thermal zone according
> to the chip name.
> 
> Fixes: 7a79b95f4288 ("arm64: dts: qcom: pm8350: add temp sensor and thermal zone config")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
DTC really needs some sus overwrite warnings!

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/pm8350.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8350.dtsi b/arch/arm64/boot/dts/qcom/pm8350.dtsi
> index 2dfeb99300d7..9ed9ba23e81e 100644
> --- a/arch/arm64/boot/dts/qcom/pm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8350.dtsi
> @@ -8,7 +8,7 @@
>  
>  / {
>  	thermal-zones {
> -		pm8350_thermal: pm8350c-thermal {
> +		pm8350_thermal: pm8350-thermal {
>  			polling-delay-passive = <100>;
>  			polling-delay = <0>;
>  			thermal-sensors = <&pm8350_temp_alarm>;
