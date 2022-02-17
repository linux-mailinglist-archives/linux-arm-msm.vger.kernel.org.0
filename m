Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB27D4B9CF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 11:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239098AbiBQKU7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 05:20:59 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229767AbiBQKU6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 05:20:58 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96A022AB508
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Feb 2022 02:20:44 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id d16so4592537pgd.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Feb 2022 02:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PfXddq6crUAjk4q/yOfZPWVbLR8LpTt+WhTBLikNtHM=;
        b=jGpjNPo83KNp9c/8aLbHmCnk0WS3dYEZqwLtUWNkcXSuX9JKVNeCV0+nmq/LFZXhb2
         W9WOuLW9IxRBq8WcbT5axxhmcJ/y6fpJE1ZbR14poApacCZ8QUFn7QFaQyo7CaRpJygR
         RCfdsZRkIqD4ov/8rSdD0zRe6xiYa9MabtSvXDZooFYVW0pmj/xbRY4PUHcev4cSjGuU
         jPXueOHflPWWYNsCnnsQV90hgv23yIZB2rYfQ1gabr3Kux2t6deZme/wGhnQvmBGyp1A
         X4Bae6+kRoTccF3x4zqr7wJzj/AxuHFC5v2AKyaeXb/I+RUyA0S0ILwyn+BRcjsRLMS6
         7zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PfXddq6crUAjk4q/yOfZPWVbLR8LpTt+WhTBLikNtHM=;
        b=jWbDuXPkeEZ6/GxjWjUXCabdyt93N5aZVGX/GUyWeFLGv5xztU1mpNSTWMFZjn6+o2
         xBF2/uDrtsXuHrfuO1X9qujb3MMB7DDmGyQcUQIVaj0yXqNi9d3brLCWAAZQJXE6viba
         KlnB9s8GOMMc7uWp4/vcg1OI4wb6tJS/iKCtxXbD7uDL7PiQiK+dRxCVgL920nFLGrNa
         A5lJgTIEVDoYthTab4YbR7zDNEKsoSZFs+t8cwUqS+YH9Cl+1hwKT9lPKoW+hsPxUtHw
         Xo9P6uiy7JaCLyrILhayAcQPs/0R2FYQlq++se430QdIZTvg2tnlxzrBR35vaQtJopTu
         5mgA==
X-Gm-Message-State: AOAM533sB48Tjib6UUN+Fg/RURkLeMR5KFUyJmVimKqr50mxqoqpN/6n
        moFHaW8tVV0RlkjkjszIgy5f
X-Google-Smtp-Source: ABdhPJyLnqCjrt6JMCV6aqm3cu2VcNnwdhMcmqsokeeRWyB9A3U0Y0ZT2g69NeSNlQHuZ9Mk8gSrvg==
X-Received: by 2002:a63:2d82:0:b0:373:6b4:5fb8 with SMTP id t124-20020a632d82000000b0037306b45fb8mr1866188pgt.294.1645093243995;
        Thu, 17 Feb 2022 02:20:43 -0800 (PST)
Received: from workstation ([117.193.211.41])
        by smtp.gmail.com with ESMTPSA id h16sm18545769pfh.40.2022.02.17.02.20.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Feb 2022 02:20:43 -0800 (PST)
Date:   Thu, 17 Feb 2022 15:50:38 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     mhi@lists.linux.dev, quic_hemantk@quicinc.com,
        quic_bbhatt@quicinc.com, quic_jhugo@quicinc.com,
        vinod.koul@linaro.org, bjorn.andersson@linaro.org,
        dmitry.baryshkov@linaro.org, quic_vbadigan@quicinc.com,
        quic_cang@quicinc.com, quic_skananth@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 09/25] bus: mhi: ep: Add support for registering MHI
 endpoint client drivers
Message-ID: <20220217102038.GB11964@workstation>
References: <20220212182117.49438-1-manivannan.sadhasivam@linaro.org>
 <20220212182117.49438-10-manivannan.sadhasivam@linaro.org>
 <94abdf83-5749-14b1-7a57-ceceb1b27167@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <94abdf83-5749-14b1-7a57-ceceb1b27167@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 15, 2022 at 02:02:50PM -0600, Alex Elder wrote:

[...]

> > +static int mhi_ep_driver_remove(struct device *dev)
> > +{
> > +	struct mhi_ep_device *mhi_dev = to_mhi_ep_device(dev);
> > +	struct mhi_ep_driver *mhi_drv = to_mhi_ep_driver(dev->driver);
> > +	struct mhi_result result = {};
> > +	struct mhi_ep_chan *mhi_chan;
> > +	int dir;
> > +
> > +	/* Skip if it is a controller device */
> > +	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
> > +		return 0;
> > +
> 
> It would be my preference to encapsulate the body of the
> following loop into a called function, then call that once
> for the UL channel and once for the DL channel.
> 

This follows the host stack, so I'd like to keep it the same.

> > +	/* Disconnect the channels associated with the driver */
> > +	for (dir = 0; dir < 2; dir++) {
> > +		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
> > +
> > +		if (!mhi_chan)
> > +			continue;
> > +
> > +		mutex_lock(&mhi_chan->lock);
> > +		/* Send channel disconnect status to the client driver */
> > +		if (mhi_chan->xfer_cb) {
> > +			result.transaction_status = -ENOTCONN;
> > +			result.bytes_xferd = 0;
> > +			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
> 
> It appears the result is ignored here.  If so, can we
> define the xfer_cb() function so that a NULL pointer may
> be supplied by the caller in cases like this?
> 

result is not ignored, only the bytes_xfered. "transaction_status" will
be used by the client drivers for error handling.

> > +		}
> > +
> > +		/* Set channel state to DISABLED */
> 
> That comment is a little tautological.  Just omit it.
> 
> > +		mhi_chan->state = MHI_CH_STATE_DISABLED;
> > +		mhi_chan->xfer_cb = NULL;
> > +		mutex_unlock(&mhi_chan->lock);
> > +	}
> > +
> > +	/* Remove the client driver now */
> > +	mhi_drv->remove(mhi_dev);
> > +
> > +	return 0;
> > +}

[...]

> > +struct mhi_ep_driver {
> > +	const struct mhi_device_id *id_table;
> > +	struct device_driver driver;
> > +	int (*probe)(struct mhi_ep_device *mhi_ep,
> > +		     const struct mhi_device_id *id);
> > +	void (*remove)(struct mhi_ep_device *mhi_ep);
> 
> I get confused by the "ul" versus "dl" naming scheme here.
> Is "ul" from the perspective of the host, meaning upload
> is from the host toward the WWAN network (and therefore
> toward the SDX AP), and download is from the WWAN toward
> the host?  Somewhere this should be stated clearly in
> comments; maybe I just missed it.
> 

Yes UL and DL are as per host context. I didn't state this explicitly
since this is the MHI host stack behaviour but I'll add a comment for
clarity

Thanks,
Mani
