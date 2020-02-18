Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC2A31636E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 00:08:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727470AbgBRXIB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 18:08:01 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:46874 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726820AbgBRXIA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 18:08:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582067280; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=8iLC/MIWsGLNObQpdCKpF6XJIjNHls01CTFBxBKRpuE=; b=wNp++27AGCQEEZvDfC5NrpKMbMfelf4bPpIxXE5GVX9Nsn/MiFvYMzHVLi0jUg/1EWlIpOfb
 +yRUAEEg1PXKUOYhwT2iIqRXvNqvO82y0R6Z77RlobKtqJPdSEgjWdDrhK9hIysQp8l+qnuT
 m04QK5+K4cyIAP12RcZ6NRMqPfY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4c6e49.7fa3aefafab0-smtp-out-n02;
 Tue, 18 Feb 2020 23:07:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 58A04C433A2; Tue, 18 Feb 2020 23:07:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 27CFFC43383;
        Tue, 18 Feb 2020 23:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 27CFFC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 18 Feb 2020 16:07:50 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v2] drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP
 buffers
Message-ID: <20200218230750.GB8715@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Sean Paul <sean@poorly.run>
References: <20200218212012.1067236-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200218212012.1067236-1-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 18, 2020 at 01:20:12PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Also log buffers with the DUMP flag set, to ensure we capture all useful
> cmdstream in crashdump state with modern mesa.
> 
> Otherwise we miss out on the contents of "state object" cmdstream
> buffers.
> 
> v2: add missing 'inline'

I should have checked my inbox before responding to v1.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.h | 10 ++++++++++
>  drivers/gpu/drm/msm/msm_gpu.c | 28 +++++++++++++++++++++++-----
>  drivers/gpu/drm/msm/msm_rd.c  |  8 +-------
>  3 files changed, 34 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 9e0953c2b7ce..dcee0e223ed8 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -160,4 +160,14 @@ struct msm_gem_submit {
>  	} bos[0];
>  };
>  
> +/* helper to determine of a buffer in submit should be dumped, used for both
> + * devcoredump and debugfs cmdstream dumping:
> + */
> +static inline bool
> +should_dump(struct msm_gem_submit *submit, int idx)
> +{
> +	extern bool rd_full;
> +	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
> +}
> +
>  #endif /* __MSM_GEM_H__ */
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 18f3a5c53ffb..615c5cda5389 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -355,16 +355,34 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
>  	state->cmd = kstrdup(cmd, GFP_KERNEL);
>  
>  	if (submit) {
> -		int i;
> -
> -		state->bos = kcalloc(submit->nr_cmds,
> +		int i, nr = 0;
> +
> +		/* count # of buffers to dump: */
> +		for (i = 0; i < submit->nr_bos; i++)
> +			if (should_dump(submit, i))
> +				nr++;
> +		/* always dump cmd bo's, but don't double count them: */
> +		for (i = 0; i < submit->nr_cmds; i++)
> +			if (!should_dump(submit, submit->cmd[i].idx))
> +				nr++;
> +
> +		state->bos = kcalloc(nr,
>  			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
>  
> +		for (i = 0; i < submit->nr_bos; i++) {
> +			if (should_dump(submit, i)) {
> +				msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
> +					submit->bos[i].iova, submit->bos[i].flags);
> +			}
> +		}
> +
>  		for (i = 0; state->bos && i < submit->nr_cmds; i++) {
>  			int idx = submit->cmd[i].idx;
>  
> -			msm_gpu_crashstate_get_bo(state, submit->bos[idx].obj,
> -				submit->bos[idx].iova, submit->bos[idx].flags);
> +			if (!should_dump(submit, submit->cmd[i].idx)) {
> +				msm_gpu_crashstate_get_bo(state, submit->bos[idx].obj,
> +					submit->bos[idx].iova, submit->bos[idx].flags);
> +			}
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
> index af7ceb246c7c..732f65df5c4f 100644
> --- a/drivers/gpu/drm/msm/msm_rd.c
> +++ b/drivers/gpu/drm/msm/msm_rd.c
> @@ -43,7 +43,7 @@
>  #include "msm_gpu.h"
>  #include "msm_gem.h"
>  
> -static bool rd_full = false;
> +bool rd_full = false;
>  MODULE_PARM_DESC(rd_full, "If true, $debugfs/.../rd will snapshot all buffer contents");
>  module_param_named(rd_full, rd_full, bool, 0600);
>  
> @@ -336,12 +336,6 @@ static void snapshot_buf(struct msm_rd_state *rd,
>  	msm_gem_put_vaddr(&obj->base);
>  }
>  
> -static bool
> -should_dump(struct msm_gem_submit *submit, int idx)
> -{
> -	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
> -}
> -
>  /* called under struct_mutex */
>  void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
>  		const char *fmt, ...)
> -- 
> 2.24.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
