Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDE2664B26D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 10:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbiLMJeh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 04:34:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234695AbiLMJeb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 04:34:31 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51A9DC743
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 01:34:30 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id x28so3957512lfn.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 01:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1znzfLM2fpZoyXEAxi0AvEM2dIkGyoBW60l3XjJaSEA=;
        b=n9Cl9+JmQIkVm+iAzNrWOe3bgqua8o0vIQB6hk45kfSkMBf9C6Jcx8KD9wpeIDV//3
         aIC95rDxMZuR4m4ZEl9tRD0vaOh/85jlqLP0VdhgMJXiBLCPukS8I13DPhCDOn0jBQ4b
         5EvUC21QQaJSsIRvI2BiUuFMJxYczxQx7K09XXERqT9NtB8K1EaTxFBuAzVGdfxNv7u6
         mUKfJOZ+pyAsQr7k+M0HQvR4NrIeJVo498h/WMVUaw1ENf8fiq1wpp5olQP/qNN6Mszn
         coCQ2OOofCWmdjVvP+wmYN3/fCH7PClRJhSs2Adg84xRLVjGsPkwn1orYqmc/geuXm2v
         E9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1znzfLM2fpZoyXEAxi0AvEM2dIkGyoBW60l3XjJaSEA=;
        b=x0P67AkgV+cEMFmempXHHtd2zmVUatiuyXIVon3bj1IdQhC0JA8n3SaolA/QzwSUp2
         H1TUs9xt++mPlb+0sg1Rfk2mDoPNJXbDzZ5Gj2UG/x4VUV+0admnoNudYgsLkEAZX0Y/
         qDQV0UASSjtf0VbWig42aZFo+Rq681GWKgma+kxH8t/D0dLX+m50y/tmPgvHQXHJXi0Z
         crHokBWxwGrFpJd9pL/AbGa6RMM2hJtGhm9tIbLU0/tg8ZM/+9sOoawIu5fiVsj1vPqd
         nSkYtfmDC4IlfFq7QPyWg0V+do4HSMciNau7Yu1CVYY/yZMnkQ2snjvd2iwIB7E6wnMc
         LkOQ==
X-Gm-Message-State: ANoB5pkC4/Qka1KAB3TR1z3Xv4pdkrbB1pPzei5xneDdKG+wJl+4RX4Z
        TuNunXAiwzHrOeQM3C9AIuy4JA==
X-Google-Smtp-Source: AA0mqf7ak8qR2rqconS9W/OXJB3uvpQ0+sM8ZGEcE6eznSHGq3yTTJIEhPNyBoU2b7R5M/9ZY/X5/A==
X-Received: by 2002:a05:6512:340c:b0:4b6:e22f:51a6 with SMTP id i12-20020a056512340c00b004b6e22f51a6mr2992726lfr.53.1670924068615;
        Tue, 13 Dec 2022 01:34:28 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id s7-20020a197707000000b0049fbf5facf4sm289782lfc.75.2022.12.13.01.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Dec 2022 01:34:28 -0800 (PST)
Message-ID: <804c3ece-7744-4184-9a64-c93d3c35d5b1@linaro.org>
Date:   Tue, 13 Dec 2022 10:34:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 10/12] ARM: dts: qcom: mdm9615: drop second clock
 frequency from timer
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221212163532.142533-1-krzysztof.kozlowski@linaro.org>
 <20221212163532.142533-10-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221212163532.142533-10-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
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



On 12.12.2022 17:35, Krzysztof Kozlowski wrote:
> Keep only one clock frequency for timer, because:
> 1. DT schema does not allow multiple frequencies in such property,
> 2. The Linux timer driver reads only first frequency.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-mdm9615.dtsi | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> index b0fe1d95d88f..a6331e5ebe09 100644
> --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
> @@ -84,8 +84,7 @@ timer@200a000 {
>  				     <GIC_PPI 2 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_EDGE_RISING)>,
>  				     <GIC_PPI 3 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_EDGE_RISING)>;
>  			reg = <0x0200a000 0x100>;
> -			clock-frequency = <27000000>,
> -					  <32768>;
> +			clock-frequency = <27000000>;
>  			cpu-offset = <0x80000>;
>  		};
>  
