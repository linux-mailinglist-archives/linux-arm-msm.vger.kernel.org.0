Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC1AD74331F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 05:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbjF3DXA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jun 2023 23:23:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbjF3DW5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jun 2023 23:22:57 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71973595
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 20:22:55 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b6a084a34cso21520101fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jun 2023 20:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688095374; x=1690687374;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wVkPW5GLVWJFZmCsIrOzOMy5enCe81P83zvvG2jdjQ8=;
        b=a+H3KuXT5fW+6IzDwYdtCAnzCRSpt2+eEn6gYHTGowvdT1hF+Rk8MjFDk4suGigvFV
         9IuCInkzu5MGlfMZU5HAFAOC2XOdNZWiu1YNxiKHnfxBGdHb5lxlTCXjuad3ulo6ielW
         O9bz2GHa2/inQDOKWsctSKkPG6H84gaEyjZHds7Cn9oOf5Dgo7+y7T5y/YoFJ21luX1T
         mR7HDuKucAeCS2f71HgjMEmt108FeHg2sFVpBo9ADPI0mVM//d4QUvuMlr646oaVxRgV
         iOpFsttClcTo9g99MpJKOAMN2l0E+7KEJBPdJkM8+YnP0rUAs9WWzNK9rVoukRnbmo1u
         ZCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688095374; x=1690687374;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wVkPW5GLVWJFZmCsIrOzOMy5enCe81P83zvvG2jdjQ8=;
        b=TUr231gwdWBX2K7MDGAyRuU32/O7xx6CNGJU0q3QwLLfoDEaVjrcX3gcY7/ijnSV1W
         BXjfVmpp5Mir9ZNWxjXI2Dhe8JYAOzEST+h+AJKNY4rIA6lP1UDoxPr/NFJP55fOYcR1
         kSzGgg4gxR4DxLbYXb0dB5o6WR97TFuW2aVBoI6vm+cwwmplIUeV+eTd99hUb1Fh76Ap
         dHY0m6Dyrl5sFaszPP92BstlOSyfNvZz99ejcR5p5VHV5XHV0XBTSff+OSLE8/yDD/ET
         TyZmsZRsSBOqMN9yeALE5kDbV3g8iOqKhPAFND7LpVH4XyS1lStc0Othv7ZzkwlwWrH7
         E1dA==
X-Gm-Message-State: ABy/qLadEUyGFr9J44H9B8YAZh+X/bwS2947XYHZu0mVmGhOkHYx1+qI
        d/DXIdNAI8yAJ0+S/VBccTs7SA==
X-Google-Smtp-Source: APBJJlHi44st+Tlfm5QGZ73S+CAdrTgvZJAhVyav34ACAIAL79QuoI88Ak8/HcZcMURZRkuMf5Th6Q==
X-Received: by 2002:a2e:b04c:0:b0:2b1:fda8:e653 with SMTP id d12-20020a2eb04c000000b002b1fda8e653mr1010739ljl.27.1688095373718;
        Thu, 29 Jun 2023 20:22:53 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id l25-20020a2e99d9000000b002b69fcb08c6sm2389249ljj.72.2023.06.29.20.22.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 20:22:53 -0700 (PDT)
Message-ID: <1962cd48-87e6-4f26-a882-c6648e595a80@linaro.org>
Date:   Fri, 30 Jun 2023 06:22:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 2/3] drm/msm/dpu: use dpu core's major version to
 enable data compress
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com,
        andersson@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230629193001.22618-1-quic_abhinavk@quicinc.com>
 <20230629193001.22618-2-quic_abhinavk@quicinc.com>
 <17b3b652-194c-99c2-e460-21663040c398@linaro.org>
 <283a4ae4-c0ea-13f9-fb47-e44f366c26b2@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <283a4ae4-c0ea-13f9-fb47-e44f366c26b2@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/06/2023 06:07, Abhinav Kumar wrote:
