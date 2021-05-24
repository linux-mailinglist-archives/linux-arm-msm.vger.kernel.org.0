Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 319AE38EF5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 May 2021 17:56:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234865AbhEXP5J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 11:57:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234261AbhEXP4N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 11:56:13 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC9EBC061142
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 08:08:18 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id d21so27298452oic.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 08:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Qd2GGNOqjcoVwR9/InTy3gHaTefuQ8PzIzZm4PfwF+Q=;
        b=pHUsCN/IDaId/ipsKoG3ZrMYVpOUrGYrLef0xTZtQqyz5XEMvN+lSpLTWg7jqjs6Jg
         8wJ0pQL7+XaAsnBMSaWQCy7vQ/ZJnhOkVL0wp8RSeBJ7P47eTtE07yeR4+A6SNbbViAa
         iet9G/GM1FfaXkBxAschybOUCLj4dh8QNh+vYyRua3BmM2eulhIfr9X1rl0wIRCwsWd+
         pISDWphupk3cSrSJvfwLRLkVetuRq3bdIaT1ju8SB684mx/GMUIuCsIkN5+XbviAupjL
         9P0mdNOzaKLEQ+SZt9yQ2d8SL3naZn+5M6s/xOz5hGkwU900zBI4ruNo/Nh5jzk7aRTk
         Bqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qd2GGNOqjcoVwR9/InTy3gHaTefuQ8PzIzZm4PfwF+Q=;
        b=X5D0+xK84Vd34LtoCTk3o6cCfma6DLBHfY4q8bR1tbgPVDfOnm1cdBr5IK+TXm4fxB
         S5suaKPDOX69Fw8dD2Nqv9gKcjCeVfOEEJIoOmYZ3FHmxYyv1BrIh5TzlIfpTboFZ+Wx
         dNUy4SGedbl68pDZqEqIoe4DFpTfsAAwBeYG5PDm3eP0t7XGGiv/O3JrEZP1GBJlMM2V
         23GNNL8fSbd8Os/rNIlQLPUcZFbyFoF4TMC844mhq+hqg2aSIloNETq70MTXsqeMEJj/
         6I7SrVynElfxrcm285gKX1DgtpsUvjUGrmxJi1eYSBDhh9OULX+/IIGg+7uZMsdoR5o2
         IuOw==
X-Gm-Message-State: AOAM5326tsma2WB6mNqv58vpb5x4ILhzzvL2/Hkkq5eqWzDulT5KLg93
        5RxgwJyAVF0sJK7qYTF3WdYwkg==
X-Google-Smtp-Source: ABdhPJzQwEXxT63vulS4Mr1iXuUiQVfsntslWby9WpFJQ1i6LL+g6rwKWyZorlvtptAuR0hvccJ5Xg==
X-Received: by 2002:aca:230e:: with SMTP id e14mr11102837oie.58.1621868898078;
        Mon, 24 May 2021 08:08:18 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n11sm2564001oom.1.2021.05.24.08.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 08:08:17 -0700 (PDT)
Date:   Mon, 24 May 2021 10:08:15 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
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
Message-ID: <20210524150815.GH2484@yoga>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-3-vkoul@kernel.org>
 <20210521144237.GZ2484@yoga>
 <YKtWM+BYeIA+P+55@vkoul-mobl.Dlink>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YKtWM+BYeIA+P+55@vkoul-mobl.Dlink>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 24 May 02:30 CDT 2021, Vinod Koul wrote:

> On 21-05-21, 09:42, Bjorn Andersson wrote:
> > On Fri 21 May 07:49 CDT 2021, Vinod Koul wrote:
> > 
> > > DSC enables streams to be compressed before we send to panel. This
> > > requires DSC enabled encoder and a panel to be present. So we add this
> > > information in board DTS and find if DSC can be enabled and the
> > > parameters required to configure DSC are added to binding document along
> > > with example
> > > 
> > > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > > ---
> > >  .../devicetree/bindings/display/msm/dsi.txt       | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/msm/dsi.txt b/Documentation/devicetree/bindings/display/msm/dsi.txt
> > > index b9a64d3ff184..83d2fb92267e 100644
> > > --- a/Documentation/devicetree/bindings/display/msm/dsi.txt
> > > +++ b/Documentation/devicetree/bindings/display/msm/dsi.txt
> > > @@ -48,6 +48,13 @@ Optional properties:
> > >  - pinctrl-n: the "sleep" pinctrl state
> > >  - ports: contains DSI controller input and output ports as children, each
> > >    containing one endpoint subnode.
> > > +- qcom,mdss-dsc-enabled: Display Stream Compression (DSC) is enabled
> > > +- qcom,mdss-slice-height: DSC slice height in pixels
> > > +- qcom,mdss-slice-width: DSC slice width in pixels
> > > +- qcom,mdss-slice-per-pkt: DSC slices per packet
> > > +- qcom,mdss-bit-per-component: DSC bits per component
> > > +- qcom,mdss-bit-per-pixel: DSC bits per pixel
> > > +- qcom,mdss-block-prediction-enable: Block prediction mode of DSC enabled
> > >  
> > >    DSI Endpoint properties:
> > >    - remote-endpoint: For port@0, set to phandle of the connected panel/bridge's
> > > @@ -188,6 +195,14 @@ Example:
> > >  		qcom,master-dsi;
> > >  		qcom,sync-dual-dsi;
> > >  
> > > +		qcom,mdss-dsc-enabled;
> > 
> > To me the activation of DSC seems to be a property of the panel.
> 
> I think there are three parts to the problem
> 1. Panel needs to support it

In the case of DP there's bits to be read in the panel to figure this
out, for DSI panels this seems like a property that the panel (driver)
should know about.

> 2. Host needs to support it

Right, so this needs to be known by the driver. My suggestion is that we
derive it from the compatible or from the HW version.

> 3. Someone needs to decide to use when both the above conditions are
> met.
> 
> There are cases where above 1, 2 will be satisfied, but we might be okay
> without DSC too.. so how to decide when to do DSC :)
> 

Can we describe those cases? E.g. is it because enabling DSC would not
cause a reduction in clock speed that's worth the effort? Or do we only
use DSC for DSI when it allows us to squeeze everything into a single
link?

Regards,
Bjorn

> I feel it is more of a system property. And I also think that these
> parameters here are host configuration and not really for panel...
> 
> > 
> > > +		qcom,mdss-slice-height = <16>;
> > > +		qcom,mdss-slice-width = <540>;
> > > +		qcom,mdss-slice-per-pkt = <1>;
> > > +		qcom,mdss-bit-per-component = <8>;
> > > +		qcom,mdss-bit-per-pixel = <8>;
> > > +		qcom,mdss-block-prediction-enable;
> > 
> > Which of these properties relates to the DSC encoder and what needs to
> > be agreed with the sink? Can't we derive e.g. bpp from the information
> > we have from the attached panel already?
> 
> Let me go back and check on this a bit more
> 
> Thanks
> -- 
> ~Vinod
