Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C29136D15BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 04:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229508AbjCaCrP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 22:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjCaCrP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 22:47:15 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DDB8DBF8
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 19:47:13 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id g19so14020063lfr.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 19:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680230832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5ceK/FCMxFV6WMkMs6P3C5RWwMjIas0p27G5eDARwxY=;
        b=Ci+emgJe6oF44s+qWeE5uy3s48VkDILilyoaE+Ef/VsPii1wservI2X2STOOL2M0j6
         JNmEW4VxTxjksvvWrlO5KL95mxZQ3xILjjiXyqQsRQqMMTaNCwlzrRSO5qhYyoRVrdr/
         IGNp9cP4zB1KBm5TlxzUgqWVKOkGmtImv0/O9FGMriQ29Sdab0gwl83EgX0+L1BcS8gn
         WzpvF8DoBSqn4KrgSx5mn1hKcb5/wPoPeyfksXzKptq530BOePLdGPLlPQu93Bf+7yfJ
         qGFVKU29KJvwOW9lh5FV3YNX169ziiVI/rZWIyexVPPQRwA7nG8w+CkClJOEW/N0tlUV
         qeJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680230832;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ceK/FCMxFV6WMkMs6P3C5RWwMjIas0p27G5eDARwxY=;
        b=aQzQ/iouGZ9T9ZjlkQ4j9H6KM2/FlrfQjbm2QtP5p+Co8PKvd1aSjP7Gx4rYGPkUkS
         6ISSR94UGokKLz46qbmcQ07SF24dRjzzw/k1wcpu4UOPTgABedaMC3gbsy5cYazHT4Sv
         9h9DbfDChU1XTCgh7ao4CZRuQ9WoY5zoRQusbEHu/ZoPjVMQ4pzamMBbNYE6ZlRi4BqL
         ib4qUOjBenTmBrsZwlTxAObNsp3UFUMfqBHLNRNqBJP5gU0foY+jSkSE0/x7LeqZJS8T
         0gt9EDsy0KyLvqoamPzJ60i7LRoNo6OBk2yRmoKAW2Tq5BlI1BafEj+JdqrlIijPP9iW
         IKtQ==
X-Gm-Message-State: AAQBX9c7bjzBG4jEoGhMAVATcY65qu4QbnDxsmH6owqX/9t51BOA0STq
        oSOw03RHE6dyQf7DQumcvkz5XNgfBHMRUrh9dTM=
X-Google-Smtp-Source: AKy350ZVz4ck+kqZPmVfA8JrvO14PwUxAMU2IKtdSi4OJdVZSCoJmaf/wW3+Cr6lYkxEDexwPrO+GA==
X-Received: by 2002:a05:6512:143:b0:4e8:4a21:9c92 with SMTP id m3-20020a056512014300b004e84a219c92mr8301076lfo.4.1680230831678;
        Thu, 30 Mar 2023 19:47:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id w4-20020a05651204c400b004d58e782886sm178307lfq.303.2023.03.30.19.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 19:47:11 -0700 (PDT)
Message-ID: <be4b854b-0938-d051-2f74-cde02188a052@linaro.org>
Date:   Fri, 31 Mar 2023 05:47:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [Freedreno] [PATCH RFC 5/5] drm/msm/dsi: Use MSM and DRM DSC
 helper methods
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        freedreno@lists.freedesktop.org
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-5-f3e479f59b6d@quicinc.com>
 <0698ce89-d70c-c3f4-f006-18130858aacf@linaro.org>
 <2c9ac12f-df2f-8576-555b-3d84a6205ee3@quicinc.com>
 <c3ac5c2b-e0e0-5d7c-67d3-4fc2316b68c5@linaro.org>
 <6461a8b8-f620-5f9c-9533-f65ac42c0524@quicinc.com>
 <CAA8EJprriCLXR+P7ZOWLQCOhvi0WCUzNrCu4eyyqegNtPZbBUg@mail.gmail.com>
 <86e851f7-bbbe-b849-e36b-f3c9af93e9e3@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <86e851f7-bbbe-b849-e36b-f3c9af93e9e3@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 31/03/2023 04:33, Abhinav Kumar wrote:
