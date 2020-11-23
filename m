Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86BDD2C1777
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 22:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729996AbgKWVNL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 16:13:11 -0500
Received: from z5.mailgun.us ([104.130.96.5]:29451 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729260AbgKWVNL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 16:13:11 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606165990; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=eWZ6QZkKfoZgGA0Z1xGVlAKN3o4fc7HBpyuUpR+spMA=;
 b=ule5OuJduLg7VjhQnbq8qbwFtlehWdXAM72V5xJGk0QJa5wCBCjjxgiRtinKiN3pfFOGtvKW
 mt3PAMIeY4/5cUFwcbroLz9j7hlo9yK/r54C3VC3g0BVduJBe+aVB7COmzURS9cTCPZzxReE
 2nSH9Y6O9Jc/49nMiMhVu1rBqSA=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5fbc25e60c9500dc7b2bbf99 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:13:10
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 372CDC433C6; Mon, 23 Nov 2020 21:13:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DF725C43460;
        Mon, 23 Nov 2020 21:13:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 13:13:08 -0800
From:   abhinavk@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 35/40] drm/msm/disp/dpu1/dpu_plane: Fix some
 spelling and missing function param descriptions
In-Reply-To: <20201123111919.233376-36-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-36-lee.jones@linaro.org>
Message-ID: <d30180faae8158c7a489f2e1c206e2f7@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-23 03:19, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:152: warning: Function
> parameter or member 'plane' not described in '_dpu_plane_calc_bw'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:152: warning: Function
> parameter or member 'fb' not described in '_dpu_plane_calc_bw'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:152: warning: Excess
> function parameter 'Plane' description in '_dpu_plane_calc_bw'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:200: warning: Function
> parameter or member 'plane' not described in '_dpu_plane_calc_clk'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:200: warning: Excess
> function parameter 'Plane' description in '_dpu_plane_calc_clk'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:232: warning: Function
> parameter or member 'src_width' not described in
> '_dpu_plane_calc_fill_level'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:232: warning: Excess
> function parameter 'src_wdith' description in
> '_dpu_plane_calc_fill_level'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:1060: warning: Function
> parameter or member 'error' not described in 'dpu_plane_set_error'
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
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c0b1d77369e53..cf0084d7cc7c9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -142,7 +142,8 @@ static struct dpu_kms *_dpu_plane_get_kms(struct
> drm_plane *plane)
> 
>  /**
>   * _dpu_plane_calc_bw - calculate bandwidth required for a plane
> - * @Plane: Pointer to drm plane.
> + * @plane: Pointer to drm plane.
> + * @fb:   Pointer to framebuffer associated with the given plane
>   * Result: Updates calculated bandwidth in the plane state.
>   * BW Equation: src_w * src_h * bpp * fps * (v_total / v_dest)
>   * Prefill BW Equation: line src bytes * line_time
> @@ -192,7 +193,7 @@ static void _dpu_plane_calc_bw(struct drm_plane 
> *plane,
> 
>  /**
>   * _dpu_plane_calc_clk - calculate clock required for a plane
> - * @Plane: Pointer to drm plane.
> + * @plane: Pointer to drm plane.
>   * Result: Updates calculated clock in the plane state.
>   * Clock equation: dst_w * v_total * fps * (src_h / dst_h)
>   */
> @@ -224,7 +225,7 @@ static void _dpu_plane_calc_clk(struct drm_plane 
> *plane)
>   * _dpu_plane_calc_fill_level - calculate fill level of the given 
> source format
>   * @plane:		Pointer to drm plane
>   * @fmt:		Pointer to source buffer format
> - * @src_wdith:		width of source buffer
> + * @src_width:		width of source buffer
>   * Return: fill level corresponding to the source buffer/format or 0 
> if error
>   */
>  static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
> @@ -1055,6 +1056,7 @@ void dpu_plane_flush(struct drm_plane *plane)
>  /**
>   * dpu_plane_set_error: enable/disable error condition
>   * @plane: pointer to drm_plane structure
> + * @error: error value to set
>   */
>  void dpu_plane_set_error(struct drm_plane *plane, bool error)
>  {
