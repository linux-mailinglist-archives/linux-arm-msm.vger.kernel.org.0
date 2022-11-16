Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AF9562C33D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 16:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233533AbiKPP6v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 10:58:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233545AbiKPP6m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 10:58:42 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46A2F45ECE
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 07:58:41 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id f18so12154526ejz.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 07:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvR9qyF4gZCtzNgt0qKM2oVrk7ELAHTSuXb2yBbnKI8=;
        b=qB457YNfcM5JjLB01g9uA+h+e0flPqc8L7b6O/9vOYLa8uAQznrqifoQcBIXldHom9
         cQxdBJLsmiCe9U29/REnhO/QQ7cfiXu34NiNLxg4fMfXq85Ts4g83SRAy3ijBRX8LS2g
         MB8Fk4qD6YGeO7MYmAvUabGbQmtPkMXxLnSk1KvbbwZhraCW2THAlrhAQ7hPk2Oad7He
         IsNocM+eEEQpnfZ37AMySdSqsG5cNaLrbWeFFjoVDijkJ+7gOSxyrPq1tLZ7W2PhIYrB
         7xAO+IJYAR2Ev8AHncYT2iwX+H2Z6ZHMTwI9/BbCAMe3m5Tp14RPAuejXeV9CnPYZmIp
         kgHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kvR9qyF4gZCtzNgt0qKM2oVrk7ELAHTSuXb2yBbnKI8=;
        b=2E8HNsO9S/SiFp3vyhEMBW5ulWc1LYYbYFIbILkhKUx7SRyc6iEsa0aYqweWbt2sE8
         2XGjOxO8Lm819UIVuOKbIrSKlK0ok/ogdHasAd+yknXMDMtte+hJM9weVd1bP65RSJ9A
         6/n7VvqqI20qWxu2eVHbpET4OaoaIQ6QDLl0WGCxYWPVC55Rbd5jznOi71i9lQugbWEc
         O92Wdp58sP/DdcneCh0qO+wzq0pBU1lBP7o31dLfHYpvnZ2HQcV6HhUIQew6oxAEVFvS
         Zg53S1V7wkuZi33lbBF6Pha5cph77RwWwh+UVNytMEU3Ca5EETAfl/+GTECOBOnP8phN
         rE2Q==
X-Gm-Message-State: ANoB5pktoGKXFVI6+2PvH1j/3jk0peQCsWCRxl4IHC34SlaEMjd7vtHi
        3YOJyt1D4GK+XuYXSmjuonV2Zn0nDP0UjD1F
X-Google-Smtp-Source: AA0mqf5QpRB6TfDK1AJI+uWwE3mcGlMQ6J3AGrP1FI/i7FchqaEgd2Lyl8XNbSEViI5dpgzF2a0QfQ==
X-Received: by 2002:a17:906:c1c6:b0:7ad:7e81:1409 with SMTP id bw6-20020a170906c1c600b007ad7e811409mr18420311ejb.326.1668614319910;
        Wed, 16 Nov 2022 07:58:39 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id u1-20020a1709061da100b0078e0973d1f5sm7044180ejh.0.2022.11.16.07.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 07:58:39 -0800 (PST)
Message-ID: <92993d1d-e7b0-199c-5652-5158988a65b9@linaro.org>
Date:   Wed, 16 Nov 2022 16:58:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: use defines for RPMh power
 domains
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221116154935.163810-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221116154935.163810-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 16/11/2022 16:49, Krzysztof Kozlowski wrote:
> Use defines for RPMh power domains instead of hard-coding numbers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
I sent exactly the same patch yesterday.

https://lore.kernel.org/linux-arm-msm/ef2057cb-8de8-4d65-2749-cfc205833eb4@linaro.org/T/#m4196988be896c461131ee11df51dcdd5b9cdcdc2

Konrad
>   arch/arm64/boot/dts/qcom/sm8150.dtsi | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> index d1b64280ab0b..136fa5360e8e 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> @@ -2074,8 +2074,8 @@ remoteproc_slpi: remoteproc@2400000 {
>   			clocks = <&rpmhcc RPMH_CXO_CLK>;
>   			clock-names = "xo";
>   
> -			power-domains = <&rpmhpd 3>,
> -					<&rpmhpd 2>;
> +			power-domains = <&rpmhpd SM8150_LCX>,
> +					<&rpmhpd SM8150_LMX>;
>   			power-domain-names = "lcx", "lmx";
>   
>   			memory-region = <&slpi_mem>;
> @@ -2619,8 +2619,8 @@ remoteproc_mpss: remoteproc@4080000 {
>   			clocks = <&rpmhcc RPMH_CXO_CLK>;
>   			clock-names = "xo";
>   
> -			power-domains = <&rpmhpd 7>,
> -					<&rpmhpd 0>;
> +			power-domains = <&rpmhpd SM8150_CX>,
> +					<&rpmhpd SM8150_MSS>;
>   			power-domain-names = "cx", "mss";
>   
>   			memory-region = <&mpss_mem>;
> @@ -3246,7 +3246,7 @@ remoteproc_cdsp: remoteproc@8300000 {
>   			clocks = <&rpmhcc RPMH_CXO_CLK>;
>   			clock-names = "xo";
>   
> -			power-domains = <&rpmhpd 7>;
> +			power-domains = <&rpmhpd SM8150_CX>;
>   
>   			memory-region = <&cdsp_mem>;
>   
> @@ -3747,7 +3747,7 @@ remoteproc_adsp: remoteproc@17300000 {
>   			clocks = <&rpmhcc RPMH_CXO_CLK>;
>   			clock-names = "xo";
>   
> -			power-domains = <&rpmhpd 7>;
> +			power-domains = <&rpmhpd SM8150_CX>;
>   
>   			memory-region = <&adsp_mem>;
>   
