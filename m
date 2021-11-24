Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5209645CA08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Nov 2021 17:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348842AbhKXQcN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Nov 2021 11:32:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348820AbhKXQcM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Nov 2021 11:32:12 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC667C061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 08:29:02 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id d11so6618689ljg.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 08:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WkqjCv1H8iCs2LbCoEle2c1z/X1KWtHu9nXiw6O/b5g=;
        b=JVn20yPHefHNLdS0sfAnScX2Ily94HhVnZxOpx8gaShsFA7wkk91mbK9KF3Y95oYJs
         6tPQwjbL0Q98iJMOwy+UdVPVzf0cFgNRWFj2Li31Yhpx+tKbGRN3AtiauSi1BsbnTp6W
         U+gvH6jpKOln5770wzOk9lXHuLhqiKMWI+rH+TRrLkzur/AbMi37KqKKyly9dA0AHtqH
         Xm9F5hjyO3hFVn+0ZFkSU7ezDtAz96+B3vzZAis4DFvRwTBnWNAeMGvQ1nLE3+GnVYdK
         WiOHtpRu1xZHVLwWOgAZVRacokcfWBRnYXcKD4XfZthW0Rk3zRfUfXzYfWgZ9eNxiZG1
         3FrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WkqjCv1H8iCs2LbCoEle2c1z/X1KWtHu9nXiw6O/b5g=;
        b=G4J/U1RBqGsnEqFK1FJh2K3i9MFUED+C6dBvQNMmjEW/xZGgep2MtwhEMRGYu94DvU
         bLGd6UeKW+3OwQOp+EFGqPJi85PYjhVPU4+xTP/ZwXOGJfpMxBcGXmkrv2fFlBLy9srx
         oc3AiNgxL9CKvKEhmlD5ALPkeRyZlYdUj3G/jftQf/SRFx4qy2eiUnC5q4lDAnbLBNdb
         4UjKAvOA80xh4h2ysYXSKcanyqjU7cpw460eapwaSknGJxjENezvpPPux9+GGyTVwu0L
         x7uUX9CvX/k1a8T+YMCuAlPmSN4sSurNGZeB/JiUaBtb9tQnitqHmsFYxlTcP9IOMF39
         9s7w==
X-Gm-Message-State: AOAM530DMWjMcga2brMi++DqOqT63UP9OIHk10sSvfgiWOSk6wUquRnS
        Cf/ZEF7cOahz2z/so8BwDRmsqQ==
X-Google-Smtp-Source: ABdhPJwjNWwJmQJA0UgfY6sjpYYHU3TREPGrYNesnTdKOPO3gk/rQGVuGDCUHdC4Ft8pR1Jugie9ww==
X-Received: by 2002:a2e:8099:: with SMTP id i25mr17868323ljg.528.1637771341068;
        Wed, 24 Nov 2021 08:29:01 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p3sm24901lfg.273.2021.11.24.08.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 08:29:00 -0800 (PST)
Subject: Re: [PATCH v3 13/13] drm/msm/dsi: Pass DSC params to drm_panel
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20211116062256.2417186-1-vkoul@kernel.org>
 <20211116062256.2417186-14-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <1fecc2d3-28fa-57ee-db60-95713a84787a@linaro.org>
Date:   Wed, 24 Nov 2021 19:28:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211116062256.2417186-14-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2021 09:22, Vinod Koul wrote:
> When DSC is enabled, we need to pass the DSC parameters to panel driver
> as well, so add a dsc parameter in panel and set it when DSC is enabled
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 16 +++++++++++++++-
>   include/drm/drm_panel.h            |  7 +++++++
>   2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 2c14c36f0b3d..3d5773fcf496 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2159,11 +2159,25 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>   	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>   	struct msm_drm_private *priv;
> +	struct drm_panel *panel;
>   	int ret;
>   
>   	msm_host->dev = dev;
> +	panel = msm_dsi_host_get_panel(&msm_host->base);
>   	priv = dev->dev_private;
> -	priv->dsc = msm_host->dsc;
> +
> +	if (panel && panel->dsc) {
> +		struct msm_display_dsc_config *dsc = priv->dsc;
> +
> +		if (!dsc) {
> +			dsc = kzalloc(sizeof(*dsc), GFP_KERNEL);

devm_kzalloc()?

Or even simpler: embed msm_display_dsc_config into struct msm_dsi_host 
and use it only if dsc->drm is set (IOW the panel provided DSC data)?

> +			if (!dsc)
> +				return -ENOMEM;
> +			dsc->drm = panel->dsc;
> +			priv->dsc = dsc;
> +			msm_host->dsc = dsc;
> +		}
> +	}
>   
>   	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>   	if (ret) {
> diff --git a/include/drm/drm_panel.h b/include/drm/drm_panel.h
> index 4602f833eb51..eb8ae9bf32ed 100644
> --- a/include/drm/drm_panel.h
> +++ b/include/drm/drm_panel.h
> @@ -171,6 +171,13 @@ struct drm_panel {
>   	 * Panel entry in registry.
>   	 */
>   	struct list_head list;
> +
> +	/**
> +	 * @dsc:
> +	 *
> +	 * Panel DSC pps payload to be sent
> +	 */
> +	struct drm_dsc_config *dsc;
>   };
>   
>   void drm_panel_init(struct drm_panel *panel, struct device *dev,
> 


-- 
With best wishes
Dmitry
