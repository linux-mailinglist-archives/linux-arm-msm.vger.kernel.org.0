Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A6D55168C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 May 2022 00:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241254AbiEAWrz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 May 2022 18:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234297AbiEAWrx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 May 2022 18:47:53 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7337D3BFB9
        for <linux-arm-msm@vger.kernel.org>; Sun,  1 May 2022 15:44:23 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id y32so22656094lfa.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 May 2022 15:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OM6ALmN8lQBWnqMJ3fhfO0WQxWZlF29n0KI4ZAgO+80=;
        b=jEzpdeOm+Lh9Ilu9iPWm+ZEKmUIcUdhy50/Y/GIM4K7Tpd6BZeSA6MAqFQyIu3vF4/
         wXhpUBdjC0diMUxagyszXiN4nNc4R5khPg7fLvn/oKPCWgoIoiRFRuHcAfMXJyqvedBK
         w28PZRrA+Zyulq52I8zl35d1la4uvMIQWDTt9zD8CD/KYVeuuUWtuUayxUm27blTIDmh
         aVFUOaH/ncsRKudKcC+zUcgC4dvtgMntwKyr1j54YkaCzNV0uUY8ZxZeUvH3KtV/wTfg
         g6c9aR/IldfTUGvWhHEIPr9meMudamQ6vkDIjPHPswwn8VxaYX8QtaExnskCpMuCmV6p
         wTJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OM6ALmN8lQBWnqMJ3fhfO0WQxWZlF29n0KI4ZAgO+80=;
        b=ysKnakWGcAZ/Iv+esiKBSBDbbV6ulewM3r+frYgL9vWCElgvvOjTgpbQSKDxsAOE33
         ooyBKpxHJyekHynybJdwaUstvhPKGSmXSHlGE5NW3VXSNDGoghd3p/LEtPZk7pEoSKK8
         nuIVXikfwWYwRHWbPQU50rQbSMR5dYKy0hhWEgoy/evO71GqOS2jnfYSdH9bqmEW/0+V
         ZAm0EfonWd4JaRBsCYSvYEgrRnpeDdkfz4d0HpG4+OBxPU4dTgV4rbHSxV4U+8hE7ZhO
         RuB4z9InW4wU336bcxjvRtO1yGMnNaYOIIpjUSzpKPUNArGpq8vbPwarJoAsElCZmzN7
         9zFg==
X-Gm-Message-State: AOAM531fmuRLHCa4lhngW0TqQTbaVFpnhX8sVmmIvcJx8sl6iEYpRl+A
        /23OJpy6hml65Kb3okNjzie+z5+3Xa/VPA==
X-Google-Smtp-Source: ABdhPJwiaw+a1eMfscbN670lGUnI0KbhPhgv0XJpNMacDnuJ7fnOb8hlcHjcOYzrMVnNwMxhtE8SMw==
X-Received: by 2002:a19:5f0e:0:b0:44b:111:1622 with SMTP id t14-20020a195f0e000000b0044b01111622mr7494944lfb.161.1651445061566;
        Sun, 01 May 2022 15:44:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p15-20020a2e9a8f000000b0024f3d1daed6sm897430lji.94.2022.05.01.15.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 May 2022 15:44:21 -0700 (PDT)
Message-ID: <4e308633-cb0d-7050-9ee0-421190683eac@linaro.org>
Date:   Mon, 2 May 2022 01:44:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2] drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        kernel test robot <lkp@intel.com>
References: <20220430175533.3817792-1-dmitry.baryshkov@linaro.org>
 <20220430185807.yn2j2coyc77qzx2o@SoMainline.org>
 <02114b24-f954-f145-4918-01cc3def65ac@linaro.org>
 <20220501204102.3xijmadbcrxwyu3x@SoMainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220501204102.3xijmadbcrxwyu3x@SoMainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/05/2022 23:41, Marijn Suijten wrote:
