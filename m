Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8144BC239
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Feb 2022 22:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239945AbiBRVhH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 16:37:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239943AbiBRVhH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 16:37:07 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFFBC3A5F1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 13:36:48 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id j7so7800619lfu.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Feb 2022 13:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=n9yp2F/tFbPYbNUub6ORMzULNCV7x8Jlyoxm8mDT9LM=;
        b=Vzr8WauP0HUY6liDBBny5+hyIdwaYSB7eC8COVdVPuuehStAkuOCBNtdW+EB7vYzT/
         H9gQvBm04uo+QRZ83sJECp7nWUQBFcYTMHJDcPZ+lXanfAEUq6V7a/pvQsdVqtAwbuuX
         Aaww0DIIgs5T0c1t5HcDcI3J2P2t1VHfyX9Mae3YWroLW9EomXY6CfBCIiwX0rkND1Zm
         uBza6AD97DSxFT4mwF+lecomueWaVfFNz6FJIucnwwjktFoZ9eFIRkVYzu/LbWdPrFO1
         v40FUCYG/BhllxpVG7ljKeh7/cx79qEyJdClSBEJRS2I5JzmvaBL5v3JEKRojKabVPO1
         LS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=n9yp2F/tFbPYbNUub6ORMzULNCV7x8Jlyoxm8mDT9LM=;
        b=Nv2d3aJgQV0ArdSWYBgQHBIHRFYd8iaAnuJy31IvmONZ0PDLQDXFYjzx8b6yth1fAn
         MdnxmKpj0GVGg2tmsJSfIhvfQkzAicX7cshsCOgDaD1a5F5RSCIirDxT6+OFLUXuQgy7
         HQQ63D0IhYq0ISoi8wjaJz7TvwhEGgfBeXACVRzZYLjL1Cwr7S+ZPKrngjxHkutq4aEa
         o7wLMFqfHfLI8/8R+OH/LSJbCfLpdJ8WfRhxifT1jBxlu+QulWO7o80bngdMVo8dj23e
         H2DAZT6SyQ5DaZ5zJ3bDzKytxAWESKr10l02orSAX9VykOiGCQ0wrv4pJDejScTIWNMw
         yYyg==
X-Gm-Message-State: AOAM532fxLQ9W8oAtP6jZkxtdxC2KdC1hSlUKg/ZdmhpmHXfptS6zu/Z
        qJFvdgC2Cw+z1V6zFy1OqdtpBQ==
X-Google-Smtp-Source: ABdhPJyg1rjvoJjmNealuZAHVqqpmiKSoqxUfMtoP0Z2gXj+zdSFLGc9yJCrsBJCytQTPBU0xzhdhQ==
X-Received: by 2002:ac2:4e04:0:b0:442:bfb6:c832 with SMTP id e4-20020ac24e04000000b00442bfb6c832mr7105656lfr.519.1645220207016;
        Fri, 18 Feb 2022 13:36:47 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l24sm451725ljb.90.2022.02.18.13.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Feb 2022 13:36:46 -0800 (PST)
Message-ID: <e8bd7d02-1de6-4de0-9b01-68152f22e8a2@linaro.org>
Date:   Sat, 19 Feb 2022 00:36:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [Freedreno] [REPOST PATCH v4 08/13] drm/msm/disp/dpu1: Don't use
 DSC with mode_3d
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-9-vkoul@kernel.org>
 <67006cc4-3385-fe03-bb4d-58623729a8a8@quicinc.com> <Yg3mvEvqYs89dJWI@matsya>
 <4b89f5fe-0752-3c6a-3fb0-192f1f2e7b9e@quicinc.com>
 <acf0a2a2-f2e5-906a-3c51-525abd18ee6f@linaro.org>
 <a38432a8-7920-e26d-7391-a49bebbc57f9@quicinc.com>
 <9f1e2df6-4f28-1d91-7654-ff2d9339dfd9@linaro.org>
 <5b27912e-3e49-675e-86f5-ac6be8dc21c5@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5b27912e-3e49-675e-86f5-ac6be8dc21c5@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/02/2022 00:29, Abhinav Kumar wrote:
