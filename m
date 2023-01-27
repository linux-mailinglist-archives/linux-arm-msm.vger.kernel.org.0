Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 852EC67DE19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 08:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232103AbjA0HAX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 02:00:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232142AbjA0HAO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 02:00:14 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76A9D222FF;
        Thu, 26 Jan 2023 23:00:13 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DB98361A04;
        Fri, 27 Jan 2023 07:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D29C433EF;
        Fri, 27 Jan 2023 07:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674802812;
        bh=bWVN+OTliEjC/t2AVEdhiTatxpI8RYyW/A4NxbNdTMg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Asnn3+OSDHyfYdubzgNrVsAHzWZR4c8hXSurNlKWoQDlQD9Fw/TdaJnfLmmdPolXU
         EXRIuPFPd6Iz/hvjCzuLpnP5cYdExrxqd2uMaRG5rP66EpM2N/sWaybsNLIfGx3+Rl
         9KJLZ6q+DEDQOdpwV9g5nL5OQdzGyzCVei0Fo+uUTxKuLvO1gwdMDsni9phlyEq5pI
         g34YsSpxClnnTkjINn8b0l/Q9aUM20m+qvrLPxA59FykuLRUWf0TTH/me5qcB8Jt5i
         fdu4sfrx3f++5w+YWJNSrq3eO/nshT0Uf677wkoHi4aylDIwJOTgrxNLFsYOrJ+UqD
         QHK1vl9LC+wZQ==
Date:   Fri, 27 Jan 2023 12:29:58 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Dan Carpenter <error27@gmail.com>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Alex Elder <elder@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <quic_jhugo@quicinc.com>, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: ep: Fix off by one in mhi_ep_process_cmd_ring()
Message-ID: <20230127065958.GG7809@thinkpad>
References: <Y9JH5sudiZWvbODv@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9JH5sudiZWvbODv@kili>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 26, 2023 at 12:29:10PM +0300, Dan Carpenter wrote:
> The > comparison should be changed to >= to prevent an out of bounds
> access into the mhi_cntrl->mhi_chan[] array.  The mhi_cntrl->mhi_chan[]
> array is allocated in mhi_ep_chan_init() and has mhi_cntrl->max_chan
> elements.
> 
> Fixes: 2527ad44ddb2 ("bus: mhi: ep: Check if the channel is supported by the controller")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied to mhi-next!

Thanks,
Mani

> ---
>  drivers/bus/mhi/ep/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index bcaaba97ef63..be2d56e7f392 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -125,7 +125,7 @@ static int mhi_ep_process_cmd_ring(struct mhi_ep_ring *ring, struct mhi_ring_ele
>  	ch_id = MHI_TRE_GET_CMD_CHID(el);
>  
>  	/* Check if the channel is supported by the controller */
> -	if ((ch_id > mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
> +	if ((ch_id >= mhi_cntrl->max_chan) || !mhi_cntrl->mhi_chan[ch_id].name) {
>  		dev_err(dev, "Channel (%u) not supported!\n", ch_id);
>  		return -ENODEV;
>  	}
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
