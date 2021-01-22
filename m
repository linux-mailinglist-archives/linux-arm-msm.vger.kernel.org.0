Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35D233009A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jan 2021 18:31:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728302AbhAVRYR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jan 2021 12:24:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729802AbhAVRM6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jan 2021 12:12:58 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFF51C061788
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jan 2021 09:12:17 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id 9so6739410oiq.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jan 2021 09:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=hzsoQpB731t5m6gkhI0N9zWunnu+kCmRxUePB+FtpOI=;
        b=Yx700cyo/8decCJdounTtQp3Zpfypbq5L8484mcY0rIX7DoNV1A/GoLbMii6+ZrD7r
         zgxrCqbTgUrQKN4l56Hetze76SxhAtkTou4KqIdBZvdIQDmmdnkIyOGMxeej3XRuGgXG
         /kiGQ5bG3qOwuZpJqL2J2wPtMW3yGw2U/z25dIMiCWwqrPWU0K/7quiORw3OGWo5mAMe
         PnPYkzWEeHku/3cBbwlj9ICMwRvCDPINCZG3DirZPg/qoWa+zEg8HPSMk8Nx86fRsm0M
         OO7g3UeAOrVr/0CBtpcFeW3OOnb7qsYaHfR8vwCzBxPtuMYbvYsEOwlzmUip16rdtQLu
         GocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=hzsoQpB731t5m6gkhI0N9zWunnu+kCmRxUePB+FtpOI=;
        b=Ypkv/9O10VmPRHVnVF/2xNRtx/01z1ON+LkmBDKStWOFpmFZBz+U4ddvzz1SB4flkL
         X6Crw5jnUwpQU1gLP61IpOyjPA/MPdEtCkYIgKSoPca70bp8TJgDV4ICvo5KaD9mraKv
         lbZQmOeGIjztSVZYDlKjzXnQnAiREMvNUnB0ioKTqh6Rdvx2ZXQEq+bNKwLhTU63jJSl
         MA+rl/NWyW516lrQk8vLLjfWExmvFCfSv+rMgepZ+KW0r+S2g4cuv3aXRrEDg/k9qmNP
         /4KX6H5Hg+KMhckz6nZzMZajQPepKECGza6fLh+RNVS5JVk9a7n8c2OBK8aaF0k1bK7T
         ryAw==
X-Gm-Message-State: AOAM531cZe9LB+b9vtXTMWuIgClE0cbDp27UBHWOzat3zyAhjEcT/QEc
        6VXPjW3IVN6FWWhQZPfZ2+4knQ==
X-Google-Smtp-Source: ABdhPJzfFiRh468S0u8ErTjjLAnYpQA22g2WrjE36ZwkfWSARXbCrdvFNszueHL7TfxMZExV1j6UPw==
X-Received: by 2002:aca:4d93:: with SMTP id a141mr3814846oib.107.1611335536630;
        Fri, 22 Jan 2021 09:12:16 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c18sm470854oov.20.2021.01.22.09.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 09:12:16 -0800 (PST)
Date:   Fri, 22 Jan 2021 11:12:14 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org, robh+dt@kernel.org,
        agross@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, peter.chen@nxp.com,
        jackp@codeaurora.org
Subject: Re: [PATCH v6 3/4] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
Message-ID: <YAsHbj/mITeiY5Cq@builder.lan>
References: <1611288100-31118-1-git-send-email-wcheng@codeaurora.org>
 <1611288100-31118-4-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611288100-31118-4-git-send-email-wcheng@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 21 Jan 22:01 CST 2021, Wesley Cheng wrote:

