Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C7B86AE0B2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 14:37:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbjCGNh0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 08:37:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbjCGNhZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 08:37:25 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 266C67303C
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 05:37:24 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id s20so17061441lfb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 05:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678196242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=att8u7Sg5USMKd1JWAj5fcOvxLzquAm+yctu+vJJGmk=;
        b=u8jio6M4Bi1IlrmYfdfyYX69Nv3uGK3nF/sCLrFA5zvGkRs88KOrLJBo0V8kh4rDRv
         S+CN3pvqUd8eH23svbBD1gPKdL+QB1E5CmWcRgoFDW0u987cl+zWzZLOIElUBd+RplDy
         MH6AlJIB2OdsQYFFHNiRTM0T2DBO9XY0uoJm2f8WGDI0nxIytNy74fHndvMBAJwscsvI
         iQTXf4wLm88WgzzcLw/F8/qcKKDgyPRtS/syh+tfGLi4Ppe9ZlyvhQYlfr8+d84U4g0x
         yvF9pHL9CK4sM2O9udVjdMxdu2xlZ0JU4BlGVmoeRJMDAN6o0FQnnYqyF/cyRbmWQ1X9
         +Qjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678196242;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=att8u7Sg5USMKd1JWAj5fcOvxLzquAm+yctu+vJJGmk=;
        b=0wCIZsT8FPvksxwSQQ+Thmeu7HhNATA3ICgGfB/g1IVrYJEDdu5It13MsP+ROBRNAH
         PQkjfYQ/o3PU+lgSjRhLz3Id0eciY4mVWZpntN4Kdd50L58aRsVy6NuwFFqLfgTFSYDO
         bD84kKWTAUwJ1tASJQdBKyN+8xzxc4Ovv/sznLdu1oxrb2JsglCkjEERIIipa5eLpsZz
         riksos+Ojbopc/qseASMhBBuur8AiYBbGzSFkPALMvNzXxadmZO36kRqCwPWr4TZF652
         5oP6oUw50NqzD+/hkOEE/da8iOB9njPHcFm8aYmd1wBmb62kRbiRXZcXpImCLYmlV52Q
         gHfA==
X-Gm-Message-State: AO0yUKUWRg+HeK54IWdVEa/h27aAgfdFhSDXUdmHF5M/i8XmZDRa1Nqj
        BS3goVnXiynP0Vpd1p8isZoEDw==
X-Google-Smtp-Source: AK7set/iUKVW9nOe4bWML5c3IaCFN7RLZmIEWrMcDr+hW+xy2LV1qA52wUvkDgDJASXLtisA+EjlGQ==
X-Received: by 2002:ac2:59dc:0:b0:4d8:537a:753f with SMTP id x28-20020ac259dc000000b004d8537a753fmr4746540lfn.6.1678196242448;
        Tue, 07 Mar 2023 05:37:22 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id f16-20020a2eb5b0000000b00294692d8645sm2193108ljn.17.2023.03.07.05.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 05:37:22 -0800 (PST)
Message-ID: <3f7a065b-fa41-36ee-2055-617979435be2@linaro.org>
Date:   Tue, 7 Mar 2023 15:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 07/10] drm/display/dsc: include the rest of pre-SCR
 parameters
Content-Language: en-GB
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
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
References: <20230228113342.2051425-1-dmitry.baryshkov@linaro.org>
 <20230228113342.2051425-8-dmitry.baryshkov@linaro.org>
 <87pm9tycn5.fsf@intel.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <87pm9tycn5.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/02/2023 18:31, Jani Nikula wrote:
> On Tue, 28 Feb 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>> DSC model contains pre-SCR RC parameters for other bpp/bpc combinations,
>> include them here for completeness.
> 
> Need to run now, note to self:
> 
> Does i915 use the arrays to limit the bpp/bpc combos supported by
> hardware? Do we need to add separate limiting in i915.

There is already a limitation in intel_dsc_compute_params(): the driver 
uses DRM_DSC_1_1_PRE_SCR only in a limited amount of cases (bpp 8 or 12, 
bpc 8, 10 or 12). But thanks, I noticed a bug there.

> 
> BR,
> Jani.
> 
-- 
With best wishes
Dmitry

