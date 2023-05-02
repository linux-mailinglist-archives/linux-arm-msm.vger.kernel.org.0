Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 604AE6F4DE0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 May 2023 01:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbjEBXxi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 19:53:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbjEBXxh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 19:53:37 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6AD661FDB
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 16:53:35 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4ec8133c59eso5289721e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 16:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683071613; x=1685663613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ikYnCdxaMcHpzqjkFoupFqqKYPTWWjl9lGsI4SHUWSo=;
        b=bqU6Wu6QtI1UAeA92niMimxn/u9nib4/MY7p/sO5FIdbIpcqKy3nDFlhvOk1jwM5+I
         P8beSOtLn8rJPLiA31+bgZ8sz+cmzoD7QQCFQgmYsYDcJcDNEpBj98EfNkH7xj+Wh4p7
         PFcpJBgBXhaW00vMnshhQbKZ6EmqO01irIZYyPO8rxP48hUV0ELJGgWadWeYeO1ialMa
         ez8uwp10JdQb6IbfRS4t0n9i3xTPk9529anqZJoKXjLVsUoNhrzfOw8Fs8TFqXlKGDGb
         h/8NWN6TpcW1b3/b3jVTxbAEBTrcwhAiF09UKeLLzekZilkD0AsWFnwuJdZWsOHo+Vkb
         jdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683071613; x=1685663613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ikYnCdxaMcHpzqjkFoupFqqKYPTWWjl9lGsI4SHUWSo=;
        b=FYt53nLEtyt4P8kNaQykjy1kFSjdVydCRaenkNQfpW/I8VeB09yN2PxmMTt/rwGmHm
         rPWoZ6ll7LsQgbyzrmT6rROrIASoAaweRFY4/j/jCRXRYnNSMG72bVYnfg0ptewluv8M
         QzVW2fpg1EydFVBu0mpQLafjpzIWrt3wVIfmuL4RpVEE8/Q8oUPYo85r8JvL1txSzj/z
         AIiqaPdyQkARjNj7lGgppLLCoSWFGZ+qTv6/n/4avIAhDTsl4GA//2STY49nlx4LEtFl
         paj9TVaVjLvMGgqa4VBT29Ocs9mfgkGsYdtf/0J10+MdQBuF1J3gsvwWyhmmlqkalhvh
         fkNw==
X-Gm-Message-State: AC+VfDz+kb1iNukZIRUXbzxIOMXUtZ+aOPTOKbYG/nCf+QKKMgtC8MAC
        rFiNNvwoerWn37OYd81HtQkjoA==
X-Google-Smtp-Source: ACHHUZ7v8qr4LoIXZaqu/sj2tsmtm/wyZdnsI4Ou1SPe8iPvOJAm6d8q//XaXRqze3eBjVfD0nRMvw==
X-Received: by 2002:ac2:5457:0:b0:4cc:7282:702b with SMTP id d23-20020ac25457000000b004cc7282702bmr407148lfn.2.1683071613630;
        Tue, 02 May 2023 16:53:33 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id q16-20020ac25290000000b004eff66716a6sm4010580lfm.113.2023.05.02.16.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 16:53:33 -0700 (PDT)
Message-ID: <84e55909-557f-8403-f029-87574d4f3481@linaro.org>
Date:   Wed, 3 May 2023 02:53:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 4/7] drm/msm/dpu: drop duplicated intf/wb indices from
 encoder structs
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
 <20230430235732.3341119-5-dmitry.baryshkov@linaro.org>
 <dae23075-b907-48c0-7605-f91589630beb@quicinc.com>
 <CAA8EJppO3GhsRVY-5UjOO-GAw_NZONPaNBigO4P4_axXxNxsaA@mail.gmail.com>
 <7409245f-fe33-c892-40a8-7a8e8437f0b0@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7409245f-fe33-c892-40a8-7a8e8437f0b0@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/05/2023 02:19, Abhinav Kumar wrote:
> 
> 
> On 5/2/2023 4:15 PM, Dmitry Baryshkov wrote:
>> On Wed, 3 May 2023 at 02:04, Abhinav Kumar <quic_abhinavk@quicinc.com> 
>> wrote:
>>>
>>>
>>>
>>> On 4/30/2023 4:57 PM, Dmitry Baryshkov wrote:
>>>> Remove intf_idx and wb_idx fields from struct dpu_encoder_phys and
>>>> struct dpu_enc_phys_init_params. Set the hw_intf and hw_wb directly and
>>>> use them to get the instance index.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>
>>>   From whatever I can see, this will not affect functionality of intf or
>>> wb and cleans it up well , so I am fine with this. Hence,
>>>
>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> One minor comment/question.
>>>
>>> <snipped other parts>
>>>
>>>> @@ -761,7 +761,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>>>>        struct dpu_encoder_phys_cmd *cmd_enc = NULL;
>>>>        int ret = 0;
>>>>
>>>> -     DPU_DEBUG("intf %d\n", p->intf_idx - INTF_0);
>>>
>>> Was it intentional to drop the index in this log?
>>
>> We don't have p->intf_idx at this point. I think we can use
>> p->hw_intf->idx instead, I'll fix that for v2.
>>
> 
> Yes, I was aware that. In all other logs, intf_idx was replaced with 
> hw_intf->idx except this one. So I was not sure if it was intentional or 
> just removed accidentally.

Most likely it was a leftover from the interim patch where I didn't have 
p->hw_intf. Initially I kept the code which manually set the 
phys->hw_intf (and hw_wb), but then it was just easier to pass that 
through the params and let the caller set it.

> 
>>>
>>>> +     DPU_DEBUG("intf\n");
>>>>
>>>>        cmd_enc = kzalloc(sizeof(*cmd_enc), GFP_KERNEL);
>>
>>
>>

-- 
With best wishes
Dmitry

