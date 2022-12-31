Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED69E65A47A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Dec 2022 14:02:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236023AbiLaNBt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Dec 2022 08:01:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbiLaNA7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Dec 2022 08:00:59 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA3FD11450
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 05:00:06 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id s22so24604652ljp.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 05:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lIxmppUh5zsETJqIpBWngzESP8KE8QhCm/D2gCLXS+E=;
        b=nJ2TVWUhWSr+mirsoCk3wxL8miwBgzdEntyBTZQoxn8a2ffJfQ1PI1JUzQmTdMoEKa
         wqI5bq4dDh2qZKKzEWtLDX84XaGJglJE6Lme9kEUfhgAc4/yfT84yymGz3YDD3Eta3Js
         12O/7wGX4LsG9IYhRCVu5mjCw160kOfV+Fs+7S8dYwzdkUECV65xcrw/TEclO0dy6xWk
         QYTsZ9BSdjSAMoxsx0bfKpasP0mg0l3o9Oj73gQxiEm0WLStt5jk8yl8CuoV/p5dYv4T
         PEqg0GkzdOLMriWAROBlyJzN0HSHua9x1iZXVCtqlZvTZf+fGD9RMV4oE9iqBMwVEWYU
         gQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lIxmppUh5zsETJqIpBWngzESP8KE8QhCm/D2gCLXS+E=;
        b=aBIiytVtUq0Z7N3vR+CFP7LQ2d/U2QEqpRYj91bBEYRg0qLnClTOm2ZBpPxfNTPDbb
         6lOvN0TY6GQeuHOvPzBhCAeW2Fq3JX+y7WwCKKUsnuzZHpCbJPrq48b9MTK3xGPR+gpr
         6ZX8HGuEnN8XxlayQ6vToOa/qhvSEzlB3yOdfCqT7Fw+Wd9MMq8gS8eMmUYjFLyQrdM7
         zwksuBr1G6hY8p8vR225tzhQEzmoeGNNrcuIGRARh4CnP5RwdrY175PXzQxOsqxaEcaO
         eVUnSvCqGRvkrGugGBHp/Bwn5IhO0179fUj/AuAXla+4nwrhoaxK3royZHh5FEV0z3J1
         +5SQ==
X-Gm-Message-State: AFqh2koCXT3xmPS875n1kVx+XUd7Om0/nUEZsoaejktGLmTPnzAwqzdr
        OU0pvHJRwa0sWfY0/I75JUeMzhZBKFi6gjCz
X-Google-Smtp-Source: AMrXdXs7XR935SDEnYgWkCXhjgPgL/GSAPTXcOr2Jn+EGXpVWwhbU8X/szIP9rKRe7kXc8PF7oo1sQ==
X-Received: by 2002:a05:651c:2003:b0:279:4a7:283e with SMTP id s3-20020a05651c200300b0027904a7283emr8537799ljo.27.1672491604793;
        Sat, 31 Dec 2022 05:00:04 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id n23-20020a2e8797000000b0027fe3bc3c24sm385421lji.39.2022.12.31.05.00.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Dec 2022 05:00:04 -0800 (PST)
Message-ID: <51875ab4-b0af-466a-cf27-d3bed65a94c5@linaro.org>
Date:   Sat, 31 Dec 2022 14:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 00/18] Misc DT style fixes
Content-Language: en-US
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org
References: <20221231125911.437599-1-konrad.dybcio@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221231125911.437599-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 31.12.2022 13:58, Konrad Dybcio wrote:
> As part of trying to write up everything we care about when reviewing
> DTs [1], I put my regex to a test and removed some reg inconsistencies,
> among fixing up some other things in ipq6018.
[1] https://github.com/konradybcio-work/dt_review

Konrad
> 
> No dependencies as far as I'm aware.
> 
> Konrad Dybcio (18):
>   arm64: dts: qcom: ipq6018: Pad addresses to 8 hex digits
>   arm64: dts: qcom: ipq6018: Use tabs instead of spaces
>   arm64: dts: qcom: ipq6018: Sort nodes properly
>   arm64: dts: qcom: ipq6018: Fix up some indentation
>   arm64: dts: qcom: ipq6018: Add/remove some newlines
>   arm64: dts: qcom: ipq6018: Use lowercase hex
>   arm64: dts: qcom: sc8280xp: Pad addresses to 8 hex digits
>   arm64: dts: qcom: sm8150: Pad addresses to 8 hex digits
>   arm64: dts: qcom: sm6350: Pad addresses to 8 hex digits
>   arm64: dts: qcom: sdm845: Pad addresses to 8 hex digits
>   arm64: dts: qcom: sm8250: Pad addresses to 8 hex digits
>   arm64: dts: qcom: sm8350: Pad addresses to 8 hex digits
>   arm64: dts: qcom: sc7180: Pad addresses to 8 hex digits
>   arm64: dts: qcom: sc7280: Pad addresses to 8 hex digits
>   arm64: dts: qcom: msm8994-octagon: Pad addresses to 8 hex digits
>   arm64: dts: qcom: sm8450: Pad addresses to 8 hex digits
>   arm64: dts: qcom: msm8994-kitakami: Pad addresses to 8 hex digits
>   arm64: dts: qcom: sm6115: Pad addresses to 8 hex digits
> 
>  arch/arm64/boot/dts/qcom/ipq6018.dtsi         | 548 +++++++++---------
>  .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  |  52 +-
>  .../qcom/msm8994-sony-xperia-kitakami.dtsi    |   2 +-
>  arch/arm64/boot/dts/qcom/sc7180.dtsi          |  20 +-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          |  46 +-
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi        |   2 +-
>  arch/arm64/boot/dts/qcom/sdm845.dtsi          |  46 +-
>  arch/arm64/boot/dts/qcom/sm6115.dtsi          |   6 +-
>  arch/arm64/boot/dts/qcom/sm6350.dtsi          |  16 +-
>  arch/arm64/boot/dts/qcom/sm8150.dtsi          |  68 +--
>  arch/arm64/boot/dts/qcom/sm8250.dtsi          |  54 +-
>  arch/arm64/boot/dts/qcom/sm8350.dtsi          |  16 +-
>  arch/arm64/boot/dts/qcom/sm8450.dtsi          |  48 +-
>  13 files changed, 461 insertions(+), 463 deletions(-)
> 
