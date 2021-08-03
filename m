Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6D4C3DE351
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 02:01:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232736AbhHCABa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 20:01:30 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61643 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232514AbhHCAB3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 20:01:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627948879; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hXekGM4hs7Ucl6X0Et/hD2GvGQI/YKH6vAE033Bgy68=;
 b=wskk5xFy06rK+CMQy7oHCYMFxpht+FpZnvP7zQxhdoOgMw58VJlKYH/W6lMQR3qvMD0DlJhP
 RE8PmR4Mt673MiNb5Q9fNDfo4U07sP1uFB+NqOvFbsoCPNPr5L9x65z9g0nz0fahD0NzZHi6
 nt+VljFUzoolcI9kYmgms0EXz9A=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61088718e81205dd0a72bd04 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Aug 2021 00:00:24
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1E1BAC43460; Tue,  3 Aug 2021 00:00:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 50BB2C433F1;
        Tue,  3 Aug 2021 00:00:22 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 Aug 2021 17:00:22 -0700
From:   abhinavk@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 06/11] drm/msm/disp/dpu1: Add DSC support in
 hw_ctl
In-Reply-To: <20210715065203.709914-7-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-7-vkoul@kernel.org>
Message-ID: <7317c6b71043267ce19b7826502c9735@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-14 23:51, Vinod Koul wrote:
> Later gens of hardware have DSC bits moved to hw_ctl, so configure 
> these
> bits so that DSC would work there as well
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
Please correct me if wrong but here you seem to be flushing all the DSC 
bits
even the unused ones. This will end-up enabling DSC even when DSC is 
unused on
the newer targets.
If so, thats wrong.
We need to implement bit-mask based approach to avoid this change and 
only enable
those DSCs which are used.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 2d4645e01ebf..aeea6add61ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -25,6 +25,8 @@
>  #define   CTL_MERGE_3D_ACTIVE           0x0E4
>  #define   CTL_INTF_ACTIVE               0x0F4
>  #define   CTL_MERGE_3D_FLUSH            0x100
> +#define   CTL_DSC_ACTIVE                0x0E8
> +#define   CTL_DSC_FLUSH                0x104
>  #define   CTL_INTF_FLUSH                0x110
>  #define   CTL_INTF_MASTER               0x134
>  #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
> @@ -34,6 +36,7 @@
> 
>  #define DPU_REG_RESET_TIMEOUT_US        2000
>  #define  MERGE_3D_IDX   23
> +#define  DSC_IDX        22
>  #define  INTF_IDX       31
>  #define CTL_INVALID_BIT                 0xffff
> 
> @@ -120,6 +123,7 @@ static u32 dpu_hw_ctl_get_pending_flush(struct
> dpu_hw_ctl *ctx)
> 
>  static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>  {
> +	DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, BIT(0) | BIT(1) | BIT(2) | 
> BIT(3));
> 
>  	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
>  		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
> @@ -128,7 +132,7 @@ static inline void
> dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>  		DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
>  				ctx->pending_intf_flush_mask);
> 
> -	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
> +	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask |  
> BIT(DSC_IDX));
>  }
> 
>  static inline void dpu_hw_ctl_trigger_flush(struct dpu_hw_ctl *ctx)
> @@ -507,6 +511,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct 
> dpu_hw_ctl *ctx,
>  	if (cfg->merge_3d)
>  		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>  			      BIT(cfg->merge_3d - MERGE_3D_0));
> +	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, BIT(0) | BIT(1) | BIT(2) | BIT(3));
>  }
> 
>  static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
