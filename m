Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7474C74BA9B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jul 2023 02:38:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbjGHAiY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jul 2023 20:38:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjGHAiX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jul 2023 20:38:23 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B58819AE
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jul 2023 17:38:22 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b6f97c7115so38048021fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jul 2023 17:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688776700; x=1691368700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KeeFW0s8AAxhEGltgT7tiarBzEtrHHtHD4b0DBUGXug=;
        b=xKdvV1oTdSo9n9wuZNX0eObB3h3X6qfR9gS/XuxmG4081OUrFQ/hpdX/V7A7a2XpCZ
         joEAl+9HGbCZ7t6t8O/6HY8aL+nJNFIknKrGzeYcai1W8FNn0I9KypeyYQh5/a/dENP7
         X9BLXlvt42/pLNX0Z/SJiT2NFpTZW8PqTjFWNhODP/wzOvw+VohIrJGrI877gtIPEJLY
         hT/1V2eXj+Ir/rFyXCXzof3JJVIbvaI8LpcKpv373+5USIiz1peBKCMjjGFctRNjh+gR
         HZVGisdQBa92RiRNabuQ6g2+i8brahwMGcgis9OYJVinMm/VfmGwX+YCl0esLB7R7sBR
         cVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688776700; x=1691368700;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KeeFW0s8AAxhEGltgT7tiarBzEtrHHtHD4b0DBUGXug=;
        b=iCnaKeBvJr3q1zTKrAY95iT7RbO7zol4+wC8+RXwa/q0QbOxr9oMsjTnLmOpdC/ubD
         bQ8SAr7z2+RoXnfBKbjrglaFG8IdbJfiMTAzzu1wdBe7jMyq5VnDP8qtR1A8P6f4LF2p
         JoOyEYFViCHGtnNZqDG3SQk/GCew25PA9Sae4CfzR88b79emcIACDAeMRLyxdj+xf11a
         jm47rVw5hNAoRXkprtGLHYVoTDs5YmduAuuhh0TN7JIB4RXKeDneKCwc7RzMFDL2R6xu
         r7poTpDUfGitUjB8s1157ArnwXI/yAV+gPMlUgrzBkD8+8Xw4F7CTLKj/0B8tMzLzatH
         gJ5w==
X-Gm-Message-State: ABy/qLaFOFCV5N6GZpsxoP72OiVIVk4bnQPxQ4y6dlR1CkUxdwkQAMwz
        UgEhnroXr4RyhSkYqeCGKgSiBQ==
X-Google-Smtp-Source: APBJJlE7a66c8lI6xcPQtbOd8zyuPnnzOx8CcphvLu4weCUN1Xmbs/j2CLBDyUfctfXWi1daNHtCPQ==
X-Received: by 2002:a2e:9289:0:b0:2b5:81bc:43a8 with SMTP id d9-20020a2e9289000000b002b581bc43a8mr4509759ljh.0.1688776700712;
        Fri, 07 Jul 2023 17:38:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v22-20020a2e9256000000b002b6b849c894sm999362ljg.111.2023.07.07.17.38.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 17:38:20 -0700 (PDT)
Message-ID: <62114b30-a0bb-0f0a-0686-afb22159c118@linaro.org>
Date:   Sat, 8 Jul 2023 03:38:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 0/5] incorporate pm runtime framework and eDP clean up
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com,
        quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1688773943-3887-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/07/2023 02:52, Kuogee Hsieh wrote:
> Incorporate pm runtime framework into DP driver and clean up eDP
> by moving of_dp_aux_populate_bus() to probe()

Please use sensible prefix for cover letters too. It helps people 
understand, which driver/area is touched by the patchset.

> 
> Kuogee Hsieh (5):
>    drm/msm/dp: remove pm_runtime_xxx() from dp_power.c
>    drm/msm/dp: incorporate pm_runtime framework into DP driver
>    drm/msm/dp: delete EV_HPD_INIT_SETUP
>    drm/msm/dp: move relevant dp initialization code from bind() to
>      probe()
>    drm/msm/dp: move of_dp_aux_populate_bus() to probe for eDP
> 
>   drivers/gpu/drm/msm/dp/dp_aux.c     |  28 +++++
>   drivers/gpu/drm/msm/dp/dp_display.c | 204 +++++++++++++++++++++---------------
>   drivers/gpu/drm/msm/dp/dp_display.h |   1 -
>   drivers/gpu/drm/msm/dp/dp_power.c   |   9 --
>   4 files changed, 145 insertions(+), 97 deletions(-)
> 

-- 
With best wishes
Dmitry

