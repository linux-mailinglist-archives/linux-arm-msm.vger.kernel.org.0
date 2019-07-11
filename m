Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAE9965FB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 20:47:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729124AbfGKSre (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 14:47:34 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:40262 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729113AbfGKSre (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 14:47:34 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BEE5160E57; Thu, 11 Jul 2019 18:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562870853;
        bh=sIf85qt6fGhqNhD9KR+F6pvXY2yVgu3Wm2WY/oV+PR8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zdsr9eeXuJv+kG+dvZQRz5HdDo9SJabMlhSgxEHt1opiPvpGY5Y3IGaaM0pMKq4Od
         W851rP2UmKqBsUZ6FaFazRRgSPh8Uct68C/kTOF9XOp/FcEy6ydw05G0MQzHsMTj+A
         NXIeHy2R5ZHAzh8V0ZAnbmgdDT1+JdWeGI8TFELg=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8C0E160E57;
        Thu, 11 Jul 2019 18:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1562870852;
        bh=sIf85qt6fGhqNhD9KR+F6pvXY2yVgu3Wm2WY/oV+PR8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b6RRDe3V9ulvyAE6NCTh2YNTaatOsYq4SQXp76x2z7KC32m7jG0rIkkdsPFmnMmN7
         VC8pWcXHhOorEdRwNcP0VUl56e3eSo6z/AnqR45h0LLdieVbWvWKhLFg8g832s8LgH
         FgAchtis5/E+CO/QtqFgh11OrU34vl7KU5dvuwxo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8C0E160E57
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Thu, 11 Jul 2019 12:47:29 -0600
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH 2/3] drm/msm/dpu: remove dpu_mdss:hwversion
Message-ID: <20190711184729.GC26247@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Jayant Shekhar <jshekhar@codeaurora.org>,
        Sean Paul <sean@poorly.run>, Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20190630131445.25712-1-robdclark@gmail.com>
 <20190630131445.25712-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190630131445.25712-3-robdclark@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 30, 2019 at 06:14:42AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Unused and the extra rpm get/put interferes with handover from
> bootloader (ie. happens before we have a chance to check if
> things are already enabled).

Yay for not turning on the hardware before we need to.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index 986915bbbc02..e83dd4c6ec58 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -22,7 +22,6 @@ struct dpu_mdss {
>  	struct msm_mdss base;
>  	void __iomem *mmio;
>  	unsigned long mmio_len;
> -	u32 hwversion;
>  	struct dss_module_power mp;
>  	struct dpu_irq_controller irq_controller;
>  	struct icc_path *path[2];
> @@ -287,10 +286,6 @@ int dpu_mdss_init(struct drm_device *dev)
>  
>  	dpu_mdss_icc_request_bw(priv->mdss);
>  
> -	pm_runtime_get_sync(dev->dev);
> -	dpu_mdss->hwversion = readl_relaxed(dpu_mdss->mmio);
> -	pm_runtime_put_sync(dev->dev);
> -
>  	return ret;
>  
>  irq_error:
> -- 
> 2.20.1
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
