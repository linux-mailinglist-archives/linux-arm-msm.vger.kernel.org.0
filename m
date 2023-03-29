Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 213DE6CF7C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 01:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbjC2XwL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 19:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjC2XwK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 19:52:10 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABE095FF7
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 16:51:54 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id x17so22364843lfu.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 16:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680133913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0LKiTCfatgunVbCY7EWbbfW1aBzT4BASgK3wqqdG5gw=;
        b=zq1HXarnX1WAfWcjIJj/xMH2dxgZaXAEq5cuINHDgaW9dwVuYteEqDFwaIp0kCy3dI
         KkrUJ8IMLtI/EQenf9WZlbr3sTefJ5oLh82vln3V6Mqwy/L3Gbp6LPP+PASO1BZsHLY4
         NvnkOnNL5OCWmmhLOKypejobPBmg8Oz8r+lI+OsnJmDQcR7TqJfHam0rcsG7wLR8hoRS
         xoWu4FsccRkOlcOiQlsfurPMz5pmPuJaarnieJPb9oMe7FfPXuASiB4tMUdR5rMei2JA
         ng+8nlJz3NUHjy7+W3p80dx/REJX/wQErT2vzMCDS9rJ6V4OPGYd8J8Yo8m380i6qjjK
         /qeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680133913;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0LKiTCfatgunVbCY7EWbbfW1aBzT4BASgK3wqqdG5gw=;
        b=203WGoO2zyp5wdVtFfcEfIt6fHNtSEXQGDTnPEfdJ4D+gBJJr9eCbga+tk9vx6bR83
         8/OFy4+yVrr43MV7L6Mc92xs+6gSII32gu6yWad3ifDt4HctHyESWAtkfroBIamcBSSs
         GP72xKvpRiT7th3s1gvgRcv/Vb6h7IR8LMo0pN2Sqxf7dEYZn7icYz1Hn/xUhBLJ/vnj
         t+y0Q2cmieAkfdXTb5bD5EmYsJ5fVHjKH9RltqqYFua3zNmpapUIdf+X/IFT1qbPwlKI
         RvWlkWZ24W9NH9nPTxvxQgyfBaisO2k6c4MTV+C23ouDd7G2ipZi9ITmgRPVkY0VtQMU
         Q+xw==
X-Gm-Message-State: AAQBX9ddikLwRqDMYSOmJcXT0dfqk9bKdHV2CdNaRn+nD5p3GGeLWAxu
        r3WMQnV0Wz+HDAcwFSRNS5BNd+vd/UtxLzBiTqs=
X-Google-Smtp-Source: AKy350ZJJicQZ0HPbY32XDLcOd4mG+jW4zOrY9d5/HGOO1Dg49vg5uMHEjnFau66a/aIThHm2s1bUA==
X-Received: by 2002:ac2:5a03:0:b0:4e9:d53:a5ef with SMTP id q3-20020ac25a03000000b004e90d53a5efmr6180140lfn.1.1680133912855;
        Wed, 29 Mar 2023 16:51:52 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id f16-20020ac25330000000b004e844eeb555sm5671147lfh.214.2023.03.29.16.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 16:51:52 -0700 (PDT)
Message-ID: <e52a1a47-ce6f-7654-a8fb-428b5a896ad9@linaro.org>
Date:   Thu, 30 Mar 2023 02:51:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 3/5] drm/msm/dpu: Use DRM DSC helper for
 det_thresh_flatness
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-3-f3e479f59b6d@quicinc.com>
 <4e12cc50-cd34-e1a1-3a91-0da369b785c1@linaro.org>
 <9ba94f43-845f-886f-a87e-ec46613b74b6@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9ba94f43-845f-886f-a87e-ec46613b74b6@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/03/2023 02:45, Jessica Zhang wrote:
> 
> 
> On 3/29/2023 4:31 PM, Dmitry Baryshkov wrote:
>> On 30/03/2023 02:18, Jessica Zhang wrote:
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>>> index 619926da1441..648c530b5d05 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
>>> @@ -3,6 +3,8 @@
>>>    * Copyright (c) 2020-2022, Linaro Limited
>>>    */
>>> +#include <drm/display/drm_dsc_helper.h>
>>> +
>>>   #include "dpu_kms.h"
>>>   #include "dpu_hw_catalog.h"
>>>   #include "dpu_hwio.h"
>>> @@ -102,7 +104,7 @@ static void dpu_hw_dsc_config(struct dpu_hw_dsc 
>>> *hw_dsc,
>>>       data |= dsc->final_offset;
>>>       DPU_REG_WRITE(c, DSC_DSC_OFFSET, data);
>>> -    det_thresh_flatness = 7 + 2 * (dsc->bits_per_component - 8);
>>> +    det_thresh_flatness = drm_dsc_calculate_det_thresh_flatness(dsc);
>>
>> But this changes the value! Compare:
>>
>> bpc | old | new
>> 8   | 7   | 2
>> 10  | 11  | 8
>> 12  | 15  | 256
>>
>> If this is intentional, please state so and maybe add a Fixes tag.
> 
> Hi Dmitry,
> 
> Yep this was intentional to match downstream and the spec. Will add a 
> fixes tag for this.

Good! I found corresponding change in msm-4.14, so now I understand why 
previously we had what we had.

> 
> Thanks,
> 
> Jessica Zhang
> 
>>
>>
>>>       data = det_thresh_flatness << 10;
>>>       data |= dsc->flatness_max_qp << 5;
>>>       data |= dsc->flatness_min_qp;
>>>
>>
>> -- 
>> With best wishes
>> Dmitry
>>

-- 
With best wishes
Dmitry

