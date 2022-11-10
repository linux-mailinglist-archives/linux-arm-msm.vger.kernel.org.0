Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30D15624BA4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 21:19:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231797AbiKJUTw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 15:19:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231948AbiKJUTg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 15:19:36 -0500
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79926FF5
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 12:19:18 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id k19so2239416lji.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 12:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OS7XyVksmzpOUyGa1jMZ/h64iPb1v90uhSS96NI+hnc=;
        b=AyjI1s8wkcqvZki+gAQw0dHrM7EdydF05RbKxMfiF56rroBE6j+5b5jbS0ciLKzm7x
         cXXYFApXEkBbPa0l7LdiFs54GOgJiAZmg0MbJ6S/XlZojbW5Z+IqMT2mSud0ldOxeyar
         WJg3G6OTTDlZw8H+Vbo5xYgyKrys+4xJFFPcS1o18t6Q1lXSev94/UaVWGvY188ZsXcj
         Fqecq03rVXjB+9D9GOPocw/URAMUjmWfhvhgBLTEqTzOd8hxW2F+GvAGTD27TRXF7Rma
         yKCRF+Ly5Ui/L+9QmopH9zLidhSM22McxX5rNUK2/KiHwh5Nl+Jp+J3N7wn6Srtu1bmL
         FNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OS7XyVksmzpOUyGa1jMZ/h64iPb1v90uhSS96NI+hnc=;
        b=6O8qUyY95FRxPAfTALVih9YFSZn3iScLE5ntxwkMmMW/ONLZh2z95f9kIhVLmF5+Cn
         MdxP0Tp6bpLaFATX/EAzqgm6Z37axYXKtkLxBuQAK8aMA0JqerCjJ7zQvs2GfxHNae7A
         3e3aRQhBfcfm3YXQN7E21bowhrzUK3W0QZzuyF3Y2YmQTml/IA4YbONIQsUf/mg1y89w
         P5KkI44VKwwel/4mvzSkoLbEPEgMEmUMSw/RLmb7gLh5QVwM5pxhOgh4T18Su8WBTntT
         1a85hrTXBqRwXHaT5GFDsZRRIDW1i3LB1zQHjhHdvA87sLeW0etrrsdGYoHiXLjv9J36
         0lIg==
X-Gm-Message-State: ACrzQf1b+/aNf9koxC77Dk5qxamzrf3js2FPd8H36GoMW/MeqAS2eDSp
        51cQE4XK11JqUklo97rj0SmCoQ==
X-Google-Smtp-Source: AMsMyM5S+ddzaFFtds21QOVZIP9rP/fgoTUCdxiCOScazXTBOHhsmOcY5bl4KsrkL7CUttPgs4zQcA==
X-Received: by 2002:a05:651c:2382:b0:26c:4c27:a478 with SMTP id bk2-20020a05651c238200b0026c4c27a478mr8713424ljb.92.1668111556787;
        Thu, 10 Nov 2022 12:19:16 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v2-20020a056512348200b0049485e2cb91sm2732lfr.231.2022.11.10.12.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 12:19:16 -0800 (PST)
Message-ID: <5c791922-1371-c9e7-4bdc-e1909956633f@linaro.org>
Date:   Thu, 10 Nov 2022 23:19:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 6/8] drm/msm/dpu: add support for MDP_TOP blackhole
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-7-dmitry.baryshkov@linaro.org>
 <b222a21c-a00f-8806-179c-f97bcb45c303@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b222a21c-a00f-8806-179c-f97bcb45c303@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/11/2022 16:58, Konrad Dybcio wrote:
> 
> On 04/11/2022 14:03, Dmitry Baryshkov wrote:
>> On sm8450 a register block was removed from MDP TOP. Accessing it during
>> snapshotting results in NoC errors / immediate reboot. Skip accessing
>> these registers during snapshot.
> 
> Must have been fun to debug..
> 
> 
>>
>> Tested-by: Vinod Koul <vkoul@kernel.org>
>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> index 38aa38ab1568..4730f8268f2a 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>> @@ -92,6 +92,7 @@ enum {
>>       DPU_MDP_UBWC_1_0,
>>       DPU_MDP_UBWC_1_5,
>>       DPU_MDP_AUDIO_SELECT,
>> +    DPU_MDP_PERIPH_0_REMOVED,
>>       DPU_MDP_MAX
>>   };
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index f3660cd14f4f..95d8765c1c53 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct 
>> msm_disp_state *disp_state, struct msm_k
>>           msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>>                   dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>> -    msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>> -            dpu_kms->mmio + cat->mdp[0].base, "top");
>> +    if (dpu_kms->hw_mdp->caps->features & 
>> BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>> +        msm_disp_snapshot_add_block(disp_state, 0x380,
>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 0x3a8,
>> +                dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
> 
> Are these values expected to stay the same on different new-gen SoCs? 
> Maybe it would
> 
> be worth making it dynamic.

I do not want to overcomplicate this. Let's make it dynamic once there 
is need for that. For now I expect this will be static.

> 
> 
> Konrad
> 
>> +    } else {
>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>> +    }
>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>   }

-- 
With best wishes
Dmitry