> 
> 
> On 3/30/2023 5:16 PM, Dmitry Baryshkov wrote:
>> On Fri, 31 Mar 2023 at 03:07, Jessica Zhang 
>> <quic_jesszhan@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 3/30/2023 4:14 PM, Dmitry Baryshkov wrote:
>>>> On 31/03/2023 01:49, Jessica Zhang wrote:
>>>>>
>>>>>
>>>>> On 3/29/2023 4:48 PM, Dmitry Baryshkov wrote:
>>>>>> On 30/03/2023 02:18, Jessica Zhang wrote:
>>>>>>> Use MSM and DRM DSC helper methods.
>>>>>>>
>>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>>> ---
>>>>>>>    drivers/gpu/drm/msm/dsi/dsi_host.c | 18 ++++++++++++------
>>>>>>>    1 file changed, 12 insertions(+), 6 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>> index 74d38f90398a..7419fe58a941 100644
>>>>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>>>>> @@ -31,6 +31,7 @@
>>>>>>>    #include "msm_kms.h"
>>>>>>>    #include "msm_gem.h"
>>>>>>>    #include "phy/dsi_phy.h"
>>>>>>> +#include "disp/msm_dsc_helper.h"
>>>>>>>    #define DSI_RESET_TOGGLE_DELAY_MS 20
>>>>>>> @@ -841,14 +842,14 @@ static void dsi_update_dsc_timing(struct
>>>>>>> msm_dsi_host *msm_host, bool is_cmd_mod
>>>>>>>    {
>>>>>>>        struct drm_dsc_config *dsc = msm_host->dsc;
>>>>>>>        u32 reg, reg_ctrl, reg_ctrl2;
>>>>>>> -    u32 slice_per_intf, total_bytes_per_intf;
>>>>>>> +    u32 slice_per_intf;
>>>>>>>        u32 pkt_per_line;
>>>>>>>        u32 eol_byte_num;
>>>>>>>        /* first calculate dsc parameters and then program
>>>>>>>         * compress mode registers
>>>>>>>         */
>>>>>>> -    slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
>>>>>>> +    slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
>>>>>>
>>>>>> This looks good
>>>>>>
>>>>>>>        /*
>>>>>>>         * If slice_count is greater than slice_per_intf
>>>>>>> @@ -858,10 +859,10 @@ static void dsi_update_dsc_timing(struct
>>>>>>> msm_dsi_host *msm_host, bool is_cmd_mod
>>>>>>>        if (dsc->slice_count > slice_per_intf)
>>>>>>>            dsc->slice_count = 1;
>>>>>>> -    total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
>>>>>>> +    eol_byte_num = msm_dsc_get_eol_byte_num(msm_host->dsc, 
>>>>>>> hdisplay,
>>>>>>> +            dsi_get_bpp(msm_host->format));
>>>>>>> -    eol_byte_num = total_bytes_per_intf % 3;
>>>>>>> -    pkt_per_line = slice_per_intf / dsc->slice_count;
>>>>>>> +    pkt_per_line = slice_per_intf / MSM_DSC_SLICE_PER_PKT;
>>>>>>
>>>>>> And for these values the result is definitely changed. Separate patch
>>>>>> & description please. Just in case, "values per downstream kernel" is
>>>>>> not a proper description for such changes.
>>>>>
>>>>> Hi Dmitry,
>>>>>
>>>>> Sure, I can put this into a separate patch.
>>>>>
>>>>> The reason this was changed from slice_count to SLICE_PER_PKT was
>>>>> because slice count and slice per packet aren't always equivalent.
>>>>> There can be cases where panel configures DSC to have multiple soft
>>>>> slices per interface, but the panel only specifies 1 slice per packet.
>>>>
>>>> Please put this nice description into the commit message. It is exactly
>>>> what I was looking for!
>>>>
>>>> BTW: Do you expect to change MSM_DSC_SLICE_PER_PKT later or it will 
>>>> stay
>>>> at "1"? If so, it might be easier to drop it and instead add a comment.
>>>
>>> MSM_DSC_SLICE_PER_PKT is the default value for panels that don't specify
>>> a slice_per_pkt value. (Now that I think about it, might be better to
>>> call it MSM_DSC_DEFAULT_SLICE_PER_PKT instead...)
>>
>> Note, there is no slice_per_pkt in drm_dsc_config, so we must come up
>> with another way to pass this data from the panel or to deduce the
>> value in our driver.
>>
>>>
>>> I don't expect it to change in the future, but it's a little more
>>> readable than just dividing by 1 IMO. If you prefer dropping the macro
>>> and adding a comment, I'm also okay with that.
>>
>> There is no need to divide by 1, the value doesn't change. So I'd
>> probably prefer something like:
>>
>> /* Default to 1 slice per packet */
>> if (panel_slice_per_pkt)
>>      pkt_per_line = slice_per_intf / panel_slice_per_pkt;
>> else
>>      pkt_per_line = slice_per_intf;
>>
>> Or:
>>
>> /* Default to 1 slice per packet */
>> slice_per_pkt = 1;
>> if (panel_slice_per_pkt)
>>      slice_per_pkt = panel_slice_per_pkt;
>> pkt_per_line = slice_per_intf / slice_per_pkt;
>>
>> BTW: could you possibly change 'intf' to 'line' to v2? It seems there
>> is a mixture of them through the code. If there is a difference
>> between intf and line which is not yet posted, it's fine to keep the
>> current code. WDYT?
>>
> 
> No, I dont agree with the change from intf to line.
> 
> In case of dual DSI, intf is not equal to line.
> 
> 2 intfs = 1 line
> 
> Hence that distinction is necessary.

Ack, this is what I was looking for!

so intf = line / num_intf?

Maybe I should explain the reason for my question:

msm_dsc_get_pclk_per_line() uses intf_width, calculates pclk_per_line 
(not per intf). msm_dsc_get_dce_bytes_per_line() does the same thing

In this patch we take slice_per_intf, divide it with slice_per_pkt and 
get pkt_per_line (rather than pkt_per_intf).

This is what prompted my question regarding intf vs line.

> 
>>>
>>> Thanks,
>>>
>>> Jessica Zhang
>>>
>>>>
>>>> Regarding eol_byte_num, probably the best explanation would be that is
>>>> is a size of a padding rather than a size of a trailer bytes in a line
>>>> (and thus original calculation was incorrect).
>>>>
>>>>>
>>>>>>
>>>>>>>        if (is_cmd_mode) /* packet data type */
>>>>>>>            reg =
>>>>>>> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
>>>>>>> @@ -911,6 +912,11 @@ static void dsi_timing_setup(struct
>>>>>>> msm_dsi_host *msm_host, bool is_bonded_dsi)
>>>>>>>        DBG("");
>>>>>>> +    if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
>>>>>>> +        /* Default widebus_en to false for now. */
>>>>>>> +        hdisplay = msm_dsc_get_pclk_per_line(msm_host->dsc,
>>>>>>> mode->hdisplay,
>>>>>>> +                dsi_get_bpp(msm_host->format));
>>>>>>> +
>>>>>>
>>>>>> This is definitely something new and thus should probably go into a
>>>>>> separate patch and be described. Also I'm not sure how does that
>>>>>> interact with the hdisplay-related calculations below, under the
>>>>>> if(dsc) clause.
>>>>>
>>>>> After double-checking the math here, I think this part of the change
>>>>> is actually wrong. pclk_per_line is essentially doing hdisplay / 3,
>>>>> which is a repeat of what's being done in the `if (dsc)` block.
>>>>>
>>>>> Will replace `hdisplay /= 3` with the pclk_per_line calculation.
>>>>
>>>> Thanks!
>>>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Jessica Zhang
>>>>>
>>>>>>
>>>>>>>        /*
>>>>>>>         * For bonded DSI mode, the current DRM mode has
>>>>>>>         * the complete width of the panel. Since, the complete
>>>>>>> @@ -1759,7 +1765,7 @@ static int dsi_populate_dsc_params(struct
>>>>>>> msm_dsi_host *msm_host, struct drm_dsc
>>>>>>>            return ret;
>>>>>>>        }
>>>>>>> -    dsc->initial_scale_value = 32;
>>>>>>> +    dsc->initial_scale_value =
>>>>>>> drm_dsc_calculate_initial_scale_value(dsc);
>>>>>>
>>>>>> This is fine, we only support 8bpp where these values match.
>>>>>>
>>>>>>>        dsc->line_buf_depth = dsc->bits_per_component + 1;
>>>>>>>        return drm_dsc_compute_rc_parameters(dsc);
>>>>>>>
>>>>>>
>>>>>> -- 
>>>>>> With best wishes
>>>>>> Dmitry
>>>>>>
>>>>
>>>> -- 
>>>> With best wishes
>>>> Dmitry
>>>>
>>
>>
>>

-- 
With best wishes
Dmitry

