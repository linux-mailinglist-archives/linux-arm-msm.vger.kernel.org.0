Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B80526A2A77
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Feb 2023 16:24:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjBYPX6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Feb 2023 10:23:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbjBYPX6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Feb 2023 10:23:58 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC441025A
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Feb 2023 07:23:55 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id h9so2057690ljq.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Feb 2023 07:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7tQ1ST2oRQj+11XFxhKGSWtAX7uC5DKCH9y9cgns8vg=;
        b=t50/VunBH/Ra4WnvtmJ5BjZx1pYG5qm0vKuzJRTZtBCfIM+RiMiCUtTd+K97t/qZoS
         0sfIHUljNLRtYEpPJWu5BO/uyEHwqY7dV7HpjWuTHgYkfbXSUZxlJambVrhehzuaqUd0
         ArA2C9J33cEq3mKqzwlmHDm3ibysD9AChS411b7LAx/uLNOjFVocV/zDNmY/lLFIesJC
         PI3Cd3lf/EtAlciAPVpEFf3acypQcGJJ57Qq2YGb3zYnJoO0kZ80belAxrzbLDx9Di5N
         Ei8tpfW9hJjadp8VVCRrTXg7/1+Vt9Cw8Fy4XWR+O2E7kej4duaAqgEFp9f7/0WBg8xW
         LZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7tQ1ST2oRQj+11XFxhKGSWtAX7uC5DKCH9y9cgns8vg=;
        b=uvqAC0AxX+GZ+YbrPeTdXk2E3Qw0hafATwfGth/0g7PG1CPqr0nsJaKcG6a5JFCBrD
         hUXRiekEKDLSt2PLJKLW8mRcyaz7nGx0v1ta6MxjfzPTivLlVU2PyiPYNDBZ3pKkv51E
         /xwkhtr5yc2Uzrvhwkekdvek6C1fPNfPd/28ENFIGKy9+hiVNYop9y5GKhbS6g/BmrTT
         7Csci1YoicfTAx51HHyQLK9ARYogVY0mWADPCWOjfk1D16RVU955WUSLBbX8qfZraAKn
         m/rvZwhEzA6wy456WwunMS3QJl4QksSkZTq1dZUje9Sc0cPhJZRELLYdn2q65B7M6A3l
         ebIg==
X-Gm-Message-State: AO0yUKVE/O/ATaryggLmE9P2UfUYIJLB1iHN4uFHO2KdQAo/0OWlYIGW
        WHvwNrJX8ZsuBqKMPjA+4UsRLQ==
X-Google-Smtp-Source: AK7set+vqVOIMydnD+NIg0kxPNEU7GXuRbP/fWtnY0guYsa/xFbw3l5VYnw+VfxBn5ZkBNwG4TMlYw==
X-Received: by 2002:a2e:a593:0:b0:290:5190:4ef7 with SMTP id m19-20020a2ea593000000b0029051904ef7mr9375286ljp.40.1677338633707;
        Sat, 25 Feb 2023 07:23:53 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id z9-20020a2e4c09000000b00295a35f30e1sm196363lja.115.2023.02.25.07.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Feb 2023 07:23:52 -0800 (PST)
Message-ID: <f1a6ee82-9502-7ea5-fe48-f296fc7df497@linaro.org>
Date:   Sat, 25 Feb 2023 17:23:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [RFC PATCH 1/2] drm/msm/dpu: add dsc helper functions
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org, quic_sbillaka@quicinc.com,
        marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>
References: <1677267647-28672-1-git-send-email-quic_khsieh@quicinc.com>
 <1677267647-28672-2-git-send-email-quic_khsieh@quicinc.com>
 <42b3c193-8897-cfe9-1cae-2f9a66f7983a@linaro.org>
 <741be2a3-0208-2f40-eedf-d439c4e6795b@quicinc.com>
 <F8A4FC18-C64E-4011-BC08-18EB3B95A357@linaro.org>
 <d5ee8233-66c8-9b88-417c-6cf9cc5c84fe@quicinc.com>
 <CAA8EJpro5Q-2ZpnDJt40UhFX7Zp9oBhrto=FDOERzCDR2BDPvQ@mail.gmail.com>
 <f0dfba42-4674-3748-bf5d-39f6e1745f67@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f0dfba42-4674-3748-bf5d-39f6e1745f67@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/02/2023 02:36, Abhinav Kumar wrote:
