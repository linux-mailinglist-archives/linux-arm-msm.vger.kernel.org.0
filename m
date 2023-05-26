Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D4F3713050
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 May 2023 01:21:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbjEZXVN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 19:21:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjEZXVM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 19:21:12 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B8B13D
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 16:21:11 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f4bdcde899so1367952e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 16:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685143269; x=1687735269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKOmOc2R28x9jbWF3GaU1Dlf8eLENjPMOlwFlEqKvco=;
        b=WqzNVCXdqniaRb4nOG1XKXliewxlpy802r+/+ZYxB1nLiPfGlb3af/U52UnY8us4Ze
         6/BE1lZiuV1cE9IbV3BFPs6dRx0tmzx78fJeLHojLFK9ndcvQbjTirBBXR0UKO5EBUVq
         1tAOUs3uprey3L/MFVNsvk8ZEJPQxUZmQ/uFcLouez9uMwSiaKJ4CDRaKxH/D7Hcqx+/
         YaJSJCA0d3LiEtEdJYIJzQ33R0Ruy4YD6R2m1vK0n3CRe/v2+N45KtQi7lzgcVcsIwpv
         Avt2nBaoeTIILL7Tz5EL9jUGwnRYD4GbB9SMGSMai3/n2X7VParRRjCbAI0vv6Ms6Fwp
         iB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685143269; x=1687735269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKOmOc2R28x9jbWF3GaU1Dlf8eLENjPMOlwFlEqKvco=;
        b=Ku019nenYFB1BespDQiVhNaL85/A5cUlJz0laxBpTDYzQ9D9YJiReIdkVQ3d+JVFTS
         RhHL3phvsof7giZQ+xTw/YMeiRiCi4rkvDabbdJl8oayP+zobbUzULzFPk9Iarytl3na
         YUQgh1yoI0OvWZt3bSxZKyHsdCFCwdR3IyzEC4ZGE71ftJ9RE0IyDaYyu6sMWYVSPEi+
         MQ26Ji/N9VcKaTMVD0jMB+Qj51SGJMdc0DdHBWhZt0E51dUkYmzRUHuFSarubBKNWtxm
         3qfWLWJZqv2k4j/V+Xv3qEw/2txIetKRVPy00fvh0w/HC1lNvrWXZha/YbKbspcCZDm6
         V7/g==
X-Gm-Message-State: AC+VfDzxn3zaCbptCH9NIBqY8wZndXLHHS1+1gdCEpzH/5CEjoE7eEIZ
        nTSK+cOPlTCQ1Qxh2hHtVxDacg==
X-Google-Smtp-Source: ACHHUZ4TFQ1k0p9lP+MHItepKoHIbFmD0WLxOz7Gw88sDOMnT6qt70yFxbamOjaO3FjOzNiiRM6tHQ==
X-Received: by 2002:ac2:5dc1:0:b0:4f3:9930:5b8c with SMTP id x1-20020ac25dc1000000b004f399305b8cmr891437lfq.25.1685143269417;
        Fri, 26 May 2023 16:21:09 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id v13-20020a19740d000000b004f38267a2f9sm829817lfe.161.2023.05.26.16.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 16:21:08 -0700 (PDT)
Message-ID: <11774eef-6111-4b73-1dc7-596c9808d545@linaro.org>
Date:   Sat, 27 May 2023 01:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] arm64: dts: qcom: pmk8350: disable ADC by default
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230525083431.118929-1-dmitry.baryshkov@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230525083431.118929-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 25.05.2023 10:34, Dmitry Baryshkov wrote:
> There is no reason to keep the vADC enabled by default. Turn it off by
> default and only reenable on the platforms which have some channels
> configured.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Are there any drawbacks if we keep it enabled? IMO it doesn't make
sense to disable something that's on the chip just because it's unused.
It only prolongs booting by a few miliseconds and keeps a few kBs of RAM
busy, but doesn't otherwise impact anything negatively.

Konrad
>  arch/arm64/boot/dts/qcom/pmk8350.dtsi             | 1 +
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts           | 2 ++
>  arch/arm64/boot/dts/qcom/sc7280-idp.dtsi          | 2 ++
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi        | 2 ++
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 2 ++
>  5 files changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pmk8350.dtsi b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> index bc6297e7253e..df3e916e0171 100644
> --- a/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pmk8350.dtsi
> @@ -56,6 +56,7 @@ pmk8350_vadc: adc@3100 {
>  			#size-cells = <0>;
>  			interrupts = <PMK8350_SID 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
>  			#io-channel-cells = <1>;
> +			status = "disabled";
>  		};
>  
>  		pmk8350_adc_tm: adc-tm@3400 {
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 15222e92e3f5..bfeeaf36546f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -73,6 +73,8 @@ &nvme_3v3_regulator {
>  };
>  
>  &pmk8350_vadc {
> +	status = "okay";
> +
>  	pmr735a-die-temp@403 {
>  		reg = <PMR735A_ADC7_DIE_TEMP>;
>  		label = "pmr735a_die_temp";
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> index 21027042cf13..7c889ddf2881 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
> @@ -432,6 +432,8 @@ &pcie1_phy {
>  };
>  
>  &pmk8350_vadc {
> +	status = "okay";
> +
>  	pmk8350-die-temp@3 {
>  		reg = <PMK8350_ADC7_DIE_TEMP>;
>  		label = "pmk8350_die_temp";
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
> index 9137db066d9e..2bae0d0ccfdd 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
> @@ -383,6 +383,8 @@ &pm8350c_pwm {
>  };
>  
>  &pmk8350_vadc {
> +	status = "okay";
> +
>  	pmk8350-die-temp@3 {
>  		reg = <PMK8350_ADC7_DIE_TEMP>;
>  		label = "pmk8350_die_temp";
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 7ae6aba5d2ec..0f21bea683b7 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -515,6 +515,8 @@ &pmk8350_rtc {
>  };
>  
>  &pmk8350_vadc {
> +	status = "okay";
> +
>  	adc-chan@644 {
>  		reg = <PMK8350_ADC7_AMUX_THM1_100K_PU>;
>  		qcom,ratiometric;
