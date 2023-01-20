Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3E7676031
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 23:34:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbjATWeX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 17:34:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjATWeX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 17:34:23 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A32F613EE
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 14:34:20 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id v6so17477635ejg.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 14:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+22l4h2Ao22twC9WP8isPUC2uf4BscA3JtagPEjb/K8=;
        b=tQkH3Sxf2joe8/11Z9vcW7jKBSNNwPv9lKtwKj2hs+avnYMHg+7MaLjETWA1bCBUr7
         mh48ldW5eZdJB8soZCIteQDNqOTjtS2VcxxxzSPJAiIOtnSW7Z7zWLO6A6d6razimbYY
         zmgDvfKFD4nMczOQ/lqlW5fBxUOGRYs5ibsybUATsP1AxdOcC0Nm7yGoCH1PFTTrq6/T
         d5GsfNJtFY1+liay7O79/Z2O0ascvGh8HU+b3XaUyIE6k/zHMLTdv1w6dyey8S15ntx3
         ZlPvt/sOlih8v3EjUn3AeJIF8BFrJu/vJDTYqUazrjwHwC3lg1Qs0u6egG9q/9SpnYq1
         DqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+22l4h2Ao22twC9WP8isPUC2uf4BscA3JtagPEjb/K8=;
        b=08m091I889G8oyBzxhHicArBA9IuIROrllC3B95yiqxC7+r8/EraEcPtlxmfCANHuE
         K/PmOxqwQl0oDxuvarwPBPPJtIr9hr0khoatfYIlYmuBOO0W2r1Lbl2h8vCo/LAS/A1o
         14jgmFslFW5Lqr/B4IQrpJdkSGSoNR7hIbYsv/BtR6M4K+jm5TE6F3aCPPwOaJ18m17d
         3Vcb8LDQgVJD5Z6NIoO4lv0fFcBuH/Afyir1FpQYcx665Rsn0xvAbFcboJog+SRMC9dA
         IbXyXPA8ssV+xQLu20Y0IK+56p+Jw6VYutKXrZV+lfWE5bmfz51wOyBQivG7of0bq4NJ
         ntiw==
X-Gm-Message-State: AFqh2koW0yUVT6ztQ3oHOcS5p3u2Bz/l5s3TEQ6i/D333at3RqH01wku
        mdrbAzehlleQtOT7KN40LS111g==
X-Google-Smtp-Source: AMrXdXtGEMES32gcdxnGySUqv6iJYQ7w6NVQhQhaaxPQgQOeTtTxL/c7HRLz5P+bfxaReOQyLajJsg==
X-Received: by 2002:a17:906:c58:b0:78d:f456:1ed0 with SMTP id t24-20020a1709060c5800b0078df4561ed0mr30433841ejf.33.1674254059219;
        Fri, 20 Jan 2023 14:34:19 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id v10-20020a170906292a00b00782fbb7f5f7sm18544288ejd.113.2023.01.20.14.34.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 14:34:18 -0800 (PST)
Message-ID: <be8cd14f-98b4-0a98-a61a-3dfb4f6e7aa8@linaro.org>
Date:   Fri, 20 Jan 2023 23:34:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 0/8] clk: qcom: msm8996: add support for the CBF clock
Content-Language: en-US
To:     Simon Glass <sjg@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
 <CAPnjgZ3MQ4E_3n_Z881QsdO-zELPkLaCm0cOFwz6Fds+u73OWg@mail.gmail.com>
 <4f63a3e0-daeb-5b6a-f998-681502dd7abf@linaro.org>
 <CAPnjgZ1Cw51q=nHrqv5YOr4SFtZRWhgv_X=mSJ4vgAT9dJjvuQ@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAPnjgZ1Cw51q=nHrqv5YOr4SFtZRWhgv_X=mSJ4vgAT9dJjvuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.01.2023 23:22, Simon Glass wrote:
