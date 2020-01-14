Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1CF13AE38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 17:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgANQAJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 11:00:09 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:52485 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726450AbgANQAJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 11:00:09 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1579017608; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=SP7KtqJLhxcHuH5kxq8tGE8k0HxhmfSYXMOApVPO+zk=; b=loIQ8eWgs2QZJZg54tiedGwT7AfcahqqP5ZRgv8U+7GyRaG9PGe1qqGP+miZm+t7xM0Cex2k
 C4N/ndrYhEweDVz0c48RwSUKwK8aAzSJJVIMihct4D/dGPcSzI0RVCiziIxX9WWGdJDhRJFv
 VR6a0xnvtU6WibakvdldTZZDoak=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1de580.7f3f21883458-smtp-out-n02;
 Tue, 14 Jan 2020 16:00:00 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 48704C4479F; Tue, 14 Jan 2020 15:59:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9845FC433CB;
        Tue, 14 Jan 2020 15:59:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9845FC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 14 Jan 2020 08:59:55 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Rob Clark <robdclark@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Brian Masney <masneyb@onstation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/msm: Fix error about comments within a comment block
Message-ID: <20200114155955.GA31665@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Brian Masney <masneyb@onstation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
References: <20200113140427.1.I5e35e29bebe575e091177c4f82606c15370b71d7@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113140427.1.I5e35e29bebe575e091177c4f82606c15370b71d7@changeid>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 13, 2020 at 02:04:46PM -0800, Douglas Anderson wrote:
> My compiler yells:
>   .../drivers/gpu/drm/msm/adreno/adreno_gpu.c:69:27:
>   error: '/*' within block comment [-Werror,-Wcomment]
> 
> Let's fix.

grumble something about the road being paved with good intentions....

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Fixes: 6a0dea02c2c4 ("drm/msm: support firmware-name for zap fw (v2)")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index c146c3b8f52b..7fd29829b2fa 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -67,7 +67,7 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
>  	 *
>  	 * If the firmware-name property is found, we bypass the
>  	 * adreno_request_fw() mechanism, because we don't need to handle
> -	 * the /lib/firmware/qcom/* vs /lib/firmware/* case.
> +	 * the /lib/firmware/qcom/... vs /lib/firmware/... case.
>  	 *
>  	 * If the firmware-name property is not found, for backwards
>  	 * compatibility we fall back to the fwname from the gpulist
> -- 
> 2.25.0.rc1.283.g88dfdc4193-goog
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
