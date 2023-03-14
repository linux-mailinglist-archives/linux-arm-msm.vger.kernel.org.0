Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45C4B6B90CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 11:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjCNK6g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 06:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbjCNK60 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 06:58:26 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F06837B135
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 03:58:24 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id t14so15560975ljd.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 03:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678791503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qP60u4788MaFi0kZvL919+WIXEi/4Tk3Afs8oe5NkX8=;
        b=OJXq79POIp9kOqID8L84EH3SnZ/joseEuy328WBYd8QyX68zRM8NEa1WNU4oBUmcEd
         PxGyb0wfjQ6D85XZjr7juB6tLhACoR5kS1x/mMBFGfHrmXEZS+o7TLJzMoC6fg4xPcBA
         ITJvb/WLLaOZD0Fvcoc4eZRHonYy/EFfjCICHH1dBX8aXyds0mM5fb4zLd1bps07iB6v
         dqM2J3w7+kYfbjXpGfAR2J77gCg+i2JTLHDDYNnDHEnvb5LLijwVhdf4etXGhKwmH9kg
         c4JEVDjQ2qSXMLUeue2OzNWbCrI7I1HBEaKxbNOnMWhdLEnfNET+WP93hQLwsFKMh7RF
         Vk6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678791503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qP60u4788MaFi0kZvL919+WIXEi/4Tk3Afs8oe5NkX8=;
        b=4DR6QUd3d6/VzODzhtyXXllYUwtgzNb6xTXaeubr8av566VAR/Kb3lcVb19/szvIoV
         oRqrLIpGapEJa26CZSN5/y0Kiri7bJ2vIGs+t/e5ZA0IyQPT6FKNJaC/NKOkHhQbszCP
         cJg6AZKbAa7zbJPhTRWceQWT2kcqzAomgss23mx+4OgeoFxTurrFqSaN8vvRZyhCp7vE
         ZIrl95y9gpJ5RAcRNmlhEtiqY4kpAFMhviJnZP0TjDSrPnjpEZIp4r9Ljjxl+56HQ1jr
         hNrgWCThm2barYRcKnqjpBwAiSpgCU3v84JrPXg6UQp0+LpWnHjQYof9Bdw3ithPpiTb
         2j1Q==
X-Gm-Message-State: AO0yUKUmWQA9jndtgUUkV+bA+wstMiUiulVCERTx8zAsx8Zf642lG9ri
        HQQuNGWDCuY2tCNn83jR14+udg==
X-Google-Smtp-Source: AK7set97VqnLynjHxDbEIQoPUgU2SXm7q9WFivmKfvZYPUNialTgc27yIxn2ya3BaofDiBE+qIZ1bw==
X-Received: by 2002:a2e:a4af:0:b0:295:a3aa:e7d8 with SMTP id g15-20020a2ea4af000000b00295a3aae7d8mr12784486ljm.29.1678791503196;
        Tue, 14 Mar 2023 03:58:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id e4-20020a2e9304000000b00295bbe17b46sm390653ljh.132.2023.03.14.03.58.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 03:58:22 -0700 (PDT)
Message-ID: <b5f6b856-4e15-3476-e5e7-4585641398ac@linaro.org>
Date:   Tue, 14 Mar 2023 12:58:22 +0200
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ec51367b-db01-9922-baeb-3233f56f056f@quicinc.com>
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

On 14/03/2023 07:08, Abhinav Kumar wrote:
> 
> 
> On 3/9/2023 4:57 PM, Dmitry Baryshkov wrote:
>> Enable SmartDMA features for the rest of the platforms where it is
>> supposed to work.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I am so glad we split this. Without visual validation check we wouldnt 
> have caught the issues and would have ended up with a blank half screen 
> on our sc7280 CBs on DP.

yes, the r_pipe was indeed mea culpa, when I didn't fully validate the 
results of a rebase. However this doesn't seem to be an sc7280-specific 
question. Are there any platform-specific issues with 
SmartDMA/multirect/planes revealed during testing? In other words, were 
there any issues which warrant this split?

> 
> For sc7280, I validated the foll cases:

Thanks a lot!

> 
> 1) Basic Chrome UI comes up
> 2) Validated some browser use-cases and played some youtube videos
> 3) Validated multiple plug-in/plug-out cases with DP connected
> 4) IGT test cases with DP connected:
>      - kms_atomic
>      - kms_atomic_transition
>      - kms_pipe_basic_crc
> 
> Some notes:
> 
> 1) I wanted to test 4k with this too but my monitor only supports 4k@60 
> which is not possible with 24bpp with 2 lanes and due to the HBR3 black 
> screen issue I could not test that so far. But since I have that issue 
> even with 1080P and without these changes, it should have no effect due 
> to this series.
> 
> 2) I wanted to test some YUV overlay cases but I still cannot find one 
> on chrome. Its always using RGB. Will check with others.

Testing YUV would definitely be a must, especially for the SSPP 
allocation. Can you possibly check whether contemporaty Xv 
implementation employs YUV planes? You can try that using `mpv -xo xv` 
or `mplayer -vo xv`

> 
> With these two noted, this change and this series has my
> 
> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Only for sc7280 device.
> 
> I still cannot give my R-b on this change till others validate visually 
> and ensure things arent broken for them.
> 
> If we don't get enough validation and if only sc7280 remains in this 
> change, please re-post it with only that and I will give my R-b too.

-- 
With best wishes
Dmitry

