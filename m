Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6480C6FA25E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 May 2023 10:35:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbjEHIfA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 04:35:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233505AbjEHIez (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 04:34:55 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3668516082
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 01:34:50 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f14ec4efb0so2639999e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 01:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683534888; x=1686126888;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qCNtPr0JwlvjsNFu67DIeJ3GgI3iGTtI8/7LXS2wZYk=;
        b=V5vXNQ5GWe8KUpKdHN0fnMvcPOUhlsyB5PxpWSVkiOpt16uzeZWmHsLIN12yFm+5Yj
         9MIm4tjLtxmpIa4vJZCHhpYU1SAw5ILnU4tw6oxBcNLR2XsPXy0uXgo9NSn7wfJkk2Ow
         X5vCImpRhKUZIcCqGjd0x5b9YsU95zpjhUwMx4HBXc8a5Ok1EZ0H3PHD607cWVy/5nCs
         kJtCl665w2PDl0ZdqYszREFCTMlhJGrbowvUwU96KHkQxrlUh28MfaGvILi34MqpiXV1
         uEDDPugmFJknA7tZY1GLfcPBRYlxKbDA0uPrUt6kVEEjADNaL2gOs1gz54mM4Zu1s2Zl
         KvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683534888; x=1686126888;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCNtPr0JwlvjsNFu67DIeJ3GgI3iGTtI8/7LXS2wZYk=;
        b=IFUGQAjhPBgV6+Q9QPKoNb5UqO8nGDnpcd2v/uKGyONkKC07QpVaTXRBijy3Q/WNjE
         yVgKLKtKyVI+wqr1YhULPN/QXl+BMgM2b/te2dgaRLzZFjjsGt/338Ar//lsuHW8u61Q
         V/ijQ8tQdrhfFIRYtrJb7oceC0XGLaj59IfMsqFtMym+vKXOiGaBRj9LW4CdAMkfQNNF
         d+5s6InsXfkVE/BcqrKYOwjtfu872WkXzoJ81Fq/luUvr2vgcmgFmuOsEq5U2i0uPeEW
         CsOSJqEP48HEv1h146s5eqJo2o16FhNDEmr5sLcLLCWMhyWMxrdvWmIugiECtv7UDK+P
         L3Mw==
X-Gm-Message-State: AC+VfDxuZD1BinPfWZXYHhgvz/BRLfBBzQXub/23aX4S2+lG4jaN9ul7
        uDo77gcQv9REcGG1aypUNCiPXg==
X-Google-Smtp-Source: ACHHUZ6PIEja33Tsnyi1eGOgotXjqEbCn17WNyUoqoCXNnTL2k/aocmrdgrbsEBA9RKenXcbUU4CAA==
X-Received: by 2002:ac2:4d1a:0:b0:4ec:363a:5f24 with SMTP id r26-20020ac24d1a000000b004ec363a5f24mr2443926lfi.23.1683534888453;
        Mon, 08 May 2023 01:34:48 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id d2-20020a05651221c200b004eff66716a6sm1206330lft.113.2023.05.08.01.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 01:34:48 -0700 (PDT)
Message-ID: <ca09ce7d-b0c4-1544-0c9e-fab823aa79e6@linaro.org>
Date:   Mon, 8 May 2023 10:34:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 4/4] ARM: dts: qcom: apq8074-dragonboard: enable DSI panel
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
 <20230507190735.2333145-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230507190735.2333145-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 7.05.2023 21:07, Dmitry Baryshkov wrote:
> Enable MDSS, GPU and DSI panel output on the APQ8074 dragonboard.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../arm/boot/dts/qcom-apq8074-dragonboard.dts | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> index c893afc00eb4..72f7e09a5bbf 100644
> --- a/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
> @@ -48,6 +48,57 @@ eeprom: eeprom@52 {
>  	};
>  };
>  
> +&dsi0 {
old junk could use some mdss_ prefixing to keep the nodes together

Could you please take care of that?

> +	vdda-supply = <&pm8941_l2>;
> +	vdd-supply = <&pm8941_l22>;
> +	vddio-supply = <&pm8941_l12>;
> +
> +	status = "okay";
> +
> +	panel: panel@0 {
> +		compatible = "sharp,ls043t1le01-qhd";
> +		reg = <0>;
> +
> +		avdd-supply = <&pm8941_l22>;
> +		backlight = <&pm8941_wled>;
> +		reset-gpios = <&pm8941_gpios 19 GPIO_ACTIVE_HIGH>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&dsi0_out {
> +	remote-endpoint = <&panel_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&dsi0_phy {
> +	status = "okay";
> +
> +	vddio-supply = <&pm8941_l12>;
status last

Konrad
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&mdss {
> +	status = "okay";
> +};
> +
> +&pm8941_wled {
> +	qcom,cs-out;
> +	qcom,switching-freq = <3200>;
> +	qcom,ovp = <32>;
> +	qcom,num-strings = <1>;
> +
> +	status = "okay";
> +};
> +
>  &remoteproc_adsp {
>  	cx-supply = <&pm8841_s2>;
>  
