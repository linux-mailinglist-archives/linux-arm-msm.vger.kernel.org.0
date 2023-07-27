Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41F27765780
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jul 2023 17:26:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233356AbjG0P0s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jul 2023 11:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234587AbjG0P0r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jul 2023 11:26:47 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266B82D7E
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 08:26:43 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5221ee899a0so1412094a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jul 2023 08:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690471601; x=1691076401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=od4dDMOYFKmSK2nDsYcadLvFPYR/WS8PvJDqoO5zV3o=;
        b=MjDu5xGKr8AQ65AeTIuSEWC6NCB3lxLSX5axU+i4kloNTAnlLGR914i9H5wf5tu/el
         M1QZZpCRCVHCL6YtaXR1sVlG1JmTWg6DQ4H0CIv/c1c5Ff8wwjno7XOaXueWTdYQ9Qpv
         0EjV/mSCpaJ20i1uAICJZ9hDE2Ua1oleb2GA5vTCHv/G91+AIWAHiEvfTzO4S4WhHxfz
         DEIxlsPjuRWjdlSez2ZE4FBx+Q9hjgPZG8kkqksN2SI78ZQSnrVKnZYD1fhGEGkA4f2p
         +tXZsei/jr81irL3vLL7k4taj2xyL5aCob3fzUqXiF5YseK8BdoUgWyDzOKYZHLauDHN
         pC3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690471601; x=1691076401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=od4dDMOYFKmSK2nDsYcadLvFPYR/WS8PvJDqoO5zV3o=;
        b=XGWuWm2ukSWNrpqvITa9fqr7fgHsaSHQJgWNSLmvy9KMGuavooyYhxN8Jj6CvllmVT
         ON49YyanR7NuMa9uDD/lSa1l1ZhNTZeJzPkqcL01TzDbjTsQE9diL2k46vc5EOKAw0RE
         cqMs7uSn++41W3lV2r8jgH6KCzbkOr8uUw4rdT9EJAIylT/hZ5lGetpQBrmAehq1lxBI
         GVv8yEQXzhooy6wpNPJrCgwj1e6Jlzi+XdWuzbC+fj8opIlpbgjKl7TG7IQILBYaiUUM
         s2EkZRnp1YwdS/yTnGehdcOq+xdZeivVCSSnzhTCPZM8py//Hom5U9GHxcLwynoY9MqY
         uU8g==
X-Gm-Message-State: ABy/qLbOq2eP8jo8pu84QQ04vON/eL8X94LVG9LhmE7MCpDpZXty1Xn3
        V5nKBqvNOkWYPqga2zkbjNV1+Yk9Bi/QkobU3Cc=
X-Google-Smtp-Source: APBJJlEGFYyBK6bCKx12cpjZBXzsD3OOLv2xWyhS9LwN4W/6FLop61ZQg6MU6dYQMuw8tUVaF+LjQg==
X-Received: by 2002:aa7:c25a:0:b0:522:1b93:4cf3 with SMTP id y26-20020aa7c25a000000b005221b934cf3mr1919071edo.27.1690471601584;
        Thu, 27 Jul 2023 08:26:41 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id p4-20020a056402044400b00521d2f7459fsm766911edw.49.2023.07.27.08.26.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jul 2023 08:26:41 -0700 (PDT)
Message-ID: <ddb70b1e-57bb-a72f-018a-75da62cedb3a@linaro.org>
Date:   Thu, 27 Jul 2023 18:26:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/6] drm/msm/dpu: use MDSS data for programming SSPP
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-6-dmitry.baryshkov@linaro.org>
 <4e35dabb-640e-8de6-d98a-619b2f80cfb6@quicinc.com>
 <CAA8EJpoYc5M7GpTAUggjDhs+UQ8GcFcW7Y7xNs_zrNNN3Th-7A@mail.gmail.com>
 <81e527a4-f394-1bb5-769f-8b1f3eb01f40@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <81e527a4-f394-1bb5-769f-8b1f3eb01f40@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/07/2023 18:24, Abhinav Kumar wrote:
> 
> 
> On 7/27/2023 1:39 AM, Dmitry Baryshkov wrote:
>> On Thu, 27 Jul 2023 at 02:20, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
>>>> Switch to using data from MDSS driver to program the SSPP fetch and 
>>>> UBWC
>>>> configuration.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 18 +++++++++++-------
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  7 +++++--
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 16 +++++++++++++++-
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  1 +
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      |  3 ++-
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  2 ++
>>>>    6 files changed, 36 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>> index cf70a9bd1034..bfd82c2921af 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
>>>> @@ -8,6 +8,8 @@
>>>>    #include "dpu_hw_sspp.h"
>>>>    #include "dpu_kms.h"
>>>>
>>>> +#include "msm_mdss.h"
>>>> +
>>>>    #include <drm/drm_file.h>
>>>>
>>>>    #define DPU_FETCH_CONFIG_RESET_VALUE   0x00000087
>>>> @@ -308,26 +310,26 @@ static void dpu_hw_sspp_setup_format(struct 
>>>> dpu_sw_pipe *pipe,
>>>>                DPU_REG_WRITE(c, SSPP_FETCH_CONFIG,
>>>>                        DPU_FETCH_CONFIG_RESET_VALUE |
>>>>                        ctx->ubwc->highest_bank_bit << 18);
>>>
>>> Does this needs to be protected with if ctx->ubwc check?
>>
>> Yes... And it should have been already.
>>
>>>
>>>> -             switch (ctx->ubwc->ubwc_version) {
>>>> -             case DPU_HW_UBWC_VER_10:
>>>> +             switch (ctx->ubwc->ubwc_enc_version) {
>>>> +             case UBWC_1_0:
>>>
>>> The values of UBWC_x_x dont match the values of DPU_HW_UBWC_VER_xx.
>>> What was the reason for the catalog to go with DPU_HW_UBWC_VER_xx in the
>>> catalog for the encoder version in the first place? Because looking at
>>> the registers UBWC_x_x is the correct value.
>>>
>>> If we cannot find the reason why, it should be noted in the commit text
>>> that the values we are using did change.
>>
>> Huh? This is just an enum. It isn't a part of uABI, nor it is written
>> to the hardware.
>>
> 
> The reason is that, this switch case is moving from comparing one set of 
> values to totally different ones. So atleast that should be noted.
> 
> First thing that struck me was this point because the enums UBWC_x_x and 
> DPU_HW_UBWC_VER_xx dont match.
> 

Do you have any proposed text in mind?

-- 
With best wishes
Dmitry

