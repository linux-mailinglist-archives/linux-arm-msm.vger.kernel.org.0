Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C9E06D50F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Apr 2023 20:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbjDCSsV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Apr 2023 14:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231532AbjDCSsS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Apr 2023 14:48:18 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E80B599
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Apr 2023 11:48:16 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id bx10so13058980ljb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Apr 2023 11:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680547695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IDz+HUlLbZXXXu1NnpMZx3KAzu0s2jW/AHr953aYTPI=;
        b=K7hBC9nZMTtUiVcgzieIDYheFQ1IjFnQtLzWQ5r61BjMkW448quJAgDlQUT84Idm+o
         yegRosuM0HmOAJU91u4yMy40LDmS1UkupDfHaES93M7pSOMdXszbvUmVqsBcPc7ba8uR
         DKHP0gtWHAUxyYuAZWMAy/So7p0OqNIJV3JI+/nlWtK5RPbXLgXQ/eGS8VMJMDOQcDDn
         bescXQtrfvLay3oN7xn/lMpqN75zcUBb+nYF9Co/iwrMclmSOfhDwBtIv9RqJzDP26z8
         3r5NWeqh95tns2fgzU9Ipe+8HSGRg5YLBoN4BVNxf+yY4KYTkgSt4jSlGWg1F9qwtQCz
         W8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680547695;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IDz+HUlLbZXXXu1NnpMZx3KAzu0s2jW/AHr953aYTPI=;
        b=GAUUEFNpf/Nx4sDj5uC2nmEZFt2EwdR11Y13llwb5W9gMRqXbZ0MDETbYMDaBqq+Xo
         b7sMNCd2ISm99eeOzYLQ4mbEtEdT1N+3QbWiduSsoHyKXZ5GJ1Z45TjAejMTxwfAOk/s
         DSeaKvrB9R0us6aaSsOD70vLOBCQyXXqmPeQldOizO6mf1TOZnS4H/59SmbotbPIPLTl
         R0XGea8p8Pg46sp+Ve2u+G/QixDHD65BPhbNab8LhBECyofCooloL2FTuDumWcXJbL3k
         iskZ512u9Iu9o5lba9YZpe85+4+A2aILkHhB5iL64k4CoNF/GaFGWNyAGaTrIg/AxhfO
         Btdg==
X-Gm-Message-State: AAQBX9c+muZCuiu8dsLy/3T5CpEtjkanJjyJbE+RK7fKd9T4OHpeikQb
        GkwNfuTe/7/LWjU14BTE4UOXXw==
X-Google-Smtp-Source: AKy350ZZ3ZodgcVIb0XUoVvNprrkZ82Qe8a0zZ980QF08LPsyjgNZ3+gQCtlwSz6UaT4+fkXyy1cKA==
X-Received: by 2002:a2e:9816:0:b0:29c:94c7:46c0 with SMTP id a22-20020a2e9816000000b0029c94c746c0mr174612ljj.5.1680547694933;
        Mon, 03 Apr 2023 11:48:14 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f25-20020a2e6a19000000b002a03f9ffecesm1865200ljc.89.2023.04.03.11.48.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 11:48:14 -0700 (PDT)
Message-ID: <f198ac6a-df12-9c08-55e8-f677acea8e2c@linaro.org>
Date:   Mon, 3 Apr 2023 21:48:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 00/38] drm/msm/dpu: rework HW catalog
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230330215324.1853304-1-dmitry.baryshkov@linaro.org>
 <b4972790-d990-063a-7ef4-2f05407357e8@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b4972790-d990-063a-7ef4-2f05407357e8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/04/2023 21:06, Abhinav Kumar wrote:
> 
> 
> On 3/30/2023 2:52 PM, Dmitry Baryshkov wrote:
>> This huge series attempts to restructure the DPU HW catalog into a
>> manageable and reviewable data set. In order to ease review and testing
>> I merged all the necessary fixes into this series. Also I cherry-picked
>> & slightly fixed Konrad's patch adding size to the SSPP and INTF macros.
>>
> 
> I had to first dig up some history about why dpu catalog grew so much in 
> the first place before starting this review. When the DPU driver first 
> landed (which pre-dates my work in upstream), it looks like it followed 
> mdp5 model from mdp5_cfg.c. But looks like as the number of chipsets 
> which use DPU kept growing, this is becoming a burden.
> 
> As everyone knows, downstream follows a devicetree model for the dpu 
> hardware and that should have always been the case. Perhaps in the last 
> 2-3 years more time could have been spent on standardizing the bindings 
> used for hw blocks in order to maintain a less hard-coded catalog file 
> and more in the device tree.

