Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3615454ADF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jun 2022 12:10:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239083AbiFNKJf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jun 2022 06:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241413AbiFNKJ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jun 2022 06:09:29 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13844340C6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jun 2022 03:09:28 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id b7so9147188ljr.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jun 2022 03:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=DsZFrxKEYYtj45Hwk8U2QPz1/Ldjsw5xgixABi1aBlM=;
        b=v57NKOWEyQ6rhRAigKgq4T4hANl6Vaj0YPhvuEdBv0rPiC6k01c4kb5mUXsFZgAE25
         EnzbiYVVCYH/rOH6lBajNn7/uSJARAxlh4dFZgonTPQUbZT3qRfRJURG8BiKsYemA8I9
         QZBrr+dvumqLXERgoXkUMhch9UiSTrSMZJKSHJmL+X8KPrfriGHsgd/f4R4lf+QLqUAH
         fg+i4ZQcgel/hPovoFPahzd3u6jMPGhGakmjT5tOlA7NmWe2IBwnP46vi6PHBMF+3IsT
         4qV8AL+Nzi2s0v1GZbnGiMIn/Q1wg5f3X6lklzQp58SP4T+Vcl/kmAdYzzy/6eKwoHdm
         7PPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DsZFrxKEYYtj45Hwk8U2QPz1/Ldjsw5xgixABi1aBlM=;
        b=N3/W9i8bkPhNSjE/ErUTPoEAqHMPjDoPTh+kVnOpfQdMberYNelPpX/CFfxKbgVzGh
         CE6zN5j223ShMEo3gwk687Ddv9TKY+Bsje0M4nMoTdo2FkKDff5XeQaChbJR4G3hYvQi
         dTEMEnR7SbrtwRDJxq8wxy3MRr8UfuZRzS7fJelIcMm6k3Ru0sCTmxn6zyarmg5TnOuf
         q0WJNu0vKHPM3y+z8sq225vWYBBgwyBPFOXXNCUtKLX/KsKsDKm5Te7s9FfHoTs2t5tP
         5vKF4j9qmiaQC3MVkGVBLvL6fbEOtstFlRamYIFySlXXK5zLCp15E97EQSCOwh7R8P9+
         FLyA==
X-Gm-Message-State: AJIora8mUXxFgeuFO51XK6wu059p70imttF2HGg5/6RbjzdKTJyLjo13
        2labgp0gAgZ7epiFLUuqgWMgvQ==
X-Google-Smtp-Source: AGRyM1vkEYj3zCeaffJC38HgJLnsTcvhsAF4UYsrQgbbwqYDsuWMGZVtTKdXbGKJ23ksJ7rypPKDxg==
X-Received: by 2002:a2e:bd86:0:b0:24f:16a6:8c0e with SMTP id o6-20020a2ebd86000000b0024f16a68c0emr2085612ljq.450.1655201366296;
        Tue, 14 Jun 2022 03:09:26 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m20-20020a056512359400b004791c4858e0sm1337289lfr.114.2022.06.14.03.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jun 2022 03:09:25 -0700 (PDT)
Message-ID: <10ac04f9-6374-0f85-166c-223a220a8c0d@linaro.org>
Date:   Tue, 14 Jun 2022 13:09:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] drm/msm/mdp4: Fix refcount leak in mdp4_modeset_init_intf
Content-Language: en-GB
To:     Miaoqian Lin <linmq006@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        David Heidelberg <david@ixit.cz>,
        Guo Zhengkui <guozhengkui@vivo.com>,
        Xu Wang <vulab@iscas.ac.cn>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20220607110841.53889-1-linmq006@gmail.com>
 <059e0a81-3c0a-1c8f-90f0-a836da1204f5@quicinc.com>
 <0bdb3a64-e795-4aa0-86c9-efd7fc3d5a19@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <0bdb3a64-e795-4aa0-86c9-efd7fc3d5a19@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/06/2022 13:07, Miaoqian Lin wrote:
> Hi, Abhinav
> 
> On 2022/6/11 7:20, Abhinav Kumar wrote:
>>
>>
>> On 6/7/2022 4:08 AM, Miaoqian Lin wrote:
>>> of_graph_get_remote_node() returns remote device node pointer with
>>> refcount incremented, we should use of_node_put() on it
>>> when not need anymore.
>>> Add missing of_node_put() to avoid refcount leak.
>>>
>>> Fixes: 86418f90a4c1 ("drm: convert drivers to use of_graph_get_remote_node")
>>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>>> ---
>>>    drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>
>> This patch itself looks fine and will cover the cases when there was an error and we did not release the refcount.
>>
>> But, even in the normal cases I am not finding where we are releasing the refcount for the panel_node.
>>
>> I dont see a of_node_put() on mdp4_lcdc_encoder->panel_node.
>>
> Thanks for your review.
> 
> I don't see it either. It's a bit messy because the reference assigned to mdp4_lcdc_encoder->panel_node and mdp4_lvds_connector->panel_node both.

I have a plan to rework mdp4 lcdc support once I get my ifc6410 lvds 
cable. Thus I think we can land this patch now and fix the mdp4 
lcdc/lvds code leaking the reference in the due time.

> 
>> Am i missing something?
>>
>>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>> index fb48c8c19ec3..17cb1fc78379 100644
>>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>>> @@ -216,6 +216,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
>>>            encoder = mdp4_lcdc_encoder_init(dev, panel_node);
>>>            if (IS_ERR(encoder)) {
>>>                DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
>>> +            of_node_put(panel_node);
>>>                return PTR_ERR(encoder);
>>>            }
>>>    @@ -225,6 +226,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
>>>            connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
>>>            if (IS_ERR(connector)) {
>>>                DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
>>> +            of_node_put(panel_node);
>>>                return PTR_ERR(connector);
>>>            }
>>>    


-- 
With best wishes
Dmitry
