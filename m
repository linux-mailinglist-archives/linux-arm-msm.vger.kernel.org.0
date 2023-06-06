Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DDC872506A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 00:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240134AbjFFW7j (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 18:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240148AbjFFW73 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 18:59:29 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 708FF172B
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 15:59:27 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b1ba018d94so47484641fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 15:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686092365; x=1688684365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hF0oxVVvSHTqTFEY1rR6vIPBTXc0jitlh8El9n2/1Gs=;
        b=mj1LUXsKllonpl4QP9NFldobP9Cm/plLO91LTMtwWrfw82oTgz9FSmFscr4hksHcVV
         Y5EBfusjErWNXGb35gOLvztT0tVlWOuDeEIDdMPFRkV39Eh+Kjkt0KeQ68OLc7mDPFGR
         Ti7xlJVXY27FktK1Uo3f5lc5mLrpVU1iurwDNalZpkj8vZgTYqhSbBaw8Ozz5hYRMcmq
         0ntXfjGo/QMBQMfs5QqKRFZYjVyFenL4nmgCRyeDL/h1+1DxjLHVks4CEHe0kioTSuPF
         p49TBVu5l4ubiUN0S8RuhxIQzgfSaho77dCgHdZpqzQGZ7tMqpn+ihyOEBWZTzHzPmpF
         Jk/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686092365; x=1688684365;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hF0oxVVvSHTqTFEY1rR6vIPBTXc0jitlh8El9n2/1Gs=;
        b=XMHqr8+b6eX/qK3DfoD2zVlqWxK1pjuUvF6fD2ExIgzPAFKxwgDhH9Q8eRsoNHOf6+
         08W/ek9AGYEaUo16UFh+FK2NghvmfuKkzVSK3Fa/UIY6O3anV48ueNFO9I/SZ6M7KZwl
         uC7HxPAOW/3viiVxIYW3/5M0I6QznfmGUGmyKVxVs2IcqM4olIhZvTvhgS7Lrg8UpF63
         l7wy4PznDVQ9yimVHo4OG0too+lOiqe5tLmpVrrBVHw+6Q94dF0+VYqKBwq5hhKT0ClG
         gOJSWliwOQ1kd+BQfNNlip2IeXbbeakJ9vDMVGJLDpFcdniGPzg/gDi3PAjQaAc6UNTD
         rDBQ==
X-Gm-Message-State: AC+VfDyl0WXYvHrMUa5oRD2CvebkajCP2yp/anqF8BcVMQEthxWNcQTm
        9lvE1LcQs6AnsAAj+M2Lw4Wn2g==
X-Google-Smtp-Source: ACHHUZ6ni7nM6IUg4t0ck+78i0mRmMfY9RuvwyF5SGUCoSzj7hgGLpRhRs5bQjPihp3v8l7QtAQDzw==
X-Received: by 2002:a2e:a307:0:b0:2b1:ec3f:4ba4 with SMTP id l7-20020a2ea307000000b002b1ec3f4ba4mr1469254lje.19.1686092365625;
        Tue, 06 Jun 2023 15:59:25 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id g21-20020a2eb0d5000000b002ad93c4c4e7sm2028712ljl.83.2023.06.06.15.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 15:59:25 -0700 (PDT)
Message-ID: <0cf278c9-d28a-34c4-f45d-c2c9fb5271e8@linaro.org>
Date:   Wed, 7 Jun 2023 01:59:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [RFC PATCH v2 10/13] drm/msm/dpu: add list of
 supported formats to the DPU caps
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        David Airlie <airlied@gmail.com>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-11-dmitry.baryshkov@linaro.org>
 <2a003674-29ef-f6c6-9a23-3eb93d2e479f@quicinc.com>
 <CAA8EJpr0DcVfG86SYKRb-4Ph82dfXafed9CFgY1qFSECFbAcTw@mail.gmail.com>
 <6c61a8f1-f77e-3a18-15f8-7c004a99f78d@quicinc.com>
 <cfad7817-2d7e-843d-033d-cf2f3aba440d@linaro.org>
 <868e69f5-0f47-18cf-0e1e-377c37376437@quicinc.com>
 <e258fce0-9044-399c-fcc9-634ea1d53f7a@linaro.org>
 <e43c9e17-1c0b-f3cd-036f-1a4968a0150d@quicinc.com>
 <12aacfc4-8ed5-1c85-8c1c-abd0aed7f8a9@linaro.org>
 <9addd6fc-460a-0bb6-d6d1-b2b51354c695@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9addd6fc-460a-0bb6-d6d1-b2b51354c695@quicinc.com>
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

On 07/06/2023 01:57, Abhinav Kumar wrote:
> 
> 
> On 6/6/2023 3:50 PM, Dmitry Baryshkov wrote:
>> On 07/06/2023 01:47, Abhinav Kumar wrote:
>>>
>>>
>>> On 6/6/2023 2:52 PM, Dmitry Baryshkov wrote:
>>>> On 07/06/2023 00:47, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 6/6/2023 2:29 PM, Dmitry Baryshkov wrote:
>>>>>> On 07/06/2023 00:14, Abhinav Kumar wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 5/24/2023 6:47 PM, Dmitry Baryshkov wrote:
>>>>>>>> On Thu, 25 May 2023 at 02:16, Abhinav Kumar 
>>>>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>>>>>>>>>> As we are going to add virtual planes, add the list of 
>>>>>>>>>> supported formats
>>>>>>>>>> to the hw catalog entry. It will be used to setup universal 
>>>>>>>>>> planes, with
>>>>>>>>>> later selecting a pipe depending on whether the YUV format is 
>>>>>>>>>> used for
>>>>>>>>>> the framebuffer.
>>>>>>>>>>
>>>>>>>>>
>>>>>>>>> If your usage of format_list is going to be internal to 
>>>>>>>>> dpu_plane.c, I
>>>>>>>>> can think of another idea for this change.
>>>>>>>>>
>>>>>>>>> This essentially translates to if (num_vig >= 1)
>>>>>>>>>
>>>>>>>>> If we can just have a small helper to detect that from the 
>>>>>>>>> catalog can
>>>>>>>>> we use that instead of adding formats to the dpu caps?
>>>>>>>>
>>>>>>>> I'd prefer to be explicit here. The list of supported formats might
>>>>>>>> vary between generations, might it not? Also we don't have a 
>>>>>>>> case of
>>>>>>>> the devices not having VIG planes. Even the qcm2290 (which doesn't
>>>>>>>> have CSC) lists YUV as supported.
>>>>>>>>
>>>>>>>
>>>>>>> the list of formats is tied to the sspps the dpu generation has 
>>>>>>> and the capabilities of those sspps.
>>>>>>>
>>>>>>> qcm2290 is really an interesting case. It has one vig sspp but no 
>>>>>>> csc block for that vig sspp, hence it cannot support non-RGB 
>>>>>>> formats.
>>>>>>>
>>>>>>> I have confirmed that downstream is incorrect to populate yuv 
>>>>>>> formats for qcm2290.
>>>>>>>
>>>>>>> I still think that having atleast one vig sspp with csc sub-blk 
>>>>>>> is the right condition to check if we want to decide if the dpu 
>>>>>>> for that chipset supports yuv formats. Extra csc-blk check to 
>>>>>>> handle qcm2290.
>>>>>>>
>>>>>>> Having a small helper in dpu_plane.c is good enough for that 
>>>>>>> because with virtual planes, you only need to know "if such a 
>>>>>>> plane exists and not which plane" and a full catalog change isnt 
>>>>>>> needed IMO
>>>>>>
>>>>>> This goes down to the question: is the list of YUV and non-YUV 
>>>>>> formats static or not? Do all DPU devices support the same set of 
>>>>>> YUV and non-YUV formats? If it is static, we might as well drop 
>>>>>> dpu_sspp_sub_blks::format_list.
>>>>>>
>>>>>
>>>>> I would say yes based on the below reference:
>>>>>
>>>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/clo/main/msm/sde/sde_hw_catalog.c#L3858
>>>>>
>>>>> We always add the same set of YUV formats for all Vig SSPPs 
>>>>> irrespective of the chipsets.
>>>>
>>>> Well, as your example pointed out, few lines below it starts adding 
>>>> formats to the list, so the format list is not static and depends on 
>>>> the generation.
>>>>
>>>
>>> No, the DPU revision checks are there to add P010 UBWC formats on top 
>>> of the Vig formats.
>>>
>>> At the moment, the latest downstream code (code which is not on CLO 
>>> hence I cannot share) has dropped all that and just checks if P010 
>>> UBWC is supported for the Vig SSPP and adds all those.
>>>
>>> So its still tied to the feature bit whether P010 UBWC is supported 
>>> in the Vig SSPP and not at the chipset level.
>>
>> So, what is the difference? This means that depending on some 
>> conditions either we can support P010 UBWC or we can not. So the list 
>> of all suppored formats is not static.
>>
> 
> The difference is SSPP level vs chipset level. This patch was made with 
> chipset level in mind and had to expand the format list for each chipset.
> 
> What I am suggesting is its a SSPP level decision. Please note its not 
> just P010 UBWC but P010 UBWC FOR Vig SSPP.
> 
> So expanding each chipset's format list is not needed when the decision 
> can be made just on the basis of the SSPP's feature flag OR the presence 
> of the csc blk.

Maybe I misunderstand something. Is P010 UBWC format supported on VIG 
SSPPs on all generations? The code that you have pointed me suggests 
that is is not.

> 
>>>
>>>>>
>>>>>> Note to myself: consider 
>>>>>> dpu_mdss_cfg::{dma_formats,cursor_formats,vig_formats}. Either 
>>>>>> migrate dpu_sspp_sub_blks::format_list users to these fields or 
>>>>>> drop them.
>>>>>>
>>>>>
>>>>> Yes, I agree. There is no need to have format list in the sub_blk 
>>>>> as for one type of SSPP, it supports the same format across DPU 
>>>>> generations.
>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> Note: I think at some point we should have a closer look at the 
>>>>>>>> list
>>>>>>>> of supported formats and crosscheck that we do not have either
>>>>>>>> unsupported formats being listed, or missing formats which are not
>>>>>>>> listed as supported.
>>>>>>>>
>>

-- 
With best wishes
Dmitry

