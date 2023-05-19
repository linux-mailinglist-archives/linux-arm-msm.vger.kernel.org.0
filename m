Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1C54709C14
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 18:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjESQLb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 May 2023 12:11:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjESQL2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 May 2023 12:11:28 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65472C9
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 09:11:27 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f1411e8111so3824012e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 May 2023 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684512685; x=1687104685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iB4GoJ4t0unqfI6RbJqjJl5q2OVPl3jlWsN9nEHUQOo=;
        b=XimcjwpseN4sg/6ILLyI/wh2VOsqCS8pQ4ecnvF2uepxVZXp6gms4bDvHJSJLBJSMf
         rjo9kZioiKT7Kx8+xZdIyT6d6rtW952XUNS/eZUBY8LHvcKmnTs8BJMffD/k+sc4YnJU
         BJzjSpqG64IO0SzYb/K5KpTURXhBmdTS+GRbsMIxaPBBFslGKC27uRwaxTcJt4PbatBw
         tbzie0boYM2nsDM7YTXxlrvWTssgBXrVaB6dKyFy43QgxyuznaNW3ukHgVL+4eAzVTyL
         rQTFm+h1n20PMECoQvqCf0BTj3a8K/Ti+3xdmQoAF8ko8YpUhd8waQJgZ8I8/Pl/VrUa
         ehBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684512685; x=1687104685;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iB4GoJ4t0unqfI6RbJqjJl5q2OVPl3jlWsN9nEHUQOo=;
        b=bdlW0zTS/O3JzsV5yS7AYmT1Mu1XhuqgozYNBofQoPI1qqR5IDTD/7nxDaRdHYt4/m
         PgCAu99nO1RWnDblh+SvAHZ/0VOepQY8M+lKtyo6Hmmg3dhLQPG4Bi0kGGSfElAIF2pf
         v+X/zW1sASZZMohqOKf/rEoRg7Uf6ML6vR7bUuxKxqpWJYm+0Nfapt4b5aIeKUlu+BXk
         va1maswrvwL0w/uuGsNxQlqyU4HdE03CeBSf8Ry9o5boBKVhZWW1F81jS0P/ZBFw5MKZ
         A8eUZCKDuvX3Scc+INtTkt4Fnxfpu/73jHCrtGez5egpHKoF6s6ojHVS0uOxJrRdyjwK
         HG+w==
X-Gm-Message-State: AC+VfDwQ7JLwnfCZjSYJQHRM9AZMUitDvhPAdz45nAljxOA89FbdqSg6
        0jH/5GD3bX7rqkj7Ohpzs3QyqQ==
X-Google-Smtp-Source: ACHHUZ5z21vkYtp5meWScZ8B3BaN1oGbfOr57BlfM1oNMpVjSqX6CCEXxlt51V05SdPYFUuSQq/LkQ==
X-Received: by 2002:ac2:4e4c:0:b0:4f3:ac64:84f5 with SMTP id f12-20020ac24e4c000000b004f3ac6484f5mr830298lfr.36.1684512685655;
        Fri, 19 May 2023 09:11:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v11-20020a2e924b000000b002adc5ea2791sm842378ljg.103.2023.05.19.09.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 09:11:25 -0700 (PDT)
Message-ID: <7cbc5958-542a-9119-e16d-9967a2131f1d@linaro.org>
Date:   Fri, 19 May 2023 19:11:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] drm/msm/dpu: remove CRTC frame event callback
 registration
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230102154748.951328-1-dmitry.baryshkov@linaro.org>
 <20230102154748.951328-2-dmitry.baryshkov@linaro.org>
 <bba66f67-8c9a-1372-a3a4-2f19e966b6a0@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <bba66f67-8c9a-1372-a3a4-2f19e966b6a0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/01/2023 02:49, Abhinav Kumar wrote:
> 
> 
> On 1/2/2023 7:47 AM, Dmitry Baryshkov wrote:
>> The frame event callback is always set to dpu_crtc_frame_event_cb() (or
>> to NULL) and the data is always either the CRTC itself or NULL
>> (correpondingly). Thus drop the event callback registration, call the
>> dpu_crtc_frame_event_cb() directly and gate on the dpu_enc->crtc
>> assigned using dpu_encoder_assign_crtc().
> 
> I suggest you wait till we sort out the PSR series for this, especially 
> this patch https://patchwork.freedesktop.org/patch/515787/
> 
> There is going to be some change in this code when PSR is pushed again 
> sometime early next week because PSR will touch the crtc assignment code 
> (dpu_enc->crtc),
> 
> Based on how we all like that patch, we can get back to this one as this 
> one is a minor cleanup.

As the PSR series have landed, I'd like to point to this patch again.

> 
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 17 +--------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    | 14 +++++++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 +++------------------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 10 -----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   |  4 --
>>   5 files changed, 21 insertions(+), 65 deletions(-)


-- 
With best wishes
Dmitry