> 
> 
> On 2/24/2023 3:53 PM, Dmitry Baryshkov wrote:
>> On Sat, 25 Feb 2023 at 00:26, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>> On 2/24/2023 1:36 PM, Dmitry Baryshkov wrote:
>>>> 24 февраля 2023 г. 23:23:03 GMT+02:00, Abhinav Kumar 
>>>> <quic_abhinavk@quicinc.com> пишет:
>>>>> On 2/24/2023 1:13 PM, Dmitry Baryshkov wrote:
>>>>>> On 24/02/2023 21:40, Kuogee Hsieh wrote:
>>>>>>> Add DSC helper functions based on DSC configuration profiles to 
>>>>>>> produce
>>>>>>> DSC related runtime parameters through both table look up and 
>>>>>>> runtime
>>>>>>> calculation to support DSC on DPU.
>>>>>>>
>>>>>>> There are 6 different DSC configuration profiles are supported 
>>>>>>> currently.
>>>>>>> DSC configuration profiles are differiented by 5 keys, DSC 
>>>>>>> version (V1.1),
>>>>>>> chroma (444/422/420), colorspace (RGB/YUV), bpc(8/10),
>>>>>>> bpp (6/7/7.5/8/9/10/12/15) and SCR (0/1).
>>>>>>>
>>>>>>> Only DSC version V1.1 added and V1.2 will be added later.
>>>>>>
>>>>>> These helpers should go to drivers/gpu/drm/display/drm_dsc_helper.c
>>>>>> Also please check that they can be used for i915 or for amdgpu 
>>>>>> (ideally for both of them).
>>>>>>
>>>>>
>>>>> No, it cannot. So each DSC encoder parameter is calculated based on 
>>>>> the HW core which is being used.
>>>>>
>>>>> They all get packed to the same DSC structure which is the struct 
>>>>> drm_dsc_config but the way the parameters are computed is specific 
>>>>> to the HW.
>>>>>
>>>>> This DPU file helper still uses the drm_dsc_helper's 
>>>>> drm_dsc_compute_rc_parameters() like all other vendors do but the 
>>>>> parameters themselves are very HW specific and belong to each 
>>>>> vendor's dir.
>>>>>
>>>>> This is not unique to MSM.
>>>>>
>>>>> Lets take a few other examples:
>>>>>
>>>>> AMD: 
>>>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.c#L165
>>>>>
>>>>> i915: 
>>>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/i915/display/intel_vdsc.c#L379
>>>>
>>>> I checked several values here. Intel driver defines more bpc/bpp 
>>>> combinations, but the ones which are defined in intel_vdsc and in 
>>>> this patch seem to match. If there are major differences there, 
>>>> please point me to the exact case.
>>>>
>>>> I remember that AMD driver might have different values.
>>>>
>>>
>>> Some values in the rc_params table do match. But the rc_buf_thresh[] 
>>> doesnt.
>>
>> Because later they do:
>>
>> vdsc_cfg->rc_buf_thresh[i] = rc_buf_thresh[i] >> 6;
>>
>>>
>>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/i915/display/intel_vdsc.c#L40
>>>
>>> Vs
>>>
>>> +static u16 dpu_dsc_rc_buf_thresh[DSC_NUM_BUF_RANGES - 1] = {
>>> +               0x0e, 0x1c, 0x2a, 0x38, 0x46, 0x54,
>>> +               0x62, 0x69, 0x70, 0x77, 0x79, 0x7b, 0x7d, 0x7e
>>> +};
>>
>> I'd prefer to have 896, 1792, etc. here, as those values come from the
>> standard. As it's done in the Intel driver.
>>
> 
> Got it, thanks
> 
>>> I dont know the AMD calculation very well to say that moving this to the
>>> helper is going to help.
>>
>> Those calculations correspond (more or less) at the first glance to
>> what intel does for their newer generations. I think that's not our
>> problem for now.
>>
> 
> Well, we have to figure out if each value matches and if each of them 
> come from the spec for us and i915 and from which section. So it is 
> unfortunately our problem.

Otherwise it will have to be handled by Marijn, me or anybody else 
wanting to hack up the DSC code. Or by anybody adding DSC support to the 
next platform and having to figure out the difference between i915, msm 
and their platform.

> 
>>>
>>> Also, i think its too risky to change other drivers to use whatever math
>>> we put in the drm_dsc_helper to compute thr RC params because their code
>>> might be computing and using this tables differently.
>>>
>>> Its too much ownership for MSM developers to move this to drm_dsc_helper
>>> and own that as it might cause breakage of basic DSC even if some values
>>> are repeated.
>>
>> It's time to stop thinking about ownership and start thinking about
>> shared code. We already have two instances of DSC tables. I don't
>> think having a third instance, which is a subset of an existing
>> dataset, would be beneficial to anybody.
>> AMD has complicated code which supports half-bit bpp and calculates
>> some of the parameters. But sharing data with the i915 driver is
>> straightforward.
>>
> 
> Sorry, but I would like to get an ack from i915 folks if this is going
> to be useful to them if we move this to helper because we have to look 
> at every table. Not just one.

Added i915 maintainers to the CC list for them to be able to answer.

> 
> Also, this is just 1.1, we will add more tables for 1.2. So we will have 
> to end up changing both 1.1 and 1.2 tables as they are different for QC.

I haven't heard back from Kuogee about the possible causes of using 
rc/qp values from 1.2 even for 1.1 panels. Maybe you can comment on 
that? In other words, can we always stick to the values from 1.2 
standard? What will be the drawback?

Otherwise, we'd have to have two different sets of values, like you do 
in your vendor driver.

> So if you look at the DSC spec from where these tables have come it says
> 
> "Common Recommended Rate Control-Related Parameter Values"
> 
> Its Recommended but its NOT mandated by the spec to follow every value 
> to the dot. I have confirmed this point with more folks.
> 
> So, if someone from i915 this is useful and safe to move their code to 
> the tables, we can try it.
> 
>>> I would prefer to keep it in the msm code but in a top level directory
>>> so that we dont have to make DSI dependent on DPU.
>>
>> I haven't changed my opinion. Please move relevant i915's code to
>> helpers, verify data against standards and reuse it.
>>
> 
> 
> 
>>>>> All vendors compute the values differently and eventually call 
>>>>> drm_dsc_compute_rc_parameters()
>>>>>
>>>>>> I didn't check the tables against the standard (or against the 
>>>>>> current source code), will do that later.
>>

-- 
With best wishes
Dmitry