> 
> 
> On 6/29/2023 5:20 PM, Dmitry Baryshkov wrote:
>> On 29/06/2023 22:29, Abhinav Kumar wrote:
>>> Instead of using a feature bit to decide whether to enable data
>>> compress or not for DSC use-cases, use dpu core's major version instead.
>>> This will avoid defining feature bits for every bit level details of
>>> registers.
>>>
>>> Also, rename the intf's enable_compression() op to program_datapath()
>>> and allow it to accept a struct intf_dpu_datapath_cfg to program
>>> all the bits at once. This can be re-used by widebus later on as
>>> well as it touches the same register.
>>
>> Two separate commits please, because...
>>
> 
> I thought of it but it seemed better together and was the only way I 
> could think of. Please see below.
> 
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> ---
>>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  9 +++++++--
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c      |  9 +++++----
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h      | 16 ++++++++++++++--
>>>   3 files changed, 26 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> index b856c6286c85..f4e15b4c4cc9 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> @@ -50,6 +50,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>               to_dpu_encoder_phys_cmd(phys_enc);
>>>       struct dpu_hw_ctl *ctl;
>>>       struct dpu_hw_intf_cfg intf_cfg = { 0 };
>>> +    struct dpu_kms *dpu_kms = phys_enc->dpu_kms;
>>>       ctl = phys_enc->hw_ctl;
>>>       if (!ctl->ops.setup_intf_cfg)
>>> @@ -68,8 +69,12 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>>>                   phys_enc->hw_intf,
>>>                   phys_enc->hw_pp->idx);
>>> -    if (intf_cfg.dsc != 0 && phys_enc->hw_intf->ops.enable_compression)
>>> -        phys_enc->hw_intf->ops.enable_compression(phys_enc->hw_intf);
>>> +    if (intf_cfg.dsc != 0 && dpu_kms->catalog->core_major_version >= 
>>> 0x7) {
>>
>> ... because this becomes incorrect. The datapath should be programmed 
>> in all the cases, if there is a corresponding callback. intf_cfg.dsc 
>> should be used as a condition to set datapath_cfg.
>>
> 
> The issue is that today we do not have dpu_mdss_cfg as part of 
> dpu_hw_intf nor _setup_intf_ops because all of those have been dropped 
> with some rework or cleanup.

Pass dpu_mdss_cfg to dpu_hw_intf_init(). It was removed as a cleanup, 
now we can reintroduce it.

> 
> Ideally even I would like to assign this op only for core_rev >=7 but 
> that information is no longer available. We would have to start passing 
> the major and minor versions to _setup_intf_ops() to go with that 
> approach. So without making all of those changes, the only way I had was 
> to assign the op unconditionally but call it only for major_rev >= 7.
> 
> Passing core_rev to the op itself so that we can write the register only 
> for core_rev >=7 is an option but then what if some bits start becoming 
> usable only after minor rev. then we will have to start passing major 
> and minor rev to program_datapath too. Again getting little messy.
> 
> I am open to ideas to achieve the goal of assigning this op only for 
> core_rev >=7 other than what I wrote above.
> 
>>
>>> +        struct intf_dpu_datapath_cfg datapath_cfg = { 0 };
>>
>> No need for `0' in the init, empty braces would be enough.
>>
> 
> ack.
> 
>>> +
>>> +        datapath_cfg.data_compress = true;
>>> +        phys_enc->hw_intf->ops.program_datapath(phys_enc->hw_intf, 
>>> &datapath_cfg);
>>> +    }
>>>   }
>>>   static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int 
>>> irq_idx)
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>> index 5b0f6627e29b..85333df08fbc 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
>>> @@ -513,11 +513,13 @@ static void 
>>> dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
>>>   }
>>> -static void dpu_hw_intf_enable_compression(struct dpu_hw_intf *ctx)
>>> +static void dpu_hw_intf_program_datapath(struct dpu_hw_intf *ctx,
>>> +                     struct intf_dpu_datapath_cfg *datapath_cfg)
>>>   {
>>>       u32 intf_cfg2 = DPU_REG_READ(&ctx->hw, INTF_CONFIG2);
>>> -    intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>>> +    if (datapath_cfg->data_compress)
>>> +        intf_cfg2 |= INTF_CFG2_DCE_DATA_COMPRESS;
>>>       DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
>>>   }
>>> @@ -543,8 +545,7 @@ static void _setup_intf_ops(struct 
>>> dpu_hw_intf_ops *ops,
>>>           ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
>>>       }
>>> -    if (cap & BIT(DPU_INTF_DATA_COMPRESS))
>>> -        ops->enable_compression = dpu_hw_intf_enable_compression;
>>> +    ops->program_datapath = dpu_hw_intf_program_datapath;
>>
>> The `core_major_version >= 7' should either be here or in the callback 
>> itself.
>>
> 
> Yes, ideally I would like it like that but please see above why I 
> couldnt do it.
> 
>>>   }
>>>   struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>> index 99e21c4137f9..f736dca38463 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
>>> @@ -48,6 +48,11 @@ struct intf_status {
>>>       u32 line_count;        /* current line count including blanking */
>>>   };
>>> +struct intf_dpu_datapath_cfg {
>>> +    u8 data_compress;    /* enable data compress between dpu and dsi */
>>> +    /* can be expanded for other programmable bits */
>>> +};
>>
>> I'd say, dpu_datapath is too generic. What about  intf_cmd_mode_cfg?
>>
> 
> The goal was to keep it generic. Its actually the handshake between DPU 
> and interface datapath so I chose that name.

Do you have plans of using it for the video mode?

> 
> This is not specific to command mode and intf_cfg is already there so I 
> chose that one :)
> 
>>> +
>>>   /**
>>>    * struct dpu_hw_intf_ops : Interface to the interface Hw driver 
>>> functions
>>>    *  Assumption is these functions will be called after clocks are 
>>> enabled
>>> @@ -70,7 +75,7 @@ struct intf_status {
>>>    * @get_autorefresh:            Retrieve autorefresh config from 
>>> hardware
>>>    *                              Return: 0 on success, -ETIMEDOUT on 
>>> timeout
>>>    * @vsync_sel:                  Select vsync signal for tear-effect 
>>> configuration
>>> - * @enable_compression:         Enable data compression
>>> + * @program_datapath:           Program the DPU to interface 
>>> datapath for relevant chipsets
>>>    */
>>>   struct dpu_hw_intf_ops {
>>>       void (*setup_timing_gen)(struct dpu_hw_intf *intf,
>>> @@ -108,7 +113,14 @@ struct dpu_hw_intf_ops {
>>>        */
>>>       void (*disable_autorefresh)(struct dpu_hw_intf *intf, uint32_t 
>>> encoder_id, u16 vdisplay);
>>> -    void (*enable_compression)(struct dpu_hw_intf *intf);
>>> +    /**
>>> +     * Program the DPU to intf datapath by specifying
>>> +     * which of the settings need to be programmed for
>>> +     * use-cases which need DPU-intf handshake such as
>>> +     * widebus, compression etc.
>>
>> This is not a valid kerneldoc.
>>
> 
> hmmm ... ok so just // ?
> 
> I referred disable_autorefresh from above and did the same.
> 
>>> +     */
>>> +    void (*program_datapath)(struct dpu_hw_intf *intf,
>>> +                 struct intf_dpu_datapath_cfg *datapath_cfg);
>>>   };
>>>   struct dpu_hw_intf {
>>

-- 
With best wishes
Dmitry

