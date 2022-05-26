Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1917534EA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 May 2022 13:52:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237347AbiEZLwv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 May 2022 07:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243077AbiEZLwt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 May 2022 07:52:49 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E596CD0296
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 04:52:47 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id u7so1472794ljd.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 May 2022 04:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=MVQ54/b1Bl5zWRXm8QvTFiSCRNNAIcNHd+D1lpI9ZC4=;
        b=UmO31J8nUxjp24jXb9Co3KN+CJRVqgMArHtMvcSuJO9jKWXYfcw9VbrPq5AxzeSKve
         XwfqJ/YWWzlM15YQ7L2Ar4pTSJS8dStrVzFwMFmeJMwAmPVRdVZIWB7lXBbtMiRV/L8u
         29u8sVAXQFS16oufZNyiAaly3L2FSIJ1ztnAN8iBfmvpauGpqCbbqKEzm/2gYtzrNU6T
         8zgAjq7HS3lwy70SilPNTgXtbtFb/g0QQ3CWw0wjAWNdSVwWw05wn4fSVjMrCMyN+SZ/
         /WUfUezYDuuF7PU0JAQylw8BVe3pxpyp/5CEh9LrIjr7sHcFRJTrpqgKZsPsaeHdQa4h
         dxNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MVQ54/b1Bl5zWRXm8QvTFiSCRNNAIcNHd+D1lpI9ZC4=;
        b=ogt6+X22Y+ToV4RrY7hV3b9ndbi5c0oR0GIrxSzhnV5Gq/hwiGRRyFvQP76KQRlg7q
         M6ZoJrEFfSGL8AZ7ZCweGxERSHMobTCCAU1cmnbx2iS5K5ts+xGk6PLSc5nR4BoOm8KM
         uo8pJFyhKX0qU4AqaODAUYfd5H2C3dEmGzjN6ABG9LZoEqMzLhc396f3d9L/WCgndIrC
         FNANbz1Aa+UUQ++wfbkmH9Vs3nah3SwYEpzfiQXWd1YXNjzZqU7TpvQWpcdljFaKKp2j
         ZYts8y6yf4+hnv2bQenmyKCcqas0YV/Npv30FiPsu9wlA96GMRFKK1F75P+xVdda+zTF
         gUdg==
X-Gm-Message-State: AOAM530ri6vHtvZ3+BWeXxgVXxZpxVY+qKVrA4FvpX1cLN5sQqwHStQ3
        RBpe8lgGCI2JW1RJVrAic7TEsA==
X-Google-Smtp-Source: ABdhPJztaBE9q35bXW9bdbc3Uh0AoR+2BUwqLHJO3rjZrvvCaUtOnyrtI6FYp/7+up8Ee6UQVdXDxQ==
X-Received: by 2002:a2e:a60a:0:b0:253:dbf2:cf with SMTP id v10-20020a2ea60a000000b00253dbf200cfmr18285606ljp.498.1653565966201;
        Thu, 26 May 2022 04:52:46 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t4-20020a199104000000b0047255d211c8sm308410lfd.247.2022.05.26.04.52.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 04:52:45 -0700 (PDT)
Message-ID: <fbbb223b-c0cd-6cd9-ca1f-1c1ebaa5f6ce@linaro.org>
Date:   Thu, 26 May 2022 14:52:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [GIT PULL] drm/msm: drm-msm-fixes-2022-05-19
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>
References: <b011d51d-d634-123e-bf5f-27219ee33151@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <b011d51d-d634-123e-bf5f-27219ee33151@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/05/2022 19:21, Abhinav Kumar wrote:
> Hi Rob
> 
> Here is the pull request for the fixes for 5.19.
> 
> Just a few more changes on top of msm-fixes-staging.
> 
> Mainly it has the foll fixes:
> 
> - Limiting WB modes to max sspp linewidth
> - Fixing the supported rotations to add 180 back for IGT
> - Fix to handle pm_runtime_get_sync() errors to avoid unclocked access
>    in the bind() path for dpu driver
> - Fix the irq_free() without request issue which was a big-time
>    hitter in the CI-runs.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Thanks
> 
> Abhinav
> 
> 
> 
> The following changes since commit 
> 947a844bb3ebff0f4736d244d792ce129f6700d7:
> 
>    drm: msm: fix possible memory leak in mdp5_crtc_cursor_set() 
> (2022-05-18 11:05:21 -0700)
> 
> are available in the git repository at:
> 
>    https://gitlab.freedesktop.org/abhinavk/msm.git/ 
> tags/msm-next-5.19-fixes
> 
> for you to fetch changes up to 64b22a0da12adb571c01edd671ee43634ebd7e41:
> 
>    drm/msm/dpu: handle pm_runtime_get_sync() errors in bind path 
> (2022-05-18 18:32:03 -0700)
> 
> ----------------------------------------------------------------
> 5.19 fixes for msm-next
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> ----------------------------------------------------------------
> Abhinav Kumar (3):
>        drm/msm/dpu: limit writeback modes according to max_linewidth
>        drm/msm/dpu: add DRM_MODE_ROTATE_180 back to supported rotations
>        drm/msm/dpu: handle pm_runtime_get_sync() errors in bind path
> 
> Dmitry Baryshkov (1):
>        drm/msm: don't free the IRQ if it was not requested
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 4 +++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 4 +++-
>   drivers/gpu/drm/msm/msm_drv.c                 | 7 ++++++-
>   drivers/gpu/drm/msm/msm_kms.h                 | 1 +
>   5 files changed, 14 insertions(+), 4 deletions(-)


-- 
With best wishes
Dmitry