> Some devices have USB compositions which may require multiple endpoints
> that support EP bursting.  HW defined TX FIFO sizes may not always be
> sufficient for these compositions.  By utilizing flexible TX FIFO
> allocation, this allows for endpoints to request the required FIFO depth to
> achieve higher bandwidth.  With some higher bMaxBurst configurations, using
> a larger TX FIFO size results in better TX throughput.
> 
> By introducing the check_config() callback, the resizing logic can fetch
> the maximum number of endpoints used in the USB composition (can contain
> multiple configurations), which helps ensure that the resizing logic can
> fulfill the configuration(s), or return an error to the gadget layer
> otherwise during bind time.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---
>  drivers/usb/dwc3/core.c   |   2 +
>  drivers/usb/dwc3/core.h   |   8 ++
>  drivers/usb/dwc3/ep0.c    |   2 +
>  drivers/usb/dwc3/gadget.c | 194 ++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 206 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 6969196..e7fa6af 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1284,6 +1284,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>  				&tx_thr_num_pkt_prd);
>  	device_property_read_u8(dev, "snps,tx-max-burst-prd",
>  				&tx_max_burst_prd);
> +	dwc->needs_fifo_resize = device_property_read_bool(dev,
> +							   "tx-fifo-resize");

Under what circumstances should we specify this? And in particular are
there scenarios (in the Qualcomm platforms) where this must not be set?

In particular, the composition can be changed in runtime, so should we
set this for all Qualcomm platforms?

And if that's the case, can we not just set it from the qcom driver?

Regards,
Bjorn

