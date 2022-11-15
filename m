Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78501629DC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Nov 2022 16:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238263AbiKOPjf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Nov 2022 10:39:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232569AbiKOPje (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Nov 2022 10:39:34 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 937B121BE
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 07:39:33 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id n12so36931415eja.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Nov 2022 07:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYs5YDvzdRodOE2jQHDKPCqDW76eq2611ugG6TE3ocs=;
        b=LCgbRa3LAAl4LpE9/XCUY5mQ1ICCRdpiPzf2jxjCjP16CZAC3MXhtYA7sE5A/0Wiir
         0AUBMS/le/Li0IZfMt8WrIiA1VlWZr6YeyB5/cuGau1tl3iM4dxbHVrwnlEUiixcX3vr
         HK4dv4rVgR4s23OXVVidWj+j1uh6inaltLeFtWs/nfdu3IZEZ/9wDArXJRUgegTPc1d1
         JLjZsSWaJ/gws+a3wEeg1Pe4QIv8h7c4LJVHBEgw93r1iYMPHzzC4vCTP9aMGgSknn01
         3SIwwK8uUc0VFQ64W8i7Q8jizqShCoZATjRFSwWf1dzH5bNHSAFOePa5mQk+yMwwO22Z
         dm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CYs5YDvzdRodOE2jQHDKPCqDW76eq2611ugG6TE3ocs=;
        b=YUrgmaST1cjrapR4RrDP4tLZBYsC+bDLg/eNXrdvhyWHSp6/rvoPxZAqf50NZLGUJc
         nSes9PprB19mdendHmhygo3PA82rNQ9GziwXN2sCHyr8Ef9qSy6iAQoq1UQ8kOtewJQS
         jPzNTD4zDOxaOgIFkQSiESX6V01a8J3wiMnamvLgP/vWBqFekM/wfeKGjh6G8NmjX8d0
         RdMpVqWn23bTAPlF6xySYVC8A4E45EJavYb5vsaMXSxN49LY4Dt7UO9Sdp8Exk5nFGNK
         baBUqLFVJk3f5j0KS76/q+133bFFaEZgA9UG6PJsMKkiyEfhpB7DZNkyuzvcrcWBBCCo
         XQ7g==
X-Gm-Message-State: ANoB5pnxmO07AblRjeVf9sVJ3PdWq9IdTIoSN5dDOqs8vBmeyp59GJUd
        wDk5wDqO8YVDb3p8gApQCIz4t+mle8On1xlw
X-Google-Smtp-Source: AA0mqf6lJf1XSruIjl/5sTqI6vpVrWNGh63Mw258URmULmTgLTU2WT+0yJW2NhN+6jh7V6+icbgmjQ==
X-Received: by 2002:a17:906:1cd0:b0:7a1:6786:4566 with SMTP id i16-20020a1709061cd000b007a167864566mr14297206ejh.433.1668526771744;
        Tue, 15 Nov 2022 07:39:31 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id q21-20020a17090676d500b007826c0a05ecsm5560269ejn.209.2022.11.15.07.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 07:39:31 -0800 (PST)
Message-ID: <67a929c4-20fe-cd87-a68b-e95e68df7f3d@linaro.org>
Date:   Tue, 15 Nov 2022 16:39:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 0/9] SM6375/PDX225 GPI DMA, QUPs & PMIC peripherals
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org
References: <20221115152727.9736-1-konrad.dybcio@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221115152727.9736-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15/11/2022 16:27, Konrad Dybcio wrote:
> This series adds support for:
> 
> - GPI DMA for 6375
> - QUP hosts & I2C / SPI controllers for 6375
> - pinctrl for SOME (check commit message of 05/10) of ^
> - pmk8350 on arbitrary SID
> - touchscreen & SMD regulators on PDX225 (depends on [1])
> - pmic peripherals on PDX225
> 
> As well as some necessary binding changes with it.
> 
> Patches 1-7 can be applied right away, 8 and 9 depend on:
> 
> [1] https://lore.kernel.org/linux-arm-msm/20221109110846.45789-1-konrad.dybcio@linaro.org/T/#t
> 
> Changes since v2:
> - rework 3-power-domains bindings [1/9]
Forgot to add, also rebased against Dmitry's cleanups that Will pulled 
recently [1].


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git/log/?h=for-joerg/arm-smmu/bindings

Konrad
> 
> Changes since v1:
> - (afaict) fix errors with [1/9]
> - use preprocessor to swap out pmk8350 sid instead of hardcoding it
> - pick up tags
> - drop [v1 2/10] (dt-b for gpi) - applied
> - sort the newly-added regulator nodes properly
> 
> Konrad Dybcio (9):
>    dt-bindings: arm-smmu: Allow 3 power domains on SM6375 MMU500
>    arm64: dts: qcom: pmk8350: Allow specifying arbitrary SID
>    arm64: dts: qcom: sm6375: Add GPI DMA nodes
>    arm64: dts: qcom: sm6375: Add pin configs for some QUP configurations
>    arm64: dts: qcom: sm6375: Add QUPs and corresponding SPI/I2C hosts
>    arm64: dts: qcom: sm6375-pdx225: Enable QUPs & GPI DMA
>    arm64: dts: qcom: sm6375-pdx225: Add PMIC peripherals
>    arm64: dts: qcom: sm6375-pdx225: Configure SMD RPM regulators
>    arm64: dts: qcom: sm6375-pdx225: Configure Samsung touchscreen
> 
>   .../devicetree/bindings/iommu/arm,smmu.yaml   |  23 +-
>   arch/arm64/boot/dts/qcom/pmk8350.dtsi         |  19 +-
>   .../qcom/sm6375-sony-xperia-murray-pdx225.dts | 254 ++++++++++++
>   arch/arm64/boot/dts/qcom/sm6375.dtsi          | 389 ++++++++++++++++++
>   4 files changed, 677 insertions(+), 8 deletions(-)
> 
