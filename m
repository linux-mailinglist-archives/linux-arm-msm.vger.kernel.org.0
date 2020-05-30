Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4B01E8E35
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2020 08:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728404AbgE3Gmt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 May 2020 02:42:49 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:45117 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728293AbgE3Gmt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 May 2020 02:42:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590820968; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=CVwez3TJzuI5Hz8YJYBg002P52Rbx2o2mf/O9S0LF6g=; b=W95pC1HWRVTVva42azF/u7Qr8JHnWAF+zWjQaqRV8j2wuV8mwAG+wQGbiipWueGHcIg6s146
 NA93HFlTqucv2MArFrfC0twnsru3ui4DvZR1hBN+EnmsHSaAQyGLRMZzpvebzvQInD1JqBls
 YUvdEuQLqSSCP9dR7nCDIK07QHk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5ed2005c50867324814d91dc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 30 May 2020 06:42:36
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 48103C433CA; Sat, 30 May 2020 06:42:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.93.207] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 36F48C433C6;
        Sat, 30 May 2020 06:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 36F48C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [RFC v3 1/3] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
To:     Jack Pham <jackp@codeaurora.org>
Cc:     robh+dt@kernel.org, bjorn.andersson@linaro.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, agross@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <1590630363-3934-1-git-send-email-wcheng@codeaurora.org>
 <1590630363-3934-2-git-send-email-wcheng@codeaurora.org>
 <20200529162856.GA10327@jackp-linux.qualcomm.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <4f4652c2-6fc0-c96d-35dc-ee1235aa4206@codeaurora.org>
Date:   Fri, 29 May 2020 23:42:33 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200529162856.GA10327@jackp-linux.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/29/2020 9:28 AM, Jack Pham wrote:
> Hi Wesley,
> 
> On Wed, May 27, 2020 at 06:46:01PM -0700, Wesley Cheng wrote:
>> Some devices have USB compositions which may require multiple endpoints
>> that support EP bursting.  HW defined TX FIFO sizes may not always be
>> sufficient for these compositions.  By utilizing flexible TX FIFO
>> allocation, this allows for endpoints to request the required FIFO depth to
>> achieve higher bandwidth.  With some higher bMaxBurst configurations, using
>> a larger TX FIFO size results in better TX throughput.
>>
>> Ensure that one TX FIFO is reserved for every IN endpoint.  This allows for
>> the FIFO logic to prevent running out of FIFO space.
>>
>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>> ---
> 
> <snip>
> 
>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>> index 00746c2..9b09528 100644
>> --- a/drivers/usb/dwc3/gadget.c
>> +++ b/drivers/usb/dwc3/gadget.c
>> @@ -540,6 +540,117 @@ static int dwc3_gadget_start_config(struct dwc3_ep *dep)
>>  	return 0;
>>  }
>>  
>> +/*
>> + * dwc3_gadget_resize_tx_fifos - reallocate fifo spaces for current use-case
>> + * @dwc: pointer to our context structure
>> + *
>> + * This function will a best effort FIFO allocation in order
>> + * to improve FIFO usage and throughput, while still allowing
>> + * us to enable as many endpoints as possible.
>> + *
>> + * Keep in mind that this operation will be highly dependent
>> + * on the configured size for RAM1 - which contains TxFifo -,
>> + * the amount of endpoints enabled on coreConsultant tool, and
>> + * the width of the Master Bus.
>> + *
>> + * In general, FIFO depths are represented with the following equation:
>> + *
>> + * fifo_size = mult * ((max_packet + mdwidth)/mdwidth + 1) + 1
>> + *
>> + * Conversions can be done to the equation to derive the number of packets that
>> + * will fit to a particular FIFO size value.
>> + */
>> +static int dwc3_gadget_resize_tx_fifos(struct dwc3 *dwc, struct dwc3_ep *dep)
> 
> The 'dep' param should be sufficient; we can just get 'dwc' from
> dep->dwc. That will make it more clear this function operates on each
> endpoint that needs resizing.
> 

Hi Jack,

Thanks for the inputs.  Sure, I agree with that.  Will make the changes
to pass in only the dep.

