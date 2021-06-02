Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B62C6399595
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 23:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhFBVs2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 17:48:28 -0400
Received: from mail-lf1-f42.google.com ([209.85.167.42]:33540 "EHLO
        mail-lf1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhFBVs1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 17:48:27 -0400
Received: by mail-lf1-f42.google.com with SMTP id a5so5657294lfm.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jun 2021 14:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7sNxat3i9/RN2yykF6irefH0yK7Y1BVv/cXFGY3PCQ8=;
        b=gYX6BAVAoigjrGq4AHuBLFG+Ap19bznrpH06DcwQhRwrJBBkgUMuXX1w5XHhSw2YOg
         LuqytIGNmUaCWMbVWwOJ/vVGWk3OvFfaUtw7y5GMsm0CUUMB60UUBUo4qQLZv2m3k0jn
         nzlFjimGVmJWwhHMseLNRYBWZQiOP8glwmjUZkpvjOhjC95dArdz9kfndDfkOkPPHTP0
         jkF9AdtNuu5ZH1zKg+9JyWbr4n/0bYL2qmY2X+W96yZ8SGSeSJKEsNMGgP3BqdeIFi9N
         Cxh/rV36CmCv2C4xP8YXO+yjeYrF0gOFE5YOkNZhiKM+wkiZGLXloSIWAKqITk3SRq2E
         aCuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7sNxat3i9/RN2yykF6irefH0yK7Y1BVv/cXFGY3PCQ8=;
        b=IuXq8g5eGOMGjrP/6X0n2fQ83tcYydEOCFoGFzz7rhLU8J+ae7+H3pL4dxSZIkxE3Z
         z/F5axN0CT6XFinz65Mfs/gi3Z2tgstWyato0uiij6fa4w43h03byxsjfedOJk6XnLHX
         oZZSNmURD5XQrK+TNQbAsPK7xSuwc0pQYKProagpnCzVaJYdRbXhLaFVF4Cl10jh95Wc
         DiEOep9qMYh7UAgjqgt7bKov5st/g1VggUiAwNtUyCTQ+0S1aIbfqULTFIp3iIurkJrX
         hxGGJwGL8in2lqkDAUw4BCEyjtLjD7ljqW6LexDgT2eppfcJRGbW89Ve4+r5VfTOCUHY
         jspg==
X-Gm-Message-State: AOAM531VH9XjNDEM1gf+U6yCBwl/9TEqsdHCRE5sFsY84s9ohNnEpw/q
        bnE0nLy76tfcrc679jUELbdVhQ==
X-Google-Smtp-Source: ABdhPJyLab5zzBNyzPzXm77Co4XUVWe+ObknhW7ybl82GSpdoxVmftuwnJLvpsRiaVkEX81lTkNUAA==
X-Received: by 2002:ac2:4f8b:: with SMTP id z11mr23206848lfs.482.1622670343227;
        Wed, 02 Jun 2021 14:45:43 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m19sm108033lfb.121.2021.06.02.14.45.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jun 2021 14:45:42 -0700 (PDT)
Subject: Re:
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
Message-ID: <52307126-b252-f6d1-3a38-a6a262b2fed2@linaro.org>
Date:   Thu, 3 Jun 2021 00:45:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/05/2021 01:57, Dmitry Baryshkov wrote:
>  From Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # This line is ignored.
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reply-To:
> Subject: [PATCH v2 0/6] drm/msm/dpu: simplify RM code
> In-Reply-To:
> 
> There is no need to request most of hardware blocks through the resource
> manager (RM), since typically there is 1:1 or N:1 relationship between
> corresponding blocks. Each LM is tied to the single PP. Each MERGE_3D
> can be used by the specified pair of PPs.  Each DSPP is also tied to
> single LM. So instead of allocating them through the RM, get them via
> static configuration.
> 
> Depends on: https://lore.kernel.org/linux-arm-msm/20210515190909.1809050-1-dmitry.baryshkov@linaro.org
> 
> Changes since v1:
>   - Split into separate patch series to ease review.

Another gracious ping, now for this series.

I want to send next version with minor changes, but I'd like to hear 
your overall opinion before doing that.

> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (6):
>        drm/msm/dpu: get DSPP blocks directly rather than through RM
>        drm/msm/dpu: get MERGE_3D blocks directly rather than through RM
>        drm/msm/dpu: get PINGPONG blocks directly rather than through RM
>        drm/msm/dpu: get INTF blocks directly rather than through RM
>        drm/msm/dpu: drop unused lm_max_width from RM
>        drm/msm/dpu: simplify peer LM handling
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  54 +---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   8 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   5 -
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   8 -
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  14 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   7 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   7 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  53 +++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   5 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 310 ++-------------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  18 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   9 +-
>   16 files changed, 115 insertions(+), 401 deletions(-)
> 
> 


-- 
With best wishes
Dmitry
