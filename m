Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 640CC2929BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 16:49:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729546AbgJSOt3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 10:49:29 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:33813 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729657AbgJSOt2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 10:49:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603118968; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=SdjfHLMdpVTBMrEL+U0iqbpL1vfRm8mz6fh4D3U3ygg=; b=HHJoWn6wNcJ+lfnSbfxIgO9sa0TZL7+6EGpUYro/1o/9f5W++FjsTV4KXQi4afzsBga+RClf
 dROq+7WOH1WSdm14qSmSqPNZzDjQmNpQNeQ0bZinKAek2m31u1pkMCvr551AuGYT4lwDrXws
 8BxT8Oe4NsBvLiJoynJBUmZlNSo=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f8da772a03b63d6738ee115 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Oct 2020 14:49:22
 GMT
Sender: jcrouse=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C4B1BC43382; Mon, 19 Oct 2020 14:49:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 62E40C433CB;
        Mon, 19 Oct 2020 14:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 62E40C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date:   Mon, 19 Oct 2020 08:49:17 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH] drm/msm: Remove redundant null check
Message-ID: <20201019144917.GA31882@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Tian Tao <tiantao6@hisilicon.com>, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1603087462-37505-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603087462-37505-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 19, 2020 at 02:04:22PM +0800, Tian Tao wrote:
> clk_prepare_enable() and clk_disable_unprepare() will check
> NULL clock parameter, so It is not necessary to add additional checks.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 57ddc94..25bc654 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -175,15 +175,12 @@ static int disable_clk(struct msm_gpu *gpu)
>  
>  static int enable_axi(struct msm_gpu *gpu)
>  {
> -	if (gpu->ebi1_clk)
> -		clk_prepare_enable(gpu->ebi1_clk);
> -	return 0;
> +	return clk_prepare_enable(gpu->ebi1_clk);
>  }
>  
>  static int disable_axi(struct msm_gpu *gpu)
>  {
> -	if (gpu->ebi1_clk)
> -		clk_disable_unprepare(gpu->ebi1_clk);
> +	clk_disable_unprepare(gpu->ebi1_clk);
>  	return 0;
>  }
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
