Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5C4E6D02BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 13:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231564AbjC3LPd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 07:15:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbjC3LPb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 07:15:31 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3315128
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:15:28 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id br6so23993548lfb.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680174927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYjmpU57KwSPL7/p6FbubpWHhlYWml1cxHdUtgHJtpY=;
        b=OG/0oL5NrGs1hPay9BrfioBavscaJ6lnEdGD4s+LPkJMbu12d+Omx9FEJbv0bAgsgG
         kevBmj/wQw8fxQbrqnjWALHiUVVywAWrxTIz/fL12dzyzXpXIT7rj7cLCr0q9NkPJBmQ
         0jARXw3WNJlU15nzHEK/fFHH2km6Tk3SaHSTGbo2mgFYzkULH5fYQodbnvDzchVu0n+H
         5/cGRRxwVccmA0eORS4p1tlevjT1aV7AR5rhtT1utyC97gWrtdsXkXvONlRlUHr7B6k0
         KWjXNXxeYY2GH7Z1vu7HCm8wLSkbP4HxIZA1AQyHSlkhF7guuTCBohdKvTgscGBqoWUh
         eAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680174927;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYjmpU57KwSPL7/p6FbubpWHhlYWml1cxHdUtgHJtpY=;
        b=bAVy8A0LMZYwYGh2w4V5Hlcli4rGHFn/+X1OqW7QjJont0qc2EUf2KnkJ/RDWDJt7A
         7++h2jC3+8AltVOVOhU48yVbinsWttPzBl6U7xdgp+5wy/dOBNLyRzSMwzZVw9kYghcj
         JTw37h9e7f1QiGEbdgUdsTT8vrx0dP0o8Kmk8W5Rg/0QIOmPN5yuoeAV3D4zbEIam1ib
         6RtOFs1VTvIbU2baol+2+Su940VjJjCJNQAGl02N9ASJnTk/xZtUfz1XUOO0CpFCoevB
         xis7aOq7ipoq3iacvt6BbblkC6Sds/G2L446n9dtls+fpQdgu8ncR0UTxbSTzC1PQBVL
         SN9A==
X-Gm-Message-State: AAQBX9f3XZoOTgM7KYywGPC2u1Fpq+ChtCjQqZW4d+3eq8mnAcM83ugu
        OwfscOdHDwJcXc3ebPfPJQDjfg==
X-Google-Smtp-Source: AKy350Z6D+a9FxYWdjXymFvnpWjMSF6gMpDhe7WwnImx2kAaP03PPHN0bMIrBKrBKLaNUF+2lrkA5A==
X-Received: by 2002:a05:6512:523:b0:4db:1a0a:39cc with SMTP id o3-20020a056512052300b004db1a0a39ccmr1801299lfc.5.1680174926837;
        Thu, 30 Mar 2023 04:15:26 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d8-20020ac241c8000000b004cb14fa604csm5815652lfi.262.2023.03.30.04.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 04:15:26 -0700 (PDT)
Message-ID: <b9b1ae11-d9cf-0139-41d0-5af4ff2c8e6b@linaro.org>
Date:   Thu, 30 Mar 2023 14:15:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/3] drm/msm/a5xx: scale MX following the frequency
 changes
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230329222500.1131836-1-dmitry.baryshkov@linaro.org>
 <34470797-493c-d99b-4d0c-0f9381c5b7c1@linaro.org>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <34470797-493c-d99b-4d0c-0f9381c5b7c1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/03/2023 14:06, Konrad Dybcio wrote:
> 
> 
> On 30.03.2023 00:24, Dmitry Baryshkov wrote:
>> Konrad brought up the topic of scaling the MX domain according to the
>> OPP changes. Here is my RFC for this functionality. I post it as an RFC
>> for two reasons:
>>
>> 1) I'm not sure that we should scale MX if we are not scaling main
>> voltage following the CPR3
> It should be ok, however..
>>
> [...]
> 
>> Dmitry Baryshkov (3):
>>    dt-bindings: display/msm/gpu: allow specifying MX domain A5xx
>>    drm/msm/a5xx: scale MX domain following the frequncy changes
> This is a stopgap solution, CPR is a child of MX.

Not so sure here. Vendor kernel scales voltages and MX levels 
separately. Moreover, please correct me if I'm wrong here, the kernel 
doesn't scale VDD_GFX directly. It programs GPMU's voltage table and 
then GPMU handles voltage scaling according to performance levels being 
set. MX is handled in parallel to switching GPMU's level.

I have implemented this voltage scaling locally, just need to run more 
tests before posting (and unfortunately it depends either on CPR3+GFX or 
on programming the voltages manually).

> 
> Konrad
>>    arm64: dts: qcom: specify power domains for the GPU
>>
>>   .../devicetree/bindings/display/msm/gpu.yaml  |  9 +++-
>>   arch/arm64/boot/dts/qcom/msm8996.dtsi         | 14 ++++-
>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 52 +++++++++++++++++++
>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.h         |  3 ++
>>   4 files changed, 76 insertions(+), 2 deletions(-)
>>

-- 
With best wishes
Dmitry

