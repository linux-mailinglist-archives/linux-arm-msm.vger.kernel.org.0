Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2769367600F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 23:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjATWSz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 17:18:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjATWSz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 17:18:55 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2372C3645D
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 14:18:52 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id y18so6951277ljk.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jan 2023 14:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9gQD61OGGTubQxWy+NXmqIcQ0J1mX7TCnjndDCs+TWo=;
        b=X+odKIujo3mTshv/mtiNDlUoFhKSPscVWhsk5Vn957Bjx3ew63zAcZ6L2YqufYdrwf
         q6/0xxk1O+XJLLVEtpk7UgRAlJvgbcb1NJFtPZigzSL+dajkfpqEDklqXkvKJ0wFqdPI
         Qsrci+NczErWgU90IsD4t3QuV/XlFSzEMbrDXC14UqlRe7GAUBrEA+lufuWSdYrEIPpg
         IFRixtSyG/NcIz3iyufqTfPmdfNaYYFwjWmP1AEZelkH0IXSh1O1SAD82G+aMDe3vDj3
         2/4D+mlbgPs/HSD5Gg1voGTRA6nk5npbIYOxhmOT5xKVigse4tX0n/5muwj5psaM5Z+E
         xZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9gQD61OGGTubQxWy+NXmqIcQ0J1mX7TCnjndDCs+TWo=;
        b=z2Oa7+SDvN1PJsVI5+Iy0AXxkDyvCFP2gDo7RONpUJVdUZrODkKqjF3q0GNJtnq++e
         ZmUUvA6nk5Ob2G7Q1Y1I8YKUP5uKjEqp6fTD3xle5XWVSDR4tqBvwSctwH+YYnTB6VCo
         0Kc3cH6L0EVzC+DM/v0ypTIn3jKtZw4WPGzBHR0/13MHtw5+rPW8AMNYt3Q7RuIjg7IE
         0dKTYXAeYsYf4wnvK/FcblwSFtoqXge1Kr4KIh1qfaDHiYxTP/fTJyaI9AyLsFsw5Dk3
         TwHh32CCOyNtoGNWT6FWGtPjTas44BXFuDxLyYGZpgQJ3kol9NRiv7YlhCn0h+ZWD8vd
         IByg==
X-Gm-Message-State: AFqh2krrXUTwoff8foCY+8hv+NqM6BDOKbGtrfZ1ISUIgHsubj9KsB4u
        9dae2PFTL+sjVgUeWxo3g1PxXQ==
X-Google-Smtp-Source: AMrXdXuzxeAS+3ikntIXui271IM9NqkbXyD0f3h3kgmTAbHsxHvJVjjj1kYhpa9NXG1Jl4OmPPh82Q==
X-Received: by 2002:a2e:93cc:0:b0:27f:20e4:698f with SMTP id p12-20020a2e93cc000000b0027f20e4698fmr4239488ljh.19.1674253130453;
        Fri, 20 Jan 2023 14:18:50 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bf25-20020a2eaa19000000b0028b9b8b459dsm1022942ljb.116.2023.01.20.14.18.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 14:18:49 -0800 (PST)
Message-ID: <4f63a3e0-daeb-5b6a-f998-681502dd7abf@linaro.org>
Date:   Sat, 21 Jan 2023 00:18:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 0/8] clk: qcom: msm8996: add support for the CBF clock
Content-Language: en-GB
To:     Simon Glass <sjg@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230120061417.2623751-1-dmitry.baryshkov@linaro.org>
 <CAPnjgZ3MQ4E_3n_Z881QsdO-zELPkLaCm0cOFwz6Fds+u73OWg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAPnjgZ3MQ4E_3n_Z881QsdO-zELPkLaCm0cOFwz6Fds+u73OWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/01/2023 17:08, Simon Glass wrote:
> Hi Dmitry,
> 
> On Thu, 19 Jan 2023 at 23:14, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On MSM8996 two CPU clusters are interconnected using the Core Bus
>> Fabric (CBF). In order for the CPU clusters to function properly, it
>> should be clocked following the core's frequencies to provide adequate
>> bandwidth. On the other hand the CBF's clock rate can be used by other
>> drivers (e.g. by the pending SPDM driver to provide input on the CPU
>> performance).
>>
>> Thus register CBF as a clock (required for CPU to boot) and add a tiny
>> interconnect layer on top of it to let cpufreq/opp scale the CBF clock.
>>
>> Dependencies: [1]
>>
>> [1] https://lore.kernel.org/linux-arm-msm/20230111191453.2509468-1-dmitry.baryshkov@linaro.org/
>>
>> Changes since v2:
>> - Added interconnect-related bindings
>> - Switched CPU and CBF clocks to RPM_SMD_XO_A_CLK_SRC
>>
>> Changes since v1:
>> - Relicensed schema to GPL-2.0 + BSD-2-Clause (Krzysztof)
>> - Changed clock driver to use parent_hws (Konrad)
>> - Fixed indentation in CBF clock driver (Konrad)
>> - Changed MODULE_LICENSE of CBF clock driver to GPL from GPL-v2
>> - Switched CBF to use RPM_SMD_XO_CLK_SRC as one of the parents
>> - Enabled RPM_SMD_XO_CLK_SRC on msm8996 platform and switch to it from
>>    RPM_SMD_BB_CLK1 clock
>>
>> Dmitry Baryshkov (8):
>>    dt-bindings: clock: qcom,msm8996-cbf: Describe the MSM8996 CBF clock
>>      controller
>>    dt-bindints: interconnect/msm8996-cbf: add defines to be used by CBF
>>    clk: qcom: add msm8996 Core Bus Framework (CBF) support
>>    clk: qcom: cbf-msm8996: scale CBF clock according to the CPUfreq
>>    clk: qcom: smd-rpm: provide RPM_SMD_XO_CLK_SRC on MSM8996 platform
>>    arm64: qcom: dts: msm8996 switch from RPM_SMD_BB_CLK1 to
>>      RPM_SMD_XO_CLK_SRC
>>    arm64: dts: qcom: msm8996: add CBF device entry
>>    arm64: dts: qcom: msm8996: scale CBF clock according to the CPUfreq
>>
>>   .../bindings/clock/qcom,msm8996-cbf.yaml      |  53 ++
>>   arch/arm64/boot/dts/qcom/msm8996.dtsi         |  72 ++-
>>   drivers/clk/qcom/Makefile                     |   2 +-
>>   drivers/clk/qcom/clk-cbf-8996.c               | 458 ++++++++++++++++++
>>   drivers/clk/qcom/clk-smd-rpm.c                |   2 +
>>   .../interconnect/qcom,msm8996-cbf.h           |  12 +
>>   6 files changed, 591 insertions(+), 8 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
>>   create mode 100644 drivers/clk/qcom/clk-cbf-8996.c
>>   create mode 100644 include/dt-bindings/interconnect/qcom,msm8996-cbf.h
>>
>> --
>> 2.39.0
>>
> 
> Could you please tell me which dev board this is targeting and where I
> can get one?

This is targeting db820c, which is available from arrow.com. Note, this 
patchset is related only msm8996 aka Snapdragon 820, it has limited 
applicability to msm8996-pro and is of no concern to most of other chipsets.

> Also could you please point me to the SoC documentation?

https://developer.qualcomm.com/hardware/apq-8096sg/tools

> 
> Thanks,
> Simon

-- 
With best wishes
Dmitry

