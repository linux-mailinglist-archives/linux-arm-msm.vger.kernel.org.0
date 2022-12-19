Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F22C7650915
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Dec 2022 10:09:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbiLSJJN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Dec 2022 04:09:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231448AbiLSJJI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Dec 2022 04:09:08 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2666BC86
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 01:09:06 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id b3so12731657lfv.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Dec 2022 01:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZyR5gSmKyguAcX5pHH35Ht5JLpx7+cAaPVpmD/qMPE=;
        b=TdN7ALFw6/NFrG+fG2GiKk5ZlonpRX6iE/1DSwfQwwykBTZo7SI/QFd4Y34CqHQyoV
         TC+uee+pPB4LMC2egRTx0qz8OtcXbCUvkjIt37NQt5Pd2a1cMze93funFnotHLbflkIC
         qUtA7WVresBz1tKDYdluUypqgVGxx83Tayr3rqNHODhKPwYVpljVQ6KVmaPLU36G4dgs
         vykXOMCJ7/s7O+/+BIyclgtBFwEko9hf/7mwWl6Fm/GxHFtnhfP+JaHadxcmlV1pUOuJ
         mWVJvXt5Uu9YSGK1dkp1ZyWZc/3Gt0BQGEdRXTq7bbbaYfc/L0mFYPoajjxndcScTn4w
         q9VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZyR5gSmKyguAcX5pHH35Ht5JLpx7+cAaPVpmD/qMPE=;
        b=ddSuj0zCDR4XYSOicWI3x411kPuuLVRODJ/w/y94L3tZxa+qFdsJrCN1dayPCxzS9z
         ETRCD8DUytK372uj2UWwDaK3aEHGMfLVTHgXiArIoKMUyZ8XJ6FadMfYUFu1kfrZboeW
         xt/UMMKYT5AtnPidLL/9uNJfOTC3QOHGD/DIoeIfyqmOWRx4oeFRBoH56+wm3lZ5xVva
         4QHMjdiZrs5+SBrgbAglpFPZ+dlG4jwFV/xVLBjoGfinZqgBEN64nxZ76J9S30Rht+6i
         WmuJB3P9lNoBbtnguke7p5c9Mr7oOekyd5HlqWiXrHBgtkIi7WSasfiRCI0tpCNcCI1i
         vkVw==
X-Gm-Message-State: ANoB5pmxGh2w4DeTv1EWU0z/Poi+1mazRwQrbta00N3JpnxS/S8ujbEC
        5lkPPQt72tQqhqH0+FWvSbEdRw==
X-Google-Smtp-Source: AA0mqf5X0yqQn8C9U/nSEy2RW1j67TKUJw0sbleYyIOJ2Iiqe4iuR9Vs33wEupgZWbCbz7rYk83HuA==
X-Received: by 2002:a19:e059:0:b0:4b5:8987:1db8 with SMTP id g25-20020a19e059000000b004b589871db8mr11186995lfj.59.1671440945251;
        Mon, 19 Dec 2022 01:09:05 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b8-20020a056512070800b004acbfa4a18bsm1057604lfs.173.2022.12.19.01.09.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 01:09:04 -0800 (PST)
Message-ID: <6d263321-782d-9d9c-4fdf-8bcf5b280779@linaro.org>
Date:   Mon, 19 Dec 2022 10:09:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/4] dt-bindings: arm-smmu: Document smmu-500 binding
 for SM6125
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org, Will Deacon <will@kernel.org>,
        Joerg Roedel <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Lux Aliaga <they@mint.lgbt>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Thierry Reding <treding@nvidia.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20221216215819.1164973-1-marijn.suijten@somainline.org>
 <20221216215819.1164973-2-marijn.suijten@somainline.org>
 <306709f8-7d45-9b76-f95b-1b3088d37a78@linaro.org>
In-Reply-To: <306709f8-7d45-9b76-f95b-1b3088d37a78@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/12/2022 10:07, Krzysztof Kozlowski wrote:
> On 16/12/2022 22:58, Marijn Suijten wrote:
>> From: Martin Botka <martin.botka@somainline.org>
>>
>> Document smmu-500 compatibility with the SM6125 SoC.
>>
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Wait, not entirely... no constraints for clocks and regs?

Best regards,
Krzysztof

