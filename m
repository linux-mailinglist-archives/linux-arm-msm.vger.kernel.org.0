Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E68C5F5680
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Oct 2022 16:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230050AbiJEOfN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Oct 2022 10:35:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbiJEOfM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Oct 2022 10:35:12 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2DAC26AF6
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Oct 2022 07:35:10 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id by36so1224194ljb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Oct 2022 07:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=y1S8cIL/t+i/w+7ajcigJYXJl22/AGlTl26fkGAzMo0=;
        b=oCQhdCAgcuRM+QLekY2rE1uRXOutGsEz/oDwQkeMtLoLObAHWo3xYvt16/RK8/IocL
         6nuHfBvqOrs1ylZQxoe0X2ZBGzGq+wiV++XK3Q7/TdvDTDz2ysCjjBPYxo9jCKXzb4zp
         u+LfMS9Iv4h35ojbTwtj4G2XAg8w3F0RhFNodHvtXAGgAsCSshxnxefMrQBLPdF7Rzsk
         6mZICFjUq/pNhGT1guTu1dQdQIkPiyz1JH3HAiLBgwK9nrmI+s+wRdp1yKJxNnt+lA4k
         z0c8M1d+np202c8k/H5NRvLdMKmGXM/nY4waCe5xgOPBQAYPe0YqRKG5SjfJQOLViSqa
         UG3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=y1S8cIL/t+i/w+7ajcigJYXJl22/AGlTl26fkGAzMo0=;
        b=qbavtErfNVjozlek5AFVCk6gydoB4hDKt2X+9s3ARn/hrhgON+k1rzPfqZS9cHxxyS
         YrKW1kg7AeI06cvFj7nq63lHAGsxU/EWRd2AUMR+tpyY1dDf/ETlfu4wcqCME2fckGV7
         ul0rlXJIJrZmYhnbFK9ioCESgBuOnAD7/pClr9jsn/5N/NquMpBsXEgKylOWcvmWHbJn
         0nSYvk9pzlwUBo+nnYSqUzK7mM2PM6djHDT+fxvBdqTPUAfuKVjkMaFKVTTLo2un1L3Z
         bQi4uOEPI7OsHeGJiQ9DJIqbxnFgjCaHTC7rLJ4robz8e5cqbphOFqZbJpjMSd6NIVqh
         HlLQ==
X-Gm-Message-State: ACrzQf2TgKHO/DkdT7bnkFfNF/wQordPGEKgLcqmJEdWBFwTsFknObaR
        l68qEqMWQIcsiDcKwQaAZfagNg==
X-Google-Smtp-Source: AMsMyM5gYiTiPoFAcBIpGobzjv7RJqB4+ZzrpkW4wb0m+ybo3NYut8ulT8IwY1CdLtBif4rtJ5l+VQ==
X-Received: by 2002:a2e:81c7:0:b0:26d:d0a3:138c with SMTP id s7-20020a2e81c7000000b0026dd0a3138cmr5712799ljg.259.1664980509053;
        Wed, 05 Oct 2022 07:35:09 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m22-20020a056512115600b0048ae518364dsm2359728lfg.148.2022.10.05.07.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 07:35:08 -0700 (PDT)
Message-ID: <1ed91afd-74d2-1ab0-0d15-1b6e0dfba13b@linaro.org>
Date:   Wed, 5 Oct 2022 16:35:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v7 3/3] pinctrl: qcom: add sdm670 pinctrl
Content-Language: en-US
To:     Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20221004215814.11694-1-mailingradian@gmail.com>
 <20221004215814.11694-4-mailingradian@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221004215814.11694-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/10/2022 23:58, Richard Acayan wrote:
> The Snapdragon 670 has a Top-Level Mode Multiplexer (TLMM) for various
> features. Add a driver to support it.

(...)

> +
> +const int sdm670_reserved_gpios[] = {
> +	58, 59, 60, 61, 62, 63, 64, 69, 70, 71, 72, 73, 74, 104, -1
> +};
> +
> +static const struct msm_pinctrl_soc_data sdm670_pinctrl = {
> +	.pins = sdm670_pins,
> +	.npins = ARRAY_SIZE(sdm670_pins),
> +	.functions = sdm670_functions,
> +	.nfunctions = ARRAY_SIZE(sdm670_functions),
> +	.groups = sdm670_groups,
> +	.ngroups = ARRAY_SIZE(sdm670_groups),
> +	.ngpios = 151,
> +	.reserved_gpios = sdm670_reserved_gpios,
> +	.complement_fw_gpio_ranges = true,

This still fails to build... v6 was not compilable, v7 is still.

Best regards,
Krzysztof

