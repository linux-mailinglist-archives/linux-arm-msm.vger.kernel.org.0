Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 708B12C175E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 22:11:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728698AbgKWVKz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 16:10:55 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:47591 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728940AbgKWVKx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 16:10:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606165852; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=M0DxBOKAap3NrjXCKDI/Y28+aJ2ultye9c2JTUJ/7us=;
 b=aMY2cOkbUPBzQCITe9M+DlplpOr0ZlNpMFn89W8j3SNoRZdNOvc5ySoVNMwVDUAdZ2Ye+L17
 9Z7BcqWIUYWglLI0NgV8J6IDMUlBhdFkmMNyR9xcXyT85gJV45/WPS9u0yjKJML2B8xAsuCL
 yjo5bDvpd1cH4tWGrHvK4SLqK7w=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fbc254ed64ea0b70311b1e5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:10:38
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0069CC43463; Mon, 23 Nov 2020 21:10:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D8A24C433C6;
        Mon, 23 Nov 2020 21:10:36 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 13:10:36 -0800
From:   abhinavk@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 10/40] drm/msm/disp/dpu1/dpu_core_perf: Fix
 kernel-doc formatting issues
In-Reply-To: <20201123111919.233376-11-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-11-lee.jones@linaro.org>
Message-ID: <89313cae90a84d7d64f32977dec5006e@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-23 03:18, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:31: warning: Enum value
> 'DPU_PERF_MODE_MAX' not described in enum 'dpu_perf_mode'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:34: warning: Cannot
> understand  * @_dpu_core_perf_calc_bw() - to calculate BW per crtc
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:73: warning: Function
> parameter or member 'kms' not described in '_dpu_core_perf_calc_clk'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:73: warning: Function
> parameter or member 'crtc' not described in '_dpu_core_perf_calc_clk'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:73: warning: Function
> parameter or member 'state' not described in '_dpu_core_perf_calc_clk'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c:249: warning: Cannot
> understand  * @dpu_core_perf_crtc_release_bw() - request zero
> bandwidth
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
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 36927fc04a388..b6b3bbab03336 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -22,6 +22,7 @@
>   * @DPU_PERF_MODE_NORMAL: performance controlled by user mode client
>   * @DPU_PERF_MODE_MINIMUM: performance bounded by minimum setting
>   * @DPU_PERF_MODE_FIXED: performance bounded by fixed setting
> + * @DPU_PERF_MODE_MAX: maximum value, used for error checking
>   */
>  enum dpu_perf_mode {
>  	DPU_PERF_MODE_NORMAL,
> @@ -31,9 +32,9 @@ enum dpu_perf_mode {
>  };
> 
>  /**
> - * @_dpu_core_perf_calc_bw() - to calculate BW per crtc
> - * @kms -  pointer to the dpu_kms
> - * @crtc - pointer to a crtc
> + * _dpu_core_perf_calc_bw() - to calculate BW per crtc
> + * @kms:  pointer to the dpu_kms
> + * @crtc: pointer to a crtc
>   * Return: returns aggregated BW for all planes in crtc.
>   */
>  static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
> @@ -63,9 +64,9 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms 
> *kms,
> 
>  /**
>   * _dpu_core_perf_calc_clk() - to calculate clock per crtc
> - * @kms -  pointer to the dpu_kms
> - * @crtc - pointer to a crtc
> - * @state - pointer to a crtc state
> + * @kms:  pointer to the dpu_kms
> + * @crtc: pointer to a crtc
> + * @state: pointer to a crtc state
>   * Return: returns max clk for all planes in crtc.
>   */
>  static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
> @@ -246,8 +247,8 @@ static int _dpu_core_perf_crtc_update_bus(struct
> dpu_kms *kms,
>  }
> 
>  /**
> - * @dpu_core_perf_crtc_release_bw() - request zero bandwidth
> - * @crtc - pointer to a crtc
> + * dpu_core_perf_crtc_release_bw() - request zero bandwidth
> + * @crtc: pointer to a crtc
>   *
>   * Function checks a state variable for the crtc, if all pending 
> commit
>   * requests are done, meaning no more bandwidth is needed, release
