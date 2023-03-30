Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E70E6D12DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 01:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjC3XOg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 19:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbjC3XOf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 19:14:35 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 317AEFF2F
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 16:14:34 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id g17so26649568lfv.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 16:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680218072;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15Mk4RKbLr0KjCNm31D+PfN2gSo67inyBWHvjJWdVEs=;
        b=lJH0UbZRLPt038P2oRLeOjpkxOxue7nuGuJTqzCWD+u4bz7lQ3bEmbER/zuGwtCY+I
         h+Ca5YnEBZfPbsz7ztkLoiM8nlwxU3kM5zRsRjc6wuLBGZFA7cIdxE5f4cP8Xz/2mesl
         wgXwGCjhiij0wB0XkSmleYUVsPgi/U3mvH1pgRI9sDuM5FUy+Nyx4XeknGR0SoXP/45G
         e3JPmP2oq9PiAq8Su5WAUBZt/528Sb0lLcGspZMVtewOrY3y8z1LM+KIxrCSvD18r72V
         eZKLnqIECjquu3P8iKvt1p7DjSLEvg2por/dXGv3jkDVlDRO4qF/mgsrGER+5jiHWbL6
         HwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680218072;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15Mk4RKbLr0KjCNm31D+PfN2gSo67inyBWHvjJWdVEs=;
        b=bycSePxaB67TIIC6Yjvn1pCbPvnTRTTGtIzKO+NZQIoWKXnTkqZOd3Mwc/KFocxz2Z
         EkDJDOywDvELsGiFZJIxFJJXRLEXJV23BEcN6ryMlKLMAEbEMwZzYIiLni3mtn6ZwYaJ
         BeAsayB0wOzXkxXaLvuSbvFpkuB0029i/u0J8e6PpvtxKJt9a1NrdYVZTm+16yQ4qmC9
         ahmOj9/GBud07oYZBJKFdunRCqo/UlAkR6uTsj+Ib8glESc+rcYYke9qXHJ99hghAAnl
         3/Ooh9u/z5MgRQU97go5ULlBHO5nCTVK07Wq/s/8Istho7ObPp4s8lB3VjF2i1taSTd4
         pNpA==
X-Gm-Message-State: AAQBX9cPxG4Z1DswyWNSDoGZ0kmKMSdFMz+NK9KAaaSRR97Mrl3GWvp1
        /MEirbkZHaZkee96zaRXLGHjVw==
X-Google-Smtp-Source: AKy350bPktyAkzAW1HaUs4Mvez0JloF5vhUTu+hwF2dpdaXsE/RDkqKod5Cwh6XlVWLKWSLWhQcgHw==
X-Received: by 2002:a19:750b:0:b0:4dd:a0f6:8f3b with SMTP id y11-20020a19750b000000b004dda0f68f3bmr6649500lfe.15.1680218072286;
        Thu, 30 Mar 2023 16:14:32 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u10-20020ac243ca000000b004e90dee5469sm124721lfl.157.2023.03.30.16.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 16:14:31 -0700 (PDT)
Message-ID: <c3ac5c2b-e0e0-5d7c-67d3-4fc2316b68c5@linaro.org>
Date:   Fri, 31 Mar 2023 02:14:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 5/5] drm/msm/dsi: Use MSM and DRM DSC helper methods
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-5-f3e479f59b6d@quicinc.com>
 <0698ce89-d70c-c3f4-f006-18130858aacf@linaro.org>
 <2c9ac12f-df2f-8576-555b-3d84a6205ee3@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <2c9ac12f-df2f-8576-555b-3d84a6205ee3@quicinc.com>
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

