Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59DF66E85E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 01:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbjDSX0k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Apr 2023 19:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbjDSX0k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Apr 2023 19:26:40 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E51AE4D
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 16:26:39 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a10so820509ljr.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Apr 2023 16:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681946797; x=1684538797;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tdy0bM0xKZr6oyQKfYHhwGkCtciOdDj0SXYRPcGsGuI=;
        b=ubL231BYxGK7HQEPhqowVdfMZ2aCYI5mDsSNuxYThQQHDca/RsvE29k5A6CFpukMk9
         iylwpkQx+cKG9Nwynr9DFrDZ9Vs+vw7CFARgtuZyMvvf1GTvkg0rQjnWlc3n7b5lsZcS
         MRTOw3+ONmnd75DeSm72s4FLHipfJGg9GC1qXULBncYI4A2xsMq1ifuEbc2F7JUnjmV6
         5kbvWwJwEkP3W9AfNYQnpWrmvOHB7pVZ2fJQ6Jl3987/lPbPmK606BkO7PQKb9NLQQ1l
         RsoON+O897BZQSRhryl+NDg7cqkuqh5bPxuZ+dUVUTOQ5juHiVs31mnjF2Xevvlxu8TR
         UCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681946797; x=1684538797;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdy0bM0xKZr6oyQKfYHhwGkCtciOdDj0SXYRPcGsGuI=;
        b=HpHLlG5FjktZ8OZnek9ruErsvbjS+HdX8s3Tl/29HScfTZcaYjR8ZAL/h+1RHWccrt
         3r0GhxkgXXioSIcikO6jG+3NE5N5mu1GlkMRWKcs4RIx71n7RngzF9yKTFy1uHoxP1wl
         g7bp5Vl8HDIDQK+EUm8mTKciXMS3fs/M5+jtcwO58THrfzqOLN64pPFsmYVHLYhGh9Be
         tR3LSk1dcI0Q9V9LpCVEzrJlMG1gRKD5R5UkMhxgHc7a9AnrBokxOklqmjVTqx+fUQRl
         mFZeG6C/K5eVZ9MP0MqnTrQ++jKBho3fy4eR+3BZWp+szI+TpTW4wKdeFprMmjz81OG1
         rVUQ==
X-Gm-Message-State: AAQBX9c5dgIlaHedZwpqYyrtAA0jKDfxeFDVAiqNnZ10fnL0LdW/vgJb
        q4xSJcHHgJQn50bca0huPZ6Jlg==
X-Google-Smtp-Source: AKy350aGF5EuTAPnF4k7kciyLYx05f7n7+qBryOAqx2OuHplJ1PtxA9Km8wRT+Ez0RlLnwoKVw0kWg==
X-Received: by 2002:a2e:9f49:0:b0:298:aad9:e377 with SMTP id v9-20020a2e9f49000000b00298aad9e377mr2290105ljk.14.1681946797482;
        Wed, 19 Apr 2023 16:26:37 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a17-20020a19f811000000b004ec8a7e5362sm41463lff.101.2023.04.19.16.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 16:26:37 -0700 (PDT)
Message-ID: <6ac50d82-c8f0-c0cd-25c4-348f901b88e6@linaro.org>
Date:   Thu, 20 Apr 2023 02:26:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 08/12] drm/display/dsc: add YCbCr 4:2:2 and 4:2:0 RC
 parameters
Content-Language: en-GB
To:     "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
References: <20230403092313.235320-1-dmitry.baryshkov@linaro.org>
 <20230403092313.235320-9-dmitry.baryshkov@linaro.org>
 <SN7PR11MB675048DBEDFE8CD781628198E3989@SN7PR11MB6750.namprd11.prod.outlook.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <SN7PR11MB675048DBEDFE8CD781628198E3989@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/04/2023 20:25, Kandpal, Suraj wrote:
> Hi,
>> Include RC parameters for YCbCr 4:2:2 and 4:2:0 configurations.
>>
> 
> Looks Good to me
> 
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

And gentle reminder for patches 9-12. We would kindly ask to get this 
patches reviewed and ready to be merged into drm-intel after -rc1 or 
-rc2, so that we can backmerge the drm tree into msm-next and enqueue 
msm-specific DSC patches early during the cycle. Thank you for your 
understanding and collaboration.

-- 
With best wishes
Dmitry

