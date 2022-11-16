Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4267962B4E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 09:19:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233127AbiKPITm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 03:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238619AbiKPITX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 03:19:23 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEDEE12755
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 00:19:13 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id d20so20799111ljc.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 00:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s3hmYFJCkTtn3TM6dsGaEPzkn+DVUmQOcvxVNta5NVs=;
        b=zMdllhrGlGLzNtwjILPgItD3ZBxIAkcTMw7pPs/bw7bvKWrAtrWp6hiduO7xoSROqK
         ijZD6Lf32PjqTtHwXUolAWJ74/zG3m24/+56zP70itbyj7sFyCMTuNz4qVIryI/xecjW
         aVmky5mrlC28MzF1rXcT/bkQySdSuGZft4VlvRQ92SuO9rURGJsvMslWtJSYxB89Cgrj
         H+sJUCf7OJRnCCc1awaGCLpRx2xISkmrEWA+HbxdsZl0I4o9ejpL/31Qz/uS8CRa0eU4
         jGs9w7Vpblnph8dhPlEfNtohebPYzRsGjU8KU5PQS+WuYUlFBt3zja0dpvalVpNj5nhe
         uhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s3hmYFJCkTtn3TM6dsGaEPzkn+DVUmQOcvxVNta5NVs=;
        b=A0964PsfrVF9mc0z++TqW9DBlQp8AbmJvSD59eidY6n73ei+46slwaeaoWn2C7leSH
         T7H3rJqPMOraGuHdC1TjnsDGH2KT/4JXblkUeyaeKSF4rQSLWkii9u3HAJ21uUyCfmrn
         X2gRJNUts9OW0vP336iGojp/0b00Qqx/IL272VEaFvQRKSum6fUAWk9TxM00Bhl7TOXE
         DhPkLESj05EK+mj7VNCfpGTb9939YWVw9boyL+JB9nBZrVEsWN4pLPLf7QOWGImuyh6w
         xg45h9A7XPf74Rdwnb3Dy2zXGlDAD3RC2Gq7gAslvkY1MF0lwDxvjbdTpegja2hkKDJg
         OOIg==
X-Gm-Message-State: ANoB5plUdd2Q1AWHmssc+zoLBiaE1eIknYOFQyM4ZYLZrTba2y49njfF
        RlifWq4q3lUNBFxxRlgKiGCp2w==
X-Google-Smtp-Source: AA0mqf7xhOCjW3QufeE804S/cxln/uZai7wNh/XLBauOT9JBywuiFQolclvFiIZKXUz31tEmZWpHYg==
X-Received: by 2002:a2e:9b84:0:b0:277:a3d:6fb6 with SMTP id z4-20020a2e9b84000000b002770a3d6fb6mr7621591lji.514.1668586752273;
        Wed, 16 Nov 2022 00:19:12 -0800 (PST)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id w26-20020ac254ba000000b0049c29389b98sm2487698lfk.151.2022.11.16.00.19.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 00:19:11 -0800 (PST)
Message-ID: <e53520b4-65da-d183-c3bf-65dc16c59358@linaro.org>
Date:   Wed, 16 Nov 2022 11:19:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 6/8] drm/msm/dpu: add support for MDP_TOP blackhole
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-7-dmitry.baryshkov@linaro.org>
 <3429c5a5-084d-919c-5c3f-5e12f447c931@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3429c5a5-084d-919c-5c3f-5e12f447c931@quicinc.com>
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

On 16/11/2022 10:50, Abhinav Kumar wrote:
> 
> 
> On 11/4/2022 6:03 AM, Dmitry Baryshkov wrote:
>> On sm8450 a register block was removed from MDP TOP. Accessing it during
>> snapshotting results in NoC errors / immediate reboot. Skip accessing
>> these registers during snapshot.
>>
>> Tested-by: Vinod Koul <vkoul@kernel.org>
>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> I am confused with both the ordering and the split of this patch.
> 
> You have defined DPU_MDP_PERIPH_0_REMOVED in the catalog header file in 
> this patch but used it in the next.
> 
> But you also have code in this patch which relies on setting of this bit.
> 
> So if this patch is taken without the next, it will still crash.

It will not crash if this patch is taken without the next one. Without 
the next patch the DPU driver will not match and bind against the 
qcom,sm8450-dpu device.

So, the ordering is quite logical from my point of view:
- add support for all the features required for the device
- add the device compat string & catalog entry

> 
> Rather, you should combine the define part of this patch to the next 
> patch in the series 
> https://patchwork.freedesktop.org/patch/510114/?series=108883&rev=3 , 
> then move that one in front of this patch.

No. This way we'll have a state (after adding the next patch) when the 
sm8450 support is enabled, but the top-hole is not handled, leading to a 
crash.

> 
> So that its much more coherent that you defined DPU_MDP_PERIPH_0_REMOVED 
> both in the catalog header and used it in the catalog.c file and the in 
> the next change you used the caps to avoid touching that register.

I'd say it's rather strange way. When I see a define/feature addition, 
I'd prefer to seethe implementation too.

> Regarding the TOP hole itself, I need one day to investigate this. I am 
> waiting for permissions to the documentation.
> 
> If i cannot get access by the time you have re-ordered this, I will ack 
> this once the reorder is done within a day.


For the reference: [1]

[1] 
https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/commit/f9ff8af5b640147f3651c23551c60f81f62874b1

> 
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
>> +    } else {
>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>> +    }
>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>   }

-- 
With best wishes
Dmitry

