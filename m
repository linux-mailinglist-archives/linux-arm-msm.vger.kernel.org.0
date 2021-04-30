Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D67E53703E9
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 May 2021 01:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232269AbhD3XHz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Apr 2021 19:07:55 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:45715 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbhD3XHy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Apr 2021 19:07:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619824026; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=V+oj2FdgO738BZ62IBogKd0JpzcCrCkPU4H+tDaGYLE=;
 b=suFKIvyeJBoCzvR6y3xsuajYkU6VZ085yFxzY1C6v5BA61L85iT1Zd7VjCaQzuf8ctdEzxTN
 exO9CE/3L9fQ+29MU0ZWidzR3v583dzmZL9tuLLw0I4mqyVvJXi7PRyZJZi1vo+sdZC3RvLq
 r8qywMIPWejn4+8Ci4rkYs0Mbq4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 608c8d9974f773a664283772 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Apr 2021 23:07:05
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 02233C4338A; Fri, 30 Apr 2021 23:07:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F3F79C433F1;
        Fri, 30 Apr 2021 23:07:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 30 Apr 2021 16:07:02 -0700
From:   abhinavk@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 0/6] drm/msm: Trim down drm debugging logs
In-Reply-To: <20210430193104.1770538-1-swboyd@chromium.org>
References: <20210430193104.1770538-1-swboyd@chromium.org>
Message-ID: <b11b19848701cd11cba5ee0d8befeeb8@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-30 12:30, Stephen Boyd wrote:
> This patch series attempts to trim down the drm logging in the msm
> driver to make it useable with DRM_UT_DRIVER, DRM_UT_KMS, and DRM_UT_DP
> levels enabled. Right now the log is really spammy and prints multiple
> lines for what feels like every frame. I moved those prints off to
> other DRM_UT_* levels that felt appropriate. Please review.
> 
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: aravindh@codeaurora.org
> Cc: Sean Paul <sean@poorly.run>
> 
For the entire series,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

> Stephen Boyd (6):
>   drm/msm: Move vblank debug prints to drm_dbg_vbl()
>   drm/msm: Use VERB() for extra verbose logging
>   drm/msm/dp: Drop malformed debug print
>   drm/msm: Move FB debug prints to drm_dbg_state()
>   drm/msm/disp: Use plane debug print helper
>   drm/msm/disp: Move various debug logs to atomic bucket
> 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  | 16 ++++----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 22 +++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 38 +++++++++----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 10 ++---
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  6 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 19 ++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      | 14 +++----
>  drivers/gpu/drm/msm/dp/dp_panel.c             |  1 -
>  drivers/gpu/drm/msm/msm_drv.c                 |  4 +-
>  drivers/gpu/drm/msm/msm_fb.c                  |  8 ++--
>  12 files changed, 67 insertions(+), 75 deletions(-)
> 
> 
> base-commit: 9f4ad9e425a1d3b6a34617b8ea226d56a119a717
