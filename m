Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E4F065DBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2019 18:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728413AbfGKQpM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jul 2019 12:45:12 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42468 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728325AbfGKQpL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jul 2019 12:45:11 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so3011063pff.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jul 2019 09:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jwuRR8Q1l0rKbX4Ve134b1iXf6no8US/0ODaV1OtfJg=;
        b=fXMfPXQFw+BMXHj5sB7D5SZbRLL4yLO7dCFEcqra0z5M/ZOltBbf3Zj/Aao1hET4GD
         3azphRfZ11zhgbXjs3N4nbnKMwUU7+4dw6YKKXllbd+DssNy3TxDGCgkmV1ikNcZxL7/
         2ICwcXgXIJkPJwzLWiM4/yASDDXjIQa7HjC9IImhuA+FU4yWlR8FfIzidpqktofkWi8v
         Va0bLm/egQy7D/+XBHgq+GtkBfu9c1Y6IPWhZN8mcQmY/Fa8JG1MM4eSiK3ha3usflxA
         5VzG7L1PfesBb/hDoETF7jtEOnM6ltMdpQbSzf5oDTXZHnTRFG58VhAlAl5/e8gh0nzi
         EL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jwuRR8Q1l0rKbX4Ve134b1iXf6no8US/0ODaV1OtfJg=;
        b=DUM8tkjdpaWAn4luuJl8ntPnRIb285bc5FrM3MOGD2hszU+vqLrT5ZQQQVNqdXSHFQ
         vM93DolFzejvixFwg6HxoRF+4AL1T2Z7f3JZIfk8cPaaxulWZOlUfQ+ShLT/dMLm4Zue
         Jw0uoHFNqbHJQBIZoUu9mb9pOXMOi2pej440dv2lqd2X7/5+rMhNHCqlNfm+8yTFaQYS
         S47jeGd49WcbZFl0mSSckSodg37MQ6ZvkRgYOCbdNejHCqZWgyreWwyLuF/0fetDqW5I
         fjlKtm1liYr18fWZB+Ys8IoQNwP+OHdkUybU0h3T9QH0/6LsUySl3OJvgucKrayKNaI8
         IUKQ==
X-Gm-Message-State: APjAAAV2eqVaKPFILD5xCC9tVb884zSeqzK7gS/DXkHzKsI8pWXrI5WP
        4+tfDNsLAAnDWS3buUVNSqtouA==
X-Google-Smtp-Source: APXvYqy1hl1yTY2tAfPT4CfLcn/3WL5Tytxe1BBNzeHmDCMgcsWevHevzfTkFxpehMNWKiRgxKFHTg==
X-Received: by 2002:a17:90a:2343:: with SMTP id f61mr6002098pje.130.1562863511049;
        Thu, 11 Jul 2019 09:45:11 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l189sm7116203pfl.7.2019.07.11.09.45.09
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 09:45:10 -0700 (PDT)
Date:   Thu, 11 Jul 2019 09:46:19 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/phy/dsi_phy: silence -EPROBE_DEFER warnings
Message-ID: <20190711164619.GT7234@tuxbook-pro>
References: <20190706111138.2238-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190706111138.2238-1-masneyb@onstation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat 06 Jul 04:11 PDT 2019, Brian Masney wrote:

> The following errors show up when booting the Nexus 5:
> 
> msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR*
>  dsi_phy_regulator_init: failed to init regulator, ret=-517
> msm_dsi_phy fd922a00.dsi-phy: [drm:dsi_phy_driver_probe] *ERROR*
>  dsi_phy_driver_probe: failed to init regulator
> 
> dsi_phy_regulator_init() already logs the error, so no need to log
> the same error a second time in dsi_phy_driver_probe(). This patch
> also changes dsi_phy_regulator_init() to not log the error if the
> error code is -EPROBE_DEFER to reduce noise in dmesg.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 4097eca1b3ef..d0e1cc6728dc 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -396,8 +396,11 @@ static int dsi_phy_regulator_init(struct msm_dsi_phy *phy)
>  
>  	ret = devm_regulator_bulk_get(dev, num, s);
>  	if (ret < 0) {
> -		DRM_DEV_ERROR(dev, "%s: failed to init regulator, ret=%d\n",
> -						__func__, ret);
> +		if (ret != -EPROBE_DEFER)
> +			DRM_DEV_ERROR(dev,
> +				      "%s: failed to init regulator, ret=%d\n",
> +				      __func__, ret);

Some {} wouldn't hurt here, but not a big deal.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> +
>  		return ret;
>  	}
>  
> @@ -584,10 +587,8 @@ static int dsi_phy_driver_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = dsi_phy_regulator_init(phy);
> -	if (ret) {
> -		DRM_DEV_ERROR(dev, "%s: failed to init regulator\n", __func__);
> +	if (ret)
>  		goto fail;
> -	}
>  
>  	phy->ahb_clk = msm_clk_get(pdev, "iface");
>  	if (IS_ERR(phy->ahb_clk)) {
> -- 
> 2.20.1
> 