Unfortunately, this is not how the upstream DT works. If something is a 
constant hardware property, it should not go into the DT. So pushing 
catalog to dt would have been immediately frowned upon by Rob Herring or 
Krzysztof.

> Then the catalog would have just been a place to parse the device tree, 
> set the feature capability based on chipset (refer 
> _sde_hardware_pre_caps). That way offsets , number of blocks and the 
> blocks themselves still come from the device tree but perhaps some 
> specific features are at SOC level for which the catalog still stays.
> 
> That being said, I thought of different strategies even before the 
> review but two issues prevented me from suggesting those ideas (one of 
> which I am seeing even here , which I am going to suggest below and also 
> suggest why it wont work).
> 
> 1) For the same DPU major/minor version, some features might get dropped 
> or even get added with different SOCs as overall the system capabilities 
> might differ like number of SSPPs or memory footprint of the SOC etc.
> 
> So there is no good way right now to generalize any dpu catalog or to 
> tie it with a DPU major/minor version. We will have to stick with a 
> per-SOC model.

Up to now, the SoC was equal to major+minor. Could you please be more 
specific here, if there are any actual differences within major+minor 
families?

> 
> This is what led me to not pursue that route.
> 
> 2) For the same DPU major/minor version, even if core-DPU is same (in 
> terms of SSPP, DSPP etc), the number of interfaces can change. So again 
> no room to generalize same DPU hw version.

Again, I might be just scratching the surface, but I have not observed this.

> 
> 3) For the same reason as (1) and (2), I think the de-duplication 
> strategy used in this series is not correct. The idea of 
> dpu_hw_version_num_layer_mixer is just not scalable as I dont know how 
> many variants that will lead to. So it seems like just an attempt to 
> de-duplicate which perhaps works today for existing dpu chipsets in 
> upstream but by no means scalable. Lets go ahead with per-SOC catalog 
> file but lets live with some amount of duplication between them if we 
> really have to split it across header files.

Indeed, this leads to minor differences on top of major+lm. However, I 
think, the overall complexity is lowered.

Nevertheless, let's land the major set of patches and leave 
generalization for the later time. I think, with the addition of the 
next several platforms we will see the drill.

> I also thought of similar strategies to generalize like based on 
> sub-blocks similar to what you have done but all of these were NAKed 
> internally by folks who work on more chipsets / have more visibility 
> into the spread of features across chipsets.
> 
>> First 4 patches clean up the catalog a bit in order to make it more
>> suitable for refactoring.
>>
> 
> These are okay. I will address your follow-up questions about patch (1) 
> and lets land these.
> 
>> Then the next batch of 13 + 5 patches split the hw catalog entries into
>> per-SoC files.
>>
> 
> This part is also fine. But perhaps dont have dpu hw version in the 
> file. So just dpu_hw_sm8250.h or dpu_hw_sm8350.h etc.

Having a version makes it easier to compare chipsets (and also to verify 
that feature masks are correct), so I'd like to retain it.

> 
>> Next 9 patches rework catalog entries, mostly targeting deduplication of
>> data used by several platforms. At this moment only three pairs (out of
>> 13 devices supported by DPU) are merged. However this part lays out the
>> ground to ease adding support for new platforms, some of which use the
>> same configuration as the existing platforms
>>
> 
> This is the part I suggest we drop.
> 
>> Last batch of 7 patches renames existing macros to ease using them while
>> adding support for new devices.
>>
> 
> I have to check this part but perhaps after re-basing based on my 
> earlier comment.

Ack, I'll see what I can drop and what is going to be there.

Up to now there were some natural shares, like sm8150 vs sc8180x and 
qcm2290 vs sm6115. Do you think we should populate the missing parts by 
duplicate the data?