> On 2022-04-30 22:28:42, Dmitry Baryshkov wrote:
>> On 30/04/2022 21:58, Marijn Suijten wrote:
>>> On 2022-04-30 20:55:33, Dmitry Baryshkov wrote:
>>>> The downstream uses read-modify-write for updating command mode
>>>> compression registers. Let's follow this approach. This also fixes the
>>>> following warning:
>>>>
>>>> drivers/gpu/drm/msm/dsi/dsi_host.c:918:23: warning: variable 'reg_ctrl' set but not used [-Wunused-but-set-variable]
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Fixes: 08802f515c3c ("drm/msm/dsi: Add support for DSC configuration")
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> I pointed this out in review multiple times, so you'll obviously get my:
>>
>> I think I might have also pointed this out once (and then forgot to
>> check that the issue was fixed by Vinod).
>>
>>>
>>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>
>>> (But are you sure there's nothing else to clear in the 1st CTRL
>>> register, only the lowest 16 bits?  That should mean `reg` never
>>> contains anything in 0xffff0000)
>>
>> Judging from the downstream the upper half conains the same fields, but
>> used for other virtual channel. I didn't research what's the difference
>> yet. All the dtsi files that I have here at hand use
>> 'qcom,mdss-dsi-virtual-channel-id = <0>;'
> 
> As replied to Abhinav I'm simply asking whether we should be strict
> and add `reg & 0xffff` to prevent accidentally writing the top 16 bits,
> which are stream 1.  It doesn't seem like the current code can hit that
> though, with all the macros using masks internally already; but it's
> still a little scary since we're assuming the registers for VIDEO are
> identical to CMD (as mentioned in the reply to Abhinav: I wonder if it's
> possible to declare a a pair of bitfields as a single layout in the XML,
> and reuse that across CMD's stream 0/1 and the VIDEO register).
> 
>>> However, this seems to indicate that the DSC patch series has been
>>> approved and merged somehow??
>>
>> Pending inclusion, yes. If Vinod missed or ignored any other review
>> points, please excuse Abhinav and me not noticing that.
> 
> Vinod replied to most of the comments so I'll double-check if they were
> applied in the way requested.  Note that I don't always post a full
> review up-front if it gets too noisy: I'll simply start out with the
> most glaring issues and go in more detail in further revisions to
> prevent drowning everyone in comments.
> 
>> Can you please take a look at the latest revision posted, if there are
>> any other missing points. Let's decide if there are grave issues or we
>> can work them through.
> 
> Thanks, I'll queue that up this week.  One of my thus-far-unaddressed
> issues with the patches which can't be addressed in hindsight is the
> relatively lackluster commit messages: most happen to be repeating the
> title in a slightly different way without any additional clarification,
> which doesn't fit the upstream spirit at all.
> I understand that the reference manuals can't be quoted nor am I asking
> to, but a little more insight in the process and details of each patch
> goes a very long way.  Explain how certain calculations work or came to
> be, link to public sources detailing the protocol, explain design
> decisions or document how to use/test the feature and describe possible
> limitations.
> I usually link contributors to [1], but it's a bit of an odd read at
> times.
> 
> [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
> 
> In any case, given that you've already sent this patch and another three
> patches [2] fixing/cleaning up the series tells me it's far from ready.
> Most of this should just be handled - or have been handled - in review
> and amended?

During the review time we agreed that [2] would come as a separate 
change It is an API change that would make using panel-bridge easier, 
but isn't otherwise required.

I have been working towards more logical drm_bridge/drm_bridge_connector 
chains employing panel-bridge and display-connector where required, [2] 
is a part of that effort (as well as few other patches that hit 
dri-devel in the last few days).

> 
> [2]: https://lore.kernel.org/linux-arm-msm/20220501151220.3999164-1-dmitry.baryshkov@linaro.org/T/#t
> 
> I'll look through v14 again this week and let you know.
> 
> - Marijn
> 
>>>
>>>> ---
>>>>
>>>> Changes since v1:
>>>>    - Fix c&p error and apply mask clear to reg_ctrl2 instead of reg_ctrl
>>>>      (Abhinav)
>>>>
>>>> ---
>>>>    drivers/gpu/drm/msm/dsi/dsi_host.c | 5 ++++-
>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> index c983698d1384..a95d5df52653 100644
>>>> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
>>>> @@ -961,10 +961,13 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>>>>    		reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
>>>>    		reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
>>>>    
>>>> +		reg_ctrl &= ~0xffff;
>>>>    		reg_ctrl |= reg;
>>>> +
>>>> +		reg_ctrl2 &= ~DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH__MASK;
>>>>    		reg_ctrl2 |= DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(bytes_in_slice);
>>>>    
>>>> -		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
>>>> +		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg_ctrl);
>>>>    		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
>>>>    	} else {
>>>>    		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
>>>> -- 
>>>> 2.35.1
>>>>
>>
>>
>> -- 
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
