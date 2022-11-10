Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A058B624BB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 21:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbiKJUVX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 15:21:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbiKJUVP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 15:21:15 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B8419013
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 12:21:10 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id u2so2242623ljl.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 12:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RE1ZPfOOMkFTJRsPaLh2a/8p9Ky7brLI2mjtWUnhvIU=;
        b=ZLbRJjSDhoU17vkT0JEuuvPOmTbk4IoXMGZIvXZ8p8FHI55PUrqBVTmkTfbYJ6+7Rz
         2pXIRKfXZtYrUgDDp1mxDGiyYxOQRt6Dov61UIrPUYGHB2WwEUAO+i8NSYkDFzOQu7hz
         aTLCom2m2CxW5qSWrP30eIz/U6tvb07lw/WUlQXV1/Gy7iSXKiHhZoSp3U5RuqZx2Odv
         zK8v5+SEKj1Qrl5QHN7H0jJ/Sx2g0u7ZWyP2Y1gpAb8AmsD7/CwCNWVj6/tykv8WbH3B
         12zzuXeWM6PR+YVJf/KkAmBkEk7Xyc9OLUCndyvvbwc+Iq+PO/6Vj6GvHK1owWOF68D3
         AiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RE1ZPfOOMkFTJRsPaLh2a/8p9Ky7brLI2mjtWUnhvIU=;
        b=r5mZH5GGg0B2cQLlfL5t7NOf/Nv4M57qcQ0PfJHs7GV9iVmuy0vYhEhuKwB6CMJEzS
         aOzyhbJpn5ARslJjfyks3vLF1xetwi+7yYOPDumAScqbK8SOhlid+vz7rF2eKsW90z1b
         YFfGT7NBl5furUpBIVMRy4Vgt8EQfW1hvFojZ0rBtGVixBlevw/1AeDa8uqinh/51HUJ
         4mS+ToCRF4Qs4vC1maendRI7zs8Ff1H8BLXIqIzrbHVQ1W8zXtB+0HASk91Y+sxJC60K
         CcbXbNk36WtVBmIPeLAzdWEZVA7W7D28W7MiaDw3uI+rbS1C8xI3r5F9G6C0tmfWF4aZ
         Plpg==
X-Gm-Message-State: ACrzQf1MmB77mng8tFGsYthN8fJUdpRELKlzRo8ZTGM5znaFope/nOsJ
        BW20ZJJxQJZ/jySvajXv+frQaw==
X-Google-Smtp-Source: AMsMyM4sMRnEHSTwff8SGR2Q6I/T5vMDqoKpIMchh+5/G9OopKUdfo2OKHM9bAkUgMEiwowd3KUpsg==
X-Received: by 2002:a2e:9899:0:b0:277:8144:2eb6 with SMTP id b25-20020a2e9899000000b0027781442eb6mr8265779ljj.45.1668111668640;
        Thu, 10 Nov 2022 12:21:08 -0800 (PST)
Received: from [192.168.1.112] (95.49.32.193.neoplus.adsl.tpnet.pl. [95.49.32.193])
        by smtp.gmail.com with ESMTPSA id q21-20020a056512211500b004b3c505a71dsm10679lfr.92.2022.11.10.12.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 12:21:08 -0800 (PST)
Message-ID: <52fa0ebd-e431-7159-ef1e-a2cde7c7a4e2@linaro.org>
Date:   Thu, 10 Nov 2022 21:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v3 6/8] drm/msm/dpu: add support for MDP_TOP blackhole
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
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-7-dmitry.baryshkov@linaro.org>
 <b222a21c-a00f-8806-179c-f97bcb45c303@somainline.org>
 <5c791922-1371-c9e7-4bdc-e1909956633f@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <5c791922-1371-c9e7-4bdc-e1909956633f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/11/2022 21:19, Dmitry Baryshkov wrote:
> On 04/11/2022 16:58, Konrad Dybcio wrote:
>>
>> On 04/11/2022 14:03, Dmitry Baryshkov wrote:
>>> On sm8450 a register block was removed from MDP TOP. Accessing it during
>>> snapshotting results in NoC errors / immediate reboot. Skip accessing
>>> these registers during snapshot.
>>
>> Must have been fun to debug..
>>
>>
>>>
>>> Tested-by: Vinod Koul <vkoul@kernel.org>
>>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
>>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> index 38aa38ab1568..4730f8268f2a 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>> @@ -92,6 +92,7 @@ enum {
>>>       DPU_MDP_UBWC_1_0,
>>>       DPU_MDP_UBWC_1_5,
>>>       DPU_MDP_AUDIO_SELECT,
>>> +    DPU_MDP_PERIPH_0_REMOVED,
>>>       DPU_MDP_MAX
>>>   };
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> index f3660cd14f4f..95d8765c1c53 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>> @@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct 
>>> msm_disp_state *disp_state, struct msm_k
>>>           msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>>>                   dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>>> -    msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>>> -            dpu_kms->mmio + cat->mdp[0].base, "top");
>>> +    if (dpu_kms->hw_mdp->caps->features & 
>>> BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>>> +        msm_disp_snapshot_add_block(disp_state, 0x380,
>>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 
>>> 0x3a8,
>>> +                dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
>>
>> Are these values expected to stay the same on different new-gen SoCs? 
>> Maybe it would
>>
>> be worth making it dynamic.
> 
> I do not want to overcomplicate this. Let's make it dynamic once there 
> is need for that. For now I expect this will be static.
Let's roll with that.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
>>
>>
>> Konrad
>>
>>> +    } else {
>>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>>> +    }
>>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>>   }
> 
