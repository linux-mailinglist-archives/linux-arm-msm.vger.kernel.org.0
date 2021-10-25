Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 984294398C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 16:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232319AbhJYOj4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 10:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbhJYOj4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 10:39:56 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC35C061746
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 07:37:33 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id r6so9578931ljg.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 07:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=37RgvT0lSxttAIlpSPbiWU3o8nfxLJzJwGwkROsLVrI=;
        b=PDheW/ZXwp72+mvCVThbwpylurx7v+Cxk9afOfRVMDOUgcboyCOHD8N9w2FJBMecZ6
         DODHV7P0yY6Jbo70Qq+smB6P/iI3dW3upMnC53iBiHe2W4iiYg/lIeLw9FSI1HJ9VpEY
         xfTG21VYrElV69izSy1tOfYMyx+ViO1Aumh16/zmzrZtfrC4HX3A8LqO2r20t7ywASjl
         +mTr1v7Ux2JItddXY6lh/u2RnLz19HgWHwdyBuDUrSJr9j+EsIn/ZyCjH/DvdGnd4Qsv
         ja98WuZ+8d9se8V+KM60Lw1LYLQBiQPrlZX1i4RTreVsSQUvd2fF/UoZbEspCtW++zcY
         Gh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=37RgvT0lSxttAIlpSPbiWU3o8nfxLJzJwGwkROsLVrI=;
        b=OF1nqn20cXDuA3GNA1Oo2hi6gR/xVDrPmybHPGmdnaHKmyXA9V2u1lF+PqxzE2+kEg
         cP8Nspet1UtWnTQ9oAMgXy+ZjDD9D0y6ETEHrYbLoxvxYkMuxGxcyRySSsUHIv2uevGo
         /Fk96078StJi+26mjw5VLG+asfqkzVdXQThKwpAQ251grRCTIWcTZFqDuRNxfu8T8s0L
         dsMRTX8CwO/rgPXDRA7sfCQKmUVtmxZ6DMp/ZcYA42+UcvQSNk1w3zena/Q3yxfcrN6I
         4DDUrCmeZmk5T+raVxFXGqwJZABixToYtgkUdjTjl/oR5MqIkdQRFEVcAiz0KvgH8uGz
         YhLg==
X-Gm-Message-State: AOAM530YlrHPSTUkGns33sMyEp16c1CAgqMtSUhaG7DxlLJ5qUOtqWla
        rbqLT/Lr94dAJw9VaIp4rcSW4Q==
X-Google-Smtp-Source: ABdhPJzF+wFEONNsTMIkjQf5jW/Xtl49NSImVljVD73HjiPKVvYXkdYFtOaCLEq0Vp+IpFuL/zjJtw==
X-Received: by 2002:a2e:9609:: with SMTP id v9mr18279740ljh.275.1635172652250;
        Mon, 25 Oct 2021 07:37:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m6sm89924ljp.113.2021.10.25.07.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Oct 2021 07:37:31 -0700 (PDT)
Subject: Re: [PATCH v2 09/11] drm/msm/disp/dpu1: Add support for DSC in
 topology
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-10-vkoul@kernel.org>
 <020ab810-c975-d58b-a572-57eb3010d6c0@linaro.org>
Message-ID: <7ba115c8-16e6-54c4-b151-e69eedcb47d2@linaro.org>
Date:   Mon, 25 Oct 2021 17:37:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <020ab810-c975-d58b-a572-57eb3010d6c0@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 14/10/2021 17:13, Dmitry Baryshkov wrote:
> On 07/10/2021 10:08, Vinod Koul wrote:
>> For DSC to work we typically need a 2,2,1 configuration. This should
>> suffice for resolutions upto 4k. For more resolutions like 8k this won't
>> work.
>>
>> Also, it is better to use 2 LMs and DSC instances as half width results
>> in lesser power consumption as compared to single LM, DSC at full width.
>>
>> The panel has been tested only with 2,2,1 configuration, so for
>> now we blindly create 2,2,1 topology when DSC is enabled
>>
>> Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
>> Signed-off-by: Vinod Koul <vkoul@kernel.org>
>> ---
>> Changes since
>> RFC:
>>   - Add more details in changelog
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index aac51c1bdf94..70f57a071165 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -538,6 +538,8 @@ static struct msm_display_topology 
>> dpu_encoder_get_topology(
>>               struct drm_display_mode *mode)
>>   {
>>       struct msm_display_topology topology = {0};
>> +    struct drm_encoder *drm_enc;
>> +    struct msm_drm_private *priv;
>>       int i, intf_count = 0;
>>       for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
>> @@ -572,8 +574,22 @@ static struct msm_display_topology 
>> dpu_encoder_get_topology(
>>       topology.num_enc = 0;
>>       topology.num_intf = intf_count;
>> +    drm_enc = &dpu_enc->base;
>> +    priv = drm_enc->dev->dev_private;
>> +    if (priv && priv->dsc) {
>> +        /* In case of Display Stream Compression DSC, we would use
>> +         * 2 encoders, 2 line mixers and 1 interface
>> +         * this is power optimal and can drive upto (including) 4k
>> +         * screens
>> +         */
>> +        topology.num_enc = 2;
>> +        topology.num_intf = 1;
>> +        topology.num_lm = 2;
> 
> So, here you'd set the topology.num_rm.

I meant 'num_dsc', please excuse the typo.

> 
>> +    }
>> +
>>       return topology;
>>   }
>> +
>>   static int dpu_encoder_virt_atomic_check(
>>           struct drm_encoder *drm_enc,
>>           struct drm_crtc_state *crtc_state,
>>
> 
> 


-- 
With best wishes
Dmitry
