Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90AC92C1753
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Nov 2020 22:11:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729939AbgKWVH2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Nov 2020 16:07:28 -0500
Received: from z5.mailgun.us ([104.130.96.5]:17681 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729102AbgKWVH1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Nov 2020 16:07:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606165647; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FdKrt5CvzTP/ssLP4rRCX6O+jYFh6N5XUhxBj14QiFw=;
 b=tRqduNqrM3tcifESi4pu052QpcmORnck9fgypTo99yuH9fxRgvHmezFP0ZfToOsqXQ8g89+M
 0XoqOR50Mcp+jKhh7Kpx49be4tne78a5VvMDFxGXUeD2ngmLB1GMgtyVm6JgAkO1LI7rLVcu
 fHZxJjdyv6tF5y/UHepcahajPhs=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fbc2485e714ea6501f8ecf4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:07:17
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 56F03C43469; Mon, 23 Nov 2020 21:07:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2DFA3C43462;
        Mon, 23 Nov 2020 21:07:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Mon, 23 Nov 2020 13:07:16 -0800
From:   abhinavk@codeaurora.org
To:     Lee Jones <lee.jones@linaro.org>
Cc:     freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 13/40] drm/msm/disp/dpu1/dpu_hw_catalog:
 Remove duplicated initialisation of 'max_linewidth'
In-Reply-To: <20201123111919.233376-14-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-14-lee.jones@linaro.org>
Message-ID: <a5dfd401fb36840bea08c496ffea8dc7@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-23 03:18, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:124:19: warning:
> initialized field overwritten [-Woverride-init]
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:124:19: note: (near
> initialization for ‘sm8250_dpu_caps.max_linewidth’)
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
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 6a6a7172e3beb..a7004f18523b0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -113,7 +113,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
>  static const struct dpu_caps sm8250_dpu_caps = {
>  	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
>  	.max_mixer_blendstages = 0xb,
> -	.max_linewidth = 4096,
>  	.qseed_type = DPU_SSPP_SCALER_QSEED3, /* TODO: qseed3 lite */
>  	.smart_dma_rev = DPU_SSPP_SMART_DMA_V2, /* TODO: v2.5 */
>  	.ubwc_version = DPU_HW_UBWC_VER_40,
