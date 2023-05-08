Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B39DE6FA257
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 10:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233321AbjEHIeH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 04:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233108AbjEHIeA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 04:34:00 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45258100C5
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 01:33:56 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2ac88d9edf3so35305101fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 01:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683534834; x=1686126834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sei4kkacSe2Rc6TEFuohNjVg3onpFrfpG9vWPIGkJOI=;
        b=Tsg91dPapRAhkbJdo4EKlUXb+aG6cSpUmRIuto7NVEOE+E8NgTHUyeh1C8l4dx/2zZ
         slF16EhLXXwJlHjXkrhFeLefEP3SdtYyPlN16IXedZidVL7sMTIXFWza8CIKq36iqxl+
         Fgfmb8fDGYZ3BGnKN//BJQY154FwXJKkInb1MkE97cX3w/7mwBZNQYtoAt3vXXCEi1cJ
         +LjfQT3blPrYdNF+AyVpn5gPEtthpRfTZUNPeiuKfr65n5M13M6NzEF5iTIDterBS8sN
         mYD+nWvI4+HQKGiP+NpJRegJRP7Rg7kwip9D0hKFyKvf14EqKMceB7Yw7QcZkx/qji81
         RvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683534834; x=1686126834;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sei4kkacSe2Rc6TEFuohNjVg3onpFrfpG9vWPIGkJOI=;
        b=MJ60hjA9yUCgwqt5YIq1CVv4lWFh7XJdRp6euRXwWiuLx6g8GPEUuZTtTCKKToslZv
         nm7TLtE0BsT197RUJYFxuMKkqGth3N9mLm55ifKvGoBz8TNfTK+62nuWKxh5w7E4Pc6J
         fN6mp7xj9cTOC7gQr1FD8kCCFTD7cUbDZwIP3HUG0NrYTqv3epsui6yErOFHSqOs19cA
         mxXwwsv5KErr869mDkdgL8dHy4K3txGy99TBNpdU2DcYNgTEbQPLMAUOTTCUhWDu25aE
         MYpYdDe5ADTpHFEIv9B0MW5F/OCl5AUWo1Kin0avIrgZcvIulUqPH3fR/v/9DT3/FQBN
         e8ug==
X-Gm-Message-State: AC+VfDw9PjbVeL6mp9wxjGKkv+VZ89T/rQqABrng57woKuGNiyz3mWlL
        Zfrm9aIqftiIg76NSalZ90A/qg==
X-Google-Smtp-Source: ACHHUZ5fB6p7WcGuhwnEYvzUsFmPc/aI7wgWQc1vVPb8MSPWLZSyGGmC3ar1Jn9zqOA20TxJWnGJag==
X-Received: by 2002:a2e:8047:0:b0:2a8:e4d3:11ca with SMTP id p7-20020a2e8047000000b002a8e4d311camr2800260ljg.38.1683534834528;
        Mon, 08 May 2023 01:33:54 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id z22-20020a2e3516000000b002a77792f2c5sm1077417ljz.62.2023.05.08.01.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 01:33:54 -0700 (PDT)
Message-ID: <a86cfa8b-c205-6887-a64e-d51241b74b15@linaro.org>
Date:   Mon, 8 May 2023 10:33:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 3/4] ARM: dts: qcom: apq8074-dragonboard: enable adsp and
 MSS
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230507190735.2333145-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.05.2023 21:07, Dmitry Baryshkov wrote:
> Enable ADSP and Modem DSPs on APQ8074 dragonboard. The MSS region
> differs from the one defined in the msm8974, so it overriden locally.
> 
> The modem is specified use mba.mbn instead of mbn.b00 (for the sake of
> similarity with other platforms). This requires a patch for remoteproc
> to be applied [1].
> 
> [1] https://lore.kernel.org/all/20230507172041.2320279-1-dmitry.baryshkov@linaro.org/
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> index 6b047c679370..c893afc00eb4 100644
> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> @@ -4,6 +4,8 @@
>  #include "qcom-pm8841.dtsi"
>  #include "qcom-pm8941.dtsi"
>  
> +/delete-node/ &mpss_region;
> +
>  / {
>  	model = "Qualcomm APQ8074 Dragonboard";
>  	compatible = "qcom,apq8074-dragonboard", "qcom,apq8074";
> @@ -17,6 +19,13 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	reserved-memory {
> +		mpss_region: mpss@ac00000 {
> +			reg = <0x0ac00000 0x2500000>;
> +			no-map;
> +		};
> +	};
>  };
>  
>  &blsp1_uart2 {
> @@ -39,6 +48,25 @@ eeprom: eeprom@52 {
>  	};
>  };
>  
> +&remoteproc_adsp {
> +	cx-supply = <&pm8841_s2>;
> +
> +	firmware-name = "qcom/apq8074/adsp.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_mss {
> +	cx-supply = <&pm8841_s2>;
> +	mss-supply = <&pm8841_s3>;
> +	mx-supply = <&pm8841_s1>;
> +	pll-supply = <&pm8941_l12>;
High time to move this to rpmpd!
I won't object to adding this though, as it obviously works
and is already used on other boards..

> +
> +	firmware-name = "qcom/apq8074/mba.mbn", "qcom/apq8074/modem.mbn";
Could you please keep it one entry per line?

Otherwise,

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +
> +	status = "okay";
> +};
> +
>  &rpm_requests {
>  	regulators-0 {
>  		compatible = "qcom,rpm-pm8841-regulators";
