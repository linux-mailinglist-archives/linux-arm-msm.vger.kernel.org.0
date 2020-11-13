Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 683182B24C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 20:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726162AbgKMTmm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 14:42:42 -0500
Received: from z5.mailgun.us ([104.130.96.5]:51578 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726239AbgKMTml (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 14:42:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605296560; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wMOoKM+IAAOuxYQjJIwgkzyOd2gA5G5ffuKMZt+F2ko=;
 b=S6Q1fjwcv0evZ/5DltqfU0Y9lq3mdJ1aKQTa4COhCoHXPQAg73fPnuvTDhfR6i000VkKqkjb
 HA0UbHBht9SmpydLHMgrGy0UAGsSlGIs+uVtGxPXReNtnDVWmm4HQ4XLGeNYfIy9iw/XL6qI
 Bdxt+RS2cSxxNEpusY4gUQH7n6U=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5faee1998e090a8886553c61 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 13 Nov 2020 19:42:17
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E3576C43385; Fri, 13 Nov 2020 19:42:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A4488C433C6;
        Fri, 13 Nov 2020 19:42:15 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Fri, 13 Nov 2020 11:42:15 -0800
From:   abhinavk@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 38/40] drm/msm/disp/dpu1/dpu_core_perf: Remove
 set but unused variable 'dpu_cstate'
In-Reply-To: <20201113134938.4004947-39-lee.jones@linaro.org>
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-39-lee.jones@linaro.org>
Message-ID: <7922eb5036c43bdae7f15e7a73fbfe62@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-13 05:49, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c: In function
> ‘_dpu_core_perf_calc_crtc’:
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:113:25: warning:
> variable ‘dpu_cstate’ set but not used [-Wunused-but-set-variable]
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Kalyan Thota <kalyan_t@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 37c8270681c23..36927fc04a388 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -110,14 +110,11 @@ static void _dpu_core_perf_calc_crtc(struct 
> dpu_kms *kms,
>  		struct drm_crtc_state *state,
>  		struct dpu_core_perf_params *perf)
>  {
> -	struct dpu_crtc_state *dpu_cstate;
> -
>  	if (!kms || !kms->catalog || !crtc || !state || !perf) {
>  		DPU_ERROR("invalid parameters\n");
>  		return;
>  	}
> 
> -	dpu_cstate = to_dpu_crtc_state(state);
>  	memset(perf, 0, sizeof(struct dpu_core_perf_params));
> 
>  	if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
