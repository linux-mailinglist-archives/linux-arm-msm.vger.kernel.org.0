Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CCAF53D3D4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jun 2022 01:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343816AbiFCXV0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jun 2022 19:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236404AbiFCXVZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jun 2022 19:21:25 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2AD413CD3
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jun 2022 16:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1654298484; x=1685834484;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=bUMNBuUXY/UAvVKqEyweKMXGBGukeILdGV/BgiEzxl4=;
  b=imhfqCW4Xcp/3VFu3P0HRxdwyIsLG4o8o/d4uQSNfKF7PWRD/tTE6NOU
   Tci3IwoTEhlEn9nf1VvuHGT2QfTm/o4aTKaYdxEya2l0fDJol0U2q1A4T
   M1P17MIiSVfk9OLFAbzegRXFw3N0z/dTCvcal8lbKdAjt96WawpmeLSNl
   g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 03 Jun 2022 16:21:24 -0700
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2022 16:21:24 -0700
Received: from [10.71.110.111] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Fri, 3 Jun 2022
 16:21:23 -0700
Message-ID: <ec9516d1-31dd-5cfb-6f93-8cb41e205498@quicinc.com>
Date:   Fri, 3 Jun 2022 16:21:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dpu: Add interface support for
 CRC debugfs
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <quic_abhinavk@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <swboyd@chromium.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>,
        <quic_aravindh@quicinc.com>, <freedreno@lists.freedesktop.org>
References: <20220527185407.162-1-quic_jesszhan@quicinc.com>
 <20220527185407.162-4-quic_jesszhan@quicinc.com>
 <266fdac1-db57-a729-3d73-42d2b34017cd@linaro.org>
 <aa4617f6-65fd-73c6-61b1-686a72c515d7@quicinc.com>
 <beaaeb57-c144-a680-eea6-20a950d25205@linaro.org>
 <bd96aaaf-e324-295c-a35b-1474deeb706c@quicinc.com>
 <CAA8EJppE8dZFQD0fsoS1YwKTzj6U_CfL1SD6RB5stRnD-7UYuQ@mail.gmail.com>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <CAA8EJppE8dZFQD0fsoS1YwKTzj6U_CfL1SD6RB5stRnD-7UYuQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6/3/2022 12:02 AM, Dmitry Baryshkov wrote:
> On Fri, 3 Jun 2022 at 04:02, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>> On 6/2/2022 3:51 PM, Dmitry Baryshkov wrote:
>>> On 28/05/2022 01:23, Jessica Zhang wrote:
>>>> On 5/27/2022 12:46 PM, Dmitry Baryshkov wrote:
>>>>> On 27/05/2022 21:54, Jessica Zhang wrote:
>>>>>> Add support for writing CRC values for the interface block to
>>>>>> the debugfs by calling the necessary MISR setup/collect methods.
>>>>>>
>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> [skipped]
> 
>>>>>> +
>>>>>> +        phys->hw_intf->ops.setup_misr(phys->hw_intf, true, 1);
>>>>>> +    }
>>>>>> +}
>>>>>> +
>>>>>> +int dpu_encoder_get_crc(const struct drm_encoder *drm_enc)
>>>>>> +{
>>>>>> +    struct dpu_encoder_virt *dpu_enc;
>>>>>> +    u32 crcs[MAX_PHYS_ENCODERS_PER_VIRTUAL];
>>>>>> +
>>>>>> +    int i, rc;
>>>>>> +
>>>>>> +    if (!drm_enc->crtc) {
>>>>>> +        DRM_ERROR("no crtc found for encoder %d\n", drm_enc->index);
>>>>>> +        return -EINVAL;
>>>>>> +    }
>>>>>> +
>>>>>> +    dpu_enc = to_dpu_encoder_virt(drm_enc);
>>>>>> +
>>>>>> +    for (i = 0; i < dpu_enc->num_phys_encs; i++) {
>>>>>> +        struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
>>>>>> +
>>>>>> +        if (!phys->hw_intf || !phys->hw_intf->ops.collect_misr)
>>>>>> +            continue;
>>>>>> +
>>>>>> +        rc = phys->hw_intf->ops.collect_misr(phys->hw_intf, &crcs[i]);
>>>>>
>>>>> This doesn't look fully correct. Do we need to skip the indices for
>>>>> the phys without a backing hw_intf?
>>>>
>>>> Sorry if I'm misunderstanding your question, but don't we need to have
>>>> a backing hw_intf (and skip if there isn't any) since the methods for
>>>> collecting/setting MISR registers is within the hw_intf?
>>>
>>> Yes. So the question if we should skip the phys and leave the crcs[i]
>>> untouched, skip the phys and sset crcs[i] to 0 or change
>>> dpu_crtc_parse_crc_source() to return the number of intf-backed
>>> phys_enc's and do not skip any crcs[i].
>>
>> Thanks for the clarification.
>>
>> Is it possible to hit a case where a phys_encoder won't have a
>> corresponding hw_intf?
>>
>> AFAIK, it seems guaranteed that a phys_encoder will have an hw_intf
>> since dpu_encoder_setup_display will skip incrementing num_phys_encs if
>> dpu_encoder_get_intf fails [1].
> 
> WB encoders won't have hw_intf. The code checks that either get_intf
> or get_wb succeeds.

Got it, I see your point. I'll change the values_cnt to only include the 
intf-backed phys_encoders then.

Thanks,

Jessica Zhang

> 
>>
>> [1]
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c#L2263
> 
> 
> -- 
> With best wishes
> Dmitry
