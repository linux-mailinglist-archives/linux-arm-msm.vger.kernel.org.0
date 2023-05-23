Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BF6270DF73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 16:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230228AbjEWOhp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 10:37:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbjEWOho (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 10:37:44 -0400
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AAF2E0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:37:42 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-4f4b256a0c9so2437886e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684852601; x=1687444601;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c7ocuvFCcfF3A0FWpWbXCb8imInW5CeToUEyN2l4YxU=;
        b=LzYugZoz46SydEu7tDkdVvhbkOROFYBbOradLxpnVnac6LydanHcJjvNI+5i6Plgjv
         C6zztM1w8q92QWXT0N4bDfLZKyvBgZvACVRq77R94NBCmH+6MhFhpkhKcOQoWyh8Vd+X
         Zk0nEaxChA7ngNYY6sqjgBcOiC+L30JmWHtpDnSct+5i1kxYZc3BAL2YsRxeM9x9mr3m
         3OFACriffw+FwfUXSB1Pw2iC10gKBf1+36yc/oPsB/q8DN29uKg/ClszEcErOEkkprz3
         1kGadQRgyWlx/9duiYPA0Ktkb+QKhRmp6wTgAB/U+lpyxSBuYRucnRS/EL54QjbTAER1
         db8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684852601; x=1687444601;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c7ocuvFCcfF3A0FWpWbXCb8imInW5CeToUEyN2l4YxU=;
        b=XCV7r68OqTnR9FNTDc+S6PD98HXNKL+1it/IAVac/ZW8CUC0ozJ8AJhJrkAmpmdH6u
         fTzUy3fnBAIKV61vSRQ0FeVuU7K/FaCQduuMvrUcDwarJPz5fhdl7/Tp1WY5bmwwR+O8
         wm7rFIhs2+ezdtgCWXshQpNQrGhmhVCzPjWdYT/KqMF9ZfAHsoUqI7ObbqmEKHSTBAnk
         q+x7HYvNwn2CZE0dlOe/jmPlEgC5OedAJZZMUootnvU2hYK57rgAQ5f83sMi07V9beT6
         /JLx6Zxt87TJl8SfkbOYamLe/noCrPqyiL0vz51L6/MWdvYFpuuQzATtH9g0PqPJDgcV
         yIjg==
X-Gm-Message-State: AC+VfDwB7dhKgEA9gv1VsV81B/iinb3xjerGwsW4XcTdHr8TZ6tKz1pm
        kB1yjEvmOLBA+BjNSnKm/Hj0aQ==
X-Google-Smtp-Source: ACHHUZ4zGlQ11pfxTGA0iTEHBRx+KcTRF0EK7y6TX77S6BxQAnSdRxPdEdlaQqfXU8T7iUjX/f4WIg==
X-Received: by 2002:ac2:5a02:0:b0:4ea:fabb:4db1 with SMTP id q2-20020ac25a02000000b004eafabb4db1mr4302079lfn.1.1684852600995;
        Tue, 23 May 2023 07:36:40 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id b26-20020ac2411a000000b004f399531e8csm1364023lfi.226.2023.05.23.07.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 07:36:40 -0700 (PDT)
Message-ID: <b0be5965-0dc9-c33c-9cba-21bfa82c4faf@linaro.org>
Date:   Tue, 23 May 2023 17:36:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [Freedreno] [PATCH v2 0/7] drm/msm/dpu: simplify DPU encoder init
Content-Language: en-GB
To:     neil.armstrong@linaro.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
 <557a8aee-37b9-5654-c82c-97206576ab44@quicinc.com>
 <CAA8EJpp+ODZZu13ehAN-9Ehz87HCdXsXvO3DQ-oxAhKcb2rqtA@mail.gmail.com>
 <af7ab667-1be4-7391-d0a9-6f9e7439eb6d@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <af7ab667-1be4-7391-d0a9-6f9e7439eb6d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/05/2023 10:31, Neil Armstrong wrote:
> On 23/05/2023 09:20, Dmitry Baryshkov wrote:
>> On Tue, 23 May 2023 at 04:58, Abhinav Kumar 
>> <quic_abhinavk@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 5/18/2023 7:38 PM, Dmitry Baryshkov wrote:
>>>> Rework dpu_encoder initialization code, simplifying calling sequences
>>>> and separating common init parts.
>>>>
>>>> Changes since v1:
>>>> - Withdrawn two pathes for a later consideration
>>>> - Changed dpu_encoder_phys_init() to return void (Abhinav)
>>>> - Added small simplifications of dpu_encoder_phys_cmd_init() and
>>>>     dpu_encoder_phys_wb_init()
>>>>
>>>
>>> I had previously given these comments on the cover letter of v1, so
>>> giving it again.
>>>
>>> Please mention that your series was made on top of
>>> https://patchwork.freedesktop.org/series/116530/.
>>>
>>> Figured it out when I tried to apply it to my branch to test.
>>>
>>> I had tested v1, and between v1 and v2 i only see very trivial change,
>>> so i think its okay to retain:
>>>
>>> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com> # sc7280
>>
>> Unfortunately patchwork ignores tags sent in the cover letter thread.
> 
> But b4 does with -t option to b4 shazam or b4 am

Yes. But b4 doesn't append Patchwork headers.

> 
> Neil
> 
>>
>>>
>>>> Dmitry Baryshkov (7):
>>>>     drm/msm/dpu: merge dpu_encoder_init() and dpu_encoder_setup()
>>>>     drm/msm/dpu: separate common function to init physical encoder
>>>>     drm/msm/dpu: drop duplicated intf/wb indices from encoder structs
>>>>     drm/msm/dpu: inline dpu_encoder_get_wb()
>>>>     drm/msm/dpu: call dpu_rm_get_intf() from dpu_encoder_get_intf()
>>>>     drm/msm/dpu: drop temp variable from dpu_encoder_phys_cmd_init()
>>>>     drm/msm/dpu: simplify dpu_encoder_phys_wb_init()
>>>>
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 178 
>>>> ++++++++----------
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  14 +-
>>>>    .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  15 +-
>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  35 ++--
>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  19 +-
>>>>    .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  35 +---
>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  87 ++++-----
>>>>    7 files changed, 140 insertions(+), 243 deletions(-)
>>>>
>>
>>
>>
> 

-- 
With best wishes
Dmitry

