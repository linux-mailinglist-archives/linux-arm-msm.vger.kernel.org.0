Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D221704E78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 May 2023 15:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbjEPNAJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 May 2023 09:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233461AbjEPNAB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 May 2023 09:00:01 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCFD59F2
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 05:59:34 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4eff4ea8e39so16176320e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 May 2023 05:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684241969; x=1686833969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RyX6rQJR1BZQe9Yc57Xp/rJrQBCXKFM6w6ZuIQmIOyk=;
        b=vms5vFb83wjTEUFScjnZ39oGL9tY2MRnQCrmiM+Z9r8mbDubZnpRtiI94iw7RQHBiG
         NQlmg0NnQK5UWCHQAo7xRz5Bc228a9R01ftilJ6IUT2lUm5XaaUNSQ7OHnjcBvRofMEx
         DGSsneyG3NEoZzAE3kgVBc0ixpS/9nduEN/bFcMq8BwFjTY3Z6bTTX1rSe0gM9EpFiut
         DySc6CxiBo/ZSeaiwij+VNx4FBjDaKaRNnar8q8HgHujQln+VWp3L75DJgnMTrvIWeXj
         1zkAMj7IT0v7Ktd0k0c/MGkTFc20GDtFYo3o8TvPg0zX+03jq1aybpoUMCqea/zXSymx
         6MTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684241969; x=1686833969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RyX6rQJR1BZQe9Yc57Xp/rJrQBCXKFM6w6ZuIQmIOyk=;
        b=db60Ey9E3DRXmJ+uZnPJXmjMZEKskhF385uuD0ia4Nv4SYUJngsvhiYYt1couH3vW6
         geil/2e5qKp/waRyEaYVMGymVDewsz41X0hAhX2xSTLeRwe5y2ip9ZpUCMgjlmaG1kri
         2Aph9aPE+rcaE+bvcboi4tEMFEahXrThggtK/a99B3pUP2jX2b0ojhkMI8+ApsmxDv/L
         TFluOvxKKMxmPz7NV9bdjhuGtr/6qNvVkarcuuBvWGx3MJIJob1MHrAqblEzUvWYafIl
         Dm8Hu65xf1Vtng2bYmIbC+j0l7m2jmJcZsPqW5UnJSlGDf5g3YbhQMMcp+IwZ5VNyt8J
         gN0A==
X-Gm-Message-State: AC+VfDyZd/NFErcu62Xm3gg3IfOPrWQjxzlpsc7xIeyWtkswzfFWfh8U
        dIcidemIa2I6ijDL5lMTByO8hA==
X-Google-Smtp-Source: ACHHUZ5jrcPyi1Sklbq+EVgE6AzuXgiM/acWnd8fwfuhTH5xW6E3kNQ1fnoEjsH+AEPeI1ou78pHOA==
X-Received: by 2002:ac2:5dc4:0:b0:4ef:6ed9:7af2 with SMTP id x4-20020ac25dc4000000b004ef6ed97af2mr7847544lfq.8.1684241968852;
        Tue, 16 May 2023 05:59:28 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c9-20020ac244a9000000b004f387d97dafsm360065lfm.147.2023.05.16.05.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 05:59:28 -0700 (PDT)
Message-ID: <19853086-3486-54e9-7926-e6eb9fc0d243@linaro.org>
Date:   Tue, 16 May 2023 15:59:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 0/8] drm/i915: move DSC RC tables to drm_dsc_helper.c
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Suraj Kandpal <suraj.kandpal@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20230504153511.4007320-1-dmitry.baryshkov@linaro.org>
 <871qjij6vx.fsf@intel.com>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <871qjij6vx.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/05/2023 12:12, Jani Nikula wrote:
> On Thu, 04 May 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>> Other platforms (msm) will benefit from sharing the DSC config setup
>> functions. This series moves parts of static DSC config data from the
>> i915 driver to the common helpers to be used by other drivers.
>>
>> Note: the RC parameters were cross-checked against config files found in
>> DSC model 2021062, 20161212 (and 20150914). The first patch modifies
>> tables according to those config files, while preserving parameter
>> values using the code. I have not changed one of the values in the
>> pre-SCR config file as it clearly looks like a typo in the config file,
>> considering the table E in DSC 1.1 and in the DSC 1.1 SCR.
> 
> As I believe I've said before, I think it's fine to merge these either
> via drm-intel or drm-misc. Which do you prefer?

No strong preference. Maybe drm-misc would be easier for us to 
back-merge it into msm/next. Otherwise it is up to you.

> 
> BR,
> Jani.
> 
> 
> 
>>
>> Chances since v4:
>> - Rebased on top of drm-intel-next
>> - Cut the first 8 patches of the series to ease merging. The rest of the
>>    patches will go afterwards.
>>
>> Chances since v3:
>> - Rebased on top of drm-intel-next
>> - Dropped the msm patch to make patchset fully mergeable through
>>    drm-intel
>> - Made drm_dsc_set_const_params() ignore rc_model_size, picked up
>>    drm_dsc_set_initial_scale_value() patch by Jessica and switched
>>    intel_vdsc.c to use those two helpers.
>> - Added a patch to make i915 actually use rc_tgt_offset_high,
>>    rc_tgt_offset_low and rc_edge_factor from struct drm_dsc_config.
>>
>> Chances since v2:
>> - Rebased on top of drm-intel-next
>>
>> Chances since v1:
>> - Made drm_dsc_rc_buf_thresh static rather than exporting it
>> - Switched drm_dsc_rc_buf_thresh loop to use ARRAY_SIZE. Added
>>    BUILD_BUG_ON's to be sure that array sizes are correct
>> - Fixed rc_parameters_data indentation to be logical and tidy
>> - Fixed drm_dsc_setup_rc_params() kerneldoc
>> - Added a clause to drm_dsc_setup_rc_params() to verify bpp and bpc
>>    being set.
>> - Fixed range_bpg_offset programming in calculate_rc_params()
>> - Fixed bpp vs bpc bug in intel_dsc_compute_params()
>> - Added FIXME comment next to the customizations in
>>    intel_dsc_compute_params().
>>
>> Dmitry Baryshkov (8):
>>    drm/i915/dsc: change DSC param tables to follow the DSC model
>>    drm/i915/dsc: move rc_buf_thresh values to common helper
>>    drm/i915/dsc: move DSC tables to DRM DSC helper
>>    drm/i915/dsc: stop using interim structure for calculated params
>>    drm/display/dsc: use flat array for rc_parameters lookup
>>    drm/display/dsc: split DSC 1.2 and DSC 1.1 (pre-SCR) parameters
>>    drm/display/dsc: include the rest of pre-SCR parameters
>>    drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC parameters
>>
>>   drivers/gpu/drm/display/drm_dsc_helper.c  | 986 ++++++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_vdsc.c | 443 ++--------
>>   include/drm/display/drm_dsc_helper.h      |   9 +
>>   3 files changed, 1042 insertions(+), 396 deletions(-)
> 

-- 
With best wishes
Dmitry