>  
>  	dwc->disable_scramble_quirk = device_property_read_bool(dev,
>  				"snps,disable_scramble_quirk");
> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
> index eec1cf4..983b2fd4 100644
> --- a/drivers/usb/dwc3/core.h
> +++ b/drivers/usb/dwc3/core.h
> @@ -1223,6 +1223,7 @@ struct dwc3 {
>  	unsigned		is_utmi_l1_suspend:1;
>  	unsigned		is_fpga:1;
>  	unsigned		pending_events:1;
> +	unsigned		needs_fifo_resize:1;
>  	unsigned		pullups_connected:1;
>  	unsigned		setup_packet_pending:1;
>  	unsigned		three_stage_setup:1;
> @@ -1257,6 +1258,10 @@ struct dwc3 {
>  	unsigned		dis_split_quirk:1;
>  
>  	u16			imod_interval;
> +
> +	int			max_cfg_eps;
> +	int			last_fifo_depth;
> +	int			num_ep_resized;
>  };
>  
>  #define INCRX_BURST_MODE 0
> @@ -1471,6 +1476,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
>  		struct dwc3_gadget_ep_cmd_params *params);
>  int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
>  		u32 param);
> +void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc);
>  #else
>  static inline int dwc3_gadget_init(struct dwc3 *dwc)
>  { return 0; }
> @@ -1490,6 +1496,8 @@ static inline int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
>  static inline int dwc3_send_gadget_generic_command(struct dwc3 *dwc,
>  		int cmd, u32 param)
>  { return 0; }
> +static inline void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)
> +{ }
>  #endif
>  
>  #if IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
> index 8b668ef..4f216bd 100644
> --- a/drivers/usb/dwc3/ep0.c
> +++ b/drivers/usb/dwc3/ep0.c
> @@ -616,6 +616,8 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
>  		return -EINVAL;
>  
>  	case USB_STATE_ADDRESS:
> +		dwc3_gadget_clear_tx_fifos(dwc);
> +
>  		ret = dwc3_ep0_delegate_req(dwc, ctrl);
>  		/* if the cfg matches and the cfg is non zero */
>  		if (cfg && (!ret || (ret == USB_GADGET_DELAYED_STATUS))) {
> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 86f257f..26f9d64 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -615,6 +615,161 @@ static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
>  static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
>  		bool interrupt);
>  
> +static int dwc3_gadget_calc_tx_fifo_size(struct dwc3 *dwc, int mult)
> +{
> +	int max_packet = 1024;
> +	int fifo_size;
> +	int mdwidth;
> +
> +	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
> +	/* MDWIDTH is represented in bits, we need it in bytes */
> +	mdwidth >>= 3;
> +
> +	fifo_size = mult * ((max_packet + mdwidth) / mdwidth) + 1;
> +	return fifo_size;
> +}
> +
> +void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)
> +{
> +	struct dwc3_ep *dep;
> +	int fifo_depth;
> +	int size;
> +	int num;
> +
> +	if (!dwc->needs_fifo_resize)
> +		return;
> +
> +	/* Read ep0IN related TXFIFO size */
> +	dep = dwc->eps[1];
> +	size = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
> +	if (DWC3_IP_IS(DWC31))
> +		fifo_depth = DWC31_GTXFIFOSIZ_TXFDEP(size);
> +	else
> +		fifo_depth = DWC3_GTXFIFOSIZ_TXFDEP(size);
> +
> +	dwc->last_fifo_depth = fifo_depth;
> +	/* Clear existing TXFIFO for all IN eps except ep0 */
> +	for (num = 3; num < min_t(int, dwc->num_eps, DWC3_ENDPOINTS_NUM);
> +	     num += 2) {
> +		dep = dwc->eps[num];
> +		/* Don't change TXFRAMNUM on usb31 version */
> +		size = DWC3_IP_IS(DWC31) ?
> +			dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1)) &
> +				   DWC31_GTXFIFOSIZ_TXFRAMNUM : 0;
> +
> +		dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1), size);
> +	}
> +	dwc->num_ep_resized = 0;
> +}
> +
> +/*
> + * dwc3_gadget_resize_tx_fifos - reallocate fifo spaces for current use-case
> + * @dwc: pointer to our context structure
> + *
> + * This function will a best effort FIFO allocation in order
> + * to improve FIFO usage and throughput, while still allowing
> + * us to enable as many endpoints as possible.
> + *
> + * Keep in mind that this operation will be highly dependent
> + * on the configured size for RAM1 - which contains TxFifo -,
> + * the amount of endpoints enabled on coreConsultant tool, and
> + * the width of the Master Bus.
> + *
> + * In general, FIFO depths are represented with the following equation:
> + *
> + * fifo_size = mult * ((max_packet + mdwidth)/mdwidth + 1) + 1
> + *
> + * Conversions can be done to the equation to derive the number of packets that
> + * will fit to a particular FIFO size value.
> + */
> +static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
> +{
> +	struct dwc3 *dwc = dep->dwc;
> +	int fifo_0_start;
> +	int ram1_depth;
> +	int fifo_size;
> +	int min_depth;
> +	int num_in_ep;
> +	int remaining;
> +	int mult = 1;
> +	int fifo;
> +	int tmp;
> +
> +	if (!dwc->needs_fifo_resize)
> +		return 0;
> +
> +	/* resize IN endpoints except ep0 */
> +	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
> +		return 0;
> +
> +	ram1_depth = DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
> +
> +	if ((dep->endpoint.maxburst > 1 &&
> +	     usb_endpoint_xfer_bulk(dep->endpoint.desc)) ||
> +	    usb_endpoint_xfer_isoc(dep->endpoint.desc))
> +		mult = 3;
> +
> +	if (dep->endpoint.maxburst > 6 &&
> +	    usb_endpoint_xfer_bulk(dep->endpoint.desc) && DWC3_IP_IS(DWC31))
> +		mult = 6;
> +
> +	/* FIFO size for a single buffer */
> +	fifo = dwc3_gadget_calc_tx_fifo_size(dwc, 1);
> +
> +	/* Calculate the number of remaining EPs w/o any FIFO */
> +	num_in_ep = dwc->max_cfg_eps;
> +	num_in_ep -= dwc->num_ep_resized;
> +
> +	/* Reserve at least one FIFO for the number of IN EPs */
> +	min_depth = num_in_ep * (fifo + 1);
> +	remaining = ram1_depth - min_depth - dwc->last_fifo_depth;
> +
> +	/*
> +	 * We've already reserved 1 FIFO per EP, so check what we can fit in
> +	 * addition to it.  If there is not enough remaining space, allocate
> +	 * all the remaining space to the EP.
> +	 */
> +	fifo_size = (mult - 1) * fifo;
> +	if (remaining < fifo_size) {
> +		if (remaining > 0)
> +			fifo_size = remaining;
> +		else
> +			fifo_size = 0;
> +	}
> +
> +	fifo_size += fifo;
> +	/* Last increment according to the TX FIFO size equation */
> +	fifo_size++;
> +
> +	/* Check if TXFIFOs start at non-zero addr */
> +	tmp = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
> +	fifo_0_start = DWC3_GTXFIFOSIZ_TXFSTADDR(tmp);
> +
> +	fifo_size |= (fifo_0_start + (dwc->last_fifo_depth << 16));
> +	if (DWC3_IP_IS(DWC31))
> +		dwc->last_fifo_depth += DWC31_GTXFIFOSIZ_TXFDEP(fifo_size);
> +	else
> +		dwc->last_fifo_depth += DWC3_GTXFIFOSIZ_TXFDEP(fifo_size);
> +
> +	/* Check fifo size allocation doesn't exceed available RAM size. */
> +	if (dwc->last_fifo_depth >= ram1_depth) {
> +		dev_err(dwc->dev, "Fifosize(%d) > RAM size(%d) %s depth:%d\n",
> +			dwc->last_fifo_depth, ram1_depth,
> +			dep->endpoint.name, fifo_size);
> +		if (DWC3_IP_IS(DWC31))
> +			fifo_size = DWC31_GTXFIFOSIZ_TXFDEP(fifo_size);
> +		else
> +			fifo_size = DWC3_GTXFIFOSIZ_TXFDEP(fifo_size);
> +		dwc->last_fifo_depth -= fifo_size;
> +		return -ENOMEM;
> +	}
> +
> +	dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1), fifo_size);
> +	dwc->num_ep_resized++;
> +
> +	return 0;
> +}
> +
>  /**
>   * __dwc3_gadget_ep_enable - initializes a hw endpoint
>   * @dep: endpoint to be initialized
> @@ -632,6 +787,10 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
>  	int			ret;
>  
>  	if (!(dep->flags & DWC3_EP_ENABLED)) {
> +		ret = dwc3_gadget_resize_tx_fifos(dep);
> +		if (ret)
> +			return ret;
> +
>  		ret = dwc3_gadget_start_config(dep);
>  		if (ret)
>  			return ret;
> @@ -2418,6 +2577,7 @@ static int dwc3_gadget_stop(struct usb_gadget *g)
>  
>  	spin_lock_irqsave(&dwc->lock, flags);
>  	dwc->gadget_driver	= NULL;
> +	dwc->max_cfg_eps = 0;
>  	spin_unlock_irqrestore(&dwc->lock, flags);
>  
>  	free_irq(dwc->irq_gadget, dwc->ev_buf);
> @@ -2485,6 +2645,39 @@ static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA)
>  	return 0;
>  }
>  
> +static int dwc3_gadget_check_config(struct usb_gadget *g, unsigned long ep_map)
> +{
> +	struct dwc3 *dwc = gadget_to_dwc(g);
> +	unsigned long in_ep_map;
> +	int fifo_size = 0;
> +	int ram1_depth;
> +	int ep_num;
> +
> +	if (!dwc->needs_fifo_resize)
> +		return 0;
> +
> +	/* Only interested in the IN endpoints */
> +	in_ep_map = ep_map >> 16;
> +	ep_num = hweight_long(in_ep_map);
> +
> +	if (ep_num <= dwc->max_cfg_eps)
> +		return 0;
> +
> +	/* Update the max number of eps in the composition */
> +	dwc->max_cfg_eps = ep_num;
> +
> +	fifo_size = dwc3_gadget_calc_tx_fifo_size(dwc, dwc->max_cfg_eps);
> +	/* Based on the equation, increment by one for every ep */
> +	fifo_size += dwc->max_cfg_eps;
> +
> +	/* Check if we can fit a single fifo per endpoint */
> +	ram1_depth = DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
> +	if (fifo_size > ram1_depth)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
>  static const struct usb_gadget_ops dwc3_gadget_ops = {
>  	.get_frame		= dwc3_gadget_get_frame,
>  	.wakeup			= dwc3_gadget_wakeup,
> @@ -2495,6 +2688,7 @@ static const struct usb_gadget_ops dwc3_gadget_ops = {
>  	.udc_set_speed		= dwc3_gadget_set_speed,
>  	.get_config_params	= dwc3_gadget_config_params,
>  	.vbus_draw		= dwc3_gadget_vbus_draw,
> +	.check_config		= dwc3_gadget_check_config,
>  };
>  
>  /* -------------------------------------------------------------------------- */
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
