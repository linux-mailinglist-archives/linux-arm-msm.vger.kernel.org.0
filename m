Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51FA8708D82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 03:50:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjESBuo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 21:50:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjESBun (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 21:50:43 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C234B1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 18:50:40 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f2510b2b98so3049246e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 18:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684461038; x=1687053038;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3kqWUbGPuJ0AZnsNMjbaLKd3uApQBze4SHqNuyvJdyQ=;
        b=yvZyLvfZS/pHGHahyifTI5c5BBxiQt8RyEJtSap5tOmH7k4aVXJy7QQDsu/WAqUa2e
         xVWBkCu4mrHDAo0kazuFOrens2afKzYcbOhm4lz3J++NM6Gv3NoQir7dGWbLXZELlmVi
         GiwEXOksZ8uQQlHPhdkGXt36TEHpkXUeW+gC8eLaBzPm0smb0idm9iOljOcxJfqB/fee
         nsm2wpwI1aiyzsRL2lEbBh4lAui7s6g0zpbZi5E61NySOvUtyhROpQKZ/o27qKwjX3l0
         FfkV4pAQGJ6NUl3DqQd8kjEKg1RddzkvtmBH4dJaZZTyI4A8kLPf9cUztNVta5deN00E
         1GfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684461038; x=1687053038;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kqWUbGPuJ0AZnsNMjbaLKd3uApQBze4SHqNuyvJdyQ=;
        b=A+YyCziDGWBHWIPGElN4/fYDB/Pn7gBeyhLKyuDX4vaoq5EoXP0gYSY93XBw1i2QH6
         u+XxEXCO4i+9N1VG5NCSyGQOHVlZA/kiqwPfmVnHOXOns9NtNjWzJMcB5By3J6LAJoae
         L5Otx0Jjev7+NJTgvcd4vREOrC1SC180MGL58CT7qzKmRC5nq6QGGPvobu6SIJWxWPSN
         s2KoeWFDvzRljJVualm4bqXDNerY0TGHEHMRz32y6Yk0OixnX566FGyxB4l2Wk6uXU3r
         jHOdlCxrH2enXhi9ucRnOWQa3r9NmldOiNHHsABVS9gc/nd1UdDQvgHlPzBwyR3HzIh+
         hr3Q==
X-Gm-Message-State: AC+VfDxA3DElz8rq1XieLJlBJVGoeQcAg6/sLRUoTsvHWN1cucO2WZ+j
        ozoCxzb5RQNDoD1B6DK/6YgpKIx99EJtv2mu5Sk=
X-Google-Smtp-Source: ACHHUZ4mwgMlQysaPbVr5iKYTkt++zeFdUJl1i7RvxfQtZT6E/zKW9Gn2stBf2ud/UKNBv+/bGH6hg==
X-Received: by 2002:ac2:5297:0:b0:4f3:9f9b:ad09 with SMTP id q23-20020ac25297000000b004f39f9bad09mr198258lfm.38.1684461038575;
        Thu, 18 May 2023 18:50:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id b15-20020ac25e8f000000b004ec84d24818sm421493lfq.282.2023.05.18.18.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 May 2023 18:50:38 -0700 (PDT)
Message-ID: <bf12ab07-4901-0a97-6e97-77d537a2cfe3@linaro.org>
Date:   Fri, 19 May 2023 04:50:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v2 06/13] drm/msm/dpu: switch RM to use crtc_id rather
 than enc_id for allocation
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-7-dmitry.baryshkov@linaro.org>
 <29c1aa19-f1c7-4aff-0f48-b4e849547ebd@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <29c1aa19-f1c7-4aff-0f48-b4e849547ebd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/05/2023 02:46, Abhinav Kumar wrote:
