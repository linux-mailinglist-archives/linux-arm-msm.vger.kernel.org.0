Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80FA467DE01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 07:52:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231997AbjA0Gvz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 01:51:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbjA0Gv1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 01:51:27 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4446D76433;
        Thu, 26 Jan 2023 22:48:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 35CB5B81F6F;
        Fri, 27 Jan 2023 06:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E575C433D2;
        Fri, 27 Jan 2023 06:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674802107;
        bh=ImEmdtrITiGqr0EwO3aloF6fZCJwblF66hq5R064QP4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dA70ARvx61U/63DaDJQW3gEnyavdLxav//0f12V85sYmPDiVvpjpZ2R6Idzf4PoUE
         3vGccnPgSRJdBDqyhQZlARG2BHay6rEaXyCqw9nH6UzQODDA3+9spa2FLi2xLXNnsZ
         U0Ixp6ZFK/f2qmUWFIT+T33xFSP/pWu55Qe9zXTN0twagIgIMzqDR0s2mqMOQrkomE
         RyK1F/bUzIUILBXWyzYyo7Z3UZ5K7k5fDbW3KyTf5jV+fKyJuIW7a7KiYV7Fz/hJSI
         TLij+K/EO2qrwUE2DqErFfQjhNTFmXEPNbFEX6hQY8w1IpbJmHzZ2+kZ9BmCNoe+PW
         e/t/6zV3lshVg==
Date:   Fri, 27 Jan 2023 12:18:15 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Alex Elder <elder@linaro.org>
Cc:     Dan Carpenter <error27@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: Fix off by one in mhi_ep_process_cmd_ring()
Message-ID: <20230127064815.GD7809@thinkpad>
References: <Y9JH5sudiZWvbODv@kili>
 <b1891679-9a0d-2327-4e6a-e3dd262ca233@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1891679-9a0d-2327-4e6a-e3dd262ca233@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 26, 2023 at 07:26:32AM -0600, Alex Elder wrote:
> On 1/26/23 3:29 AM, Dan Carpenter wrote:
> > The > comparison should be changed to >= to prevent an out of bounds
> > access into the mhi_cntrl->mhi_chan[] array.  The mhi_cntrl->mhi_chan[]
> > array is allocated in mhi_ep_chan_init() and has mhi_cntrl->max_chan
> > elements.
> 
> You're right.  I scanned through that file and there
> are other spots that don't check that the channel ID
> is in range, though I think this is the one where it's
> reading it from an external source.  I.e., the other
> places are aleady known to be correct.  (Maybe Mani
> can comment.)
> 

Right. This is the only place we get the channel id from the host, so that's
why the check is needed only here.

> Reviewed-by: Alex Elder <elder@linaro.org>

Thanks,
Mani

> 
> > 
> > Fixes: 2527ad44ddb2 ("bus: mhi: ep: Check if the channel is supported by the controller")
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > ---
> >   drivers/bus/mhi/ep/main.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> > index bcaaba97ef63..be2d56e7f392 100644
> > --- a/drivers/bus/mhi/ep/main.c
> > +++ b/drivers/bus/mhi/ep/main.c
> > @@ -125,7 +125,7 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
> >   	ch_id = MHI_TRE_GET_CMD_CHID(el);
> >   	/* Check if the channel is supported by the controller */
> > -	if ((ch_id > mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
> > +	if ((ch_id >= mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
> >   		dev_err(dev, "Channel (%u) not supported!\n", ch_id);
> >   		return -ENODEV;
> >   	}
> 

-- 
மணிவண்ணன் சதாசிவம்
