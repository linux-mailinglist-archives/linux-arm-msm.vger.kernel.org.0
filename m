Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7977162C62C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 18:19:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234309AbiKPRTg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 12:19:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233862AbiKPRT0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 12:19:26 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555FEC69
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 09:19:22 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id j16so30538420lfe.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 09:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UCpMqcRT8DeY5MXJCLiKIz5Im5PIOy+nnF0pses3NRo=;
        b=gPP/YC7RcqXib2XtCBKhb344QqRcr2tCekCF3H6g0DbHMXM4BhF+AYi7kbOqwzduc1
         3Nci/kOMGv5CP1o5EcR/uksu0p+DQ1m2pB/gPAPIJ41aKwBUyDOCxBpVgybBC/qaRQga
         T3RREKedJitX+tZgbKXiRYFLTT+UhTcWyWU/SmhiHj57cdAf7pxa5HNvQ4I2SYeFTVPe
         hwd9U5GXn3E2GS3Eakoa0GH8ZR3mS3C+DQkxZAzSXLcPeG/Pdzdn2nGBPyD2iT60PZDX
         NIB8D8lpfsyt/RpG+EaZvK2Nv0GLHktVnskYmOD64WMfMkltDs0AtnMchbWTlVb+L9sT
         fNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UCpMqcRT8DeY5MXJCLiKIz5Im5PIOy+nnF0pses3NRo=;
        b=0wBZWu6vtg3/lapedKFpATtS/zlM01/cAjdAsaW3f9kKMJwahi2sO8M4VnPu+QW2D4
         LFxD8VudyQ5zA+DixIeu03wcudb72LSey9uZMrXNmQLNG2gSqAWBEQzCm+OwwNqyW8Dm
         pqs882jTT1A/P6M9Nyl0CGxUGPAKIz364CTTSQ/JSD8AkAJ/TP4nA0gW7y/Fx5UITzWD
         hU4G5tnvfIayD9wJ7NgCmS1Dm7sYBHaGRmwP692IbhJW/Ke3JzTMNqZwP3+xCpJIBb/C
         Cskyh3KIlnQTL37TAHqOLQsqBG8bO8WKYDls2GIWVPPlkN8QdzyMkWIwcWU0HZNOfPup
         yieA==
X-Gm-Message-State: ANoB5pmZcM1vNPxU9/PVbezytPFQoJi8qy/sZldcJjjlax/4vj1bYxB9
        MwYHx2ncY/BE54wc7Iz9H/8sSg==
X-Google-Smtp-Source: AA0mqf61LBMQcDDOdERra618Gul2RXMcG5LraXEgHjg7sKKHhpXJP2KJpVLUcPqjo1eEivEm8tnoHw==
X-Received: by 2002:ac2:5093:0:b0:4b1:753b:e66f with SMTP id f19-20020ac25093000000b004b1753be66fmr8351806lfm.276.1668619160736;
        Wed, 16 Nov 2022 09:19:20 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id 11-20020ac24d4b000000b004a62ff61b3dsm2676326lfp.252.2022.11.16.09.19.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 09:19:20 -0800 (PST)
Message-ID: <891e51f0-af46-6150-ba4e-807f00cc8e63@linaro.org>
Date:   Wed, 16 Nov 2022 18:19:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/8] arm64: dts: qcom: sdm450: Add device tree for
 Motorola Moto G6
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Julian Braha <julianbraha@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kees Cook <keescook@chromium.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20221116145616.17884-1-luca@z3ntu.xyz>
 <20221116145616.17884-3-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116145616.17884-3-luca@z3ntu.xyz>
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

On 16/11/2022 15:56, Luca Weiss wrote:
> From: Julian Braha <julianbraha@gmail.com>
> 
> Add device tree for the Motorola Moto G6 (ali) smartphone. This device
> is based on Snapdragon 450 (sdm450) SoC which is a variant of MSM8953.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Missing SoB.

Please run scripts/checkpatch.pl and fix reported warnings.

> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sdm450-motorola-ali.dts     | 256 ++++++++++++++++++
>  2 files changed, 257 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index d7669a7cee9f..a0b537414593 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -115,6 +115,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-crd-r3.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc8280xp-lenovo-thinkpad-x13s.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sda660-inforce-ifc6560.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm450-motorola-ali.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-discovery.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-pioneer.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dts b/arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dts
> new file mode 100644
> index 000000000000..62874306fc24
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm450-motorola-ali.dts
> @@ -0,0 +1,256 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + */
> +/dts-v1/;
> +
> +#include "msm8953.dtsi"
> +#include "pm8953.dtsi"
> +#include "pmi8950.dtsi"
> +
> +/ {
> +	model = "Motorola Moto G6";
> +	compatible = "motorola,ali", "qcom,sdm450";
> +	chassis-type = "handset";
> +	qcom,msm-id = <338 0>;
> +	qcom,board-id = <0x41 0xb1a0>,
> +			<0x42 0xb1a0>,
> +			<0x43 0xc100>,
> +			<0x42 0xb1b0>,
> +			<0x43 0xc200>,
> +			<0x44 0xc200>,
> +			<0x42 0xb200>,
> +			<0x43 0xb200>;

Both properties are not allowed, unless exception list is extended.

Does not look like you tested the DTS against bindings. Please run `make
dtbs_check` (see Documentation/devicetree/bindings/writing-schema.rst
for instructions).


Best regards,
Krzysztof

