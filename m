Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 065056D02D6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 13:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229795AbjC3LRa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 07:17:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbjC3LQn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 07:16:43 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F5EC86AF
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:16:26 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id x17so24047861lfu.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 04:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680174984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AvPpycTH0teP/o/yiSVYv5EBd+TMZKQ2Wu3+Pfy2MvI=;
        b=hMykP36fZXaGKqejZgr8S0OsNxQAXnDsPEQwjYmqJSgpvK7FFle6tk5uq81GeaPzos
         bJb1plu7gLJXV0trB7lTAlO/giOMdK0oqc/XkkzY3GHRtII5QLtyCJ8WBSWUlkPmr71f
         FQamm3VWzbNGeoQ7cb77/7WEB0YPHKBRs2j7SR21HrEbkALkvZ6HX+vsM+eRcGVAKgkg
         MVrP02SxY1Rnw/DfNwLvZk5iXGVWQd/2q0DWupeizuBrcBG5SJPgisB9zcZY0Z/zpXf3
         0pJk4DZc0f6INNCnGMYMAn9l7IxFrJ+gPSUPLUBLFX+LsbaWiJncCnyTAWY5Vm4cCLTd
         5hJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680174984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AvPpycTH0teP/o/yiSVYv5EBd+TMZKQ2Wu3+Pfy2MvI=;
        b=aW8AdG/Q+OYtK8cD7Rn5BHoh9g27iguK8rkii6UtvwzuZlM3jk/3i8AWssqNlpjcxg
         uH50gwIcHkEVqasFKx8kSqFV3EME5L9y+dFpskx5rqb6Od63g+B7G61bAcXcwsQRRbaX
         metW6gd1v6L0hv1xZSi1hYMh0Jx2aqh7VWCzb2UiftVb+1ifI2fFr5xJaQ9c9JyXnKfJ
         Y6HyDJ4gHizTjTbFpdiXqdghanVzTsHGR1X17sq7rkHP+xbx7Y5zQw8cRyxyNHv1g2t1
         DchwcjAJzwY07ISJAfwnfOgeb7btQCe+FuGFRT56+51HsdXicwBD+o8EmcDghE/f/Osi
         PA9A==
X-Gm-Message-State: AAQBX9fTv2rxwWHYIX3kZHxKY63gfPKp0tPwWGX3BhidrVkI1icyXK5Z
        QfMgwzKF0ou1cBG+JWOg23oYmA==
X-Google-Smtp-Source: AKy350b5Qny8LE4rfSokRluKR6HDNxQ4b/QKJKVkd7r9M+RB0/d+uZpV22KifhPV3hCrtEtrXeOEag==
X-Received: by 2002:ac2:4911:0:b0:4e9:cfd2:e19 with SMTP id n17-20020ac24911000000b004e9cfd20e19mr7251121lfi.20.1680174984603;
        Thu, 30 Mar 2023 04:16:24 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id q4-20020ac25284000000b004e1b880ba20sm5842840lfm.292.2023.03.30.04.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 04:16:24 -0700 (PDT)
Message-ID: <9ff4fc88-f4bc-3e05-cad9-176449d7258d@linaro.org>
Date:   Thu, 30 Mar 2023 13:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/3] drm/msm/a5xx: scale MX following the frequency
 changes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <b9b1ae11-d9cf-0139-41d0-5af4ff2c8e6b@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <b9b1ae11-d9cf-0139-41d0-5af4ff2c8e6b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 30.03.2023 13:15, Dmitry Baryshkov wrote:
> On 30/03/2023 14:06, Konrad Dybcio wrote:
>>
>>
>> On 30.03.2023 00:24, Dmitry Baryshkov wrote:
>>> Konrad brought up the topic of scaling the MX domain according to the
>>> OPP changes. Here is my RFC for this functionality. I post it as an RFC
>>> for two reasons:
>>>
>>> 1) I'm not sure that we should scale MX if we are not scaling main
>>> voltage following the CPR3
>> It should be ok, however..
>>>
>> [...]
>>
>>> Dmitry Baryshkov (3):
>>>    dt-bindings: display/msm/gpu: allow specifying MX domain A5xx
>>>    drm/msm/a5xx: scale MX domain following the frequncy changes
>> This is a stopgap solution, CPR is a child of MX.
> 
> Not so sure here. Vendor kernel scales voltages and MX levels separately. Moreover, please correct me if I'm wrong here, the kernel doesn't scale VDD_GFX directly. It programs GPMU's voltage table and then GPMU handles voltage scaling according to performance levels being set. MX is handled in parallel to switching GPMU's level.
> 
> I have implemented this voltage scaling locally, just need to run more tests before posting (and unfortunately it depends either on CPR3+GFX or on programming the voltages manually).
Oh no.. I forgot about the ugly goblin that we call GPMU.. I'll have
to dig into it further. Thanks for reminding me..

Konrad
> 
>>
>> Konrad
>>>    arm64: dts: qcom: specify power domains for the GPU
>>>
>>>   .../devicetree/bindings/display/msm/gpu.yaml  |  9 +++-
>>>   arch/arm64/boot/dts/qcom/msm8996.dtsi         | 14 ++++-
>>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.c         | 52 +++++++++++++++++++
>>>   drivers/gpu/drm/msm/adreno/a5xx_gpu.h         |  3 ++
>>>   4 files changed, 76 insertions(+), 2 deletions(-)
>>>
> 
