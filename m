Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B765E363886
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Apr 2021 01:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232288AbhDRXd5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 18 Apr 2021 19:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231489AbhDRXd5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 18 Apr 2021 19:33:57 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E0BCC06174A
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Apr 2021 16:33:28 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id f17so46102857lfu.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 18 Apr 2021 16:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p6q88clXaYisBITv7dBsQt4ObT4JagOd+ktijqQaoMw=;
        b=T6Ny5ulI/3/RUwM8ZpQRpM4B04E+Vije3L5ujtaf5FpW2lViqohogoGrw/5bQoVlDS
         75QpVhK+FCChKyg9/iLcwKUcl8SmKsRHr1QEj23LUl/jPim54WTe4VYkJsjCxbZB5OLU
         5z5KIlHil7RVhK4UxC+Wg2DOEZbC9vpzrJXjNr4kGmnmJEPju0ax6Q9VDSJpvx1V3p+M
         Buufd0OhoCjzMffvXkH8tNpzSpOOkLJlBIg9zJqq5+q9Iulcz4uTGVZnD2tzcoKw7rcO
         H2kKimCyX8780XrBpc22udb4WLK/7HHRZQh8S82nQiGGlKvT3FirReh/Dc64LnFm3VBQ
         JJ9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p6q88clXaYisBITv7dBsQt4ObT4JagOd+ktijqQaoMw=;
        b=HAw0Ie3C9ERgOIu4ZRgpMhOzYJZVI87R86zSgSw+1tyZRgQF3AdMpSPT38mSF+KUdN
         xTfe/oL7iubVH825zVy27Lh0Gervf1a1KUgXS31vl/N1oBL3jL/nYmjphbQ1OtSvb2Hv
         CwFZroPzdSMA4x2NK4164xK+hu8roEH0h526A4j/Q622h2gHUZ7dTZuZkvxglp7U/I3Z
         DCABo9VU5BvJptYBVFQDR/DOeSlAP4uFHv63ECGVN6Gr0VVS3FADazVjfyqWJF1/NklO
         l/3Zt+by/0suGi6skwypE0aJXYN/SB8xQ79p0yW2E4KWvCFne0HrVDk5YLM6YbEbFSpQ
         S1Ag==
X-Gm-Message-State: AOAM533mLAtw8AHQAlYkTlAzaVkwnEu64j+tMcnMCds4idUoTwa6+6NE
        oepRR+PEmjQS/NLzRyIr5j6TpwqOZAKXWg==
X-Google-Smtp-Source: ABdhPJzrdwws1BxUqmCVK33yMgIRYUwSnNyWcB+DNPNdVrfLr/ggYzcljKi5sAbrRczeb3QhcGU5Mg==
X-Received: by 2002:ac2:5cab:: with SMTP id e11mr10405726lfq.175.1618788805339;
        Sun, 18 Apr 2021 16:33:25 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 15sm1676389ljv.20.2021.04.18.16.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Apr 2021 16:33:24 -0700 (PDT)
Subject: Re: [PATCH v5 0/7] Add devcoredump support for DPU
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, daniel@ffwll.ch
References: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <71855992-47bf-e444-3ff6-2d97edb494f8@linaro.org>
Date:   Mon, 19 Apr 2021 02:33:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1618606645-19695-1-git-send-email-abhinavk@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/04/2021 23:57, Abhinav Kumar wrote:
> This series adds support to use devcoredump for DPU driver. It introduces
> the msm_disp_snapshot module which assists in the capturing of register dumps during
> error scenarios. When a display related error happens, the msm_disp_snapshot module
> captures all the relevant register dumps along with the snapshot of the drm
> atomic state and triggers a devcoredump.
> 
> changes in v5:
>   - move the storage of disp_state from dpu_kms to msm_kms
>   - absorb snprintf into the snapshot core by accepting var args
>   - initialize disp snapshot module even for non-DPU targets
>   - split up the patches into dpu, dsi and dp pieces for easier review
>   - get rid of MSM_DISP_SNAPSHOT_IN_* macros by simplifying function
> 
> 
> Abhinav Kumar (7):
>    drm: allow drm_atomic_print_state() to accept any drm_printer
>    drm/msm: add support to take dpu snapshot
>    drm/msm/dsi: add API to take DSI register snapshot
>    drm/msm/dp: add API to take DP register snapshot
>    drm/msm/disp/dpu1: add API to take DPU register snapshot
>    drm/msm: add support to take dsi, dp and dpu snapshot
>    drm/msm: add disp snapshot points across dpu driver

All patches:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you!

> 
>   drivers/gpu/drm/drm_atomic.c                       |  28 ++-
>   drivers/gpu/drm/drm_atomic_uapi.c                  |   4 +-
>   drivers/gpu/drm/drm_crtc_internal.h                |   4 +-
>   drivers/gpu/drm/msm/Makefile                       |   2 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  16 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  14 +-
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  50 ++++++
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot.c       | 161 +++++++++++++++++
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot.h       | 154 ++++++++++++++++
>   drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  | 195 +++++++++++++++++++++
>   drivers/gpu/drm/msm/dp/dp_catalog.c                |   9 +
>   drivers/gpu/drm/msm/dp/dp_catalog.h                |   4 +
>   drivers/gpu/drm/msm/dp/dp_display.c                |  29 +++
>   drivers/gpu/drm/msm/dp/dp_display.h                |   1 +
>   drivers/gpu/drm/msm/dsi/dsi.c                      |   5 +
>   drivers/gpu/drm/msm/dsi/dsi.h                      |   5 +-
>   drivers/gpu/drm/msm/dsi/dsi_host.c                 |  16 ++
>   drivers/gpu/drm/msm/msm_drv.c                      |  27 ++-
>   drivers/gpu/drm/msm/msm_drv.h                      |   2 +
>   drivers/gpu/drm/msm/msm_kms.h                      |   7 +
>   drivers/gpu/drm/selftests/test-drm_framebuffer.c   |   1 +
>   23 files changed, 725 insertions(+), 19 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
>   create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
>   create mode 100644 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> 


-- 
With best wishes
Dmitry
