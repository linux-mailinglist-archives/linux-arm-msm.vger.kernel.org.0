Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4864DC090
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Mar 2022 08:59:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiCQIAo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Mar 2022 04:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiCQIAn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Mar 2022 04:00:43 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E28D13E3B
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 00:59:27 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id bn33so6171323ljb.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Mar 2022 00:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OtyZ97/DtC02CCXZi3B8H4fv744GdMX0wPf5ZhQfoGw=;
        b=ASh8N6BgDUXCvOh8AN4wyKRfTFW04iW4U3OSVJMOEUjJyMPGFkI98g8j16AoI9M9nM
         iWfLeoT+I/vslJgVGwuMOKyY8oiq6AV/IHaU5/4icJoflilxJCVkcXB4Ky8+3BbS4xYq
         HOiGv9ms03QVgqReZnxp7I6SyY5gwkbUh2QH6UOzposPYUO2ZnHj101WiPexFm2g3H89
         nujY8Usz1R6ZJVeAXeTizg7qYjfI759cl2EJNVSO5hTK0HMKBemjH1R/LLwYlYKSYnC8
         +NJGh16yw+pLaiEf+jOp1VGAdN9bAVlIrPtgwb36AUdMy6F/gDzwUVaeYCCFFXt0Jx9b
         1r5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OtyZ97/DtC02CCXZi3B8H4fv744GdMX0wPf5ZhQfoGw=;
        b=3D8dcfb1lgDxBaqBbFJlxODRtGe8D8WoUn66B/ZO9tyU16J5AaU9XykDv8MIfRrgdl
         PyIYk5eKxkVsuxQyonAsGTLT0jrCvF5wvUdh12o6OC46oWaopBef5o3ofGmU8s+NmQtv
         UtC4wN7JQ4iGjOGHwbbDGAE/omDSVE10ex6mDEjJWeSQFIo6+NDrOjRLkCXy1p/acuRJ
         CtwslAe/BuNqfZOLxzu7YAbPZcK6p7SSJBMVefrthPdyj4NE3CQG8X/QBJ43Gppn8M45
         SsJxavFKjQo80G8mtO+3KwXJbt0AeHj4PkvcmD662jgijqwCDiGvg7l3GLcNjVSKta9X
         Brjg==
X-Gm-Message-State: AOAM5302+bZMrX/8Xz7joehwibTX4ZwdSvoxLylyrE3RNpt8ShW0Kn/o
        2lqvIM/FlP2p8PhAGRNYNJy4ew==
X-Google-Smtp-Source: ABdhPJxzuw0bC2ZnoSNV4sgesLiyJsLwE3cTtundL6ls6xWzn00PawGeLjUIj45+0jjam83e0Jd6GA==
X-Received: by 2002:a2e:6e0d:0:b0:248:cd0:e154 with SMTP id j13-20020a2e6e0d000000b002480cd0e154mr2127040ljc.342.1647503965443;
        Thu, 17 Mar 2022 00:59:25 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u12-20020a056512128c00b00446499f855dsm381195lfs.78.2022.03.17.00.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Mar 2022 00:59:24 -0700 (PDT)
Message-ID: <e5aeab49-ab9d-682e-52e5-614a6aeba6de@linaro.org>
Date:   Thu, 17 Mar 2022 10:59:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 00/25] drm/msm/dpu: wide planes support
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20220209172520.3719906-1-dmitry.baryshkov@linaro.org>
 <9476aa45-1d41-20ed-7f2f-79719f246b50@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <9476aa45-1d41-20ed-7f2f-79719f246b50@quicinc.com>
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

On 17/03/2022 04:10, Abhinav Kumar wrote:
> Hi Dmitry
> 
> I have reviewed the series , some patches completely , some of them 
> especially the plane to sspp mapping is something i still need to check.
> 
> But I had one question on the design.
> 
> I thought we were going to have a boot param to control whether driver 
> will internally use both rectangles for the layer so that in the future 
> if compositors can do this splitting, we can use that instead of driver 
> doing it ( keep boot param disabled ? ).

No need to for this patch series. If your composer allocates smaller 
planes, then the driver won't do a thing. For the proper multirect there 
will be a boot param (at least initially) and then you can work on the 
custom properties, etc.

> 
> Thanks
> 
> Abhinav
> 
> On 2/9/2022 9:24 AM, Dmitry Baryshkov wrote:
>> It took me a way longer to finish than I expected. And more patches that
>> I initially hoped. This patchset brings in multirect usage to support
>> using two SSPP rectangles for a single plane. Virtual planes support is
>> omitted from this pull request, it will come later.
>>
>> Dmitry Baryshkov (25):
>>    drm/msm/dpu: rip out master planes support
>>    drm/msm/dpu: do not limit the zpos property
>>    drm/msm/dpu: add support for SSPP allocation to RM
>>    drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
>>    drm/msm/dpu: move pipe_hw to dpu_plane_state
>>    drm/msm/dpu: inline dpu_plane_get_ctl_flush
>>    drm/msm/dpu: drop dpu_plane_pipe function
>>    drm/msm/dpu: get rid of cached flush_mask
>>    drm/msm/dpu: dpu_crtc_blend_setup: split mixer and ctl logic
>>    drm/msm/dpu: introduce struct dpu_sw_pipe
>>    drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp callbacks
>>    drm/msm/dpu: inline _dpu_plane_set_scanout
>>    drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
>>    drm/msm/dpu: move stride programming to
>>      dpu_hw_sspp_setup_sourceaddress
>>    drm/msm/dpu: remove dpu_hw_fmt_layout from struct dpu_hw_pipe_cfg
>>    drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
>>    drm/msm/dpu: drop src_split and multirect check from
>>      dpu_crtc_atomic_check
>>    drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check()
>>    drm/msm/dpu: don't use unsupported blend stages
>>    drm/msm/dpu: add dpu_hw_pipe_cfg to dpu_plane_state
>>    drm/msm/dpu: simplify dpu_plane_validate_src()
>>    drm/msm/dpu: rewrite plane's QoS-related functions to take dpu_sw_pipe
>>      and dpu_format
>>    drm/msm/dpu: rework dpu_plane_atomic_check() and
>>      dpu_plane_sspp_atomic_update()
>>    drm/msm/dpu: populate SmartDMA features in hw catalog
>>    drm/msm/dpu: add support for wide planes
>>
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 355 +++-----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h      |   1 -
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |   4 -
>>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  10 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |  78 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h    |  35 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 136 +--
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  88 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  21 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   1 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 813 +++++++++---------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  42 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  81 ++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   6 +
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  19 +-
>>   15 files changed, 827 insertions(+), 863 deletions(-)
>>


-- 
With best wishes
Dmitry
