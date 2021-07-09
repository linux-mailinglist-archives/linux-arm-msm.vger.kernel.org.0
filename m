Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20DA83C1F07
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 07:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhGIFoJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 01:44:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:47104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229576AbhGIFoJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 01:44:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7531861441;
        Fri,  9 Jul 2021 05:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1625809286;
        bh=/CNQjpGPr/GvEiTEJ8KFSEyMdrlPYed6RJHrMeMrv6I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bW3yy0tyJZCVLwVleL9DGimD9FsKhumwwMTiN1W7YKeNL7lh6QZiBTqkuXzGt8EBk
         1CX5SOxgFIDic5awY0GDYZ6E31u4rgIXthJU1rrcjd1BrVMMBq08DZNRDVvEbsbJUA
         R7z/xeVGPBUjuq3Cs0AI5tSp/038IF0+CXJ8/Ibs=
Date:   Fri, 9 Jul 2021 07:41:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     robh+dt@kernel.org, frowand.list@gmail.com, balbi@kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        jackp@codeaurora.org, fntoth@gmail.com
Subject: Re: [PATCH v13 3/6] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
Message-ID: <YOfhg9FK8y72A/mw@kroah.com>
References: <1625790474-8376-1-git-send-email-wcheng@codeaurora.org>
 <1625790474-8376-4-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1625790474-8376-4-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 08, 2021 at 05:27:51PM -0700, Wesley Cheng wrote:
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index dccdf13..dd985ba 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1023,6 +1023,7 @@ struct dwc3_scratchpad_array {
>   * @rx_max_burst_prd: max periodic ESS receive burst size
>   * @tx_thr_num_pkt_prd: periodic ESS transmit packet count
>   * @tx_max_burst_prd: max periodic ESS transmit burst size
> + * @tx_fifo_resize_max_num: max number of fifos allocated during txfifo resize
>   * @hsphy_interface: "utmi" or "ulpi"
>   * @connected: true when we're connected to a host, false otherwise
>   * @delayed_status: true when gadget driver asks for delayed status
> @@ -1079,6 +1080,11 @@ struct dwc3_scratchpad_array {
>   * @dis_split_quirk: set to disable split boundary.
>   * @imod_interval: set the interrupt moderation interval in 250ns
>   *			increments or 0 to disable.
> + * @max_cfg_eps: current max number of IN eps used across all USB configs.
> + * @last_fifo_depth: last fifo depth used to determine next fifo ram start
> + *		     address.
> + * @num_ep_resized: carries the current number endpoints which have had its tx
> + *		    fifo resized.
>   */
>  struct dwc3 {
>  	struct work_struct	drd_work;
> @@ -1233,6 +1239,7 @@ struct dwc3 {
>  	u8			rx_max_burst_prd;
>  	u8			tx_thr_num_pkt_prd;
>  	u8			tx_max_burst_prd;
> +	u8			tx_fifo_resize_max_num;
>  
>  	const char		*hsphy_interface;
>  
> @@ -1246,6 +1253,7 @@ struct dwc3 {
>  	unsigned		is_utmi_l1_suspend:1;
>  	unsigned		is_fpga:1;
>  	unsigned		pending_events:1;
> +	unsigned		do_fifo_resize:1;
>  	unsigned		pullups_connected:1;
>  	unsigned		setup_packet_pending:1;
>  	unsigned		three_stage_setup:1;
> @@ -1281,6 +1289,10 @@ struct dwc3 {
>  	unsigned		dis_split_quirk:1;
>  
>  	u16			imod_interval;
> +
> +	int			max_cfg_eps;
> +	int			last_fifo_depth;
> +	int			num_ep_resized;
>  };
>  

You document 4 new variables being added, but add 5 variables to the
structure.  Something is out of sync :(
