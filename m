Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D6A4691D9A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 12:07:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231400AbjBJLHD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 06:07:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjBJLHC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 06:07:02 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D763A84D
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:06:59 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id n28-20020a05600c3b9c00b003ddca7a2bcbso3779460wms.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 03:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2WvpRgQ5G57ZVVIXe90HxYTqDFLqMAg8mVODJJIxPz0=;
        b=su5RrBm5J0w27beGGlwu3ZBRmemdAQK34dOchCFhr9NawV1+xxmVSRw3duJLVSUO8f
         EMAOVcgkaIo8vBAv67Lz2wxJORawdCNiycTazvv+rYxDt+u/F/e9g+bsox8Kd+cHBQZh
         rQJqZTSseabBUt79qwFOug1wcCEvqS8SBVzkGqA2hdKtb5RrqTxbSEiMkbVB71qyO5YZ
         Mo8L50D9typ9Q0vzgs6XYvJL0JZ3xogO0xPHIE0IdS5gh0TvAgvQXzigNJ9CZ6SqkQdf
         im0B2zmV0gnd4NmY1r/1OAe+GvZ7KmIRwrrLrg9ywrGj2gW859klqki1ziX/Ho8qZV36
         2NJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2WvpRgQ5G57ZVVIXe90HxYTqDFLqMAg8mVODJJIxPz0=;
        b=toTNzKnz7sEvHbATvzKD30VnlaoLltXaxpdsXVFkeoonFJJ1Z7eZCLE4ibuDJLhFJr
         CpnlELP8iJku3CIMC9k4x/on8BQlbnHK8tTcgqVMmqW8KVXHc3xllVwrBBqPX0zPnMmg
         PZ44/8y5RqH1Q4Z+YQB82gyJ0YYg6XWfnJULkisVkL6OqXRIyfyCw4mMNqlPPfZ6FLKk
         KF6/yVHjSqISDQ0KddCYzmrz4etBGpY7qqNu+an7ElDCt1+16RklKbEufu+qBqBnMaNJ
         zjntqMCcVTxKcnQ0RXgaKbE6mr9v2LFzPlSf6EW8PKoCtbYSHOeK7E1UWCFXyIC8wjhc
         9WWQ==
X-Gm-Message-State: AO0yUKUbCCDijfWlVQdBbzZowGem0PVoOd85gJs0qYKLjbbe9YhWsyXY
        bSThTaAswlVj0M/7Pw0BTWqhOg==
X-Google-Smtp-Source: AK7set9nxHUCh600t17pI1QTvig9xgZDV3bVQ1xlGacP+eH2UbMIBpJZA4xDZzI0iljFP0d/J4yhjA==
X-Received: by 2002:a05:600c:996:b0:3df:f85a:4724 with SMTP id w22-20020a05600c099600b003dff85a4724mr12562446wmp.39.1676027217663;
        Fri, 10 Feb 2023 03:06:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a65:5553:55cf:3027? ([2a01:e0a:982:cbb0:5a65:5553:55cf:3027])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c439300b003dd7edcc960sm4443046wmn.45.2023.02.10.03.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 03:06:56 -0800 (PST)
Message-ID: <076acc27-6a76-2e65-8f12-1e1e51d5a8ff@linaro.org>
Date:   Fri, 10 Feb 2023 12:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From:   neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: sm8350: enable GPU on the HDK
 board
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230209133839.762631-1-dmitry.baryshkov@linaro.org>
 <3fe5605e-de5a-53dc-0bf0-c6aff81f2453@linaro.org>
 <CAA8EJpoj3xepq032n1q2UmKGAk5k0q5DJPe15UcJz+tkrwNWNg@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAA8EJpoj3xepq032n1q2UmKGAk5k0q5DJPe15UcJz+tkrwNWNg@mail.gmail.com>
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

On 10/02/2023 11:32, Dmitry Baryshkov wrote:
> On Fri, 10 Feb 2023 at 10:29, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> On 09/02/2023 14:38, Dmitry Baryshkov wrote:
>>> Add A660 device to the Qualcomm SM8350 platform and enable it for the
>>> sm8350-hdk board. Unfortunately while adding the GPU & related devices I
>>> noticed that DT nodes on SM8350 are greatly out of the adress sorting
>>> order, so patches 2-4 reorder DT nodes to follow the agreement.
>>>
>>> Changes since v1:
>>> - Dropped merged patches
>>> - Expanded commit messages to mention the sort order (by the node
>>>     address)
>>> - Rebased on top of latest Bjorn's tree
>>
>> Can you specify which tree and commit ?
>>
>> I tried next-20230207, next-20230208 & next-20230209 and patch 2 doesn't apply.
> 
> It was crafted on top of Bjorn's tree and as such it applies on top of
> 20230210 without any issues.

Ack, will rebase my DP stuff on that,

Thanks,
Neil

> 
>>
>> On the 3 trees I have:
>> d7133d6d25fb arm64: dts: qcom: sm8350: use qcom,sm8350-dsi-ctrl compatibles
>> b904227a4b69 arm64: dts: qcom: sm8350: Hook up DSI1 to MDP
>> 2a07efb8c086 arm64: dts: qcom: sm8350: Add mdss_ prefix to DSIn out labels
>> e3e654ced376 arm64: dts: qcom: sm8350: Fix DSI PLL size
>> 45cd807de143 arm64: dts: qcom: sm8350: Fix DSI PHY compatibles
>> 0af6a4012b38 arm64: dts: qcom: sm8350: Feed DSI1 PHY clocks to DISPCC
>> 1eed7995d9da arm64: dts: qcom: sm8350: Fix DSI1 interrupt
>> 6636818ecf0f arm64: dts: qcom: sm8350: Add missing #address/size-cells to DSIn
>> f3c08ae6fea7 arm64: dts: qcom: sm8350: Pad addresses to 8 hex digits
>> 1ccad21aa996 Merge tag 'qcom-arm64-fixes-for-6.2' into arm64-for-6.3
>> ...
>>
>> Can you use --base in format-patch (or use b4 prep !) ?
>>
>> Thanks,
>> Neil
>>
>>>
>>> Changes since v1:
>>> - Fixed the subject and commit message for patch 1
>>> - Fixed GMU's clocks to follow the vendor kernel
>>> - Marked Adreno SMMU as dma-coherent
>>> - Dropped comments targeting sm8350 v1, we do not support that chip
>>>     revision.
>>>
>>> Dmitry Baryshkov (6):
>>>     dt-bindings: display/msm/gmu: add Adreno 660 support
>>>     arm64: dts: qcom: sm8350: reorder device nodes
>>>     arm64: dts: qcom: sm8350: move more nodes to correct place
>>>     arm64: dts: qcom: sm8350: finish reordering nodes
>>>     arm64: dts: qcom: sm8350: add GPU, GMU, GPU CC and SMMU nodes
>>>     arm64: dts: qcom: sm8350-hdk: enable GPU
>>>
>>>    .../devicetree/bindings/display/msm/gmu.yaml  |    1 +
>>>    arch/arm64/boot/dts/qcom/sm8350-hdk.dts       |    8 +
>>>    arch/arm64/boot/dts/qcom/sm8350.dtsi          | 2512 +++++++++--------
>>>    3 files changed, 1354 insertions(+), 1167 deletions(-)
>>>
>>
> 
> 

