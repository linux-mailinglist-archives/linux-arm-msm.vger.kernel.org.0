Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9771E5B1F44
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 15:33:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232431AbiIHNd1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 09:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232443AbiIHNdJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 09:33:09 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601ECED99C
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 06:31:58 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id v6so6511314ljj.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 06:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Ohu6CozGjy5GhPmh3m1Q0H8HEbccCG50CgwFnCzBG1M=;
        b=ptC5lx8ui2N6P9aJgfgD/F4uhtNhf8ZhMAdQGSWGNJjjsoGCpVpb5iWXuz3JTUDXdP
         fJ++bXHzabeC1AT1bMDCssosOPFRXmMhsJueCRRtQk4JPstA0V+AKgvPi2HDoWButk+2
         6jYHd1d5/4QHSccAePsM42YVSYsxWZ68NYKC5vfMDqgiv7xRvIr6oHaTfgCjoqb1bwpW
         tXnXth03V8x03pU+cnwNOvuld4SD1H911urQ08y5dL1A2mC9txdftm0dHz9c8NcSLMSF
         0jhGk4sXoxMxM0fhdM1yFKP4kTz/HK4bnAVkX9FuvicMKiPe6lYJRHnfj2myLr1uihWi
         ChqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Ohu6CozGjy5GhPmh3m1Q0H8HEbccCG50CgwFnCzBG1M=;
        b=Te/4ceKwrctb6LFc5gvtkkgxRY1JqFbuPKXZ/v5p9ebj8AX8zefDmiEr+41Oup95Rl
         y395ZRtxjScE3WejlhhcAsyWkrPliJ+yR4W8vzbYBwlMGGwHL/lWcUBnXCCmZIpA+xeX
         zA7AY3OthknLUIgBW2GLrxmtNo2S+kd/suKz3h1lWMhGStAVdCNul6P5DHjVWhrdiP8q
         V6KQRl3dVloAgi/5B4mHi1HNW55JZ2BIz8Hxq98kj6OAIoblIGyMiAe+4XwdsGJOafhH
         WAVLH2a5X2U0JYGFiBZCL4XJrxqYlvrrIs0dM/mgqeSH/rv5uiUrSqY3ztBhP3Y+9W2+
         rcIA==
X-Gm-Message-State: ACgBeo1xrspyh9pNru/9Mj91gRsGeV03yTXMhlP/gpfggiLFugYaQ9En
        TnGfQRuJBTh19xnCR4YW6yy7Rg==
X-Google-Smtp-Source: AA6agR7Mn8Ot0yeAgeYYRNMj+qOLoKvpoqnimvLBQxheimGNxcIm97oXVTGZg8bmOEsl1kwDWwNeHQ==
X-Received: by 2002:a2e:a787:0:b0:26b:ded1:7652 with SMTP id c7-20020a2ea787000000b0026bded17652mr125008ljf.263.1662643916226;
        Thu, 08 Sep 2022 06:31:56 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a27-20020a05651c031b00b00263630ab29dsm3192690ljp.118.2022.09.08.06.31.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 06:31:55 -0700 (PDT)
Message-ID: <6e6b12aa-f516-6ea1-58e5-f46033b84985@linaro.org>
Date:   Thu, 8 Sep 2022 15:31:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 3/4] ASoC: qcom: sm8250: move some code to common
Content-Language: en-US
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        broonie@kernel.org
Cc:     lgirdwood@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220908063448.27102-1-srinivas.kandagatla@linaro.org>
 <20220908063448.27102-4-srinivas.kandagatla@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220908063448.27102-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/09/2022 08:34, Srinivas Kandagatla wrote:
> SM8450 machine driver code can be reused across multiple Qualcomm SoCs,
> Atleast another 2 of them for now (SM8450 and SM8250XP).

s/Atleast/At least/

> 
> Move some of the common SoundWire stream specific code to common file
> so that other drivers can use it instead of duplicating.
> 
> This patch is to prepare the common driver to be able to add new SoCs support
> with less dupication.

s/dupication/duplication/


> 

Assuming there were no changes against v2:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