> 
> 
> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>> Up to now the driver has been using encoder to allocate hardware
>> resources. Switch it to use CRTC id in preparation for the next step.
>>
> 
> This decision to use encoder id instead of CRTC has been there 
> downstream for quite sometime. So most of the delay in reviewing this 
> series was trying to understand why we had this in the first place and 
> who knew that story.
> 
> You are right that from the perspective of clone mode mapping resources 
> to CRTC is correct but using encoder id is what has been working so far 
> without too much difficulty with a little more management  But another 
> use-case can get simplified with this.

Thank you for the historical perspective and for the feedback.

I think that keeping resource allocation in dpu_encoder was required 
when INTF/WB themselves were allocated through the RM. However as 
INTF/WB blocks are now allocated in a static way, it doesn't make so 
much sense anymore.

> 
> There is another angle to this. There are hardware blocks which can do 
> writeback and the physical display concurrently. We call it concurrent 
> writeback or CWB. This is present even on some of the chipsets already 
> supported upstream.
> 
> Now, lets say we start a concurrent writeback session , in todays code 
> we will allocate the resources with the encoder id of the writeback's 
> encoder and the other physical display's encoder.
> 
> When the session stops, we can just deallocate the resources of the 
> writeback encoder without touching the other encoder. So it will become 
> easier to just free up the resources mapped to the encoder.

I have not looked into CWB programming. However from your description it 
would be as easy to do a full reallocation of the pipeline as just 
dropping the CWB/extra encoder. In fact this is what the driver was 
doing: in case of a modeset, drop all old resources and allocate full 
set of resources.

> With clone mode implemented with CRTC id to map resources, we will have 
> to probably do some extra book-keeping to handle concurrent writeback.

Probably not much. We'd have to describe the topology/requirements and 
then pass that to RM. I have been waiting for this patchset (and up to 
some point the DSC/ctl) to be reviewed before finalizing/submitting the 
patches that rework the CTL interface to use this kind of data structure.

> Thats the use-case which gets impacted with this but for others, there 
> shouldnt be a major impact from what we see.
> 
> That being said, what benefit are you seeing from making that change now 
> for this series? Why is it specifically needed for virtual planes?
> 
> I see in the commit text that you have mentioned this is in preparation 
> for next step and next step talks about clone mode. But clone mode is 
> not there yet. So why this change now?

There were several items that triggered this review.

First thing first. Current design allocates resources from 
dpu_encoder_virt_atomic_check(), then in 
dpu_encoder_virt_atomic_mode_set() the driver has to poke manually in 
the cstate and fill CTL and LM. This kept on bugging me for some time. 
The encoder should not be poking into the CRTC state.

Then came the virtual planes. I think you'd agree that for the virtual 
planes we assign SSPPs to the CRTCs. My initial design kept enc_id for 
all the resources except the SSPP blocks (which were allocated per 
crtc_id). This was not perfect from the symmetry point of view.

Above all, filling the cstate in mode_set was too late for atomic_check 
to look into allocated LM to see if it supports MIXER_SOURCESPLIT or 
not. See dpu_plane_atomic_check().

I started by moving the cstate filling from the 
dpu_encoder_virt_atomic_mode_set() to dpu_encoder_virt_atomic_check(). 
And then it just became natural to turn it to be CRTC-centric code. The 
encoder doesn't have to peek into CRTC state. CRTC/plane do not have to 
delay the checks becasuse the necessary data is provided by the other 
party at a later point.

> Resource allocation is centered around LMs for the blocks we have seen 
> so far like LM, SSPP  but  ....

And LM is a CRTC.

> DSC is already an exception because in earlier chipsets we saw that PP 
> and DSC go together and cannot be muxed but later on that changed.
> 
> Now, I have explained this case but I am not getting why we need to make 
> the change for this series. Is it absolutely necessary?

Strictly, we don't. I can work around all the deficiencies of the 
current code. But it is more natural to do it now rather than later.

> 
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  16 +--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  10 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 119 ++++++++++----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  15 ++-
>>   4 files changed, 77 insertions(+), 83 deletions(-)


[trimmed the patch contents, it is not relevant to this discussion]

-- 
With best wishes
Dmitry

