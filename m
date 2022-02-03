Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 887BC4A8703
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Feb 2022 15:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351529AbiBCOxV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Feb 2022 09:53:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351527AbiBCOxS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Feb 2022 09:53:18 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6660C061714
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Feb 2022 06:53:17 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id h14so2361634plf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Feb 2022 06:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8qnnOceM2maKM4v0lSRw1xHTuBRgkTs7X+4u4TyFAGI=;
        b=mT8FyMffjwgFEfqNqfaAAgc08iUgWtx+YD3f3kKE2K+Upcs7PoWqjbbpFft36lFMot
         LkFLa9Q3+EEppuvpEzQzm6EOG5tB09kXhqabBoTbN9RYqUlMDPBTYB86QbLXjRW8gssh
         eiVinT+twyHtBQEfeRpzhYD/VG8mJaKn/SDmoQDOpBUCmJ7UzoLi+h/czKtdzhrmnS2r
         FhpLXur1gQk1lhyINuKNA3lAGDiReE7ADi3PR3erNA2jkrfbRNx6zORBU+fCfW7e/slj
         HhAFIK24SRSEPmXPRGB9/wMmivMzSk+RmUYzx2suoMZXfQGwHiEa3lr87W8xP7uN5QEM
         6Hkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8qnnOceM2maKM4v0lSRw1xHTuBRgkTs7X+4u4TyFAGI=;
        b=16D4vxLDdjvKctjPvu7m3zt4EXhwDmGHNuntRSa95xJ8zj2em6KRviuu0vS9OvJQ4H
         2goCqrXT8gd89vwTqULXejoGBx70m1TciEAetkrC+W4Ma54I1s1F+DkQfKFq9/AL9hbR
         4rfMfRzFswpY+FAwDFh6xBxRPQ1IZX9XO36PbZD2PulePF936ouFcov8Siic7iQcFBjB
         HRA2cgb1myvVn+WLs2isVa4In8Rn1ZELGw7u9xMfFCc2J9uu7AeBHbvJWa0XseL6kRfJ
         c6NkaF3K14UC9ko9koBp07cU5BZAY2mvcSykbF/mOLqkT3ZNTvSMXn6rl3s6tintIumW
         HSQA==
X-Gm-Message-State: AOAM531ZQepwQ5VNGkL1DX9krAYALclAaUJjOo1AKN4lsYr/DHiqd05H
        cX3KHEl3YTPgYKhUp10MIJdx
X-Google-Smtp-Source: ABdhPJxH+6KG3W9j50KVO7amcvvAvn/n7C/+nUlj7xSU1j/h/OoVhmEVNEidAm5IlJgkUZLD+ImB0g==
X-Received: by 2002:a17:902:bb83:: with SMTP id m3mr35765124pls.114.1643899997166;
        Thu, 03 Feb 2022 06:53:17 -0800 (PST)
Received: from thinkpad ([117.217.179.179])
        by smtp.gmail.com with ESMTPSA id g17sm11817434pfj.148.2022.02.03.06.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 06:53:16 -0800 (PST)
Date:   Thu, 3 Feb 2022 20:23:09 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Alex Elder <elder@ieee.org>
Cc:     mhi@lists.linux.dev, hemantk@codeaurora.org, bbhatt@codeaurora.org,
        quic_jhugo@quicinc.com, vinod.koul@linaro.org,
        bjorn.andersson@linaro.org, dmitry.baryshkov@linaro.org,
        skananth@codeaurora.org, vpernami@codeaurora.org,
        vbadigan@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/20] bus: mhi: ep: Add support for registering MHI
 endpoint client drivers
Message-ID: <20220203145309.GE6298@thinkpad>
References: <20211202113553.238011-1-manivannan.sadhasivam@linaro.org>
 <20211202113553.238011-7-manivannan.sadhasivam@linaro.org>
 <06628c19-7839-2719-3263-7ab2b4410502@ieee.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06628c19-7839-2719-3263-7ab2b4410502@ieee.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jan 05, 2022 at 06:27:33PM -0600, Alex Elder wrote:
> On 12/2/21 5:35 AM, Manivannan Sadhasivam wrote:
> > This commit adds support for registering MHI endpoint client drivers
> > with the MHI endpoint stack. MHI endpoint client drivers binds to one
> > or more MHI endpoint devices inorder to send and receive the upper-layer
> > protocol packets like IP packets, modem control messages, and diagnostics
> > messages over MHI bus.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >   drivers/bus/mhi/ep/main.c | 85 +++++++++++++++++++++++++++++++++++++++
> >   include/linux/mhi_ep.h    | 53 ++++++++++++++++++++++++
> >   2 files changed, 138 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> > index db664360c8ab..ce0f99f22058 100644
> > --- a/drivers/bus/mhi/ep/main.c
> > +++ b/drivers/bus/mhi/ep/main.c
> > @@ -193,9 +193,88 @@ void mhi_ep_unregister_controller(struct mhi_ep_cntrl *mhi_cntrl)
> >   }
> >   EXPORT_SYMBOL_GPL(mhi_ep_unregister_controller);
> > +static int mhi_ep_driver_probe(struct device *dev)
> > +{
> > +	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
> > +	struct mhi_ep_driver *mhi_drv = to_mhi_ep_driver(dev->driver);
> > +	struct mhi_ep_chan *ul_chan = mhi_dev->ul_chan;
> > +	struct mhi_ep_chan *dl_chan = mhi_dev->dl_chan;
> > +
> 
> Either ul_chan or dl_chan must be set, right?  Check this.
> Otherwise I think this looks OK.
> 

done

> 					-Alex
> 
> > +	if (ul_chan)
> > +		ul_chan->xfer_cb = mhi_drv->ul_xfer_cb;
> > +
> > +	if (dl_chan)
> > +		dl_chan->xfer_cb = mhi_drv->dl_xfer_cb;
> > +
> > +	return mhi_drv->probe(mhi_dev, mhi_dev->id);
> > +}
> 
> . . .
