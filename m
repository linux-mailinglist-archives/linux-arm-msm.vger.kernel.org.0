Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9128574845E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 14:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbjGEMr1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 08:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbjGEMr0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 08:47:26 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3B9910F2
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jul 2023 05:47:24 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b6f9edac8dso24794401fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jul 2023 05:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688561243; x=1691153243;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k7AhrM/NDMrVR6eVPD7oN790ZYJE1/FcirAMl2b04pQ=;
        b=mCeVcIOm1PPFrD2UKvevfj8L2uOKCTQBZ4OJCsj5Hp29KJ0/XkNI5HxrDMTdPmM9N1
         1ex36PNrVwZf+ZrHdkJQDp1Rc0WWzru+ZUY16eEh7R1vze2VLkVwHiwsPG6Lu/EEfhB9
         5yIN/V1FABMjagHcNwNeGHOlZxS1yVcMVIrgSyxhyEES05ngtAN0yF3JN76m1hPLc/Pw
         QtlbzEPj11xkqsHFVOAwyZgJnplHZTLdQkAdYBxDN8Vb/0ct79wzVjZDNMHc4Um7nfZJ
         zwJN01lwdZFoj+6/9VXv4XpC8/Z0oyNKYHsZCiALRA1Xv+KRdgB6nY3ExDtAlYjfXZzg
         H1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688561243; x=1691153243;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7AhrM/NDMrVR6eVPD7oN790ZYJE1/FcirAMl2b04pQ=;
        b=JBEmXemwreY5b+k/5ll2oAc8r6WIiCabP2N4QCnQv69F5CsKz1hHEZABiDpHnAzn6Y
         K5Gvfm0lXEHfdWiX5wBzhQ62NGDMTZAbVsR57ZElEtiW9U8wEPrH5jQWelbZYbVYNW1e
         XYX8/CKVC2u8TNFTP5lnZMQjuFIhGTyWHNCTX10/PCg2ipkZk48Sd6k/VySw3zNAyzWi
         AeIQaa6H5AIc+vVM1GuJBgou4AdqGTWgOWXOA9PGyaTCiWDVEETNci/gnrPUcqiXc4ii
         L4Q8UrJbr02GYK2KXR8rYQbFiaoeK7N+o0fzd2zuW3QSyaS/wp9ejbB6Nnwg48nwle5X
         k+pg==
X-Gm-Message-State: ABy/qLac5A3PJbeUA/ffQDOB9vUvzK3xUNg0crNK9y6892wj4iKyBKyl
        a7HO97dCl3GmgLdRwddv6uxPVw==
X-Google-Smtp-Source: APBJJlGzWamSYpfesn8gFD1Q+Sg/TrWeLhLTFZLCfS3wI3IL97fduA0ZhIzKK1xWYaARlKInulx8JQ==
X-Received: by 2002:a2e:8783:0:b0:2b7:2ea:2e27 with SMTP id n3-20020a2e8783000000b002b702ea2e27mr164767lji.19.1688561243243;
        Wed, 05 Jul 2023 05:47:23 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id s6-20020a2e83c6000000b002b69febf515sm5714758ljh.125.2023.07.05.05.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 05:47:22 -0700 (PDT)
Message-ID: <bec987d3-41b4-5edd-8daa-ee67f19c5005@linaro.org>
Date:   Wed, 5 Jul 2023 14:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH RFT RFC 1/3] arm64: dts: qcom: sc8280xp: Add lower cluster
 idle states
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230619-topic-sc8280xp-idle-v1-0-35a8b98451d0@linaro.org>
 <20230619-topic-sc8280xp-idle-v1-1-35a8b98451d0@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230619-topic-sc8280xp-idle-v1-1-35a8b98451d0@linaro.org>
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

On 19.06.2023 18:18, Konrad Dybcio wrote:
> Apart from a total LLCC + APSS power collapse, SC8280XP can also put
> either the DSU rail (CPU + L3), or VDD_CX in power collapse.
> 
> Add support for these lower idle states to allow more flexibility.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> index ac0596dfdbc4..d524f851cb53 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
> @@ -285,7 +285,23 @@ BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
>  		};
>  
>  		domain-idle-states {
> -			CLUSTER_SLEEP_0: cluster-sleep-0 {
> +			CLUSTER_SLEEP_L3_PC: cluster-sleep-0 {
I guess this is misleading.

cluster-sleep-0 would be APSS_OFF (cores and caches have no power)
cluster-sleep-1 is ok (the CX rail is 0.0W)
cluster-sleep-2 would be AOSS_SLEEP (a.k.a. we've entered the SLEEP
state within RPMh and the system needs to be woken up by PDC)

Konrad
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x41000044>;
> +				entry-latency-us = <2752>;
> +				exit-latency-us = <3048>;
> +				min-residency-us = <6118>;
> +			};
> +
> +			CLUSTER_SLEEP_CX_OFF: cluster-sleep-1 {
> +				compatible = "domain-idle-state";
> +				arm,psci-suspend-param = <0x41002344>;
> +				entry-latency-us = <3263>;
> +				exit-latency-us = <4562>;
> +				min-residency-us = <8467>;
> +			};
> +
> +			CLUSTER_SLEEP_APSS_OFF: cluster-sleep-2 {
>  				compatible = "domain-idle-state";
>  				arm,psci-suspend-param = <0x4100c344>;
>  				entry-latency-us = <3263>;
> @@ -632,7 +648,7 @@ CPU_PD7: power-domain-cpu7 {
>  
>  		CLUSTER_PD: power-domain-cpu-cluster0 {
>  			#power-domain-cells = <0>;
> -			domain-idle-states = <&CLUSTER_SLEEP_0>;
> +			domain-idle-states = <&CLUSTER_SLEEP_L3_PC &CLUSTER_SLEEP_CX_OFF &CLUSTER_SLEEP_APSS_OFF>;
>  		};
>  	};
>  
> 
