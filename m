Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ACBEA6C1DF2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 18:30:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232434AbjCTRaV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 13:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233548AbjCTR3q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 13:29:46 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92F7E149BD
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 10:25:42 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id by8so11742676ljb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 10:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679333134;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lRPtkA2WQOZio1au0NQwihV1EUPBJrnyOUlQ0xD+JHs=;
        b=FzNBO+NLcMXSBJLJm4EXDNPWcH4Ff45vzMCCHpEH8R42sHJzXQ1a51DQd0tg+xfWaE
         ry4OJyIjF0mC1wfKS4BDm3LY63JMUaXlr/fzUsLDWh7vzo9l+x1D+SivVjga3Nu+coHA
         bGpCg2eYS39CBVebjueeScrBdgMJhHs3pit4bj5IMLxt1CUKYKhzzdnwC9wxAoibKklQ
         xI8XeXiDrqnCTMLv1CtDcyRfF6dP9+EqpC3EuzpcQMIwv7rjHGPLtepMTNELH/5ITkXv
         Evj+9CRz8uJOLf1n8mHRiOtgCYhbBKrCYw9r2rKNLtXCbF3CDWyfgUAWcycP+g3nJwYq
         FoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679333134;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lRPtkA2WQOZio1au0NQwihV1EUPBJrnyOUlQ0xD+JHs=;
        b=4tGQPi4kOd/WLJArftJbWqaJ/UWBL0QFIM5CG8B96vl20jB1PGqvUNVLrpC37N/nrk
         o5Yy6SAolVZe0THSy3wi0tpfNTQhosJRB6D6Iyy8gOlIN1Xgkay8G5PVLFh73o7YmP4Y
         Td6OtJUTBvtfq66UwW34wmJAfVWypoxTLa2FwndRhKwSXmYo8ch4DUVjHSgWWOK7vLJa
         JliHWW4vHkCfuZOMPUhxU3mYl8KiVU4ezv4ZHxbo/Kk91103FuIlRRLDBAAF1b5ZkNZD
         xKZ7W6o4Jk0fAJEgSVgIFii9+Q00/g9wVP2jRc9yp03cKVu0GPQvIEINqfwcEriQF0NT
         V43w==
X-Gm-Message-State: AO0yUKVSyeN0H0phXjdXQEpJcOX1Iy+RhOIbse/2B3G5obrOdQQ23HRo
        fTczTcjx8RdtpKsAerdv7+gbAg==
X-Google-Smtp-Source: AK7set+nXt4fzDu2co/YgNebPhTHWNsHjuocFkcj3LFX/d+3i0aznxYoHsYJqv3UANpHA/hddduGZQ==
X-Received: by 2002:a2e:a889:0:b0:295:9517:b98f with SMTP id m9-20020a2ea889000000b002959517b98fmr174548ljq.15.1679333133928;
        Mon, 20 Mar 2023 10:25:33 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id y3-20020a2e9d43000000b0029347612e94sm1821265ljj.123.2023.03.20.10.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 10:25:33 -0700 (PDT)
Message-ID: <a0056d1b-0bdc-2312-d7c2-6a186bff6f52@linaro.org>
Date:   Mon, 20 Mar 2023 18:25:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 10/15] arm64: dts: qcom: sa8775p: pmic: add the power
 key
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230320154841.327908-1-brgl@bgdev.pl>
 <20230320154841.327908-11-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230320154841.327908-11-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.03.2023 16:48, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Add the power key node under the PON node for PMIC #0 on sa8775p.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> index dbc596e32253..f421d4d64c8e 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> @@ -19,6 +19,13 @@ pmm8654au_0_pon: pon@1200 {
>  			reg-names = "hlos", "pbs";
>  			mode-recovery = <0x1>;
>  			mode-bootloader = <0x2>;
> +
> +			pmm8654au_0_pon_pwrkey: pwrkey {
> +				compatible = "qcom,pmk8350-pwrkey";
> +				interrupts-extended = <&spmi_bus 0x0 0x12 0x7 IRQ_TYPE_EDGE_BOTH>;
> +				linux,code = <KEY_POWER>;
> +				debounce = <15625>;
> +			};
>  		};
>  	};
>  
