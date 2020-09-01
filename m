Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 894CD25A120
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 00:05:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728326AbgIAWFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 18:05:37 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:19736 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727902AbgIAWFg (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 18:05:36 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598997936; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wiXrUylPLCtiV8vifkgAKV6u9w2mjnJrdCUbvJNOimQ=;
 b=TrtAchjventa6w0kf0DQQNbysspulmEQKFB7/I9EAJqwnHzSlWfGXi9gc8liSfOKkVu9Qfxg
 /7aBGBlR9oEofrQ93gHtV00LMCft4fxbUM3DnnRtHaskGAc94wKfWTZYOFicpLieyMhkcKXd
 oGI/dAdGDOoPu+8/kx1d3+m1jbE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f4ec5af54e87432be5a6b50 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Sep 2020 22:05:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DF6B9C43387; Tue,  1 Sep 2020 22:05:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1F9E5C433C6;
        Tue,  1 Sep 2020 22:05:34 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 01 Sep 2020 15:05:34 -0700
From:   abhinavk@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sean Paul <seanpaul@chromium.org>,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm: Avoid div-by-zero in dpu_crtc_atomic_check()
In-Reply-To: <20200901215942.2559119-2-swboyd@chromium.org>
References: <20200901215942.2559119-1-swboyd@chromium.org>
 <20200901215942.2559119-2-swboyd@chromium.org>
Message-ID: <cfa79004980a6bd72466132dc77f99db@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-09-01 14:59, Stephen Boyd wrote:
> The cstate->num_mixers member is only set to a non-zero value once
> dpu_encoder_virt_mode_set() is called, but the atomic check function 
> can
> be called by userspace before that. Let's avoid the div-by-zero here 
> and
> inside _dpu_crtc_setup_lm_bounds() by skipping this part of the atomic
> check if dpu_encoder_virt_mode_set() hasn't been called yet. This fixes
> an UBSAN warning:
> 
>  UBSAN: Undefined behaviour in 
> drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:860:31
>  division by zero
>  CPU: 7 PID: 409 Comm: frecon Tainted: G S                5.4.31 #128
>  Hardware name: Google Trogdor (rev0) (DT)
>  Call trace:
>   dump_backtrace+0x0/0x14c
>   show_stack+0x20/0x2c
>   dump_stack+0xa0/0xd8
>   __ubsan_handle_divrem_overflow+0xec/0x110
>   dpu_crtc_atomic_check+0x97c/0x9d4
>   drm_atomic_helper_check_planes+0x160/0x1c8
>   drm_atomic_helper_check+0x54/0xbc
>   drm_atomic_check_only+0x6a8/0x880
>   drm_atomic_commit+0x20/0x5c
>   drm_atomic_helper_set_config+0x98/0xa0
>   drm_mode_setcrtc+0x308/0x5dc
>   drm_ioctl_kernel+0x9c/0x114
>   drm_ioctl+0x2ac/0x4b0
>   drm_compat_ioctl+0xe8/0x13c
>   __arm64_compat_sys_ioctl+0x184/0x324
>   el0_svc_common+0xa4/0x154
>   el0_svc_compat_handler+0x
> 
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Cc: Sean Paul <seanpaul@chromium.org>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index f272a8d0f95b..74294b5ed93f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -881,7 +881,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc 
> *crtc,
>  	struct drm_plane *plane;
>  	struct drm_display_mode *mode;
> 
> -	int cnt = 0, rc = 0, mixer_width, i, z_pos;
> +	int cnt = 0, rc = 0, mixer_width = 0, i, z_pos;
> 
>  	struct dpu_multirect_plane_states multirect_plane[DPU_STAGE_MAX * 2];
>  	int multirect_count = 0;
> @@ -914,9 +914,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc 
> *crtc,
> 
>  	memset(pipe_staged, 0, sizeof(pipe_staged));
> 
> -	mixer_width = mode->hdisplay / cstate->num_mixers;
> +	if (cstate->num_mixers) {
> +		mixer_width = mode->hdisplay / cstate->num_mixers;
> 
> -	_dpu_crtc_setup_lm_bounds(crtc, state);
> +		_dpu_crtc_setup_lm_bounds(crtc, state);
> +	}
> 
>  	crtc_rect.x2 = mode->hdisplay;
>  	crtc_rect.y2 = mode->vdisplay;
