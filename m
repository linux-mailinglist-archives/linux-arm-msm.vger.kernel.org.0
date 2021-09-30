Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21CEB41D159
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 04:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347487AbhI3CU5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Sep 2021 22:20:57 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39896 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232383AbhI3CU5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Sep 2021 22:20:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632968355; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+7oKjBSrX1u3jxx0QQvh+jT5dPbbCieWUQ1+GE9nPt0=;
 b=svuQfFmTOaWciHhXn3FXEeQ0hpeFJW7EMimJN7GSU/86tOF5KvvetBMjPNZlTiLqiTZx8m6G
 cwd1yOArGwsRuO2/aQC9CvIAZIcDbeiMxSpoHLkrBc18FDkps2OoP+dAw3TPDYPgdyx1SoO0
 LVZ5SVDMLHolyEgyMoc3mbVxkpY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 61551e9ca3e8d3c640b423c3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 30 Sep 2021 02:19:08
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8286FC43460; Thu, 30 Sep 2021 02:19:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A0B1EC4338F;
        Thu, 30 Sep 2021 02:19:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 29 Sep 2021 19:19:05 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 00/22] drm/msm/dpu: switch dpu_plane to be
 virtual
In-Reply-To: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
References: <20210705012115.4179824-1-dmitry.baryshkov@linaro.org>
Message-ID: <c7caa55f5244ba4b7341a1b912835d91@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry

On 2021-07-04 18:20, Dmitry Baryshkov wrote:
> As discussed on IRC, change dpu_plane implementation to be virtual:
> register unified planes and select backing SSPP block at runtime.
> 
> Use msm.dpu_use_virtual_planes=1 to enable usage of virtual planes
> rather than statically allocated SSPPs at the plane registration.
> 
> Patches 1-9 move state variables from struct dpu_plane onto the stack
> allocation. State should not be a part of struct dpu_plane anyway.
> 
> Patches 10-18 make additional changes to plane code, reworking check,
> debugfs, dropping old multirec support, which results in patch 19 
> adding
> support for virtual planes per se.
> 
> Patches 20-22 demonstrate my main goal behind reworking dpu_plane
> support. They change dpu_plane to automatically use one of SSPP block
> features - multirec, an ability to display two unscaled RGB rectangles
> using single SSPP block. This allows us to double the amount of created
> planes. If the user tries to enable more planes than actually supported
> by the underlying SSPP blocks, atomic_check code would return an error.
> 
> As you can see, this patchset is not atomic, so different patches can 
> go
> separately.

I am half way through this series and have finished checking patches 
1-12
I am okay with patches 1-4, 6-12. Its a reasonable cleanup to make the 
dpu_plane struct lighter.
I need a little more time with the rest as I am comparing the downstream 
solution against yours.

As you mentioned, this patchset is not atomic, hence can you break it up 
like
-> cleanup of dpu_plane struct in one series
-> removal of current multirect and current src split which will include 
patch 5 as well

So that the first series can go through and it gives us a little more 
time to check the second
series.

Thanks

Abhinav

> 
> Changes since v1:
>  - Add multirec implementation
>  - Added msm.dpu_use_virtual_planes kernel parameter instead of using
>    compile time switch
>  - Changed code to always reallocate SSPPs in the CRTC atomic check to
>    let the kernel pick up the best multirec config. This can be
>    optimized later.
>  - Rework RM SSPP API to always receive plane id
>  - Removed scaler_cfg, pixel_ext and cdp_cfg from struct 
> dpu_plane_state
>  - Made _dpu_scaler_setup() call sspp's setup_scaler and setup_pe
>  - Removed dpu_csc_cfg from dpu_plane
> 
> The following changes since commit 
> e88bbc91849b2bf57683119c339e52916d34433f:
> 
>   Revert "drm/msm/mdp5: provide dynamic bandwidth management"
> (2021-06-23 14:06:20 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.linaro.org/people/dmitry.baryshkov/kernel.git 
> dpu-multirec-2
> 
> for you to fetch changes up to 
> 19f6afd40097d4c826e56b8f4a8cbd807f7b61f6:
> 
>   drm/msm/dpu: add multirect support (2021-07-05 04:04:50 +0300)
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (22):
>       drm/msm/dpu: move LUT levels out of QOS config
>       drm/msm/dpu: remove pipe_qos_cfg from struct dpu_plane
>       drm/msm/dpu: drop pipe_name from struct dpu_plane
>       drm/msm/dpu: remove stage_cfg from struct dpu_crtc
>       drm/msm/dpu: rip out master planes support
>       drm/msm/dpu: move dpu_hw_pipe_cfg out of struct dpu_plane
>       drm/msm/dpu: drop scaler config from plane state
>       drm/msm/dpu: drop dpu_csc_cfg from dpu_plane
>       drm/msm/dpu: remove dpu_hw_pipe_cdp_cfg from dpu_plane
>       drm/msm/dpu: don't cache pipe->cap->features in dpu_plane
>       drm/msm/dpu: don't cache pipe->cap->sblk in dpu_plane
>       drm/msm/dpu: rip out debugfs support from dpu_plane
>       drm/msm/dpu: drop src_split and multirect check from 
> dpu_crtc_atomic_check
>       drm/msm/dpu: add list of supported formats to the DPU caps
>       drm/msm/dpu: simplify DPU_SSPP features checks
>       drm/msm/dpu: do not limit the zpos property
>       drm/msm/dpu: add support for SSPP allocation to RM
>       drm/msm/dpu: move pipe_hw to dpu_plane_state
>       drm/msm/dpu: add support for virtualized planes
>       drm/msm/dpu: fix smart dma support
>       drm/msm/dpu: fix CDP setup to account for multirect index
>       drm/msm/dpu: add multirect support
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 261 +++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h       |   2 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  20 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  20 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    |  41 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    |  52 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c    |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h    |   2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 234 ++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |  70 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 851 
> +++++++++++--------------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |  75 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  81 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h         |   6 +
>  14 files changed, 793 insertions(+), 924 deletions(-)
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
