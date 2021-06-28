Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBDA93B5EED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jun 2021 15:33:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231980AbhF1NgB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Jun 2021 09:36:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56100 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231978AbhF1Nf7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Jun 2021 09:35:59 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 89E18B8A;
        Mon, 28 Jun 2021 15:33:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624887210;
        bh=8EvENliQ1czpJAVajAWWleB/PdHmKzVxxIK0OwYkJWQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WSoM2MxAntz0fEuJAwhHPQ4QfYRSPEbdK2R11MuQQpO5r5olL00xbUF+6myFKKIrq
         JOL7bDgdSriHiDvo3h6NJQoc46+RHCJVoC/jil7vXTn4r450VJWKtRREQkZLiImWtI
         wyo1gLiBPIC4t3y6RlZ3MLlZKCr8p686kUIQZLtU=
Date:   Mon, 28 Jun 2021 16:33:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     rajeevny@codeaurora.org
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
Message-ID: <YNnPqYjaZjmmrQTA@pendragon.ideasonboard.com>
References: <1624726268-14869-1-git-send-email-rajeevny@codeaurora.org>
 <1624726268-14869-5-git-send-email-rajeevny@codeaurora.org>
 <YNjA+jg9Khn+a9K+@pendragon.ideasonboard.com>
 <d75afefac48229657d36e12b6bac0e9f@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d75afefac48229657d36e12b6bac0e9f@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rajeev,

On Mon, Jun 28, 2021 at 05:46:24PM +0530, rajeevny@codeaurora.org wrote:
> On 27-06-2021 23:48, Laurent Pinchart wrote:
> > On Sat, Jun 26, 2021 at 10:21:06PM +0530, Rajeev Nandan wrote:
> >> Do not give a warning for the eDP panels if the "bus_format" is
> >> not specified, since most eDP panels can support more than one
> >> bus formats and this can be auto-detected.
> >> Also, update the check to include bpc=10 for the eDP panel.
> >> 
> >> Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> >> ---
> >> 
> >> Changes in v8:
> >> - New patch, to address the review comments of Sam Ravnborg [1]
> >> 
> >> [1] 
> >> https://lore.kernel.org/dri-devel/20210621184157.GB918146@ravnborg.org/
> >> 
> >>  drivers/gpu/drm/panel/panel-simple.c | 6 ++----
> >>  1 file changed, 2 insertions(+), 4 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/panel/panel-simple.c 
> >> b/drivers/gpu/drm/panel/panel-simple.c
> >> index 86e5a45..f966b562 100644
> >> --- a/drivers/gpu/drm/panel/panel-simple.c
> >> +++ b/drivers/gpu/drm/panel/panel-simple.c
> >> @@ -772,10 +772,8 @@ static int panel_simple_probe(struct device *dev, 
> >> const struct panel_desc *desc,
> >>  			desc->bpc != 8);
> >>  		break;
> >>  	case DRM_MODE_CONNECTOR_eDP:
> >> -		if (desc->bus_format == 0)
> >> -			dev_warn(dev, "Specify missing bus_format\n");
> >> -		if (desc->bpc != 6 && desc->bpc != 8)
> >> -			dev_warn(dev, "Expected bpc in {6,8} but got: %u\n", desc->bpc);
> >> +		if (desc->bpc != 6 && desc->bpc != 8 && desc->bpc != 10)
> >> +			dev_warn(dev, "Expected bpc in {6,8,10} but got: %u\n", desc->bpc);
> > 
> > You'll still get a warning is bpc == 0, is that intentional ?
> 
> This was not intentional, I missed considering bpc=0 case. As we are 
> removing the warning for bus_format=0 then a similar thing can be done 
> for the bpc=0 also. The bpc value should be a valid one if it is 
> specified. Unlike the bus_format, bpc has few possible values that can 
> be checked here along with 0. Please correct me if I misunderstood the 
> concept.
> I will fix this.

What's the point of specifying bpc if it's optional though ? Users of
the panel will need to support the case where bpc is set to 0. Have you
ensured that they all do ? Can they meaningfully use the bpc value if
they need to be ready to support bpc == 0 ?

-- 
Regards,

Laurent Pinchart