> 
> 
> On 2/18/2022 1:21 PM, Dmitry Baryshkov wrote:
>> On 18/02/2022 23:46, Abhinav Kumar wrote:
>>>
>>>
>>> On 2/16/2022 11:12 PM, Dmitry Baryshkov wrote:
>>>> On 17/02/2022 09:33, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 2/16/2022 10:10 PM, Vinod Koul wrote:
>>>>>> On 16-02-22, 19:11, Abhinav Kumar wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 2/10/2022 2:34 AM, Vinod Koul wrote:
>>>>>>>> We cannot enable mode_3d when we are using the DSC. So pass
>>>>>>>> configuration to detect DSC is enabled and not enable mode_3d
>>>>>>>> when we are using DSC
>>>>>>>>
>>>>>>>> We add a helper dpu_encoder_helper_get_dsc() to detect dsc
>>>>>>>> enabled and pass this to .setup_intf_cfg()
>>>>>>>>
>>>>>>>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>>>>>>>
>>>>>>> We should not use 3D mux only when we use DSC merge topology.
>>>>>>> I agree that today we use only 2-2-1 topology for DSC which means 
>>>>>>> its using
>>>>>>> DSC merge.
>>>>>>>
>>>>>>> But generalizing that 3D mux should not be used for DSC is not 
>>>>>>> right.
>>>>>>>
>>>>>>> You can detect DSC merge by checking if there are two encoders 
>>>>>>> and one
>>>>>>> interface in the topology and if so, you can disable 3D mux.
>>>>>>
>>>>>> Right now with DSC we disable that as suggested by Dmitry last time.
>>>>>> Whenever we introduce merge we should revisit this, for now this 
>>>>>> should
>>>>>> suffice
>>>>>>
>>>>>
>>>>> Sorry I didnt follow.
>>>>>
>>>>> The topology which you are supporting today IS DSC merge 2-2-1. I 
>>>>> didnt get what you mean by "whenever we introduce".
>>>>>
>>>>> I didnt follow Dmitry's comment either.
>>>>>
>>>>> "anybody adding support for SDE_RM_TOPOLOGY_DUALPIPE_3DMERGE_DSC 
>>>>> handle this."
>>>>>
>>>>> 3D mux shouldnt be used when DSC merge is used.
>>>>>
>>>>> The topology Dmitry is referring to will not use DSC merge but you 
>>>>> are using it here and thats why you had to make this patch in the 
>>>>> first place. So I am not sure why would someone who uses 3D merge 
>>>>> topology worry about DSC merge. Your patch is the one which deals 
>>>>> with the topology in question.
>>>>>
>>>>> What I am suggesting is a small but necessary improvement to this 
>>>>> patch.
>>>>
>>>> It seems that we can replace this patch by changing 
>>>> dpu_encoder_helper_get_3d_blend_mode() to contain the following 
>>>> condition (instead of the one present there). Does the following 
>>>> seem correct to you:
>>>>
>>>> static inline enum dpu_3d_blend_mode 
>>>> dpu_encoder_helper_get_3d_blend_mode(
>>>>                  struct dpu_encoder_phys *phys_enc)
>>>> {
>>>>          struct dpu_crtc_state *dpu_cstate;
>>>>
>>>>          if (!phys_enc || phys_enc->enable_state == DPU_ENC_DISABLING)
>>>>                  return BLEND_3D_NONE;
>>>>
>>>>          dpu_cstate = to_dpu_crtc_state(phys_enc->parent->crtc->state);
>>>>
>>>> +    /* Use merge_3d unless DSCMERGE topology is used */
>>>>          if (phys_enc->split_role == ENC_ROLE_SOLO &&
>>>> +           hweight(dpu_encoder_helper_get_dsc(phys_enc)) != 1 &&
>>
>> Yes, the correct should be:
>> hweight(...) == 2
>>
>>>>              dpu_cstate->num_mixers == CRTC_DUAL_MIXERS)
>>>>                  return BLEND_3D_H_ROW_INT;
>>>>
>>>>          return BLEND_3D_NONE;
>>>> }
>>>
>>> This will not be enough. To detect whether DSC merge is enabled you 
>>> need to query the topology. The above condition only checks if DSC is 
>>> enabled not DSC merge.
>>>
>>> So the above function can be modified to use a helper like below 
>>> instead of the hweight.
>>>
>>> bool dpu_encoder_get_dsc_merge_info(struct dpu_encoder_virt *dpu_enc)
>>> {
>>>      struct msm_display_topology topology = {0};
>>>
>>>      topology = dpu_encoder_get_topology(...);
>>>
>>>      if (topology.num_dsc > topology.num_intf)
>>
>> num_intf is 1 or 2. If it's one, the split_role is SOLO
>> hweight would return a num of bits in the DSC mask. It's 0, 1 or 2.
>> So, if the split_role is SOLO and hweight is 2, we get exactly your 
>> condition.
>>
> num_intf is 1 in this case as only single interface is used. But even 4 
> dsc encoders going to 2 interfaces its DSC merge. So assuming num_intf 
> as 1 always is not right. Thats why I suggested a generalized confition 
> like above.

Ah, quadpipe. Yes, then I was incorrect.

> 
>> Does that sound correct?
>>
>>>          return true;
>>>      else
>>>          return false;
>>> }
>>>
>>> if (!dpu_encoder_get_dsc_merge_info() && other conditions listed above)
>>>      return BLEND_3D_H_ROW_INT;
>>> else
>>>      BLEND_3D_NONE;
>>>>
>>>>
>>>>>
>>>>> All that you have to do is in query whether DSC merge is used from 
>>>>> the topology. You can do it in multiple ways:
>>>>>
>>>>> 1) Either query this from the encoder
>>>>> 2) Store a bool "dsc_merge" in the intf_cfg
>>>>>
>>>>
>>>>
>>
>>


-- 
With best wishes
Dmitry
