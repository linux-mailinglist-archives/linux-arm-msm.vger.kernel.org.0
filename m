Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59EC0CEB23
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2019 19:54:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728031AbfJGRyM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Oct 2019 13:54:12 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39912 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729372AbfJGRyL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Oct 2019 13:54:11 -0400
Received: from pendragon.ideasonboard.com (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D4881B2D;
        Mon,  7 Oct 2019 19:54:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570470849;
        bh=22A5q4Pj5aS9Ff9hTyiY7gnGGMylAQ77eyxkCoEXOro=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dKPWMRIq8/069H17TkSvP+k3h6vSY3B1ZBLwR7MMMtu2u5dBFQuRdvLVelL9dTWoy
         IhwyXyf/TxovIw7mlzeI7VqqrjQTgTLgvHecItoKfwW5QthxKGHluz4dP8qMPzbf+t
         w67aZXlFwA0PBwRn9DmhpGXGzP6qxxkcQUV4zm7g=
Date:   Mon, 7 Oct 2019 20:54:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Brian Masney <masneyb@onstation.org>
Cc:     robdclark@gmail.com, sean@poorly.run, bjorn.andersson@linaro.org,
        a.hajda@samsung.com, airlied@linux.ie, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        jonathan@marek.ca
Subject: Re: [PATCH RFC v2 1/5] drm/bridge: analogix-anx78xx: add support for
 avdd33 regulator
Message-ID: <20191007175404.GH11781@pendragon.ideasonboard.com>
References: <20191007014509.25180-1-masneyb@onstation.org>
 <20191007014509.25180-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191007014509.25180-2-masneyb@onstation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Brian,

Thank you for the patch.

On Sun, Oct 06, 2019 at 09:45:05PM -0400, Brian Masney wrote:
> Add support for the avdd33 regulator to the analogix-anx78xx driver.
> Note that the regulator is currently enabled during driver probe and
> disabled when the driver is removed. This is currently how the
> downstream MSM kernel sources do this.
> 
> Let's not merge this upstream for the mean time until I get the external
> display fully working on the Nexus 5 and then I can submit proper
> support then that powers down this regulator in the power off function.

Please then also update the corresponding DT bindings to describe the
avdd33 supply.

> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
> Changes since v1:
> - None
> 
>  drivers/gpu/drm/bridge/analogix-anx78xx.c | 33 +++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix-anx78xx.c
> index dec3f7e66aa0..e25fae36dbe1 100644
> --- a/drivers/gpu/drm/bridge/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix-anx78xx.c
> @@ -56,6 +56,7 @@ static const u8 anx781x_i2c_addresses[] = {
>  
>  struct anx78xx_platform_data {
>  	struct regulator *dvdd10;
> +	struct regulator *avdd33;
>  	struct gpio_desc *gpiod_hpd;
>  	struct gpio_desc *gpiod_pd;
>  	struct gpio_desc *gpiod_reset;
> @@ -715,10 +716,42 @@ static int anx78xx_start(struct anx78xx *anx78xx)
>  	return err;
>  }
>  
> +static void anx78xx_disable_regulator_action(void *_data)
> +{
> +	struct anx78xx_platform_data *pdata = _data;
> +
> +	regulator_disable(pdata->avdd33);
> +}
> +
>  static int anx78xx_init_pdata(struct anx78xx *anx78xx)
>  {
>  	struct anx78xx_platform_data *pdata = &anx78xx->pdata;
>  	struct device *dev = &anx78xx->client->dev;
> +	int err;
> +
> +	/* 3.3V digital core power regulator  */
> +	pdata->avdd33 = devm_regulator_get(dev, "avdd33");
> +	if (IS_ERR(pdata->avdd33)) {
> +		err = PTR_ERR(pdata->avdd33);
> +		if (err != -EPROBE_DEFER)
> +			DRM_ERROR("avdd33 regulator not found\n");
> +
> +		return err;
> +	}
> +
> +	err = regulator_enable(pdata->avdd33);
> +	if (err) {
> +		DRM_ERROR("Failed to enable avdd33 regulator: %d\n", err);
> +		return err;
> +	}
> +
> +	err = devm_add_action(dev, anx78xx_disable_regulator_action,
> +			      pdata);
> +	if (err < 0) {
> +		dev_err(dev, "Failed to setup regulator cleanup action %d\n",
> +			err);
> +		return err;
> +	}
>  
>  	/* 1.0V digital core power regulator  */
>  	pdata->dvdd10 = devm_regulator_get(dev, "dvdd10");

-- 
Regards,

Laurent Pinchart
