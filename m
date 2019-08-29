Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4D4DA1AAF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 15:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727411AbfH2NFF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 09:05:05 -0400
Received: from mail-yb1-f193.google.com ([209.85.219.193]:33020 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfH2NFB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 09:05:01 -0400
Received: by mail-yb1-f193.google.com with SMTP id a17so1168200ybc.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2019 06:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6VBkLsvXlERJnhRJgH+r5GK4buSUTKmrRtT/NOyzDgs=;
        b=e3V0pJgx+4fsz6xIVRJ7LtRBzZ7Zb4YZnP+PLxk2w4+Z3Oll/LrQit2zb0/uy6o4GW
         Jb9sCNXWKrPdpi9zGAmgIDW8YPCN+AnJId8e4Ls8ShKj/CK0lxUSsy5U8Zqqh9rZnfmF
         DLnUr2/opNiDROP0SOrpLr46bvqRAW4Sl2ZgaAF+F14c1vBlQbY9dITPLgAfRx+hPBp3
         XHwk3h1qVFzYRfOTOaYwUVjQMY4SdWFqN9xQ9mziYgchFqHpEnX+loi73E9p9xOKc+/N
         WO91wXBImaSiBPgclAHy/bDsXBaMt831Dkw9tsHze7zljHmCOMmTdR8ZBB2ZIS7YTyfC
         FNHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6VBkLsvXlERJnhRJgH+r5GK4buSUTKmrRtT/NOyzDgs=;
        b=nhKADHjsZu6q0rWfxYtzTXKvDdToUDofFkWKXxDxLPkZ231xmzMoJnxJ6FG21CO9c8
         PlMkIGnymI0fULpgl8+2mKSYuSc299a247K+XRMaGA5kDmkPUs52G62+icK3qWoNjBIr
         jfc6XsH4GY8ZIjL5ZNRy/b7Zpg+sqf2wMbn3OXbt7v+JxPnCFPrj4UseRUAlhnIbwPNu
         c4RyHnhOSTQloPoEqOAQewL+VkPlTllcSRMdUXXqqgs/I0n4MjhEHj92KxbNVJz2oA60
         vebf4jli7k4oaDIr19nwe0PqfRH736kbZoMcCpY2ABx3UmNa6v6mTE9PtI0/Eg1YcWN5
         r3sQ==
X-Gm-Message-State: APjAAAVIppth+abyKOQ6PCTSpS3o5A/4Tshpd+V+DurjGZUqlIDf5Re8
        oqWaBICHeaZe0ZCl15i9oxAzpA==
X-Google-Smtp-Source: APXvYqxnB7BRqeZ9zmDLaGZIodEN/tUWqtSFo1zTN5kxmpvBGBVy36rbhkJzx5Gc/Ud2V5aPDCW2kA==
X-Received: by 2002:a25:3441:: with SMTP id b62mr7142632yba.224.1567083900064;
        Thu, 29 Aug 2019 06:05:00 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id t5sm455533ywi.33.2019.08.29.06.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 06:04:59 -0700 (PDT)
Date:   Thu, 29 Aug 2019 09:04:59 -0400
From:   Sean Paul <sean@poorly.run>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Allison Randal <allison@lohutok.net>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/9] drm/msm/dpu: add real wait_for_commit_done()
Message-ID: <20190829130459.GG218215@art_vandelay>
References: <20190827213421.21917-1-robdclark@gmail.com>
 <20190827213421.21917-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190827213421.21917-3-robdclark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 27, 2019 at 02:33:32PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Just waiting for next vblank isn't ideal.. we should really be looking
> at the hw FLUSH register value to know if there is still an in-progress
> flush without stalling unnecessarily when there is no pending flush.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Sean Paul <sean@poorly.run>

> ---
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 22 ++++++++++++++++++-
>  1 file changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 737fe963a490..7c73b09894f0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -526,6 +526,26 @@ static int dpu_encoder_phys_vid_wait_for_vblank(
>  	return _dpu_encoder_phys_vid_wait_for_vblank(phys_enc, true);
>  }
>  
> +static int dpu_encoder_phys_vid_wait_for_commit_done(
> +		struct dpu_encoder_phys *phys_enc)
> +{
> +	struct dpu_hw_ctl *hw_ctl = phys_enc->hw_ctl;
> +	int ret;
> +
> +	if (!hw_ctl)
> +		return 0;
> +
> +	ret = wait_event_timeout(phys_enc->pending_kickoff_wq,
> +		(hw_ctl->ops.get_flush_register(hw_ctl) == 0),
> +		msecs_to_jiffies(50));
> +	if (ret <= 0) {
> +		DPU_ERROR("vblank timeout\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
>  static void dpu_encoder_phys_vid_prepare_for_kickoff(
>  		struct dpu_encoder_phys *phys_enc)
>  {
> @@ -676,7 +696,7 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>  	ops->destroy = dpu_encoder_phys_vid_destroy;
>  	ops->get_hw_resources = dpu_encoder_phys_vid_get_hw_resources;
>  	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
> -	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_vblank;
> +	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
>  	ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
>  	ops->wait_for_tx_complete = dpu_encoder_phys_vid_wait_for_vblank;
>  	ops->irq_control = dpu_encoder_phys_vid_irq_control;
> -- 
> 2.21.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
