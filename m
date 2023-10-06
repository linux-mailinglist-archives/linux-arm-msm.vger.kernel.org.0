Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52A417BB952
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Oct 2023 15:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232413AbjJFNi5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Oct 2023 09:38:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232412AbjJFNi4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Oct 2023 09:38:56 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB91183
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Oct 2023 06:38:54 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-503056c8195so2788059e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Oct 2023 06:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696599533; x=1697204333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ajh5orkYs0bY+A53wDjwFGIy9BjxHiqDWVeEzj1BGjk=;
        b=HxCLLnZpdgJwcKT8D/8g//DKPqI79RqlxIyJzhDVnLmhxHLKlqFKgQ/ET+lI22pyjp
         sDbqPbjL3aRWQ07y7pRQtOn6Cf/yJBRmRKdO8E4lHdavKLPvsVwwMjxLhI8Of8xrF4Fo
         BAzLVTyvCc7mOMv6qV/kltmemrC1da5Eur7xTlpxe2KQHzVw7x7gBfp/HCoRA6DCTAcC
         BqNlexzvwAk/SY5vllWcJbofgiVbqhypEim1yR1zGYO/FfpaQnn3nzEKTNtz61MFghbc
         jk43aqkVaxIpfgebuz6nZHdnMASUU9FnruqS7N43+BTXvJznuRkOT3klTXyBq4f6hLPE
         Ajyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696599533; x=1697204333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ajh5orkYs0bY+A53wDjwFGIy9BjxHiqDWVeEzj1BGjk=;
        b=GZiSSSC65/EoUyMBTBbi2OXumG8dwNjYoS2WBFzzYo7tQpaOvsWA5G7Tx8UgRdkT72
         PCGH1AQsTahBYx9KkP6M50Q0UMjVZ1dWNcQfH7ojAfIvmzjYdwa09BKdqVRV/9JEwKvX
         LOxmVUGw170D9Li+LjRL6Y79Nlkj+/CX0MvH13biMUjWpzcM7i2tWKOTYsQ3j5GvPmJj
         DYKw9p/CixOYJGkW7cZI+BssHbbp3iFRXg2s4/99AOeW+SoAgZ1n7uGQiiEi+taLvL9K
         Ap4vCVlYhI2CfcRybyMhBJD9ux0BNWEM0Z5X8PmUvAhQe22grgFHBz04nkHn9NVAusvV
         gK8Q==
X-Gm-Message-State: AOJu0Yym7QoFI03/ZpByB092b0E3ghh/spQ/MbNWtqSs5UIjCPz6AEHa
        u2nWPjYmlbkDvcu8GgtcfE7EkQ==
X-Google-Smtp-Source: AGHT+IGI/OkA11luu2j0zchtIZHSo/P6NPEIrwif1NURLFUY+rnHRJLSg1Uf0BrhIrD6RKXyO9zwAw==
X-Received: by 2002:a05:6512:b25:b0:503:38bc:e68c with SMTP id w37-20020a0565120b2500b0050338bce68cmr6330327lfu.47.1696599532998;
        Fri, 06 Oct 2023 06:38:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id j7-20020a19f507000000b005057184ae5dsm308523lfb.119.2023.10.06.06.38.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Oct 2023 06:38:52 -0700 (PDT)
Message-ID: <019e66c4-8188-4fbb-b169-d2cec165c91b@linaro.org>
Date:   Fri, 6 Oct 2023 16:38:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] drm/msm/dpu: add support for MSM8953
Content-Language: en-GB
To:     Luca Weiss <luca@z3ntu.xyz>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230923214912.1095024-1-dmitry.baryshkov@linaro.org>
 <20230923214912.1095024-2-dmitry.baryshkov@linaro.org>
 <5711857.DvuYhMxLoT@z3ntu.xyz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5711857.DvuYhMxLoT@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/09/2023 23:52, Luca Weiss wrote:
> On Samstag, 23. September 2023 23:49:10 CEST Dmitry Baryshkov wrote:
>> Experimental support for MSM8953, which has MDP5 v1.16. It looks like
>> trimmed down version of MSM8996. Less SSPP, LM and PP blocks. No DSC,
>> etc.
>>
> 
> Hi Dmitry,
> 
> As written on IRC, on sdm632-fairphone-fp3 with this DPU patches the screen is
> initializing and displaying stuff :) But there's some errors, which presumably
> are the reason that the screen is only updating a few times per second.
> 
> [   22.774205] [drm:dpu_kms_hw_init:1164] dpu hardware revision:0x10100000
> [   23.099806] [drm:_dpu_encoder_phys_cmd_wait_for_ctl_start:657] [dpu error]enc31 intf1 ctl start interrupt wait failed
> [   23.099821] [drm:dpu_kms_wait_for_commit_done:495] [dpu error]wait for commit done returned -22
> 
> These messages appear about 13 times per second but as I mentioned, the screen
> *is* updating (slowly) there.

For my understanding, does it work with the MDP5 driver?

> 
> Also you for sure forgot to add "qcom,msm8953-mdp5" to the
> msm_mdp5_dpu_migration list, without this DPU is never even considered for
> 8953.

-- 
With best wishes
Dmitry

