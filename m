Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91861439E8E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 20:33:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233266AbhJYSgE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 14:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbhJYSgE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 14:36:04 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E16AC061745
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 11:33:41 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id y26so11464382lfa.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 11:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=z8dBYZTcodW1RIYY1CuZg5+AR74dovOpvsO6NBf+lLc=;
        b=ZryNl7LCusVTz1ohIfF0UDBP1HQe32e/17uZVKDo26y8lXSi69cyY/O2zW0EaidLAF
         yqPai5WEnpFTpa9hKWtic57snky53zK8VVouzHZ79u4xnxXurzXQcnuUgD2KiO4tpb8h
         6Q6Oo/ZbVgwgFHWP7XELlyzO5NpgMDSfg7a9hu1LVV1DESPwUS2EbUuq+WvAuGgPnEZW
         103YlT4Jjnr4fBuc0Go8Yp0kReiert0vN4kQ/LgvwHMbTcyMTtbesgsrVpM6Tu5Hjyov
         jiQh1JZ4DsOuMqekLyFoNN63AnSO9lkgXfAcs+bNbAppCG00vFLEUgTG05RYZkXpyzcx
         xRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=z8dBYZTcodW1RIYY1CuZg5+AR74dovOpvsO6NBf+lLc=;
        b=TyYp2dLUr4Kkz0pVrMF95myfGZRevWe2qaj3hRHVNBMzop4hg61VAgHmXvHol2aFcu
         m5LLCj5jYhqgH6UrI5jkLZQAUflthT1vguYL2aZ29awBGUBitJWwdYRgEr1IHRK7d2oH
         huZudEomoEdDaHbVB6r5AcPx+MAHWxsOuY+SEbXkW/n2D4w7Bp/fyq3fA5uJ9vqBBlfc
         Rd992lhnk7UFrHk2sntImuZKMfdiwr0jlUx3I3unai6nz58U8mjvf6NeJ7TP5RlJ67jm
         RLqRQTVyqzTuU4iGUxoXxUEM2ewKc5AK+IAhkfWZzPMFr5Dt8cE0m/7L4+T/fEB0i158
         D/gg==
X-Gm-Message-State: AOAM531P6whg5dZs+cZ0VOG34PWvC8qJLrDBA7l5ssDl1Mss1gyoOijJ
        OuAzgAVLf1fwYHHJz1eGYTG+XrX97Nt4gg==
X-Google-Smtp-Source: ABdhPJx10i3nwleH7dxXSovt1g/kWHZ8liOWRHVHDlkIVeA5FV8xIRs9Pj7CSmFadXRB/KENK3CmtQ==
X-Received: by 2002:a05:6512:3f86:: with SMTP id x6mr18959945lfa.389.1635186819446;
        Mon, 25 Oct 2021 11:33:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h1sm1717600lfu.277.2021.10.25.11.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 11:33:39 -0700 (PDT)
Subject: Re: [PATCH v2 06/11] drm/msm/disp/dpu1: Don't use DSC with mode_3d
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-7-vkoul@kernel.org>
 <11becace-7b44-6141-5a8b-1bd6d0673243@linaro.org>
 <35eb95c5-1c42-94d1-3f33-df029f753ab3@linaro.org> <YW+957ZKnbf1g/89@matsya>
 <e96d1368-fe7b-cf24-82c9-99783df44b0d@linaro.org> <YXbXBTlgDRa564Ic@matsya>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <d1cb8a37-b749-4098-a248-f0a9997e05a9@linaro.org>
Date:   Mon, 25 Oct 2021 21:33:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXbXBTlgDRa564Ic@matsya>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/10/2021 19:10, Vinod Koul wrote:
> On 25-10-21, 17:40, Dmitry Baryshkov wrote:
>> On 20/10/2021 09:57, Vinod Koul wrote:
>>> On 14-10-21, 16:50, Dmitry Baryshkov wrote:
>>>> On 14/10/2021 16:41, Dmitry Baryshkov wrote:
>>>>> On 07/10/2021 10:08, Vinod Koul wrote:
> 
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>>>>> index 806c171e5df2..5dfac5994bd4 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
>>>>>> @@ -39,6 +39,7 @@ struct dpu_hw_stage_cfg {
>>>>>>      * @mode_3d:               3d mux configuration
>>>>>>      * @merge_3d:              3d merge block used
>>>>>>      * @intf_mode_sel:         Interface mode, cmd / vid
>>>>>> + * @dsc:                   DSC BIT masks
>>>>>>      * @stream_sel:            Stream selection for multi-stream interfaces
>>>>>>      */
>>>>>>     struct dpu_hw_intf_cfg {
>>>>>> @@ -46,6 +47,7 @@ struct dpu_hw_intf_cfg {
>>>>>>         enum dpu_3d_blend_mode mode_3d;
>>>>>>         enum dpu_merge_3d merge_3d;
>>>>>>         enum dpu_ctl_mode_sel intf_mode_sel;
>>>>>> +    unsigned int dsc;
>>>>
>>>> I think this should be:
>>>> enum dpu_dsc dsc[MAX_DSCS];
>>>> unsigned int num_dsc;
>>>
>>> hmmm, how do we go about getting the num_dsc value here.
>>> dpu_encoder_phys does not know about that..
>>
>> dpu_encoder_get_topology() can decide whether to use DSC or not and then set
>> num_dsc. For now it will always set 2 if we are using DSC at all, but let's
>> keep the decision in a single place rather than having it scattered all over
>> the driver.
> 
> Yes agree, but dpu_encoder_get_topology() is private to encoder. Am not
> sure how best to propagate the info into the hw_intf_cfg?

Let dpu_encoder_get_topology() set num_dscs to 2 and merge_3d to 0 if 
the encoder has DSC information and to 0 otherwise. This will cover all 
topologies that we care about for now.

Regarding getting the DSC config. Currently you use single priv->dsc 
pointer, which works for the simple case of single DSI output, but will 
break as soon as somebody has DSC DSI + DP config. Either we can 
introduce the array of DSC configs, or we can add a DSI-specific 
msm_dsi_get_dsc_config(), which will be later paired with the 
corresponding displayport function.

-- 
With best wishes
Dmitry