> 
>> This pile of patches is submitted in a single batch to allow one to
>> observe the final goal of the cleanup which otherwise might be hard to
>> assess.
>>
>>
>> Changes since v2:
>> - Fixed sc8280xp SSPP size to 0x2ac
>> - Rebased on top of msm-next-lumag, dropped merged patches
>>
>> Changes since v1:
>> - Picked up Konrad's patch
>> - Picked up dependencies into the main series
>> - Moved qseed3lite vs qseed4 patches into the fixes part
>> - Fixed sm6115 in a similar manner.
>>
>> Dmitry Baryshkov (37):
>>    drm/msm/dpu: constify DSC data structures
>>    drm/msm/dpu: mark remaining pp data as const
>>    drm/msm/dpu: move UBWC/memory configuration to separate struct
>>    drm/msm/dpu: split SM8550 catalog entry to the separate file
>>    drm/msm/dpu: split SM8450 catalog entry to the separate file
>>    drm/msm/dpu: split SC8280XP catalog entry to the separate file
>>    drm/msm/dpu: split SC7280 catalog entry to the separate file
>>    drm/msm/dpu: split SM8350 catalog entry to the separate file
>>    drm/msm/dpu: split SM6115 catalog entry to the separate file
>>    drm/msm/dpu: split QCM2290 catalog entry to the separate file
>>    drm/msm/dpu: split SC7180 catalog entry to the separate file
>>    drm/msm/dpu: split SM8250 catalog entry to the separate file
>>    drm/msm/dpu: split SC8180X catalog entry to the separate file
>>    drm/msm/dpu: split SM8150 catalog entry to the separate file
>>    drm/msm/dpu: split MSM8998 catalog entry to the separate file
>>    drm/msm/dpu: split SDM845 catalog entry to the separate file
>>    drm/msm/dpu: duplicate sdm845 catalog entries
>>    drm/msm/dpu: duplicate sc7180 catalog entries
>>    drm/msm/dpu: duplicate sm8150 catalog entries
>>    drm/msm/dpu: duplicate sm8250 catalog entries
>>    drm/msm/dpu: duplicate sm8350 catalog entries
>>    drm/msm/dpu: use defined symbol for sc8280xp's maxwidth
>>    drm/msm/dpu: catalog: add comments regarding DPU_CTL_SPLIT_DISPLAY
>>    drm/msm/dpu: enable DPU_CTL_SPLIT_DISPLAY for sc8280xp
>>    drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
>>    drm/msm/dpu: drop duplicate vig_sblk instances
>>    drm/msm/dpu: enable DSPP on sc8180x
>>    drm/msm/dpu: deduplicate sc8180x with sm8150
>>    drm/msm/dpu: deduplicate sm6115 with qcm2290
>>    drm/msm/dpu: deduplicate sc8280xp with sm8450
>>    drm/msm/dpu: drop unused macros from hw catalog
>>    drm/msm/dpu: inline IRQ_n_MASK defines
>>    drm/msm/dpu: rename INTF_foo_MASK to contain major DPU version
>>    drm/msm/dpu: rename CTL_foo_MASK to contain major DPU version
>>    drm/msm/dpu: rename VIG and DMA_foo_MASK to contain major DPU version
>>    drm/msm/dpu: rename MIXER_foo_MASK to contain major DPU version
>>    drm/msm/dpu: rename MERGE_3D_foo_MASK to contain major DPU version
>>
>> Konrad Dybcio (1):
>>    drm/msm/dpu: Allow variable SSPP/INTF_BLK size
>>
>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  210 ++
>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  210 ++
>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |   97 +
>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |   91 +
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h |  152 ++
>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  244 ++
>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  151 ++
>>   .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   91 +
>>   .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   83 +
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h |   53 +
>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  226 ++
>>   .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  158 ++
>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  136 ++
>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  142 ++
>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h |   99 +
>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  209 ++
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 2175 +----------------
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   37 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |    4 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   18 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |    4 +-
>>   21 files changed, 2443 insertions(+), 2147 deletions(-)
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_lm6.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_lm1.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
>>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_lm6.h
>>   create mode 100644 
>> drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>

-- 
With best wishes
Dmitry