>> +{
>> +	int ram1_depth, mdwidth, fifo_0_start, tmp, num_in_ep;
>> +	int min_depth, remaining, fifo_size, mult = 1, fifo, max_packet = 1024;
>> +
>> +	if (!dwc->needs_fifo_resize)
>> +		return 0;
>> +
>> +	/* resize IN endpoints except ep0 */
>> +	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
>> +		return 0;
>> +
>> +	/* Don't resize already resized IN endpoint */
>> +	if (dep->fifo_depth)
>> +		return 0;
>> +
>> +	ram1_depth = DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
>> +	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
>> +	/* MDWIDTH is represented in bits, we need it in bytes */
>> +	mdwidth >>= 3;
>> +
>> +	if (((dep->endpoint.maxburst > 1) &&
>> +			usb_endpoint_xfer_bulk(dep->endpoint.desc))
>> +			|| usb_endpoint_xfer_isoc(dep->endpoint.desc))
>> +		mult = 3;
>> +
>> +	if ((dep->endpoint.maxburst > 6) &&
>> +			usb_endpoint_xfer_bulk(dep->endpoint.desc)
>> +			&& dwc3_is_usb31(dwc))
>> +		mult = 6;
>> +
>> +	/* FIFO size for a single buffer */
>> +	fifo = (max_packet + mdwidth)/mdwidth;
>> +	fifo++;
>> +
>> +	/* Calculate the number of remaining EPs w/o any FIFO */
>> +	num_in_ep = dwc->num_eps/2;
>> +	num_in_ep -= dwc->num_ep_resized;
>> +	/* Ignore EP0 IN */
>> +	num_in_ep--;
>> +
>> +	/* Reserve at least one FIFO for the number of IN EPs */
>> +	min_depth = num_in_ep * (fifo+1);
>> +	remaining = ram1_depth - min_depth - dwc->last_fifo_depth;
>> +
>> +	/* We've already reserved 1 FIFO per EP, so check what we can fit in
>> +	 * addition to it.  If there is not enough remaining space, allocate
>> +	 * all the remaining space to the EP.
>> +	 */
>> +	fifo_size = (mult-1) * fifo;
>> +	if (remaining < fifo_size) {
>> +		if (remaining > 0)
>> +			fifo_size = remaining;
>> +		else
>> +			fifo_size = 0;
>> +	}
>> +
>> +	fifo_size += fifo;
>> +	fifo_size++;
>> +	dep->fifo_depth = fifo_size;
>> +
>> +	/* Check if TXFIFOs start at non-zero addr */
>> +	tmp = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
>> +	fifo_0_start = DWC3_GTXFIFOSIZ_TXFSTADDR(tmp);
>> +
>> +	fifo_size |= (fifo_0_start + (dwc->last_fifo_depth << 16));
>> +	if (dwc3_is_usb31(dwc))
>> +		dwc->last_fifo_depth += DWC31_GTXFIFOSIZ_TXFDEP(fifo_size);
>> +	else
>> +		dwc->last_fifo_depth += DWC3_GTXFIFOSIZ_TXFDEP(fifo_size);
>> +
>> +	/* Check fifo size allocation doesn't exceed available RAM size. */
>> +	if (dwc->last_fifo_depth >= ram1_depth) {
>> +		dev_err(dwc->dev, "Fifosize(%d) > RAM size(%d) %s depth:%d\n",
>> +				(dwc->last_fifo_depth * mdwidth), ram1_depth,
>> +				dep->endpoint.name, fifo_size);
> 
> Use dev_WARN() here and eliminate the WARN_ON(1) below?
> 

I think we can just remove the WARN_ON() entirely, and keep the
dev_err().  Printing the callstack might not be really useful in
general, since this would only be called during the EP enable step.


>> +		if (dwc3_is_usb31(dwc))
>> +			fifo_size = DWC31_GTXFIFOSIZ_TXFDEP(fifo_size);
>> +		else
>> +			fifo_size = DWC3_GTXFIFOSIZ_TXFDEP(fifo_size);
>> +		dwc->last_fifo_depth -= fifo_size;
>> +		dep->fifo_depth = 0;
>> +		WARN_ON(1);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1), fifo_size);
>> +	dwc->num_ep_resized++;
>> +	return 0;
>> +}
>> +
>>  static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
>>  {
>>  	const struct usb_ss_ep_comp_descriptor *comp_desc;
>> @@ -620,6 +731,10 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
>>  	int			ret;
>>  
>>  	if (!(dep->flags & DWC3_EP_ENABLED)) {
>> +		ret = dwc3_gadget_resize_tx_fifos(dwc, dep);
>> +		if (ret)
>> +			return ret;
>> +
>>  		ret = dwc3_gadget_start_config(dep);
>>  		if (ret)
>>  			return ret;
> 
> Jack
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
