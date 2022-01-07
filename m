Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D40B34871FD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jan 2022 06:10:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbiAGFKz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jan 2022 00:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbiAGFKz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jan 2022 00:10:55 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98C7AC061245
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 21:10:54 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id p13so11451281lfh.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 21:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0yKFhRVY+tmgEn1pnh2jXYO28tsu8Fn3zCjKHC19tG8=;
        b=LM0sBgoiXVAKVgYQ7hvH4qn4ssRopfXMNhWLdwSG93358RsmXHTyImGboqD8IcX2yZ
         XsuwL+phqMqClkbLW8JgbRRSAcvDGKX4LDZClZlqdJAJ7QCctHNWOwEyu0FTWWADbnVS
         G9P2iuSHEuWX8dSL4vQSRNZySy6NMAWL+iqqMCzHCKGepTut/fVYAoUxwnpbJ7ZW2sCq
         SiiZDOqZJBl20lZ8ai9g5+aCnmbrNWadJHgusUtHVOOy8LgihZNZeKXfgPJWBnxEk+ts
         44Pwrfq40iKeadDW7xd1GolnM9r0onIm6TpRyvuyIpK0FS7KDVUMb/FaOhDRBbQe7Lbl
         X2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0yKFhRVY+tmgEn1pnh2jXYO28tsu8Fn3zCjKHC19tG8=;
        b=a0vCWE4HA1nb4g37j+GqkxVE0VvF3OkQOOW8Er8kEWtj7r0N1fOlzo/DEOuBwvuEpx
         JgeJcRoym4Z4bJeitWzn9J+4PJU8KcVCeidrvH2f+qLi9xmlTpi+kMN6UuFNrd+gKhYg
         1HZn4LxVbZM0vO0Wv0aK6O9Pu88mDG2Yk2yCZloPnFf1+jTCC1a/HI731lrOVkcWZptO
         FhDvuHF2FwX4FWFOe+8L7dj3zkjQUbFuOV1174aEPY5lPNCCfG8a4NqbasRCdNmTCkwf
         Tqiz8Rwr7CUQZ3Iz2DaJWsHiM0df2kOT3fYUQWWrhkExK/+ISP3PG9NshE/erd7xgMiQ
         tMUA==
X-Gm-Message-State: AOAM533+Kcl41M+A5MPvyTY8eD6doe6R6JsPRwbtscm+0yPl88PBZmX6
        WCzJS0JDc7SXt07SYm+zARAEmUiEjnfICA==
X-Google-Smtp-Source: ABdhPJyDg1mIC7X2483Y3Ph4N0x5XTKoCpdyLSZUkspnNO0POxxLCuN5JpcD+sVxqaZCVr+5JN7Y0w==
X-Received: by 2002:ac2:4f02:: with SMTP id k2mr54882293lfr.421.1641532252898;
        Thu, 06 Jan 2022 21:10:52 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p20sm431865lfu.270.2022.01.06.21.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 21:10:52 -0800 (PST)
Message-ID: <0c63a37b-4db9-678b-38a5-c6470bbd0565@linaro.org>
Date:   Fri, 7 Jan 2022 08:10:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [RFC PATCH 1/7] drm/msm/dp: fix panel bridge attachment
Content-Language: en-GB
To:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
 <20220107020132.587811-2-dmitry.baryshkov@linaro.org>
 <CAE-0n52vvqW7ba5zw_jrqpW=ky_Pas=binMe-nYbr=8OQZs_jQ@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n52vvqW7ba5zw_jrqpW=ky_Pas=binMe-nYbr=8OQZs_jQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/01/2022 06:37, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-01-06 18:01:26)
>> In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
>> enable and disable") the DP driver received a drm_bridge instance, which
>> is always attached to the encoder as a root bridge. However it conflicts
>> with the panel_bridge support for eDP panels.
> 
> Can you elaborate here? How does it conflict? Could be as simple as "it
> attaches before the panel bridge can attach to the root" or something
> like that.

Actually it would be the other way around: panel bridge attaching before 
the "dp" one. But yes, you got the idea. I'll extend the patch's 
description.

>> Change panel_bridge
>> attachment to come after dp_bridge attachment.
>>


-- 
With best wishes
Dmitry
