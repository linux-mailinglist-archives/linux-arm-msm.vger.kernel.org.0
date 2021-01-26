Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AC653054AE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Jan 2021 08:30:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234008AbhA0Ha2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Jan 2021 02:30:28 -0500
Received: from m42-8.mailgun.net ([69.72.42.8]:10918 "EHLO m42-8.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S317109AbhA0A2i (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jan 2021 19:28:38 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1611707282; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3NbBXVD94SUl01QlKKeDLA+dv1N49uWdliK3fbVFLPk=; b=pHY2OH1yY1a9EOPeNmSxc7mup2G4eTqMCR3PnIZoMxvHXUOHMepActH81J+j4QiB9UTTCnNB
 sLJIVUfSG6IqwN40SXY9XNvHnXWb1wnmJt++8MeC/DS8WazTJ8qwls5K7+T9ABof+5PBZcgg
 dwiewpOQltYfSACTI8i3ME43EAA=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6010a546bdcf468287f30a76 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Jan 2021 23:27:01
 GMT
Sender: wcheng=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E005EC43464; Tue, 26 Jan 2021 23:27:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.110.78.65] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9149C433CA;
        Tue, 26 Jan 2021 23:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9149C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v6 3/4] usb: dwc3: Resize TX FIFOs to meet EP bursting
 requirements
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "agross@kernel.org" <agross@kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
Cc:     "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "peter.chen@nxp.com" <peter.chen@nxp.com>,
        "jackp@codeaurora.org" <jackp@codeaurora.org>
References: <1611288100-31118-1-git-send-email-wcheng@codeaurora.org>
 <1611288100-31118-4-git-send-email-wcheng@codeaurora.org>
 <e5b444f6-c754-eaea-4a63-cace6fbc2def@synopsys.com>
 <61a178a4-d8f8-c089-9c60-a82b33bd333e@codeaurora.org>
 <737c09fe-e5fa-91c2-11b6-37c913ddbc83@synopsys.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <f3a6fa98-4596-8b5a-57a5-f9448869f524@codeaurora.org>
