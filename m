Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3C043586F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2019 10:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbfFEIW0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jun 2019 04:22:26 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:56330 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfFEIW0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jun 2019 04:22:26 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id 2BD71804F9;
        Wed,  5 Jun 2019 10:22:23 +0200 (CEST)
Date:   Wed, 5 Jun 2019 10:22:21 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Vivek Gautam <vivek.gautam@codeaurora.org>
Cc:     airlied@linux.ie, thierry.reding@gmail.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH 1/1] drm/panel: truly: Add additional delay after pulling
 down reset gpio
Message-ID: <20190605082221.GB15169@ravnborg.org>
References: <20190527102616.28315-1-vivek.gautam@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527102616.28315-1-vivek.gautam@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=LpQP-O61AAAA:8
        a=e5mUnYsNAAAA:8 a=u_M7I5vmc8m8u026BJQA:9 a=CjuIK1q_8ugA:10
        a=pioyyrs4ZptJ924tMmac:22 a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vivek,

On Mon, May 27, 2019 at 03:56:16PM +0530, Vivek Gautam wrote:
> MTP SDM845 panel seems to need additional delay to bring panel
> to a workable state. Running modetest without this change displays
> blurry artifacts.
> 
> Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>

added to drm-misc-next

	Sam

> ---
>  drivers/gpu/drm/panel/panel-truly-nt35597.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-truly-nt35597.c b/drivers/gpu/drm/panel/panel-truly-nt35597.c
> index fc2a66c53db4..aa7153fd3be4 100644
> --- a/drivers/gpu/drm/panel/panel-truly-nt35597.c
> +++ b/drivers/gpu/drm/panel/panel-truly-nt35597.c
> @@ -280,6 +280,7 @@ static int truly_35597_power_on(struct truly_nt35597 *ctx)
>  	gpiod_set_value(ctx->reset_gpio, 1);
>  	usleep_range(10000, 20000);
>  	gpiod_set_value(ctx->reset_gpio, 0);
> +	usleep_range(10000, 20000);
>  
>  	return 0;
>  }
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
