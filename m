Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2162E8DAF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jan 2021 19:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727126AbhACSA5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jan 2021 13:00:57 -0500
Received: from vps5.brixit.nl ([192.81.221.234]:44708 "EHLO vps5.brixit.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726129AbhACSA5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jan 2021 13:00:57 -0500
Received: from [192.168.20.102] (unknown [77.239.252.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by vps5.brixit.nl (Postfix) with ESMTPSA id 10F7160815;
        Sun,  3 Jan 2021 18:00:12 +0000 (UTC)
Subject: Re: [PATCH] drm/msm: Fix MSM_INFO_GET_IOVA with carveout
To:     Iskren Chernev <iskren.chernev@gmail.com>,
        Rob Clark <robdclark@gmail.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210102202437.1630365-1-iskren.chernev@gmail.com>
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <d2333f2e-1227-3f37-ac22-4a2a0a02acb4@postmarketos.org>
Date:   Sun, 3 Jan 2021 21:01:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210102202437.1630365-1-iskren.chernev@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

I've tested all recent GPU bring-up patches on msm8974pro samsung-klte 
(a330v2) and with this patch everything is OK. But without this we're 
getting the following in dmesg while running kmscube (which is rendering 
nothing except black screen):

[   94.969272] msm fd900000.mdss: [drm:hangcheck_handler [msm]] *ERROR* 
A330: hangcheck detected gpu lockup rb 0!
[   94.970184] msm fd900000.mdss: [drm:hangcheck_handler [msm]] *ERROR* 
A330:     completed fence: 0
[   94.970873] msm fd900000.mdss: [drm:hangcheck_handler [msm]] *ERROR* 
A330:     submitted fence: 1
[   94.971600] msm fd900000.mdss: [drm:recover_worker [msm]] *ERROR* 
A330: hangcheck recover!
[   94.972329] msm fd900000.mdss: [drm:recover_worker [msm]] *ERROR* 
A330: offending task: kmscube (kmscube)
[   94.974101] revision: 330 (3.3.0.2)
[   94.974117] rb 0: fence:    0/1
[   94.974129] rptr:     36
[   94.974139] rb wptr:  36
[   94.974148] CP_SCRATCH_REG0: 0
[   94.974159] CP_SCRATCH_REG1: 0
[   94.974169] CP_SCRATCH_REG2: 0
[   94.974178] CP_SCRATCH_REG3: 0
[   94.974188] CP_SCRATCH_REG4: 0
[   94.974198] CP_SCRATCH_REG5: 0
[   94.974208] CP_SCRATCH_REG6: 10
[   94.974218] CP_SCRATCH_REG7: 12

So indeed partial revert of "if" condition fixes gpu at least on msm8974.

Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

On 1/2/21 11:24 PM, Iskren Chernev wrote:
> The msm_gem_get_iova should be guarded with gpu != NULL and not aspace
> != NULL, because aspace is NULL when using vram carveout.
> 
> Fixes: 933415e24bd0d ("drm/msm: Add support for private address space instances")
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> ---
>   drivers/gpu/drm/msm/msm_drv.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index c5e61cb3356df..c1953fb079133 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -775,9 +775,10 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
>   		struct drm_file *file, struct drm_gem_object *obj,
>   		uint64_t *iova)
>   {
> +	struct msm_drm_private *priv = dev->dev_private;
>   	struct msm_file_private *ctx = file->driver_priv;
>   
> -	if (!ctx->aspace)
> +	if (!priv->gpu)
>   		return -EINVAL;
>   
>   	/*
> 
