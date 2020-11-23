Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E632C175B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 22:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728093AbgKWVKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 16:10:11 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:46876 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726745AbgKWVKL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 16:10:11 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606165810; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Nm9BEOZ5tiTsuXja+bIt51N7aLpyrz2R8XTJmsYaLQM=;
 b=m/1tv5BHwkek3K6VHiXFcukSQCBKy/I7JF40NJxC6+5vPZjhEcWBZI40eoXRmdAhAAtF/u95
 V3kFZH01xWVnI8JkDVsuVxW8yReGoO7EuYkVj12uuhFw7rbHHMnGgmKdpCcSHv1yHQpxPHDo
 2MS6mK/oZBwz9CZDgp/lvNW1rkk=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fbc252de9b7088622c06a30 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:10:05
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D7479C433C6; Mon, 23 Nov 2020 21:10:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D0879C433ED;
        Mon, 23 Nov 2020 21:10:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Nov 2020 13:10:03 -0800
From:   abhinavk@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 18/40] drm/msm/disp/dpu1/dpu_encoder: Fix a
 few parameter/member formatting issues
In-Reply-To: <20201123111919.233376-19-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-19-lee.jones@linaro.org>
Message-ID: <df03422ed2b9bb2addd5af02348916bf@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-23 03:18, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:207: warning: Function
> parameter or member 'cur_slave' not described in 'dpu_encoder_virt'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:207: warning: Function
> parameter or member 'hw_pp' not described in 'dpu_encoder_virt'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:207: warning: Function
> parameter or member 'intfs_swapped' not described in
> 'dpu_encoder_virt'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1445: warning: Function
> parameter or member 'drm_enc' not described in
> '_dpu_encoder_trigger_flush'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1445: warning: Function
> parameter or member 'phys' not described in
> '_dpu_encoder_trigger_flush'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1445: warning: Function
> parameter or member 'extra_flush_bits' not described in
> '_dpu_encoder_trigger_flush'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1481: warning: Function
> parameter or member 'phys' not described in
> '_dpu_encoder_trigger_start'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c:1564: warning: Function
> parameter or member 'dpu_enc' not described in
> '_dpu_encoder_kickoff_phys'
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 289bfb6f1861c..288e95ee8e1d5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -132,9 +132,10 @@ enum dpu_enc_rc_states {
>   * @phys_encs:		Container of physical encoders managed.
>   * @cur_master:		Pointer to the current master in this mode. 
> Optimization
>   *			Only valid after enable. Cleared as disable.
> - * @hw_pp		Handle to the pingpong blocks used for the display. No.
> + * @cur_slave:		As above but for the slave encoder.
> + * @hw_pp:		Handle to the pingpong blocks used for the display. No.
>   *			pingpong blocks can be different than num_phys_encs.
> - * @intfs_swapped	Whether or not the phys_enc interfaces have been 
> swapped
> + * @intfs_swapped:	Whether or not the phys_enc interfaces have been 
> swapped
>   *			for partial update right-only cases, such as pingpong
>   *			split where virtual pingpong does not generate IRQs
>   * @crtc:		Pointer to the currently assigned crtc. Normally you
> @@ -1436,9 +1437,9 @@ static void dpu_encoder_off_work(struct 
> work_struct *work)
> 
>  /**
>   * _dpu_encoder_trigger_flush - trigger flush for a physical encoder
> - * drm_enc: Pointer to drm encoder structure
> - * phys: Pointer to physical encoder structure
> - * extra_flush_bits: Additional bit mask to include in flush trigger
> + * @drm_enc: Pointer to drm encoder structure
> + * @phys: Pointer to physical encoder structure
> + * @extra_flush_bits: Additional bit mask to include in flush trigger
>   */
>  static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
>  		struct dpu_encoder_phys *phys, uint32_t extra_flush_bits)
> @@ -1475,7 +1476,7 @@ static void _dpu_encoder_trigger_flush(struct
> drm_encoder *drm_enc,
> 
>  /**
>   * _dpu_encoder_trigger_start - trigger start for a physical encoder
> - * phys: Pointer to physical encoder structure
> + * @phys: Pointer to physical encoder structure
>   */
>  static void _dpu_encoder_trigger_start(struct dpu_encoder_phys *phys)
>  {
> @@ -1558,7 +1559,7 @@ static void dpu_encoder_helper_hw_reset(struct
> dpu_encoder_phys *phys_enc)
>   *	encoder rather than the individual physical ones in order to handle
>   *	use cases that require visibility into multiple physical encoders 
> at
>   *	a time.
> - * dpu_enc: Pointer to virtual encoder structure
> + * @dpu_enc: Pointer to virtual encoder structure
>   */
>  static void _dpu_encoder_kickoff_phys(struct dpu_encoder_virt 
> *dpu_enc)
>  {
