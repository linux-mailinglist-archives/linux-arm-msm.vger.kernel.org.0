Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5357455224
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 02:23:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239951AbhKRB0U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 20:26:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237730AbhKRB0T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 20:26:19 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B14C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 17:23:20 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso8079508otj.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Nov 2021 17:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=a2gBb51PSDI2uZh/kk0Tzm+QaarIKPnZpY56tomY9/c=;
        b=L7/XQphn9oytfiHo1dNoGGG2NLFL6122KEbhIzxD1+4DMsfoTLXzHk6LTL4hiuWcUf
         ocpX64aNys4SQUo2OdzUw0nN18tTfFv/DUAcOveK3OQpbJHVF1kA6raIFNGbby7Ggi1V
         0WZJ2cgOcMBAgGH6B//hiPDJYJ7c0SA58b/e+Ef6Li1gmEGVXFo8vQbxt/iq+dIISJW1
         /nBtLWDRr+casUf2YxAGRR81luqhdcrsmOsF2uIAFuvUW0ih5TaNkKxx1f3my3p8hsPa
         wRjYdquelf3xRPsRQqZx4HH/GGHBOoQLtMBPLA2dbbph33LQFJADZNIdznSNXWyUNGTM
         TKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=a2gBb51PSDI2uZh/kk0Tzm+QaarIKPnZpY56tomY9/c=;
        b=GGt56FrQCE2bmR+ihoNxoWCqa9ny0t50iyUAz3j/AdM+vjr1g42059jIZl6yD4H1Sc
         HKR47h8/WLoYUG713JZ83r/TQ7LpLiWhsX+KkRKhyC10puQ6aMz9OZmNkT+QhhHhIk96
         lIzjVfYRTsgf6p+Cf2KrtTIr+Fl32/5rYpG/6AVF4AJYthn3nkd7evGXB+ZGkGoB8wj+
         UixR30ZFiYaSe7wI3O8uSiw270m/fHV5aDb+PG0MQnQsHm0SNJFcwHGGFz90eagmNSaG
         +Y9Qra4cSJmgmtBbKrKyDdLz7HBV+NxN49IN9S4FwawtwkcIAua4EtpVxLziMIAFUnlG
         dSJA==
X-Gm-Message-State: AOAM533MeAuuXEecQkV+fX2yx382/kgDx3l5Vm0DBbfMwC7EwGbygVc4
        EAmP1/rcHSBmMlm53vA/JTvH/Q==
X-Google-Smtp-Source: ABdhPJwt5iqWyw+7+XcHVrcQ0vfSgPSyFiKkhDfr0apjKuD+xkntug2oq0SL7Glq+eCIC4elNfBvhQ==
X-Received: by 2002:a9d:2282:: with SMTP id y2mr17579213ota.151.1637198599564;
        Wed, 17 Nov 2021 17:23:19 -0800 (PST)
Received: from [192.168.11.48] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id s17sm304093otp.20.2021.11.17.17.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 17:23:19 -0800 (PST)
Message-ID: <0336e09d-59c4-3155-434a-0b04fda15bb6@kali.org>
Date:   Wed, 17 Nov 2021 19:23:17 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH] drm/scheduler: fix
 drm_sched_job_add_implicit_dependencies harder
Content-Language: en-US
To:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
        Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>
References: <20211116155545.473311-1-robdclark@gmail.com>
 <CAMi1Hd0qzu1t6QeZCNgSoTrScZL0_XQnZUPkQ5y7D+oV49GREw@mail.gmail.com>
 <c7741be3-43ec-307b-f5bd-3d19725df76c@amd.com>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <c7741be3-43ec-307b-f5bd-3d19725df76c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 11/17/21 1:27 AM, Christian König wrote:
> Am 16.11.21 um 19:30 schrieb Amit Pundir:
>> On Tue, 16 Nov 2021 at 21:21, Rob Clark <robdclark@gmail.com> wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> drm_sched_job_add_dependency() could drop the last ref, so we need 
>>> to do
>>> the dma_fence_get() first.
>>>
>> It fixed the splats I saw on RB5 (sm8250 | A650). Thanks.
>>
>> Tested-by: Amit Pundir <amit.pundir@linaro.org>
>
> I've added my rb, pushed this with the original fix to drm-misc-fixes 
> and cleaned up the obvious fallout between drm-misc-fixes and 
> drm-misc-next in drm-tip.
>
> Thanks for the help and sorry for the noise,
> Christian.
>
I've run into this splat on the Lenovo Yoga C630 on 5.16-rc1 - are these 
2 patches (which fix it) going to be heading to 5.16 or were they 
targeted at 5.17?

-- steev

