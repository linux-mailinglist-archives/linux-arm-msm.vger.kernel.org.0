Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DBED69E63C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Feb 2023 18:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234471AbjBURrY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Feb 2023 12:47:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234474AbjBURrR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Feb 2023 12:47:17 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA5792F799
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 09:47:15 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id m7so6702992lfj.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Feb 2023 09:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kk6hjQZz8Uy7y6FCGmQtmN0QqqwvaG8ovqwa+KbuB9M=;
        b=rJteYuJmxbm8wgLTmhQECO6DpNR4AcEXaVqveYiBOXmlm+xT7DSe+J00tgRJKya0AG
         y9FW8a1uhkAYLmFGiwjpkYlqGE4qfLmvS5ScfJGN11i7+rMOa1oZODYYvl+ipgzcBPTe
         uVIP9FPIEdDFIG/vJBTDgHjnUecfWyXlnf9bZ7kaWVJNB59GW6inB434C1HO8TNBNz45
         xYKxN2zcQYfOyLC+bohMaKBo5A1uMlC6Ywy5iAAzdnTZmbgpSieXLX/aoecwn12niDkI
         qKoHtPT3MlTSyXWX5frggBcyaozBBlHuHUMvBFJ49QQ2nobIXtE8pF9nevIz1p2HLm9B
         UYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kk6hjQZz8Uy7y6FCGmQtmN0QqqwvaG8ovqwa+KbuB9M=;
        b=2FGW1VPQLDHWDk3txe4WYOiJbM0yf7xt/35Gjr0EJ6fdHs2TMsqemOmjgTl6qXRIea
         kXTkNdbpdtEIxh9uea+6e/YlDDBKqJWeGIXu9lwF/MZf7hoH8x7zhvse4NVa0mIOrLdU
         zE4rq6m/g4jETokHNxqao2tp8z9OUrnbLgttH3q5L5Uw0cgXCekljYr+QIS8se/zdGra
         spU5YYMau1xM1joXg0PkuPhkN7BVJssS+AqJu90t6ZcIFySKvydJFn3GguY43t+MBlha
         bFafPNyZP02ouE6E3GynRuNyyhJrtP7kIr/WeHpYMV53C7cs0gtRnnSx8tWO5OuE4xg+
         /q4g==
X-Gm-Message-State: AO0yUKXXrfzrKO5HJf4xB5nHrgSr59z0v7sqkBFcgKSw6wkBc9NfAtun
        04m1EZ4ZYfH1Fj5IlhZ/Xce+Ew==
X-Google-Smtp-Source: AK7set/OfDblZck8LghxLTQ1eT1C4BD3yjGqtD/TCSA4IxSrlDe69jjvyDAtWl0CXcRCOt7hYoTv+A==
X-Received: by 2002:ac2:5391:0:b0:4dd:995b:e5ef with SMTP id g17-20020ac25391000000b004dd995be5efmr26616lfh.47.1677001634013;
        Tue, 21 Feb 2023 09:47:14 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
        by smtp.gmail.com with ESMTPSA id c22-20020ac25316000000b004db3e445f1fsm611983lfh.97.2023.02.21.09.47.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Feb 2023 09:47:13 -0800 (PST)
Message-ID: <82f86391-15dc-3613-e4ce-cdeb1ee49fd8@linaro.org>
Date:   Tue, 21 Feb 2023 18:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8450: Add IMEM and PIL info
 region
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, elder@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1676986616-21378-1-git-send-email-quic_mojha@quicinc.com>
 <1676986616-21378-2-git-send-email-quic_mojha@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1676986616-21378-2-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21.02.2023 14:36, Mukesh Ojha wrote:
> Add a simple-mfd representing IMEM on SM8450 and define the PIL
> relocation info region, so that post mortem tools will be able
> to locate the loaded remoteprocs.
> 
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
> Changes in v2:
>  -  put ranges after regs and corrected the sram node position.
> 
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 1a744a3..2a4f4ac 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -3814,6 +3814,20 @@
>  			};
>  		};
>  
> +		sram@146aa000 {
Looks like it's not sorted properly? Should be between
TLMM and apss_smmu address-wise.

Konrad
> +			compatible = "qcom,sm8450-imem", "syscon", "simple-mfd";
> +			reg = <0 0x146aa000 0 0x1000>;
> +			ranges = <0 0 0x146aa000 0x1000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			pil-reloc@94c {
> +				compatible = "qcom,pil-reloc-info";
> +				reg = <0x94c 0xc8>;
> +			};
> +		};
> +
>  		timer@17420000 {
>  			compatible = "arm,armv7-timer-mem";
>  			#address-cells = <1>;
