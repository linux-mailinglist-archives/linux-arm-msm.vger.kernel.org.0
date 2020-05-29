Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F441E83AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 18:29:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727812AbgE2Q3F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 12:29:05 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61265 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbgE2Q3F (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 12:29:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590769744; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=++5XVB1edF20k7ZuQoruhRB+Yzom05jHCSFa/0b0SXY=; b=XeVHfJBcY7I9E9Mm+riVDY20PgJHj46OdwgJZ61zXXTtSJCpo20ZPq92ahMwLr70MoRTrF6L
 YawYyNjTIZS7oPybCm4bJF/Z88HM5ASPqd5U0tg2UdjHtOdAek6mrsY/1Z16HawhMP+11FRD
 FViDxBfeIn2VWgQBFbBgxCYaGfE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5ed1384f3131442d952d6354 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 May 2020 16:29:03
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 113ECC433C6; Fri, 29 May 2020 16:29:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jackp-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jackp)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B31CDC433C9;
        Fri, 29 May 2020 16:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B31CDC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jackp@codeaurora.org
Date:   Fri, 29 May 2020 09:28:56 -0700
From:   Jack Pham <jackp@codeaurora.org>
To:     Wesley Cheng <wcheng@codeaurora.org>
Cc:     robh+dt@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [RFC v3 1/3] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
Message-ID: <20200529162856.GA10327@jackp-linux.qualcomm.com>
References: <1590630363-3934-1-git-send-email-wcheng@codeaurora.org>
 <1590630363-3934-2-git-send-email-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590630363-3934-2-git-send-email-wcheng@codeaurora.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Wesley,

On Wed, May 27, 2020 at 06:46:01PM -0700, Wesley Cheng wrote:
> Some devices have USB compositions which may require multiple endpoints
> that support EP bursting.  HW defined TX FIFO sizes may not always be
> sufficient for these compositions.  By utilizing flexible TX FIFO
> allocation, this allows for endpoints to request the required FIFO depth to
> achieve higher bandwidth.  With some higher bMaxBurst configurations, using
> a larger TX FIFO size results in better TX throughput.
> 
> Ensure that one TX FIFO is reserved for every IN endpoint.  This allows for
> the FIFO logic to prevent running out of FIFO space.
> 
> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
> ---

<snip>

> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
> index 00746c2..9b09528 100644
> --- a/drivers/usb/dwc3/gadget.c
> +++ b/drivers/usb/dwc3/gadget.c
> @@ -540,6 +540,117 @@ static int dwc3_gadget_start_config(struct dwc3_ep *dep)
>  	return 0;
>  }
>  
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
> +static int dwc3_gadget_resize_tx_fifos(struct dwc3 *dwc, struct dwc3_ep *dep)

The 'dep' param should be sufficient; we can just get 'dwc' from
dep->dwc. That will make it more clear this function operates on each
endpoint that needs resizing.

> +{
> +	int ram1_depth, mdwidth, fifo_0_start, tmp, num_in_ep;
> +	int min_depth, remaining, fifo_size, mult = 1, fifo, max_packet = 1024;
> +
> +	if (!dwc->needs_fifo_resize)
> +		return 0;
> +
> +	/* resize IN endpoints except ep0 */
> +	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
> +		return 0;
> +
> +	/* Don't resize already resized IN endpoint */
> +	if (dep->fifo_depth)
> +		return 0;
> +
> +	ram1_depth = DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
> +	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
> +	/* MDWIDTH is represented in bits, we need it in bytes */
> +	mdwidth >>= 3;
> +
> +	if (((dep->endpoint.maxburst > 1) &&
> +			usb_endpoint_xfer_bulk(dep->endpoint.desc))
> +			|| usb_endpoint_xfer_isoc(dep->endpoint.desc))
> +		mult = 3;
> +
> +	if ((dep->endpoint.maxburst > 6) &&
> +			usb_endpoint_xfer_bulk(dep->endpoint.desc)
> +			&& dwc3_is_usb31(dwc))
> +		mult = 6;
> +
> +	/* FIFO size for a single buffer */
> +	fifo = (max_packet + mdwidth)/mdwidth;
> +	fifo++;
> +
> +	/* Calculate the number of remaining EPs w/o any FIFO */
> +	num_in_ep = dwc->num_eps/2;
> +	num_in_ep -= dwc->num_ep_resized;
> +	/* Ignore EP0 IN */
> +	num_in_ep--;
> +
> +	/* Reserve at least one FIFO for the number of IN EPs */
> +	min_depth = num_in_ep * (fifo+1);
> +	remaining = ram1_depth - min_depth - dwc->last_fifo_depth;
> +
> +	/* We've already reserved 1 FIFO per EP, so check what we can fit in
> +	 * addition to it.  If there is not enough remaining space, allocate
> +	 * all the remaining space to the EP.
> +	 */
> +	fifo_size = (mult-1) * fifo;
> +	if (remaining < fifo_size) {
> +		if (remaining > 0)
> +			fifo_size = remaining;
> +		else
> +			fifo_size = 0;
> +	}
> +
> +	fifo_size += fifo;
> +	fifo_size++;
> +	dep->fifo_depth = fifo_size;
> +
> +	/* Check if TXFIFOs start at non-zero addr */
> +	tmp = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
> +	fifo_0_start = DWC3_GTXFIFOSIZ_TXFSTADDR(tmp);
> +
> +	fifo_size |= (fifo_0_start + (dwc->last_fifo_depth << 16));
> +	if (dwc3_is_usb31(dwc))
> +		dwc->last_fifo_depth += DWC31_GTXFIFOSIZ_TXFDEP(fifo_size);
> +	else
> +		dwc->last_fifo_depth += DWC3_GTXFIFOSIZ_TXFDEP(fifo_size);
> +
> +	/* Check fifo size allocation doesn't exceed available RAM size. */
> +	if (dwc->last_fifo_depth >= ram1_depth) {
> +		dev_err(dwc->dev, "Fifosize(%d) > RAM size(%d) %s depth:%d\n",
> +				(dwc->last_fifo_depth * mdwidth), ram1_depth,
> +				dep->endpoint.name, fifo_size);

Use dev_WARN() here and eliminate the WARN_ON(1) below?

> +		if (dwc3_is_usb31(dwc))
> +			fifo_size = DWC31_GTXFIFOSIZ_TXFDEP(fifo_size);
> +		else
> +			fifo_size = DWC3_GTXFIFOSIZ_TXFDEP(fifo_size);
> +		dwc->last_fifo_depth -= fifo_size;
> +		dep->fifo_depth = 0;
> +		WARN_ON(1);
> +		return -ENOMEM;
> +	}
> +
> +	dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1), fifo_size);
> +	dwc->num_ep_resized++;
> +	return 0;
> +}
> +
>  static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
>  {
>  	const struct usb_ss_ep_comp_descriptor *comp_desc;
> @@ -620,6 +731,10 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
>  	int			ret;
>  
>  	if (!(dep->flags & DWC3_EP_ENABLED)) {
> +		ret = dwc3_gadget_resize_tx_fifos(dwc, dep);
> +		if (ret)
> +			return ret;
> +
>  		ret = dwc3_gadget_start_config(dep);
>  		if (ret)
>  			return ret;

Jack
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
