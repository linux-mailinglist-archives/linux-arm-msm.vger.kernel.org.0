Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB61F21DA29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2020 17:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730138AbgGMPe7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jul 2020 11:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729920AbgGMPe7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jul 2020 11:34:59 -0400
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FA01C061755
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 08:34:58 -0700 (PDT)
Received: by mail-qv1-xf41.google.com with SMTP id ed14so5958449qvb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2020 08:34:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=dS/t0yiexaZCrqeV5/e3m7On60/CA6XnE/8+DugAd3o=;
        b=xhQXZmL6pVITnzChn/H4Xl7FN0rJWCuhMPQ2vGTPA/AIAUtsBpDMnNQwxyheYPKGk/
         B6+Y7DliDAxAiU2tZU4gzJ8giSUJRogsQGl3+pMMtNKAu6vzwh0jiB48C8x59kfmj6iT
         lLvnvrNpdDPbBqI1ZVoD16TSzIoIGIsGb2iXd3aQ4WfYYYsLsbnA/iTWCVv3lYTJ+4AG
         imFFHrVgTCnugO4wxWbKVSjpUcacpIhnVpeOj0iG6jgBeGLQ6vt4qUwEuBVdTMbUUlbH
         d9SRbMt8i2uPOkDyVLaau3Z3TDxsTBmKFbjNtY1ti7tuNpV+0GRUAn6JjAR3ILXPkuVo
         pDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=dS/t0yiexaZCrqeV5/e3m7On60/CA6XnE/8+DugAd3o=;
        b=KFHwsrBULYXDJjjLWPQGRfXeTDcE8a/52BrS0tcnGGUYP3yIlm7AfXmR+BbHKlMFNB
         pn7Nt8xwkdTTGc17yheZegqGpeJNApjnPPlGp73R0f2BQg8MhYNqG+Zt2O+S4gxbPBt0
         oWE8hdzXcgaZKP1wL5lUIgRDTUKzpqr4kbk/BTiStHjpD10CuVQie3HZ1MBrMx0yt0H/
         AssNU9zEtxLszjXmE5/zLYshbBX8iq44C2mqj0rossXrRe1/JoXu+OuGWyLXVuBMpbsX
         wiJzCJ8YzbIGKfvvxpKXZ8WOWqQhjF3qUerMT1jL+9Xjv+RLn8YicRhP4oNw9x6mcr7Y
         W/YA==
X-Gm-Message-State: AOAM530qQkeWMqir54qBP1XKsibrylOAMQ+Yl8vohQ/7UGOX4wH5f4zQ
        OHb2qLa47NfCnvQhhq+bdRwU9A==
X-Google-Smtp-Source: ABdhPJyBUaGS6buzVXPID50rG0JvO7x5+eFVDVsq9yIhY/8e/yNNVmJqXmePEKjoThhiDzsbBZ70GQ==
X-Received: by 2002:a05:6214:18f2:: with SMTP id ep18mr51647qvb.96.1594654497166;
        Mon, 13 Jul 2020 08:34:57 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 21sm19500226qkj.56.2020.07.13.08.34.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2020 08:34:56 -0700 (PDT)
Subject: Re: [RFC PATCH] interconnect: qcom: add functions to query addr/cmds
 for a path
To:     Georgi Djakov <georgi.djakov@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        kbuild test robot <lkp@intel.com>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        "open list:INTERCONNECT API" <linux-pm@vger.kernel.org>
References: <20200701042528.12321-1-jonathan@marek.ca>
 <3063d037-a781-6327-ef88-37b626c552e1@linaro.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <9f0628df-26b2-6ec8-3868-b2f72f0c8918@marek.ca>
Date:   Mon, 13 Jul 2020 11:33:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <3063d037-a781-6327-ef88-37b626c552e1@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/13/20 11:24 AM, Georgi Djakov wrote:
> On 7/1/20 07:25, Jonathan Marek wrote:
>> The a6xx GMU can vote for ddr and cnoc bandwidth, but it needs to be able
>> to query the interconnect driver for bcm addresses and commands.
> 
> It's not very clear to me how the GMU firmware would be dealing with this? Does
> anyone have an idea whether the GMU makes any bandwidth decisions? Or is it just
> a static configuration and it just enables/disables a TCS?
> 

The GMU is able to vote for bandwidth, and presumably RPMh is 
aggregating those votes with the votes from the interconnect driver. We 
need to be able to fill out the "struct a6xx_hfi_msg_bw_table" in 
drivers/gpu/drm/msm/adreno/a6xx_hfi.h, which has a table of DDR 
bandwidth cmds which can be selected when changing the GPU frequency 
(the bw field in a6xx_hfi_gx_bw_perf_vote_cmd).

 From Jordan: "the GMU registers a bus vote directly with the hardware. 
It should handle aggregation for us."

> I think that we can query the address from the cmd-db, but we have to know the
> bcm names and the path. All the BCM/TCS information looks to be very low-level
> and implementation specific, so exposing it through an API is not very good,
> but hard-coding all this information is not good either.
> 
> Thanks,
> Georgi
> 
>>
>> I'm not sure what is the best way to go about implementing this, this is
>> what I came up with.
>>
>> I included a quick example of how this can be used by the a6xx driver to
>> fill out the GMU bw_table (two ddr bandwidth levels in this example, note
>> this would be using the frequency table in dts and not hardcoded values).
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 20 ++++-------
>>   drivers/interconnect/qcom/icc-rpmh.c  | 50 +++++++++++++++++++++++++++
>>   include/soc/qcom/icc.h                | 11 ++++++
>>   3 files changed, 68 insertions(+), 13 deletions(-)
