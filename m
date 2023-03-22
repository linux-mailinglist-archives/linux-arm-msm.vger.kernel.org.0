Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 059986C450C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 09:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbjCVIfG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Mar 2023 04:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbjCVIew (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Mar 2023 04:34:52 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D78A53B21A
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 01:34:50 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id a11so7544924lji.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Mar 2023 01:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679474089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U58SQGAdB8WZgcTHG2Lfm70EP6ZtZM71YzBDDEdpTSc=;
        b=R/BVpWHxX1lMprKKvnlFrPRzGgs5Qf3AUJYCzO0arLRbK4GZtrvmsWaBx1R2jzQTfh
         gtCXetN6xxRFENuzL+7QszCpDpz1Kk4PGsFAbrN0cVV4zWTd4jlYccQ8fP8d6xq/qquQ
         MfD6YBkQOTLWxtxW1Jh4+6LXmZXcp+Rgdt7nelYsOBXncd+fcqLyW4TGpTSTqRKOdFof
         Z3LpfVGsbjQxj703MYcy2Sgntm/c9G21lioHnM6Ey8aPXbqMcCDvW95GiJKVNvfQTm4Q
         dVim8DLIwqVunke1dh7XzXcCQ2LHV4fde8d+z1lm9U2VSoMAk81+gZgMjpp83lStU+Ds
         +FqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679474089;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U58SQGAdB8WZgcTHG2Lfm70EP6ZtZM71YzBDDEdpTSc=;
        b=fHt5P7ewbo/w1LNQghy1B0Yj73ecDepZzjYiQv3M3GWnb+XMQFDLHx9x52dXjRsRO6
         noUP5t2+/Q0sWU3d2C5xoaY3wVGOrtq+LVdZSEinTZIaNOhnd3q2OD26nwh2XuEsxxxs
         YZ9C/pO3rEY3AHTX4Cn30YGNPOfH4kJUFp29kLgndwxHT6RGfAkkSoL3RH3M9PA+Lzl0
         wtWg6GwFWlMlX5MZYecX3RWmLrlHaWe8kfl81PvyTyr5yEcK1nwPmiFEJQ7q/IBoud66
         7T/B+FqSLR0kxAqWabtpD1mwNhc/VT2+U31uWWGhM5MGZ3glIpOYy0HlHElCqozc2ljm
         vI2w==
X-Gm-Message-State: AO0yUKVLcLWeopJeUtQZSJCTYx95UKT7k6LHgbV992+bzsyHf5YmTcga
        oW5HzuK5hSJngUFVkj1z19uE+g==
X-Google-Smtp-Source: AK7set8A3jBP6Uv2xqAXq8eF3WXNWxl0CTW0wfvZOq126nqhhSgtxnWkZYplG2AuUcfmhQ55S9dyEg==
X-Received: by 2002:a2e:9c84:0:b0:298:97d7:8fc3 with SMTP id x4-20020a2e9c84000000b0029897d78fc3mr1881970lji.4.1679474089137;
        Wed, 22 Mar 2023 01:34:49 -0700 (PDT)
Received: from [192.168.1.101] (abym238.neoplus.adsl.tpnet.pl. [83.9.32.238])
        by smtp.gmail.com with ESMTPSA id a17-20020a2eb171000000b0029bcfada416sm1918799ljm.138.2023.03.22.01.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 01:34:48 -0700 (PDT)
Message-ID: <e121d58d-831a-f593-b933-5177d3d26c43@linaro.org>
Date:   Wed, 22 Mar 2023 09:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 0/5] arm64: dts: qcom: Enable Crypto Engine for a few
 Qualcomm SoCs
Content-Language: en-US
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        andersson@kernel.org, bhupesh.linux@gmail.com,
        krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        vladimir.zapolskiy@linaro.org, rfoss@kernel.org
References: <20230321190118.3327360-1-bhupesh.sharma@linaro.org>
 <41111f93-ef02-0e57-98af-01327213d854@linaro.org>
 <CAH=2NtziWx2g_4K92iH+9DLo8XV0P32NNnEpxy6f0G_dQOVs+Q@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAH=2NtziWx2g_4K92iH+9DLo8XV0P32NNnEpxy6f0G_dQOVs+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 22.03.2023 09:33, Bhupesh Sharma wrote:
> On Wed, 22 Mar 2023 at 00:57, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 21.03.2023 20:01, Bhupesh Sharma wrote:
>>> This patchset enables Crypto Engine support for Qualcomm SoCs like
>>> SM6115, SM8150, SM8250 and SM8350.
>>>
>>> While at it, also fix the compatible string for BAM DMA engine
>>> used in sdm845.dtsi
>>>
>>> Note that:
>>> - SM8250 crypto engine patch utilizes the work already done by myself and
>>>   Vladimir.
>>> - SM8350 crypto engine patch utilizes the work already done by Robert.
>>>
>>> This patchset depends on the dt-bindings patch which added support for
>>> SM6115 and QCS2290 SoCs:
>>> https://lore.kernel.org/linux-arm-msm/20230321184811.3325725-1-bhupesh.sharma@linaro.org/
>> You could have included that one here for easier tracking!
> 
> Err.. the dt-binding maintainers have been asking to split the
> dt-binding patches from
> the dts ones in the past.
Quite the opposite!

So, let's stick to that for now :)


Konrad
> 
> Thanks.
> 
>>> Also this patchset is rebased on linux-next/master.
>>>
>>> Bhupesh Sharma (5):
>>>   arm64: dts: qcom: sdm845: Fix the BAM DMA engine compatible string
>>>   arm64: dts: qcom: sm6115: Add Crypto Engine support
>>>   arm64: dts: qcom: sm8150: Add Crypto Engine support
>>>   arm64: dts: qcom: sm8250: Add Crypto Engine support
>>>   arm64: dts: qcom: sm8350: Add Crypto Engine support
>>>
>>>  arch/arm64/boot/dts/qcom/sdm845.dtsi |  2 +-
>>>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 26 ++++++++++++++++++++++++++
>>>  arch/arm64/boot/dts/qcom/sm8150.dtsi | 26 ++++++++++++++++++++++++++
>>>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 26 ++++++++++++++++++++++++++
>>>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 26 ++++++++++++++++++++++++++
>>>  5 files changed, 105 insertions(+), 1 deletion(-)
>>>
