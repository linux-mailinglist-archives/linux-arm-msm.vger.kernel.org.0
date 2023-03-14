Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4B76B9BE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 17:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbjCNQnT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 12:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230460AbjCNQnP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 12:43:15 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C85046A404
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 09:43:11 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id f18so20850575lfa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 09:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678812190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8/TWjd4CBothCXIvTP9DgULpqkXSW7ceaVVJBiGEEwE=;
        b=wnG3gjILLlyAswcJ1j7KdJKtUCwW4s99e3wcACD4beKplDdzwnlQ/XrrqgeYhupf/U
         YNkbbTiIZtHSTgHfbBRKMi6PLZdDz8kTGDXNHBdBLO3HjoHACEVEWkqD6IVMwi7OCLQZ
         qS0NDHsaIPMg3Y6U5Gd4N30JoYWl8rfAj1dRKyb4MNmiNdkSp/fcSAOeORc5T82wHIV5
         CWyKkWLlQYe6h7HigHrE3XMMgl7/a3OcHo/SxEVnYT3zjX9EMDNtPGZ+6T4bjU8dKBzd
         ZX66va28nqISbmGVuAZg2GDBCpTvv6VDYwp0SW4YwXEp5XliClggiNgeqChdCK4sFJSJ
         mD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678812190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8/TWjd4CBothCXIvTP9DgULpqkXSW7ceaVVJBiGEEwE=;
        b=cEFqOS34lfkcUwuwmQJwaeMzblJvl9DYyyjlipMSPU1b4utsB3849mV8vm2LQ5YFI0
         o+fHycuXzT2VBgQY0jj1G7daxN2IRQYeU1KIt7AKzrXyvkxflZPUoeHZ2LZqXsoSiQ8k
         8mccdIrNhMQR/vV5AfJia45nA5NjzJgFVDYLYssF47XE3JDi/Dr2qnaLBKPWBEE191xe
         Xmbn3HMLRZ5Yf1L4IUC/+zvbHJgQE6m6uh6VwCDBxGFsWx2bpU6J68Q8eeoNsjxKMEPm
         GByORJgk02Scv65SNiqHPkjbyiH6Df52ueRZAv7ii4vCKT+yHUojoOEaHDYW98PSiUXE
         Y1dA==
X-Gm-Message-State: AO0yUKVAFrbpz+nWLh+BXGhIAF45yaPHH0rv9XbNUEyq/7Xiye76NmQM
        4HLjA37m02F2G4bNFWaP8PJVMw==
X-Google-Smtp-Source: AK7set86DDTP/MBc/8VsLF0QuHYgI2xkOlxzcWektugVg6a59Dlmkl4uK0uRWfNd91QM3zrbzLXkhQ==
X-Received: by 2002:a05:6512:518:b0:4e8:4595:4a7c with SMTP id o24-20020a056512051800b004e845954a7cmr943352lfb.5.1678812189753;
        Tue, 14 Mar 2023 09:43:09 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u14-20020a056512094e00b004db0d26adb4sm459839lft.182.2023.03.14.09.43.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 09:43:09 -0700 (PDT)
Message-ID: <7e2cfd1b-d1a1-acd1-91fd-1abbd1a86a1b@linaro.org>
Date:   Tue, 14 Mar 2023 18:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 29/32] drm/msm/dpu: enable SmartDMA for the rest of the
 platforms
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
 <20230310005704.1332368-30-dmitry.baryshkov@linaro.org>
 <ec51367b-db01-9922-baeb-3233f56f056f@quicinc.com>
 <b5f6b856-4e15-3476-e5e7-4585641398ac@linaro.org>
 <6a570e7d-f67e-a95d-4e15-db78a8b4a29d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6a570e7d-f67e-a95d-4e15-db78a8b4a29d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/03/2023 18:35, Abhinav Kumar wrote:
> 
> 
> On 3/14/2023 3:58 AM, Dmitry Baryshkov wrote:
>> On 14/03/2023 07:08, Abhinav Kumar wrote:
>>>
>>>
>>> On 3/9/2023 4:57 PM, Dmitry Baryshkov wrote:
>>>> Enable SmartDMA features for the rest of the platforms where it is
>>>> supposed to work.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>
>>> I am so glad we split this. Without visual validation check we 
>>> wouldnt have caught the issues and would have ended up with a blank 
>>> half screen on our sc7280 CBs on DP.
>>
>> yes, the r_pipe was indeed mea culpa, when I didn't fully validate the 
>> results of a rebase. However this doesn't seem to be an 
>> sc7280-specific question. Are there any platform-specific issues with 
>> SmartDMA/multirect/planes revealed during testing? In other words, 
>> were there any issues which warrant this split?
>>
>>>
>>> For sc7280, I validated the foll cases:
>>
>> Thanks a lot!
>>
>>>
>>> 1) Basic Chrome UI comes up
>>> 2) Validated some browser use-cases and played some youtube videos
>>> 3) Validated multiple plug-in/plug-out cases with DP connected
>>> 4) IGT test cases with DP connected:
>>>      - kms_atomic
>>>      - kms_atomic_transition
>>>      - kms_pipe_basic_crc
>>>
>>> Some notes:
>>>
>>> 1) I wanted to test 4k with this too but my monitor only supports 
>>> 4k@60 which is not possible with 24bpp with 2 lanes and due to the 
>>> HBR3 black screen issue I could not test that so far. But since I 
>>> have that issue even with 1080P and without these changes, it should 
>>> have no effect due to this series.
>>>
>>> 2) I wanted to test some YUV overlay cases but I still cannot find 
>>> one on chrome. Its always using RGB. Will check with others.
>>
>> Testing YUV would definitely be a must, especially for the SSPP 
>> allocation. Can you possibly check whether contemporaty Xv 
>> implementation employs YUV planes? You can try that using `mpv -xo xv` 
>> or `mplayer -vo xv`
>>
> 
> Let me get some feedback from CrOS folks here instead of just trial and 
> error to find out.
> 
>>>
>>> With these two noted, this change and this series has my
>>>
>>> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
> 
> There is no guarantee we will end up finding the YUV case, you could 
> have retained the Tested-by for the efforts which were already put in 
> instead of just blatantly removing it.

I can add it back for v6 (or move sc7280 to the previous patch if you'd 
prefer that). Also I think the Tested-by should have included the 
#sc7280 comment. If you don't mind I'll add it.

>>> Only for sc7280 device.
>>>
>>> I still cannot give my R-b on this change till others validate 
>>> visually and ensure things arent broken for them.
>>>
>>> If we don't get enough validation and if only sc7280 remains in this 
>>> change, please re-post it with only that and I will give my R-b too.
>>

-- 
With best wishes
Dmitry

