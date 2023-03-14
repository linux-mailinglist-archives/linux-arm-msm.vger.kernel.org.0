Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 347DB6B93A5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 13:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232095AbjCNMWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 08:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232130AbjCNMWX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 08:22:23 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B20A2C0A
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 05:18:21 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id y15so10228570lfa.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 05:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678796216;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sOtYL76D5jK41O7pBM1qGZdEy4AoWMXlrbpTzr4/jQs=;
        b=SIWLf11pCQbFwmH+geel07Z98Q+YPDfAf7LAgVY8s0BpVFXzOav74oRwdrQJHm5Cf5
         GEs2KtiSPIuh5SVyXLibPJJGiWhTgDmHsJnZfMvfF+7wl8sBlT9eDqD1azKkgG/hVN35
         /566R8f1HjXW1wlZPO0/kFZvQkqvNdsXhBDksc0WiuNjf5JoiIjK1+JXn0DOoyzzNcI/
         VbCaxluoHhxsVQlBbANFsXZP37Vq0F2WXWvYooxWsjOLigM2FAgezypu27RN3rwvnRdK
         UGlKT7F6q5FWZRA8E7jfiOETqeCrsvre1/4EL8yBss+h1Ui+EJBS1CNr4Foe4qP6F/ug
         C+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678796216;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sOtYL76D5jK41O7pBM1qGZdEy4AoWMXlrbpTzr4/jQs=;
        b=vCqxPoh+vicn823A/1mWhGcetVG42ZuSxrBKLv+RvQYtPgznJeu8YRXPQmiPs3G9s5
         wJlBihWnZEXc/Np/74VhXOigmMoTTFxX8UdcsEX7zBjjWjxB3oyts64AR5nM6/sqstB4
         EPVBqclYem5YrrYiG8+q5K+Z6v2mr0Iz1s2tOYKYnXI6CElEhubuKccNySraha+fmNyi
         Y46BQSuzDpB/9KSDojgEN5SNEINvJQnrp5Vy7QAtbVdMWrEWv8W3OVRAik9cWVlLWvTq
         OpCrPHSOG3/sR0W8ZAijgvrIkurLQphf2okBD15izq1aFLVcNTNKBz+3zsiRTJ3NA/0Q
         KQiw==
X-Gm-Message-State: AO0yUKW4eS/pXh3TajhuPA4p5XDp2om6lzyExXa0K2OlnAEtEW4FbMY9
        cks4cajHF1U8Wo3mIsIyS16Xog==
X-Google-Smtp-Source: AK7set9n5nUNAh7CFYJk66Co0AL3B+orRreGeRlsVyrcjHH+73GaHitnfT/IF2Vxz0FWwxPMgofwGA==
X-Received: by 2002:ac2:4145:0:b0:4b5:2cf4:cc1d with SMTP id c5-20020ac24145000000b004b52cf4cc1dmr674225lfi.68.1678796215767;
        Tue, 14 Mar 2023 05:16:55 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r28-20020ac252bc000000b004d594481d0asm385901lfm.34.2023.03.14.05.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 05:16:55 -0700 (PDT)
Message-ID: <c35fd641-12ff-beba-341c-4d0305bcaa40@linaro.org>
Date:   Tue, 14 Mar 2023 14:16:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 00/13] mailbox/arm64/ qcom: rework compatibles for
 fallback
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230314080917.68246-1-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230314080917.68246-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/03/2023 10:09, Krzysztof Kozlowski wrote:
> Hi,
> 
> Changes since v1
> ================
> 1. Rebase
> 2. Make msm8994 fallback for several variants, not msm8953, because the latter
>     actually might take some clocks.

Although the approach looks correct, I think that in some cases it tries 
to mark devices compatible judging from the current driver, not from the 
hardware itself.

For the reference, on msm8994 the apcs is a clock controller for the l2 
clocks (which we do not support yet). If I'm not mistaken, on msm8976 
the apcs region contains a mux for the cluster1 clocks. On sdm630/660 
the apcs region also seems to be involved in CPU clocks scaling.

On the other hand, the sc7180/sm8150 part seems logical.

> 3. Two new patches for SDX55.
> 4. Minor corrections in bindings style.
> v1: https://lore.kernel.org/all/20230202161856.385825-1-krzysztof.kozlowski@linaro.org/
> 
> Description
> ===========
> 
> If entire approach is accepted (and correct), there are no dependencies and
> patches can be picked independently.  Although the best in the same cycle, so
> there will be no new `dtbs_check` warnings.
> 
> Best regards,
> Krzysztof
> 
> Krzysztof Kozlowski (13):
>    dt-bindings: mailbox: qcom,apcs-kpss-global: correct SDX55 clocks
>    dt-bindings: mailbox: qcom,apcs-kpss-global: fix SDX55 'if' match
>    dt-bindings: mailbox: qcom,apcs-kpss-global: use fallbacks
>    mailbox: qcom-apcs-ipc: do not grow the of_device_id
>    arm64: dts: qcom: ipq8074: add compatible fallback to mailbox
>    arm64: dts: qcom: msm8976: add compatible fallback to mailbox
>    arm64: dts: qcom: msm8998: add compatible fallback to mailbox
>    arm64: dts: qcom: sdm630: add compatible fallback to mailbox
>    arm64: dts: qcom: sm6115: add compatible fallback to mailbox
>    arm64: dts: qcom: sm6125: add compatible fallback to mailbox
>    arm64: dts: qcom: qcs404: add compatible fallback to mailbox
>    arm64: dts: qcom: sc7180: add compatible fallback to mailbox
>    arm64: dts: qcom: sm8150: add compatible fallback to mailbox
> 
>   .../mailbox/qcom,apcs-kpss-global.yaml        | 67 ++++++++++---------
>   arch/arm64/boot/dts/qcom/ipq8074.dtsi         |  3 +-
>   arch/arm64/boot/dts/qcom/msm8976.dtsi         |  3 +-
>   arch/arm64/boot/dts/qcom/msm8998.dtsi         |  3 +-
>   arch/arm64/boot/dts/qcom/qcs404.dtsi          |  3 +-
>   arch/arm64/boot/dts/qcom/sc7180.dtsi          |  3 +-
>   arch/arm64/boot/dts/qcom/sdm630.dtsi          |  3 +-
>   arch/arm64/boot/dts/qcom/sm6115.dtsi          |  3 +-
>   arch/arm64/boot/dts/qcom/sm6125.dtsi          |  3 +-
>   arch/arm64/boot/dts/qcom/sm8150.dtsi          |  3 +-
>   drivers/mailbox/qcom-apcs-ipc-mailbox.c       | 11 +--
>   11 files changed, 60 insertions(+), 45 deletions(-)
> 

-- 
With best wishes
Dmitry

