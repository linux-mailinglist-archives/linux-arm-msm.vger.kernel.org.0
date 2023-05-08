Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1386FBB68
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 May 2023 01:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbjEHX1W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 May 2023 19:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjEHX1V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 May 2023 19:27:21 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6445493D6
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 May 2023 16:27:20 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ac87e7806aso44304311fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 May 2023 16:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683588438; x=1686180438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a6Rt7YiQAZlCnHEpzBmgJ4SMOzivrPiJcKF14bVvwBc=;
        b=YBOCnu8VfDSyp3Adz3AUWEr/nwKCediKzOd9kJ0zdZ0tnra0ubkMZU+X5J0ItN/gY4
         vq952Rowh5oKvoRtvcGzVRwDjssEtDV9b3nWUY59FIVrtvRi+fvlbENYgqHoRzFddxGp
         /4MoHCALIOJV3w7ZKGgCI/63MniAI0WUA85OUF8y8ix42O6g/BunJBjTiI/iYzkNuuoL
         gEUupmWmqlpFCK+DODGCARU+nQuBh9vhRbtCiXz10MufMZ4DpnO2LpPUnUsPoTEotRbD
         /h1CcOrcD/oYdUQ8ulal63W2Oi0zmQEjkKTb/WDaDhZn+0xmWTvRozpHuFZyQ5SK3eyH
         iSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683588438; x=1686180438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a6Rt7YiQAZlCnHEpzBmgJ4SMOzivrPiJcKF14bVvwBc=;
        b=Oom/2YUE4tmIXMahehmomojqFwLbOwRoge4EhjkjLLGiRbUe35Y+tHoguSJwCudMlC
         9aCQ2kYGKbdBVlvS8uqsqi2v8NHaPHcMi+jUst6Qb0+4Qymfavo1MuBXR1JArDog4QmN
         1cXF4qhMN4lN7Z8DHC9DgPBz88gO5mbqYbH55ewRGF31l4ZOHvXgzkP7ZhXgP64Y0ICZ
         PhtsF15tDelPKmuDSvHWBmrIx2f96Qgrx3fCbpSBtR+5TFRIjIPLyayv6dkdnC2ESfhZ
         2nQ6/ALJgfmdnWFavBip2LkcG3GniyDhARi1wPprtyTR1qkbBfaHtk59WtNKZrfE20HZ
         ZssA==
X-Gm-Message-State: AC+VfDxawQnm0iz5Frz4zdDRwWWy0uDwVNB86l7LeK9QLIeKp3IgzEsl
        RgFda94JNXHEOrRHGSG137svQQ==
X-Google-Smtp-Source: ACHHUZ5Bvvam4bUJ8MKi747WCRxlnyuUFM84qlBLhz6yqhAjz3rge5MoCzrhn9yKp6Pwag/AeM0IBg==
X-Received: by 2002:a2e:9355:0:b0:2a7:6e37:ee68 with SMTP id m21-20020a2e9355000000b002a76e37ee68mr196002ljh.12.1683588438391;
        Mon, 08 May 2023 16:27:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id z4-20020a2e7e04000000b002a8e758f669sm1322546ljc.27.2023.05.08.16.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 16:27:17 -0700 (PDT)
Message-ID: <4cf2e9ab-7e08-fb26-d924-8ea8141d9f58@linaro.org>
Date:   Tue, 9 May 2023 02:27:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/4] drm/msm/dsi: Fix compressed word count calculation
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230405-add-dsc-support-v1-0-6bc6f03ae735@quicinc.com>
 <20230405-add-dsc-support-v1-2-6bc6f03ae735@quicinc.com>
 <a60a9f37-bb43-6e2b-2535-995e9fae250a@linaro.org>
 <32d473a6-f7a5-9aa6-85cf-0f77f1c071ce@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <32d473a6-f7a5-9aa6-85cf-0f77f1c071ce@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/05/2023 23:09, Abhinav Kumar wrote:
> 
> 
> On 5/3/2023 1:26 AM, Dmitry Baryshkov wrote:
>> On 03/05/2023 04:19, Jessica Zhang wrote:
>>> Currently, word count is calculated using slice_count. This is incorrect
>>> as downstream uses slice per packet, which is different from
>>> slice_count.
>>>
>>> Slice count represents the number of soft slices per interface, and its
>>> value will not always match that of slice per packet. For example, it is
>>> possible to have cases where there are multiple soft slices per 
>>> interface
>>> but the panel specifies only one slice per packet.
>>>
>>> Thus, use the default value of one slice per packet and remove 
>>> slice_count
>>> from the word count calculation.
>>>
>>> Fixes: bc6b6ff8135c ("drm/msm/dsi: Use DSC slice(s) packet size to 
>>> compute word count")
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dsi/dsi_host.c | 9 ++++++++-
>>>   1 file changed, 8 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c 
>>> b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> index 35c69dbe5f6f..b0d448ffb078 100644
>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>> @@ -996,7 +996,14 @@ static void dsi_timing_setup(struct msm_dsi_host 
>>> *msm_host, bool is_bonded_dsi)
>>>           if (!msm_host->dsc)
>>>               wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
>>>           else
>>> -            wc = msm_host->dsc->slice_chunk_size * 
>>> msm_host->dsc->slice_count + 1;
>>> +            /*
>>> +             * When DSC is enabled, WC = slice_chunk_size * 
>>> slice_per_packet + 1.
>>> +             * Currently, the driver only supports default value of 
>>> slice_per_packet = 1
>>> +             *
>>> +             * TODO: Expand drm_panel struct to hold 
>>> slice_per_packet info
>>> +             *       and adjust DSC math to account for 
>>> slice_per_packet.
>>
>> slice_per_packet is not a part of the standard DSC, so I'm not sure 
>> how that can be implemented. And definitely we should not care about 
>> the drm_panel here. It should be either a part of drm_dsc_config, or 
>> mipi_dsi_device.
>>
> 
> This is not correct.
> 
> It is part of the DSI standard (not DSC standard). Please refer to 
> Figure 40 "One Line Containing One Packet with Data from One or More 
> Compressed Slices" and Figure 41 "One Line Containing More than One 
> Compressed Pixel Stream Packet".

I have reviewed section 8.8.24 and Annex D of the DSI standard.

It is not clear to me, if we can get away with always using 
slice_per_packet = 1. What is the DSI sink's difference between Fig. 
40.(b) and Fig 41?

Are there are known panels that require slice_per_packet != 1? If so, we 
will have to implement support for such configurations.

> This has details about this. So I still stand by my point that this 
> should be in the drm_panel.

Note, the driver doesn't use drm_panel directly. So slices_per_packet 
should go to mipi_dsi_device instead (which in turn can be filled from 
e.g. drm_panel or from any other source).

> 
>>> +             */
>>> +            wc = msm_host->dsc->slice_chunk_size + 1;
>>>           dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>>>               DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
>>>
>>

-- 
With best wishes
Dmitry

