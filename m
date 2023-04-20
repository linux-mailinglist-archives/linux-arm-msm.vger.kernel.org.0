Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 586A46E9EC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Apr 2023 00:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbjDTW0K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 18:26:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbjDTW0J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 18:26:09 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA82B2D65
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 15:26:07 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2a7af0cb2e6so9262981fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 15:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682029566; x=1684621566;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PPqVKaovQ89J2wk31cIN2/tylDeQQmfgtIk12zM+ji0=;
        b=yh9CupN8hdlmIj4rWnexyyi2vGJAfkwcZd4C1nPMFeTK1HDr7TuM6wzdGuO8YbK7Ez
         X8awDaBGSNUaF0hxivkx+83EPJ84Q0D+ENVqNzKSZGJo7VlcJ8eeHCF5B6gXyU4qrNYj
         d/vrfiJb8H+3s6pr4YrDVR7YBAeful2LgRVo0rAcDKdiguOK4GorI2jFLWj8WxCRtHEX
         t4uBnK5/CJPHJJBord1iISTiy6Llk3EICBphkDeh6UpNm+yJ3U/vutbHTI2upS93Tu9D
         OHCJq7e93WhoalK/zvXhtIqSMvxSOxvr/5qbKjc6zpXwY5e6GLTIvo+TN3HC62Raxyru
         ErKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682029566; x=1684621566;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PPqVKaovQ89J2wk31cIN2/tylDeQQmfgtIk12zM+ji0=;
        b=apf81uNQlCyVv/vHlfKDAlDkujPUTkn22alwwnEwW6S5ZMsMZH8tUmhNu4JKc/Swob
         rpmKnkLjRSJGGYlEaRVRlNvnk1RqoKUxx5EZ8+9C7zdLYC7TlltPoKXG3rmbfi4DpKY7
         Cldyuy/+cWFpU7TCzk0wcyfZ56eZiObqk/RQFspg4nDYQUhBI4FHri5JXoEhm3V0XbCM
         KVeSHiIwP0XrTI5TVnV95puECjxzlccoifL5u9IdtGtJuE/lM9kEX+i3EkUVJOySnYim
         RTD2viOm9iaxac5r1hI6M7Ws9T5/pWHh/mA5fxUDZlc2P59iXgJUjvRDUeTF0P5i+RNI
         8QXA==
X-Gm-Message-State: AAQBX9cRYH/kSK0QhgrUtuf1USnXO8Z63+lpD/hRTa5hTSdWoSFKAGZm
        J/vCilY/5wKtn57H3/gugOiPXg==
X-Google-Smtp-Source: AKy350Zc0bJvEx2tHcZqEKPIJk2YM7iGFVIGEmNkxpF8A6/h5GdDi8sbXlSJ6cn4qPSr0teO8pJlgA==
X-Received: by 2002:ac2:5a1b:0:b0:4eb:b28:373e with SMTP id q27-20020ac25a1b000000b004eb0b28373emr753527lfn.61.1682029565920;
        Thu, 20 Apr 2023 15:26:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v6-20020a056512048600b004ec866430absm350289lfq.141.2023.04.20.15.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 15:26:05 -0700 (PDT)
Message-ID: <80c076ca-2d95-c25e-6d46-6be25d79085f@linaro.org>
Date:   Fri, 21 Apr 2023 01:26:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/msm/dpu: drop the regdma configuration
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230420200742.1200531-1-dmitry.baryshkov@linaro.org>
 <75d7qx65ksvzgwb7xdkn26krqyih3ipi4hjyvw5mvgfsafvjnu@zauwifqiirk4>
 <5p4ospar4woaefr76x5rv6f5mgj76mzkuqihjdrngmntulaiwi@pe5sa75avguz>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <5p4ospar4woaefr76x5rv6f5mgj76mzkuqihjdrngmntulaiwi@pe5sa75avguz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/04/2023 01:01, Marijn Suijten wrote:
> Whoops, looks like I wrongly lost all the cc's when importing b4-am's
> mbx file which is just a patch with a few but not all email headers.
> Cc'ing everyone on this occasion with my review.
> 
> On 2023-04-20 23:33:07, Marijn Suijten wrote:
>> On 2023-04-20 23:07:42, Dmitry Baryshkov wrote:
>>> The regdma is currently not used by the current driver. We have no way
>>
>> Nit: 2x current
>>
>>> to practically verify that the regdma is described correctly. Drop it
>>> now.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>
>> Do we need to keep the `regdma` range that is `ioremap`ed in
>> `dpu_kms.c`?  Only msm8998-dpu allows it in the bindings anyway.

Sure, why not.

>>
>>> ---
>>>   .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  2 -
>>>   .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  2 -
>>>   .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  2 -
>>>   .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  2 -
>>>   .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  2 -
>>>   .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  2 -
>>>   .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  2 -
>>>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  2 -
>>>   .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  2 -
>>>   .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  2 -
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 40 -------------------
>>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 18 ---------
>>>   12 files changed, 78 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> index 2b3ae84057df..aa923fb2ebcb 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
>>> @@ -195,8 +195,6 @@ const struct dpu_mdss_cfg dpu_msm8998_cfg = {
>>>   	.intf = msm8998_intf,
>>>   	.vbif_count = ARRAY_SIZE(msm8998_vbif),
>>>   	.vbif = msm8998_vbif,
>>> -	.reg_dma_count = 0,
>>> -	.perf = &msm8998_perf_data,
>>
>> Don't think you intended to remove the perf data?  There's no dma_cfg
>> member because the count is zero.

Ack, thanks for the note.

> 
> - Marijn

-- 
With best wishes
Dmitry