Date:   Tue, 26 Jan 2021 15:26:56 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <737c09fe-e5fa-91c2-11b6-37c913ddbc83@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/26/2021 12:43 PM, Thinh Nguyen wrote:
> Wesley Cheng wrote:
>>
>> On 1/22/2021 4:15 PM, Thinh Nguyen wrote:
>>> Hi,
>>>
>>> Wesley Cheng wrote:
>>>> Some devices have USB compositions which may require multiple endpoints
>>>> that support EP bursting.  HW defined TX FIFO sizes may not always be
>>>> sufficient for these compositions.  By utilizing flexible TX FIFO
>>>> allocation, this allows for endpoints to request the required FIFO depth to
>>>> achieve higher bandwidth.  With some higher bMaxBurst configurations, using
>>>> a larger TX FIFO size results in better TX throughput.
>>>>
>>>> By introducing the check_config() callback, the resizing logic can fetch
>>>> the maximum number of endpoints used in the USB composition (can contain
>>>> multiple configurations), which helps ensure that the resizing logic can
>>>> fulfill the configuration(s), or return an error to the gadget layer
>>>> otherwise during bind time.
>>>>
>>>> Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
>>>> ---
>>>>  drivers/usb/dwc3/core.c   |   2 +
>>>>  drivers/usb/dwc3/core.h   |   8 ++
>>>>  drivers/usb/dwc3/ep0.c    |   2 +
>>>>  drivers/usb/dwc3/gadget.c | 194 ++++++++++++++++++++++++++++++++++++++++++++++
>>>>  4 files changed, 206 insertions(+)
>>>>
>>>> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
>>>> index 6969196..e7fa6af 100644
>>>> --- a/drivers/usb/dwc3/core.c
>>>> +++ b/drivers/usb/dwc3/core.c
>>>> @@ -1284,6 +1284,8 @@ static void dwc3_get_properties(struct dwc3 *dwc)
>>>>  				&tx_thr_num_pkt_prd);
>>>>  	device_property_read_u8(dev, "snps,tx-max-burst-prd",
>>>>  				&tx_max_burst_prd);
>>>> +	dwc->needs_fifo_resize = device_property_read_bool(dev,
>>>> +							   "tx-fifo-resize");
>>>>  
>>>>  	dwc->disable_scramble_quirk = device_property_read_bool(dev,
>>>>  				"snps,disable_scramble_quirk");
>>>> diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
>>>> index eec1cf4..983b2fd4 100644
>>>> --- a/drivers/usb/dwc3/core.h
>>>> +++ b/drivers/usb/dwc3/core.h
>>>> @@ -1223,6 +1223,7 @@ struct dwc3 {
>>>>  	unsigned		is_utmi_l1_suspend:1;
>>>>  	unsigned		is_fpga:1;
>>>>  	unsigned		pending_events:1;
>>>> +	unsigned		needs_fifo_resize:1;
>>> The prefix "need" sounds like a requirement, but I don't think it is the
>>> case here. I think "do" would be a better prefix here.
>>>
>> Hi Thinh,
>>
>> Sure, that is true, since this may be an optional flag for certain
>> platforms.
>>
>>>>  	unsigned		pullups_connected:1;
>>>>  	unsigned		setup_packet_pending:1;
>>>>  	unsigned		three_stage_setup:1;
>>>> @@ -1257,6 +1258,10 @@ struct dwc3 {
>>>>  	unsigned		dis_split_quirk:1;
>>>>  
>>>>  	u16			imod_interval;
>>>> +
>>>> +	int			max_cfg_eps;
>>>> +	int			last_fifo_depth;
>>>> +	int			num_ep_resized;
>>>>  };
>>> Please document these new fields.
>>>
>> Will do.
>>
>>>>  
>>>>  #define INCRX_BURST_MODE 0
>>>> @@ -1471,6 +1476,7 @@ int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
>>>>  		struct dwc3_gadget_ep_cmd_params *params);
>>>>  int dwc3_send_gadget_generic_command(struct dwc3 *dwc, unsigned int cmd,
>>>>  		u32 param);
>>>> +void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc);
>>>>  #else
>>>>  static inline int dwc3_gadget_init(struct dwc3 *dwc)
>>>>  { return 0; }
>>>> @@ -1490,6 +1496,8 @@ static inline int dwc3_send_gadget_ep_cmd(struct dwc3_ep *dep, unsigned int cmd,
>>>>  static inline int dwc3_send_gadget_generic_command(struct dwc3 *dwc,
>>>>  		int cmd, u32 param)
>>>>  { return 0; }
>>>> +static inline void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)
>>>> +{ }
>>>>  #endif
>>>>  
>>>>  #if IS_ENABLED(CONFIG_USB_DWC3_DUAL_ROLE)
>>>> diff --git a/drivers/usb/dwc3/ep0.c b/drivers/usb/dwc3/ep0.c
>>>> index 8b668ef..4f216bd 100644
>>>> --- a/drivers/usb/dwc3/ep0.c
>>>> +++ b/drivers/usb/dwc3/ep0.c
>>>> @@ -616,6 +616,8 @@ static int dwc3_ep0_set_config(struct dwc3 *dwc, struct usb_ctrlrequest *ctrl)
>>>>  		return -EINVAL;
>>>>  
>>>>  	case USB_STATE_ADDRESS:
>>>> +		dwc3_gadget_clear_tx_fifos(dwc);
>>>> +
>>>>  		ret = dwc3_ep0_delegate_req(dwc, ctrl);
>>>>  		/* if the cfg matches and the cfg is non zero */
>>>>  		if (cfg && (!ret || (ret == USB_GADGET_DELAYED_STATUS))) {
>>>> diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
>>>> index 86f257f..26f9d64 100644
>>>> --- a/drivers/usb/dwc3/gadget.c
>>>> +++ b/drivers/usb/dwc3/gadget.c
>>>> @@ -615,6 +615,161 @@ static int dwc3_gadget_set_ep_config(struct dwc3_ep *dep, unsigned int action)
>>>>  static void dwc3_stop_active_transfer(struct dwc3_ep *dep, bool force,
>>>>  		bool interrupt);
>>>>  
>>>> +static int dwc3_gadget_calc_tx_fifo_size(struct dwc3 *dwc, int mult)
>>> Can you document what this function does?
>>>
>> Will do.
>>
>>>> +{
>>>> +	int max_packet = 1024;
>>> Maybe you can also document why you chose 1024 (e.g. applicable to
>>> Enhanced SuperSpeed only?).
>>>
>> Sure.  Its basically applicable for SS and isoc (hs/ss) use cases since
>> max packet size is 1024 in both cases.
> 
> Highspeed bulk MPS is 512. Fullspeed varies more (bulk max MPS is 64 and
> isoc is 1023).
> 
> However, we can keep it simple with 1024 as if it's ok to over estimate.
> Just need to note that here.
> 
>>
>>>> +	int fifo_size;
>>>> +	int mdwidth;
>>>> +
>>>> +	mdwidth = DWC3_MDWIDTH(dwc->hwparams.hwparams0);
>>>> +	/* MDWIDTH is represented in bits, we need it in bytes */
>>>> +	mdwidth >>= 3;
>>> mdwidth for DWC32 requires to read hwparams6 for the upper 2 significant
>>> bits. Can we add a check for DWC32 also? You can check how we're doing
>>> it now in the current code.
>>>
>> Sure.  I'll make sure to get the correct registers for the DWC32 case.
>>
>>>> +
>>>> +	fifo_size = mult * ((max_packet + mdwidth) / mdwidth) + 1;
>>>> +	return fifo_size;
>>>> +}
>>>> +
>>>> +void dwc3_gadget_clear_tx_fifos(struct dwc3 *dwc)
>>>> +{
>>>> +	struct dwc3_ep *dep;
>>>> +	int fifo_depth;
>>>> +	int size;
>>>> +	int num;
>>>> +
>>>> +	if (!dwc->needs_fifo_resize)
>>>> +		return;
>>>> +
>>>> +	/* Read ep0IN related TXFIFO size */
>>>> +	dep = dwc->eps[1];
>>>> +	size = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
>>>> +	if (DWC3_IP_IS(DWC31))
>>>> +		fifo_depth = DWC31_GTXFIFOSIZ_TXFDEP(size);
>>>> +	else
>>>> +		fifo_depth = DWC3_GTXFIFOSIZ_TXFDEP(size);
>>> The driver handles 3 IPs. Getting the fifo depth for DWC32 is the same
>>> as DWC31. So the condition should be
>>> if (DWC3_IP_IS(DWC3))
>>>        fifo_depth = ...
>>> else
>>>       fifo_depth = ...
>>>
>> Understood.
>>
>>>> +
>>>> +	dwc->last_fifo_depth = fifo_depth;
>>>> +	/* Clear existing TXFIFO for all IN eps except ep0 */
>>>> +	for (num = 3; num < min_t(int, dwc->num_eps, DWC3_ENDPOINTS_NUM);
>>>> +	     num += 2) {
>>>> +		dep = dwc->eps[num];
>>>> +		/* Don't change TXFRAMNUM on usb31 version */
>>>> +		size = DWC3_IP_IS(DWC31) ?
>>>> +			dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1)) &
>>>> +				   DWC31_GTXFIFOSIZ_TXFRAMNUM : 0;
>>>> +
>>> Same here. Check for DWC32.
>>>
>>>> +		dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(num >> 1), size);
>>>> +	}
>>>> +	dwc->num_ep_resized = 0;
>>>> +}
>>>> +
>>>> +/*
>>>> + * dwc3_gadget_resize_tx_fifos - reallocate fifo spaces for current use-case
>>>> + * @dwc: pointer to our context structure
>>>> + *
>>>> + * This function will a best effort FIFO allocation in order
>>>> + * to improve FIFO usage and throughput, while still allowing
>>>> + * us to enable as many endpoints as possible.
>>>> + *
>>>> + * Keep in mind that this operation will be highly dependent
>>>> + * on the configured size for RAM1 - which contains TxFifo -,
>>>> + * the amount of endpoints enabled on coreConsultant tool, and
>>>> + * the width of the Master Bus.
>>>> + *
>>>> + * In general, FIFO depths are represented with the following equation:
>>>> + *
>>>> + * fifo_size = mult * ((max_packet + mdwidth)/mdwidth + 1) + 1
>>>> + *
>>>> + * Conversions can be done to the equation to derive the number of packets that
>>>> + * will fit to a particular FIFO size value.
>>>> + */
>>>> +static int dwc3_gadget_resize_tx_fifos(struct dwc3_ep *dep)
>>>> +{
>>>> +	struct dwc3 *dwc = dep->dwc;
>>>> +	int fifo_0_start;
>>>> +	int ram1_depth;
>>>> +	int fifo_size;
>>>> +	int min_depth;
>>>> +	int num_in_ep;
>>>> +	int remaining;
>>>> +	int mult = 1;
>>>> +	int fifo;
>>>> +	int tmp;
>>>> +
>>>> +	if (!dwc->needs_fifo_resize)
>>>> +		return 0;
>>> Maybe add a condition to check for Enhanced SuperSpeed only?
>>>
>> Since this logic applies for isoc endpoints as well in high speed mode,
>> for high bandwidth use cases, we can't limit it to SS only.
> 
> Ok. I was asking because you use 1024 as MPS in your calculation.
> 
>>
>>>> +
>>>> +	/* resize IN endpoints except ep0 */
>>>> +	if (!usb_endpoint_dir_in(dep->endpoint.desc) || dep->number <= 1)
>>>> +		return 0;
>>>> +
>>>> +	ram1_depth = DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
>>>> +
>>>> +	if ((dep->endpoint.maxburst > 1 &&
>>>> +	     usb_endpoint_xfer_bulk(dep->endpoint.desc)) ||
>>>> +	    usb_endpoint_xfer_isoc(dep->endpoint.desc))
>>>> +		mult = 3;
>>>> +
>>>> +	if (dep->endpoint.maxburst > 6 &&
>>>> +	    usb_endpoint_xfer_bulk(dep->endpoint.desc) && DWC3_IP_IS(DWC31))
>>>> +		mult = 6;
>>> You checked maxburst > 1 for isoc, but not when maxburst > 6. Why?
>>> Also, "mult" is the term we usually use for isoc endpoints. Applying it
>>> to bulk is confusing here.
>>>
>> Ok, let me rename it to something else that makes more sense.  The isoc
>> endpoint check was targeted for mainly high-speed high bandwidth isoc
>> use cases, and I don't believe our results improved with a larger fifo
>> allocation, ie 6. (refer to below)
> 
> It should improve for isoc and reduce missed isoc error also. Most
> applications only use 1-16KB max per interval, so you don't see the
> impact as much.
> 
>>
>>> How did we decide on 3 and 6? Are they arbitrary?
>>>
>> So actually in the databook, they have some recommendations for TXFIFO
>> sizes to use in "Table 4-3 Device Config Parameters."  It mentions that
>> for burst capable endpoints to have a fifo size to fit at least 3
>> packets of maxpacket size.
>>
>> There's also "Chapter 3 Cache, FIFO RAMs, and Bandwidth Requirements,"
>> which goes over a lot of optimizations that could be done based off your
>> system's overall latency.  The sizes were chosen after we ran our peak
>> throughput and performance testing on our devices, and these values
>> netted the best throughput while also allowing enough fifo space for our
>> other USB endpoints. Also, there's going to be a limit on how much
>> improvement you see with respects to increasing the fifo size, since
>> your system will eventually be able to pull data out of the internal
>> fifo faster than it is being filled.
> 
> I added a patch a while back to check the max packet limit based on the
> recommended minimum Rx/TxFIFO size
> d94ea5319813 ("usb: dwc3: gadget: Properly set maxpacket limit")
> 
> The driver wouldn't match the endpoint if it doesn't meet the minimum
> requirement of 3 MPS if the device is operating in SuperSpeed or
> SuperSpeed Plus. Was the check for "3" necessary?
> 
Hi Thinh,

Please correct me if I'm wrong, but when a function driver requests for
an endpoint using usb_ep_autoconfig(), most of the time it passes in a
FS descriptor that doesn't have the wMaxPacketSize parameter set (0),
which means it will probably fetch the first unused endpoint. (at least
this is what I noticed for the BULK ep cases)

In this case, it would be hard to determine if the endpoint selected
would already have the constraint you added factored in.

> "6" is your tested value right? It may be different for different setup.
> Can we pass this as a setting parameter from the devicetree property?
> 
Definitely can agree to that.  We can make things a bit more flexible
depending on the system.  Maybe create a new property, and default it to
6 if "do_fifo_resize" is set, but this parameter is not defined.

Thanks
Wesley Cheng
>>>> +
>>>> +	/* FIFO size for a single buffer */
>>>> +	fifo = dwc3_gadget_calc_tx_fifo_size(dwc, 1);
>>>> +
>>>> +	/* Calculate the number of remaining EPs w/o any FIFO */
>>>> +	num_in_ep = dwc->max_cfg_eps;
>>>> +	num_in_ep -= dwc->num_ep_resized;
>>>> +
>>>> +	/* Reserve at least one FIFO for the number of IN EPs */
>>>> +	min_depth = num_in_ep * (fifo + 1);
>>>> +	remaining = ram1_depth - min_depth - dwc->last_fifo_depth;
>>> Can "remaining" be a negative value? If so, I think it's clearer if you do
>>> remaining = max_t(int, 0, remaining);
>>>
>> Sure.
>>
>>>> +
>>>> +	/*
>>>> +	 * We've already reserved 1 FIFO per EP, so check what we can fit in
>>>> +	 * addition to it.  If there is not enough remaining space, allocate
>>>> +	 * all the remaining space to the EP.
>>>> +	 */
>>>> +	fifo_size = (mult - 1) * fifo;
>>>> +	if (remaining < fifo_size) {
>>>> +		if (remaining > 0)
>>>> +			fifo_size = remaining;
>>>> +		else
>>>> +			fifo_size = 0;
>>> Then use this condition instead:
>>>
>>> if (remaining < fifo_size)
>>>        fifo_size = remaining;
>>>
>>>> +	}
>>>> +
>>>> +	fifo_size += fifo;
>>>> +	/* Last increment according to the TX FIFO size equation */
>>>> +	fifo_size++;
>>>> +
>>>> +	/* Check if TXFIFOs start at non-zero addr */
>>>> +	tmp = dwc3_readl(dwc->regs, DWC3_GTXFIFOSIZ(0));
>>>> +	fifo_0_start = DWC3_GTXFIFOSIZ_TXFSTADDR(tmp);
>>>> +
>>>> +	fifo_size |= (fifo_0_start + (dwc->last_fifo_depth << 16));
>>>> +	if (DWC3_IP_IS(DWC31))
>>>> +		dwc->last_fifo_depth += DWC31_GTXFIFOSIZ_TXFDEP(fifo_size);
>>>> +	else
>>>> +		dwc->last_fifo_depth += DWC3_GTXFIFOSIZ_TXFDEP(fifo_size);
>>> Take account of DWC32.
>>>
>> Got it.
>>>> +
>>>> +	/* Check fifo size allocation doesn't exceed available RAM size. */
>>>> +	if (dwc->last_fifo_depth >= ram1_depth) {
>>>> +		dev_err(dwc->dev, "Fifosize(%d) > RAM size(%d) %s depth:%d\n",
>>>> +			dwc->last_fifo_depth, ram1_depth,
>>>> +			dep->endpoint.name, fifo_size);
>>>> +		if (DWC3_IP_IS(DWC31))
>>>> +			fifo_size = DWC31_GTXFIFOSIZ_TXFDEP(fifo_size);
>>>> +		else
>>>> +			fifo_size = DWC3_GTXFIFOSIZ_TXFDEP(fifo_size);
>>> Same here.
>>>
>>>> +		dwc->last_fifo_depth -= fifo_size;
>>>> +		return -ENOMEM;
>>>> +	}
>>>> +
>>>> +	dwc3_writel(dwc->regs, DWC3_GTXFIFOSIZ(dep->number >> 1), fifo_size);
>>>> +	dwc->num_ep_resized++;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  /**
>>>>   * __dwc3_gadget_ep_enable - initializes a hw endpoint
>>>>   * @dep: endpoint to be initialized
>>>> @@ -632,6 +787,10 @@ static int __dwc3_gadget_ep_enable(struct dwc3_ep *dep, unsigned int action)
>>>>  	int			ret;
>>>>  
>>>>  	if (!(dep->flags & DWC3_EP_ENABLED)) {
>>>> +		ret = dwc3_gadget_resize_tx_fifos(dep);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>>  		ret = dwc3_gadget_start_config(dep);
>>>>  		if (ret)
>>>>  			return ret;
>>>> @@ -2418,6 +2577,7 @@ static int dwc3_gadget_stop(struct usb_gadget *g)
>>>>  
>>>>  	spin_lock_irqsave(&dwc->lock, flags);
>>>>  	dwc->gadget_driver	= NULL;
>>>> +	dwc->max_cfg_eps = 0;
>>>>  	spin_unlock_irqrestore(&dwc->lock, flags);
>>>>  
>>>>  	free_irq(dwc->irq_gadget, dwc->ev_buf);
>>>> @@ -2485,6 +2645,39 @@ static int dwc3_gadget_vbus_draw(struct usb_gadget *g, unsigned int mA)
>>>>  	return 0;
>>>>  }
>>>>  
>>>> +static int dwc3_gadget_check_config(struct usb_gadget *g, unsigned long ep_map)
>>> What's in ep_map? Can you document more to help with the review?
>>>
>> Yeah, I will add some more comments.  Just to explain here briefly, this
>> check config callback is to address the concern pointed out by Felipe
>> where we could run out of txfifo memory while our USB composition is
>> being enabled.  This would lead to an enumerated device, with
>> non-functioning endpoints.
>>
>> The check config will be called during the function driver bind stage
>> (before we enumerate), and ep_map carries the number of endpoints (both
>> in and out) being used in a particular configuration.  With this
>> information, the logic will ensure that there is enough txfifo space for
>> at least 1 fifo per endpoint.  If not, we can catch the failure at the
>> composition bind stages. (although it would be odd to see a DWC3
>> controller with not enough txfifo ram for 1 fifo per ep)  The point at
>> which we actually resize the fifo allocations, will always check to make
>> sure that there is enough fifo space for the remaining endpoints after
>> every resize.
>>
>> Thanks
>> Wesley Cheng
> 
> Thanks for the info. I'll review more after you add more detail.
> 
> BR,
> Thinh
> 
>>> Thanks,
>>> Thinh
>>>
>>>> +{
>>>> +	struct dwc3 *dwc = gadget_to_dwc(g);
>>>> +	unsigned long in_ep_map;
>>>> +	int fifo_size = 0;
>>>> +	int ram1_depth;
>>>> +	int ep_num;
>>>> +
>>>> +	if (!dwc->needs_fifo_resize)
>>>> +		return 0;
>>>> +
>>>> +	/* Only interested in the IN endpoints */
>>>> +	in_ep_map = ep_map >> 16;
>>>> +	ep_num = hweight_long(in_ep_map);
>>>> +
>>>> +	if (ep_num <= dwc->max_cfg_eps)
>>>> +		return 0;
>>>> +
>>>> +	/* Update the max number of eps in the composition */
>>>> +	dwc->max_cfg_eps = ep_num;
>>>> +
>>>> +	fifo_size = dwc3_gadget_calc_tx_fifo_size(dwc, dwc->max_cfg_eps);
>>>> +	/* Based on the equation, increment by one for every ep */
>>>> +	fifo_size += dwc->max_cfg_eps;
>>>> +
>>>> +	/* Check if we can fit a single fifo per endpoint */
>>>> +	ram1_depth = DWC3_RAM1_DEPTH(dwc->hwparams.hwparams7);
>>>> +	if (fifo_size > ram1_depth)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  static const struct usb_gadget_ops dwc3_gadget_ops = {
>>>>  	.get_frame		= dwc3_gadget_get_frame,
>>>>  	.wakeup			= dwc3_gadget_wakeup,
>>>> @@ -2495,6 +2688,7 @@ static const struct usb_gadget_ops dwc3_gadget_ops = {
>>>>  	.udc_set_speed		= dwc3_gadget_set_speed,
>>>>  	.get_config_params	= dwc3_gadget_config_params,
>>>>  	.vbus_draw		= dwc3_gadget_vbus_draw,
>>>> +	.check_config		= dwc3_gadget_check_config,
>>>>  };
>>>>  
>>>>  /* -------------------------------------------------------------------------- */
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
