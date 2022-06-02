Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 193E553C05D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jun 2022 23:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbiFBVag (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jun 2022 17:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbiFBVac (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jun 2022 17:30:32 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1230223BE6
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jun 2022 14:30:31 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id r8so6014313ljp.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jun 2022 14:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XzPSZDkHqlfhXXNElxfL2tzko5P7SZop+8kxOD3fOXc=;
        b=nB7UbuH4mmQHiE+0EIKbQv5WhULrT7aFENXAZoBtooEo2FhwYRU8nFWiTfwQk2SWu8
         oPW7aCCOHP33+JRtrc9KEC4ezZ54Th4d4vr9J/SaohgpHs2t3ToogHX2pfNiBLpY78ZU
         ixWXVrdBm2fD3AHGO3VcQZGemV91KuseNzvSlPM8QgezQfmAgeWhKpmf8JoUoSYqPSOl
         rFQ4CE8uyuUZkuTFaA+DE4xD4NZWQ6dKsg7aESBj//bZhgTJY6OR4Fm5B/fI1KUAuL9i
         ozg5Sy5jwLf5Pav8BNtsYe8740H2f3zWD6PkYSkr8wEvxYPmUzmHZ7Rw6h24gamKQ/VN
         3lcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XzPSZDkHqlfhXXNElxfL2tzko5P7SZop+8kxOD3fOXc=;
        b=u+Vw9Za8ZuzFHwJVxXQzaKiFGRDQwbVhUCcqoWrJiGvymzzKHSxnqzXU6wE2kSEpUh
         twkWoi4WkVnkZoHnElOg/DHNPeqydbaeYIX+3uomEgOv+Hj3ZEOYQ7hxR/cfyAQUgupT
         DXrtr6TqiLgySEEwNP4bSdDc0zL1V6uGCt/Mv3xAKPeRUz9UqVsqp++5JlrmpTJQHgBz
         FKH2uId+n2Q1Z1WRaCj8CeffSEN8uAngqmx8s9op70p9/y4v0Up25ZFNDXV80bXR8ZDE
         ctBfwWhO5u0KpsW0Ff7k5EIX3Qr14x0rUtiUNFzkFVO/r3vrdjAOMQ7I+kF4k80UEnzn
         vstg==
X-Gm-Message-State: AOAM53034ApLcUARMAX8Oc2GYbJWy2m/GASIB1Ig13VWa0Myq7RBAy51
        hwZZ7Wow3wYec74GUJXzf8sGhQ==
X-Google-Smtp-Source: ABdhPJz4BAmKowdTjBR4WRTsxlt2gWIgsTgak+woebkooU0PA8SO0VLTygNBbGBWyRrot+wZDst0Dw==
X-Received: by 2002:a05:651c:893:b0:249:4023:3818 with SMTP id d19-20020a05651c089300b0024940233818mr44377790ljq.44.1654205428972;
        Thu, 02 Jun 2022 14:30:28 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w41-20020a0565120b2900b00477a51842aasm1214248lfu.211.2022.06.02.14.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 14:30:28 -0700 (PDT)
Message-ID: <fb8f2f80-e016-80d4-cf30-0b1df5bde261@linaro.org>
Date:   Fri, 3 Jun 2022 00:30:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 0/7] drm/msm: clean up the hw catalog init
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220602202207.1754351-1-dmitry.baryshkov@linaro.org>
 <cb7e2c75-286a-2b74-7e21-bee90a83a91d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <cb7e2c75-286a-2b74-7e21-bee90a83a91d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/06/2022 23:24, Abhinav Kumar wrote:
> 
> 
> On 6/2/2022 1:22 PM, Dmitry Baryshkov wrote:
>> Replace superfluous cfg_init functions, which just assign a static
>> config to the struct dpu_mdss_cfg, with static instances of struct
>> dpu_mdss_cfg.
>>
>> Changes since v2:
>>   - Add DPU_MIXER_COMBINED_ALPHA to sc7180's mixer features mask (noted
>>     by Abhinav).
>>
>> Changes since v1:
>>   - Turn catalog->perf and catalog->dma_cfg to be pointers, otherwise
>>     clang complains that they are not constant.
>>
> 
> I see you have dropped the R-bs from all the changes in V2.
> Can you please add them back?

Yes, I missed that in v3. Should be fixed in v4.

> 
>> Dmitry Baryshkov (7):
>>    drm/msm/dpu: use feature bit for LM combined alpha check
>>    drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
>>    drm/msm/dpu: remove hwversion field from data structures
>>    drm/msm/dpu: change catalog->perf to be a const pointer
>>    drm/msm/dpu: change catalog->dma_cfg to be a const pointer
>>    drm/msm/dpu: constify struct dpu_mdss_cfg
>>    drm/msm/dpu: make dpu hardware catalog static const
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   4 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   4 +-
>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  12 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 502 ++++++++----------
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  20 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |   1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |   5 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |   2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |   1 -
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |   5 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |   1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |   7 +-
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    |   1 -
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |   1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   5 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |   1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   2 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |   5 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   6 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  20 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |   2 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   2 +-
>>   27 files changed, 283 insertions(+), 359 deletions(-)
>>


-- 
With best wishes
Dmitry
