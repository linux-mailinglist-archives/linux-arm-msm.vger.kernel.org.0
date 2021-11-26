Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2B145F63F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 22:18:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242839AbhKZVV6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Nov 2021 16:21:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241648AbhKZVT6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Nov 2021 16:19:58 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05E8C061761
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Nov 2021 13:12:41 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id m27so27013127lfj.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Nov 2021 13:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=glFbJYk/OCRB+Myc+eRLL5T3IffkyOcS0fXVl203dm8=;
        b=N7Qzeum3GzIzB+2gQBBBYm8GjTuEmBHS86g6z2VQDOsK24uRFwnn26Fbu0srLERVjr
         kRR+qlTs90e0bB/lDsSGPfFYvi7tQT/Gl4yF2oSpiM2P1UlLPTuCbLNby6TkkZt0qHdM
         qmPX6wMGUgba7eQ2J9XuwL0+AB6KYaOAs4z+Fb4d9U2xvdi//7ezJ8q7myBe2y8Sp/lo
         ApZgHb5OPgjmGVdV784vFAQFBU3O7C5GsLDRwURMrvB0XdAJy/J49TmdEbp/5QaASum3
         b/6Ay9i3tbYfQtQ3mthBVPWH8kkVUGZ6SV3PthQEJohRk/e7Pd9hsgQAFqtBANsLwKuD
         kuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=glFbJYk/OCRB+Myc+eRLL5T3IffkyOcS0fXVl203dm8=;
        b=N2/CZDqQB4Dg5SgzQ4TOXM9qevsIhetx5bJiXLaq/0rki5is5MLpU3ktgmFO3WDvAr
         8P320IRmYCRp1wGsy3lydfE0VrSB9gr0neWJXf1BArITlCe3c02puNBBkXA/xNqy/0DU
         brlLgElfOEM1oexUKUz+B7srAmv+PAE8Duf2/zcWvTdZRzj1mkSJg8/ZCwLH+BX4mrlO
         SyA5nQtDo1s0O8vR93E1ImIKHhqFBUvFhjMzSzBHdirodPrfTSaAH9XCzyiHiwFfnKxM
         eFIrSQGq2Y1wHPFKgG3V/Q2GXSvoSlwtKNL0SHxY52lzIwTmbx3qRejoQ/qfJguAPoaO
         s71Q==
X-Gm-Message-State: AOAM530NNSgEf66Bl76nT76IN2p3F3ORWoWVeXBCbiX1pfbz+4BFQIQQ
        8D0VlZ5Lo7YbnYDidV7teeQVBA==
X-Google-Smtp-Source: ABdhPJw3D1SD/ptuYpCjS2LX7StqIYZZl5g1Pk5sJdNW2SKParlto1oi5itKdQdBmwPOtIhpGYCM9w==
X-Received: by 2002:a05:6512:10c4:: with SMTP id k4mr32023546lfg.373.1637961160062;
        Fri, 26 Nov 2021 13:12:40 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id br24sm586210lfb.104.2021.11.26.13.12.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Nov 2021 13:12:39 -0800 (PST)
Subject: Re: [PATCH] drm/msm: Initialize MDSS irq domain at probe time
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, robdclark@gmail.com
Cc:     sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        maxime@cerno.tech, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com,
        konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        jami.kettunen@somainline.org
References: <20211125150947.354076-1-angelogioacchino.delregno@collabora.com>
 <32cdade5-1487-9182-e939-4d93f8a27ad6@linaro.org>
 <2b37dfd3-c3be-2640-56d0-25c9971c4f50@collabora.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <04bec750-33e2-c747-dc54-d304296831fa@linaro.org>
Date:   Sat, 27 Nov 2021 00:12:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <2b37dfd3-c3be-2640-56d0-25c9971c4f50@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/11/2021 12:26, AngeloGioacchino Del Regno wrote:
> Il 26/11/21 01:06, Dmitry Baryshkov ha scritto:
>> On 25/11/2021 18:09, AngeloGioacchino Del Regno wrote:
>>> Since commit 8f59ee9a570c ("drm/msm/dsi: Adjust probe order"), the
>>> DSI host gets initialized earlier, but this caused unability to probe
>>> the entire stack of components because they all depend on interrupts
>>> coming from the main `mdss` node (mdp5, or dpu1).
>>>
>>> To fix this issue, also anticipate probing mdp5 or dpu1 by initializing
>>> them at msm_pdev_probe() time: this will make sure that we add the
>>> required interrupt controller mapping before dsi and/or other components
>>> try to initialize, finally satisfying the dependency.
>>>
>>> While at it, also change the allocation of msm_drm_private to use the
>>> devm variant of kzalloc().
>>>
>>> Fixes: 8f59ee9a570c ("drm/msm/dsi: Adjust probe order")
>>> Signed-off-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>
>> Another issue (or a pack of issues):
>> Now the msm_drm_init() is unbalanced with msm_drm_uninit(). Bits of 
>> code (putting the drm dev, removing the IRQ domain, etc) have to be 
>> called now from the msm_pdev_remove() function rather than from the 
>> unbind path.
>>
>> The following changes fix the observed issues here, however additional 
>> care should be taken.
>>
> 
> 
> Hello Dmitry,
> 
> thanks for the thorough review (and solutions!).
> Are you going to push your changes on top, or should I send a V2?

Please send a v2. As you see, my suggestions have to be validated too 
(and they were based on crashes/issues observed locally).


-- 
With best wishes
Dmitry