> Hi Dmitry,
> 
> On Fri, 20 Jan 2023 at 15:18, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On 20/01/2023 17:08, Simon Glass wrote:
>>> Hi Dmitry,
>>>
>>> On Thu, 19 Jan 2023 at 23:14, Dmitry Baryshkov
>>> <dmitry.baryshkov@linaro.org> wrote:
>>>>
>>>> On MSM8996 two CPU clusters are interconnected using the Core Bus
>>>> Fabric (CBF). In order for the CPU clusters to function properly, it
>>>> should be clocked following the core's frequencies to provide adequate
>>>> bandwidth. On the other hand the CBF's clock rate can be used by other
>>>> drivers (e.g. by the pending SPDM driver to provide input on the CPU
>>>> performance).
>>>>
>>>> Thus register CBF as a clock (required for CPU to boot) and add a tiny
>>>> interconnect layer on top of it to let cpufreq/opp scale the CBF clock.
>>>>
>>>> Dependencies: [1]
>>>>
>>>> [1] https://lore.kernel.org/linux-arm-msm/20230111191453.2509468-1-dmitry.baryshkov@linaro.org/
>>>>
>>>> Changes since v2:
>>>> - Added interconnect-related bindings
>>>> - Switched CPU and CBF clocks to RPM_SMD_XO_A_CLK_SRC
>>>>
>>>> Changes since v1:
>>>> - Relicensed schema to GPL-2.0 + BSD-2-Clause (Krzysztof)
>>>> - Changed clock driver to use parent_hws (Konrad)
>>>> - Fixed indentation in CBF clock driver (Konrad)
>>>> - Changed MODULE_LICENSE of CBF clock driver to GPL from GPL-v2
>>>> - Switched CBF to use RPM_SMD_XO_CLK_SRC as one of the parents
>>>> - Enabled RPM_SMD_XO_CLK_SRC on msm8996 platform and switch to it from
>>>>    RPM_SMD_BB_CLK1 clock
>>>>
>>>> Dmitry Baryshkov (8):
>>>>    dt-bindings: clock: qcom,msm8996-cbf: Describe the MSM8996 CBF clock
>>>>      controller
>>>>    dt-bindints: interconnect/msm8996-cbf: add defines to be used by CBF
>>>>    clk: qcom: add msm8996 Core Bus Framework (CBF) support
>>>>    clk: qcom: cbf-msm8996: scale CBF clock according to the CPUfreq
>>>>    clk: qcom: smd-rpm: provide RPM_SMD_XO_CLK_SRC on MSM8996 platform
>>>>    arm64: qcom: dts: msm8996 switch from RPM_SMD_BB_CLK1 to
>>>>      RPM_SMD_XO_CLK_SRC
>>>>    arm64: dts: qcom: msm8996: add CBF device entry
>>>>    arm64: dts: qcom: msm8996: scale CBF clock according to the CPUfreq
>>>>
>>>>   .../bindings/clock/qcom,msm8996-cbf.yaml      |  53 ++
>>>>   arch/arm64/boot/dts/qcom/msm8996.dtsi         |  72 ++-
>>>>   drivers/clk/qcom/Makefile                     |   2 +-
>>>>   drivers/clk/qcom/clk-cbf-8996.c               | 458 ++++++++++++++++++
>>>>   drivers/clk/qcom/clk-smd-rpm.c                |   2 +
>>>>   .../interconnect/qcom,msm8996-cbf.h           |  12 +
>>>>   6 files changed, 591 insertions(+), 8 deletions(-)
>>>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
>>>>   create mode 100644 drivers/clk/qcom/clk-cbf-8996.c
>>>>   create mode 100644 include/dt-bindings/interconnect/qcom,msm8996-cbf.h
>>>>
>>>> --
>>>> 2.39.0
>>>>
>>>
>>> Could you please tell me which dev board this is targeting and where I
>>> can get one?
>>
>> This is targeting db820c, which is available from arrow.com. Note, this
>> patchset is related only msm8996 aka Snapdragon 820, it has limited
>> applicability to msm8996-pro and is of no concern to most of other chipsets.
> 
> Thanks!
> 
>>
>>> Also could you please point me to the SoC documentation?
>>
>> https://developer.qualcomm.com/hardware/apq-8096sg/tools
> 
> Which doc has the register descriptions for I2C, etc.? I am not seeing it.
Not public.

Konrad
> 
> Regards,
> Simon
