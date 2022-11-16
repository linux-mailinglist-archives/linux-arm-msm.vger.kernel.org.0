Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5191462C63C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 18:21:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238810AbiKPRU5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 12:20:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232915AbiKPRUj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 12:20:39 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA10D5C76A
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 09:20:34 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id z24so22707346ljn.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 09:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=acJhybBz2M2PO5pOvU8Ug1ztLmaLScMlQ7teD+cQGJU=;
        b=hiV0KLmAfXFXsByk8dO+7osbJAdckZA7x/kQYvBGviDWaMCyd5JgkCQe3rC4MXjRQ6
         vdiiYG62vzpwuweR73j5H9pfVp0zHqYU4tScoBgIVlhtb6HOQ3bmPKWWBx5KwMI76elv
         nDlztn51gUgD+yNCPzyyqJDQMe9E+7CAk4rJTAPR9o3iZKogr+bAUxbIFWz3SBgrcAyM
         O937IZT10rekVeV3lsRJKOp+bTIdMJKwSauIbZBJ/yt3VVtvwrpLoxrBrXPJdhlUy2xX
         X7RLmH84oGVm0Qf+fetgfI+yMTJd1mKVClJ+ohdZ2XOriTqLzAxPLK3uHEliQE89yvUS
         fJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=acJhybBz2M2PO5pOvU8Ug1ztLmaLScMlQ7teD+cQGJU=;
        b=PXscjqKUANwir0G4GhFbughBZ0/N5kUHJmDCgqAOP/Trls8Y7pz8hIZITXTXOdJHhg
         ZrK5yHbDUUotqbJMatANqP9ePd5dwJwct8Krul/jgGwLUiHmUeCdNLxganujoJ+t+Cro
         A6Jcda/9WYmIL2vCcTqpUo6kvLSZfBG0E97eUOjbVjPuDdijDp2XE2XxX3L7rPcPgmi0
         tFEgylwrfKh/5qMkQSnIIgJxePPpaGE6R5UflmXqeTiBHu+e5F6C2c4Xy+Akn3MROwKq
         caVO3jCpBvNWf9L9Rn/xVDY9chAhZJnJo+dp/BxC3sz9vDspSd2Fip951zUhIcxuD8zF
         wxiQ==
X-Gm-Message-State: ANoB5pkq4LYOyoXUL+96JjoKMYOen6JP/KqQK0KiCb0uCVWBK7pF/BJJ
        RTD0yA0OSl+9zU32Rlmp0PDvjA==
X-Google-Smtp-Source: AA0mqf4SK9I+HKA5odf+PVVX3WuF39aVw5jxyOM1F9BP4tEwGynMOy3xZISLSjzEDF6aLD86VBrWnA==
X-Received: by 2002:a2e:be8a:0:b0:277:a9d:9370 with SMTP id a10-20020a2ebe8a000000b002770a9d9370mr7528427ljr.103.1668619233275;
        Wed, 16 Nov 2022 09:20:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p25-20020a056512139900b0048af397c827sm2696685lfa.218.2022.11.16.09.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 09:20:32 -0800 (PST)
Message-ID: <7080e8c8-4bb8-a328-5c2a-28510a7e3b49@linaro.org>
Date:   Wed, 16 Nov 2022 18:20:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 3/8] arm64: dts: qcom: msm8953: Add device tree for
 Motorola G5 Plus
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
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
 <20221116145616.17884-4-luca@z3ntu.xyz>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221116145616.17884-4-luca@z3ntu.xyz>
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
> From: Sireesh Kodali <sireeshkodali1@gmail.com>
> 
> Add device tree for the Motorola G5 Plus (potter) smartphone. This
> device is based on Snapdragon 625 (msm8953) SoC.
> 
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>

Missing SoB.

> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/msm8953-motorola-potter.dts | 306 ++++++++++++++++++
>  2 files changed, 307 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8953-motorola-potter.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index a0b537414593..21a6a7b5a2cf 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -21,6 +21,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-grandmax.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-j5.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-samsung-serranove.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-wingtech-wt88047.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-motorola-potter.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-10.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-lg-bullhead-rev-101.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-octagon-talkman.dtb
> diff --git a/arch/arm64/boot/dts/qcom/msm8953-motorola-potter.dts b/arch/arm64/boot/dts/qcom/msm8953-motorola-potter.dts
> new file mode 100644
> index 000000000000..3957dabf651e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8953-motorola-potter.dts
> @@ -0,0 +1,306 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 The Linux Foundation. All rights reserved.
> + */
> +/dts-v1/;
> +
> +#include "msm8953.dtsi"
> +#include "pm8953.dtsi"
> +#include "pmi8950.dtsi"
> +
> +/ {
> +	model = "Motorola G5 Plus";
> +	compatible = "motorola,potter", "qcom,msm8953";
> +	chassis-type = "handset";
> +	qcom,msm-id = <293 0>;
> +	qcom,board-id = <0x46 0x83a0>;

Not allowed currently.

> +
> +	chosen {

Best regards,
Krzysztof

