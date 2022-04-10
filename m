Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06C7E4FAFA8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Apr 2022 21:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240702AbiDJTMD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Apr 2022 15:12:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240532AbiDJTMC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Apr 2022 15:12:02 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60C504B407
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 12:09:50 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id d10so15933775edj.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 12:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=UCq58/ccSena0g1xUtVue6jq9T/o1pRyEhKDx4EIiZo=;
        b=YOebLUuZQEh/L3PBZLoVDtrhbO++jWpcWzAS2itGIU+KsYuAM8eVqbvv8G0r5RWoU9
         JGbCCzNtHSSNT5ZzdDA+oISUaCxINveDJMfXQArUyDB8CdsXbHaQVMe2OhR/Pyw6trSI
         TsGhb9DTakpT9paTNtgC3Az2WVjCTieWvMwr/mmqtrYjcvjxYQjIKLx6uviy06BxwO9M
         bHBU1pH1F9l4NcQtH7bKDnHWQYR8YMquKHtWUvbjgutYUnlmnRJUgM6ZqPvQ7RmYNbUO
         xnicRx04dREhtYEMSmjzPeOWakHDKHGgg99SbGlV7KbZ2+WIJEISsVtJT5vU5uSZR2eq
         wjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UCq58/ccSena0g1xUtVue6jq9T/o1pRyEhKDx4EIiZo=;
        b=I/ygiOHja8exjVAaaf1PEaaSDrzX+rgHLeuHEitZ8ibt+1i6JHGzpdbA1ZTqQhUTG7
         2r4VAYtgaYlv3hWbcu//hKcNV1OHE/jcQEtXYdxnmIyjEoyDNy3ORryl4eInyPF1RPgl
         XYDMvE7LBjdj4pEpbqK8oLpV10izXi1oWc8Q1nv/GbifDf8NCsASC4FWJoU9BGG1SOkT
         0V7nqtsofhS6PFQJGOz5OhUUEPfjNEIld0TItpM2xWLFH5h4GNhzKXy2vt+8dBMYgNQB
         cpik3J4YfKLbfn7IUhFozuEfzzTPErDFyASBeUuCFniodAHW80sh/Io8Di6MwDuljsDj
         xR3Q==
X-Gm-Message-State: AOAM530rrKQYlWoODmVo5KTJfCFn2NlBysB1QxnoLY8rBL/E9oXhR4QM
        n6t4XTMXkD+33hvxibhji9C1PFIoIIGNVqHf
X-Google-Smtp-Source: ABdhPJyTukAvJ2wPkY29KNL9yKOcjYbFkoTvfEVKuJy3p8NpBD//tYuzLN6UfgB8gsjWTEBHIhROOA==
X-Received: by 2002:a05:6402:3554:b0:419:402f:f632 with SMTP id f20-20020a056402355400b00419402ff632mr29289044edd.1.1649617788857;
        Sun, 10 Apr 2022 12:09:48 -0700 (PDT)
Received: from [192.168.0.191] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id f7-20020a0564021e8700b0041d03a94f27sm5497808edf.66.2022.04.10.12.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Apr 2022 12:09:48 -0700 (PDT)
Message-ID: <d5878fa7-b51c-8c6b-506a-116855a508fa@linaro.org>
Date:   Sun, 10 Apr 2022 21:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/6] arm64: dts: qcom: msm8996: User generic node name
 for DMA
Content-Language: en-US
To:     Kuldeep Singh <singh.kuldeep87k@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220410175056.79330-1-singh.kuldeep87k@gmail.com>
 <20220410175056.79330-4-singh.kuldeep87k@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220410175056.79330-4-singh.kuldeep87k@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/04/2022 19:50, Kuldeep Singh wrote:
> Qcom BAM DT spec expects generic DMA controller node name as
> "dma-controller" to enable validations.
> 
> Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
