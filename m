Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 196E97B4F35
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Oct 2023 11:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236095AbjJBJlo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Oct 2023 05:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236153AbjJBJlm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Oct 2023 05:41:42 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 794A59E
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Oct 2023 02:41:39 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50307acd445so24810834e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Oct 2023 02:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696239698; x=1696844498; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TGGbdrGosWyKhs9eMc4c70vM7gr6/rbHzqKdNT55QBw=;
        b=yIXUo/FWe1rjiCASpfPZZAwPUaeTIYWo5gdw5Nz1t2gLZh9xYQE9nJ+Yh0WFhE+XFT
         p0FjHBjWGNfaq1M1aoGXtLQvLEi3vVD+0l5cNlSqOzycBvCHLvFoI0lFCMmaaZ0bqdL7
         G6Nyyk2fWbk6qL4GB+rgxBJi2MrfdjE2fps+s8IMB+oevrqQHGYs4gUudnCiWnHzfomH
         lbyK0vLFNe2iZYVh99jmLF9r73pxdE9NyOurxMSzZAjvcqwxCng6YDPRMh65G5gIGReP
         r5wFSokvGjY2oUapd6sVv3yLqYAbzIePz1lvwndvhEW/4g6LcD10BzkqXXCIcBlcYIcD
         CN7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696239698; x=1696844498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TGGbdrGosWyKhs9eMc4c70vM7gr6/rbHzqKdNT55QBw=;
        b=WzjxUt3PNYmVaVXg/Uow5lVXR6LXbTwiMEDCJ8M3o+FLvHL2RtEGI0Uuf7JKxHoSnb
         jW4aKjId4sS971mhiRRFhZkZjT1b5C48Ch8JeBpKh6CADQCCUmK8+IJtCdsXXY/iW02r
         cBq+YH3/iZSvx7fSa8TtTKXH9zo4uTcP5k4N1te2MAQ8TEKJ9JyrA4KlfEE6LniB2SHX
         gzqMsFs2+sEmqx+PsEyzb1pbED493ENorI4aqEt5TpncpdGj0ZGUcvjK48X0l6VKHJ7S
         odPyosp0sN4asvIbBxLFhoI3hl0rCP5yz6OATTzgVm6LQ2+rIyxa7q0aFVHVVT978w+/
         +Ltg==
X-Gm-Message-State: AOJu0YzIprO6Pq0xteDWYj2CspfaQVuN8X49XdsyUW/sNsUpUJD3c4ND
        qaFM2OWjmJ2khMF/F+DDcyHn+g==
X-Google-Smtp-Source: AGHT+IHOjsMPg1PwBZaV8sc89dJjIG5yPlfNDVrbGI/AwmTPx8Hi1MlIykByPVKlp/6zS3ldp6kU3w==
X-Received: by 2002:a05:6512:3b9c:b0:4fe:279b:8a02 with SMTP id g28-20020a0565123b9c00b004fe279b8a02mr10722781lfv.67.1696239697615;
        Mon, 02 Oct 2023 02:41:37 -0700 (PDT)
Received: from [172.30.204.164] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id z20-20020a7bc7d4000000b004064e3b94afsm6870847wmk.4.2023.10.02.02.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 02:41:37 -0700 (PDT)
Message-ID: <11d0c359-cb33-529c-9430-eb8cf396c7a2@linaro.org>
Date:   Mon, 2 Oct 2023 11:41:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 6/6] ARM: dts: qcom: add device tree for Nokia Lumia
 830
Content-Language: en-US
To:     Rayyan Ansari <rayyan@ansari.sh>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Jack Matthews <jm5112356@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
References: <20230930221323.101289-1-rayyan@ansari.sh>
 <20230930221323.101289-7-rayyan@ansari.sh>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230930221323.101289-7-rayyan@ansari.sh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/1/23 00:08, Rayyan Ansari wrote:
> Add an initial device tree for the Nokia Lumia 830, codenamed
> "tesla".
> 
> Co-developed-by: Dominik Kobinski <dominikkobinski314@gmail.com>
> Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
> Co-developed-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Co-developed-by: Jack Matthews <jm5112356@gmail.com>
> Signed-off-by: Jack Matthews <jm5112356@gmail.com>
> Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
> ---
>   arch/arm/boot/dts/qcom/Makefile               |  1 +
>   .../dts/qcom/qcom-msm8926-microsoft-tesla.dts | 67 +++++++++++++++++++
>   2 files changed, 68 insertions(+)
>   create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts
> 
> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
> index 7982620ec9f9..a3d293e40820 100644
> --- a/arch/arm/boot/dts/qcom/Makefile
> +++ b/arch/arm/boot/dts/qcom/Makefile
> @@ -33,6 +33,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>   	qcom-msm8916-samsung-grandmax.dtb \
>   	qcom-msm8916-samsung-serranove.dtb \
>   	qcom-msm8926-microsoft-superman-lte.dtb \
> +	qcom-msm8926-microsoft-tesla.dtb \
>   	qcom-msm8960-cdp.dtb \
>   	qcom-msm8960-samsung-expressatt.dtb \
>   	qcom-msm8974-lge-nexus5-hammerhead.dtb \
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts
> new file mode 100644
> index 000000000000..53a6d4e85959
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2023, Jack Matthews <jm5112356@gmail.com>
> + * Copyright (c) 2023, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> + * Copyright (c) 2023, Dominik Kobinski <dominikkobinski314@gmail.com>
> + * Copyright (c) 2023, Rayyan Ansari <rayyan@ansari.sh>
> + */
> +
> +/dts-v1/;
> +
> +#include "qcom-msm8226-microsoft-common.dtsi"
> +
> +/* This device has touchscreen on i2c1 instead */
> +/delete-node/ &touchscreen;
> +
> +/ {
> +	model = "Nokia Lumia 830";
> +	compatible = "microsoft,tesla", "qcom,msm8926", "qcom,msm8226";
"we have a Tesla at home"

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
