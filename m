Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F44391006
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 07:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbhEZFea (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 01:34:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:43366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231211AbhEZFea (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 01:34:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 726CF613D6;
        Wed, 26 May 2021 05:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622007179;
        bh=8SADv53S7VfYOt5xV+Dwg3XKF+qQF9Y0tDVZlWUYjYw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Dh1A73MNy3dXKxMyPww0pLkXFI7oBGKb0GXSuF/T1xsCGN716siTCgW9t08biUp5G
         1CcCcIaE2rgB+E11zIBg9zTdA051pYW9dDbfOr6hTB0rIdUnsUcAppxON2/LUKceVY
         zacs4KPRhuf1LydAaWvXtV2jDjKZapzSfSa0L3C/GwX2tjhkZGkpxww6xpVbQY+Qh1
         gneFXxoxGGP691DAx+y+n9RkmZDrb1w/5qyEgihp7sTw5Feh4/SxBT/xg9eCZFcQMl
         Y4vTFi9VtVSYzMkhk2eAGQOdrlonr4Dey5NcAfDKtODYSmRZFGqQ39H4M8h/gQGnmg
         6Qar/KGWoZbZQ==
Date:   Wed, 26 May 2021 11:02:55 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 02/13] dt-bindings: msm/dsi: Document Display Stream
 Compression (DSC) parameters
Message-ID: <YK3dhxJD/10ag1ZQ@vkoul-mobl.Dlink>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-3-vkoul@kernel.org>
 <20210521144237.GZ2484@yoga>
 <YKtWM+BYeIA+P+55@vkoul-mobl.Dlink>
 <20210524150815.GH2484@yoga>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524150815.GH2484@yoga>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24-05-21, 10:08, Bjorn Andersson wrote:
> On Mon 24 May 02:30 CDT 2021, Vinod Koul wrote:
> 
> > On 21-05-21, 09:42, Bjorn Andersson wrote:
> > > On Fri 21 May 07:49 CDT 2021, Vinod Koul wrote:
> > > 
> > > > DSC enables streams to be compressed before we send to panel. This
> > > > requires DSC enabled encoder and a panel to be present. So we add this
> > > > information in board DTS and find if DSC can be enabled and the
> > > > parameters required to configure DSC are added to binding document along
> > > > with example
> > > > 
> > > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > > ---
> > > >  .../devicetree/bindings/display/msm/dsi.txt       | 15 +++++++++++++++
> > > >  1 file changed, 15 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> > > > index b9a64d3ff184..83d2fb92267e 100644
> > > > --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> > > > +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> > > > @@ -48,6 +48,13 @@ Optional properties:
> > > >  - pinctrl-n: the "sleep" pinctrl state
> > > >  - ports: contains DSI controller input and output ports as children, each
> > > >    containing one endpoint subnode.
> > > > +- qcom,mdss-dsc-enabled: Display Stream Compression (DSC) is enabled
> > > > +- qcom,mdss-slice-height: DSC slice height in pixels
> > > > +- qcom,mdss-slice-width: DSC slice width in pixels
> > > > +- qcom,mdss-slice-per-pkt: DSC slices per packet
> > > > +- qcom,mdss-bit-per-component: DSC bits per component
> > > > +- qcom,mdss-bit-per-pixel: DSC bits per pixel
> > > > +- qcom,mdss-block-prediction-enable: Block prediction mode of DSC enabled
> > > >  
> > > >    DSI Endpoint properties:
> > > >    - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
> > > > @@ -188,6 +195,14 @@ Example:
> > > >  		qcom,master-dsi;
> > > >  		qcom,sync-dual-dsi;
> > > >  
> > > > +		qcom,mdss-dsc-enabled;
> > > 
> > > To me the activation of DSC seems to be a property of the panel.
> > 
> > I think there are three parts to the problem
> > 1. Panel needs to support it
> 
> In the case of DP there's bits to be read in the panel to figure this
> out, for DSI panels this seems like a property that the panel (driver)
> should know about.

Yes panel should know..

> 
> > 2. Host needs to support it
> 
> Right, so this needs to be known by the driver. My suggestion is that we
> derive it from the compatible or from the HW version.

Okay

> 
> > 3. Someone needs to decide to use when both the above conditions are
> > met.
> > 
> > There are cases where above 1, 2 will be satisfied, but we might be okay
> > without DSC too.. so how to decide when to do DSC :)
> > 
> 
> Can we describe those cases? E.g. is it because enabling DSC would not
> cause a reduction in clock speed that's worth the effort? Or do we only
> use DSC for DSI when it allows us to squeeze everything into a single
> link?

I really dont know how and when we should decide that :-|
One thing we can do is that if both support then always enable and get
benefit of getting power and clock speed reduction.

With this, who should have slice and bpp settings, panel or host?

Thanks
-- 
~Vinod
