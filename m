Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73AE06D14FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 03:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbjCaBZi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Mar 2023 21:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjCaBZh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Mar 2023 21:25:37 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB4CDEB5E
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 18:25:33 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id j11so26936045lfg.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Mar 2023 18:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680225932;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tWJbelhLusugtx2Wz7o2lekrcyvi262uNyTqj1tAYGE=;
        b=oicp95c3/vhWL/+XvP83qOlRb9rPdKyXQjaInEimMFQBp4vmq7M86ePK/HYvK2G6tw
         36ZrcjlnZ5V/UgSFUfgxz1/kN6LhldVcsPokEoRF4DDVLicexQ2zO0oOeLE5OwfOT8kU
         0NuaNT3e3bOUGhsVPduMUMgcUeo4mvptnUQtKkYHFXPFMvYRLa/N3hUpZhkYE16fxHkJ
         3v3xivi8BOsTxlPxfbLOzo1NiFVZXvdFNlQtF/3rjVNGAo1mEI0YCwyTrcyh5qfsfIvf
         re+bxm/CJ5vS2GVNP+xOhW2louRdxgnhpKdDAkIpWQbmCvyisG9nDNSWWoHxBDAFfOKM
         Nsyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680225932;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tWJbelhLusugtx2Wz7o2lekrcyvi262uNyTqj1tAYGE=;
        b=mzf9+XwZ1M2yRu16ivFDRWL0B6Nvy7Zal0GmouXmsm/LTdgwERqfyd6058Q50T+izR
         zblyS+0G+NzERFFeJRzCYadBzAIxjGn/PW/YUsR0PUqSP1m1heADoEQy0GqFHmPCz/vV
         lk+W81UBqVWvMO85ynN8WfJErwJOniEhaULH3o06RBqFj/v31TYUAEAa8AsfAYq479FJ
         nTdoghShokwSPooFosv/PpBn7M43F33LdDhz0apny3IaMMZeXDtpXlB9CLT+5PypQiA8
         QRbjX7FO/hmIUstJzsKfV3qCORRJlmnniiO/WuIc0o8kEGupKvIzpLN+hnUmWHJV/0dm
         PCLw==
X-Gm-Message-State: AAQBX9fh+yIhQ8EEyp+qYCMXH91CeBJdcuuuKqdYKGIGInmWYM8puzJh
        n4/Zh/GyZd/rg8vmKGnh6qeQ9Q==
X-Google-Smtp-Source: AKy350YOb5K6bC5UAVh/V7Zlb6lepmPl8y8LgVM/FfQzqJYM8iQOzTiOgfshjkQP9NvZvt7J8Rgqug==
X-Received: by 2002:ac2:494e:0:b0:4eb:18d:91df with SMTP id o14-20020ac2494e000000b004eb018d91dfmr6364153lfi.27.1680225931913;
        Thu, 30 Mar 2023 18:25:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e25-20020ac25479000000b004e8c6e9a6ccsm159686lfn.148.2023.03.30.18.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Mar 2023 18:25:31 -0700 (PDT)
Message-ID: <ba5d1916-2ef6-14c5-eba9-757740f860c2@linaro.org>
Date:   Fri, 31 Mar 2023 04:25:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 5/5] drm/msm/dsi: Use MSM and DRM DSC helper methods
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
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
 <c3ac5c2b-e0e0-5d7c-67d3-4fc2316b68c5@linaro.org>
 <6461a8b8-f620-5f9c-9533-f65ac42c0524@quicinc.com>
 <CAA8EJprriCLXR+P7ZOWLQCOhvi0WCUzNrCu4eyyqegNtPZbBUg@mail.gmail.com>
 <f5c3694f-a890-1087-4a73-34800cb40769@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f5c3694f-a890-1087-4a73-34800cb40769@quicinc.com>
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

On 31/03/2023 04:12, Jessica Zhang wrote:
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
> 
> AFAIK we aren't developing on any panels that have a non-default 
> slice-per-packet count right now, so I'm not sure if it would be worth 
> the effort to add this if there's no panel we can validate it on.
> 
> FWIW, downstream reads slice_per_pkt from a custom DT entry [1]

As you might guess, this approach is frowned upon in upstream kernel. 
This info should come from panel (e.g. extend drm_dsc_config or deduce 
the value in msm driver).

> 
> [1] 
> https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/dsi-panel-r66451-dsc-fhd-plus-120hz-cmd.dtsi#115
> 
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
> 
> Acked.
> 


-- 
With best wishes
Dmitry

