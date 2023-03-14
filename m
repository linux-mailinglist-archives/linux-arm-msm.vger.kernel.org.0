Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A63136BA0B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 21:26:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbjCNU0Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 16:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbjCNU0I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 16:26:08 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3B4252AA
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 13:26:06 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id b13so17288296ljf.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 13:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678825564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3jEItlV5iXWA0GnHqouwSpVBm8wuE8eAxwwrrBGKEtc=;
        b=tNEPrEhTi3WeKOmBLZUtlqYfi5ptWykXuDeAneb0tQriZPiJgATqD1HIQ9bRHYCagE
         JF4oo66aFcNnzRqP2H5LgPFFUwF9uLPtqVHog8zBINSmJQH+plNcK+c/8RWjlUan8JN5
         0JYWoOOE28rw9SAvGG4DGovl+IBoRJW64cm/2p4wVFTVkew6iTXuni3ly6hTVeY5yVrU
         5PlFEPuIKD99cF6mYqiwwG+hnrVr0FhKh4wp46oLelnsN8YcztNBzrm56sCZIhOUUZKD
         Nr4QZiGueGAXokY34LOu5gBaZkKuBBT1qDfePQs7ASKZCQuSM9+CHF/fBNJAcjQmYWiS
         rpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678825564;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jEItlV5iXWA0GnHqouwSpVBm8wuE8eAxwwrrBGKEtc=;
        b=c/e7GH2lchv84jUIoJrEHZG83ARM7E516tPvz9Wr6yVPL06UWb0EXrijWsfDf6qZzL
         3Y7/myg2QhVY8I8HQ++F3apajAkytDWsuvWViWirRn3Q3bjpudfxheFROZ0WxyCPfuzU
         hshRUqPg7nuJfyGpMDIWwLLSAAFTr624QcPcZF6FraV4p/CgmO6+itz60NVlwrNaNeEo
         9DtC8XehjT1+zXsksWFIDbJHVB+9RhffjbHrtl2jpB90dkPs8KUqxDPKXFUfE94j8A2a
         0kjqUBp1vdc08kU2J8/ryo0rQlVMezRY0QiRl+UaMKaD4ncYZtou1ZC0P6JBhr7QY6tc
         t/FQ==
X-Gm-Message-State: AO0yUKXmY8qan0LY/28Vh1663/ih7U3QVMvNAuguFrCJUJLtjXstAU1n
        MR1BBm5n3edTW+f4QYXON5TpZA==
X-Google-Smtp-Source: AK7set/evljpjq2rWMGanL8TQHF+46kSn/1In9xJsxZ8znL4dWyCVlB276Ji53q+v+kG9Jmkhp9cog==
X-Received: by 2002:a05:651c:505:b0:295:b0ed:ee8 with SMTP id o5-20020a05651c050500b00295b0ed0ee8mr131219ljp.46.1678825564472;
        Tue, 14 Mar 2023 13:26:04 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id x26-20020a19f61a000000b004d988f59633sm523752lfe.161.2023.03.14.13.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 13:26:03 -0700 (PDT)
Message-ID: <8ed14d64-f75b-b129-ad7b-0d3290de7738@linaro.org>
Date:   Tue, 14 Mar 2023 21:26:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 08/14] arm64: dts: qcom: sa8775p: pmic: add the power key
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230314183043.619997-1-brgl@bgdev.pl>
 <20230314183043.619997-9-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230314183043.619997-9-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14.03.2023 19:30, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the power key node under the PON node for PMIC #0 on sa8775p.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> index 5d73212fbd16..874460d087db 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> @@ -18,6 +18,13 @@ pmk8775_0_pon: pon@1200 {
>  			reg = <0x1200>, <0x800>;
>  			mode-recovery = <0x1>;
>  			mode-bootloader = <0x2>;
> +
> +			pmk8775_0_pon_pwrkey: pwrkey {
> +				compatible = "qcom,pmk8350-pwrkey";
> +				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
> +				linux,code = <KEY_POWER>;
> +				status = "disabled";
Does it make any sense to disable the power button?

Konrad
> +			};
>  		};
>  	};
>  
