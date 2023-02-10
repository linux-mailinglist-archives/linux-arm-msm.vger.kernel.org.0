Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DB48691A02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 09:29:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231432AbjBJI3K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 03:29:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231447AbjBJI3J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 03:29:09 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72105775C
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 00:29:04 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id m14so4217746wrg.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 00:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6tE1c8DX1v8mq8zoUCAIlPkRHC7+cDeEHJZKSrjk8IA=;
        b=hHm3T8b07r++hVJS3bQDQPb8kda5vBpkvDme6ZbXdLqhcM9fDX5oFyYu/n6qlFQcZ+
         iYnatEhZBe2gJ2wPUQHlIp6tOWV+kFRO6IFOsML793dYvUdmykYe5h4kstTSQKQSctaj
         oCGaxEXxiwEUGjY3YtXmK+ClIf4Wch7r5ypjWXB0RjDIg+HyfTeRc0RdO8FR6ncCp1f7
         4anrFnVwmlc7tdaIo13VsLpIFr/SrIxAD/c8iMq7w5+CyAxHQnglEHkXJ9KBF4plk6Op
         g4bpFy0zj4RO/xfYfqVNoZeBhIXZH0VdUI6o1Y50ypaAjEohACrSg5Y2ZZbr35Ta6Ymh
         Rhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tE1c8DX1v8mq8zoUCAIlPkRHC7+cDeEHJZKSrjk8IA=;
        b=Z6KO5KmZmlWVgInRt4nZvourvg35WyA+b8wMwiqhRwTVXtsuYPrKUxt/Aeap6WkQuW
         VWZCvsQa0/7y6UyG2IoYpKTrsyiMb00K5X+e4ToJiEHfAB+FdbR+py/DHxpjMaupfIOc
         19J9QYC6xEUSQlK6CneBzDuXH6mgsIiC9N8hS6isebS9mKLsMBwkDBXnUHv1OMvYCYHr
         kU5MKPrSPWW58PkJNYwGpHojugrZSKtSvWAKg0orkRGfQUkfDWu9p7OsCkxK1Yqz0eOt
         unwxC4vpnMBLb3mtsaTZvD7f0J3ENN+kmGymzc0BjxxY69qkd5YaX8e4/p8FpDeCDGp4
         1/SQ==
X-Gm-Message-State: AO0yUKX6/x7lR1asivgfaql0u0mAxM6W/Pn6RxkfJsdf7l8im0notleM
        UCRFA5J72XGYmCJtJGTTXAwq8w==
X-Google-Smtp-Source: AK7set8CXKm1YKEByQG/0WbPGVGfw7alomSEHGXKLAfAg83bzNQrVs9gDjx9S1V0J6uUMIHVjvhQXg==
X-Received: by 2002:adf:f308:0:b0:2c4:242:1e09 with SMTP id i8-20020adff308000000b002c402421e09mr8851999wro.41.1676017743399;
        Fri, 10 Feb 2023 00:29:03 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a65:5553:55cf:3027? ([2a01:e0a:982:cbb0:5a65:5553:55cf:3027])
        by smtp.gmail.com with ESMTPSA id g16-20020adfe410000000b002bfae1398bbsm2965946wrm.42.2023.02.10.00.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 00:29:02 -0800 (PST)
Message-ID: <3fe5605e-de5a-53dc-0bf0-c6aff81f2453@linaro.org>
Date:   Fri, 10 Feb 2023 09:29:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: sm8350: enable GPU on the HDK
 board
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/02/2023 14:38, Dmitry Baryshkov wrote:
> Add A660 device to the Qualcomm SM8350 platform and enable it for the
> sm8350-hdk board. Unfortunately while adding the GPU & related devices I
> noticed that DT nodes on SM8350 are greatly out of the adress sorting
> order, so patches 2-4 reorder DT nodes to follow the agreement.
> 
> Changes since v1:
> - Dropped merged patches
> - Expanded commit messages to mention the sort order (by the node
>    address)
> - Rebased on top of latest Bjorn's tree

Can you specify which tree and commit ?

I tried next-20230207, next-20230208 & next-20230209 and patch 2 doesn't apply.

On the 3 trees I have:
d7133d6d25fb arm64: dts: qcom: sm8350: use qcom,sm8350-dsi-ctrl compatibles
b904227a4b69 arm64: dts: qcom: sm8350: Hook up DSI1 to MDP
2a07efb8c086 arm64: dts: qcom: sm8350: Add mdss_ prefix to DSIn out labels
e3e654ced376 arm64: dts: qcom: sm8350: Fix DSI PLL size
45cd807de143 arm64: dts: qcom: sm8350: Fix DSI PHY compatibles
0af6a4012b38 arm64: dts: qcom: sm8350: Feed DSI1 PHY clocks to DISPCC
1eed7995d9da arm64: dts: qcom: sm8350: Fix DSI1 interrupt
6636818ecf0f arm64: dts: qcom: sm8350: Add missing #address/size-cells to DSIn
f3c08ae6fea7 arm64: dts: qcom: sm8350: Pad addresses to 8 hex digits
1ccad21aa996 Merge tag 'qcom-arm64-fixes-for-6.2' into arm64-for-6.3
...

Can you use --base in format-patch (or use b4 prep !) ?

Thanks,
Neil

> 
> Changes since v1:
> - Fixed the subject and commit message for patch 1
> - Fixed GMU's clocks to follow the vendor kernel
> - Marked Adreno SMMU as dma-coherent
> - Dropped comments targeting sm8350 v1, we do not support that chip
>    revision.
> 
> Dmitry Baryshkov (6):
>    dt-bindings: display/msm/gmu: add Adreno 660 support
>    arm64: dts: qcom: sm8350: reorder device nodes
>    arm64: dts: qcom: sm8350: move more nodes to correct place
>    arm64: dts: qcom: sm8350: finish reordering nodes
>    arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes
>    arm64: dts: qcom: sm8350-hdk: enable GPU
> 
>   .../devicetree/bindings/display/msm/gmu.yaml  |    1 +
>   arch/arm64/boot/dts/qcom/sm8350-hdk.dts       |    8 +
>   arch/arm64/boot/dts/qcom/sm8350.dtsi          | 2512 +++++++++--------
>   3 files changed, 1354 insertions(+), 1167 deletions(-)
> 

