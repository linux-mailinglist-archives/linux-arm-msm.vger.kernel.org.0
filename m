Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4CD6678CA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 16:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbjALPOz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 10:14:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240377AbjALPO3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 10:14:29 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71E1013D02
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 07:05:36 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id bu8so28823273lfb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 07:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ce8e6uAIYz9/yY+98dJr0tyTfoox86Wc3JoX8coQC58=;
        b=DVJT4D9qXFoXPn4wEqR5b7cLI0ai7rGNM0bp7VtLV3XdY90zP7Yd38xeSqSeRBtHaO
         NDInig4if90f0mepCe46FT9WnaL0ffKdLeOmXIsWJstdfbGuX/i1RCLApR1Fr589IN4f
         hixTy8m+mAggHQA3bdnzIroLRWmhIgCbTutBKjB6iFK2O45L/hLuLliay8bS9TrIO8Mn
         +F0jV0h7xb0pIhflzMfDbLnpX/kd7XZ8wCMzR/S2sAgvKkRm23J09tfplva3aCDWgfx8
         9BkBPjGNvwvUKLMACBR22p2FjGlduuoSV+/b7Osp/PpCJfE3AbUcIRiPEPiqZLsS8yTz
         OnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ce8e6uAIYz9/yY+98dJr0tyTfoox86Wc3JoX8coQC58=;
        b=C9D+c/eE94SJH/YpWCTlfQa1KSngqHTwHqWPKaykB0bOM+xO05Zgyot/2N3/zzvSZ0
         oQBhZb4YJLD9izxXox1pS//wTbHg4AO9XC2p2+gPEAVe+O2RISJaaeC79bTadKu2E49D
         26C9BxnT4A3pzjHKq9e13900TN93sSBUqtuCFNWHghPtTSicbMCIysP2rdKUta9YO0/f
         aN3lIcPKDyVnsrnQ1Ao8spzw7lpASlw0f6K7evJ51vowL5E0LHGvCWiCpzXVviNJo/pO
         9uN4mNDgXFX1CnQCafG3gLcS6TuZ+LNUCRMBlF/tTYfdZKsmJB/8zlDD4lw6A75Ds0Zs
         BPuw==
X-Gm-Message-State: AFqh2krZdPlXK24EBGa0tQNQu70kmNTbQlBWw2MrP5jCWQsH66j+1yDK
        /7NaVe9kC9YOI0b1IvWzZavU6g==
X-Google-Smtp-Source: AMrXdXvOgq3M2G6lFn7kZ0uUf8VrWP+01GzAWBGmDY9r/NaLIUonD/yN4sLrBRbV3Bo9o9RLKv8N2A==
X-Received: by 2002:a05:6512:33cb:b0:4b5:7096:23ff with SMTP id d11-20020a05651233cb00b004b5709623ffmr22644130lfg.66.1673535934753;
        Thu, 12 Jan 2023 07:05:34 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id o21-20020a05651205d500b004cc831acce1sm2290875lfo.285.2023.01.12.07.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 07:05:30 -0800 (PST)
Message-ID: <3cd04f83-94df-931c-728a-f015ad05d876@linaro.org>
Date:   Thu, 12 Jan 2023 16:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 4/5] arm64: dts: qcom: msm8996: add CBF device entry
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
 <20230111195754.2593134-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230111195754.2593134-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11.01.2023 20:57, Dmitry Baryshkov wrote:
> Add device tree node for the CBF clock.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 37ebd8a3b2c8..e5a638b85ffc 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3558,6 +3558,13 @@ saw3: syscon@9a10000 {
>  			reg = <0x09a10000 0x1000>;
>  		};
>  
> +		cbf: clock-controller@9a11000 {
> +			compatible = "qcom,msm8996-cbf";
> +			reg = <0x09a11000 0x10000>;
> +			clocks = <&rpmcc RPM_SMD_BB_CLK1>, <&apcs_glb>;
Shouldn't this be RPM_SMD_XO_A_CLK_SRC? I don't see BB_CLK
referenced *anywhere* downstream, other than being defined
in the 8996 GCC driver..

Konrad

> +			#clock-cells = <0>;
> +		};
> +
>  		intc: interrupt-controller@9bc0000 {
>  			compatible = "qcom,msm8996-gic-v3", "arm,gic-v3";
>  			#interrupt-cells = <3>;