On 31/03/2023 01:49, Jessica Zhang wrote:
> 
> 
> On 3/29/2023 4:48 PM, Dmitry Baryshkov wrote:
>> On 30/03/2023 02:18, Jessica Zhang wrote:
>>> Use MSM and DRM DSC helper methods.
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 18 ++++++++++++------
>>>   1 file changed, 12 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 74d38f90398a..7419fe58a941 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -31,6 +31,7 @@
>>>   #include "msm_kms.h"
>>>   #include "msm_gem.h"
>>>   #include "phy/dsi_phy.h"
>>> +#include "disp/msm_dsc_helper.h"
>>>   #define DSI_RESET_TOGGLE_DELAY_MS 20
>>> @@ -841,14 +842,14 @@ static void dsi_update_dsc_timing(struct 
>>> msm_dsi_host *msm_host, bool is_cmd_mod
>>>   {
>>>       struct drm_dsc_config *dsc = msm_host->dsc;
>>>       u32 reg, reg_ctrl, reg_ctrl2;
>>> -    u32 slice_per_intf, total_bytes_per_intf;
>>> +    u32 slice_per_intf;
>>>       u32 pkt_per_line;
>>>       u32 eol_byte_num;
>>>       /* first calculate dsc parameters and then program
>>>        * compress mode registers
>>>        */
>>> -    slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
>>> +    slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);
>>
>> This looks good
>>
>>>       /*
>>>        * If slice_count is greater than slice_per_intf
>>> @@ -858,10 +859,10 @@ static void dsi_update_dsc_timing(struct 
>>> msm_dsi_host *msm_host, bool is_cmd_mod
>>>       if (dsc->slice_count > slice_per_intf)
>>>           dsc->slice_count = 1;
>>> -    total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
>>> +    eol_byte_num = msm_dsc_get_eol_byte_num(msm_host->dsc, hdisplay,
>>> +            dsi_get_bpp(msm_host->format));
>>> -    eol_byte_num = total_bytes_per_intf % 3;
>>> -    pkt_per_line = slice_per_intf / dsc->slice_count;
>>> +    pkt_per_line = slice_per_intf / MSM_DSC_SLICE_PER_PKT;
>>
>> And for these values the result is definitely changed. Separate patch 
>> & description please. Just in case, "values per downstream kernel" is 
>> not a proper description for such changes.
> 
> Hi Dmitry,
> 
> Sure, I can put this into a separate patch.
> 
> The reason this was changed from slice_count to SLICE_PER_PKT was 
> because slice count and slice per packet aren't always equivalent. There 
> can be cases where panel configures DSC to have multiple soft slices per 
> interface, but the panel only specifies 1 slice per packet.

Please put this nice description into the commit message. It is exactly 
what I was looking for!

BTW: Do you expect to change MSM_DSC_SLICE_PER_PKT later or it will stay 
at "1"? If so, it might be easier to drop it and instead add a comment.

Regarding eol_byte_num, probably the best explanation would be that is 
is a size of a padding rather than a size of a trailer bytes in a line 
(and thus original calculation was incorrect).

> 
>>
>>>       if (is_cmd_mode) /* packet data type */
>>>           reg = 
>>> DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
>>> @@ -911,6 +912,11 @@ static void dsi_timing_setup(struct msm_dsi_host 
>>> *msm_host, bool is_bonded_dsi)
>>>       DBG("");
>>> +    if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
>>> +        /* Default widebus_en to false for now. */
>>> +        hdisplay = msm_dsc_get_pclk_per_line(msm_host->dsc, 
>>> mode->hdisplay,
>>> +                dsi_get_bpp(msm_host->format));
>>> +
>>
>> This is definitely something new and thus should probably go into a 
>> separate patch and be described. Also I'm not sure how does that 
>> interact with the hdisplay-related calculations below, under the 
>> if(dsc) clause.
> 
> After double-checking the math here, I think this part of the change is 
> actually wrong. pclk_per_line is essentially doing hdisplay / 3, which 
> is a repeat of what's being done in the `if (dsc)` block.
> 
> Will replace `hdisplay /= 3` with the pclk_per_line calculation.

Thanks!

> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>>>       /*
>>>        * For bonded DSI mode, the current DRM mode has
>>>        * the complete width of the panel. Since, the complete
>>> @@ -1759,7 +1765,7 @@ static int dsi_populate_dsc_params(struct 
>>> msm_dsi_host *msm_host, struct drm_dsc
>>>           return ret;
>>>       }
>>> -    dsc->initial_scale_value = 32;
>>> +    dsc->initial_scale_value = 
>>> drm_dsc_calculate_initial_scale_value(dsc);
>>
>> This is fine, we only support 8bpp where these values match.
>>
>>>       dsc->line_buf_depth = dsc->bits_per_component + 1;
>>>       return drm_dsc_compute_rc_parameters(dsc);
>>>
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

