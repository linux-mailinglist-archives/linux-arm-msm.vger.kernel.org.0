Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9F23B549D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 20:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbhF0SVc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 14:21:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41100 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231288AbhF0SVc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 14:21:32 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EAB029A;
        Sun, 27 Jun 2021 20:19:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624817946;
        bh=wK+nrVwjt4OX8y71ZMQNFIWNMUXMqLqQiij/WmjWfnc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DNBuwmC7I/0peKCcsI23heE5BEUc3uq5lbUNBGL4nPDJTkM9RWpqInfdWZMvvvfNS
         2hzBZhTR7tPMq92wpwFNh/jj5ZdTASPJ8Hv/sOyGaTHxba2Mhnia4DLhsSuHNVOVSa
         XUUuiknu/EVpC6z+qi8nL8DXL8Y/j9wjbLJOLE4M=
Date:   Sun, 27 Jun 2021 21:18:34 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rajeev Nandan <rajeevny@codeaurora.org>
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
        sam@ravnborg.org, robdclark@gmail.com, dianders@chromium.org,
        lyude@redhat.com, jani.nikula@intel.com, robh@kernel.org,
        a.hajda@samsung.com, daniel.thompson@linaro.org,
        hoegsberg@chromium.org, abhinavk@codeaurora.org,
        seanpaul@chromium.org, kalyan_t@codeaurora.org,
        mkrishn@codeaurora.org
Subject: Re: [v8 4/6] drm/panel-simple: Update validation warnings for eDP
 panel description
Message-ID: <YNjA+jg9Khn+a9K+@pendragon.ideasonboard.com>
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
 <1624726268-14869-5-git-send-email-rajeevny@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624726268-14869-5-git-send-email-rajeevny@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajeev,

On Sat, Jun 26, 2021 at 10:21:06PM +0530, Rajeev Nandan wrote:
> Do not give a warning for the eDP panels if the "bus_format" is
> not specified, since most eDP panels can support more than one
> bus formats and this can be auto-detected.
> Also, update the check to include bpc=10 for the eDP panel.
> 
> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> ---
> 
> Changes in v8:
> - New patch, to address the review comments of Sam Ravnborg [1]
> 
> [1] https://lore.kernel.org/dri-devel/20210621184157.GB918146@ravnborg.org/
> 
>  drivers/gpu/drm/panel/panel-simple.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 86e5a45..f966b562 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -772,10 +772,8 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc,
>  			desc->bpc != 8);
>  		break;
>  	case DRM_MODE_CONNECTOR_eDP:
> -		if (desc->bus_format == 0)
> -			dev_warn(dev, "Specify missing bus_format\n");
> -		if (desc->bpc != 6 && desc->bpc != 8)
> -			dev_warn(dev, "Expected bpc in {6,8} but got: %u\n", desc->bpc);
> +		if (desc->bpc != 6 && desc->bpc != 8 && desc->bpc != 10)
> +			dev_warn(dev, "Expected bpc in {6,8,10} but got: %u\n", desc->bpc);

You'll still get a warning is bpc == 0, is that intentional ?

>  		break;
>  	case DRM_MODE_CONNECTOR_DSI:
>  		if (desc->bpc != 6 && desc->bpc != 8)

-- 
Regards,

Laurent Pinchart
