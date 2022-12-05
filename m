Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E54AE642C1D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Dec 2022 16:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbiLEPmQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Dec 2022 10:42:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233114AbiLEPmM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Dec 2022 10:42:12 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA8FC324
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Dec 2022 07:42:10 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id a19so14028740ljk.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Dec 2022 07:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/TZQ/0zpx/j06MJim410qkeF/d2Q1Gh1lZXRpTFgdTE=;
        b=h8toFZhjhBtsFxjfPPLQdJCQIu6a04PHORQN+ppqGbZ8cLbolNzMINANXlw0VPLw0m
         Cv/JbQ3WGGgY2yUpbi9Q/VNL6OCN0Pqw05zNDe+HHn66F4gOooJQUishWya2KuC+7n2X
         +a05LYzYnr5eMeyxzDCSrWV+FY73QTFlkcbyet7K+tH9fR/PdAnmBajTgrK7dohp8ztP
         FZpcphS3n4castnrRiLEfdt/OfzQNoNJkLCVWtr1ga4P67Jef4RNXcBJ27H+tpvGFC7p
         QnGO3Oxmr7vUjv14VR7SKiZVzZokITOguUHIqsbJHLci1FQAUsHS2DPePAck2OEGUnXH
         55Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TZQ/0zpx/j06MJim410qkeF/d2Q1Gh1lZXRpTFgdTE=;
        b=26CXTqiPksgSKTIcjd6j4K4YhnGF9ds6yP2tPfUY3+sAq6EcgnRFC6GjrcaYga2zm1
         MbzW3wRIG03lsWOryqgD8W+FZFbMLB3HkGGl/0KfWE5KWT1iDjqX2UUQ0TB3INPLcxGn
         ClwsfHkDT9GplMUxpOnh5hlmOAIkKcgI1WQm1TMg4AUMxAupGF5maEOcac8CMjqdwzw4
         8DVG3TFEuLPi0ZV2fPdoBbvTWbRtKGYfA2njfu9pXa8mfXJojJlVtNL8FAuhNDivrXII
         hwOq2gMn0krg1Q8m5jvrWHSB49Od3q3Pq3EytLO5k5y9z7WsTneVJRbhb+mhPH1zy5xY
         Kb+g==
X-Gm-Message-State: ANoB5pl0BZvk7ZqkOJoCIkslCZVdNKLqTynr2H633SmrsUjkS+D70X/J
        03gfdKBtHX0WDeqq8IYP37orlw==
X-Google-Smtp-Source: AA0mqf6KcVNSOMb6YgXi8fU/AWTRWz5x/ZjvdsN8KIsX3BgfrtfY9oSBDJEJcHyD7B/1FUhKOMWLzg==
X-Received: by 2002:a2e:a58b:0:b0:277:278:de24 with SMTP id m11-20020a2ea58b000000b002770278de24mr18956576ljp.388.1670254929275;
        Mon, 05 Dec 2022 07:42:09 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id d23-20020ac244d7000000b004b5748fa3afsm476899lfm.107.2022.12.05.07.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 07:42:08 -0800 (PST)
Message-ID: <c9ea96f9-a212-b693-12f2-b28a545b93e8@linaro.org>
Date:   Mon, 5 Dec 2022 16:42:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 4/5] arm64: dts: qcom: sm8450-hdk: Add LT9611uxc HDMI
 bridge
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
References: <20221123210720.3593671-1-dmitry.baryshkov@linaro.org>
 <20221123210720.3593671-5-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221123210720.3593671-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/11/2022 22:07, Dmitry Baryshkov wrote:
> From: Vinod Koul <vkoul@kernel.org>
> 
> Add the LT9611uxc DSI-HDMI bridge and supplies
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 59 +++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 

(...)

>  	vph_pwr: vph-pwr-regulator {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vph_pwr";
> @@ -353,6 +375,27 @@ &dispcc {
>  	status = "okay";
>  };
>  
> +&i2c9 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	lt9611_codec: hdmi-bridge@2b {
> +		compatible = "lontium,lt9611uxc";
> +		reg = <0x2b>;
> +
> +		interrupts-extended = <&tlmm 44 IRQ_TYPE_EDGE_FALLING>;
> +
> +		reset-gpios = <&tlmm 107 GPIO_ACTIVE_HIGH>;
> +
> +		vdd-supply = <&lt9611_1v2>;
> +		vcc-supply = <&lt9611_3v3>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
> +

Drop blank line.

> +	};
> +};
Best regards,
Krzysztof

